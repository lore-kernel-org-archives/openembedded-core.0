Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE3EC77B73
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.36190.1683386697206032535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e5ZBygPy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-643b60855c8so756089b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386696; x=1685978696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvxP4bOTQUh44dRgyu+xLzzfrquYLDej/GLC3ZUFRCo=;
        b=e5ZBygPyPcGhh8rU1cg9yVtmIRUsWkEQm/mw+6/k92e8p7AcOoudyMtWuEnjJXSEml
         uPody+asCuweiW8HFkMabUhe2s/N797yFwgmCEgnxZr+3xuuNfJLdvEFxjn0vp6bMeU3
         44OMSRE21dOatIHixDcU9yDdqnkNCNaxbvwcYfQaI6BEDgB7RYOvtvpihSsdMd2B5J6k
         hP8W+wB4mxKOUVegHhBLrDoDVOQN6PQIDV4Ydjoa9Zr9V92UKzXbK0eJZSDXDEVrh/rb
         lt8/LYR2MwWcQ9HIbK2+O9B5/WLubfh96B8t1pFxqz2+BeEjJwxsVXSwzf10jCuRSUXN
         pfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386696; x=1685978696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvxP4bOTQUh44dRgyu+xLzzfrquYLDej/GLC3ZUFRCo=;
        b=LyBvBH6Kv3yESLQfqmMpCRrbGtVgVHpjh73fxhg53xz8ASrbdbta9cpDPv5ko6Va4C
         we01oCQGtHLPxCpXF3hK63il6SYTgexxR7hsmdODVH1z3HaUUVO+Z4boNfREVAZLlRmO
         wvL5Iw1ypuwpdAp79o5ldgwG1qGGsb2Pn3eg9RBioZKygdU1LYCGr5dUqWctyDlk4oMF
         nEbViQf0cVKm+TtXS2hpwg7TzXs1TzWdK23B4zZqL/re2FvurCiRLi4mE19dsWacPDzQ
         lqR+NsJeTOpW2LL48b9KJu2iFVNcRR7ctKVSgXBHjX9zZvhJ8rAfVflYlXjv8v0TluRM
         BVDQ==
X-Gm-Message-State: AC+VfDwav3mQzhsu+JQVob3dDwc7s7QwiiaQaelQjJmmGEWZzRW5i4va
	uUGsJ656aX3xVS+FmdHyPBX9NkohsX6PweslNgk=
X-Google-Smtp-Source: ACHHUZ70EUmCa0BeBKTMrNb22Fxge4JmHc0bOJCskkSXtn//0VAJjHNODTMfnZsI9JrIW5XadbujMQ==
X-Received: by 2002:a05:6a00:24c1:b0:637:f1ae:d47 with SMTP id d1-20020a056a0024c100b00637f1ae0d47mr6931230pfv.17.1683386695960;
        Sat, 06 May 2023 08:24:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.24.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:24:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] ffmpeg: fix for CVE-2022-48434
Date: Sat,  6 May 2023 05:24:31 -1000
Message-Id: <392f984ffd95bcd3ce4c364b40425e7808ca7719.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180984

From: Narpat Mali <narpat.mali@windriver.com>

libavcodec/pthread_frame.c in FFmpeg before 5.1.2, as used in VLC and
other products, leaves stale hwaccel state in worker threads, which
allows attackers to trigger a use-after-free and execute arbitrary
code in some circumstances (e.g., hardware re-initialization upon a
mid-video SPS change when Direct3D11 is used).

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2022-48434.patch        | 130 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
 2 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch
