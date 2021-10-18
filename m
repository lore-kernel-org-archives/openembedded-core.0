Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B32C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 09:06:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.34228.1634548018858258816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19I96tj9024769
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 18 Oct 2021 02:06:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19I96tFE003038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 02:06:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 02:06:55 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 02:06:54 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] curl: fix CVE-2021-22945 through -22947
Date: Mon, 18 Oct 2021 17:06:09 +0800
Message-ID: <20211018090609.7940-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 09:06:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157052

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix below CVEs:
 - CVE-2021-22945
 - CVE-2021-22946
 - CVE-2021-22947

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/CVE-2021-22945.patch            |  36 +++++
 .../curl/curl/CVE-2021-22946.patch            | 133 ++++++++++++++++++
 .../curl/curl/CVE-2021-22947.patch            |  91 ++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   3 +
 4 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22945.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22947.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22945.patch b/meta/recipes-support/curl/curl/CVE-2021-22945.patch
new file mode 100644
index 0000000000..f5a7d38fa1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22945.patch
@@ -0,0 +1,36 @@
+From 43157490a5054bd24256fe12876931e8abc9df49 Mon Sep 17 00:00:00 2001
+From: z2_ on hackerone <>
+Date: Tue, 24 Aug 2021 09:50:33 +0200
+Subject: [PATCH] mqtt: clear the leftovers pointer when sending succeeds
+
+CVE-2021-22945
+
+Bug: https://curl.se/docs/CVE-2021-22945.html
+
+CVE: CVE-2021-22945
+
+Upstream-Status: Backport[https://github.com/curl/curl/commit/43157490a5054bd24256fe12876931e8abc9df49]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
+2.17.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22946.patch b/meta/recipes-support/curl/curl/CVE-2021-22946.patch
new file mode 100644
index 0000000000..0302b7bfa3
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22946.patch
@@ -0,0 +1,133 @@
+From 364f174724ef115c63d5e5dc1d3342c8a43b1cca Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2021-22946
+
+Upstream-Status: Backport[https://github.com/curl/curl/commit/364f174724ef115c63d5e5dc1d3342c8a43b1cca]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/ftp.c               |  9 ++++---
+ lib/imap.c              | 24 ++++++++----------
+ lib/pop3.c              | 33 +++++++++++-------------
+ 7 files changed, 32 insertions(+), 36 deletions(-)
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
+index 359fc692e..923b1d59b 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -934,22 +934,18 @@ static CURLcode imap_state_capability_resp(struct Curl_easy *data,
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
+index d7b5283e1..a331d71f7 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -740,28 +740,23 @@ static CURLcode pop3_state_capa_resp(struct Curl_easy *data, int pop3code,
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
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2021-22947.patch b/meta/recipes-support/curl/curl/CVE-2021-22947.patch
new file mode 100644
index 0000000000..36eb02219c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22947.patch
@@ -0,0 +1,91 @@
+From 8ef147c43646e91fdaad5d0e7b60351f842e5c68 Mon Sep 17 00:00:00 2001
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
+CVE-2021-22947
+
+Bug: https://curl.se/docs/CVE-2021-22947.html
+
+CVE: CVE-2021-22947
+
+Upstream-Status: Backport[https://github.com/curl/curl/commit/8ef147c43646e91fdaad5d0e7b60351f842e5c68]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/ftp.c               |  3 +++
+ lib/imap.c              |  4 +++
+ lib/pop3.c              |  4 +++
+ lib/smtp.c              |  4 +++
+ 4 files changed, 16 insertions(+), 1 deletion(-)
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
+index 923b1d59b..6163899bb 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -963,6 +963,10 @@ static CURLcode imap_state_starttls_resp(struct Curl_easy *data,
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
+index a331d71f7..d3f3de6d4 100644
+--- a/lib/pop3.c
++++ b/lib/pop3.c
+@@ -771,6 +771,10 @@ static CURLcode pop3_state_starttls_resp(struct Curl_easy *data,
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
+index 20dc85a5f..02ddaca0a 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -834,6 +834,10 @@ static CURLcode smtp_state_starttls_resp(struct Curl_easy *data,
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
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index d64e5e1f79..d9818b6f07 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -21,6 +21,9 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2021-22901.patch \
            file://CVE-2021-22924.patch \
            file://CVE-2021-22926.patch \
+           file://CVE-2021-22945.patch \
+           file://CVE-2021-22946.patch \
+           file://CVE-2021-22947.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.17.1


