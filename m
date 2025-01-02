Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379DEE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 13:33:49 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.8086.1735824823141098641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 05:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bTfqDtAQ;
 spf=pass (domain: mvista.com, ip: 209.85.166.47, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844df397754so432592339f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735824821; x=1736429621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMx80B85MiCu8RgEP6ZTKkMctY4va+QAq8vNe5BW1J8=;
        b=bTfqDtAQ32FQyZj82sGQwZ+7qPtXQmn9Khx51eQQQazSYYCXD8wWL4dswIm0goS0ok
         hNtRyNyEvZTXAbv1S9i0Qm3iKJGc32/7I0CGIwLbFEpdMUwe8MO2VcyhDfkvzrn0nAXH
         WJyBgnhw+O2RkfAT35kXBC0TIOlIHyPn6oTYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735824821; x=1736429621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMx80B85MiCu8RgEP6ZTKkMctY4va+QAq8vNe5BW1J8=;
        b=Eccyj/T9WKVHU0dV1h8i9i6ulfRoohNKZRcfK6V/rsbNDHCq83KuTgf9TihutYYmKY
         aUqtOleCv2LspkkmnCJv1+U3qY6ztsOIAPsYpLcIEuKZljXvLk80KYR/If6u6zWaa+tX
         SbELtQAbuFyuy+XvqE16p6yTuJag2JT6Q6I6DxYXgc7zhjUI6qpE1nN4b2nCYbGDCp3t
         HCp3uh0kwLXff0pNc1S59Tv0oAYWd0woMPc34TyGEF5ofar6eHV2AYDeFH7biJwRhomk
         dDF71G/CcUtpS9597t7t8pH37z964MfCCTItEIoJXXVIMeN2KfHfvulk9PYLmG+MUfy+
         9iKg==
X-Gm-Message-State: AOJu0Ywk01+cMHWuiFvphQzWI9vyMSnQ2Uz1icH3d8MoQ/RsMzWU6Hsd
	11jizOAsiySbym6CfPG7XdKuMORATXpHTzaA5+otj2FHDZJdTZS4T7yU9OEzthYKdgcX7qFZFuE
	mI8Y=
X-Gm-Gg: ASbGncuPPlpHrawsL1TwpImNg76fo8HmagGGtCC+F7y9LMOM243JouBwrl+NHlGQQHS
	zZjI4s2XXdv++Tlfzxr0n+c/zyAzDely9oXW4ET1cZzJ7ZvMwV2y+6qT59M09FLolAzeckaVrJq
	/V2qHscqVzG3HBu/E4y8zwFVY/H08Q5fu/PdEuWhmKzWGqnfzaBxTLgWfw/GnGscSOJz1AgqYR1
	YGLyYUn3nB8aK0iBAJJaO/t/MoVvUsf5avc/pfISJej+s+xvuFsSzOR3EsKRvbQrQ08oZc=
X-Google-Smtp-Source: AGHT+IHr19kN7YPAmxl5SGbR30sjTyXqtqy8/dNci/CUzSvpvZ785Ms01grBMGY9dnEb+k8PjTjQjw==
X-Received: by 2002:a05:6602:29c7:b0:844:6297:7c1d with SMTP id ca18e2360f4ac-8499e7ecb50mr4076703539f.15.1735824821626;
        Thu, 02 Jan 2025 05:33:41 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:79d6:d2bf:f7c6:a6fe:8968])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8aa81bsm685493139f.36.2025.01.02.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 05:33:40 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/7] gstreamer1.0-plugins-good: Fix for CVE-2024-47599
