Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B8ACCD19F
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 11:10:07 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.12560.1726657801976238580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 04:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DC3uEreV;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-206aee40676so42233685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1726657801; x=1727262601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P42QRb/S9uYur5oBs5EeoOp/BDeyPIgiRBL1NEsmeD8=;
        b=DC3uEreVCceuS/hW93LLwf1X+YBjByZVc7rhlCVu69wluGtefKqQuxsL5lXBD8H4+r
         bBb60uR87MaWJG0s49SceyxXWEgODoX3MjdV3DRzpms9+U3xh7H1CiloQpBjrv2F2Kg1
         qSKa96ia79VLRrXMHbkxJK3ENZCnk2VP5meRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726657801; x=1727262601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P42QRb/S9uYur5oBs5EeoOp/BDeyPIgiRBL1NEsmeD8=;
        b=jGuRiFbiRy8VyXEys9Ow7p7BW7nm+X/OrLAED+46Z1CAehWPD6iud16Lsbt9/MOIdt
         ZQ2/dLu61/vQJn7p8DptqEENsWEUDUyrMIkbbYX2u7ipg9VKeDghrGgD0+vUBq8mIyEA
         HJh+acLH2ZbVyf/oyDandMZ0SJT875mkw2Qr/6LW4EjzserkJ4v0eexhhWnyqCjxb8/c
         uQHP6dnFf29rjz76zfNTkJYNModuYTh9ZtmvhdXpe4OX0oQFoIhbuJ+32yTXSgONniv0
         Zt2k6Ejwo7ugC7M3Y58kEZXSqQvFmJMDUFgOsZ9vY7dZDYzltAUM0NFbK4UGjcuBonPj
         w1jg==
X-Gm-Message-State: AOJu0YwXZhWqqc7jdEsdc2yIIvmZktCckpSphQkDqIndW4BptAVOU0HY
	kfCK4s11BuUjbzb1AcFMCM7OexDZyHJCRiw/SOAHtgihP69tcAKL10/jE8G8ShZr+7YRpIGpnTR
	x+NI=
X-Google-Smtp-Source: AGHT+IFxT4kPUrRs64qNs99HRMfvvEqhRdKm4LSLxDvVxO/ABLwMseJfernNJiJb+6wcOyAUZdU3ng==
X-Received: by 2002:a17:903:444c:b0:206:8c18:a538 with SMTP id d9443c01a7336-20782a69a99mr222326955ad.32.1726657800429;
        Wed, 18 Sep 2024 04:10:00 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882f:fd8b:c91a:920e:d914:a76d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946032b9sm63462835ad.116.2024.09.18.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 04:09:59 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libpcap: Security fix for CVE-2023-7256 & CVE-2024-8006
Date: Wed, 18 Sep 2024 16:39:49 +0530
Message-Id: <20240918110949.1277062-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 11:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204640

From: Vijay Anusuri <vanusuri@mvista.com>

Reference:
https://security-tracker.debian.org/tracker/CVE-2023-7256
https://security-tracker.debian.org/tracker/CVE-2024-8006

Upstream commits:
https://github.com/the-tcpdump-group/libpcap/commit/73da0d4d65ef0925772b7b7f82a5fbb3ff2c5e4f
https://github.com/the-tcpdump-group/libpcap/commit/2aa69b04d8173b18a0e3492e0c8f2f7fabdf642d
https://github.com/the-tcpdump-group/libpcap/commit/8a633ee5b9ecd9d38a587ac9b204e2380713b0d6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libpcap/libpcap/CVE-2023-7256-pre1.patch  |  37 ++
 .../libpcap/libpcap/CVE-2023-7256.patch       | 365 ++++++++++++++++++
 .../libpcap/libpcap/CVE-2024-8006.patch       |  42 ++
 .../libpcap/libpcap_1.10.4.bb                 |   7 +-
 4 files changed, 450 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
