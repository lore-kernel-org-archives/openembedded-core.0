Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web08.595.1631895297046775089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 09:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=VtrXVEl8;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id RGVnmKFcLdY2SRGVomx5J6; Fri, 17 Sep 2021 17:14:54 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=NP5OB3yg c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=7QKq2e-ADPsA:10 a=ugkhXdxtAAAA:8 a=-An2I_7KAAAA:8 a=IhchGgkyAAAA:8
 a=A1X0JdhQAAAA:8 a=UJ5Y5Z__AAAA:8 a=BBjjNsf8iQezHUzmjvUA:9 a=v-rVL_I6deEA:10
 a=mpeK5WGHJHAA:10 a=HbkllVUDUjEA:10 a=VinBSYM5t5AA:10
 a=ZG-MjRxWnTTVGrJRUvVH:22 a=Sq34B_EcNBM9_nrAYB9S:22 a=K_lBPDZq2WP7QSumrQz8:22
 a=Df3jFdWbhGDLdZNm0fyq:22 a=-nuATAkMhhWPdIrRzIKU:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=NqGcUKBBJfJiUafLi9tevkCOAcSmYvvkiNxVrez0M48=; b=Vt
	rXVEl8ZIB21JBI6fe5QO2ZkSG4TmnwhJ7iB2tEnhR939NlW4mc6+rRBhFavoYGCVZUZZVeHkbpGan
	SKRIa5eacBY347K3dF39twjRqvVWBi7qywj1Wry4nt1gYNOfxx6ixD10AKOT7N+KWdYCV916lUBlW
	TiYnKZP/CWYrmk6T1ejZ+KQNSMAHEpZPNhGJwSwYJbfsPhsWa8ItklRSW18SIcRbnROxt5q3mIrFh
	eoN1AncsZC+mhPwY0m+teoXru8XD1KScTLVnkv9uw3ztWtOcXT8QhPEptYWN1MxclJgjYqTnHiQzY
	f8p+cIuoy50VGPEsDA7G22NiyBztwIew==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mRGVl-00FCd8-Cg; Fri, 17 Sep 2021 17:14:49 +0100
From: "Mike Crowe" <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [dunfell][PATCH] curl: Fix CVE-2021-22946 and CVE-22947, whitelist CVE-2021-22945
Date: Fri, 17 Sep 2021 17:14:33 +0100
Message-Id: <20210917161433.128643-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFpaV/Bj66hNs9n0wA143WkpHtasWv7QbOysij+PTfxA7mUuK0bVE5PkZihNuEYWwnQcp7LcwOeokUYJlQiRzOV2lS7QueTy5E5k0/RI+wZYm0P9hRdl
 idya4rxHvOEjUuMly5W3obQm6ezpsnL+OMJIzakjpFUsaZB2Rwsi4ta9yu1NrKX3pnwxHMwrywbOag==
Content-Transfer-Encoding: 8bit

curl v7.79.0 contained fixes for three CVEs:

The description of CVE-2021-22945[1] contains:
> This flaw was introduced in commit 2522903b79 but since MQTT support
> was marked 'experimental' then and not enabled in the build by default
> until curl 7.73.0 (October 14, 2020) we count that as the first flawed
> version.

which I believe means that curl v7.69.1 is not vulnerable.

curl v7.69.1 is vulnerable to both CVE-2021-22946[2] and CVE-22947[3].
These patches are from Ubuntu 20.04's curl 7.68.0 package. The patches
applied without conflicts, but I used devtool to regenerate them to
avoid fuzz warnings.

[1] https://curl.se/docs/CVE-2021-22945.html
[2] https://curl.se/docs/CVE-2021-22946.html
[3] https://curl.se/docs/CVE-2021-22947.html

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../curl/curl/CVE-2021-22946-pre1.patch       |  86 +++++
 .../curl/curl/CVE-2021-22946.patch            | 328 ++++++++++++++++
 .../curl/curl/CVE-2021-22947.patch            | 352 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   5 +-
 4 files changed, 770 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22947.patch

