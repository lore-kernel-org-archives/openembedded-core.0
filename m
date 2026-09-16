Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B870FC982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:27 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=YbeVW98D;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3287; q=dns/txt;
  s=NAESA-Selector1; t=1789560802; x=1821096802;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=moVZQwlcPtvFknR2SZnaTgJR/nMj2T31Xh2nF4OEjN0=;
  b=YbeVW98DmKEldVEtxS1HzsTdCQlondy7n7JkYhZySHI7BKv6500BlUKW
   J3z+47f2YHbgvq1OVadwCUdmgsZm9yGiApc/l5FcSKD9BOf9rLxZUq9Dj
   WuAWlKkecLyToipglavKvp2fhZ/g1FO27Om8HFdoDf/7KQUicdtlY8dZp
   Z9VdrWIKHlHiBL6a5ZRTB3KGymqipoH/EquZBepp8KnCyRsL9KuM/tYi2
   HS5ciW2P3/JLw5vqAlB1pOSCfmIj2ju03UcYPi5QEe/207iEOv5ZbCIui
   F+S5uEuXFHwq4qU2bcyHnTRFOYcRrOyVgjXKp9cIrTb6Q/TOTiEs4AsSm
   Q==;
X-CSE-ConnectionGUID: YGNv7KunRwmfDTiZhTeYwQ==
X-CSE-MsgGUID: 66jAAk6pS6SgOfJBfP6z7Q==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580047"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:21 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 10/10] ffmpeg: Fix for CVE-2026-65706
Date: Wed, 16 Sep 2026 17:39:33 +0530
Message-ID: <20260916121258.1699611-10-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245964

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/a7e38b617b32f996beaa371bbf04b39907d7a527
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65706

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- rebased on new CVE fix
---
 .../ffmpeg/ffmpeg/CVE-2026-65706.patch        | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch
new file mode 100644
index 0000000000..7311ed71c0
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch
@@ -0,0 +1,52 @@
+From 825f9e837f88c0c6983b5ccb70f91a32e9168f3c Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 11 Jul 2026 16:46:39 +0200
+Subject: [PATCH 9/9] avfilter/vf_swaprect: size the temp row buffer for the
+ widest plane
+
+Fixes: out of array access
+Fixes: 7aj_swaprect_odd17_nv12.nut / 7aj_generate_swaprect_odd17_nv12.py
+Fixes: VRAXYvKtmKa8
+Found-by: Adrian Junge (vurlo) <adjun37@gmail.com>
+
+CVE: CVE-2026-65706
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/a7e38b617b32f996beaa371bbf04b39907d7a527]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavfilter/vf_swaprect.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/libavfilter/vf_swaprect.c b/libavfilter/vf_swaprect.c
+index 5d93f51..fe007ee 100644
+--- a/libavfilter/vf_swaprect.c
++++ b/libavfilter/vf_swaprect.c
+@@ -200,6 +200,7 @@ static int config_input(AVFilterLink *inlink)
+ {
+     AVFilterContext *ctx = inlink->dst;
+     SwapRectContext *s = ctx->priv;
++    int size = 0;
+ 
+     if (!s->w  || !s->h  ||
+         !s->x1 || !s->y1 ||
+@@ -210,7 +211,16 @@ static int config_input(AVFilterLink *inlink)
+     av_image_fill_max_pixsteps(s->pixsteps, NULL, s->desc);
+     s->nb_planes = av_pix_fmt_count_planes(inlink->format);
+ 
+-    s->temp = av_malloc_array(inlink->w, s->pixsteps[0]);
++    for (int p = 0; p < s->nb_planes; p++) {
++        int shift = p == 1 || p == 2 ? s->desc->log2_chroma_w : 0;
++        int width = AV_CEIL_RSHIFT(inlink->w, shift);
++
++        if (width > INT_MAX / s->pixsteps[p])
++            return AVERROR(EINVAL);
++        size = FFMAX(size, width * s->pixsteps[p]);
++    }
++
++    s->temp = av_malloc(size);
+     if (!s->temp)
+         return AVERROR(ENOMEM);
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index e39961c649..48ece24760 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65704.patch \
            file://CVE-2026-65705_p1.patch \
            file://CVE-2026-65705_p2.patch \
+           file://CVE-2026-65706.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


