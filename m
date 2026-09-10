Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1103C88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:24 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=SyN7ALI8;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3090; q=dns/txt;
  s=NAESA-Selector1; t=1789047257; x=1820583257;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TzeqR2uO1SvOpb0Reg/G/YfYgon9qgXw7++PyTvfyfk=;
  b=SyN7ALI85S0pz2hgKypEPx3/nPWD054N8DryqKICh/6HEs36sV8ws1yZ
   m7BQ17aHD0bETzhDBuCn2jGufJGhs+y8vU63Yvu9c1nhUM2aLfl9TAjkH
   qv43EDqcO3Pj1JYCNDbUhTBjnA1IiW8oWzhbZQGmPtkmeHZLJn0d2FoFh
   qlPcaEkAPCbo9IFt5tDKUPmumd6qx52cMylcMUZajwso1dwHXD4a/N04e
   Ynsx+RCZQIyxbubIWrCLvuBiNjtnreS7xfli0R/TGDyWgKy1/1vGDsyrj
   +Bbk1jsirGn8sqFMjRk2SXxIhFEV30J5b34OzDczqz47WHnBC2nnwHzPn
   g==;
X-CSE-ConnectionGUID: eSx63tzJSOiOKOMzxwamIw==
X-CSE-MsgGUID: 8kPpfTIzS8KJLnsiHY70dA==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105813"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:15 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 07/10] ffmpeg: Fix for CVE-2026-65703
Date: Thu, 10 Sep 2026 19:01:41 +0530
Message-ID: <20260910133357.452394-7-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245576

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fd3ee52fab34d98a95b787d0b5ff45685766200c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65703

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-65703.patch        | 47 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch
new file mode 100644
index 0000000000..67c319f17e
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65703.patch
@@ -0,0 +1,47 @@
+From d15f021e27bd2eb4b7aaeb4cc4f2f49ec3435f48 Mon Sep 17 00:00:00 2001
+From: Cloud-LHY <security@clouditera.com>
+Date: Fri, 10 Jul 2026 04:07:04 +0200
+Subject: [PATCH 5/9] avcodec/tdsc: unref the reference frame before
+ reallocating on size change
+
+Fixes: out of array access
+Fixes: tdsc_poc/ffmpeg-tdsc-linesize-report/poc.avi / gen_poc.py
+Fixes: tdsc_resize_jpeg_oob.avi / tdsc-resize-stale-linesize-jpeg-oob-generate-poc.py
+Fixes: p9xG4xGf9P7H
+Fixes: HQL7a1WgTdHZ
+Found-by: Cloud-LHY / Clouditera Security, Z.ai Security, NSFOCUS
+Found-by: Adrian Junge (vurlo)
+
+CVE: CVE-2026-65703
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fd3ee52fab34d98a95b787d0b5ff45685766200c]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/tdsc.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/tdsc.c b/libavcodec/tdsc.c
+index 8baf8e9..ecd67da 100644
+--- a/libavcodec/tdsc.c
++++ b/libavcodec/tdsc.c
+@@ -482,11 +482,15 @@ static int tdsc_parse_tdsf(AVCodecContext *avctx, int number_tiles)
+             return ret;
+         init_refframe = 1;
+     }
+-    ctx->refframe->width  = ctx->width  = w;
+-    ctx->refframe->height = ctx->height = h;
++    ctx->width  = w;
++    ctx->height = h;
+ 
+     /* Allocate the reference frame if not already done or on size change */
+     if (init_refframe) {
++        av_frame_unref(ctx->refframe);
++        ctx->refframe->format = avctx->pix_fmt;
++        ctx->refframe->width  = w;
++        ctx->refframe->height = h;
+         ret = av_frame_get_buffer(ctx->refframe, 0);
+         if (ret < 0)
+             return ret;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 8d9e975721..7f0cdd4577 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64833.patch \
            file://CVE-2026-64834.patch \
            file://CVE-2026-64835.patch \
+           file://CVE-2026-65703.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