I kept the fix for 22946 as two separate patches because that's what
Ubuntu had. I can roll them together into a single patch if it is
preferred.

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22946-pre1.patch b/meta/recipes-support/curl/curl/CVE-2021-22946-pre1.patch
new file mode 100644
index 0000000000..4afd755149
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22946-pre1.patch
@@ -0,0 +1,86 @@
+Backport of:
+
+From 1397a7de6e312e019a3b339f855ba0a5cafa9127 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 21 Sep 2020 09:15:51 +0200
+Subject: [PATCH] ftp: separate FTPS from FTP over "HTTPS proxy"
+
+When using HTTPS proxy, SSL is used but not in the view of the FTP
+protocol handler itself so separate the connection's use of SSL from the
+FTP control connection's sue.
+
+Reported-by: Mingtao Yang
+Fixes #5523
+Closes #6006
+
+Upstream-Status: backport from 7.68.0-1ubuntu2.7
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+---
+ lib/ftp.c     | 13 ++++++-------
+ lib/urldata.h |  1 +
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 3382772..677527f 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2488,7 +2488,7 @@ static CURLcode ftp_state_loggedin(struct connectdata *conn)
+ {
+   CURLcode result = CURLE_OK;
+ 
+-  if(conn->ssl[FIRSTSOCKET].use) {
++  if(conn->bits.ftp_use_control_ssl) {
+     /* PBSZ = PROTECTION BUFFER SIZE.
+ 
+     The 'draft-murray-auth-ftp-ssl' (draft 12, page 7) says:
+@@ -2633,11 +2633,8 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+       }
+ #endif
+ 
+-      if(data->set.use_ssl &&
+-         (!conn->ssl[FIRSTSOCKET].use ||
+-          (conn->bits.proxy_ssl_connected[FIRSTSOCKET] &&
+-           !conn->proxy_ssl[FIRSTSOCKET].use))) {
+-        /* We don't have a SSL/TLS connection yet, but FTPS is
++      if(data->set.use_ssl && !conn->bits.ftp_use_control_ssl) {
++        /* We don't have a SSL/TLS control connection yet, but FTPS is
+            requested. Try a FTPS connection now */
+ 
+         ftpc->count3 = 0;
+@@ -2682,6 +2679,7 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+         result = Curl_ssl_connect(conn, FIRSTSOCKET);
+         if(!result) {
+           conn->bits.ftp_use_data_ssl = FALSE; /* clear-text data */
++          conn->bits.ftp_use_control_ssl = TRUE; /* SSL on control */
+           result = ftp_state_user(conn);
+         }
+       }
+@@ -3072,7 +3070,7 @@ static CURLcode ftp_block_statemach(struct connectdata *conn)
+  *
+  */
+ static CURLcode ftp_connect(struct connectdata *conn,
+-                                 bool *done) /* see description above */
++                            bool *done) /* see description above */
+ {
+   CURLcode result;
+   struct ftp_conn *ftpc = &conn->proto.ftpc;
+@@ -3093,6 +3091,7 @@ static CURLcode ftp_connect(struct connectdata *conn,
+     result = Curl_ssl_connect(conn, FIRSTSOCKET);
+     if(result)
+       return result;
++    conn->bits.ftp_use_control_ssl = TRUE;
+   }
+ 
+   Curl_pp_init(pp); /* init the generic pingpong data */
+diff --git a/lib/urldata.h b/lib/urldata.h
+index ff2d686..d1fb4a9 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -461,6 +461,7 @@ struct ConnectBits {
+                          EPRT doesn't work we disable it for the forthcoming
+                          requests */
+   BIT(ftp_use_data_ssl); /* Enabled SSL for the data connection */
++  BIT(ftp_use_control_ssl); /* Enabled SSL for the control connection */
+ #endif
+   BIT(netrc);         /* name+password provided by netrc */
+   BIT(userpwd_in_url); /* name+password found in url */
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22946.patch b/meta/recipes-support/curl/curl/CVE-2021-22946.patch
new file mode 100644
index 0000000000..98032d8b78
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22946.patch
@@ -0,0 +1,328 @@
+Backport of:
+
+From 96d71feb27e533a8b337512841a537952916262c Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Wed, 8 Sep 2021 11:56:22 +0200
+Subject: [PATCH] ftp,imap,pop3: do not ignore --ssl-reqd
+
+In imap and pop3, check if TLS is required even when capabilities
+request has failed.
+
+In ftp, ignore preauthentication (230 status of server greeting) if TLS
+is required.
+
+Bug: https://curl.se/docs/CVE-2021-22946.html
+Upstream-Status: backport from 7.68.0-1ubuntu2.7
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+CVE: CVE-2021-22946
+---
+ lib/ftp.c               |  9 ++++---
+ lib/imap.c              | 24 ++++++++----------
+ lib/pop3.c              | 33 +++++++++++-------------
+ tests/data/Makefile.inc |  2 ++
+ tests/data/test984      | 56 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test985      | 54 +++++++++++++++++++++++++++++++++++++++
+ tests/data/test986      | 53 ++++++++++++++++++++++++++++++++++++++
+ 7 files changed, 195 insertions(+), 36 deletions(-)
+ create mode 100644 tests/data/test984
+ create mode 100644 tests/data/test985
+ create mode 100644 tests/data/test986
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 677527f..91b43d8 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2606,9 +2606,12 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+     /* we have now received a full FTP server response */
+     switch(ftpc->state) {
+     case FTP_WAIT220:
+-      if(ftpcode == 230)
+-        /* 230 User logged in - already! */
+-        return ftp_state_user_resp(conn, ftpcode, ftpc->state);
++      if(ftpcode == 230) {
++        /* 230 User logged in - already! Take as 220 if TLS required. */
++        if(data->set.use_ssl <= CURLUSESSL_TRY ||
++           conn->bits.ftp_use_control_ssl)
++          return ftp_state_user_resp(conn, ftpcode, ftpc->state);
++      }
+       else if(ftpcode != 220) {
+         failf(data, "Got a %03d ftp-server response when 220 was expected",
+               ftpcode);
+diff --git a/lib/imap.c b/lib/imap.c
+index 66172bd..9880ce1 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -917,22 +917,18 @@ static CURLcode imap_state_capability_resp(struct connectdata *conn,
+       line += wordlen;
+     }
+   }
+-  else if(imapcode == IMAP_RESP_OK) {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested */
+-      if(imapc->tls_supported)
+-        /* Switch to TLS connection now */
+-        result = imap_perform_starttls(conn);
+-      else if(data->set.use_ssl == CURLUSESSL_TRY)
+-        /* Fallback and carry on with authentication */
+-        result = imap_perform_authentication(conn);
+-      else {
+-        failf(data, "STARTTLS not supported.");
+-        result = CURLE_USE_SSL_FAILED;
+-      }
++  else if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
++    /* PREAUTH is not compatible with STARTTLS. */
++    if(imapcode == IMAP_RESP_OK && imapc->tls_supported && !imapc->preauth) {
++      /* Switch to TLS connection now */
++      result = imap_perform_starttls(conn);
+     }
+-    else
++    else if(data->set.use_ssl <= CURLUSESSL_TRY)
+       result = imap_perform_authentication(conn);
++    else {
++      failf(data, "STARTTLS not available.");
++      result = CURLE_USE_SSL_FAILED;
++    }
+   }
+   else
+     result = imap_perform_authentication(conn);
+diff --git a/lib/pop3.c b/lib/pop3.c
+index 57c1373..145b2b4 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -721,28 +721,23 @@ static CURLcode pop3_state_capa_resp(struct connectdata *conn, int pop3code,
+       }
+     }
+   }
+-  else if(pop3code == '+') {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested */
+-      if(pop3c->tls_supported)
+-        /* Switch to TLS connection now */
+-        result = pop3_perform_starttls(conn);
+-      else if(data->set.use_ssl == CURLUSESSL_TRY)
+-        /* Fallback and carry on with authentication */
+-        result = pop3_perform_authentication(conn);
+-      else {
+-        failf(data, "STLS not supported.");
+-        result = CURLE_USE_SSL_FAILED;
+-      }
+-    }
+-    else
+-      result = pop3_perform_authentication(conn);
+-  }
+   else {
+     /* Clear text is supported when CAPA isn't recognised */
+-    pop3c->authtypes |= POP3_TYPE_CLEARTEXT;
++    if(pop3code != '+')
++      pop3c->authtypes |= POP3_TYPE_CLEARTEXT;
+ 
+-    result = pop3_perform_authentication(conn);
++    if(!data->set.use_ssl || conn->ssl[FIRSTSOCKET].use)
++      result = pop3_perform_authentication(conn);
++    else if(pop3code == '+' && pop3c->tls_supported)
++      /* Switch to TLS connection now */
++      result = pop3_perform_starttls(conn);
++    else if(data->set.use_ssl <= CURLUSESSL_TRY)
++      /* Fallback and carry on with authentication */
++      result = pop3_perform_authentication(conn);
++    else {
++      failf(data, "STLS not supported.");
++      result = CURLE_USE_SSL_FAILED;
++    }
+   }
+ 
+   return result;
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index f9535a6..0fa6799 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -112,6 +112,8 @@ test945 test946 test947 test948 test949 test950 test951 test952 test953 \
+ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 \
+ \
++test984 test985 test986 \
++\
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
+ test1016 test1017 test1018 test1019 test1020 test1021 test1022 test1023 \
+diff --git a/tests/data/test984 b/tests/data/test984
+new file mode 100644
+index 0000000..e573f23
+--- /dev/null
++++ b/tests/data/test984
+@@ -0,0 +1,56 @@
++<testcase>
++<info>
++<keywords>
++IMAP
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++REPLY CAPABILITY A001 BAD Not implemented
++</servercmd>
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++imap
++</server>
++ <name>
++IMAP require STARTTLS with failing capabilities
++ </name>
++ <command>
++imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:secret --ssl-reqd
++</command>
++<file name="log/upload%TESTNUMBER">
++Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST)
++From: Fred Foobar <foobar@example.COM>
++Subject: afternoon meeting
++To: joe@example.com
++Message-Id: <B27397-0100000@example.COM>
++MIME-Version: 1.0
++Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
++
++Hello Joe, do you think we can meet at 3:30 tomorrow?
++</file>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++# 64 is CURLE_USE_SSL_FAILED
++<errorcode>
++64
++</errorcode>
++<protocol>
++A001 CAPABILITY
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test985 b/tests/data/test985
+new file mode 100644
+index 0000000..d0db4aa
+--- /dev/null
++++ b/tests/data/test985
+@@ -0,0 +1,54 @@
++<testcase>
++<info>
++<keywords>
++POP3
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++REPLY CAPA -ERR Not implemented
++</servercmd>
++<data nocheck="yes">
++From: me@somewhere
++To: fake@nowhere
++
++body
++
++--
++  yours sincerely
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++pop3
++</server>
++ <name>
++POP3 require STARTTLS with failing capabilities
++ </name>
++ <command>
++pop3://%HOSTIP:%POP3PORT/%TESTNUMBER -u user:secret --ssl-reqd
++ </command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++# 64 is CURLE_USE_SSL_FAILED
++<errorcode>
++64
++</errorcode>
++<protocol>
++CAPA
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test986 b/tests/data/test986
+new file mode 100644
+index 0000000..a709437
+--- /dev/null
++++ b/tests/data/test986
+@@ -0,0 +1,53 @@
++<testcase>
++<info>
++<keywords>
++FTP
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++REPLY welcome 230 Welcome
++REPLY AUTH 500 unknown command
++</servercmd>
++</reply>
++
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++ftp
++</server>
++ <name>
++FTP require STARTTLS while preauthenticated
++ </name>
++<file name="log/test%TESTNUMBER.txt">
++data
++    to
++      see
++that FTPS
++works
++  so does it?
++</file>
++ <command>
++--ssl-reqd --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/test%TESTNUMBER.txt -u user:secret
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++# 64 is CURLE_USE_SSL_FAILED
++<errorcode>
++64
++</errorcode>
++<protocol>
++AUTH SSL
++AUTH TLS
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22947.patch b/meta/recipes-support/curl/curl/CVE-2021-22947.patch
new file mode 100644
index 0000000000..070a328e27
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22947.patch
@@ -0,0 +1,352 @@
+Backport of:
+
+From 259b4f2e1fd01fbc55e569ee0a507afeae34f77c Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Tue, 7 Sep 2021 13:26:42 +0200
+Subject: [PATCH] ftp,imap,pop3,smtp: reject STARTTLS server response
+ pipelining
+
+If a server pipelines future responses within the STARTTLS response, the
+former are preserved in the pingpong cache across TLS negotiation and
+used as responses to the encrypted commands.
+
+This fix detects pipelined STARTTLS responses and rejects them with an
+error.
+
+Bug: https://curl.se/docs/CVE-2021-22947.html
+Upstream-Status: backport from 7.68.0-1ubuntu2.7
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+CVE: CVE-2021-22947
+
+---
+ lib/ftp.c               |  3 +++
+ lib/imap.c              |  4 +++
+ lib/pop3.c              |  4 +++
+ lib/smtp.c              |  4 +++
+ tests/data/Makefile.inc |  2 ++
+ tests/data/test980      | 52 ++++++++++++++++++++++++++++++++++++
+ tests/data/test981      | 59 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test982      | 57 +++++++++++++++++++++++++++++++++++++++
+ tests/data/test983      | 52 ++++++++++++++++++++++++++++++++++++
+ 9 files changed, 237 insertions(+)
+ create mode 100644 tests/data/test980
+ create mode 100644 tests/data/test981
+ create mode 100644 tests/data/test982
+ create mode 100644 tests/data/test983
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 91b43d8..31a34e8 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2670,6 +2670,9 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+     case FTP_AUTH:
+       /* we have gotten the response to a previous AUTH command */
+ 
++      if(pp->cache_size)
++        return CURLE_WEIRD_SERVER_REPLY; /* Forbid pipelining in response. */
++
+       /* RFC2228 (page 5) says:
+        *
+        * If the server is willing to accept the named security mechanism,
+diff --git a/lib/imap.c b/lib/imap.c
+index 9880ce1..0ca700f 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -946,6 +946,10 @@ static CURLcode imap_state_starttls_resp(struct connectdata *conn,
+ 
+   (void)instate; /* no use for this yet */
+ 
++  /* Pipelining in response is forbidden. */
++  if(data->conn->proto.imapc.pp.cache_size)
++    return CURLE_WEIRD_SERVER_REPLY;
++
+   if(imapcode != IMAP_RESP_OK) {
+     if(data->set.use_ssl != CURLUSESSL_TRY) {
+       failf(data, "STARTTLS denied");
+diff --git a/lib/pop3.c b/lib/pop3.c
+index 145b2b4..8a2d52e 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -753,6 +753,10 @@ static CURLcode pop3_state_starttls_resp(struct connectdata *conn,
+ 
+   (void)instate; /* no use for this yet */
+ 
++  /* Pipelining in response is forbidden. */
++  if(data->conn->proto.pop3c.pp.cache_size)
++    return CURLE_WEIRD_SERVER_REPLY;
++
+   if(pop3code != '+') {
+     if(data->set.use_ssl != CURLUSESSL_TRY) {
+       failf(data, "STARTTLS denied");
+diff --git a/lib/smtp.c b/lib/smtp.c
+index e187287..66183e2 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -820,6 +820,10 @@ static CURLcode smtp_state_starttls_resp(struct connectdata *conn,
+ 
+   (void)instate; /* no use for this yet */
+ 
++  /* Pipelining in response is forbidden. */
++  if(data->conn->proto.smtpc.pp.cache_size)
++    return CURLE_WEIRD_SERVER_REPLY;
++
+   if(smtpcode != 220) {
+     if(data->set.use_ssl != CURLUSESSL_TRY) {
+       failf(data, "STARTTLS denied, code %d", smtpcode);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 0fa6799..60e8176 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -112,6 +112,8 @@ test945 test946 test947 test948 test949 test950 test951 test952 test953 \
+ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 \
+ \
++test980 test981 test982 test983 \
++\
+ test984 test985 test986 \
+ \
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+diff --git a/tests/data/test980 b/tests/data/test980
+new file mode 100644
+index 0000000..97567f8
+--- /dev/null
++++ b/tests/data/test980
+@@ -0,0 +1,52 @@
++<testcase>
++<info>
++<keywords>
++SMTP
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++CAPA STARTTLS
++AUTH PLAIN
++REPLY STARTTLS 454 currently unavailable\r\n235 Authenticated\r\n250 2.1.0 Sender ok\r\n250 2.1.5 Recipient ok\r\n354 Enter mail\r\n250 2.0.0 Accepted
++REPLY AUTH 535 5.7.8 Authentication credentials invalid
++</servercmd>
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++smtp
++</server>
++ <name>
++SMTP STARTTLS pipelined server response
++ </name>
++<stdin>
++mail body
++</stdin>
++ <command>
++smtp://%HOSTIP:%SMTPPORT/%TESTNUMBER --mail-rcpt recipient@example.com --mail-from sender@example.com -u user:secret --ssl --sasl-ir -T -
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++# 8 is CURLE_WEIRD_SERVER_REPLY
++<errorcode>
++8
++</errorcode>
++<protocol>
++EHLO %TESTNUMBER
++STARTTLS
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test981 b/tests/data/test981
+new file mode 100644
+index 0000000..2b98ce4
+--- /dev/null
++++ b/tests/data/test981
+@@ -0,0 +1,59 @@
++<testcase>
++<info>
++<keywords>
++IMAP
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++CAPA STARTTLS
++REPLY STARTTLS A002 BAD currently unavailable\r\nA003 OK Authenticated\r\nA004 OK Accepted
++REPLY LOGIN A003 BAD Authentication credentials invalid
++</servercmd>
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++imap
++</server>
++ <name>
++IMAP STARTTLS pipelined server response
++ </name>
++ <command>
++imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:secret --ssl
++</command>
++<file name="log/upload%TESTNUMBER">
++Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST)
++From: Fred Foobar <foobar@example.COM>
++Subject: afternoon meeting
++To: joe@example.com
++Message-Id: <B27397-0100000@example.COM>
++MIME-Version: 1.0
++Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
++
++Hello Joe, do you think we can meet at 3:30 tomorrow?
++</file>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++# 8 is CURLE_WEIRD_SERVER_REPLY
++<errorcode>
++8
++</errorcode>
++<protocol>
++A001 CAPABILITY
++A002 STARTTLS
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test982 b/tests/data/test982
+new file mode 100644
+index 0000000..9e07cc0
+--- /dev/null
++++ b/tests/data/test982
+@@ -0,0 +1,57 @@
++<testcase>
++<info>
++<keywords>
++POP3
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++CAPA STLS USER
++REPLY STLS -ERR currently unavailable\r\n+OK user accepted\r\n+OK authenticated
++REPLY PASS -ERR Authentication credentials invalid
++</servercmd>
++<data nocheck="yes">
++From: me@somewhere
++To: fake@nowhere
++
++body
++
++--
++  yours sincerely
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++pop3
++</server>
++ <name>
++POP3 STARTTLS pipelined server response
++ </name>
++ <command>
++pop3://%HOSTIP:%POP3PORT/%TESTNUMBER -u user:secret --ssl
++ </command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++# 8 is CURLE_WEIRD_SERVER_REPLY
++<errorcode>
++8
++</errorcode>
++<protocol>
++CAPA
++STLS
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test983 b/tests/data/test983
+new file mode 100644
+index 0000000..300ec45
+--- /dev/null
++++ b/tests/data/test983
+@@ -0,0 +1,52 @@
++<testcase>
++<info>
++<keywords>
++FTP
++STARTTLS
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<servercmd>
++REPLY AUTH 500 unknown command\r\n500 unknown command\r\n331 give password\r\n230 Authenticated\r\n257 "/"\r\n200 OK\r\n200 OK\r\n200 OK\r\n226 Transfer complete
++REPLY PASS 530 Login incorrect
++</servercmd>
++</reply>
++
++# Client-side
++<client>
++<features>
++SSL
++</features>
++<server>
++ftp
++</server>
++ <name>
++FTP STARTTLS pipelined server response
++ </name>
++<file name="log/test%TESTNUMBER.txt">
++data
++    to
++      see
++that FTPS
++works
++  so does it?
++</file>
++ <command>
++--ssl --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/test%TESTNUMBER.txt -u user:secret -P %CLIENTIP
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++# 8 is CURLE_WEIRD_SERVER_REPLY
++<errorcode>
++8
++</errorcode>
++<protocol>
++AUTH SSL
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 21c673feda..d7ffb2dc50 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -22,6 +22,9 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2021-22898.patch \
            file://CVE-2021-22924.patch \
            file://CVE-2021-22925.patch \
+           file://CVE-2021-22946-pre1.patch \
+           file://CVE-2021-22946.patch \
+           file://CVE-2021-22947.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
@@ -29,7 +32,7 @@ SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a5
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926"
+CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-22945"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.30.2

