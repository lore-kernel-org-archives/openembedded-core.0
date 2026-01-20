Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDE5D2ED13
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4242.1768908272292366330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r3vdpZVi;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso49164305e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908270; x=1769513070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4XmcVxtoZGwu7MIe3A5UxcBHlD04m+rvAP56mN5duY=;
        b=r3vdpZViI8G2mwIrRpTrNK9oPCav60rqvixI44FEEne8vGhRvP+zOQdhvVh2nwdfNj
         sLhZnMSASRTo93XFvsXl/rIvcjkie0xLI6YvJY/Lev/iYBhlQcxLaE/5YvSdubx4G4P4
         RJupEyYPCk5UfXVnP1iMZewcKz6+lvSlJ4Es8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908270; x=1769513070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4XmcVxtoZGwu7MIe3A5UxcBHlD04m+rvAP56mN5duY=;
        b=uJXa5sdujeZvUOSLndQIUgY1gCygHlOlWvDfJEKLg2c7nlVcY9bCod51WqQPYlOTJd
         sWhRgL+aCLNPkPWu1XsDU1AjiuczfmbVLi43FyooQH/JLdriHqIhdb6ntkWM1TxZhSip
         17ROrThr/vNexoEyWAFqxjXCLhIzr8nUqHxXzgPnoqKneA4QbBrI3aBsStq0uKsY40Q6
         P95uWpYV1FBLVWOSFnyah7+Swzx6KJ3zksTpPwCA9YYuqWUeZDbOLoG0XJ0Fr1lKZ3lu
         aLyDtNZcVQXrr12D586D8TKSlZMFS9z0ZaQvyse2H6d6tU1NIV8CCUlCMk8o+n79XuZw
         4ngA==
X-Gm-Message-State: AOJu0YyG48grTUDj/nA/VnmqsRYwpQo/TobW2zcPnavHjUYoEIqFduli
	RkCrkmk2R6zrYMHJM8nvlGKSFM7/dtweLsfdRf4u2vG4lzL9ncylF14A+Q9U1jJyT/w/9AN1mUC
	QLfRB
X-Gm-Gg: AY/fxX44Q01NiYoHYukw5WE6iewwOcLKfvKNRrh9W/hmMlAmIwp81L5moAmHUTDIgHF
	DAlzxeKmG0ktJAeURSpmHGG0KcUUsHSJOKjSZo1wLuEeSac/40C+ejPRg+Dg2xHCByJafM9eq0B
	hAehROUSX1si8i8CZdczeQmGNf/yl1KDO5U2Jqge6oAco/ZDkjaymBlB73DiVaMt86IRD+6fQxv
	du5KJVF3Q4n8C982H07nWtubbipUYL1LPtla6gLQn0Ulq2U0nJ1Qk58Yp36iGsXy2lXcOg4EV0j
	twCPYAV7dfw4+WqyCixMyyefSYKGHwutOx/Up5RWB9OE5CNloNEjL3zNKxQ0iXYngJmUzsCOfo8
	rMYbZc7g7TcDJpp3vVOqp/YaHrDGby9F8k5Hu/o/RPoJo2//WKrGpM8DWwoAmQITUSeGDTRURqC
	587/G4DtozD2nb8vejBRQohHsDRYiylRHw1qAdRiAhPW0c6ozfp7c+kJnyyIwxJY+kg9CXE6Ebh
	2DaoCb48xKsqOEGmXRX6A==
X-Received: by 2002:a05:600c:8685:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-4801eb035e1mr119617085e9.18.1768908270444;
        Tue, 20 Jan 2026 03:24:30 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/15] curl: patch CVE-2025-13034
Date: Tue, 20 Jan 2026 12:23:54 +0100
Message-ID: <db4e7bba77db09f1e53a92077a55fb4588fe4f3a.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229669

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-13034.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

