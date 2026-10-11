Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6170CCA9ED6
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23579.1791708092275725052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sWItN1iM;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af27fe287so818950f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708090; x=1792312890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jmwM0gb3RRp3eEnS9OacUWTESlCkESGENh4KlSgd4I8=;
        b=sWItN1iMWv3R8PyTdEVA8bIXqstsTDtBdQbsnvNU9cJ0E/Al5IC/xUHMeR/vGpAo7j
         0Bq8pjfY/4pgns+uxTyRZ+65zHiM6Y4p5iUvvKtd/1dUvkrYcn/QBEmE7Qnu8+jDwj8j
         PddIhssKUz1P5A4DdJ5YSs1ZsmlwHVkjluSkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708090; x=1792312890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jmwM0gb3RRp3eEnS9OacUWTESlCkESGENh4KlSgd4I8=;
        b=V0DgbsSc1MsSrU/Ip79RXaI5VV8eR6xaX6muXztovYyV8gx5qszGmAlBO1GXQGdA/7
         opkQuknk60MKSDurZ+UfhrV7z8HNLpFKX5r3sPFLHB4mfVehKZghBQoKmBEqiWCVEjkr
         xjpV5erxyyV0mLz+M4Hl6pI17LjYDQS/oAg/mfvZNWmAUje8c2HRBLh33tLNpcSKl1Po
         BNHBF3ziB/QuF6US00SvRyhaUt0Zb+aLJ/nVNhpuA6fY3IIrSDCwY2ljWyp/n40586XU
         3ccI3D0BgAOWoWpaD5g3qE5mUYAE8I+FtvE+fPs3FUOFnUbAaUDFS88cgGH0798Uym65
         KSdg==
X-Gm-Message-State: AFq9FYJipo/qj4ar+oLxZJyu2OOew56YO4K2N7E6WTyxwRy+6Vfj4t78
	ggCegjqAX23seclfNOoESbl3Y37TJeGdV2I9wDhTVuTYcR3Nz8FksqpHrw9usV4zAm46RD/OpYW
	QXpinHY0=
X-Gm-Gg: AYBFou0NIZnli/jUBaY/fVZApSAhkLNJt+tNmffvor0gzrLaHgKzGlbuXLU3RpYb7G3
	QN+kNFnNnBQ4CLh6mwg4gLCC2vAa/ur/6jUOmQaavoBNKisyjvtrNtdDKLS1eyYIoo8M7E03NMu
	5rMXtOb27LNURwhxOuykbZXagMLCFNIl9QU6wNtjqVIvgAqpRMAbFgvPG6r1WTeoC1zDuT+8yV4
	iwZBuvOrFMtdk5QVcntcMAcBmmdnIc+cV3ESFaYQ4S0IwABy2SgqEPlAU5lk/3cZ4NDihr0EuzP
	DqHD6N4Mw3dnrwbkISIOfQUbWhXe7ZssTXBYvGsIjBZxTGFv6ovjuvp9izJ4fLVVhFSoPzlXkvY
	Qn6ny6uGTSoIb/PiI8r/5KCnrQSsbZ2uMgPkceuSttcDkcCrftQspHu5i/phIA7HhXyV82U0+Su
	EJKfcR/adcB6WPJ/KVGG472wXUc2blVDHKzjovOJjfO5fYg+NBxAFNNnWLuGljUKGNlEnf75PxR
	+zmZn8YOBYnvGwN+tlOQVnHGG+MT1nxTx+wV3MWcUT1wSDeiwZcqnGXBWolUhC8I+6BKIVmIygQ
	qxh7kJwt
X-Received: by 2002:a05:6000:2907:b0:48d:c18b:d644 with SMTP id ffacd0b85a97d-48dc18bd66dmr8492504f8f.26.1791708090509;
        Sun, 11 Oct 2026 01:41:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 45/60] ffmpeg: Fix for CVE-2026-66041
Date: Sun, 11 Oct 2026 10:40:18 +0200
Message-ID: <1cddc095cdf24208d1cbf33cfd107c1e81e6e239.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247554

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d62a8875cfa8eb39b5e20f5
[2] https://nvd.nist.gov/vuln/detail/cve-2026-66041

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-66041.patch        | 60 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
new file mode 100644
index 00000000000..7a8c4e0c8b9
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
index 9a2a3353ca4..b92676d4dbb 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66039.patch \
            file://CVE-2026-66036_p1.patch \
            file://CVE-2026-66036_p2.patch \
+           file://CVE-2026-66041.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

