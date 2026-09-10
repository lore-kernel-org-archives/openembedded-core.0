Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8296C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:24 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=D/edCv/x;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3240; q=dns/txt;
  s=NAESA-Selector1; t=1789047262; x=1820583262;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dc8ZwSaZ69ADBkIEf7l527A1WF45RlNfrhIFKC+8jcQ=;
  b=D/edCv/xG6dKpV88OlABE7ApuA0ebP5Vk3CxYwYyv+kCMt4d7nToNRKr
   PPd7KfCkfp1VP+B2HZ3pzU59fdXp0wuNlgX/8V3xb44/3HZxXH8HpL/AW
   nmu1XHXDv6JHUBHPlbhaRZIWdNXHddoJsJ4eyyWlbtSBLDmu7QFjy4TjH
   nEHlevRlril+CH6lvG/uTCdzZrXG+iPsoEDx4jRzq1YmrPSkO/C2vO/VM
   iQQOlDkzMK1Ts0RUmD0A5x+d8A47boz+FvldQJSb+nh81IT3fvl2oAdyc
   XNBLCCO/UscVdOaP1xHhuxyWJz2naGy3iFOUrmVu6FZn/zPkjRvzTWi11
   A==;
X-CSE-ConnectionGUID: Fi9KJrCLQiij/fCgD/44MQ==
X-CSE-MsgGUID: qx2/7kTETyibLYoX8gqgHA==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105823"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:21 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 10/10] ffmpeg: Fix for CVE-2026-65706
Date: Thu, 10 Sep 2026 19:01:44 +0530
Message-ID: <20260910133357.452394-10-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245579

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/a7e38b617b32f996beaa371bbf04b39907d7a527
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65706

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
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
index 36a9ae14f2..0bd36b2c33 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65704.patch \
            file://CVE-2026-65705_p1.patch \
            file://CVE-2026-65705_p2.patch \
+           file://CVE-2026-65706.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


