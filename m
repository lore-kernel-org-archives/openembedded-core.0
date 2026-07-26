Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDB8C54F51
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7385.1785054621367517200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VIVB7dZ7;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso20823605e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054620; x=1785659420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gjq2aOZaq76IevpkTF/w1892rKfhTFgPax/xdbx00TY=;
        b=VIVB7dZ7Qh/J37heaTo6TKaLEN8QbnNIwRQQW0peGH9qp2M9XX9jWw41tLLrP9MxEC
         a0Nz3WTPdsWqLXKJA6CSyIjFj2OwoAr7OzwA4Gg/NyZtoSYtxBe6GFEVGh7xHXH/IVe1
         YAxDi0zxWwT02jiE7F15mwd+iylUbatsSiItw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054620; x=1785659420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gjq2aOZaq76IevpkTF/w1892rKfhTFgPax/xdbx00TY=;
        b=VFu7T3uWhmbgYDXn2UMwfyAuzb7feSitdIMPf6bF1f/73pMvOiSDjvk90nASwwCKZy
         xPzxJK0j72OaU4qDNvsfk9Z8p2EyeUg6SiCFl1npj3Vp7Nhcvu//OFEKYYKwUcuUiTJJ
         pqeqIQgYjjG6A0R2J9E5CfyApyUzaaYtcVQ0/zuHBGd2tEpbA2/KDeKe76+V+swkMbXK
         AMdxxLbTjs1X/N3/HKHQey+YIfWHtQtQYglGJpNI7f8z0LeBmHQF23pMuNQxrnn0VEBC
         fzMFR/hiTrQMYqtktEuXDMOhL1VPyFegW0wI301oYANVU1fcU7daB4/aT8XzRWv3c0EU
         8BjQ==
X-Gm-Message-State: AOJu0YwSsTCo8fugfhizq0eNox1ZfXKDzFBangfwKx+JslzI3R6g2ZXt
	5NKYOBhrdw2kEOaj43ONKSmuewhCkEI/TXSGAcEZMy5HIKqcN/0Gg1C1Mh8OGxMf8bRaBPZc4CY
	mqJsisws=
X-Gm-Gg: AR+sD102Jq3gcIq5aadMlXzezOMnfXrmo3JHKQYUeH5YTVxBAxeroWFkMDh0oYgI2OT
	0sdgFEOJqdh60sYrmCGDJ5pxSS/wglnIwJTiA4D5xrgEKvEJXhg7MGoQcOGvrtcJ5EwC39kwkLH
	O/qFI4dFbVeLSZ7PpiumHIbk9FIMcrH0QMb0ljVO33XidUtU3kjrLEw77t3GF1/Yu1w/N7pHg/u
	6nYAb2ESX8IGP2LHPa2cjhF1O5nR6UzxYtlqdN9Ubjk14kM6qclaYNab/835jTtJSTlf7W2dxaz
	YIrbCRUd2p9rcg7ajs9ZLLqVJCa2h3zqmGfIi4oc3F2ZeAK96FVZ8kM8XTeY3Z5u+tEEWLoa88D
	FCGlU83z55FWT0UYvTQUmj8uu7zOtMzVcrnoSa1UUJyrJrrIE5d/6dsFlrUdaVpWx2KiS9Rnock
	AAFxoOnhpaMhjGKC54uAcZYvI15xGJYp53zgYA9T0TnGhUQNNbae7xG3EhYR9/po3vBfVVJHZ/k
	GpUfg==
X-Received: by 2002:a05:600c:3b27:b0:495:3c6d:f294 with SMTP id 5b1f17b1804b1-496b5717d1bmr55835925e9.23.1785054619589;
        Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/31] cups: fix CVE-2026-34979
Date: Sun, 26 Jul 2026 10:29:41 +0200
Message-ID: <7aaebb1682f0ea5f75860523efdef6fefda16307.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241999

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214
[2] https://security-tracker.debian.org/tracker/CVE-2026-34979

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34979.patch            | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 7a8b845953c..a0ac1a26129 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -28,6 +28,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34980-regression_p1.patch \
            file://CVE-2026-34980-regression_p2.patch \
+           file://CVE-2026-34979.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34979.patch b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
new file mode 100644
index 00000000000..38ac7b6e918
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
@@ -0,0 +1,61 @@
+From 471b4dc802455c7c59f9fd594fec8b6f3acb0db5 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:50:06 -0400
+Subject: [PATCH] Expand allocation of options string.
+
+CVE: CVE-2026-34979
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214]
+
+Backport Changes:
+- Rebase scheduler/job.c IPP length context to the CUPS 2.4.11 source
+  carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+
+(cherry picked from commit 0ff8897367c7341f2500770c3977038cdd7c0214)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ scheduler/job.c |   16 ++++------------
+ 1 file changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 915ba94..880c25f 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4195,18 +4195,6 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+   for (attr = ipp->attrs; attr != NULL; attr = attr->next)
+   {
+-   /*
+-    * Skip attributes that won't be sent to filters...
+-    */
+-
+-    if (attr->value_tag == IPP_TAG_NOVALUE ||
+-	attr->value_tag == IPP_TAG_MIMETYPE ||
+-	attr->value_tag == IPP_TAG_NAMELANG ||
+-	attr->value_tag == IPP_TAG_TEXTLANG ||
+-	attr->value_tag == IPP_TAG_URI ||
+-	attr->value_tag == IPP_TAG_URISCHEME)
+-      continue;
+-
+    /*
+     * Add space for a leading space and commas between each value.
+     * For the first attribute, the leading space isn't used, so the
+@@ -4282,10 +4270,14 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+       case IPP_TAG_TEXT :
+       case IPP_TAG_NAME :
++      case IPP_TAG_TEXTLANG :
++      case IPP_TAG_NAMELANG :
++      case IPP_TAG_MIMETYPE :
+       case IPP_TAG_KEYWORD :
+       case IPP_TAG_CHARSET :
+       case IPP_TAG_LANGUAGE :
+       case IPP_TAG_URI :
++      case IPP_TAG_URISCHEME :
+          /*
+ 	  * Strings can contain characters that need quoting.  We need
+ 	  * at least 2 * len + 2 characters to cover the quotes and
+-- 
+2.43.7
+

