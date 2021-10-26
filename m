Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10465C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783505"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783505"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786613"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 25/37] curl: fix CVE-2021-22945 through -22947
Date: Tue, 26 Oct 2021 23:57:56 +0800
Message-Id: 
 <2f9feadd518444a5c19892acfa9bfca38cb1c25b.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157428

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cff6888f3b2b4bd0a42329b7f7c59b33c9d51265)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/cve-2021-22945.patch            |  34 ++
 .../curl/curl/cve-2021-22946.patch            | 332 ++++++++++++++++
 .../curl/curl/cve-2021-22947.patch            | 355 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.78.0.bb      |   3 +
 4 files changed, 724 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22945.patch
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22947.patch

diff --git a/meta/recipes-support/curl/curl/cve-2021-22945.patch b/meta/recipes-support/curl/curl/cve-2021-22945.patch
new file mode 100644
index 0000000000..2cbe110332
--- /dev/null
+++ b/meta/recipes-support/curl/curl/cve-2021-22945.patch
@@ -0,0 +1,34 @@
+CVE: CVE-2021-22945
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 92cb3059dab2f9ef3e6ea614dad5c86917d19807 Mon Sep 17 00:00:00 2001
+From: z2_ on hackerone <>
+Date: Tue, 24 Aug 2021 09:50:33 +0200
+Subject: [PATCH 1/3] mqtt: clear the leftovers pointer when sending succeeds
+
+CVE-2021-22945
+
+Bug: https://curl.se/docs/CVE-2021-22945.html
+---
+ lib/mqtt.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/mqtt.c b/lib/mqtt.c
+index f077e6c3d..fcd40b41e 100644
+--- a/lib/mqtt.c
++++ b/lib/mqtt.c
+@@ -128,6 +128,10 @@ static CURLcode mqtt_send(struct Curl_easy *data,
+     mq->sendleftovers = sendleftovers;
+     mq->nsend = nsend;
+   }
++  else {
++    mq->sendleftovers = NULL;
++    mq->nsend = 0;
++  }
+   return result;
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/cve-2021-22946.patch b/meta/recipes-support/curl/curl/cve-2021-22946.patch
new file mode 100644
index 0000000000..1a4b3e1144
--- /dev/null
+++ b/meta/recipes-support/curl/curl/cve-2021-22946.patch
@@ -0,0 +1,332 @@
+CVE: CVE-2021-22946
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 089e18aefcee9b5093a96e9e1aa92751dde1f991 Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Wed, 8 Sep 2021 11:56:22 +0200
+Subject: [PATCH 2/3] ftp,imap,pop3: do not ignore --ssl-reqd
+
+In imap and pop3, check if TLS is required even when capabilities
+request has failed.
+
+In ftp, ignore preauthentication (230 status of server greeting) if TLS
+is required.
+
+Bug: https://curl.se/docs/CVE-2021-22946.html
+
+CVE-2021-22946
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
+index 1a699de59..08d18ca74 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2681,9 +2681,12 @@ static CURLcode ftp_statemachine(struct Curl_easy *data,
+     /* we have now received a full FTP server response */
+     switch(ftpc->state) {
+     case FTP_WAIT220:
+-      if(ftpcode == 230)
+-        /* 230 User logged in - already! */
+-        return ftp_state_user_resp(data, ftpcode, ftpc->state);
++      if(ftpcode == 230) {
++        /* 230 User logged in - already! Take as 220 if TLS required. */
++        if(data->set.use_ssl <= CURLUSESSL_TRY ||
++           conn->bits.ftp_use_control_ssl)
++          return ftp_state_user_resp(data, ftpcode, ftpc->state);
++      }
+       else if(ftpcode != 220) {
+         failf(data, "Got a %03d ftp-server response when 220 was expected",
+               ftpcode);
+diff --git a/lib/imap.c b/lib/imap.c
+index ab4d412ee..efc0420ce 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -935,22 +935,18 @@ static CURLcode imap_state_capability_resp(struct Curl_easy *data,
+       line += wordlen;
+     }
+   }
+-  else if(imapcode == IMAP_RESP_OK) {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested */
+-      if(imapc->tls_supported)
+-        /* Switch to TLS connection now */
+-        result = imap_perform_starttls(data, conn);
+-      else if(data->set.use_ssl == CURLUSESSL_TRY)
+-        /* Fallback and carry on with authentication */
+-        result = imap_perform_authentication(data, conn);
+-      else {
+-        failf(data, "STARTTLS not supported.");
+-        result = CURLE_USE_SSL_FAILED;
+-      }
++  else if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
++    /* PREAUTH is not compatible with STARTTLS. */
++    if(imapcode == IMAP_RESP_OK && imapc->tls_supported && !imapc->preauth) {
++      /* Switch to TLS connection now */
++      result = imap_perform_starttls(data, conn);
+     }
+-    else
++    else if(data->set.use_ssl <= CURLUSESSL_TRY)
+       result = imap_perform_authentication(data, conn);
++    else {
++      failf(data, "STARTTLS not available.");
++      result = CURLE_USE_SSL_FAILED;
++    }
+   }
+   else
+     result = imap_perform_authentication(data, conn);
+diff --git a/lib/pop3.c b/lib/pop3.c
+index 5fdd6f3e0..f97e10eab 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -741,28 +741,23 @@ static CURLcode pop3_state_capa_resp(struct Curl_easy *data, int pop3code,
+       }
+     }
+   }
+-  else if(pop3code == '+') {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested */
+-      if(pop3c->tls_supported)
+-        /* Switch to TLS connection now */
+-        result = pop3_perform_starttls(data, conn);
+-      else if(data->set.use_ssl == CURLUSESSL_TRY)
+-        /* Fallback and carry on with authentication */
+-        result = pop3_perform_authentication(data, conn);
+-      else {
+-        failf(data, "STLS not supported.");
+-        result = CURLE_USE_SSL_FAILED;
+-      }
+-    }
+-    else
+-      result = pop3_perform_authentication(data, conn);
+-  }
+   else {
+     /* Clear text is supported when CAPA isn't recognised */
+-    pop3c->authtypes |= POP3_TYPE_CLEARTEXT;
++    if(pop3code != '+')
++      pop3c->authtypes |= POP3_TYPE_CLEARTEXT;
+ 
+-    result = pop3_perform_authentication(data, conn);
++    if(!data->set.use_ssl || conn->ssl[FIRSTSOCKET].use)
++      result = pop3_perform_authentication(data, conn);
++    else if(pop3code == '+' && pop3c->tls_supported)
++      /* Switch to TLS connection now */
++      result = pop3_perform_starttls(data, conn);
++    else if(data->set.use_ssl <= CURLUSESSL_TRY)
++      /* Fallback and carry on with authentication */
++      result = pop3_perform_authentication(data, conn);
++    else {
++      failf(data, "STLS not supported.");
++      result = CURLE_USE_SSL_FAILED;
++    }
+   }
+ 
+   return result;
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 163696962..5cd092192 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -118,6 +118,8 @@ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971 \
+ test972 \
+ \
++test984 test985 test986 \
++\
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
+ test1016 test1017 test1018 test1019 test1020 test1021 test1022 test1023 \
+diff --git a/tests/data/test984 b/tests/data/test984
+new file mode 100644
+index 000000000..e573f23c1
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
+index 000000000..d0db4aadf
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
+index 000000000..a709437a4
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/cve-2021-22947.patch b/meta/recipes-support/curl/curl/cve-2021-22947.patch
new file mode 100644
index 0000000000..8a5031275a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/cve-2021-22947.patch
@@ -0,0 +1,355 @@
+CVE: CVE-2021-22947
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From aefa7370cb02801a571d51287d290d67068998b8 Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Tue, 7 Sep 2021 13:26:42 +0200
+Subject: [PATCH 3/3] ftp,imap,pop3,smtp: reject STARTTLS server response
+ pipelining
+
+If a server pipelines future responses within the STARTTLS response, the
+former are preserved in the pingpong cache across TLS negotiation and
+used as responses to the encrypted commands.
+
+This fix detects pipelined STARTTLS responses and rejects them with an
+error.
+
+CVE-2021-22947
+
+Bug: https://curl.se/docs/CVE-2021-22947.html
+---
+ lib/ftp.c               |  3 +++
+ lib/imap.c              |  4 +++
+ lib/pop3.c              |  4 +++
+ lib/smtp.c              |  4 +++
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test980      | 52 ++++++++++++++++++++++++++++++++++++
+ tests/data/test981      | 59 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test982      | 57 +++++++++++++++++++++++++++++++++++++++
+ tests/data/test983      | 52 ++++++++++++++++++++++++++++++++++++
+ 9 files changed, 236 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test980
+ create mode 100644 tests/data/test981
+ create mode 100644 tests/data/test982
+ create mode 100644 tests/data/test983
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 08d18ca74..0b9c9b732 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2743,6 +2743,9 @@ static CURLcode ftp_statemachine(struct Curl_easy *data,
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
+index efc0420ce..d1a48d7e3 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -964,6 +964,10 @@ static CURLcode imap_state_starttls_resp(struct Curl_easy *data,
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
+index f97e10eab..a06acb7b8 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -772,6 +772,10 @@ static CURLcode pop3_state_starttls_resp(struct Curl_easy *data,
+   CURLcode result = CURLE_OK;
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
+index 1a3da1559..9b9403b3d 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -835,6 +835,10 @@ static CURLcode smtp_state_starttls_resp(struct Curl_easy *data,
+   CURLcode result = CURLE_OK;
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
+index 5cd092192..c524b993e 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -118,7 +118,7 @@ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971 \
+ test972 \
+ \
+-test984 test985 test986 \
++test980 test981 test982 test983 test984 test985 test986 \
+ \
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
+diff --git a/tests/data/test980 b/tests/data/test980
+new file mode 100644
+index 000000000..97567f856
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
+index 000000000..2b98ce42a
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
+index 000000000..9e07cc0b3
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
+index 000000000..300ec459c
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-support/curl/curl_7.78.0.bb
index dece0babb2..3f736d8da6 100644
--- a/meta/recipes-support/curl/curl_7.78.0.bb
+++ b/meta/recipes-support/curl/curl_7.78.0.bb
@@ -11,6 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://cve-2021-22945.patch \
+           file://cve-2021-22946.patch \
+           file://cve-2021-22947.patch \
 "
 
 SRC_URI[sha256sum] = "98530b317dc95ccb324bbe4f834f07bb642fbc393b794ddf3434f246a71ea44a"
-- 
2.31.1


