Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADE4C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=d377HHQu;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776678; x=1674312678;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NCX68SwwBpAGsEVEOJ/KtjQeL3HjnsXTUzcAk6z63n8=;
  b=d377HHQuKoE+2XQFbgZJBJIY8HO1CZWuypK9ZbN/vlOrwT2J1el66Chd
   IWs7k2Mezqc9Sg4qXuQxSM6MfRHr1ljw9zSVAdxsYtsz7T2v3N1bkwQiX
   I3sqxLBYPNkh1+R4ws7zM0DYv6xBXpDkgM6Pc8FES0Nxjyd3JVCBtDvAK
   MDk978W9kG6U6lXiOVz/oaLMsBtByo0b0lJRZhxDunD+tlGjq7pI4YfJO
   CZA/jZUEz1xyJ3LFu8PW/P1VzcOlHwY2h8wVO0BvA3vVuyG+r4LFbvt32
   LoWsKtl2tMLN5gKXx28oBU4FW7MnMyc2TDmlPhLkFgeSvikNW0jcuWyhL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886053"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886053"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336689"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/15] curl: Backport CVE fixes
Date: Fri, 21 Jan 2022 22:50:53 +0800
Message-Id: 
 <705718cfe243e05e0975bad3b822666363ef55df.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160836

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Backport fixes for CVE-2021-22922, CVE-2021-22923, CVE-2021-22945,
CVE-2021-22946, and CVE-2021-22947.

 * https://curl.se/docs/CVE-2021-22922.html
 * https://curl.se/docs/CVE-2021-22923.html
 * https://curl.se/docs/CVE-2021-22945.html
 * https://curl.se/docs/CVE-2021-22946.html
 * https://curl.se/docs/CVE-2021-22947.html

22922 and 22923 were fixed by upstream by simply removing metalink
support in newer versions. These are mitigated in older versions by
disabling metalink support, which was already done by the recipe, so
whitelist these CVEs.

22945, 22946, and 22947 are backported with only trivial patch fuzz
modifications.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/CVE-2021-22945.patch            |  35 ++
 .../curl/curl/CVE-2021-22946.patch            | 333 ++++++++++++++++
 .../curl/curl/CVE-2021-22947.patch            | 357 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   8 +
 4 files changed, 733 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22945.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22947.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22945.patch b/meta/rec=
