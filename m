Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D50E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:08:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.90.1736273332058159535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uCSN+2eA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f441904a42so23612638a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273331; x=1736878131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGonQZ90AysuJYBXCz29QFaLNxOQ8xzL21uchY0agTg=;
        b=uCSN+2eAA1MuQvG2uGRYdU8r+csS0GZQuMPPEA5PVnwy8cZ/CAJz0YdruRrzWydlvf
         lEqwZJujn6u+RC/nbUV8g1GLfoXJG1I22i2uY9uz7yoPyinKob7HPyGKHhGvytC58NQ3
         OixBh+1TazhvXTKj9EVwXa3JD6dVv7tdi0+lGYklVZ073t+5vepooTxlfdhQovIoM0CJ
         WwEdHA3VaLBtinY5mgV6GpVUgvtp2jQYVwTQNlewrZn23jMGWCKW1zjDmeukg/8xYNNP
         TslNF/lczdNLalpOnLi3OGhxaD5Z/mgrYFHCgo+pQYHEvKlvhVCrPgtUy9JTpbIVw1qD
         ZB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273331; x=1736878131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGonQZ90AysuJYBXCz29QFaLNxOQ8xzL21uchY0agTg=;
        b=QZO8qtEQXqr3THEvlGYk7QINiEkkQity8Yig/NHx4I1SVellE4F1lEBm89lfKc8iFD
         MbJObAj6kJ7XclqOv3ayuNGzJD/S2RkXsT2d9Vd98/x/Y/lIBDQmp1pX1k6uUxsrk6yw
         jRpCoD6Q0nh/xlfAoj+OFPCSCWPKny9pz7m4Lx7HlvYcqLw3amsv9xHZIPnh902C5S6R
         TepNf/06tqg/67fzeX1g2MuLAhVb4xhe7BcIncXMhJKK/TK7AlGYwjTMfzzbEH7jn95y
         LDxV9HLXwOKAMtjLXPo7lKVDmcGNOHy24a3YBR6WVMtkKHqucpD74U5o/S/BEF+9jMra
         WHNw==
X-Gm-Message-State: AOJu0YzMzEci/9ZFWgN9ZQackCmgtkXvdjeV7oiGJ7uVkkUxM6CAO29d
	swaQeQy8XzdsIfsKbkspJF21jLcIQRfdg56w8ij3g8P+Y65/LeTko+EWIdxlFVMKFo0W0lG97fB
	FG3g=
X-Gm-Gg: ASbGncsidIrY8PqOWez6vr+U/Bu8ABjx9EcJCdVit0CG8Y7izA+2TZUPbH7mhQfmDqH
	bLKlA9u9aa2utKIIsW0nAbtargiAqgCTYEwCghPiiVijFq/2vpyxHvq2VBiJ3CRvadLAPljRtpI
	HUdHXjHFYDdSaYHEcaIm4QXTVizLgBrDNNPKa7j1AWCuzy50xBFj3EtwRh75xsJGmzQ8uJljcNO
	li8uHWOBXDTPbTUkGEXmMLDipu/xpZ3K9FF9gvxUPtiww==
X-Google-Smtp-Source: AGHT+IHzRU3wYT1OF7Mm6R6uU/9ApPiAEKGWuDvw8EN+3oYod9LYvxLyh7cny4CaVNxSdqxaSscPrA==
X-Received: by 2002:a17:90b:5484:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2f452e1c26fmr94883876a91.9.1736273331295;
        Tue, 07 Jan 2025 10:08:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] gstreamer1.0-plugins-good: Fix for CVE-2024-47599
Date: Tue,  7 Jan 2025 10:08:22 -0800
Message-ID: <2fe3b2846bd65a44e4823f04693a4579a71a862a.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209485

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-47599.patch                      | 99 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47599.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47599.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47599.patch
new file mode 100644
index 0000000000..8dde992bcb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47599.patch
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
index 98cef84081..0daae0b519 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch \
            file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch \
            file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch \
+           file://CVE-2024-47599.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.43.0


