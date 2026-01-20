Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D23ED2ED1D
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4166.1768908273503879804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fxEgNR3Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4638887f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908272; x=1769513072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c01D/i4oW4SDXN+QEBgr4YOMlMNO/06UoXQ9QD8PhUw=;
        b=fxEgNR3ZxW4dFxG31EVtvHCXLQiTEf7bD7g6SiOeMSS8tFT9T5kMbtSBIFQHd9LvAm
         rGksOFpZrRHx2VDEiV2ziHLPmafw3FDY+b0Dhx9OwmUMg2vxJ2mS37Yn8nyxKF0E2uSq
         lNQbFTqJQ9XsG/HJLP3OTi8R+Y9w2Gwj+ndsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908272; x=1769513072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c01D/i4oW4SDXN+QEBgr4YOMlMNO/06UoXQ9QD8PhUw=;
        b=Ut7ezooWGqZmUtJ9IrSHtskkop8hiSnxXUfHQh4Lsqg1VHwm1yFjSJToAnX1gH7+UE
         ZJXtlKJsKeheMjA8YN0fTuE1wKe9+7NK2XqRxHOaXCl/+4cW/54mceHz0rlwL0HJ+Zx9
         AJbK7ewKHVIPvP6ORsEMIe56leyUcy9Uvz/ne+aj810YhNe+PTNUyZguLNEIZhg+d4dx
         GlF/7+xUMSs24TAgeuDdMB6Y5ldUNCUMiH4eAiKcIC++Af4W0HXac8VsyV1PzC7+NA6r
         oWJx7dx9t5Hs6KmnaVJZuqGyFOCks6LUV1Hx2TjG1gGRsY8cQqMWZXgbukrleMqnJ7tQ
         N5ug==
X-Gm-Message-State: AOJu0YxPZ3NlTXZSOWcM8N/Yiz5QyNKMdc7tssyFN1t697LFoEF7hsER
	2myspzeMJZ4wlP9GNC7+DOMmhFvwsV9aRi3U/neJRP8YrJ1nkvMm0EPZjssC+UHP0pXakZLzU6Z
	wD2A+
X-Gm-Gg: AZuq6aK4slwDZtQkJ+bdQTVR7O6nGPAkZ4ZK7DB+384nMFtl00za8hY4lLisbZdQHeT
	AQA8yHbI4qls3qV8NP9Vab1h9+y8XRXmtXQT9Hnvr1M75nU5P/uWG75pLMKorZPgdrf0HJjYgF0
	DGAae91olDELwA4A1AbjYztHckS+OFSvrmwKm1DV0h06bT+Md7nJcLmyxKsexm28iTAcIft02jA
	CsMHwx/G5FNGT+ZMmd3R0zYjUuD5R9AWSCfYF1T4VDei8+QKNBcVIinGqj8eBdwGYG563nJnEeg
	cDJLsm7VToxf4Xyjuyv+6dtSmZAeiRebNYZWLb8dUGcHkKlh4dkoYIDvlfeXgYyToB19t4e/vGZ
	WttDFLePJaM5BW4XdxxTQujAgyAabcVOsQ10lVB0Vgw1cZzzeFieNhZ9uI3LEvm8q+CetVY5CwW
	swxcFf2kC9k6shPl/t2wi5G6IW25hCrIe+fWzFmC2siQ9K/SA78CX6kxnRbvd+zTzJGyqS7E4/n
	rBb8IKFC6OB3OLOTFwpwkEKqKlUPpv7
X-Received: by 2002:a05:6000:400f:b0:431:8f8:7f31 with SMTP id ffacd0b85a97d-43569bd6a3fmr20280275f8f.56.1768908271603;
        Tue, 20 Jan 2026 03:24:31 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/15] curl: patch CVE-2025-14524
Date: Tue, 20 Jan 2026 12:23:56 +0100
Message-ID: <9c1402e7b38194b7daf1ddffe79a5f8dfe3d3ae4.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229671

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14524.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-14524.patch            | 40 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 0000000000..c70dd0a04d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,40 @@
+From 1a822275d333dc6da6043497160fd04c8fa48640 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use bearer
+
+Closes #19933
+
+CVE: CVE-2025-14524
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 3e4bafc19a..b93bafbefa 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -456,7 +456,9 @@ static bool sasl_choose_ntlm(struct Curl_easy *data, struct sasl_ctx *sctx)
+ 
+ static bool sasl_choose_oauth(struct Curl_easy *data, struct sasl_ctx *sctx)
+ {
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+ 
+   if(sctx->user && oauth_bearer &&
+      (sctx->enabledmechs & SASL_MECH_OAUTHBEARER)) {
+@@ -481,7 +483,9 @@ static bool sasl_choose_oauth(struct Curl_easy *data, struct sasl_ctx *sctx)
+ 
+ static bool sasl_choose_oauth2(struct Curl_easy *data, struct sasl_ctx *sctx)
+ {
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+ 
+   if(sctx->user && oauth_bearer &&
+      (sctx->enabledmechs & SASL_MECH_XOAUTH2)) {
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index e0a9bae23d..ad9b7c9ab7 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://no-test-timeout.patch \
     file://CVE-2025-13034.patch \
     file://CVE-2025-14017.patch \
+    file://CVE-2025-14524.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

