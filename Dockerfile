FROM docker.io/node:0.10.48

WORKDIR /usr/src/app
RUN git clone https://github.com/CartoDB/CartoDB-SQL-API.git -b 1.10.1 .
RUN apt-get update && apt-get install -y socat && apt-get clean
COPY development.js /usr/src/app/config/environments/
RUN curl -sL https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz | tar xzv -C /
RUN npm install
COPY services.d/ /etc/services.d/

EXPOSE 8080
CMD /init
