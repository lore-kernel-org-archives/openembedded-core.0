Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D375E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:29:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.66265.1735579731768551539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QUlYYXDH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024123017285385d4e5367076ee3b80-vtj0ep@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024123017285385d4e5367076ee3b80
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4p1L8q6hbC35kvUeQHOd0hqx7cmVhLoI8FcJyJ/q+0w=;
 b=QUlYYXDHWtSLm8PGbLcqXrWr8KqfnKpsjIzIQBgEFv7d7asoqZiS5+rqvzpIpnU13sUcrW
 CJ/rFNW97JyOjZpp5x/4LhaGOj86Db0idd0nq7wFC787Nr/I6hlQsl0X+lQmHD71kfHsN6Fi
 3fhWcqvWm0fl6fEkXkGqDhKyLr3LkfVzACKzuAPRalCW3KiCE+f15REaz4WGh6AsUi3h6mIe
 9JCWp+SRDc+lU8fqSS8YRRQKuF42ulyavMPKMpYXSoX0d4TasgrWH5ddvYXdwiAPjgfEfTfk
 K6UrffGVVjoYr1OcWhfXcwxFywu2Tsz+SpRf2aB1IOalL3u+chA0JU+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 09/16] gstreamer1.0-plugins-good: patch CVE-2024-47599
Date: Mon, 30 Dec 2024 18:27:16 +0100
Message-Id: <20241230172723.3644270-9-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209173

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ly-error-out-on-negotiation-failures.patch | 99 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch
new file mode 100644
index 00000000000..037afdc4ee1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch
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
+CVE: CVE-2024-47599
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3cdf206f4fc5a9860bfe1437ed3d01e7d23c6c3e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .../gst-plugins-good/ext/jpeg/gstjpegdec.c    | 22 ++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/ext/jpeg/gstjpegdec.c b/ext/jpeg/gstjpegdec.c
+index 51bc2d14bf..7523419835 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 96dd6f7228f..85c9a20a2de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0019-matroskademux-Skip-over-laces-directly-when-postproc.patch \
            file://0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch \
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
+           file://0022-jpegdec-Directly-error-out-on-negotiation-failures.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.30.2


