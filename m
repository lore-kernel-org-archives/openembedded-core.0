Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC97C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:02:27 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4480.1790060539506240679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=bdPOTxnx;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=8352; q=dns/txt;
  s=NAESA-Selector1; t=1790060539; x=1821596539;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8keTQj80m+HpQgxQ6083QP1ZBKmJtCiOZTlk9KzrLlU=;
  b=bdPOTxnxj+TGdA8CVw+1Xe6G9KlZPXWrL/hVCZnH4KIxrt+H/faq3O6j
   3hzoBmidNHjpPrm+dRr4eBk7FuD5Fwac0fFX3WRYYUB37e4oCXLLjtvJi
   JY/951QhBi7od4LQ0sX3l3v80qNSu93V69CwwfHRaCihZBQC0dha55dAh
   jwMz/omiJtRP66Y89MYZqC4Q1dkxs7OTN8O2iwkZ6PZSybR1QYvuPdNO0
   L+oKahbY80Lb9O1XMTlgNiJIm7frJlZ4y3N5bEmG7TrjanWDdOAV5NgN9
   GIxtGtz/P1We9E+CbvmVCxI/2EnzsaBRJKn234Uk/sIDWo5MfHqnNG8t0
   w==;
X-CSE-ConnectionGUID: WtfMs4F2QAqeo9uRc7CEjA==
X-CSE-MsgGUID: jXt4j3bzQKiUFuP8jX2DJg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787032800"; 
   d="scan'208";a="63995888"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 22 Sep 2026 01:02:12 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 1/5] ffmpeg: Fix for CVE-2026-66036
Date: Tue, 22 Sep 2026 12:31:25 +0530
Message-ID: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 07:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246382

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1] and [2], mentioned in PR#23783 [3] which is
referenced in the NVD report [4]

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f0f634b6585fdc7bbb43ab3ae461499bfca9ad2e
[2] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5d7112c60e6f0f0742ce47d448e6da0718a70f4c
[3] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23783
[4] https://nvd.nist.gov/vuln/detail/cve-2026-66036

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-66036_p1.patch     | 120 ++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-66036_p2.patch     |  71 +++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   2 +
 3 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p2.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
