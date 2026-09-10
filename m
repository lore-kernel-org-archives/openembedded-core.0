Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E80BC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:25 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=NmhZgqUP;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=7526; q=dns/txt;
  s=NAESA-Selector1; t=1789047260; x=1820583260;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BdR6812jCDjd8WKhJwzuo2duRw4/cY1z5V0wXcuLP8A=;
  b=NmhZgqUPLSILsMKn04SbqJbECqn3K8ZRybPTPVaTMnvOKU5FSc1959+S
   HKTd5G/54XOstAeRDo99mzRBr1IYmBS7nb9imm734B8kcQczVUWgt6cSn
   pYxalFyuJYmjbh2JL3w5VpCOw828fDdAsN27H0jZEXQHZZK0tUo6VunNT
   VCQm3q7uhhecOHii/kiCNqOrroXncc4AzpHdcyLSRVQ7ruMNDFPKrzhgO
   QNt4uX0CGdyl97HaUSZ2uvc7aoDjYNXLlEtgZPNA/qTFt5PaCiF+bt8Fa
   HQTuA+D0/ZjdwjuVoiF/jB9FhoGMs3NyD19y2h3B9VfMZp9pOt+CewlqF
   A==;
X-CSE-ConnectionGUID: 97lhewBaTK2WB7ayhlnMoA==
X-CSE-MsgGUID: zp9FOC15QrOUHb+2+YPp3w==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105820"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:19 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 09/10] ffmpeg: Fix for CVE-2026-65705
Date: Thu, 10 Sep 2026 19:01:43 +0530
Message-ID: <20260910133357.452394-9-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245578

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1] and [2], mentioned in PR#23780 [3] which is
referenced in the NVD report [4]

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/24c322fdb232d0a3f3790d544dcb64e5c2138e79
[2] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f186c50cf53aec20e9a29059cb22ca3f2d59201c
[3] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23780
[4] https://nvd.nist.gov/vuln/detail/cve-2026-65705

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-65705_p1.patch     |  68 +++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-65705_p2.patch     | 115 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   2 +
 3 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p2.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-65705_p1.patch
new file mode 100644
index 0000000000..e331cb9646
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
index 0000000000..91a304015f
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
index da96d63219..36a9ae14f2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -32,6 +32,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64835.patch \
            file://CVE-2026-65703.patch \
            file://CVE-2026-65704.patch \
+           file://CVE-2026-65705_p1.patch \
+           file://CVE-2026-65705_p2.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


