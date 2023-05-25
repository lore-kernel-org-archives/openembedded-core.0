Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018F9C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:42:27 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.5921.1684996940017261684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 23:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KEncRHuY;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso2139424b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684996939; x=1687588939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbCtc7r3H+tH+EdH2cHkUY3zk4sPl6tfC9b2JhqLhqA=;
        b=KEncRHuY180oyIDHaqL2PYjG4YHAWE8E2W/qhteu44SRBZBV/jzCYr2/FNkGKGroTh
         XiR1kfrIOW7pItmcKt2mNspEzw6NVsyExoqFR4+Cwd2a6nUJLznyA7xSnUBPFe9PXNe/
         NbpqN2oVstiCeF8fAxOPN1eJosP+zDWWGtC1YzgGzv65+YrB5MSurwOnRHVI7ofta7jT
         iUiBqKo10b9eSYx4Mv+CyoOPkXWgxYT6pfL28ponkek8ksTYqimdOV+MyUT9AIlpLDG+
         +BPII/opN7fvisQ/UPEVcUS6a4Lr8izl97xZwHoPRpCYcV2wHwzxgEICtURshO6mm5BB
         C6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684996939; x=1687588939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbCtc7r3H+tH+EdH2cHkUY3zk4sPl6tfC9b2JhqLhqA=;
        b=AS6glwoEta8dsdM1aMO5sVM2teHQzj13vBow7I0PgaZbHMQEF6QtDik7HI+JhMUjyw
         dDnnSvSmqVuCDwayol6xOdiaQUqxcHR5ol7xG2r4WjQCsVgNNSzmSLgkmtXo0E4TP2Ew
         jpnMQMtOsVOS3cIDskHXXCo4MWSUEO+R4QtjrbGRC8L0JPbZm5xDasPD5OvuZ8XR8hhy
         jkf2GrnvYs6O1gL9bfruBMOAxBUS4WWAl8gCfYt5g6lfjp3d/arpsJks/jE4Hp4r3cat
         RffGFt1Ki3NgdZMCT0WPcC13Cobo9L2vIQU4jTuYRnhLvoK4RiA/dWLeQOHLi1ZWmpsm
         tyVw==
X-Gm-Message-State: AC+VfDxR+qp9PmsgZ9OpGYJKzNz5swMEZXl5Xp3m+1SjBNu/h5yisvWe
	4JK708zJddBa+zspf92CtkZBbYDaWWk=
X-Google-Smtp-Source: ACHHUZ7Vx2/NCZfIz+zAYDsRxweiBcAZhQcfv58QsEAGlyY6NxArdg0/HwlWGQyW08JgbhLrUiKUiA==
X-Received: by 2002:a05:6a20:394d:b0:10c:7916:f9f8 with SMTP id r13-20020a056a20394d00b0010c7916f9f8mr9477702pzg.6.1684996939075;
        Wed, 24 May 2023 23:42:19 -0700 (PDT)
Received: from L-10146.. ([2409:4042:280a:5ef1:f3cf:fe0a:36da:5317])
        by smtp.gmail.com with ESMTPSA id 63-20020a630542000000b0051baf3f1b3esm392572pgf.76.2023.05.24.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 23:42:18 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] ffmpeg: Fix CVE-2022-48434
Date: Thu, 25 May 2023 12:11:54 +0530
Message-Id: <20230525064154.22789-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 06:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181702

From: Nikhil R <nikhilar2410@gmail.com>

Add a patch to fix CVE-2022-48434 which allows attackers to trigger a
use-after-free and execute arbitrary code in some circumstances

Link: https://ubuntu.com/security/CVE-2022-48434
Link: https://nvd.nist.gov/vuln/detail/CVE-2022-48434

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---
 .../ffmpeg/ffmpeg/CVE-2022-48434.patch        | 136 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch
