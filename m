Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFB8C63686
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11073.1643192919211958651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=v8ZNzoQN;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 90BD682849;
	Wed, 26 Jan 2022 11:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192917;
	bh=AieRrFj0FrzXRPRNFGwjQLXRr0MY23MajKlcC/WFcYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v8ZNzoQNKqUQMb8YzriRnB46jc4HARkSx08FLnoOxoVEgwUmTKjlZZAeK2mBUQOtc
	 8v4wkaJQfJhfrgaL81pfu+2rj5Tr59km0GhrUBxbDCRw9vzU6+Drz8q2bWT4jyxuLC
	 tcrweeUn/gJMLjH6IdqCz2M6U19nhuzjVrjFdYBQsgJ2HQdPTgjOAOshFHq5D57XHR
	 7vvSCah9tdUb4/3tiorWiPRAQkXOQLemPsKK3pA9ocPFPG+BAB7nQs6BXnNWBeIEAR
	 vxXwoQAOps72tgFEP/YwgRu1s8bdi8jX0iU3W3mov+OtKM1aR2Tsv+JyNw9UHymliA
	 J2E6RQn90G1wQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 06/12] gstreamer1.0-libav: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:08 +0100
Message-Id: <20220126102814.4173943-7-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160971

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 ------------------
 ...1.18.5.bb =3D> gstreamer1.0-libav_1.20.0.bb} |   9 +-
 2 files changed, 3 insertions(+), 352 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/=
