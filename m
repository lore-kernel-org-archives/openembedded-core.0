Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB449D277F9
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:05 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12761.1768066620059768606
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=APJz0Z06;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202601101736569e332be16d000207f3-rkvsx0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202601101736569e332be16d000207f3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:36:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+Y5XUgRgSxkKH4Wci8llsJOuymOvU3nONrQkiRXM7EY=;
 b=APJz0Z06/obx/meNtdRWrI7Zm7ZLua09iMnDikpdGIqlwa+UbfIc6tD7PE9Xza2kSGiY/j
 KNpgmOateOYNtbyZ3bRUtbISgKJCnXalf0FVxEZjBx255+dOnerSFLTrH3s27bncxoj3JFJr
 DEN5UItD/6yuFObLOZkcH/YU50ZOWfTdOS0q4IMx/V3YfLCvV7hIot9qsrwF59NJuzBCvJKq
 oPxtDBivZr0DSetUaQKFfUc/N58PHAWGuL/PwtUU+Nj/lebBZTTIIcDDP3P8UzjephAMcanD
 CpJfpThX7seORt/njW0VeLTfDwVHp/ZZEMjP3XBGO1N0f9l9i4uyZVSg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 1/6] curl: patch CVE-2025-13034
Date: Sat, 10 Jan 2026 18:36:34 +0100
Message-Id: <20260110173639.1643322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229152

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-13034.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-13034.patch            | 37 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-13034.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-13034.patch b/meta/recipes-support/curl/curl/CVE-2025-13034.patch
new file mode 100644
index 0000000000..0c3fe42509
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-13034.patch
@@ -0,0 +1,37 @@
+From 3d91ca8cdb3b434226e743946d428b4dd3acf2c9 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 14 Nov 2025 16:42:23 +0100
+Subject: [PATCH] vquic-tls/gnutls: call Curl_gtls_verifyserver unconditionally
+
+Closes #19531
+
+CVE: CVE-2025-13034
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3d91ca8cdb3b434226e743946d428b4dd3acf2c9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vquic/vquic-tls.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/lib/vquic/vquic-tls.c b/lib/vquic/vquic-tls.c
+index f4ef06c33b..46bb4c7d4c 100644
+--- a/lib/vquic/vquic-tls.c
++++ b/lib/vquic/vquic-tls.c
+@@ -168,13 +168,11 @@ CURLcode Curl_vquic_tls_verify_peer(struct curl_tls_ctx *ctx,
+   (void)conn_config;
+   result = Curl_ossl_check_peer_cert(cf, data, &ctx->ossl, peer);
+ #elif defined(USE_GNUTLS)
+-  if(conn_config->verifyhost) {
+-    result = Curl_gtls_verifyserver(cf, data, ctx->gtls.session,
+-                                    conn_config, &data->set.ssl, peer,
+-                                    data->set.str[STRING_SSL_PINNEDPUBLICKEY]);
+-    if(result)
+-      return result;
+-  }
++  result = Curl_gtls_verifyserver(cf, data, ctx->gtls.session,
++                                  conn_config, &data->set.ssl, peer,
++                                  data->set.str[STRING_SSL_PINNEDPUBLICKEY]);
++  if(result)
++    return result;
+ #elif defined(USE_WOLFSSL)
+   (void)data;
+   if(conn_config->verifyhost) {
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 352f407d28..edae6ebb95 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2025-13034.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

