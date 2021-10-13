Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A869C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:57:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7765.1634129854737948156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38F2AD6E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:57:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A07623F66F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:57:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister][master] curl: fix CVE-2021-22945 through -22947
Date: Wed, 13 Oct 2021 13:57:29 +0100
Message-Id: <20211013125729.35403-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:57:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156908

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../curl/curl/cve-2021-22945.patch            |  34 ++
 .../curl/curl/cve-2021-22946.patch            | 332 ++++++++++++++++
 .../curl/curl/cve-2021-22947.patch            | 355 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.78.0.bb      |   3 +
 4 files changed, 724 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22945.patch
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22947.patch

diff --git a/meta/recipes-support/curl/curl/cve-2021-22945.patch b/meta/r=
ecipes-support/curl/curl/cve-2021-22945.patch
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
+Subject: [PATCH 1/3] mqtt: clear the leftovers pointer when sending succ=
eeds
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
+     mq->sendleftovers =3D sendleftovers;
+     mq->nsend =3D nsend;
+   }
++  else {
++    mq->sendleftovers =3D NULL;
++    mq->nsend =3D 0;
++  }
+   return result;
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/cve-2021-22946.patch b/meta/r=
ecipes-support/curl/curl/cve-2021-22946.patch
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
+@@ -2681,9 +2681,12 @@ static CURLcode ftp_statemachine(struct Curl_easy=
 *data,
+     /* we have now received a full FTP server response */
+     switch(ftpc->state) {
+     case FTP_WAIT220:
+-      if(ftpcode =3D=3D 230)
+-        /* 230 User logged in - already! */
+-        return ftp_state_user_resp(data, ftpcode, ftpc->state);
++      if(ftpcode =3D=3D 230) {
++        /* 230 User logged in - already! Take as 220 if TLS required. *=
/
++        if(data->set.use_ssl <=3D CURLUSESSL_TRY ||
++           conn->bits.ftp_use_control_ssl)
++          return ftp_state_user_resp(data, ftpcode, ftpc->state);
++      }
+       else if(ftpcode !=3D 220) {
+         failf(data, "Got a %03d ftp-server response when 220 was expect=
ed",
+               ftpcode);
+diff --git a/lib/imap.c b/lib/imap.c
+index ab4d412ee..efc0420ce 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -935,22 +935,18 @@ static CURLcode imap_state_capability_resp(struct =
Curl_easy *data,
+       line +=3D wordlen;
+     }
+   }
+-  else if(imapcode =3D=3D IMAP_RESP_OK) {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested *=
/
+-      if(imapc->tls_supported)
+-        /* Switch to TLS connection now */
+-        result =3D imap_perform_starttls(data, conn);
+-      else if(data->set.use_ssl =3D=3D CURLUSESSL_TRY)
+-        /* Fallback and carry on with authentication */
+-        result =3D imap_perform_authentication(data, conn);
+-      else {
+-        failf(data, "STARTTLS not supported.");
+-        result =3D CURLE_USE_SSL_FAILED;
+-      }
++  else if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
++    /* PREAUTH is not compatible with STARTTLS. */
++    if(imapcode =3D=3D IMAP_RESP_OK && imapc->tls_supported && !imapc->=
preauth) {
++      /* Switch to TLS connection now */
++      result =3D imap_perform_starttls(data, conn);
+     }
+-    else
++    else if(data->set.use_ssl <=3D CURLUSESSL_TRY)
+       result =3D imap_perform_authentication(data, conn);
++    else {
++      failf(data, "STARTTLS not available.");
++      result =3D CURLE_USE_SSL_FAILED;
++    }
+   }
+   else
+     result =3D imap_perform_authentication(data, conn);
+diff --git a/lib/pop3.c b/lib/pop3.c
+index 5fdd6f3e0..f97e10eab 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -741,28 +741,23 @@ static CURLcode pop3_state_capa_resp(struct Curl_e=
asy *data, int pop3code,
+       }
+     }
+   }
+-  else if(pop3code =3D=3D '+') {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested *=
/
+-      if(pop3c->tls_supported)
+-        /* Switch to TLS connection now */
+-        result =3D pop3_perform_starttls(data, conn);
+-      else if(data->set.use_ssl =3D=3D CURLUSESSL_TRY)
+-        /* Fallback and carry on with authentication */
+-        result =3D pop3_perform_authentication(data, conn);
+-      else {
+-        failf(data, "STLS not supported.");
+-        result =3D CURLE_USE_SSL_FAILED;
+-      }
+-    }
+-    else
+-      result =3D pop3_perform_authentication(data, conn);
+-  }
+   else {
+     /* Clear text is supported when CAPA isn't recognised */
+-    pop3c->authtypes |=3D POP3_TYPE_CLEARTEXT;
++    if(pop3code !=3D '+')
++      pop3c->authtypes |=3D POP3_TYPE_CLEARTEXT;
+=20
+-    result =3D pop3_perform_authentication(data, conn);
++    if(!data->set.use_ssl || conn->ssl[FIRSTSOCKET].use)
++      result =3D pop3_perform_authentication(data, conn);
++    else if(pop3code =3D=3D '+' && pop3c->tls_supported)
++      /* Switch to TLS connection now */
++      result =3D pop3_perform_starttls(data, conn);
++    else if(data->set.use_ssl <=3D CURLUSESSL_TRY)
++      /* Fallback and carry on with authentication */
++      result =3D pop3_perform_authentication(data, conn);
++    else {
++      failf(data, "STLS not supported.");
++      result =3D CURLE_USE_SSL_FAILED;
++    }
+   }
+=20
+   return result;
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 163696962..5cd092192 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -118,6 +118,8 @@ test954 test955 test956 test957 test958 test959 test=
960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971=
 \