new file mode 100644
index 0000000000..bce0265114
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
@@ -0,0 +1,120 @@
+From 7ac88955c4678fc10cc44a786ff9bf724bb12deb Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 12 Jul 2026 13:05:07 +0200
+Subject: [PATCH 1/2] avfilter/vf_hqdn3d: reject unsupported frame parameter
+ changes
+
+Fixes: out of array access
+Fixes: 9aj_hqdn3d_dynamic_res.mjpg / 9aj_generate_hqdn3d_dynamic_res_mjpg.py
+Fixes: wWDsy2oDvMuR
+Found-by: Adrian Junge (vurlo) <adjun37@gmail.com>
+
+CVE: CVE-2026-66036
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f0f634b6585fdc7bbb43ab3ae461499bfca9ad2e]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavfilter/vf_hqdn3d.c | 34 +++++++++++++++++++++++++---------
+ libavfilter/vf_hqdn3d.h |  2 ++
+ 2 files changed, 27 insertions(+), 9 deletions(-)
+
+diff --git a/libavfilter/vf_hqdn3d.c b/libavfilter/vf_hqdn3d.c
+index 1136931b9b..44fb3574a0 100644
+--- a/libavfilter/vf_hqdn3d.c
++++ b/libavfilter/vf_hqdn3d.c
+@@ -165,12 +165,8 @@ static int denoise_depth(HQDN3DContext *s,
+             case 14: ret = denoise_depth(__VA_ARGS__, 14); break;             \
+             case 16: ret = denoise_depth(__VA_ARGS__, 16); break;             \
+         }                                                                     \
+-        if (ret < 0) {                                                        \
+-            av_frame_free(&out);                                              \
+-            if (!direct)                                                      \
+-                av_frame_free(&in);                                           \
++        if (ret < 0)                                                          \
+             return ret;                                                       \
+-        }                                                                     \
+     } while (0)
+ 
+ static void precalc_coefs(double dist25, int depth, int16_t *ct)
+@@ -283,12 +279,15 @@ static int config_input(AVFilterLink *inlink)
+     ff_hqdn3d_init_x86(s);
+ #endif
+ 
++    s->format = inlink->format;
++    s->width  = inlink->w;
++    s->height = inlink->h;
++
+     return 0;
+ }
+ 
+ typedef struct ThreadData {
+     AVFrame *in, *out;
+-    int direct;
+ } ThreadData;
+ 
+ static int do_denoise(AVFilterContext *ctx, void *data, int job_nr, int n_jobs)
+@@ -297,7 +296,6 @@ static int do_denoise(AVFilterContext *ctx, void *data, int job_nr, int n_jobs)
+     const ThreadData *td = data;
+     AVFrame *out = td->out;
+     AVFrame *in = td->in;
+-    int direct = td->direct;
+ 
+     denoise(s, in->data[job_nr], out->data[job_nr],
+                 s->line[job_nr], &s->frame_prev[job_nr],
+@@ -314,10 +312,21 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+ {
+     AVFilterContext *ctx  = inlink->dst;
+     AVFilterLink *outlink = ctx->outputs[0];
++    HQDN3DContext *s = ctx->priv;
+ 
+     AVFrame *out;
+     int direct = av_frame_is_writable(in) && !ctx->is_disabled;
+     ThreadData td;
++    int ret[3];
++
++    if (in->format != s->format ||
++        in->width  != s->width  ||
++        in->height != s->height) {
++        av_log(ctx, AV_LOG_ERROR,
++               "Frame size or format changed without filter graph reinitialization\n");
++        av_frame_free(&in);
++        return AVERROR(EINVAL);
++    }
+ 
+     if (direct) {
+         out = in;
+@@ -333,9 +342,16 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+ 
+     td.in = in;
+     td.out = out;
+-    td.direct = direct;
+     /* one thread per plane */
+-    ff_filter_execute(ctx, do_denoise, &td, NULL, 3);
++    ff_filter_execute(ctx, do_denoise, &td, ret, 3);
++    for (int i = 0; i < FF_ARRAY_ELEMS(ret); i++) {
++        if (ret[i] < 0) {
++            av_frame_free(&out);
++            if (!direct)
++                av_frame_free(&in);
++            return ret[i];
++        }
++    }
+ 
+     if (ctx->is_disabled) {
+         av_frame_free(&out);
+diff --git a/libavfilter/vf_hqdn3d.h b/libavfilter/vf_hqdn3d.h
+index 3279bbcc77..3467f27145 100644
+--- a/libavfilter/vf_hqdn3d.h
++++ b/libavfilter/vf_hqdn3d.h
+@@ -36,6 +36,8 @@ typedef struct HQDN3DContext {
+     double strength[4];
+     int hsub, vsub;
+     int depth;
++    int width, height;
++    enum AVPixelFormat format;
+     void (*denoise_row[17])(uint8_t *src, uint8_t *dst, uint16_t *line_ant, uint16_t *frame_ant, ptrdiff_t w, int16_t *spatial, int16_t *temporal);
+ } HQDN3DContext;
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p2.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p2.patch
new file mode 100644
index 0000000000..e5148e8629
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p2.patch
@@ -0,0 +1,71 @@
+From 6e2b4a7713d9fd4ddfc0e2775af9ba6a03e77d55 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 12 Jul 2026 13:05:33 +0200
+Subject: [PATCH 2/2] avfilter/vf_hqdn3d: support dynamic frame sizes
+
+CVE: CVE-2026-66036
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5d7112c60e6f0f0742ce47d448e6da0718a70f4c]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavfilter/avfilter.c  |  3 ++-
+ libavfilter/vf_hqdn3d.c | 21 ++++++++++++++-------
+ 2 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/libavfilter/avfilter.c b/libavfilter/avfilter.c
+index 5bcf0b4ef7..c039f3a1ff 100644
+--- a/libavfilter/avfilter.c
++++ b/libavfilter/avfilter.c
+@@ -1072,7 +1072,8 @@ int ff_filter_frame(AVFilterLink *link, AVFrame *frame)
+             strcmp(link->dst->filter->name, "idet") &&
+             strcmp(link->dst->filter->name, "null") &&
+             strcmp(link->dst->filter->name, "scale") &&
+-            strcmp(link->dst->filter->name, "libplacebo")) {
++            strcmp(link->dst->filter->name, "libplacebo") &&
++            strcmp(link->dst->filter->name, "hqdn3d")) {
+             av_assert1(frame->format        == link->format);
+             av_assert1(frame->width         == link->w);
+             av_assert1(frame->height        == link->h);
+diff --git a/libavfilter/vf_hqdn3d.c b/libavfilter/vf_hqdn3d.c
+index 44fb3574a0..92163042eb 100644
+--- a/libavfilter/vf_hqdn3d.c
++++ b/libavfilter/vf_hqdn3d.c
+@@ -317,21 +317,28 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+     AVFrame *out;
+     int direct = av_frame_is_writable(in) && !ctx->is_disabled;
+     ThreadData td;
+-    int ret[3];
++    int err, ret[3];
+ 
+-    if (in->format != s->format ||
+-        in->width  != s->width  ||
+-        in->height != s->height) {
+-        av_log(ctx, AV_LOG_ERROR,
+-               "Frame size or format changed without filter graph reinitialization\n");
++    if (in->format != s->format) {
+         av_frame_free(&in);
+         return AVERROR(EINVAL);
+     }
+ 
++    if (in->width != s->width || in->height != s->height) {
++        inlink->w = in->width;
++        inlink->h = in->height;
++        if ((err = config_input(inlink)) < 0) {
++            av_frame_free(&in);
++            return err;
++        }
++        outlink->w = in->width;
++        outlink->h = in->height;
++    }
++
+     if (direct) {
+         out = in;
+     } else {
+-        out = ff_get_video_buffer(outlink, outlink->w, outlink->h);
++        out = ff_get_video_buffer(outlink, in->width, in->height);
+         if (!out) {
+             av_frame_free(&in);
+             return AVERROR(ENOMEM);
+-- 
+2.53.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 48ece24760..42ec15bf81 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -37,6 +37,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-65705_p1.patch \
            file://CVE-2026-65705_p2.patch \
            file://CVE-2026-65706.patch \
+           file://CVE-2026-66036_p1.patch \
+           file://CVE-2026-66036_p2.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


