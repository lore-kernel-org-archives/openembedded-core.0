Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94295E77198
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:44:01 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.33591.1736055834366858567
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LvbpRKaK;
 spf=pass (domain: mvista.com, ip: 209.85.166.44, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-84cb9c4aab6so6381439f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055832; x=1736660632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFgXvP32UqVqwgqBWg8l1Qdp/h116QtGsxfQ4EtE9KQ=;
        b=LvbpRKaKg5fWEWHuDT4J0CFwiF8jG+jpDutxX1gIsbimZyXUYd5TrsZ/vDc4KvwfkH
         5vjsAt3ygs8E270p1JmANi/s0zCnLppkV47qPIc4+xyRUakAfSJ23r0fvtHaBSX4jjy7
         GRB4f+cVXeqmSRZ8c1sKZtLuSPrzb80i6OO0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055832; x=1736660632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFgXvP32UqVqwgqBWg8l1Qdp/h116QtGsxfQ4EtE9KQ=;
        b=ZPU6D6FDO6C4/QxfWU7kjqP5HSBEfFLgg0Ez+wDsnsNXg+ZjeTUWppjGRYeSF5kWb7
         d8cFESwd3MWFH7eoBisOO7y0k3vAa2Vugr8XOVZFBPe6AxpxcQuuYrz3CdLWMfENqjJv
         DNlz65+vBF74u9Ld5ZavhaBf4pI+g5zBX4LkQSOfn8QqiI59mILIggAZXQQQwJU6I81k
         vZIMz/kN+s2Otq29PEqtfaGVsLINd9L4jjXPHT729NsRuBhalel/dRGSPQLPh2/a3Hqg
         2cuIV4qMvWipFeHcALb2JA7ShyviaS5MG3ooGd9w0YaPKzsdyQ267UWecAu5PavnnCHH
         NWLA==
X-Gm-Message-State: AOJu0YwRAdvkKWP+XKlWIBfhXW7USsjf8dBqWoVS8Nq77zqO93kTiRVf
	A8D0OCPfZg0/H3xAL5p958WMEFD+lCPMG59BzwVHbfmRbN3c9MezbRA7+EV+cB7Hj0mnWghcZo5
	dGAc=
X-Gm-Gg: ASbGncu4KPc2BaekDzi4vEhJKEpyCWNiUVpfI6hPN4XOxnjV9y1ymgf8iagduPilmbs
	SmU2Tz632FpYsD7ajr9rCF+7yQfSlI3p/0H2JdYd6sC6PP577+d8Q81sw8rZUYPdUGgTk7iTO7J
	g8vNaO0C6IokEQmP7yx2yaRTiaZuRvTiuJabbQ37CV7IH7KfqjsrvJRJzKdEbY4nt/O/6f3sM0v
	+0+RgKlPGJFOx8YRwDcJg+1TwgH6Vs8zQnXkl/GVh7cdCvqrrx+BRbDLprcT/izXzB+Xms=
X-Google-Smtp-Source: AGHT+IGlndq3plnA6QlW24cYmbhv7OhzY8uFtkI+z/banE/0rJEVFi/YzaIKm6lATlMMDZLKsnNPHw==
X-Received: by 2002:a05:6602:3814:b0:849:a5ef:bc8b with SMTP id ca18e2360f4ac-849a5efc1e1mr5085759539f.4.1736055832174;
        Sat, 04 Jan 2025 21:43:52 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:43:50 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 4/9] gstreamer1.0-plugins-good: Fix for CVE-2024-47599
Date: Sun,  5 Jan 2025 11:13:13 +0530
Message-Id: <20250105054318.222154-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209409

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8040

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


