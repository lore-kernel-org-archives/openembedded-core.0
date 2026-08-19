Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A529C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10421.1787155078770020733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=skEWhBae;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f6609c657so566847f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155077; x=1787759877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KlN0UGFNmi0ipXilab14FMWkIkJ6HF1XLrLB19fdFYc=;
        b=skEWhBaeSlMTf+8mTydio19KzTD3utui+XpltjhL1LTBb1wQw1Igf8wx++wuv3WE3j
         ESj2bW9Nb9HI5XEHirtNi+0yP8MSl9ZAFTzHfpXpN/APRwJaqm2+NdEu7+8HLESgDHe5
         +4zVrLco/erxnl3wFwmCa8rKSnHAVI+3Jgu9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155077; x=1787759877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KlN0UGFNmi0ipXilab14FMWkIkJ6HF1XLrLB19fdFYc=;
        b=lyclddmxFJOePHyNHZI5hkfI+8FYUkiNGwr4V/E53bCViyxqALTQ5Oakf6k0Q4rdSE
         wO4rc6sSPQoqo3JTwtfU9qxd7KU3rDAIeugwdgnffttYEz1yKF+P/42JpG0NlnlDnuVD
         /BHfBujUam3t75CXG8L6bAOFB/rmrgRql++cQFMcCeUprD84oCumkFmVB8nH/HhWs9ap
         g4HdKntcjP7xTyg+CyjTZPCZE/v3IxsyxaYcOJjNMPXt/yO/7T8h0q9psPnN1Wn4jDXK
         MNLahazd/JJSqceTfN1obGRCuiXMG81C+Ir49rwMJxDxs/wFADksIA+TTXo6nGXYCag7
         WuRg==
X-Gm-Message-State: AFuF++luJc9mXAuxJJYvlkmZcvS09B8ADYkV/CXM6hAvcCX+RLamMkCv
	jOSwvkM3kCCI4m1GjASOCQJiuHmEcUnh6cNVMmMRFQI4YHYxiH1LFuRmHOoEGrUL5h+RVu8pE9G
	8+8YTB48=
X-Gm-Gg: AR+sD13y7nj2sAgWkjBV1IiBAWWV8d9JQTv1rEMcOARekq+8jvFBjilFKFSxK9oPAI5
	ayPE2yZ/JGSdNLa8Nw1bGCkdfU1b43lOEfVLEsAx7qU6tO0OJ2YSD/0wxNNPSZkkHjaVM4NSaaU
	Wu8r80nOhkbWJGs2pULTdgxvjTIo728no1719oAkbAgALVqKMYgN+b8qDdsFoVl7ljASkJLz6tY
	UwGZwY5Ka/vmpbx+WXVV9OZBDyIxXZ4znXw35jaeDeEb+uMhmk0ajtNk5H4nS/9HDcymamawMov
	2IYZt09g6c1HQv0haUimj42q1t/5Mxnk/yfPOTHWPQ/kLNCgKb81/IrK6a5llgsAiNnkpNcVtdV
	xPeLa6HCVtX6wOrB8jpGTluaIiY+A8D8H0XDP1l5R5h9YzV7Zqb3b1/BPcmZ/UV8H/Mb553oaGx
	vt0RnuxtxeMfEz8JTr9MLwbnc5n6VK8ClUcJBeTdg4VfwWc1wo+kV5TWomCiPNv0XvjDOgN6rRz
	Topfud+xnGJB2Q2+30r+xWTGg1E10U5PPgkVo1EQIPFA8yVGbbBUwTM2Q0fvlHjhsb1hZoh79Iu
	d+yYpmenpa6y5j1w2oO21VEHLTrT/V+tO+4ntOySsyU3OY8N09k=
X-Received: by 2002:a5d:59a7:0:b0:481:44e5:160c with SMTP id ffacd0b85a97d-482b1e8632emr11535302f8f.2.1787155076827;
        Wed, 19 Aug 2026 08:57:56 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:56 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/37] curl: fix CVE-2026-4873
Date: Wed, 19 Aug 2026 17:57:02 +0200
Message-ID: <7262ee606d93105b8062d8b945f6f2087e45c678.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243767

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4873.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
[2] https://curl.se/docs/CVE-2026-4873.html

(From OE-Core rev: 2dadf65eab0db85eed6bc250753baa0d5ab78660)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-4873.patch             | 58 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
new file mode 100644
index 00000000000..bc6268da7d0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
@@ -0,0 +1,58 @@
+From a7e6dd14ee3900226066819a0334defb58c52486 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 28 Jul 2026 04:35:55 -0700
+Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
+ requires TLS
+
+Reported-by: Arkadi Vainbrand
+
+Closes #21082
+
+CVE: CVE-2026-4873
+Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865]
+
+Backport Changes:
+- Upstream adds req_tls to struct url_conn_match, sets match.req_tls in
+  url_attach_existing(), and enforces it in url_match_ssl_use() when a
+  clear-text requested scheme is matched with a candidate connection
+  that is not actually using TLS.
+- Scarthgap curl 8.7.1 does not have struct url_conn_match or the
+  url_attach_existing()/url_match_ssl_use() split. The equivalent reuse
+  matching still happens directly in ConnectionExists(), so this backport
+  keeps the same state in a local req_tls variable derived from
+  data->set.use_ssl.
+- The rejection check is placed after the general SSL compatibility
+  check and uses Curl_conn_is_ssl(check, FIRSTSOCKET). This preserves
+  valid implicit-TLS IMAPS/POP3S/SMTPS reuse while still rejecting a
+  clear-text STARTTLS-capable cached connection for a request that
+  requires TLS.
+
+(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index 30f215f..c4c5982 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -935,6 +935,7 @@ ConnectionExists(struct Curl_easy *data,
+   /* plain HTTP with upgrade */
+   bool h2upgrade = (data->state.httpwant == CURL_HTTP_VERSION_2_0) &&
+     (needle->handler->protocol & CURLPROTO_HTTP);
++  bool req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
+ 
+   *usethis = NULL;
+   *force_reuse = FALSE;
+@@ -1052,6 +1053,10 @@ ConnectionExists(struct Curl_easy *data,
+         /* except protocols that have been upgraded via TLS */
+         continue;
+ 
++    if(!(needle->handler->flags & PROTOPT_SSL) &&
++       req_tls && !Curl_conn_is_ssl(check, FIRSTSOCKET))
++      continue;
++
+     if(needle->bits.conn_to_host != check->bits.conn_to_host)
+       /* don't mix connections that use the "connect to host" feature and
+        * connections that don't use this feature */
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 7d55f72b03f..c0e5e8f2725 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
+    file://CVE-2026-4873.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

