Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41E1C982DD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1714.1789682913282552678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3ZJf9xFi;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1215385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682911; x=1790287711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xxi8Fftrvx98g33ZCUPJ4smMq4JlvFW5/63WdJdqeBM=;
        b=3ZJf9xFiwPb0A0NRRTAGaPIbaO31+4rJxFbGPtQifyPUvcIUfVz1yfEnE7b1Np0xMk
         0tRZYghciw1tMWrsOsDtK1Gw2QKmk6FVHndExl8qKm671jZNKeCmFfwzOPIbCRsEPEev
         GG9NxVeEb+Y7el6PU41rs8hQRFo3jwhQ+ddOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682911; x=1790287711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xxi8Fftrvx98g33ZCUPJ4smMq4JlvFW5/63WdJdqeBM=;
        b=N7jGfnnrUJQPYgvIUILEr0DAjg2nLiFFQB20SllsrC858wxBA7UD3qS+yhHZ/QB3J+
         H4Ibz4/Y5yKhMv68pktts/YD2Ze5bF/BSJxh3Ap1gsI/TyFep8QBP+6X5g3t683mUleB
         0CGkWaore3b4LcFjQERMuoKp0+WR7xuj4zgIq/XLLelNrRsbMoEPL1ZDGqitEuevdI4T
         pxJJINbAQHvsioaStD02wJGmr5/vJ96Jdq3DsVgBNIub+60EuWXk4fpECsNF4GoYukY7
         KOj5juxLNNTYBH2JWJ/0CAksjvmLR5o7b0az5Speo/MazamasfGMMc64VPqXqN+LvEkX
         hdjw==
X-Gm-Message-State: AFuF++lb0TdejhpxFLWRUWBFQwAIqqgFQ1mHMvYuwDbF8C/MtGY2Enlo
	QLAvuKGZkhapERzUROKqGHdz7TIRLQjNrsw+1RCgRJ0IrRu5FwEZlFDqf+btsU6S6DF8nQlMYYs
	daePWti4=
X-Gm-Gg: AYBFou1+8ExteGKU5TC4vxY4bB+tnGmx0omjaCMv18kAJetnsMFomsLlxv8mU2GdIb7
	lKw4FYLnRAFXTvnj2eAucRftqOMl+K27VJobif7NPFg5dj8lKODAbL34P83AcP/UQfpYSEF3ti0
	v+Vw6MK1ImjCkGnnZ0RI4RnsYZBSrFNVv3TltXlo5n/PAYjR/HT5ofvqbiKTk35A0io1nlPvURo
	H6ZnVUTUog4fTnM5Z9gQHhd2TAL9RtQRBDTCaTUEw1u/PoXiGkMLVoimt4UZ57KBMTwYDpxS3fJ
	8uKkTTEFFeVzuVdK4y/RyRpt037ZE5Onvxz8qf2q5xtKWNLnjknpHzcAMxFVwB7rIDd3rIvOYIh
	NETK+A+BqLQK2qxAQpR1S6Sq2NCq06vt+9qe6Na0j5UuzXsIu3nA7VfUwjs1VYSjanATm/qTz1W
	R+ALUx6Yzgyr9pZUXCQ9jtZZQf0OceKscxBzCP6Ty9GLUP1RmQ7BNonOr+haOrDwjfK7tbAAtD+
	3q+6brxpNjALlBU/l2IbQKYdK+fmdXWF59TcTecyS0YMLgsxLCfitv2JtmmKDs4FFdrogpRI9w=
X-Received: by 2002:a05:600c:c8f:b0:49e:6c9b:4e94 with SMTP id 5b1f17b1804b1-49fc5743124mr3207435e9.28.1789682911457;
        Thu, 17 Sep 2026 15:08:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 77/79] ffmpeg: Fix for CVE-2026-65705