+ test972 \
+ \
++test984 test985 test986 \
++\
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007=
 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015=
 \
+ test1016 test1017 test1018 test1019 test1020 test1021 test1022 test1023=
 \
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
++imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:s=
ecret --ssl-reqd
++</command>
++<file name=3D"log/upload%TESTNUMBER">
++Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST)
++From: Fred Foobar <foobar@example.COM>
++Subject: afternoon meeting
++To: joe@example.com
++Message-Id: <B27397-0100000@example.COM>
++MIME-Version: 1.0
++Content-Type: TEXT/PLAIN; CHARSET=3DUS-ASCII
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
++<data nocheck=3D"yes">
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
++<file name=3D"log/test%TESTNUMBER.txt">
++data
++    to
++      see
++that FTPS
++works
++  so does it?
++</file>
++ <command>
++--ssl-reqd --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/=
test%TESTNUMBER.txt -u user:secret
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
+--=20
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/cve-2021-22947.patch b/meta/r=
ecipes-support/curl/curl/cve-2021-22947.patch
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
+@@ -2743,6 +2743,9 @@ static CURLcode ftp_statemachine(struct Curl_easy =
*data,
+     case FTP_AUTH:
+       /* we have gotten the response to a previous AUTH command */
+=20
++      if(pp->cache_size)
++        return CURLE_WEIRD_SERVER_REPLY; /* Forbid pipelining in respon=
se. */
++
+       /* RFC2228 (page 5) says:
+        *
+        * If the server is willing to accept the named security mechanis=
m,
+diff --git a/lib/imap.c b/lib/imap.c
+index efc0420ce..d1a48d7e3 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -964,6 +964,10 @@ static CURLcode imap_state_starttls_resp(struct Cur=
l_easy *data,
+=20
+   (void)instate; /* no use for this yet */
+=20
++  /* Pipelining in response is forbidden. */
++  if(data->conn->proto.imapc.pp.cache_size)
++    return CURLE_WEIRD_SERVER_REPLY;
++
+   if(imapcode !=3D IMAP_RESP_OK) {
+     if(data->set.use_ssl !=3D CURLUSESSL_TRY) {
+       failf(data, "STARTTLS denied");
+diff --git a/lib/pop3.c b/lib/pop3.c
+index f97e10eab..a06acb7b8 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -772,6 +772,10 @@ static CURLcode pop3_state_starttls_resp(struct Cur=
l_easy *data,
+   CURLcode result =3D CURLE_OK;
+   (void)instate; /* no use for this yet */
+=20
++  /* Pipelining in response is forbidden. */
++  if(data->conn->proto.pop3c.pp.cache_size)
++    return CURLE_WEIRD_SERVER_REPLY;
++
+   if(pop3code !=3D '+') {
+     if(data->set.use_ssl !=3D CURLUSESSL_TRY) {
+       failf(data, "STARTTLS denied");
+diff --git a/lib/smtp.c b/lib/smtp.c
+index 1a3da1559..9b9403b3d 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -835,6 +835,10 @@ static CURLcode smtp_state_starttls_resp(struct Cur=
l_easy *data,
+   CURLcode result =3D CURLE_OK;
+   (void)instate; /* no use for this yet */
+=20
++  /* Pipelining in response is forbidden. */
++  if(data->conn->proto.smtpc.pp.cache_size)
++    return CURLE_WEIRD_SERVER_REPLY;
++
+   if(smtpcode !=3D 220) {
+     if(data->set.use_ssl !=3D CURLUSESSL_TRY) {
+       failf(data, "STARTTLS denied, code %d", smtpcode);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 5cd092192..c524b993e 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -118,7 +118,7 @@ test954 test955 test956 test957 test958 test959 test=
960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971=
 \
+ test972 \
+ \
+-test984 test985 test986 \
++test980 test981 test982 test983 test984 test985 test986 \
+ \
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007=
 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015=
 \
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
++REPLY STARTTLS 454 currently unavailable\r\n235 Authenticated\r\n250 2.=
1.0 Sender ok\r\n250 2.1.5 Recipient ok\r\n354 Enter mail\r\n250 2.0.0 Ac=
cepted
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
++smtp://%HOSTIP:%SMTPPORT/%TESTNUMBER --mail-rcpt recipient@example.com =
--mail-from sender@example.com -u user:secret --ssl --sasl-ir -T -
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
++REPLY STARTTLS A002 BAD currently unavailable\r\nA003 OK Authenticated\=
r\nA004 OK Accepted
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
++imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:s=
ecret --ssl
++</command>
++<file name=3D"log/upload%TESTNUMBER">
++Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST)
++From: Fred Foobar <foobar@example.COM>
++Subject: afternoon meeting
++To: joe@example.com
++Message-Id: <B27397-0100000@example.COM>
++MIME-Version: 1.0
++Content-Type: TEXT/PLAIN; CHARSET=3DUS-ASCII
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
++REPLY STLS -ERR currently unavailable\r\n+OK user accepted\r\n+OK authe=
nticated
++REPLY PASS -ERR Authentication credentials invalid
++</servercmd>
++<data nocheck=3D"yes">
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
++REPLY AUTH 500 unknown command\r\n500 unknown command\r\n331 give passw=
ord\r\n230 Authenticated\r\n257 "/"\r\n200 OK\r\n200 OK\r\n200 OK\r\n226 =
Transfer complete
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
++<file name=3D"log/test%TESTNUMBER.txt">
++data
++    to
++      see
++that FTPS
++works
++  so does it?
++</file>
++ <command>
++--ssl --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/test%=
TESTNUMBER.txt -u user:secret -P %CLIENTIP
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
+--=20
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-supp=
ort/curl/curl_7.78.0.bb
index dece0babb2..3f736d8da6 100644
--- a/meta/recipes-support/curl/curl_7.78.0.bb
+++ b/meta/recipes-support/curl/curl_7.78.0.bb
@@ -11,6 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D425f6fdc767c=
c067518eef9bbdf4ab7b"
=20
 SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://cve-2021-22945.patch \
+           file://cve-2021-22946.patch \
+           file://cve-2021-22947.patch \
 "
=20
 SRC_URI[sha256sum] =3D "98530b317dc95ccb324bbe4f834f07bb642fbc393b794ddf=
3434f246a71ea44a"
--=20
2.25.1


