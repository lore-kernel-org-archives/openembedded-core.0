Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 222B76B076
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:04 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id c17so6678732pgg.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jfORu9Du3FIPWMzpiD0IFHopb4V5kcWW7I7Rw25iqDM=;
	b=TEzdBKj1QtdxAkdfXsJZKe3r1q7TbHBdkwOkLhaoslf8cC8V4FE2QH1antkr2s3N2S
	rfeKOTGJW5c5U7ijtNv4znoJ0JmpRUyMHCib/hjviMvRVi2MIeugRzi85BK8gfEM0xGg
	5V1n+MLqfIIvYQiqyL0lq5k05xQ3UvrbcXC4AZvFisNIPu+cNzbfCtf48VlJhwv7CUU2
	6lwE+RqUml1fX3kaQm6Gkk2iCRApc+4eQ2QK1/CPtiYyXYDuOLceZVn/wOReM9rfbiNV
	2Lan5oxOcwljsFEpGF52ggqIBhzSrtPmecVhLSDNcmFFqAEhJhTajcpzUz162SdzgsFC
	asyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jfORu9Du3FIPWMzpiD0IFHopb4V5kcWW7I7Rw25iqDM=;
	b=eGDRUhCmP18XefmheqsNtY4xjtVOG2p6hWguVVkjk5ne729y8JAgT9w+xqabvObjxe
	2UuPWyl3BomMJVrDTZ2WfoFWnuumKkHxkyBKzRIWFDL3ppLyTs6CLwHDx/LziAjX/s83
	WToTJ1Z+pF2iSq18Jehh30Nu0MswPzy18RYoHFsCmY+hhr6eEjh9/ljnLEGz8Vzqrqt0
	l1NhHDekfErZw7pcvgEltUsT/dPNwI3YliqZj87rUq5uiyQIIqBk0iKHE+xJ8kiN5NRx
	p3ubbRm14Jm0f0cQMYBmtgs+BlXF/DXdV2dB6WN1AoZFMwKS8JR9r0yHs8YXLo8KAjo0
	yCQQ==
X-Gm-Message-State: APjAAAUypXMRCN7v4niCjf1mKvGVTQNPpgjpxjuAYARi/8v0r2nYKLbR
	xvPSFlO0xkhAoAJNFRUxm9eGAnKo/J8=
X-Google-Smtp-Source: APXvYqyO7XsJyJNK4ipdHA3UiHywpbx8VjWFrOYHDuBBHkMS9Yfx6telc/C6xwjLn0pxgEdG86909g==
X-Received: by 2002:a17:90a:f487:: with SMTP id
	bx7mr23795777pjb.83.1569818885107; 
	Sun, 29 Sep 2019 21:48:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:06 -0700
Message-Id: <507135276293287deed972d49feed511c21391a0.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 11/54] gstreamer1.0-vaapi: backport jpeg encode/decode fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2019 04:48:04 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Backport patches from 1.15 to fix JPEG encode/decode issues when
using VAAPI with Intel media-driver. See for details:

https://bugzilla.gnome.org/show_bug.cgi?id=796705
https://bugzilla.gnome.org/show_bug.cgi?id=796505

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...der-release-VA-buffers-after-vaEndPicture.patch | 45 +++++++++++++++
 ...ibs-encoder-jpeg-set-component-id-and-Tqi.patch | 65 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.14.4.bb         |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-decoder-release-VA-buffers-after-vaEndPicture.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-encoder-jpeg-set-component-id-and-Tqi.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-decoder-release-VA-buffers-after-vaEndPicture.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-decoder-release-VA-buffers-after-vaEndPicture.patch