Date: Fri, 18 Sep 2026 00:07:02 +0200
Message-ID: <637518b0c2e810265ec5bb801289a6f8f3883a70.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246172

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1] and [2], mentioned in PR#23780 [3] which is
referenced in the NVD report [4]

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/24c322fdb232d0a3f3790d544dcb64e5c2138e79
[2] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f186c50cf53aec20e9a29059cb22ca3f2d59201c
[3] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23780
[4] https://nvd.nist.gov/vuln/detail/cve-2026-65705

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-65705_p1.patch     |  68 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-65705_p2.patch     | 115 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   2 +
 3 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p2.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch
new file mode 100644
index 00000000000..e331cb9646a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch
@@ -0,0 +1,68 @@
+From f73f6cd9a5f230ce02afbc6a74172400b92b1127 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 11 Jul 2026 16:47:28 +0200
+Subject: [PATCH 7/9] avfilter/vf_floodfill: size the point stack for the
+ current frame
+
+Fixes: out of array access
+Fixes: 8aj_floodfill_dynamic_size.pgm / 8aj_generate_floodfill_dynamic_size_pgm.py
+Fixes: 3MleMXjGZvu3
+Found-by: Adrian Junge (vurlo) <adjun37@gmail.com>
+
+CVE: CVE-2026-65705
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/24c322fdb232d0a3f3790d544dcb64e5c2138e79]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavfilter/vf_floodfill.c | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/libavfilter/vf_floodfill.c b/libavfilter/vf_floodfill.c
+index 6d89963..e569d5f 100644
+--- a/libavfilter/vf_floodfill.c
++++ b/libavfilter/vf_floodfill.c
+@@ -41,6 +41,7 @@ typedef struct FloodfillContext {
+     int nb_planes;
+     int back, front;
+     Points *points;
++    unsigned int points_size;
+ 
+     int (*is_same)(const AVFrame *frame, int x, int y,
+                    unsigned s0, unsigned s1, unsigned s2, unsigned s3);
+@@ -271,9 +272,6 @@ static int config_input(AVFilterLink *inlink)
+     }
+ 
+     s->front = s->back = 0;
+-    s->points = av_calloc(inlink->w * inlink->h, 4 * sizeof(Points));
+-    if (!s->points)
+-        return AVERROR(ENOMEM);
+ 
+     return 0;
+ }
+@@ -292,8 +290,23 @@ static int filter_frame(AVFilterLink *link, AVFrame *frame)
+     int s3 = s->s[3];
+     const int w = frame->width;
+     const int h = frame->height;
++    size_t nb_points, points_size;
+     int i, ret;
+ 
++    if (w > UINT16_MAX + 1 || h > UINT16_MAX + 1 ||
++        av_size_mult(w, h, &nb_points) < 0 ||
++        av_size_mult(nb_points, 4 * sizeof(*s->points), &points_size) < 0) {
++        av_frame_free(&frame);
++        return AVERROR(EINVAL);
++    }
++
++    av_fast_malloc(&s->points, &s->points_size, points_size);
++    if (!s->points) {
++        av_frame_free(&frame);
++        return AVERROR(ENOMEM);
++    }
++    s->front = s->back = 0;
++
+     if (is_inside(s->x, s->y, w, h)) {
+         s->pick_pixel(frame, s->x, s->y, &s0, &s1, &s2, &s3);
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p2.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p2.patch
new file mode 100644
index 00000000000..91a304015f4
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p2.patch
@@ -0,0 +1,115 @@
+From 7f99588c7fc27526a2d73dddc91e4cd57a3b401c Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 12 Jul 2026 03:27:47 +0200
+Subject: [PATCH 8/9] avfilter/vf_floodfill: remove unneeded variables
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-65705
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f186c50cf53aec20e9a29059cb22ca3f2d59201c]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavfilter/vf_floodfill.c | 35 ++++++++++++++++-------------------
+ 1 file changed, 16 insertions(+), 19 deletions(-)
+
+diff --git a/libavfilter/vf_floodfill.c b/libavfilter/vf_floodfill.c
+index e569d5f..9bc72e2 100644
+--- a/libavfilter/vf_floodfill.c
++++ b/libavfilter/vf_floodfill.c
+@@ -39,7 +39,6 @@ typedef struct FloodfillContext {
+     int d[4];
+ 
+     int nb_planes;
+-    int back, front;
+     Points *points;
+     unsigned int points_size;
+ 
+@@ -271,8 +270,6 @@ static int config_input(AVFilterLink *inlink)
+        }
+     }
+ 
+-    s->front = s->back = 0;
+-
+     return 0;
+ }
+ 
+@@ -292,6 +289,7 @@ static int filter_frame(AVFilterLink *link, AVFrame *frame)
+     const int h = frame->height;
+     size_t nb_points, points_size;
+     int i, ret;
++    int front = 0;
+ 
+     if (w > UINT16_MAX + 1 || h > UINT16_MAX + 1 ||
+         av_size_mult(w, h, &nb_points) < 0 ||
+@@ -305,7 +303,6 @@ static int filter_frame(AVFilterLink *link, AVFrame *frame)
+         av_frame_free(&frame);
+         return AVERROR(ENOMEM);
+     }
+-    s->front = s->back = 0;
+ 
+     if (is_inside(s->x, s->y, w, h)) {
+         s->pick_pixel(frame, s->x, s->y, &s0, &s1, &s2, &s3);
+@@ -323,9 +320,9 @@ static int filter_frame(AVFilterLink *link, AVFrame *frame)
+             goto end;
+ 
+         if (s->is_same(frame, s->x, s->y, s0, s1, s2, s3)) {
+-            s->points[s->front].x = s->x;
+-            s->points[s->front].y = s->y;
+-            s->front++;
++            s->points[front].x = s->x;
++            s->points[front].y = s->y;
++            front++;
+         }
+ 
+         if (ret = ff_inlink_make_frame_writable(link, &frame)) {
+@@ -333,34 +330,34 @@ static int filter_frame(AVFilterLink *link, AVFrame *frame)
+             return ret;
+         }
+ 
+-        while (s->front > s->back) {
++        while (front > 0) {
+             int x, y;
+ 
+-            s->front--;
+-            x = s->points[s->front].x;
+-            y = s->points[s->front].y;
++            front--;
++            x = s->points[front].x;
++            y = s->points[front].y;
+ 
+             if (s->is_same(frame, x, y, s0, s1, s2, s3)) {
+                 s->set_pixel(frame, x, y, d0, d1, d2, d3);
+ 
+                 if (is_inside(x + 1, y, w, h)) {
+-                    s->points[s->front]  .x = x + 1;
+-                    s->points[s->front++].y = y;
++                    s->points[front]  .x = x + 1;
++                    s->points[front++].y = y;
+                 }
+ 
+                 if (is_inside(x - 1, y, w, h)) {
+-                    s->points[s->front]  .x = x - 1;
+-                    s->points[s->front++].y = y;
++                    s->points[front]  .x = x - 1;
++                    s->points[front++].y = y;
+                 }
+ 
+                 if (is_inside(x, y + 1, w, h)) {
+-                    s->points[s->front]  .x = x;
+-                    s->points[s->front++].y = y + 1;
++                    s->points[front]  .x = x;
++                    s->points[front++].y = y + 1;
+                 }
+ 
+                 if (is_inside(x, y - 1, w, h)) {
+-                    s->points[s->front]  .x = x;
+-                    s->points[s->front++].y = y - 1;
++                    s->points[front]  .x = x;
++                    s->points[front++].y = y - 1;
+                 }
+             }
+         }
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 82f4b221b75..e39961c6499 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -34,6 +34,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64835.patch \
            file://CVE-2026-65703.patch \
            file://CVE-2026-65704.patch \
+           file://CVE-2026-65705_p1.patch \
+           file://CVE-2026-65705_p2.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

