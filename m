Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7848DCA9ED7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23454.1791708091789543366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=siGfsJ6Y;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4d870d54so487179f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708090; x=1792312890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZiDnD0G/xOk+a0RM2S/PfDj7Z1O2VHY3GSZ6M6UfrtA=;
        b=siGfsJ6YFSLObe8WJ/g784DY3HF3gJST8faMIMhGCdrIANQn7jhVc/v0ai6t4qYKn1
         HSXhlwGDgmSvqSRqYd1ArStAqEyyKkUycs9PPvVO7udKDbfA8djJ84F7QQRrMsocr/4t
         eGI8k4/eDanHWE3F6W5tl+Gvgj8OhiSNqv6AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708090; x=1792312890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZiDnD0G/xOk+a0RM2S/PfDj7Z1O2VHY3GSZ6M6UfrtA=;
        b=RJ+twwn4WUIGJoIscpyYt0aXiUXnJzDysWtFUrEafQ56fPu/wUNSUgog9qCS6Dk451
         5ZzmBaLMIw/aJjl8VAGPZW1oP9CVFDVrZgkifpdNe5NVs1RVqh7WGCjrulMLYSLO2PA2
         bvQ3OraTiy7H98e++OULi9eZn4gemm0B8CrtpNIEbQGS82dxn01XbjRbqe/GxaWBlGl2
         DpVeCDbC4QsJKG4TpG4p+WHtv70Pye/XYcTvU8Jr5A8fvaPGJxcOz0slVUip4clc5blT
         be4M59QHvu2hteRsTesfY2cwUWIArdcFDkv2bTQM6mETLsJ+1WBQkG5Z90DwchCpbbud
         61XA==
X-Gm-Message-State: AFq9FYI8XzBxSM1SZbN2teJOfGC/Ci+DXGt4V0zHIaSy9llBPnmh8rmL
	zeLK763Q5qopMPD/oljYUqXB9yUP1u8KwuMEHwjeOwy0g7Lw13iP+gezLtOL77qwP2y3AQl1bKL
	wnd5SYWM=
X-Gm-Gg: AYBFou1A0JQ3AkP1dGQseo4KM4ypElEXwP/WgnJ+4Cm31JDNnvmu7OlJn8c2f+INWWd
	6ECxet1Zs+owfC1pP/u/PSt4aZ3aatkE6m+LwhIvpQAsj3f/K0daHU5rQk7UgUKs3iS2q9IEAvh
	VPhr28xO+SBNUtyGu6d3Z3awFA5tdvjtzR0revHR6G4EttMHaMZ5N0NPoVHpwqrB9S2bmxS8XiR
	WAgequxVJE/vFeXj3wK4/GpV2RoRlHWgIiDwll9MbxvfyJokrgMyxQdQMCL03I4pKOMIEHfx6Iy
	LyUlpKum5RhiyU+P3y1Z4UCTHp3HcYNmjgLYaJanZ5Zjgajt6u1QJL+exRmO00MVrzmIAaeCH1A
	vf5PcJ8/7YdEaTt/93X80Wo7zQZ/t66N8TkOPN2VN/S7owjPrj+XMqaVeUDdv3iXtBlX2hvEzzT
	5EAEsdGv+dMraCigFFjC1RW5Bxob6cjQXKqobGrkFd6sWEbgkuoniJoNx2tYQmd/LB30Sxy5FRJ
	rfJ0yAiuZRi0qJj6XXYgwShvdiRsY6kkBS3hoM2qK8KKgaQ2R/PLV/E3AwS+9uIysoc+6BO1g==
X-Received: by 2002:a05:6000:26c5:b0:48c:7ab9:99cc with SMTP id ffacd0b85a97d-48dbacf9da3mr11475251f8f.52.1791708089774;
        Sun, 11 Oct 2026 01:41:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 44/60] ffmpeg: Fix for CVE-2026-66036
Date: Sun, 11 Oct 2026 10:40:17 +0200
Message-ID: <76e0d54cd1cb355c8ae98af515ae9ce9b3d8fd85.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247553

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1] and [2], mentioned in PR#23783 [3] which is
referenced in the NVD report [4]

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f0f634b6585fdc7bbb43ab3ae461499bfca9ad2e
[2] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5d7112c60e6f0f0742ce47d448e6da0718a70f4c
[3] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23783
[4] https://nvd.nist.gov/vuln/detail/cve-2026-66036

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-66036_p1.patch     | 120 ++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-66036_p2.patch     |  71 +++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   2 +
 3 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p2.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
new file mode 100644
index 00000000000..bce02651143
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
index 00000000000..e5148e86291
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
index 06c6e402c97..9a2a3353ca4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -40,6 +40,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66037.patch \
            file://CVE-2026-66038.patch \
            file://CVE-2026-66039.patch \
+           file://CVE-2026-66036_p1.patch \
+           file://CVE-2026-66036_p2.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

