Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C78CC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.4648.1642588915552160538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cN2f+0gZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4943897wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dknGdNsrfTD6FZneFwsYOrj/4zBdsM3zQR6Mg8F4I4U=;
        b=cN2f+0gZa4wWIPNvbUSG5wiQkl2FZ5RKTIlJy5+OUwoTKHswul8A4rIfrdyVwXM5K3
         jWv2yO1/r8UzuJYbI6Til/5omO2JBhIzrbd1JKdItLC4hLvCBUiRUggyw3Xo6GYQcyXQ
         MZqgnisxLAe/osHHBYT8wXZJhr1eImriUzoExqqW5lXDIJIz5AtSP5LQrLtnG4cTGYkj
         Qq2JJ3DeNBWza1HaypLHp1thMXkbLMzWjwhE8IaWD3iCtobv8mSSfcz+LzXta/GviLo7
         1FuUiaK8w6WiYow/bNeIDvlfUso2SvjRn/0Y2zV1pGrpG2wcBfMuRvq5RpN3ayCOxlxV
         Lp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dknGdNsrfTD6FZneFwsYOrj/4zBdsM3zQR6Mg8F4I4U=;
        b=6t0R+9mFpYax1gupAT5CTXI3Hh/LS5p8RK1uR2igzey4zR85gjoLl0PzVYYBprXHLm
         gwBZh9hNtvXQXqgQIiTxsyQ1DYcC1oKNqWdwriucqzHZOJ3Lx8ffKyQhm3hINGJoClX/
         zi33fpmfwzGQmVNzxy5668BKVWqghHdumguhdOy34aQLAxz2i2Ihs+4Jlzb2Bau/hSR9
         cpkHMS5fgkdegGCuHgVzY0TabdQOAT/MTLcGAc6I8C/KZ25lhF98bjLiv30QEX7g9fv9
         875Q9ISbGvKstuBcyv4YWrHPbq7QHsvJXXFZYJvwOw2kP+D30coKQH+4mtyt+YoiHAjR
         xFrA==
X-Gm-Message-State: AOAM532LIVIK4txAOpukn+D8ahNVOuSIPFYB8NmsqiEb7YezYY8h3ptm
	DAaiYC/dtE8PXSLU5EYqqfqXLSe8Pss=
X-Google-Smtp-Source: 
 ABdhPJyfMQjsTcc2GzT4ANF/5v5xPLZx2t58utj7uUHFUqz2RVpmFl+Xd6u3viR+U1a3B5MapI5u4A==
X-Received: by 2002:a05:6000:1c1e:: with SMTP id
 ba30mr2913822wrb.699.1642588914064;
        Wed, 19 Jan 2022 02:41:54 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/39] ffmpeg: upgrade 4.4.1 -> 5.0
Date: Wed, 19 Jan 2022 11:41:16 +0100
Message-Id: <20220119104117.2120127-38-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160730

From: Alexander Kanavin <alex.kanavin@gmail.com>

libavresample has been removed; libswresample is the replacement.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-assembly-with-full-path-from-sourc.patch |  21 +-
 .../ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb} |   9 +-
 ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 ++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.18.5.bb    |   4 +-
 4 files changed, 369 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
index 2b4ca0e9b9..7d0a06f85b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
@@ -1,4 +1,4 @@
-From 24a58d70cbb3997e471366bd5afe54be9007bfb1 Mon Sep 17 00:00:00 2001
+From 4a891e1eddbf63f32fe769b5bff289f6748abf45 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:32:14 +0000
 Subject: [PATCH] libavutil: include assembly with full path from source root
@@ -6,8 +6,9 @@ Subject: [PATCH] libavutil: include assembly with full path from source root
 Otherwise nasm writes the full host-specific paths into .o
 output, which breaks binary reproducibility.
 