Date: Thu,  2 Jan 2025 19:03:13 +0530
Message-Id: <20250102133318.642859-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102133318.642859-1-vanusuri@mvista.com>
References: <20250102133318.642859-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 13:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209304

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...ly-error-out-on-negotiation-failures.patch | 99 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-jpegdec-Directly-error-out-on-negotiation-failures.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-jpegdec-Directly-error-out-on-negotiation-failures.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-jpegdec-Directly-error-out-on-negotiation-failures.patch
new file mode 100644
index 0000000000..8dde992bcb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-jpegdec-Directly-error-out-on-negotiation-failures.patch
@@ -0,0 +1,99 @@
+From 3cdf206f4fc5a9860bfe1437ed3d01e7d23c6c3e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 16:22:19 +0300
+Subject: [PATCH] jpegdec: Directly error out on negotiation failures
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-247
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3862
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3cdf206f4fc5a9860bfe1437ed3d01e7d23c6c3e]
+CVE: CVE-2024-47599
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/ext/jpeg/gstjpegdec.c    | 22 ++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/ext/jpeg/gstjpegdec.c b/subprojects/gst-plugins-good/ext/jpeg/gstjpegdec.c
+index 51bc2d14bf0e..7523419835ee 100644
+--- a/ext/jpeg/gstjpegdec.c
++++ b/ext/jpeg/gstjpegdec.c
+@@ -1068,13 +1068,14 @@ gst_jpeg_turbo_parse_ext_fmt_convert (GstJpegDec * dec, gint * clrspc)
+ }
+ #endif
+ 
+-static void
++static gboolean
+ gst_jpeg_dec_negotiate (GstJpegDec * dec, gint width, gint height, gint clrspc,
+     gboolean interlaced)
+ {
+   GstVideoCodecState *outstate;
+   GstVideoInfo *info;
+   GstVideoFormat format;
++  gboolean res;
+ 
+ #ifdef JCS_EXTENSIONS
+   if (dec->format_convert) {
+@@ -1104,7 +1105,7 @@ gst_jpeg_dec_negotiate (GstJpegDec * dec, gint width, gint height, gint clrspc,
+         height == GST_VIDEO_INFO_HEIGHT (info) &&
+         format == GST_VIDEO_INFO_FORMAT (info)) {
+       gst_video_codec_state_unref (outstate);
+-      return;
++      return TRUE;
+     }
+     gst_video_codec_state_unref (outstate);
+   }
+@@ -1118,6 +1119,8 @@ gst_jpeg_dec_negotiate (GstJpegDec * dec, gint width, gint height, gint clrspc,
+   outstate =
+       gst_video_decoder_set_output_state (GST_VIDEO_DECODER (dec), format,
+       width, height, dec->input_state);
++  if (!outstate)
++    return FALSE;
+ 
+   switch (clrspc) {
+     case JCS_RGB:
+@@ -1142,10 +1145,12 @@ gst_jpeg_dec_negotiate (GstJpegDec * dec, gint width, gint height, gint clrspc,
+ 
+   gst_video_codec_state_unref (outstate);
+ 
+-  gst_video_decoder_negotiate (GST_VIDEO_DECODER (dec));
++  res = gst_video_decoder_negotiate (GST_VIDEO_DECODER (dec));
+ 
+   GST_DEBUG_OBJECT (dec, "max_v_samp_factor=%d", dec->cinfo.max_v_samp_factor);
+   GST_DEBUG_OBJECT (dec, "max_h_samp_factor=%d", dec->cinfo.max_h_samp_factor);
++
++  return res;
+ }
+ 
+ static GstFlowReturn
+@@ -1425,8 +1430,9 @@ gst_jpeg_dec_handle_frame (GstVideoDecoder * bdec, GstVideoCodecFrame * frame)
+     num_fields = 1;
+   }
+ 
+-  gst_jpeg_dec_negotiate (dec, width, output_height,
+-      dec->cinfo.jpeg_color_space, num_fields == 2);
++  if (!gst_jpeg_dec_negotiate (dec, width, output_height,
++          dec->cinfo.jpeg_color_space, num_fields == 2))
++    goto negotiation_failed;
+ 
+   state = gst_video_decoder_get_output_state (bdec);
+   ret = gst_video_decoder_allocate_output_frame (bdec, frame);
+@@ -1558,6 +1564,12 @@ map_failed:
+     ret = GST_FLOW_ERROR;
+     goto exit;
+   }
++negotiation_failed:
++  {
++    GST_ELEMENT_ERROR (dec, CORE, NEGOTIATION, (NULL), ("failed to negotiate"));
++    ret = GST_FLOW_NOT_NEGOTIATED;
++    goto exit;
++  }
+ decode_error:
+   {
+     gchar err_msg[JMSG_LENGTH_MAX];
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 5427cdb75d..d437145b62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0011-qtdemux-Actually-handle-errors-returns-from-various-.patch \
            file://0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch \
            file://0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch \
+           file://0014-jpegdec-Directly-error-out-on-negotiation-failures.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


