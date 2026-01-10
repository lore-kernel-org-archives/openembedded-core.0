Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FCBD277FB
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12827.1768066626224847114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OuVzPtbD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260110173704683b9cd9cc00020777-2yeffg@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260110173704683b9cd9cc00020777
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SFfMrLU9H4T/pA5/k2B6NsF4CMnQvsoKTpQrXkxSYhY=;
 b=OuVzPtbDZPJInjeox30FZKeJ99AVdr1xqhqL5IohBlJL1NmUrBPoYL/lFJqj/e/xrmx7/B
 YADvpW9SCxVPi1XtJys9+7Tm30YnrQPoIYeDUP22CJcTKZ4qt+BX+iLrHuk4rX2FsRIW6zDg
 Sy/89+/uP2N4PdQ8u4mz/V7/SHw+6Uzc3pJdoJRTqC0b57webN9U29TvNpHf0E3fCYQWmBVQ
 GAFTawUbYUTZHPOwmaVmiveUxhYqjdZYMqTqtazcdaCX0hDKANvZSFmSS8GA041r7TrRWkPi
 u5o2cT/yDUy0G5KxXBRQnr62RhTR3vw0HlIRnfiwbcIPyod3Ht2fS6cQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 3/6] curl: patch CVE-2025-14524
Date: Sat, 10 Jan 2026 18:36:36 +0100
Message-Id: <20260110173639.1643322-3-peter.marko@siemens.com>
In-Reply-To: <20260110173639.1643322-1-peter.marko@siemens.com>
References: <20260110173639.1643322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229154

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-14524.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