new file mode 100644
index 0000000000..3cd374dc39
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch
@@ -0,0 +1,130 @@
+From e40c964a0678908e2c756741343ed50d6a99ee12 Mon Sep 17 00:00:00 2001
+From: Anton Khirnov <anton@khirnov.net>
+Date: Fri, 28 Apr 2023 11:45:30 +0000
+Subject: [PATCH] lavc/pthread_frame: avoid leaving stale hwaccel state in
+ worker threads
+
+This state is not refcounted, so make sure it always has a well-defined
+owner.
+
+Remove the block added in 091341f, as
+this commit also solves that issue in a more general way.
+
+CVE:CVE-2022-48434
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/cc867f2c09d2b69cee8a0eccd62aff002cbbfe11]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ libavcodec/pthread_frame.c | 46 +++++++++++++++++++++++++++++---------
+ 1 file changed, 35 insertions(+), 11 deletions(-)
+
+diff --git a/libavcodec/pthread_frame.c b/libavcodec/pthread_frame.c
+index 85a6bc9..e40dced 100644
+--- a/libavcodec/pthread_frame.c
++++ b/libavcodec/pthread_frame.c
+@@ -145,6 +145,12 @@ typedef struct FrameThreadContext {
+                                     * Set for the first N packets, where N is the number of threads.
+                                     * While it is set, ff_thread_en/decode_frame won't return any results.
+                                     */
++
++    /* hwaccel state is temporarily stored here in order to transfer its ownership
++     * to the next decoding thread without the need for extra synchronization */
++    const AVHWAccel *stash_hwaccel;
++    void            *stash_hwaccel_context;
++    void            *stash_hwaccel_priv;
+ } FrameThreadContext;
+ 
+ #if FF_API_THREAD_SAFE_CALLBACKS
+@@ -229,9 +235,17 @@ FF_ENABLE_DEPRECATION_WARNINGS
+             ff_thread_finish_setup(avctx);
+ 
+         if (p->hwaccel_serializing) {
++            /* wipe hwaccel state to avoid stale pointers lying around;
++             * the state was transferred to FrameThreadContext in
++             * ff_thread_finish_setup(), so nothing is leaked */
++            avctx->hwaccel                     = NULL;
++            avctx->hwaccel_context             = NULL;
++            avctx->internal->hwaccel_priv_data = NULL;
++
+             p->hwaccel_serializing = 0;
+             pthread_mutex_unlock(&p->parent->hwaccel_mutex);
+         }
++        av_assert0(!avctx->hwaccel);
+ 
+         if (p->async_serializing) {
+             p->async_serializing = 0;
+@@ -294,14 +308,10 @@ static int update_context_from_thread(AVCodecContext *dst, AVCodecContext *src,
+         dst->color_range = src->color_range;
+         dst->chroma_sample_location = src->chroma_sample_location;
+ 
+-        dst->hwaccel = src->hwaccel;
+-        dst->hwaccel_context = src->hwaccel_context;
+-
+         dst->channels       = src->channels;
+         dst->sample_rate    = src->sample_rate;
+         dst->sample_fmt     = src->sample_fmt;
+         dst->channel_layout = src->channel_layout;
+-        dst->internal->hwaccel_priv_data = src->internal->hwaccel_priv_data;
+ 
+         if (!!dst->hw_frames_ctx != !!src->hw_frames_ctx ||
+             (dst->hw_frames_ctx && dst->hw_frames_ctx->data != src->hw_frames_ctx->data)) {
+@@ -442,6 +452,12 @@ static int submit_packet(PerThreadContext *p, AVCodecContext *user_avctx,
+             pthread_mutex_unlock(&p->mutex);
+             return err;
+         }
++
++        /* transfer hwaccel state stashed from previous thread, if any */
++        av_assert0(!p->avctx->hwaccel);
++        FFSWAP(const AVHWAccel*, p->avctx->hwaccel,                     fctx->stash_hwaccel);
++        FFSWAP(void*,            p->avctx->hwaccel_context,             fctx->stash_hwaccel_context);
++        FFSWAP(void*,            p->avctx->internal->hwaccel_priv_data, fctx->stash_hwaccel_priv);
+     }
+ 
+     av_packet_unref(p->avpkt);
+@@ -647,6 +663,14 @@ void ff_thread_finish_setup(AVCodecContext *avctx) {
+         async_lock(p->parent);
+     }
+ 
++    /* save hwaccel state for passing to the next thread;
++     * this is done here so that this worker thread can wipe its own hwaccel
++     * state after decoding, without requiring synchronization */
++    av_assert0(!p->parent->stash_hwaccel);
++    p->parent->stash_hwaccel         = avctx->hwaccel;
++    p->parent->stash_hwaccel_context = avctx->hwaccel_context;
++    p->parent->stash_hwaccel_priv    = avctx->internal->hwaccel_priv_data;
++
+     pthread_mutex_lock(&p->progress_mutex);
+     if(atomic_load(&p->state) == STATE_SETUP_FINISHED){
+         av_log(avctx, AV_LOG_WARNING, "Multiple ff_thread_finish_setup() calls\n");
+@@ -700,13 +724,6 @@ void ff_frame_thread_free(AVCodecContext *avctx, int thread_count)
+ 
+     park_frame_worker_threads(fctx, thread_count);
+ 
+-    if (fctx->prev_thread && avctx->internal->hwaccel_priv_data !=
+-                             fctx->prev_thread->avctx->internal->hwaccel_priv_data) {
+-        if (update_context_from_thread(avctx, fctx->prev_thread->avctx, 1) < 0) {
+-            av_log(avctx, AV_LOG_ERROR, "Failed to update user thread.\n");
+-        }
+-    }
+-
+     if (fctx->prev_thread && fctx->prev_thread != fctx->threads)
+         if (update_context_from_thread(fctx->threads->avctx, fctx->prev_thread->avctx, 0) < 0) {
+             av_log(avctx, AV_LOG_ERROR, "Final thread update failed\n");
+@@ -760,6 +777,13 @@ void ff_frame_thread_free(AVCodecContext *avctx, int thread_count)
+     av_freep(&fctx->threads);
+     ff_pthread_free(fctx, thread_ctx_offsets);
+ 
++    /* if we have stashed hwaccel state, move it to the user-facing context,
++     * so it will be freed in avcodec_close() */
++    av_assert0(!avctx->hwaccel);
++    FFSWAP(const AVHWAccel*, avctx->hwaccel,                     fctx->stash_hwaccel);
++    FFSWAP(void*,            avctx->hwaccel_context,             fctx->stash_hwaccel_context);
++    FFSWAP(void*,            avctx->internal->hwaccel_priv_data, fctx->stash_hwaccel_priv);
++
+     av_freep(&avctx->internal->thread_ctx);
+ }
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 4bcbda9976..6ece34fcfd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -28,7 +28,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
            file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
-           "
+           file://CVE-2022-48434.patch \
+          "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
-- 
2.34.1