0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb =3D=
> gstreamer1.0-libav_1.20.0.bb} (66%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gs=
t-libav-fix-build-with-ffmpeg-5.0.0.patch b/meta/recipes-multimedia/gstre=
amer/gstreamer1.0-libav/0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
deleted file mode 100644
index 022ff9af29..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-gst-libav=
-fix-build-with-ffmpeg-5.0.0.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From 38d10ee800e42afeacc6bee714216e4c974c11f5 Mon Sep 17 00:00:00 2001
-From: Xi Ruoyao <xry111@mengyan1223.wang>
-Date: Mon, 17 Jan 2022 01:33:47 +0800
-Subject: [PATCH] gst-libav: fix build with ffmpeg-5.0.0
-
-Latest ffmpeg has removed avcodec_get_context_defaults(), and its
-documentation says a new AVCodecContext should be allocated for this
-purpose.  The pointer returned by avcodec_find_decoder() is now
-const-qualified so we also need to adjust for it.  And, AVCOL_RANGE_MPEG
-is now rejected with strict_std_compliance > FF_COMPLIANCE_UNOFFICIAL.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/1531>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ext/libav/gstavauddec.c   | 22 ++++++++-------------
- ext/libav/gstavaudenc.c   | 40 +++++++++++++++++++--------------------
- ext/libav/gstavcodecmap.c |  7 ++++---
- ext/libav/gstavutils.c    |  2 +-
- ext/libav/gstavviddec.c   | 28 +++++++++++----------------
- ext/libav/gstavvidenc.c   | 21 ++++++++++----------
- 6 files changed, 54 insertions(+), 66 deletions(-)
-
-diff --git a/ext/libav/gstavauddec.c b/ext/libav/gstavauddec.c
-index baf7aa5..b03a724 100644
---- a/ext/libav/gstavauddec.c
-+++ b/ext/libav/gstavauddec.c
-@@ -168,12 +168,7 @@ gst_ffmpegauddec_finalize (GObject * object)
-   GstFFMpegAudDec *ffmpegdec =3D (GstFFMpegAudDec *) object;
-=20
-   av_frame_free (&ffmpegdec->frame);
--
--  if (ffmpegdec->context !=3D NULL) {
--    gst_ffmpeg_avcodec_close (ffmpegdec->context);
--    av_free (ffmpegdec->context);
--    ffmpegdec->context =3D NULL;
--  }
-+  avcodec_free_context (&ffmpegdec->context);
-=20
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -193,14 +188,12 @@ gst_ffmpegauddec_close (GstFFMpegAudDec * ffmpegde=
c, gboolean reset)
-   gst_ffmpeg_avcodec_close (ffmpegdec->context);
-   ffmpegdec->opened =3D FALSE;
-=20
--  if (ffmpegdec->context->extradata) {
--    av_free (ffmpegdec->context->extradata);
--    ffmpegdec->context->extradata =3D NULL;
--  }
-+  av_freep (&ffmpegdec->context->extradata);
-=20
-   if (reset) {
--    if (avcodec_get_context_defaults3 (ffmpegdec->context,
--            oclass->in_plugin) < 0) {
-+    avcodec_free_context (&ffmpegdec->context);
-+    ffmpegdec->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegdec->context =3D=3D NULL) {
-       GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -219,8 +212,9 @@ gst_ffmpegauddec_start (GstAudioDecoder * decoder)
-   oclass =3D (GstFFMpegAudDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
-=20
-   GST_OBJECT_LOCK (ffmpegdec);
--  gst_ffmpeg_avcodec_close (ffmpegdec->context);
--  if (avcodec_get_context_defaults3 (ffmpegdec->context, oclass->in_plu=
gin) < 0) {
-+  avcodec_free_context (&ffmpegdec->context);
-+  ffmpegdec->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegdec->context =3D=3D NULL) {
-     GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-     GST_OBJECT_UNLOCK (ffmpegdec);
-     return FALSE;
-diff --git a/ext/libav/gstavaudenc.c b/ext/libav/gstavaudenc.c
-index 3ff6432..689982f 100644
---- a/ext/libav/gstavaudenc.c
-+++ b/ext/libav/gstavaudenc.c
-@@ -175,10 +175,8 @@ gst_ffmpegaudenc_finalize (GObject * object)
-=20
-   /* clean up remaining allocated data */
-   av_frame_free (&ffmpegaudenc->frame);
--  gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
--  gst_ffmpeg_avcodec_close (ffmpegaudenc->refcontext);
--  av_free (ffmpegaudenc->context);
--  av_free (ffmpegaudenc->refcontext);
-+  avcodec_free_context (&ffmpegaudenc->context);
-+  avcodec_free_context (&ffmpegaudenc->refcontext);
-=20
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -193,9 +191,9 @@ gst_ffmpegaudenc_start (GstAudioEncoder * encoder)
-   ffmpegaudenc->opened =3D FALSE;
-   ffmpegaudenc->need_reopen =3D FALSE;
-=20
--  gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
--  if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--          oclass->in_plugin) < 0) {
-+  avcodec_free_context (&ffmpegaudenc->context);
-+  ffmpegaudenc->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegaudenc->context =3D=3D NULL) {
-     GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults");
-     return FALSE;
-   }
-@@ -241,10 +239,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * enc=
oder, GstAudioInfo * info)
-=20
-   /* close old session */
-   if (ffmpegaudenc->opened) {
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     ffmpegaudenc->opened =3D FALSE;
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0) {
-+    ffmpegaudenc->context =3D avcodec_alloc_context3 (oclass->in_plugin=
);
-+    if (ffmpegaudenc->context =3D=3D NULL) {
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults")=
;
-       return FALSE;
-     }
-@@ -286,11 +284,11 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * enc=
oder, GstAudioInfo * info)
-   /* open codec */
-   if (gst_ffmpeg_avcodec_open (ffmpegaudenc->context, oclass->in_plugin=
) < 0) {
-     gst_caps_unref (allowed_caps);
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     GST_DEBUG_OBJECT (ffmpegaudenc, "avenc_%s: Failed to open FFMPEG co=
dec",
-         oclass->in_plugin->name);
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0)
-+    ffmpegaudenc->context =3D avcodec_alloc_context3 (oclass->in_plugin=
);
-+    if (ffmpegaudenc->context =3D=3D NULL)
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults")=
;
-=20
-     if ((oclass->in_plugin->capabilities & AV_CODEC_CAP_EXPERIMENTAL) &=
&
-@@ -312,10 +310,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * enc=
oder, GstAudioInfo * info)
-=20
-   if (!other_caps) {
-     gst_caps_unref (allowed_caps);
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     GST_DEBUG ("Unsupported codec - no caps found");
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0)
-+    ffmpegaudenc->context =3D avcodec_alloc_context3 (oclass->in_plugin=
);
-+    if (ffmpegaudenc->context =3D=3D NULL)
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults")=
;
-     return FALSE;
-   }
-@@ -331,10 +329,10 @@ gst_ffmpegaudenc_set_format (GstAudioEncoder * enc=
oder, GstAudioInfo * info)
-=20
-   if (!gst_audio_encoder_set_output_format (GST_AUDIO_ENCODER (ffmpegau=
denc),
-           icaps)) {
--    gst_ffmpeg_avcodec_close (ffmpegaudenc->context);
-+    avcodec_free_context (&ffmpegaudenc->context);
-     gst_caps_unref (icaps);
--    if (avcodec_get_context_defaults3 (ffmpegaudenc->context,
--            oclass->in_plugin) < 0)
-+    ffmpegaudenc->context =3D avcodec_alloc_context3 (oclass->in_plugin=
);
-+    if (ffmpegaudenc->context =3D=3D NULL)
-       GST_DEBUG_OBJECT (ffmpegaudenc, "Failed to set context defaults")=
;
-     return FALSE;
-   }
-@@ -403,8 +401,8 @@ buffer_info_free (void *opaque, guint8 * data)
-     gst_buffer_unmap (info->buffer, &info->map);
-     gst_buffer_unref (info->buffer);
-   } else {
--    av_free (info->ext_data);
--    av_free (info->ext_data_array);
-+    av_freep (&info->ext_data);
-+    av_freep (&info->ext_data_array);
-   }
-   g_slice_free (BufferInfo, info);
- }
-diff --git a/ext/libav/gstavcodecmap.c b/ext/libav/gstavcodecmap.c
-index f58633d..e2a3641 100644
---- a/ext/libav/gstavcodecmap.c
-+++ b/ext/libav/gstavcodecmap.c
-@@ -2331,7 +2331,7 @@ gst_ffmpeg_codecid_to_caps (enum AVCodecID codec_i=
d,
-   }
-=20
-   if (buildcaps) {
--    AVCodec *codec;
-+    const AVCodec *codec;
-=20
-     if ((codec =3D avcodec_find_decoder (codec_id)) ||
-         (codec =3D avcodec_find_encoder (codec_id))) {
-@@ -2975,6 +2975,7 @@ gst_ffmpeg_videoinfo_to_context (GstVideoInfo * in=
fo, AVCodecContext * context)
-     context->color_range =3D AVCOL_RANGE_JPEG;
-   } else {
-     context->color_range =3D AVCOL_RANGE_MPEG;
-+    context->strict_std_compliance =3D FF_COMPLIANCE_UNOFFICIAL;
-   }
- }
-=20
-@@ -4330,7 +4331,7 @@ gst_ffmpeg_caps_to_codecid (const GstCaps * caps, =
AVCodecContext * context)
-     audio =3D TRUE;
-   } else if (!strncmp (mimetype, "audio/x-gst-av-", 15)) {
-     gchar ext[16];
--    AVCodec *codec;
-+    const AVCodec *codec;
-=20
-     if (strlen (mimetype) <=3D 30 &&
-         sscanf (mimetype, "audio/x-gst-av-%s", ext) =3D=3D 1) {
-@@ -4342,7 +4343,7 @@ gst_ffmpeg_caps_to_codecid (const GstCaps * caps, =
AVCodecContext * context)
-     }
-   } else if (!strncmp (mimetype, "video/x-gst-av-", 15)) {
-     gchar ext[16];
--    AVCodec *codec;
-+    const AVCodec *codec;
-=20
-     if (strlen (mimetype) <=3D 30 &&
-         sscanf (mimetype, "video/x-gst-av-%s", ext) =3D=3D 1) {
-diff --git a/ext/libav/gstavutils.c b/ext/libav/gstavutils.c
-index 3780cff..f3878c3 100644
---- a/ext/libav/gstavutils.c
-+++ b/ext/libav/gstavutils.c
-@@ -36,7 +36,7 @@
- const gchar *
- gst_ffmpeg_get_codecid_longname (enum AVCodecID codec_id)
- {
--  AVCodec *codec;
-+  const AVCodec *codec;
-   /* Let's use what ffmpeg can provide us */
-=20
-   if ((codec =3D avcodec_find_decoder (codec_id)) ||
-diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
-index 7ec5766..5dd207e 100644
---- a/ext/libav/gstavviddec.c
-+++ b/ext/libav/gstavviddec.c
-@@ -320,12 +320,7 @@ gst_ffmpegviddec_finalize (GObject * object)
-   GstFFMpegVidDec *ffmpegdec =3D (GstFFMpegVidDec *) object;
-=20
-   av_frame_free (&ffmpegdec->picture);
--
--  if (ffmpegdec->context !=3D NULL) {
--    gst_ffmpeg_avcodec_close (ffmpegdec->context);
--    av_free (ffmpegdec->context);
--    ffmpegdec->context =3D NULL;
--  }
-+  avcodec_free_context (&ffmpegdec->context);
-=20
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -363,13 +358,11 @@ gst_ffmpegviddec_close (GstFFMpegVidDec * ffmpegde=
c, gboolean reset)
-=20
-   gst_buffer_replace (&ffmpegdec->palette, NULL);
-=20
--  if (ffmpegdec->context->extradata) {
--    av_free (ffmpegdec->context->extradata);
--    ffmpegdec->context->extradata =3D NULL;
--  }
-+  av_freep (&ffmpegdec->context->extradata);
-   if (reset) {
--    if (avcodec_get_context_defaults3 (ffmpegdec->context,
--            oclass->in_plugin) < 0) {
-+    avcodec_free_context (&ffmpegdec->context);
-+    ffmpegdec->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegdec->context =3D=3D NULL) {
-       GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -1704,7 +1697,7 @@ gst_ffmpegviddec_video_frame (GstFFMpegVidDec * ff=
mpegdec,
-     if (side_data) {
-       GST_LOG_OBJECT (ffmpegdec,
-           "Found CC side data of type AV_FRAME_DATA_A53_CC, size %d",
--          side_data->size);
-+          (int) side_data->size);
-       GST_MEMDUMP ("A53 CC", side_data->data, side_data->size);
-=20
-       /* do not add closed caption meta if it already exists */
-@@ -1966,8 +1959,9 @@ gst_ffmpegviddec_start (GstVideoDecoder * decoder)
-   oclass =3D (GstFFMpegVidDecClass *) (G_OBJECT_GET_CLASS (ffmpegdec));
-=20
-   GST_OBJECT_LOCK (ffmpegdec);
--  gst_ffmpeg_avcodec_close (ffmpegdec->context);
--  if (avcodec_get_context_defaults3 (ffmpegdec->context, oclass->in_plu=
gin) < 0) {
-+  avcodec_free_context (&ffmpegdec->context);
-+  ffmpegdec->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegdec->context =3D=3D NULL) {
-     GST_DEBUG_OBJECT (ffmpegdec, "Failed to set context defaults");
-     GST_OBJECT_UNLOCK (ffmpegdec);
-     return FALSE;
-@@ -2261,10 +2255,10 @@ gst_ffmpegviddec_get_property (GObject * object,
-=20
-   switch (prop_id) {
-     case PROP_LOWRES:
--      g_value_set_enum (value, ffmpegdec->context->lowres);
-+      g_value_set_enum (value, ffmpegdec->lowres);
-       break;
-     case PROP_SKIPFRAME:
--      g_value_set_enum (value, ffmpegdec->context->skip_frame);
-+      g_value_set_enum (value, ffmpegdec->skip_frame);
-       break;
-     case PROP_DIRECT_RENDERING:
-       g_value_set_boolean (value, ffmpegdec->direct_rendering);
-diff --git a/ext/libav/gstavvidenc.c b/ext/libav/gstavvidenc.c
-index 0468d88..2ed9e5a 100644
---- a/ext/libav/gstavvidenc.c
-+++ b/ext/libav/gstavvidenc.c
-@@ -224,8 +224,8 @@ gst_ffmpegvidenc_finalize (GObject * object)
-   av_frame_free (&ffmpegenc->picture);
-   gst_ffmpeg_avcodec_close (ffmpegenc->context);
-   gst_ffmpeg_avcodec_close (ffmpegenc->refcontext);
--  av_free (ffmpegenc->context);
--  av_free (ffmpegenc->refcontext);
-+  av_freep (&ffmpegenc->context);
-+  av_freep (&ffmpegenc->refcontext);
-=20
-   G_OBJECT_CLASS (parent_class)->finalize (object);
- }
-@@ -247,10 +247,10 @@ gst_ffmpegvidenc_set_format (GstVideoEncoder * enc=
oder,
-=20
-   /* close old session */
-   if (ffmpegenc->opened) {
--    gst_ffmpeg_avcodec_close (ffmpegenc->context);
-+    avcodec_free_context (&ffmpegenc->context);
-     ffmpegenc->opened =3D FALSE;
--    if (avcodec_get_context_defaults3 (ffmpegenc->context,
--            oclass->in_plugin) < 0) {
-+    ffmpegenc->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegenc->context =3D=3D NULL) {
-       GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
-       return FALSE;
-     }
-@@ -454,9 +454,9 @@ bad_input_fmt:
-   }
- close_codec:
-   {
--    gst_ffmpeg_avcodec_close (ffmpegenc->context);
--    if (avcodec_get_context_defaults3 (ffmpegenc->context,
--            oclass->in_plugin) < 0)
-+    avcodec_free_context (&ffmpegenc->context);
-+    ffmpegenc->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+    if (ffmpegenc->context =3D=3D NULL)
-       GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
-     goto cleanup_stats_in;
-   }
-@@ -896,8 +896,9 @@ gst_ffmpegvidenc_start (GstVideoEncoder * encoder)
-   ffmpegenc->need_reopen =3D FALSE;
-=20
-   /* close old session */
--  gst_ffmpeg_avcodec_close (ffmpegenc->context);
--  if (avcodec_get_context_defaults3 (ffmpegenc->context, oclass->in_plu=
gin) < 0) {
-+  avcodec_free_context (&ffmpegenc->context);
-+  ffmpegenc->context =3D avcodec_alloc_context3 (oclass->in_plugin);
-+  if (ffmpegenc->context =3D=3D NULL) {
-     GST_DEBUG_OBJECT (ffmpegenc, "Failed to set context defaults");
-     return FALSE;
-   }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
similarity index 66%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.b=
b
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
index 64b8bcdb52..4296172044 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
@@ -7,16 +7,13 @@ SECTION =3D "multimedia"
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a de=
pendency
 LICENSE_FLAGS =3D "commercial"
 LICENSE =3D "LGPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770 \
                     file://ext/libav/gstav.h;beginline=3D1;endline=3D18;=
md5=3Da752c35267d8276fd9ca3db6994fca9c \
                     "
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-$=
{PV}.tar.xz \
-           file://0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch \
-           "
-SRC_URI[sha256sum] =3D "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927ba=
b3112e9de693a548"
+require gstreamer1.0-source.inc
=20
-S =3D "${WORKDIR}/gst-libav-${PV}"
+S =3D "${SRC_BASE}/subprojects/gst-libav"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
=20
--=20
2.34.1


