Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5825C02192
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 11:30:37 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.93836.1726313427536496069
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 04:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q2P8Jyg5;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d86f713557so2073734a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726313426; x=1726918226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPZw1+a0kLh2ERnpgZnQrqmUxes5HIeXFGIhMyY623M=;
        b=Q2P8Jyg5LAQUeOlP/t6ixdoUmEQmEbZ14rQffA4u+riAjZEwUeNara1td0snnELUti
         tuXuR+4z7NueRoid9ex00vtpN1ayj3miI3C/5r+xg/JpKQRfFH7IzDOXNcBNns6Qk2hK
         FQvTyzsRAc/Jjv6gENTjJ3ovpZGeK8o6RTBec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726313426; x=1726918226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPZw1+a0kLh2ERnpgZnQrqmUxes5HIeXFGIhMyY623M=;
        b=ACRlj2rT0xhSRNtw7Ag2w0sgODT7JlyWIVojY9Hn35qu7J9V8ll9mcUv92DOc92RmE
         NdbFFHxVJfNET/NItq2+SzQlelJcWuOT5iqaMtVh2wVXu8c34fndWygvmbphZckEj604
         pCr5dPFC4FecJO6lDiVIxPMwuY2Ync02X63HpG8VW115SDlyTvLL94jrU5h+AOn8+yKl
         g9v5AwARDvWv9NiBtx0bvQLZ1BTJAbWQUvoCUNXE72N1KLiuHfwGDEYRLRdotZQn53ru
         4wYQG99Vw4ciAhSB1IvuXYOBHSKVG2CTUHvy7qNfdxswWPBf9s9ab1mFq8eMoYGzwicB
         QppA==
X-Gm-Message-State: AOJu0YyVb9JD0+t1epBL/ilXRbu6VVU4gq9pmschVGIAz34QKAGM1nJP
	Dje2WvZaOjE+ruIGQqh1lwV+lRXCU/rWZe/MmP07EPbvtiVZ55quYa9sNyl6ZVMEtHrwifmjBnE
	/1s0=
X-Google-Smtp-Source: AGHT+IFMAQLN47RzQ9kpMn5qtJGE7YlRvuTpvLkf0W4TiPRXGoiPsAIleY3ZYrOQaEPmtwXSwP1GYg==
X-Received: by 2002:a17:90b:1c82:b0:2d8:8d62:a0c with SMTP id 98e67ed59e1d1-2db9ffaf3ecmr9886869a91.3.1726313425532;
        Sat, 14 Sep 2024 04:30:25 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:70bf:fe7e:a7d5:797d:52a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfcbaecesm1283072a91.3.2024.09.14.04.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 04:30:24 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libpcap: Security fix for CVE-2023-7256 & CVE-2024-8006
Date: Sat, 14 Sep 2024 17:00:13 +0530
Message-Id: <20240914113013.95998-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 11:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204491

From: Vijay Anusuri <vanusuri@mvista.com>

Reference:
https://security-tracker.debian.org/tracker/CVE-2023-7256
https://security-tracker.debian.org/tracker/CVE-2024-8006

Upstream commits:
https://github.com/the-tcpdump-group/libpcap/commit/ba493d37d418b126d7357df553bd065cbc99384e
https://github.com/the-tcpdump-group/libpcap/commit/f72f48a26abdd2eb11a4a8fb3596ee67b8f8cbe6
https://github.com/the-tcpdump-group/libpcap/commit/c1ceab8f191031a81996035af20685e6f9b7f1b7
https://github.com/the-tcpdump-group/libpcap/commit/73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f
https://github.com/the-tcpdump-group/libpcap/commit/2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d
https://github.com/the-tcpdump-group/libpcap/commit/8a633ee5b9ecd9d38a587ac9b204e2380713b0d6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |  99 +++++
 .../libpcap/libpcap/CVE-2023-7256-pre2.patch  | 131 +++++++
 .../libpcap/libpcap/CVE-2023-7256-pre3.patch  |  67 ++++
 .../libpcap/libpcap/CVE-2023-7256-pre4.patch  |  37 ++
 .../libpcap/libpcap/CVE-2023-7256.patch       | 368 ++++++++++++++++++
 .../libpcap/libpcap/CVE-2024-8006.patch       |  42 ++
 .../libpcap/libpcap_1.10.1.bb                 |  10 +-
 7 files changed, 753 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre2.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre3.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre4.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