-Upstream-Status: Submitted [by email to jamrial@gmail.com,ffmpeg-devel@ffmpeg.org]
+Upstream-Status: Submitted [http://ffmpeg.org/pipermail/ffmpeg-devel/2022-January/291781.html]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  libavutil/x86/cpuid.asm      | 2 +-
  libavutil/x86/emms.asm       | 2 +-
@@ -15,7 +16,8 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  libavutil/x86/float_dsp.asm  | 2 +-
  libavutil/x86/lls.asm        | 2 +-
  libavutil/x86/pixelutils.asm | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
+ libavutil/x86/tx_float.asm   | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/libavutil/x86/cpuid.asm b/libavutil/x86/cpuid.asm
 index c3f7866..766f77f 100644
@@ -95,3 +97,16 @@ index 36c57c5..8b45ead 100644
  
  SECTION .text
  
+diff --git a/libavutil/x86/tx_float.asm b/libavutil/x86/tx_float.asm
+index 4d2283f..ea39f21 100644
+--- a/libavutil/x86/tx_float.asm
++++ b/libavutil/x86/tx_float.asm
+@@ -29,7 +29,7 @@
+ ;       replace some shuffles with vblends?
+ ;       avx512 split-radix
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ %if ARCH_X86_64
+ %define ptr resq
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
index 3ba07c31d6..4ba5ff4537 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
@@ -11,7 +11,6 @@ LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LG
 LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libavresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libpostproc = "GPLv2+"
 LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
@@ -26,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
-SRC_URI[sha256sum] = "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
+SRC_URI[sha256sum] = "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
@@ -41,7 +40,7 @@ DEPENDS = "nasm-native"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
+PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc \
                    alsa bzlib lzma pic pthreads shared theora zlib \
                    ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips32r2', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
@@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] = "--enable-avformat,--disable-avformat"
 PACKAGECONFIG[swresample] = "--enable-swresample,--disable-swresample"
 PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
 PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
-PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
 
 # features to support
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
@@ -153,7 +151,6 @@ PACKAGES =+ "libavcodec \
              libavdevice \
              libavfilter \
              libavformat \
-             libavresample \
              libavutil \
              libpostproc \
              libswresample \
@@ -163,7 +160,6 @@ FILES:libavcodec = "${libdir}/libavcodec${SOLIBS}"
 FILES:libavdevice = "${libdir}/libavdevice${SOLIBS}"
 FILES:libavfilter = "${libdir}/libavfilter${SOLIBS}"
 FILES:libavformat = "${libdir}/libavformat${SOLIBS}"
-FILES:libavresample = "${libdir}/libavresample${SOLIBS}"
 FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
 FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
@@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice = "textrel"
 INSANE_SKIP:${MLPREFIX}libavfilter = "textrel"
 INSANE_SKIP:${MLPREFIX}libavformat = "textrel"
 INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
