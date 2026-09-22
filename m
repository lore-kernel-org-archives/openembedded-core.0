Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E819C98306
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:02:29 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4480.1790060539506240679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=j/G5zlTR;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3308; q=dns/txt;
  s=NAESA-Selector1; t=1790060546; x=1821596546;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=29NHfsJvxt+2CJhlQu9gkBYwwEHzcRQuWyU2S+47q0E=;
  b=j/G5zlTRlBrzCNBWZ/NFIF8jzJj0dGLz+aHmB+D2qKzioPksj+v9tfLx
   yKh+QTmKkj9uJQnL41IBoqUPG1y3Dh/riCRuBSJ7jVe5gdx8r60cfNJN8
   03rEe2y9cXFy3V2Sz3blNyu83DvMHKZdcSV4Mc9qb9nt93YaIjeZ0BDTd
   RWuGT4TrNS1PsXeXFAVa7Li+W0lH3ocMVgeMr2URzHDDPxrXhuVuFCYj8
   0hm7bekvIFqP+JcZyfYUvrgCg3ESk7u/sdDRaVGW7JQCZNuukv7y27XOM
   ZmMpB2k/nS5Yva1R31ETlhbfrnuNdmNBWuMQy/e7RJ2sIWrlYABRXTKhB
   Q==;
X-CSE-ConnectionGUID: vKoEkl/UTk6VeOcXOubaJg==
X-CSE-MsgGUID: /xSWxVVFSxKtmHmnCgLg0w==
X-IronPort-AV: E=Sophos;i="6.27,116,1787032800"; 
   d="scan'208";a="63995900"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 22 Sep 2026 01:02:25 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for CVE-2026-66041
Date: Tue, 22 Sep 2026 12:31:29 +0530
Message-ID: <20260922070209.2770399-5-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246386

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d62a8875cfa8eb39b5e20f5
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66041

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-66041.patch        | 60 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
new file mode 100644
index 0000000000..7a8c4e0c8b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
@@ -0,0 +1,60 @@
+From 9db6b5816516b85e981e177863b2eb361dbec3c8 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 28 Jun 2026 15:33:38 +0200
+Subject: [PATCH] avfilter/vf_quirc: resize the quirc buffers when the input
+ size changes
+
+Fixes: out of array access
+Fixes: JbvzNObhorBp
+Fixes: 030e140145 (lavfi: add quirc filter)
+Found-by: Adrian Junge (vurlo)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-66041
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d62a8875cfa8eb39b5e20f5]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavfilter/vf_quirc.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/libavfilter/vf_quirc.c b/libavfilter/vf_quirc.c
+index 59dc84caa8..d2ba48e7bc 100644
+--- a/libavfilter/vf_quirc.c
++++ b/libavfilter/vf_quirc.c
+@@ -36,6 +36,7 @@ typedef struct QuircContext {
+     const AVClass *class;
+ 
+     struct quirc *quirc;
++    int width, height;
+ } QuircContext;
+ 
+ static av_cold int init(AVFilterContext *ctx)
+@@ -67,6 +68,8 @@ static int config_input(AVFilterLink *inlink)
+     if (err == -1) {
+         return AVERROR(ENOMEM);
+     }
++    quirc->width  = inlink->w;
++    quirc->height = inlink->h;
+ 
+     return 0;
+ }
+@@ -80,6 +83,15 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *frame)
+     int codes_count;
+     uint8_t *image;
+ 
++    if (quirc->width != inlink->w || quirc->height != inlink->h) {
++        if (quirc_resize(quirc->quirc, inlink->w, inlink->h) < 0) {
++            av_frame_free(&frame);
++            return AVERROR(ENOMEM);
++        }
++        quirc->width  = inlink->w;
++        quirc->height = inlink->h;
++    }
++
+     /* copy input image to quirc buffer */
+     image = quirc_begin(quirc->quirc, NULL, NULL);
+     av_image_copy_plane(image, inlink->w,
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 3043cf638f..a7b6237c62 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66037.patch \
            file://CVE-2026-66038.patch \
            file://CVE-2026-66039.patch \
+           file://CVE-2026-66041.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


