Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4256BC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 16:59:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25467.1682701136210235281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 09:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cb/4h2IF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4482303012=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33SAkd4V004758
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 16:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=983OZ6Gy8DDQieOIM9Rv4hSkBJKlhF96G4kNGX+kVrc=;
 b=cb/4h2IFK1UlJu87wNqArLQVYhykyZ3/dQv7Ms5ZMKdwlJ1dMdMFanW2AkmBn0Xi1XZA
 bM2YW9FCn8y059lJBYxKAbi8b4BW4AYYxoW9R9UQJs9Xe+eBGnwK7GTvOn5nFK4MTdgM
 UPILAqUWkTK9DJ6QbwwpFCgUTWQ8r9SZ08GFagU56pPqSqLlEJWJi/xMjHsAUKH022pg
 JoYIPv4oWygEF8KyXrNYE8qG+CdB+w/4gduJybYWKNXhj770QNdCVZXYSvM0JzzbdsBl
 VsbkQzZ/4Aqm6dhEzPLUHVMjAT/czuWk+q39A6TWo0CFSF4B97/7ozax5z/S7E05neg3 /A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q46jbewpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 16:58:55 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 09:58:52 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-48434
Date: Fri, 28 Apr 2023 16:58:32 +0000
Message-ID: <20230428165832.1290909-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: zsxfSGUDbV91Z87IIAIKbjvrDj1jIoxF
X-Proofpoint-ORIG-GUID: zsxfSGUDbV91Z87IIAIKbjvrDj1jIoxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 16:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180533

From: Narpat Mali <narpat.mali@windriver.com>

libavcodec/pthread_frame.c in FFmpeg before 5.1.2, as used in VLC and
other products, leaves stale hwaccel state in worker threads, which
allows attackers to trigger a use-after-free and execute arbitrary
code in some circumstances (e.g., hardware re-initialization upon a
mid-video SPS change when Direct3D11 is used).

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
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
index 6498a5ec84..7bd85f312a 100644
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
2.40.0


