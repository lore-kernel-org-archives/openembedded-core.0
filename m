Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3527AC982D8
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1715.1789682913807028718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BbpF/rv2;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1215425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682912; x=1790287712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6vHbFsWDvQzrLuLV4qIQEteJNE9lH7i4fpGBPwPjX1M=;
        b=BbpF/rv2UuHfndKFSTFNeSoVSt2KZ5sFXrWjOWu00SFjn/pPCGlEC2Yi1pCTl69s6Q
         jidDHBIO0o/4+JogbDqXuQDqTX16GCq+/EH8BWs6chKlSMZgLJl0LVN+u34keMsLxmB0
         cR0sCZKNa2BJWP7vCD3dkoQ3NSABgGA+6ipBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682912; x=1790287712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6vHbFsWDvQzrLuLV4qIQEteJNE9lH7i4fpGBPwPjX1M=;
        b=MvtD73C4jwovSpnaDVDkcBJjyxpPadlqZ/QObrSCyQ/vKOwiTA65r779ztR9shHSum
         OmgOQXDzz/AQmQeB36qCBfZku+R1dO8jw8Ch8WU03omGPCI5EBpLuiaEyZS8O7DqoOtg
         B62jLEDPXkKHjl+vgG4wnXIgpfZp12zcYD/Xo1hKYZiw8SRoE6gasU0X5NhBUl92L2cG
         muZfw0G/0N2iRVSs7eZjWzStf7eEVs8irMcOpm0Cn3yW1LRIEgteV68X/8695mWs0RwO
         TDmITem9z0+qENHy0MVdnFUEaEnuBktqU9XcSne145eU5te7riCHTOUaCyCz0k1Etluh
         mZpQ==
X-Gm-Message-State: AFuF++mmWgJwrp/zxe2XswTdtv1j1r7KJm3SCYwyESFNAd9339ew9cbW
	gXh+dnwU8ugeTkKnO4PQXsBapTaq9+jjHkEpagcjk1CgLeS5HQH07+J5KN+t+LKDTD9hwMva4tS
	4ZYsi3ag=
X-Gm-Gg: AYBFou2LiAiLky5eVnqoanOhLIDqr4qlumb2O1Vv0JIr3dcKUmUZHguPeu3TYCdwYAW
	4ZgRelbhCanElFgwJVHLWubtRC/K+txsiPKqb9c7s+tiSdSymyPJr93LQXfQTQpugolUM5GNvvM
	CJxz/UEWyTKQjLfcWTnatmKf/HOAO0DIOrkleuPrTpjP9GFuAacv5R1h4voObj5qgOIttke2u4k
	g8f//mO7B0Fs8nOiWb7ZOY0Ix2eWydR6L0IDH8cK0DrZUp440ieiKgnNOcOAz9DO4JoYqYTIyNA
	B6pbt5WSh0Rv1/kWYfMvnP1t60ZBCmDqivRKX+n3KDwchl8jwqQjOJ9fw8prlzVmVTdWwFKWyRN
	mT8MrDSIKpUYlAS2vr7hFIQlWpQc0pk//8+Cewe/L1hOR0PKpJT19mHAhEIpD2KPz9dikqaj2zi
	gKFTBw5FXQrE8C5nXXQYCyASWyOJR7s/rnnjyJiIk05KTqFEC+6FzevGaUjPnbO2tNB7yz6Q0+/
	7M/2hq2RJ7V8Hc0m4TIJ3r4iYHcmtUejycFalnupZih8eWuHwb9l4xa8FqFM3Y6eLFbyEc2jWvk
	cd/8yRxBNw==
X-Received: by 2002:a05:600d:4453:20b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49fc5a10ca6mr1597805e9.18.1789682912047;
        Thu, 17 Sep 2026 15:08:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 78/79] ffmpeg: Fix for CVE-2026-65706
Date: Fri, 18 Sep 2026 00:07:03 +0200
Message-ID: <fb0495fd49e7d65e9a4d81f4e8a8b1a2fb768cb0.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246173

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/a7e38b617b32f996beaa371bbf04b39907d7a527
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-65706

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-65706.patch        | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65706.patch
new file mode 100644
index 00000000000..7311ed71c0c
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
index e39961c6499..48ece247600 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65704.patch \
            file://CVE-2026-65705_p1.patch \
            file://CVE-2026-65705_p2.patch \
+           file://CVE-2026-65706.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