new file mode 100644
index 0000000..b52e61b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-decoder-release-VA-buffers-after-vaEndPicture.patch
@@ -0,0 +1,45 @@
+From bb8894aaf934b3af4d44cf54e860510fe4d615b3 Mon Sep 17 00:00:00 2001
+From: Tianhao Liu <tianhao.liu@intel.com>
+Date: Thu, 7 Jun 2018 09:34:11 +0800
+Subject: [PATCH] libs: decoder: release VA buffers after vaEndPicture
+
+This change is due a problem decoding JPEGs with Intel's media-driver:
+no image was generated.
+
+This patch relases the VA buffers after vaEndPicture() is called,
+and not before (after vaRenderPicture()).
+
+https://bugzilla.gnome.org/show_bug.cgi?id=796505
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/commit/bb8894aaf934b3af4d44cf54e860510fe4d615b3]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gst-libs/gst/vaapi/gstvaapidecoder_objects.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/vaapi/gstvaapidecoder_objects.c b/gst-libs/gst/vaapi/gstvaapidecoder_objects.c
+index 20d4f55..2dd4c27 100644
+--- a/gst-libs/gst/vaapi/gstvaapidecoder_objects.c
++++ b/gst-libs/gst/vaapi/gstvaapidecoder_objects.c
+@@ -304,12 +304,17 @@ gst_vaapi_picture_decode (GstVaapiPicture * picture)
+     status = vaRenderPicture (va_display, va_context, va_buffers, 2);
+     if (!vaapi_check_status (status, "vaRenderPicture()"))
+       return FALSE;
++  }
++
++  status = vaEndPicture (va_display, va_context);
++
++  for (i = 0; i < picture->slices->len; i++) {
++    GstVaapiSlice *const slice = g_ptr_array_index (picture->slices, i);
+ 
+     vaapi_destroy_buffer (va_display, &slice->param_id);
+     vaapi_destroy_buffer (va_display, &slice->data_id);
+   }
+ 
+-  status = vaEndPicture (va_display, va_context);
+   if (!vaapi_check_status (status, "vaEndPicture()"))
+     return FALSE;
+   return TRUE;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-encoder-jpeg-set-component-id-and-Tqi.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-encoder-jpeg-set-component-id-and-Tqi.patch
new file mode 100644
index 0000000..eb1228b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-libs-encoder-jpeg-set-component-id-and-Tqi.patch
@@ -0,0 +1,65 @@
+From f5eb4faa5914f3745820e557ac2401a7d738be66 Mon Sep 17 00:00:00 2001
+From: Tianhao Liu <tianhao.liu@intel.com>
+Date: Wed, 4 Jul 2018 12:51:10 +0800
+Subject: [PATCH] libs: encoder: jpeg: set component id and Tqi
+
+This change is due a problem encoding JPEGs with Intel's
+media-driver: green/black image when playback jpeg
+
+This patch sets component identifier and quantization table
+destination selector in frame header to support packing headers
+by Intel's media-driver that does not accept packed header
+in AP level.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=796705
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/commit/f5eb4faa5914f3745820e557ac2401a7d738be66]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gst-libs/gst/vaapi/gstvaapiencoder_jpeg.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/gst-libs/gst/vaapi/gstvaapiencoder_jpeg.c b/gst-libs/gst/vaapi/gstvaapiencoder_jpeg.c
+index b3f409d..8491fbc 100644
+--- a/gst-libs/gst/vaapi/gstvaapiencoder_jpeg.c
++++ b/gst-libs/gst/vaapi/gstvaapiencoder_jpeg.c
+@@ -205,6 +205,7 @@ fill_picture (GstVaapiEncoderJpeg * encoder,
+     GstVaapiEncPicture * picture,
+     GstVaapiCodedBuffer * codedbuf, GstVaapiSurfaceProxy * surface)
+ {
++  guint i;
+   VAEncPictureParameterBufferJPEG *const pic_param = picture->param;
+ 
+   memset (pic_param, 0, sizeof (VAEncPictureParameterBufferJPEG));
+@@ -224,6 +225,11 @@ fill_picture (GstVaapiEncoderJpeg * encoder,
+   pic_param->num_scan = 1;
+   pic_param->num_components = encoder->n_components;
+   pic_param->quality = encoder->quality;
++  for (i = 0; i < pic_param->num_components; i++) {
++    pic_param->component_id[i] = i + 1;
++    if (i != 0)
++      pic_param->quantiser_table_selector[i] = 1;
++  }
+   return TRUE;
+ }
+ 
+@@ -437,13 +443,11 @@ generate_frame_hdr (GstJpegFrameHdr * frame_hdr, GstVaapiEncoderJpeg * encoder,
+   frame_hdr->num_components = pic_param->num_components;
+ 
+   for (i = 0; i < frame_hdr->num_components; i++) {
+-    frame_hdr->components[i].identifier = i + 1;
++    frame_hdr->components[i].identifier = pic_param->component_id[i];
+     frame_hdr->components[i].horizontal_factor = encoder->h_samp[i];
+     frame_hdr->components[i].vertical_factor = encoder->v_samp[i];
+-    if (i == 0)
+-      frame_hdr->components[i].quant_table_selector = 0;
+-    else
+-      frame_hdr->components[i].quant_table_selector = 1;
++    frame_hdr->components[i].quant_table_selector =
++        pic_param->quantiser_table_selector[i];
+   }
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
index 3896434..6243edd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
            file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
            file://0001-vaapsink-downgrade-to-marginal.patch \
+           file://0001-libs-encoder-jpeg-set-component-id-and-Tqi.patch \
+           file://0001-libs-decoder-release-VA-buffers-after-vaEndPicture.patch \
            "
 
 SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
-- 
2.7.4