ipes-support/curl/curl/CVE-2021-22945.patch
new file mode 100644
index 0000000000..44c42632ed
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22945.patch
@@ -0,0 +1,35 @@
+From 43157490a5054bd24256fe12876931e8abc9df49 Mon Sep 17 00:00:00 2001
+From: z2_ on hackerone <>
+Date: Tue, 24 Aug 2021 09:50:33 +0200
+Subject: [PATCH] mqtt: clear the leftovers pointer when sending succeeds
+
+CVE-2021-22945
+
+Bug: https://curl.se/docs/CVE-2021-22945.html
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/43157490a50=
54bd24256fe12876931e8abc9df49]
+
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+
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
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22946.patch b/meta/rec=
ipes-support/curl/curl/CVE-2021-22946.patch
new file mode 100644
index 0000000000..1cb95f0ea7
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22946.patch
@@ -0,0 +1,333 @@
+From 7c6e072216001fb1280d1868adfdcb54e3372ce7 Mon Sep 17 00:00:00 2001
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
+
+CVE-2021-22946
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/364f174724e=
f115c63d5e5dc1d3342c8a43b1cca]
+
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+
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
+index 3818a9e..8b3fe1d 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2665,9 +2665,12 @@ static CURLcode ftp_statemachine(struct Curl_easy *=
data,
+     /* we have now received a full FTP server response */
+     switch(ftpc->state) {
+     case FTP_WAIT220:
+-      if(ftpcode =3D=3D 230)
+-        /* 230 User logged in - already! */
+-        return ftp_state_user_resp(data, ftpcode, ftpc->state);
++      if(ftpcode =3D=3D 230) {
++        /* 230 User logged in - already! Take as 220 if TLS required. */
++        if(data->set.use_ssl <=3D CURLUSESSL_TRY ||
++           conn->bits.ftp_use_control_ssl)
++          return ftp_state_user_resp(data, ftpcode, ftpc->state);
++      }
+       else if(ftpcode !=3D 220) {
+         failf(data, "Got a %03d ftp-server response when 220 was expected=
",
+               ftpcode);
+diff --git a/lib/imap.c b/lib/imap.c
+index 2d80699..b056208 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -933,22 +933,18 @@ static CURLcode imap_state_capability_resp(struct Cu=
rl_easy *data,
+       line +=3D wordlen;
+     }
+   }
+-  else if(imapcode =3D=3D IMAP_RESP_OK) {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested */
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
++    if(imapcode =3D=3D IMAP_RESP_OK && imapc->tls_supported && !imapc->pr=
eauth) {
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
+index 0ed3d3e..018fda1 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -738,28 +738,23 @@ static CURLcode pop3_state_capa_resp(struct Curl_eas=
y *data, int pop3code,
+       }
+     }
+   }
+-  else if(pop3code =3D=3D '+') {
+-    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
+-      /* We don't have a SSL/TLS connection yet, but SSL is requested */
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
+index e08cfc7..e6e2551 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -115,6 +115,8 @@ test945 test946 test947 test948 test949 test950 test95=
1 test952 test953 \
+ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971 \
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
++imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:sec=
ret --ssl-reqd
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
++A001 CAPABILITY=0D
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
++CAPA=0D
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
++<file name=3D"log/test%TESTNUMBER.txt">
++data
++    to
++      see
++that FTPS
++works
++  so does it?
++</file>
++ <command>
++--ssl-reqd --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/te=
st%TESTNUMBER.txt -u user:secret
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
++AUTH SSL=0D
++AUTH TLS=0D
++</protocol>
++</verify>
++</testcase>
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22947.patch b/meta/rec=
ipes-support/curl/curl/CVE-2021-22947.patch
new file mode 100644
index 0000000000..9bd9890d72
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22947.patch
@@ -0,0 +1,357 @@
+From f3f2d2554d09ca0e13039e4915b83faaa55961c4 Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Tue, 7 Sep 2021 13:26:42 +0200
+Subject: [PATCH] ftp,imap,pop3,smtp: reject STARTTLS server response
+
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
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8ef147c4364=
6e91fdaad5d0e7b60351f842e5c68]
+
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+
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
+index 8b3fe1d..a55566a 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2727,6 +2727,9 @@ static CURLcode ftp_statemachine(struct Curl_easy *d=
ata,
+     case FTP_AUTH:
+       /* we have gotten the response to a previous AUTH command */
+=20
++      if(pp->cache_size)
++        return CURLE_WEIRD_SERVER_REPLY; /* Forbid pipelining in response=
. */
++
+       /* RFC2228 (page 5) says:
+        *
+        * If the server is willing to accept the named security mechanism,
+diff --git a/lib/imap.c b/lib/imap.c
+index b056208..9230f17 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -962,6 +962,10 @@ static CURLcode imap_state_starttls_resp(struct Curl_=
easy *data,
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
+index 018fda1..4f953f7 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -769,6 +769,10 @@ static CURLcode pop3_state_starttls_resp(struct Curl_=
easy *data,
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
+index 1fc8800..51445f6 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -832,6 +832,10 @@ static CURLcode smtp_state_starttls_resp(struct Curl_=
easy *data,
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
+index e6e2551..22d7a0b 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -115,7 +115,7 @@ test945 test946 test947 test948 test949 test950 test95=
1 test952 test953 \
+ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
+ test963 test964 test965 test966 test967 test968 test969 test970 test971 \
+ \
+-test984 test985 test986 \
++test980 test981 test982 test983 test984 test985 test986 \
+ \
+ test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
+ test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
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
++REPLY STARTTLS 454 currently unavailable\r\n235 Authenticated\r\n250 2.1.=
0 Sender ok\r\n250 2.1.5 Recipient ok\r\n354 Enter mail\r\n250 2.0.0 Accept=
ed
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
++smtp://%HOSTIP:%SMTPPORT/%TESTNUMBER --mail-rcpt recipient@example.com --=
mail-from sender@example.com -u user:secret --ssl --sasl-ir -T -
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
++EHLO %TESTNUMBER=0D
++STARTTLS=0D
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
++REPLY STARTTLS A002 BAD currently unavailable\r\nA003 OK Authenticated\r\=
nA004 OK Accepted
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
++imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:sec=
ret --ssl
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
++A001 CAPABILITY=0D
++A002 STARTTLS=0D
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
++REPLY STLS -ERR currently unavailable\r\n+OK user accepted\r\n+OK authent=
icated
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
++CAPA=0D
++STLS=0D
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
++REPLY AUTH 500 unknown command\r\n500 unknown command\r\n331 give passwor=
d\r\n230 Authenticated\r\n257 "/"\r\n200 OK\r\n200 OK\r\n200 OK\r\n226 Tran=
sfer complete
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
++--ssl --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/test%TE=
STNUMBER.txt -u user:secret -P %CLIENTIP
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
++AUTH SSL=0D
++</protocol>
++</verify>
++</testcase>
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-suppor=
t/curl/curl_7.75.0.bb
index d64e5e1f79..accede604c 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -21,6 +21,9 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar=
.bz2 \
            file://CVE-2021-22901.patch \
            file://CVE-2021-22924.patch \
            file://CVE-2021-22926.patch \
+           file://CVE-2021-22945.patch \
+           file://CVE-2021-22946.patch \
+           file://CVE-2021-22947.patch \
 "
=20
 SRC_URI[sha256sum] =3D "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01=
869effb316d026"
@@ -28,6 +31,10 @@ SRC_URI[sha256sum] =3D "50552d4501c178e4cc68baaecc487f46=
6a3d6d19bbf4e50a01869effb3
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:lib=
curl daniel_stenberg:curl"
=20
+# These only apply when using --with-libmetalink, but --without-libmetalin=
k is
+# set below.
+CVE_CHECK_WHITELIST +=3D "CVE-2021-22922 CVE-2021-22923"
+
 inherit autotools pkgconfig binconfig multilib_header
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnu=
tls libidn proxy threaded-resolver verbose zlib"
@@ -65,6 +72,7 @@ PACKAGECONFIG[threaded-resolver] =3D "--enable-threaded-r=
esolver,--disable-threade
 PACKAGECONFIG[verbose] =3D "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] =3D "--with-zlib=3D${STAGING_LIBDIR}/../,--without-zli=
b,zlib"
=20
+# Keep --without-libmetalink to mitigate CVE-2021-22922 and CVE-2021-22923
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
--=20
2.34.1


