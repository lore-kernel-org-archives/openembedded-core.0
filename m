Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DF7C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:27 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=mRQni9oe;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3137; q=dns/txt;
  s=NAESA-Selector1; t=1789560797; x=1821096797;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=93o5dwEyMu3DBrUctgglcpBqqeoGFSvdQ5f8ntigxr8=;
  b=mRQni9oeqmC8QgZU2PK6exu5Hco4wNW50t2kQp5Ye/WoM5R0M62s2Mnv
   VZhQOVTYtghnu62XRil5wqhf1iDi/BkkUBTWlCLlPg0YjJmsC6DGsuZVn
   IdlpFQVuZSXf2UGbHnlzsoAFYo7PPunTRyqQQuBI/Omg4e5YXQ2Y0JqJJ
   un8IrF7OG8XcW40np5ATEXDLLPHLTvZVBCK3Oi+ALxcehQYbnLnmqGFGy
   WWHUM/l+BZit1hnXUclmuAyJ27ZTjNqT2O4w7M2ygDiE151ioUtvYJglb
   UtWK3FaM45tVUOskeCRkiTh/7y03Gr01CzisXjT85puyL8MTqQxtplX3a
   w==;
X-CSE-ConnectionGUID: ExRpxpuVTGeRB9mWG5hUxA==
X-CSE-MsgGUID: 6mYC9eIoSdeXZ3/CwFMtag==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580033"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:16 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 07/10] ffmpeg: Fix for CVE-2026-65703
Date: Wed, 16 Sep 2026 17:39:30 +0530
Message-ID: <20260916121258.1699611-7-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245961

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fd3ee52fab34d98a95b787d0b5ff45685766200c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65703

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- rebased on new CVE fix
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
index 8d3b0dd79e..8be6b423f7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64833.patch \
            file://CVE-2026-64834.patch \
            file://CVE-2026-64835.patch \
+           file://CVE-2026-65703.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