new file mode 100644
index 0000000000..6965034656
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
@@ -0,0 +1,99 @@
+From f72f48a26abdd2eb11a4a8fb3596ee67b8f8cbe6 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Wed, 21 Jul 2021 23:50:32 -0700
+Subject: [PATCH] rpcap: don't do pointless integer->string and then
+ string->integer conversions.
+
+The string->integer conversion was also broken, as it passed a pointer
+to a 16-bit integer to a sscanf() call that used %d rather than %hd.
+It'd overwrite 2 bytes past the 16-bit integer; it may set the integer
+"correctly" on a little-endian, but wouldn't even do *that* on a
+big-endian machine.
+
+(cherry picked from commit efaddfe8eae4dab252bb2d35e004a40e4b72db24)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/f72f48a26abdd2eb11a4a8fb3596ee67b8f8cbe6]
+CVE: CVE-2023-7256 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pcap-rpcap.c | 34 ++++++++++++++++++++++++----------
+ 1 file changed, 24 insertions(+), 10 deletions(-)
+
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 225b420904..f5c126dbc1 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -1060,7 +1060,7 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 	struct pcap_rpcap *pr = fp->priv;	/* structure used when doing a remote live capture */
+ 	char sendbuf[RPCAP_NETBUF_SIZE];	/* temporary buffer in which data to be sent is buffered */
+ 	int sendbufidx = 0;			/* index which keeps the number of bytes currently buffered */
+-	char portdata[PCAP_BUF_SIZE];		/* temp variable needed to keep the network port for the data connection */
++	uint16 portdata = 0;			/* temp variable needed to keep the network port for the data connection */
+ 	uint32 plen;
+ 	int active = 0;				/* '1' if we're in active mode */
+ 	struct activehosts *temp;		/* temp var needed to scan the host list chain, to detect if we're in active mode */
+@@ -1073,6 +1073,8 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 	struct sockaddr_storage saddr;		/* temp, needed to retrieve the network data port chosen on the local machine */
+ 	socklen_t saddrlen;			/* temp, needed to retrieve the network data port chosen on the local machine */
+ 	int ai_family;				/* temp, keeps the address family used by the control connection */
++	struct sockaddr_in *sin4;
++	struct sockaddr_in6 *sin6;
+ 
+ 	/* RPCAP-related variables*/
+ 	struct rpcap_header header;			/* header of the RPCAP packet */
+@@ -1171,11 +1173,22 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 			goto error_nodiscard;
+ 		}
+ 
+-		/* Get the local port the system picked up */
+-		if (getnameinfo((struct sockaddr *) &saddr, saddrlen, NULL,
+-			0, portdata, sizeof(portdata), NI_NUMERICSERV))
+-		{
+-			sock_geterror("getnameinfo()", fp->errbuf, PCAP_ERRBUF_SIZE);
++		switch (saddr.ss_family) {
++
++		case AF_INET:
++			sin4 = (struct sockaddr_in *)&saddr;
++			portdata = sin4->sin_port;
++			break;
++
++		case AF_INET6:
++			sin6 = (struct sockaddr_in6 *)&saddr;
++			portdata = sin6->sin6_port;
++			break;
++
++		default:
++			snprintf(fp->errbuf, PCAP_ERRBUF_SIZE,
++			    "Local address has unknown address family %u",
++			    saddr.ss_family);
+ 			goto error_nodiscard;
+ 		}
+ 	}
+@@ -1208,8 +1221,7 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 	/* portdata on the openreq is meaningful only if we're in active mode */
+ 	if ((active) || (pr->rmt_flags & PCAP_OPENFLAG_DATATX_UDP))
+ 	{
+-		sscanf(portdata, "%d", (int *)&(startcapreq->portdata));	/* cast to avoid a compiler warning */
+-		startcapreq->portdata = htons(startcapreq->portdata);
++		startcapreq->portdata = portdata;
+ 	}
+ 
+ 	startcapreq->snaplen = htonl(fp->snapshot);
+@@ -1258,13 +1270,15 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 	{
+ 		if (!active)
+ 		{
++			char portstring[PCAP_BUF_SIZE];
++
+ 			memset(&hints, 0, sizeof(struct addrinfo));
+ 			hints.ai_family = ai_family;		/* Use the same address family of the control socket */
+ 			hints.ai_socktype = (pr->rmt_flags & PCAP_OPENFLAG_DATATX_UDP) ? SOCK_DGRAM : SOCK_STREAM;
+-			snprintf(portdata, PCAP_BUF_SIZE, "%d", ntohs(startcapreply.portdata));
++			snprintf(portstring, PCAP_BUF_SIZE, "%d", ntohs(startcapreply.portdata));
+ 
+ 			/* Let's the server pick up a free network port for us */
+-			if (sock_initaddress(host, portdata, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
++			if (sock_initaddress(host, portstring, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
+ 				goto error;
+ 
+ 			if ((sockdata = sock_open(addrinfo, SOCKOPEN_CLIENT, 0, fp->errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre2.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre2.patch
new file mode 100644
index 0000000000..618480f10e
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre2.patch
@@ -0,0 +1,131 @@
+From ba493d37d418b126d7357df553bd065cbc99384e Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Sun, 31 Jul 2022 11:30:43 -0700
+Subject: [PATCH] rpcap: improve error messages for host and port resolution
+ errors.
+
+If we don't want a particular port nuber in a sock_initaddress() call,
+pass NULL rather than "0".  If the service name parameter passsed to
+sock_initaddress() is NULL, pass "0" as the service name parameter to
+getaddrinfo().
+
+Have get_gai_errstring() precede the host/port name information with an
+indication as to whethe it's a host name, port name, or host name and
+port name.  Don't say "host name" for EAI_NONAME; rely on the
+description get_gai_errstring() provides.  If there's only a port
+number, don't preceded it with ":" in get_gai_errstring().
+
+This makes the error message reported if a host and port are provided
+not say that the host name couldn't be resolved, because it could be a
+problem with the port name (sadly, getaddinfo() doesn't indicate which
+is the one with the problem).
+
+It also makes the error message reported if only a port is provided not
+say that it's a problem with the host name or show the "host name" as
+":<port>".
+
+(cherry picked from commit 33cf6fb70a13a982d70f6a5e5e63aa765073c8e8)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/ba493d37d418b126d7357df553bd065cbc99384e]
+CVE: CVE-2023-7256 #Dependency Patch2
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pcap-rpcap.c    |  6 +++---
+ rpcapd/daemon.c |  4 ++--
+ sockutils.c     | 19 ++++++++++++++-----
+ 3 files changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 889ade32f6..b68af65d52 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -1020,7 +1020,7 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
+ 	hints.ai_family = PF_UNSPEC;
+ 	hints.ai_socktype = SOCK_STREAM;
+ 
+-	retval = sock_initaddress(host, "0", &hints, &addrinfo, errbuf,
++	retval = sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
+ 	    PCAP_ERRBUF_SIZE);
+ 	if (retval != 0)
+ 	{
+@@ -1172,7 +1172,7 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 		hints.ai_flags = AI_PASSIVE;	/* Data connection is opened by the server toward the client */
+ 
+ 		/* Let's the server pick up a free network port for us */
+-		if (sock_initaddress(NULL, "0", &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
++		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
+ 			goto error_nodiscard;
+ 
+ 		if ((sockdata = sock_open(addrinfo, SOCKOPEN_SERVER,
+@@ -3024,7 +3024,7 @@ int pcap_remoteact_close(const char *host, char *errbuf)
+ 	hints.ai_family = PF_UNSPEC;
+ 	hints.ai_socktype = SOCK_STREAM;
+ 
+-	retval = sock_initaddress(host, "0", &hints, &addrinfo, errbuf,
++	retval = sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
+ 	    PCAP_ERRBUF_SIZE);
+ 	if (retval != 0)
+ 	{
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 362f4b9bb0..4b91a43242 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2085,8 +2085,8 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
+ 	{
+ 		hints.ai_flags = AI_PASSIVE;
+ 
+-		// Let's the server socket pick up a free network port for us
+-		if (sock_initaddress(NULL, "0", &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
++		// Make the server socket pick up a free network port for us
++		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
+ 			goto error;
+ 
+ 		if ((session->sockdata = sock_open(addrinfo, SOCKOPEN_SERVER, 1 /* max 1 connection in queue */, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+diff --git a/sockutils.c b/sockutils.c
+index a34f0d1738..ca5b683720 100644
+--- a/sockutils.c
++++ b/sockutils.c
+@@ -548,13 +548,13 @@ get_gai_errstring(char *errbuf, int errbuflen, const char *prefix, int err,
+ 	char hostport[PCAP_ERRBUF_SIZE];
+ 
+ 	if (hostname != NULL && portname != NULL)
+-		snprintf(hostport, PCAP_ERRBUF_SIZE, "%s:%s",
++		snprintf(hostport, PCAP_ERRBUF_SIZE, "host and port %s:%s",
+ 		    hostname, portname);
+ 	else if (hostname != NULL)
+-		snprintf(hostport, PCAP_ERRBUF_SIZE, "%s",
++		snprintf(hostport, PCAP_ERRBUF_SIZE, "host %s",
+ 		    hostname);
+ 	else if (portname != NULL)
+-		snprintf(hostport, PCAP_ERRBUF_SIZE, ":%s",
++		snprintf(hostport, PCAP_ERRBUF_SIZE, "port %s",
+ 		    portname);
+ 	else
+ 		snprintf(hostport, PCAP_ERRBUF_SIZE, "<no host or port!>");
+@@ -618,7 +618,7 @@ get_gai_errstring(char *errbuf, int errbuflen, const char *prefix, int err,
+ 
+ 		case EAI_NONAME:
+ 			snprintf(errbuf, errbuflen,
+-			    "%sThe host name %s couldn't be resolved",
++			    "%sThe %s couldn't be resolved",
+ 			    prefix, hostport);
+ 			break;
+ 
+@@ -720,7 +720,16 @@ int sock_initaddress(const char *host, const char *port,
+ {
+ 	int retval;
+ 
+-	retval = getaddrinfo(host, port, hints, addrinfo);
++	/*
++	 * We allow both the host and port to be null, but getaddrinfo()
++	 * is not guaranteed to do so; to handle that, if port is null,
++	 * we provide "0" as the port number.
++	 *
++	 * This results in better error messages from get_gai_errstring(),
++	 * as those messages won't talk about a problem with the port if
++	 * no port was specified.
++	 */
++	retval = getaddrinfo(host, port == NULL ? "0" : port, hints, addrinfo);
+ 	if (retval != 0)
+ 	{
+ 		if (errbuf)
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre3.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre3.patch
new file mode 100644
index 0000000000..12d42fb252
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre3.patch
@@ -0,0 +1,67 @@
+From c1ceab8f191031a81996035af20685e6f9b7f1b7 Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Sun, 31 Jul 2022 11:54:22 -0700
+Subject: [PATCH] rpcap: try to distringuish between host and port errors.
+
+getaddrinfo() won't do it for us, so do it ourselves.
+
+(cherry picked from commit a83992a1bec91661b2f0e1a6fc910343793a97f1)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/c1ceab8f191031a81996035af20685e6f9b7f1b7]
+CVE: CVE-2023-7256 #Dependency Patch3
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ sockutils.c | 40 ++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 38 insertions(+), 2 deletions(-)
+
+diff --git a/sockutils.c b/sockutils.c
+index ca5b683720..84024ac67d 100644
+--- a/sockutils.c
++++ b/sockutils.c
+@@ -734,8 +734,44 @@ int sock_initaddress(const char *host, const char *port,
+ 	{
+ 		if (errbuf)
+ 		{
+-			get_gai_errstring(errbuf, errbuflen, "", retval,
+-			    host, port);
++			if (host != NULL && port != NULL) {
++				/*
++				 * Try with just a host, to distinguish
++				 * between "host is bad" and "port is
++				 * bad".
++				 */
++				int try_retval;
++
++				try_retval = getaddrinfo(host, NULL, hints,
++				    addrinfo);
++				if (try_retval == 0) {
++					/*
++					 * Worked with just the host,
++					 * so assume the problem is
++					 * with the port.
++					 *
++					 * Free up the addres info first.
++					 */
++					freeaddrinfo(*addrinfo);
++					get_gai_errstring(errbuf, errbuflen,
++					    "", retval, NULL, port);
++				} else {
++					/*
++					 * Didn't work with just the host,
++					 * so assume the problem is
++					 * with the host.
++					 */
++					get_gai_errstring(errbuf, errbuflen,
++					    "", retval, host, NULL);
++				}
++			} else {
++				/*
++				 * Either the host or port was null, so
++				 * there's nothing to determine.
++				 */
++				get_gai_errstring(errbuf, errbuflen, "",
++				    retval, host, port);
++			}
+ 		}
+ 		return -1;
+ 	}
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre4.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre4.patch
new file mode 100644
index 0000000000..dcf203f754
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre4.patch
@@ -0,0 +1,37 @@
+From 73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f Mon Sep 17 00:00:00 2001
+From: Rose <83477269+AtariDreams@users.noreply.github.com>
+Date: Tue, 16 May 2023 12:37:11 -0400
+Subject: [PATCH] Remove unused variable retval in sock_present2network
+
+This quiets the compiler since it is not even returned anyway, and is a misleading variable name.
+
+(cherry picked from commit c7b90298984c46d820d3cee79a96d24870b5f200)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f]
+CVE: CVE-2023-7256 #Dependency Patch4
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ sockutils.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/sockutils.c b/sockutils.c
+index 1c07f76fd1..6752f296af 100644
+--- a/sockutils.c
++++ b/sockutils.c
+@@ -2082,7 +2082,6 @@ int sock_getascii_addrport(const struct sockaddr_storage *sockaddr, char *addres
+  */
+ int sock_present2network(const char *address, struct sockaddr_storage *sockaddr, int addr_family, char *errbuf, int errbuflen)
+ {
+-	int retval;
+ 	struct addrinfo *addrinfo;
+ 	struct addrinfo hints;
+ 
+@@ -2090,7 +2089,7 @@ int sock_present2network(const char *address, struct sockaddr_storage *sockaddr,
+ 
+ 	hints.ai_family = addr_family;
+ 
+-	if ((retval = sock_initaddress(address, "22222" /* fake port */, &hints, &addrinfo, errbuf, errbuflen)) == -1)
++	if (sock_initaddress(address, "22222" /* fake port */, &hints, &addrinfo, errbuf, errbuflen) == -1)
+ 		return 0;
+ 
+ 	if (addrinfo->ai_family == PF_INET)
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
new file mode 100644
index 0000000000..2b6c6476a9
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
@@ -0,0 +1,368 @@
+From 2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d Mon Sep 17 00:00:00 2001
+From: Guy Harris <gharris@sonic.net>
+Date: Thu, 28 Sep 2023 00:37:57 -0700
+Subject: [PATCH] Have sock_initaddress() return the list of addrinfo
+ structures or NULL.
+
+Its return address is currently 0 for success and -1 for failure, with a
+pointer to the first element of the list of struct addrinfos returned
+through a pointer on success; change it to return that pointer on
+success and NULL on failure.
+
+That way, we don't have to worry about what happens to the pointer
+pointeed to by the argument in question on failure; we know that we got
+NULL back if no struct addrinfos were found because getaddrinfo()
+failed.  Thus, we know that we have something to free iff
+sock_initaddress() returned a pointer to that something rather than
+returning NULL.
+
+This avoids a double-free in some cases.
+
+This is apparently CVE-2023-40400.
+
+(backported from commit 262e4f34979872d822ccedf9f318ed89c4d31c03)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d]
+CVE: CVE-2023-7256
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pcap-rpcap.c    | 48 ++++++++++++++++++++--------------------
+ rpcapd/daemon.c |  8 +++++--
+ rpcapd/rpcapd.c |  8 +++++--
+ sockutils.c     | 58 ++++++++++++++++++++++++++++---------------------
+ sockutils.h     |  5 ++---
+ 5 files changed, 72 insertions(+), 55 deletions(-)
+
+diff --git a/pcap-rpcap.c b/pcap-rpcap.c
+index 91f8557..733077b 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -995,7 +995,6 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
+ {
+ 	struct activehosts *temp;			/* temp var needed to scan the host list chain */
+ 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to translate between hostname to its address */
+-	int retval;
+ 
+ 	/* retrieve the network address corresponding to 'host' */
+ 	addrinfo = NULL;
+@@ -1003,9 +1002,9 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
+ 	hints.ai_family = PF_UNSPEC;
+ 	hints.ai_socktype = SOCK_STREAM;
+ 
+-	retval = sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
++	addrinfo = sock_initaddress(host, NULL, &hints, errbuf,
+ 	    PCAP_ERRBUF_SIZE);
+-	if (retval != 0)
++	if (addrinfo == NULL)
+ 	{
+ 		*error = 1;
+ 		return NULL;
+@@ -1153,7 +1152,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 		hints.ai_flags = AI_PASSIVE;	/* Data connection is opened by the server toward the client */
+ 
+ 		/* Let's the server pick up a free network port for us */
+-		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress(NULL, NULL, &hints, fp->errbuf,
++		    PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 			goto error_nodiscard;
+ 
+ 		if ((sockdata = sock_open(addrinfo, SOCKOPEN_SERVER,
+@@ -1277,7 +1278,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 			snprintf(portstring, PCAP_BUF_SIZE, "%d", ntohs(startcapreply.portdata));
+ 
+ 			/* Let's the server pick up a free network port for us */
+-			if (sock_initaddress(host, portstring, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
++			addrinfo = sock_initaddress(host, portstring, &hints,
++			    fp->errbuf, PCAP_ERRBUF_SIZE);
++			if (addrinfo == NULL)
+ 				goto error;
+ 
+ 			if ((sockdata = sock_open(addrinfo, SOCKOPEN_CLIENT, 0, fp->errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+@@ -2220,16 +2223,16 @@ rpcap_setup_session(const char *source, struct pcap_rmtauth *auth,
+ 		if (port[0] == 0)
+ 		{
+ 			/* the user chose not to specify the port */
+-			if (sock_initaddress(host, RPCAP_DEFAULT_NETPORT,
+-			    &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
+-				return -1;
++			addrinfo = sock_initaddress(host, RPCAP_DEFAULT_NETPORT,
++			    &hints, errbuf, PCAP_ERRBUF_SIZE);
+ 		}
+ 		else
+ 		{
+-			if (sock_initaddress(host, port, &hints, &addrinfo,
+-			    errbuf, PCAP_ERRBUF_SIZE) == -1)
+-				return -1;
++			addrinfo = sock_initaddress(host, port, &hints,
++			    errbuf, PCAP_ERRBUF_SIZE);
+ 		}
++		if (addrinfo == NULL)
++			return -1;
+ 
+ 		if ((*sockctrlp = sock_open(addrinfo, SOCKOPEN_CLIENT, 0,
+ 		    errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+@@ -2825,19 +2828,19 @@ SOCKET pcap_remoteact_accept_ex(const char *address, const char *port, const cha
+ 	/* Do the work */
+ 	if ((port == NULL) || (port[0] == 0))
+ 	{
+-		if (sock_initaddress(address, RPCAP_DEFAULT_NETPORT_ACTIVE, &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
+-		{
+-			return (SOCKET)-2;
+-		}
++		addrinfo = sock_initaddress(address,
++		    RPCAP_DEFAULT_NETPORT_ACTIVE, &hints, errbuf,
++		    PCAP_ERRBUF_SIZE);
+ 	}
+ 	else
+ 	{
+-		if (sock_initaddress(address, port, &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
+-		{
+-			return (SOCKET)-2;
+-		}
++		addrinfo = sock_initaddress(address, port, &hints, errbuf,
++		    PCAP_ERRBUF_SIZE);
++	}
++	if (addrinfo == NULL)
++	{
++		return (SOCKET)-2;
+ 	}
+-
+ 
+ 	if ((sockmain = sock_open(addrinfo, SOCKOPEN_SERVER, 1, errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+ 	{
+@@ -2994,7 +2997,6 @@ int pcap_remoteact_close(const char *host, char *errbuf)
+ {
+ 	struct activehosts *temp, *prev;	/* temp var needed to scan the host list chain */
+ 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to translate between hostname to its address */
+-	int retval;
+ 
+ 	temp = activeHosts;
+ 	prev = NULL;
+@@ -3005,9 +3007,9 @@ int pcap_remoteact_close(const char *host, char *errbuf)
+ 	hints.ai_family = PF_UNSPEC;
+ 	hints.ai_socktype = SOCK_STREAM;
+ 
+-	retval = sock_initaddress(host, NULL, &hints, &addrinfo, errbuf,
++	addrinfo = sock_initaddress(host, NULL, &hints, errbuf,
+ 	    PCAP_ERRBUF_SIZE);
+-	if (retval != 0)
++	if (addrinfo == NULL)
+ 	{
+ 		return -1;
+ 	}
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 8f50899..925d381 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2065,7 +2065,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
+ 			goto error;
+ 		}
+ 
+-		if (sock_initaddress(peerhost, portdata, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress(peerhost, portdata, &hints,
++		    errmsgbuf, PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 			goto error;
+ 
+ 		if ((session->sockdata = sock_open(addrinfo, SOCKOPEN_CLIENT, 0, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+@@ -2076,7 +2078,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
+ 		hints.ai_flags = AI_PASSIVE;
+ 
+ 		// Make the server socket pick up a free network port for us
+-		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress(NULL, NULL, &hints, errmsgbuf,
++		    PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 			goto error;
+ 
+ 		if ((session->sockdata = sock_open(addrinfo, SOCKOPEN_SERVER, 1 /* max 1 connection in queue */, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+diff --git a/rpcapd/rpcapd.c b/rpcapd/rpcapd.c
+index b91a401..74c138b 100644
+--- a/rpcapd/rpcapd.c
++++ b/rpcapd/rpcapd.c
+@@ -610,7 +610,9 @@ void main_startup(void)
+ 		//
+ 		// Get a list of sockets on which to listen.
+ 		//
+-		if (sock_initaddress((address[0]) ? address : NULL, port, &mainhints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress((address[0]) ? address : NULL,
++		    port, &mainhints, errbuf, PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 		{
+ 			rpcapd_log(LOGPRIO_DEBUG, "%s", errbuf);
+ 			return;
+@@ -1347,7 +1349,9 @@ main_active(void *ptr)
+ 	memset(errbuf, 0, sizeof(errbuf));
+ 
+ 	// Do the work
+-	if (sock_initaddress(activepars->address, activepars->port, &hints, &addrinfo, errbuf, PCAP_ERRBUF_SIZE) == -1)
++	addrinfo = sock_initaddress(activepars->address, activepars->port,
++	    &hints, errbuf, PCAP_ERRBUF_SIZE);
++	if (addrinfo == NULL)
+ 	{
+ 		rpcapd_log(LOGPRIO_DEBUG, "%s", errbuf);
+ 		return 0;
+diff --git a/sockutils.c b/sockutils.c
+index 0b0bcee..4d02d96 100644
+--- a/sockutils.c
++++ b/sockutils.c
+@@ -704,20 +704,21 @@ get_gai_errstring(char *errbuf, int errbuflen, const char *prefix, int err,
+  * \param errbuflen: length of the buffer that will contains the error. The error message cannot be
+  * larger than 'errbuflen - 1' because the last char is reserved for the string terminator.
+  *
+- * \return '0' if everything is fine, '-1' if some errors occurred. The error message is returned
+- * in the 'errbuf' variable. The addrinfo variable that has to be used in the following sockets calls is
+- * returned into the addrinfo parameter.
++ * \return a pointer to the first element in a list of addrinfo structures
++ * if everything is fine, NULL if some errors occurred. The error message
++ * is returned in the 'errbuf' variable.
+  *
+- * \warning The 'addrinfo' variable has to be deleted by the programmer by calling freeaddrinfo() when
+- * it is no longer needed.
++ * \warning The list of addrinfo structures returned has to be deleted by
++ * the programmer by calling freeaddrinfo() when it is no longer needed.
+  *
+  * \warning This function requires the 'hints' variable as parameter. The semantic of this variable is the same
+  * of the one of the corresponding variable used into the standard getaddrinfo() socket function. We suggest
+  * the programmer to look at that function in order to set the 'hints' variable appropriately.
+  */
+-int sock_initaddress(const char *host, const char *port,
+-    struct addrinfo *hints, struct addrinfo **addrinfo, char *errbuf, int errbuflen)
++struct addrinfo *sock_initaddress(const char *host, const char *port,
++    struct addrinfo *hints, char *errbuf, int errbuflen)
+ {
++	struct addrinfo *addrinfo;
+ 	int retval;
+ 
+ 	/*
+@@ -729,9 +730,13 @@ int sock_initaddress(const char *host, const char *port,
+ 	 * as those messages won't talk about a problem with the port if
+ 	 * no port was specified.
+ 	 */
+-	retval = getaddrinfo(host, port == NULL ? "0" : port, hints, addrinfo);
++	retval = getaddrinfo(host, port == NULL ? "0" : port, hints, &addrinfo);
+ 	if (retval != 0)
+ 	{
++		/*
++		 * That call failed.
++		 * Determine whether the problem is that the host is bad.
++		 */
+ 		if (errbuf)
+ 		{
+ 			if (host != NULL && port != NULL) {
+@@ -743,7 +748,7 @@ int sock_initaddress(const char *host, const char *port,
+ 				int try_retval;
+ 
+ 				try_retval = getaddrinfo(host, NULL, hints,
+-				    addrinfo);
++				    &addrinfo);
+ 				if (try_retval == 0) {
+ 					/*
+ 					 * Worked with just the host,
+@@ -752,14 +757,16 @@ int sock_initaddress(const char *host, const char *port,
+ 					 *
+ 					 * Free up the addres info first.
+ 					 */
+-					freeaddrinfo(*addrinfo);
++					freeaddrinfo(addrinfo);
+ 					get_gai_errstring(errbuf, errbuflen,
+ 					    "", retval, NULL, port);
+ 				} else {
+ 					/*
+ 					 * Didn't work with just the host,
+ 					 * so assume the problem is
+-					 * with the host.
++					 * with the host; we assume
++					 * the original error indicates
++					 * the underlying problem.
+ 					 */
+ 					get_gai_errstring(errbuf, errbuflen,
+ 					    "", retval, host, NULL);
+@@ -767,13 +774,14 @@ int sock_initaddress(const char *host, const char *port,
+ 			} else {
+ 				/*
+ 				 * Either the host or port was null, so
+-				 * there's nothing to determine.
++				 * there's nothing to determine; report
++				 * the error from the original call.
+ 				 */
+ 				get_gai_errstring(errbuf, errbuflen, "",
+ 				    retval, host, port);
+ 			}
+ 		}
+-		return -1;
++		return NULL;
+ 	}
+ 	/*
+ 	 * \warning SOCKET: I should check all the accept() in order to bind to all addresses in case
+@@ -788,30 +796,28 @@ int sock_initaddress(const char *host, const char *port,
+ 	 * ignore all addresses that are neither?  (What, no IPX
+ 	 * support? :-))
+ 	 */
+-	if (((*addrinfo)->ai_family != PF_INET) &&
+-	    ((*addrinfo)->ai_family != PF_INET6))
++	if ((addrinfo->ai_family != PF_INET) &&
++	    (addrinfo->ai_family != PF_INET6))
+ 	{
+ 		if (errbuf)
+ 			snprintf(errbuf, errbuflen, "getaddrinfo(): socket type not supported");
+-		freeaddrinfo(*addrinfo);
+-		*addrinfo = NULL;
+-		return -1;
++		freeaddrinfo(addrinfo);
++		return NULL;
+ 	}
+ 
+ 	/*
+ 	 * You can't do multicast (or broadcast) TCP.
+ 	 */
+-	if (((*addrinfo)->ai_socktype == SOCK_STREAM) &&
+-	    (sock_ismcastaddr((*addrinfo)->ai_addr) == 0))
++	if ((addrinfo->ai_socktype == SOCK_STREAM) &&
++	    (sock_ismcastaddr(addrinfo->ai_addr) == 0))
+ 	{
+ 		if (errbuf)
+ 			snprintf(errbuf, errbuflen, "getaddrinfo(): multicast addresses are not valid when using TCP streams");
+-		freeaddrinfo(*addrinfo);
+-		*addrinfo = NULL;
+-		return -1;
++		freeaddrinfo(addrinfo);
++		return NULL;
+ 	}
+ 
+-	return 0;
++	return addrinfo;
+ }
+ 
+ /*
+@@ -1720,7 +1726,9 @@ int sock_present2network(const char *address, struct sockaddr_storage *sockaddr,
+ 
+ 	hints.ai_family = addr_family;
+ 
+-	if (sock_initaddress(address, "22222" /* fake port */, &hints, &addrinfo, errbuf, errbuflen) == -1)
++	addrinfo = sock_initaddress(address, "22222" /* fake port */, &hints,
++	    errbuf, errbuflen);
++	if (addrinfo == NULL)
+ 		return 0;
+ 
+ 	if (addrinfo->ai_family == PF_INET)
+diff --git a/sockutils.h b/sockutils.h
+index e748662..ede86a1 100644
+--- a/sockutils.h
++++ b/sockutils.h
+@@ -129,9 +129,8 @@ int sock_init(char *errbuf, int errbuflen);
+ void sock_cleanup(void);
+ void sock_fmterror(const char *caller, int errcode, char *errbuf, int errbuflen);
+ void sock_geterror(const char *caller, char *errbuf, int errbufsize);
+-int sock_initaddress(const char *address, const char *port,
+-    struct addrinfo *hints, struct addrinfo **addrinfo,
+-    char *errbuf, int errbuflen);
++struct addrinfo *sock_initaddress(const char *address, const char *port,
++    struct addrinfo *hints, char *errbuf, int errbuflen);
+ int sock_recv(SOCKET sock, SSL *, void *buffer, size_t size, int receiveall,
+     char *errbuf, int errbuflen);
+ int sock_recv_dgram(SOCKET sock, SSL *, void *buffer, size_t size,
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
new file mode 100644
index 0000000000..987d6d51b3
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
@@ -0,0 +1,42 @@
+From 8a633ee5b9ecd9d38a587ac9b204e2380713b0d6 Mon Sep 17 00:00:00 2001
+From: Nicolas Badoux <n.badoux@hotmail.com>
+Date: Mon, 19 Aug 2024 12:31:53 +0200
+Subject: [PATCH] makes pcap_findalldevs_ex errors out if the directory does
+ not exist
+
+(backported from commit 0f8a103469ce87d2b8d68c5130a46ddb7fb5eb29)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/8a633ee5b9ecd9d38a587ac9b204e2380713b0d6]
+CVE: CVE-2024-8006
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pcap-new.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pcap-new.c b/pcap-new.c
+index 7c00659..ac88065 100644
+--- a/pcap-new.c
++++ b/pcap-new.c
+@@ -231,13 +231,18 @@ int pcap_findalldevs_ex(const char *source, struct pcap_rmtauth *auth, pcap_if_t
+ #else
+ 		/* opening the folder */
+ 		unixdir= opendir(path);
++		if (unixdir == NULL) {
++			snprintf(errbuf, PCAP_ERRBUF_SIZE,
++			    "Error when listing files: does folder '%s' exist?", path);
++			return -1;
++		}
+ 
+ 		/* get the first file into it */
+ 		filedata= readdir(unixdir);
+ 
+ 		if (filedata == NULL)
+ 		{
+-			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does folder '%s' exist?", path);
++			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does folder '%s' contain files?", path);
+ 			return -1;
+ 		}
+ #endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
index dbe2fd8157..584e98c76d 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
@@ -10,7 +10,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
+           file://CVE-2023-7256-pre1.patch \
+           file://CVE-2023-7256-pre2.patch \
+           file://CVE-2023-7256-pre3.patch \
+           file://CVE-2023-7256-pre4.patch \
+           file://CVE-2023-7256.patch \
+           file://CVE-2024-8006.patch \
+          "
+
 SRC_URI[sha256sum] = "ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4"
 
 inherit autotools binconfig-disabled pkgconfig
-- 
2.25.1


