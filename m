Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA8FE7719B
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.18134.1735998133689883836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zdjhOYeE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2162c0f6a39so191322505ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998133; x=1736602933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q57dOzT6trGAtAwnBD7KczK74PmFPS2iK04foy1n42g=;
        b=zdjhOYeEeTB6/p8VO5fWqh7xGqzwMAd0jYcl5Pgg6EXS6mbQITd3YHfGUVAXgdNyyZ
         DcVVHvkqnAphqyF18eqob9552AvVEnlg9zy07dFSS0KD4N3B/fzCGoUkBd+fnonx5zlS
         JgvLCFhRtH4tUtTn4ZrOR7k46p34kcvRFE8zHN6fgYCePc71N7/v1E+oNeEESdYaYxYD
         0V5RiT4rKJZvg5tYHca3HtyrNwt1fAcEqp9rvslqflnbXa+mTlfmzy1v9Itl1g79wEKI
         yZCWfQSX/iK49YugKflGx0anNTam3VRrw5r2AEGpRU/zyGVhjtWSm/hJUMy5pAJeFojW
         a62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998133; x=1736602933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q57dOzT6trGAtAwnBD7KczK74PmFPS2iK04foy1n42g=;
        b=K0ln89AxtiensI0a68HxFsVHOuMZoLEqTl+lHcfjLKK/K44i73zqAdNpS+cHolwdfD
         b1M1Frbhqa1oHzXJNl6FRKONkDe5niugqJvG7MqCbwLR/0rvF+4Oid84WPlM2tk6F6vH
         xGwyO13aduPM1se1WTxo5SbOiwHkY8E2cxUCpnhzdXWMpFNZH1Vdp2kJ0leo5/aiqNQ+
         Xh8afrfzkanG67ajwALYB4Z1QPazAAvnBunR6IZKuUuuyhrHvi/0uaDty4q9WJ2El0SQ
         KTVfx1NRUKxBSHu1Cgo4QyHMuZYLvC9ErwLa3j9uROf+dAqbwNE/hkCc9BouNQQyE86p
         JumA==
X-Gm-Message-State: AOJu0YzYsHT2FRv692CdUEGLoTPuYHbvd7DOEY9IBH4vWT0a36atgkgb
	LuuPgvNloFN94I2SEfsX1KOooZOij4X6Zx9qKTLzVRAgsul2v/AFBx3ZpFH1AzVk8YNAhBmeIPm
	s
X-Gm-Gg: ASbGnctEihLbXfx64+rnZRfFdqQbue5Q+LFkRMWy2EKvXnRhFuZw9MWA9WOM3jEQPgC
	LtxBKc/5JAj7jaOu0G0ON5ujDEAku4PIDtgU740+GvWgWuEx7nyzx7TAbGdsnWpjs3JSZ3Tjqyn
	FLE8e47zZTN6x5r9/X6GD4RBqoII3IxNSbKIxuCE/q+l5YuBYSLe0o7bzvWbO900xpLnXLwP+e/
	g/YaC1HFFHp4jSlHleALu2FvOqitKrNZKYykppaMuAbLw==
X-Google-Smtp-Source: AGHT+IEZqMxLAeVFihzaZ7QZkdiPSnQzXBi/rZoS/+jX8YMUuRZb7UbsfZfxMJ1oGWH3uc316dm+fQ==
X-Received: by 2002:a05:6a20:3d89:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1e5e1e26e2emr78276581637.7.1735998132852;
        Sat, 04 Jan 2025 05:42:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/25] gstreamer1.0-plugins-good: patch CVE-2024-47599
Date: Sat,  4 Jan 2025 05:41:33 -0800
Message-ID: <ba5545302daee0fb5ac2f3ca45cf8524cee278dc.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209378

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ly-error-out-on-negotiation-failures.patch | 99 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-jpegdec-Directly-error-out-on-negotiation-failures.patch
new file mode 100644
index 0000000000..037afdc4ee
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
index 96dd6f7228..85c9a20a2d 100644
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
2.43.0


