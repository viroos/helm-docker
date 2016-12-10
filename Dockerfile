FROM google/cloud-sdk

MAINTAINER Maciej Sawicki <maciek@amplification.pl>

RUN apt-get -y clean && rm -rf /var/lib/apt/lists && mkdir -p /var/lib/apt/lists/partial && apt-get -y clean && apt-get -y update && apt-get -y install debian-keyring && apt-get -y update && apt-get -y install curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

RUN npm install -g yaml-cli

ENV VERSION v2.0.1
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz

WORKDIR /

ADD http://storage.googleapis.com/kubernetes-helm/${FILENAME} /tmp



RUN tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp
