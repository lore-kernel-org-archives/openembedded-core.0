Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7818BCE7AE7
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.6170.1695869338323822774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qWnd/g+e;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.47, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-65b162328edso36237056d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869337; x=1696474137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDKUVbP8cK8HdrBnWwDLpYvgeoxUjuW9h0IUWjVer8s=;
        b=qWnd/g+eN8ZzAQI3beFHTLwQFFrk9XhkfILHzrqoHlYSl8ZIwe7Nvxn5yd4je5VuWD
         RlcAxJC0zEcx/rEjTCE2/KM221dal3Ip419+8RIwgc/Rolmp23nmCnrbonLJrrGtv/ii
         Ha/TfSZM1NDcGyFWknKQszGBPGSlSvssp1dudFe0Okr3LfPapxxphFw9q6cPKWw0Tvjr
         Zwx04hSisw0onbOxz85oct3fBpLwxdHxrAu16pD+YzOMLCC2/cJTO0QqEyAW5LmLTEHJ
         tbaYFxaUjJriPuGdz5nZI2AM6VzB7517gAP9Do9h3qBhey+ykoJB+H1Pr7RJ6ycmIkee
         kNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869337; x=1696474137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDKUVbP8cK8HdrBnWwDLpYvgeoxUjuW9h0IUWjVer8s=;
        b=d9fO+vMf98H479u5DONPh0sD1uCchDPePMsQpV7m2+FyJzyIvmq9SN9iUKshDhNZKw
         dJNSKYov7fNKx4TIOgfl/BlDQFnk0LledBcUKgnxoURM02jBtNInu9OMwAUeMVv+Y9EC
         BUPxU/gXNpyxZQpYVfGwcvAhgAtO+3abZKE8JD8mOLDBdaK+y1XS2RS+CWNdNE9i865c
         PA0qCD8idByby0zEQIUxeZf6kyzHQRKDdszmZko7gdry4kb830p9zUTZlMax01Gbat6S
         i0gHaTVKfjbxLkZTMBLRADHlIbdHHf8DM768pIGMDb+yyJbec1PbrW4eolJCWbrr010Y
         Xt5g==
X-Gm-Message-State: AOJu0Yzp/HzVeJCm4PB+/VQI9QcWVDVYoGYBwdBFHNbAnWpUp/d0ct0j
	oyf6cWXF6U/dKal8Ptil2Gpl/GL/Su37QtKGSME=
X-Google-Smtp-Source: AGHT+IG1do0ha1OS9kloa0MY052vqDOBO7jQmU4jR9tctPKoHvzIYl6gOdF8mmn6z5vBjMhCDRrZwA==
X-Received: by 2002:a0c:e885:0:b0:65d:d:a116 with SMTP id b5-20020a0ce885000000b0065d000da116mr2701665qvo.61.1695869336974;
        Wed, 27 Sep 2023 19:48:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:48:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/17] gstreamer1.0-plugins-bad: fix CVE-2023-40474
Date: Wed, 27 Sep 2023 16:48:32 -1000
Message-Id: <d0c8e2f78c8003ad383cc63cff32147156412650.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188353

From: Archana Polampalli <archana.polampalli@windriver.com>