-INSANE_SKIP:${MLPREFIX}libavresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
new file mode 100644
index 0000000000..022ff9af29
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
@@ -0,0 +1,346 @@
+From 38d10ee800e42afeacc6bee714216e4c974c11f5 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Mon, 17 Jan 2022 01:33:47 +0800
+Subject: [PATCH] gst-libav: fix build with ffmpeg-5.0.0
+
+Latest ffmpeg has removed avcodec_get_context_defaults(), and its
+documentation says a new AVCodecContext should be allocated for this
+purpose.  The pointer returned by avcodec_find_decoder() is now
+const-qualified so we also need to adjust for it.  And, AVCOL_RANGE_MPEG
+is now rejected with strict_std_compliance > FF_COMPLIANCE_UNOFFICIAL.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1531>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ ext/libav/gstavauddec.c   | 22 ++++++++-------------
+ ext/libav/gstavaudenc.c   | 40 +++++++++++++++++++--------------------
+ ext/libav/gstavcodecmap.c |  7 ++++---
+ ext/libav/gstavutils.c    |  2 +-
+ ext/libav/gstavviddec.c   | 28 +++++++++++----------------
+ ext/libav/gstavvidenc.c   | 21 ++++++++++----------
+ 6 files changed, 54 insertions(+), 66 deletions(-)
+
+diff --git a/ext/libav/gstavauddec.c b/ext/libav/gstavauddec.c
+index baf7aa5..b03a724 100644
+--- a/ext/libav/gstavauddec.c
++++ b/ext/libav/gstavauddec.c
+@@ -168,12 +168,7 @@ gst_ffmpegauddec_finalize (GObject * object)
+   GstFFMpegAudDec *ffmpegdec = (GstFFMpegAudDec *) object;
+ 
+   av_frame_free (&ffmpegdec->frame);
+-
+-  if (ffmpegdec->context != NULL) {
+-    gst_ffmpeg_avcodec_close (ffmpegdec->context);
+-    av_free (ffmpegdec->context);
+-    ffmpegdec->context = NULL;
+-  }
++  avcodec_free_context (&ffmpegdec->context);
+ 
+   G_OBJECT_CLASS (parent_class)->finalize (object);
+ }
+@@ -193,14 +188,12 @@ gst_ffmpegauddec_close (GstFFMpegAudDec * ffmpegdec, gboolean reset)
+   gst_ffmpeg_avcodec_close (ffmpegdec->context);
+   ffmpegdec->opened = FALSE;
+ 
+-  if (ffmpegdec->context->extradata) {
+-    av_free (ffmpegdec->context->extradata);
+-    ffmpegdec->context->extradata = NULL;
+-  }
++  av_freep (&ffmpegdec->context->extradata);
+ 
+   if (reset) {
+-    if (avcodec_get_context_defaults3 (ffmpegdec->context,
+-            oclass->in_plugin) < 0) {
++    avcodec_free_context (&ffmpegdec->context);
++    ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegdec->context == NULL) {
+       GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
+       return FALSE;
+     }
+@@ -219,8 +212,9 @@ gst_ffmpegauddec_start (GstAudioDecoder * decoder)
+   oclass = (GstFFMpegAudDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
+ 
+   GST_OBJECT_LOCK (ffmpegdec);
+-  gst_ffmpeg_avcodec_close (ffmpegdec->context);
+-  if (avcodec_get_context_defaults3 (ffmpegdec->context, oclass->in_plugin) < 0) {
++  avcodec_free_context (&ffmpegdec->context);
++  ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
++  if (ffmpegdec->context == NULL) {
+     GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
+     GST_OBJECT_UNLOCK (ffmpegdec);
+     return FALSE;
+diff --git a/ext/libav/gstavaudenc.c b/ext/libav/gstavaudenc.c
+index 3ff6432..689982f 100644
+--- a/ext/libav/gstavaudenc.c
++++ b/ext/libav/gstavaudenc.c
+@@ -175,10 +175,8 @@ gst_ffmpegaudenc_finalize (GObject * object)
+ 
+   /* clean up remaining allocated data */
+   av_frame_free (&ffmpegaudenc->frame);
+-  gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
+-  gst_ffmpeg_avcodec_close (ffmpegaudenc->refcontext);
+-  av_free (ffmpegaudenc->context);
+-  av_free (ffmpegaudenc->refcontext);
++  avcodec_free_context (&ffmpegaudenc->context);
++  avcodec_free_context (&ffmpegaudenc->refcontext);
+ 
+   G_OBJECT_CLASS (parent_class)->finalize (object);
+ }
+@@ -193,9 +191,9 @@ gst_ffmpegaudenc_start (GstAudioEncoder * encoder)
+   ffmpegaudenc->opened = FALSE;
+   ffmpegaudenc->need_reopen = FALSE;
+ 
+-  gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
+-  if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
+-          oclass->in_plugin) < 0) {
++  avcodec_free_context (&ffmpegaudenc->context);
++  ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++  if (ffmpegaudenc->context == NULL) {
+     GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
+     return FALSE;
+   }
+@@ -241,10 +239,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
+ 
+   /* close old session */
+   if (ffmpegaudenc->opened) {
+-    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
++    avcodec_free_context (&ffmpegaudenc->context);
+     ffmpegaudenc->opened = FALSE;
+-    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
+-            oclass->in_plugin) < 0) {
++    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegaudenc->context == NULL) {
+       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
+       return FALSE;
+     }
+@@ -286,11 +284,11 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
+   /* open codec */
+   if (gst_ffmpeg_avcodec_open (ffmpegaudenc->context, oclass->in_plugin) < 0) {
+     gst_caps_unref (allowed_caps);
+-    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
++    avcodec_free_context (&ffmpegaudenc->context);
+     GST_DEBUG_OBJECT (ffmpegaudenc, "avenc_%s: Failed to open FFMPEG codec",
+         oclass->in_plugin->name);
+-    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
+-            oclass->in_plugin) < 0)
++    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegaudenc->context == NULL)
+       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
+ 
+     if ((oclass->in_plugin->capabilities & AV_CODEC_CAP_EXPERIMENTAL) &&
+@@ -312,10 +310,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
+ 
+   if (!other_caps) {
+     gst_caps_unref (allowed_caps);
+-    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
++    avcodec_free_context (&ffmpegaudenc->context);
+     GST_DEBUG ("Unsupported codec - no caps found");
+-    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
+-            oclass->in_plugin) < 0)
++    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegaudenc->context == NULL)
+       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
+     return FALSE;
+   }
+@@ -331,10 +329,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * encoder, GstAudioInfo * info)
+ 
+   if (!gst_audio_encoder_set_output_format (GST_AUDIO_ENCODER (ffmpegaudenc),
+           icaps)) {
+-    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
++    avcodec_free_context (&ffmpegaudenc->context);
+     gst_caps_unref (icaps);
+-    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
+-            oclass->in_plugin) < 0)
++    ffmpegaudenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegaudenc->context == NULL)
+       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
+     return FALSE;
+   }
+@@ -403,8 +401,8 @@ buffer_info_free (void *opaque, guint8 * data)
+     gst_buffer_unmap (info->buffer, &info->map);
+     gst_buffer_unref (info->buffer);
+   } else {
+-    av_free (info->ext_data);
+-    av_free (info->ext_data_array);
++    av_freep (&info->ext_data);
++    av_freep (&info->ext_data_array);
+   }
+   g_slice_free (BufferInfo, info);
+ }
+diff --git a/ext/libav/gstavcodecmap.c b/ext/libav/gstavcodecmap.c
+index f58633d..e2a3641 100644
+--- a/ext/libav/gstavcodecmap.c
++++ b/ext/libav/gstavcodecmap.c
+@@ -2331,7 +2331,7 @@ gst_ffmpeg_codecid_to_caps (enum AVCodecID codec_id,
+   }
+ 
+   if (buildcaps) {
+-    AVCodec *codec;
++    const AVCodec *codec;
+ 
+     if ((codec = avcodec_find_decoder (codec_id)) ||
+         (codec = avcodec_find_encoder (codec_id))) {
+@@ -2975,6 +2975,7 @@ gst_ffmpeg_videoinfo_to_context (GstVideoInfo * info, AVCodecContext * context)
+     context->color_range = AVCOL_RANGE_JPEG;
+   } else {
+     context->color_range = AVCOL_RANGE_MPEG;
++    context->strict_std_compliance = FF_COMPLIANCE_UNOFFICIAL;
+   }
+ }
+ 
+@@ -4330,7 +4331,7 @@ gst_ffmpeg_caps_to_codecid (const GstCaps * caps, AVCodecContext * context)
+     audio = TRUE;
+   } else if (!strncmp (mimetype, "audio/x-gst-av-", 15)) {
+     gchar ext[16];
+-    AVCodec *codec;
++    const AVCodec *codec;
+ 
+     if (strlen (mimetype) <= 30 &&
+         sscanf (mimetype, "audio/x-gst-av-%s", ext) == 1) {
+@@ -4342,7 +4343,7 @@ gst_ffmpeg_caps_to_codecid (const GstCaps * caps, AVCodecContext * context)
+     }
+   } else if (!strncmp (mimetype, "video/x-gst-av-", 15)) {
+     gchar ext[16];
+-    AVCodec *codec;
++    const AVCodec *codec;
+ 
+     if (strlen (mimetype) <= 30 &&
+         sscanf (mimetype, "video/x-gst-av-%s", ext) == 1) {
+diff --git a/ext/libav/gstavutils.c b/ext/libav/gstavutils.c
+index 3780cff..f3878c3 100644
+--- a/ext/libav/gstavutils.c
++++ b/ext/libav/gstavutils.c
+@@ -36,7 +36,7 @@
+ const gchar *
+ gst_ffmpeg_get_codecid_longname (enum AVCodecID codec_id)
+ {
+-  AVCodec *codec;
++  const AVCodec *codec;
+   /* Let's use what ffmpeg can provide us */
+ 
+   if ((codec = avcodec_find_decoder (codec_id)) ||
+diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
+index 7ec5766..5dd207e 100644
+--- a/ext/libav/gstavviddec.c
++++ b/ext/libav/gstavviddec.c
+@@ -320,12 +320,7 @@ gst_ffmpegviddec_finalize (GObject * object)
+   GstFFMpegVidDec *ffmpegdec = (GstFFMpegVidDec *) object;
+ 
+   av_frame_free (&ffmpegdec->picture);
+-
+-  if (ffmpegdec->context != NULL) {
+-    gst_ffmpeg_avcodec_close (ffmpegdec->context);
+-    av_free (ffmpegdec->context);
+-    ffmpegdec->context = NULL;
+-  }
++  avcodec_free_context (&ffmpegdec->context);
+ 
+   G_OBJECT_CLASS (parent_class)->finalize (object);
+ }
+@@ -363,13 +358,11 @@ gst_ffmpegviddec_close (GstFFMpegVidDec * ffmpegdec, gboolean reset)
+ 
+   gst_buffer_replace (&ffmpegdec->palette, NULL);
+ 
+-  if (ffmpegdec->context->extradata) {
+-    av_free (ffmpegdec->context->extradata);
+-    ffmpegdec->context->extradata = NULL;
+-  }
++  av_freep (&ffmpegdec->context->extradata);
+   if (reset) {
+-    if (avcodec_get_context_defaults3 (ffmpegdec->context,
+-            oclass->in_plugin) < 0) {
++    avcodec_free_context (&ffmpegdec->context);
++    ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegdec->context == NULL) {
+       GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
+       return FALSE;
+     }
+@@ -1704,7 +1697,7 @@ gst_ffmpegviddec_video_frame (GstFFMpegVidDec * ffmpegdec,
+     if (side_data) {
+       GST_LOG_OBJECT (ffmpegdec,
+           "Found CC side data of type AV_FRAME_DATA_A53_CC, size %d",
+-          side_data->size);
++          (int) side_data->size);
+       GST_MEMDUMP ("A53 CC", side_data->data, side_data->size);
+ 
+       /* do not add closed caption meta if it already exists */
+@@ -1966,8 +1959,9 @@ gst_ffmpegviddec_start (GstVideoDecoder * decoder)
+   oclass = (GstFFMpegVidDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
+ 
+   GST_OBJECT_LOCK (ffmpegdec);
+-  gst_ffmpeg_avcodec_close (ffmpegdec->context);
+-  if (avcodec_get_context_defaults3 (ffmpegdec->context, oclass->in_plugin) < 0) {
++  avcodec_free_context (&ffmpegdec->context);
++  ffmpegdec->context = avcodec_alloc_context3 (oclass->in_plugin);
++  if (ffmpegdec->context == NULL) {
+     GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
+     GST_OBJECT_UNLOCK (ffmpegdec);
+     return FALSE;
+@@ -2261,10 +2255,10 @@ gst_ffmpegviddec_get_property (GObject * object,
+ 
+   switch (prop_id) {
+     case PROP_LOWRES:
+-      g_value_set_enum (value, ffmpegdec->context->lowres);
++      g_value_set_enum (value, ffmpegdec->lowres);
+       break;
+     case PROP_SKIPFRAME:
+-      g_value_set_enum (value, ffmpegdec->context->skip_frame);
++      g_value_set_enum (value, ffmpegdec->skip_frame);
+       break;
+     case PROP_DIRECT_RENDERING:
+       g_value_set_boolean (value, ffmpegdec->direct_rendering);
+diff --git a/ext/libav/gstavvidenc.c b/ext/libav/gstavvidenc.c
+index 0468d88..2ed9e5a 100644
+--- a/ext/libav/gstavvidenc.c
++++ b/ext/libav/gstavvidenc.c
+@@ -224,8 +224,8 @@ gst_ffmpegvidenc_finalize (GObject * object)
+   av_frame_free (&ffmpegenc->picture);
+   gst_ffmpeg_avcodec_close (ffmpegenc->context);
+   gst_ffmpeg_avcodec_close (ffmpegenc->refcontext);
+-  av_free (ffmpegenc->context);
+-  av_free (ffmpegenc->refcontext);
++  av_freep (&ffmpegenc->context);
++  av_freep (&ffmpegenc->refcontext);
+ 
+   G_OBJECT_CLASS (parent_class)->finalize (object);
+ }
+@@ -247,10 +247,10 @@ gst_ffmpegvidenc_set_format (GstVideoEncoder * encoder,
+ 
+   /* close old session */
+   if (ffmpegenc->opened) {
+-    gst_ffmpeg_avcodec_close (ffmpegenc->context);
++    avcodec_free_context (&ffmpegenc->context);
+     ffmpegenc->opened = FALSE;
+-    if (avcodec_get_context_defaults3 (ffmpegenc->context,
+-            oclass->in_plugin) < 0) {
++    ffmpegenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegenc->context == NULL) {
+       GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
+       return FALSE;
+     }
+@@ -454,9 +454,9 @@ bad_input_fmt:
+   }
+ close_codec:
+   {
+-    gst_ffmpeg_avcodec_close (ffmpegenc->context);
+-    if (avcodec_get_context_defaults3 (ffmpegenc->context,
+-            oclass->in_plugin) < 0)
++    avcodec_free_context (&ffmpegenc->context);
++    ffmpegenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++    if (ffmpegenc->context == NULL)
+       GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
+     goto cleanup_stats_in;
+   }
+@@ -896,8 +896,9 @@ gst_ffmpegvidenc_start (GstVideoEncoder * encoder)
+   ffmpegenc->need_reopen = FALSE;
+ 
+   /* close old session */
+-  gst_ffmpeg_avcodec_close (ffmpegenc->context);
+-  if (avcodec_get_context_defaults3 (ffmpegenc->context, oclass->in_plugin) < 0) {
++  avcodec_free_context (&ffmpegenc->context);
++  ffmpegenc->context = avcodec_alloc_context3 (oclass->in_plugin);
++  if (ffmpegenc->context == NULL) {
+     GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
+     return FALSE;
+   }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
index a77ec62759..64b8bcdb52 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+           file://0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch \
+           "
 SRC_URI[sha256sum] = "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.20.1