new file mode 100644
index 0000000000..64abfb85cd
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256-pre1.patch
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
+CVE: CVE-2023-7256 #Dependency Patch
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
index 0000000000..fffcb2704a
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/CVE-2023-7256.patch
@@ -0,0 +1,365 @@
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
+index ef0cd6e49c..f1992e4aea 100644
+--- a/pcap-rpcap.c
++++ b/pcap-rpcap.c
+@@ -1024,7 +1024,6 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
+ {
+ 	struct activehosts *temp;			/* temp var needed to scan the host list chain */
+ 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to translate between hostname to its address */
+-	int retval;
+ 
+ 	/* retrieve the network address corresponding to 'host' */
+ 	addrinfo = NULL;
+@@ -1032,9 +1031,9 @@ rpcap_remoteact_getsock(const char *host, int *error, char *errbuf)
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
+@@ -1186,7 +1185,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 		hints.ai_flags = AI_PASSIVE;	/* Data connection is opened by the server toward the client */
+ 
+ 		/* Let's the server pick up a free network port for us */
+-		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress(NULL, NULL, &hints, fp->errbuf,
++		    PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 			goto error_nodiscard;
+ 
+ 		if ((sockdata = sock_open(NULL, addrinfo, SOCKOPEN_SERVER,
+@@ -1311,7 +1312,9 @@ static int pcap_startcapture_remote(pcap_t *fp)
+ 			snprintf(portstring, PCAP_BUF_SIZE, "%d", ntohs(startcapreply.portdata));
+ 
+ 			/* Let's the server pick up a free network port for us */
+-			if (sock_initaddress(host, portstring, &hints, &addrinfo, fp->errbuf, PCAP_ERRBUF_SIZE) == -1)
++			addrinfo = sock_initaddress(host, portstring, &hints,
++			    fp->errbuf, PCAP_ERRBUF_SIZE);
++			if (addrinfo == NULL)
+ 				goto error;
+ 
+ 			if ((sockdata = sock_open(host, addrinfo, SOCKOPEN_CLIENT, 0, fp->errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+@@ -2340,16 +2343,16 @@ rpcap_setup_session(const char *source, struct pcap_rmtauth *auth,
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
+ 		if ((*sockctrlp = sock_open(host, addrinfo, SOCKOPEN_CLIENT, 0,
+ 		    errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+@@ -2950,19 +2953,19 @@ SOCKET pcap_remoteact_accept_ex(const char *address, const char *port, const cha
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
+ 	if ((sockmain = sock_open(NULL, addrinfo, SOCKOPEN_SERVER, 1, errbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+ 	{
+@@ -3122,7 +3125,6 @@ int pcap_remoteact_close(const char *host, char *errbuf)
+ {
+ 	struct activehosts *temp, *prev;	/* temp var needed to scan the host list chain */
+ 	struct addrinfo hints, *addrinfo, *ai_next;	/* temp var needed to translate between hostname to its address */
+-	int retval;
+ 
+ 	temp = activeHosts;
+ 	prev = NULL;
+@@ -3133,9 +3135,9 @@ int pcap_remoteact_close(const char *host, char *errbuf)
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
+index 8d620dd604..b04b29f107 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2085,7 +2085,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
+ 			goto error;
+ 		}
+ 
+-		if (sock_initaddress(peerhost, portdata, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress(peerhost, portdata, &hints,
++		    errmsgbuf, PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 			goto error;
+ 
+ 		if ((session->sockdata = sock_open(peerhost, addrinfo, SOCKOPEN_CLIENT, 0, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+@@ -2096,7 +2098,9 @@ daemon_msg_startcap_req(uint8 ver, struct daemon_slpars *pars, uint32 plen,
+ 		hints.ai_flags = AI_PASSIVE;
+ 
+ 		// Make the server socket pick up a free network port for us
+-		if (sock_initaddress(NULL, NULL, &hints, &addrinfo, errmsgbuf, PCAP_ERRBUF_SIZE) == -1)
++		addrinfo = sock_initaddress(NULL, NULL, &hints, errmsgbuf,
++		    PCAP_ERRBUF_SIZE);
++		if (addrinfo == NULL)
+ 			goto error;
+ 
+ 		if ((session->sockdata = sock_open(NULL, addrinfo, SOCKOPEN_SERVER, 1 /* max 1 connection in queue */, errmsgbuf, PCAP_ERRBUF_SIZE)) == INVALID_SOCKET)
+diff --git a/rpcapd/rpcapd.c b/rpcapd/rpcapd.c
+index e1f3f05299..d166522c9f 100644
+--- a/rpcapd/rpcapd.c
++++ b/rpcapd/rpcapd.c
+@@ -611,7 +611,9 @@ void main_startup(void)
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
+@@ -1350,7 +1352,9 @@ main_active(void *ptr)
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
+index a1bfa1b5e2..823c2363e0 100644
+--- a/sockutils.c
++++ b/sockutils.c
+@@ -1069,20 +1069,21 @@ get_gai_errstring(char *errbuf, int errbuflen, const char *prefix, int err,
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
+@@ -1094,9 +1095,13 @@ int sock_initaddress(const char *host, const char *port,
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
+@@ -1108,7 +1113,7 @@ int sock_initaddress(const char *host, const char *port,
+ 				int try_retval;
+ 
+ 				try_retval = getaddrinfo(host, NULL, hints,
+-				    addrinfo);
++				    &addrinfo);
+ 				if (try_retval == 0) {
+ 					/*
+ 					 * Worked with just the host,
+@@ -1117,14 +1122,16 @@ int sock_initaddress(const char *host, const char *port,
+ 					 *
+ 					 * Free up the address info first.
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
+@@ -1132,13 +1139,14 @@ int sock_initaddress(const char *host, const char *port,
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
+@@ -1153,30 +1161,28 @@ int sock_initaddress(const char *host, const char *port,
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
+@@ -2089,7 +2095,9 @@ int sock_present2network(const char *address, struct sockaddr_storage *sockaddr,
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
+index a488d8fcb4..30b8cfe0b7 100644
+--- a/sockutils.h
++++ b/sockutils.h
+@@ -138,9 +138,8 @@ void sock_fmterrmsg(char *errbuf, size_t errbuflen, int errcode,
+     PCAP_FORMAT_STRING(const char *fmt), ...) PCAP_PRINTFLIKE(4, 5);
+ void sock_geterrmsg(char *errbuf, size_t errbuflen,
+     PCAP_FORMAT_STRING(const char *fmt), ...)  PCAP_PRINTFLIKE(3, 4);
+-int sock_initaddress(const char *address, const char *port,
+-    struct addrinfo *hints, struct addrinfo **addrinfo,
+-    char *errbuf, int errbuflen);
++struct addrinfo *sock_initaddress(const char *address, const char *port,
++    struct addrinfo *hints, char *errbuf, int errbuflen);
+ int sock_recv(SOCKET sock, SSL *, void *buffer, size_t size, int receiveall,
+     char *errbuf, int errbuflen);
+ int sock_recv_dgram(SOCKET sock, SSL *, void *buffer, size_t size,
diff --git a/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch b/meta/recipes-connectivity/libpcap/libpcap/CVE-2024-8006.patch
new file mode 100644
index 0000000000..6819aedd20
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
+ pcap-new.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/pcap-new.c b/pcap-new.c
+index be91b3f8db..d449ee623c 100644
+--- a/pcap-new.c
++++ b/pcap-new.c
+@@ -230,6 +230,13 @@ int pcap_findalldevs_ex(const char *source, struct pcap_rmtauth *auth, pcap_if_t
+ #else
+ 		/* opening the folder */
+ 		unixdir= opendir(path);
++		if (unixdir == NULL) {
++			DIAG_OFF_FORMAT_TRUNCATION
++			snprintf(errbuf, PCAP_ERRBUF_SIZE,
++			    "Error when listing files: does folder '%s' exist?", path);
++			DIAG_ON_FORMAT_TRUNCATION
++			return -1;
++		}
+ 
+ 		/* get the first file into it */
+ 		filedata= readdir(unixdir);
+@@ -237,7 +244,7 @@ int pcap_findalldevs_ex(const char *source, struct pcap_rmtauth *auth, pcap_if_t
+ 		if (filedata == NULL)
+ 		{
+ 			DIAG_OFF_FORMAT_TRUNCATION
+-			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does folder '%s' exist?", path);
++			snprintf(errbuf, PCAP_ERRBUF_SIZE, "Error when listing files: does folder '%s' contain files?", path);
+ 			DIAG_ON_FORMAT_TRUNCATION
+ 			closedir(unixdir);
+ 			return -1;
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index 166654e280..36eb4bca75 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -10,7 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
+           file://CVE-2023-7256-pre1.patch \
+           file://CVE-2023-7256.patch \
+           file://CVE-2024-8006.patch \
+          "
+
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"
 
 inherit autotools binconfig-disabled pkgconfig
-- 
2.25.1