new file mode 100644
index 0000000000..707073709a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-48434.patch
@@ -0,0 +1,136 @@
+From d4b7b3c03ee2baf0166ce49dff17ec9beff684db Mon Sep 17 00:00:00 2001
+From: Anton Khirnov <anton@khirnov.net>
+Date: Fri, 2 Sep 2022 22:21:27 +0200
+Subject: [PATCH] lavc/pthread_frame: avoid leaving stale hwaccel state in
+ worker threads
+
+This state is not refcounted, so make sure it always has a well-defined
+owner.
+
+Remove the block added in 091341f2ab5bd35ca1a2aae90503adc74f8d3523, as
+this commit also solves that issue in a more general way.
+
+(cherry picked from commit cc867f2c09d2b69cee8a0eccd62aff002cbbfe11)
+Signed-off-by: Anton Khirnov <anton@khirnov.net>
+(cherry picked from commit 35aa7e70e7ec350319e7634a30d8d8aa1e6ecdda)
+Signed-off-by: Anton Khirnov <anton@khirnov.net>
+(cherry picked from commit 3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba)
+Signed-off-by: Anton Khirnov <anton@khirnov.net>
+
+CVE: CVE-2022-48434
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d4b7b3c03ee2baf0166ce49dff17ec9beff684db]
+Signed-off-by: Ranjitsinh Rathod ranjitsinh.rathod@kpit.com
+Comment: Hunk#6 refreshed to backport changes and other to remove patch-fuzz warnings
+---
+ libavcodec/pthread_frame.c | 46 +++++++++++++++++++++++++++++---------
+ 1 file changed, 35 insertions(+), 11 deletions(-)
+
+diff --git a/libavcodec/pthread_frame.c b/libavcodec/pthread_frame.c
+index 36ac0ac..bbc5ba6 100644
+--- a/libavcodec/pthread_frame.c
++++ b/libavcodec/pthread_frame.c
+@@ -135,6 +135,12 @@ typedef struct FrameThreadContext {
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
+ #define THREAD_SAFE_CALLBACKS(avctx) \
+@@ -211,9 +217,17 @@ static attribute_align_arg void *frame_worker_thread(void *arg)
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
+@@ -275,14 +289,10 @@ static int update_context_from_thread(AVCodecContext *dst, AVCodecContext *src,
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
+@@ -415,6 +425,12 @@ static int submit_packet(PerThreadContext *p, AVCodecContext *user_avctx,
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
+     av_packet_unref(&p->avpkt);
+@@ -616,6 +632,14 @@ void ff_thread_finish_setup(AVCodecContext *avctx) {
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
+@@ -657,13 +681,6 @@ void ff_frame_thread_free(AVCodecContext *avctx, int thread_count)
+ 
+     park_frame_worker_threads(fctx, thread_count);
+ 
+-    if (fctx->prev_thread && fctx->prev_thread != fctx->threads)
+-        if (update_context_from_thread(fctx->threads->avctx, fctx->prev_thread->avctx, 0) < 0) {
+-            av_log(avctx, AV_LOG_ERROR, "Final thread update failed\n");
+-            fctx->prev_thread->avctx->internal->is_copy = fctx->threads->avctx->internal->is_copy;
+-            fctx->threads->avctx->internal->is_copy = 1;
+-        }
+-
+     for (i = 0; i < thread_count; i++) {
+         PerThreadContext *p = &fctx->threads[i];
+ 
+@@ -713,6 +730,13 @@ void ff_frame_thread_free(AVCodecContext *avctx, int thread_count)
+     pthread_mutex_destroy(&fctx->async_mutex);
+     pthread_cond_destroy(&fctx->async_cond);
+ 
++    /* if we have stashed hwaccel state, move it to the user-facing context,
++     * so it will be freed in avcodec_close() */
++    av_assert0(!avctx->hwaccel);
++    FFSWAP(const AVHWAccel*, avctx->hwaccel,                     fctx->stash_hwaccel);
++    FFSWAP(void*,            avctx->hwaccel_context,             fctx->stash_hwaccel_context);
++    FFSWAP(void*,            avctx->internal->hwaccel_priv_data, fctx->stash_hwaccel_priv);
++
+     av_freep(&avctx->internal->thread_ctx);
+ 
+     if (avctx->priv_data && avctx->codec && avctx->codec->priv_class)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index 1e000dddfa..f12052548f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2022-1475.patch \
            file://CVE-2022-3109.patch \
            file://CVE-2022-3341.patch \
+           file://CVE-2022-48434.patch \
           "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
-- 
2.38.1