gst-plugins-bad: Heap-based buffer overflow in the MXF file demuxer when handling
malformed files with uncompressed video in GStreamer versions before 1.22.6

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-40474.patch                      | 118 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch
new file mode 100644
index 0000000000..dd5886863d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch
@@ -0,0 +1,118 @@
+From ce17e968e4cf900d28ca5b46f6e095febc42b4f0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 10 Aug 2023 15:45:01 +0300
+Subject: [PATCH] mxfdemux: Fix integer overflow causing out of bounds writes
+ when handling invalid uncompressed video
+
+Check ahead of time when parsing the track information whether
+width, height and bpp are valid and usable without overflows.
+
+Fixes ZDI-CAN-21660, CVE-2023-40474
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/2896
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5362>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ce17e968e4cf900d28ca5b46f6e095febc42b4f0]
+CVE: CVE-2023-40474
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/mxf/mxfup.c | 51 +++++++++++++++++----
+ 1 file changed, 43 insertions(+), 8 deletions(-)
+
+diff --git a/gst/mxf/mxfup.c b/gst/mxf/mxfup.c
+index d72ed22cb7..0c0178c1c9 100644
+--- a/gst/mxf/mxfup.c
++++ b/gst/mxf/mxfup.c
+@@ -118,6 +118,8 @@ mxf_up_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+     gpointer mapping_data, GstBuffer ** outbuf)
+ {
+   MXFUPMappingData *data = mapping_data;
++  gsize expected_in_stride = 0, out_stride = 0;
++  gsize expected_in_size = 0, out_size = 0;
+
+   /* SMPTE 384M 7.1 */
+   if (key->u[12] != 0x15 || (key->u[14] != 0x01 && key->u[14] != 0x02
+@@ -146,22 +148,25 @@ mxf_up_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+     }
+   }
+
+-  if (gst_buffer_get_size (buffer) != data->bpp * data->width * data->height) {
++  // Checked for overflows when parsing the descriptor
++  expected_in_stride = data->bpp * data->width;
++  out_stride = GST_ROUND_UP_4 (expected_in_stride);
++  expected_in_size = expected_in_stride * data->height;
++  out_size = out_stride * data->height;
++
++  if (gst_buffer_get_size (buffer) != expected_in_size) {
+     GST_ERROR ("Invalid buffer size");
+     gst_buffer_unref (buffer);
+     return GST_FLOW_ERROR;
+   }
+
+-  if (data->bpp != 4
+-      || GST_ROUND_UP_4 (data->width * data->bpp) != data->width * data->bpp) {
++  if (data->bpp != 4 || out_stride != expected_in_stride) {
+     guint y;
+     GstBuffer *ret;
+     GstMapInfo inmap, outmap;
+     guint8 *indata, *outdata;
+
+-    ret =
+-        gst_buffer_new_and_alloc (GST_ROUND_UP_4 (data->width * data->bpp) *
+-        data->height);
++    ret = gst_buffer_new_and_alloc (out_size);
+     gst_buffer_map (buffer, &inmap, GST_MAP_READ);
+     gst_buffer_map (ret, &outmap, GST_MAP_WRITE);
+     indata = inmap.data;
+@@ -169,8 +174,8 @@ mxf_up_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+
+     for (y = 0; y < data->height; y++) {
+       memcpy (outdata, indata, data->width * data->bpp);
+-      outdata += GST_ROUND_UP_4 (data->width * data->bpp);
+-      indata += data->width * data->bpp;
++      outdata += out_stride;
++      indata += expected_in_stride;
+     }
+
+     gst_buffer_unmap (buffer, &inmap);
+@@ -378,6 +383,36 @@ mxf_up_create_caps (MXFMetadataTimelineTrack * track, GstTagList ** tags,
+     return NULL;
+   }
+
++  if (caps) {
++    MXFUPMappingData *data = *mapping_data;
++    gsize expected_in_stride = 0, out_stride = 0;
++    gsize expected_in_size = 0, out_size = 0;
++
++    // Do some checking of the parameters to see if they're valid and
++    // we can actually work with them.
++    if (data->image_start_offset > data->image_end_offset) {
++      GST_WARNING ("Invalid image start/end offset");
++      g_free (data);
++      *mapping_data = NULL;
++      gst_clear_caps (&caps);
++
++      return NULL;
++    }
++
++    if (!g_size_checked_mul (&expected_in_stride, data->bpp, data->width) ||
++        (out_stride = GST_ROUND_UP_4 (expected_in_stride)) < expected_in_stride
++        || !g_size_checked_mul (&expected_in_size, expected_in_stride,
++            data->height)
++        || !g_size_checked_mul (&out_size, out_stride, data->height)) {
++      GST_ERROR ("Invalid resolution or bit depth");
++      g_free (data);
++      *mapping_data = NULL;
++      gst_clear_caps (&caps);
++
++      return NULL;
++    }
++  }
++
+   return caps;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 86b5301d8e..52acb30d74 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://CVE-2023-40474.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


