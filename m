Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05453CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 08:34:18 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.10407.1760430856184721106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 01:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=GHhP5T5I;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.44, mailfrom: dse@thaumatec.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63bc12a5608so2011500a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1760430854; x=1761035654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZdMuowfGRGP/D3yOuCsxD/uK3NgO1FzkFqSfzRlFpU=;
        b=GHhP5T5I76j38LV0c7BHJmfTdTogpTHVhZDweA4crnxawwvv5h9Y4ShFSXj2BL8ish
         ewQ9+H7ggyf3l00402GkDjqAvIwThTUbz1pftUQYXOyIvzfZszS4hiZwS5bzMWM//NkK
         jFaRJGSL4LDZlB+J3nypbDm4lF44vsiwvEO1yEjCsq3uDLKzrVPL9CaDEpz9BCyvcSxp
         pTVt0akTMm3fN5GNo1ToDpRs2G6LAbKSGZ4jiGuzBHnxKYLxnCCt+eqwjgNXFTT3ERl6
         VuAJMPS0xuh5/QNO5MtWW3FIeV6ZG2t16g+K+irGM36X4XmI96AXilve1JA91FMG4WE/
         snhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430854; x=1761035654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZdMuowfGRGP/D3yOuCsxD/uK3NgO1FzkFqSfzRlFpU=;
        b=XIxi1LrKOliZhQ0JJlTDipYdUFE90P1S1wCiOVJjP5oGwp5zO7raHV7PDlinqCZuJk
         Q2moJT/mv9HpLopMHUxL5pn8pElEisktvndgJXEheZ0yrK6lwz5B2AEWLBqXXN222qrh
         wOJLtIRyYvW8YRvKV+bZWYVjOFpmvcmEvmT1Zdi/+N9nHUBsCv4ovWk0s6PlznlSd9TB
         W9Wg9+A8S7na5FXbz9mKHN9kgTl0MM8S0tC3NTCnraL0Ju69WiW3foZP8qZWplgzDLDs
         itUA44CYyvl/D2QAx73aF6DjFtQXLqUuYy+M6snVDCTfalqfZAoqTYzGUe3PwUESkIKO
         78jA==
X-Gm-Message-State: AOJu0YxMsAMoTegRu7RNUg92Vde4glMw6kR/OF6R+Ti37OvB266/pMPU
	xE7ukbyfqo90GEIr5gF5fQ0t7S6N9eRu0VNkbuISKyq/CAxXAdKcYpS+eOASQsj3CrdTcGaZjvv
	QORjC
X-Gm-Gg: ASbGncsNi/8fXGkp/JJ2i4/K6RhhnuojidLaSz3p1SDFBwDH2ACRKIi2DX4jHHWh/vZ
	pZmxEnBQ446QXOzgVh8iZRSxYh15pmmyYI+YyZLlMvZJODUClKtW+tPj3MtT7FU/IVT6Na9NBlo
	AYI3f14v7lZULl/xtRGUr6bF+J5ikpl6o7bHPf0KcqjUzBiM+Kw60NSc7cvRZvQpKfki39Mx38P
	RYi8aMUJ6q8P/Sc/NPWyLCkNuNYVTdAnhB7N9Xc/FmcaB4LFOYIRbBuiCVw5o7ipBPdH1LqqiMT
	1pa0fjK8LH8En9z6AV5x0F5ZZC6aBniE55u/n5HvI+6GhbdJixGHQcYycPgnZ7mkllu8uAs4WIR
	5RNnm4gXHDWPQX0SKFuB9Xi4NqjWfKzoaeP4h/ki5
X-Google-Smtp-Source: AGHT+IGYQgSMaIpJSFJkhoQWh1QuDzNl5CJVKUCxCJurSrypUUmjWlrZ4PHOdqE3Ya3DIDsTLUg89w==
X-Received: by 2002:a17:907:7287:b0:afd:d94b:830d with SMTP id a640c23a62f3a-b50ace22561mr2341422266b.62.1760430854127;
        Tue, 14 Oct 2025 01:34:14 -0700 (PDT)
Received: from fedora ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12c48sm1109736566b.50.2025.10.14.01.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:34:13 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>,
	Steve Sakoman <steve@sakoman.com>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [scarthgap][PATCH v1 1/1] gstreamer1.0-plugins-bad: fix buffer allocation fail for v4l2codecs
Date: Tue, 14 Oct 2025 10:33:08 +0200
Message-ID: <20251014083327.59694-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 08:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224813

There is a bug in GStreamer 1.22 that prevents video playback when
some of the v4l2codecs are paired with sinks that do not support
GstVideoMeta. This is the case of the Qt 6.9 sink used by some
of the Qt components.

For example, when the v4l2codecs-vp8dec decoder is paired with
QMediaPlayer, video playback fails to start with the following error:

  WARN   videodecoder gstvideodecoder.c:4409:gst_video_decoder_negotiate_pool: Subclass failed to decide allocation
  ERROR  videodecoder gstvideodecoder.c:4635:gst_video_decoder_allocate_output_buffer: Failed to allocate the buffer..
  WARN   videodecoder gstvideodecoder.c:4409:gst_video_decoder_negotiate_pool: Subclass failed to decide allocation
  WARN  matroskademux matroska-demux.c:6131:gst_matroska_demux_loop: error: Internal data stream error.
  WARN  matroskademux matroska-demux.c:6131:gst_matroska_demux_loop: error: streaming stopped, reason not-negotiated (-4)

This problem is already fixed in GStreamer 1.24, so backport the fix.
This fixes the buffer allocation failure for H.264, H.265, and VP8.

CC: Steve Sakoman <steve@sakoman.com>
CC: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 ...s-chain-up-to-parent-decide_allocati.patch | 87 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch
new file mode 100644
index 0000000000..8906b55082
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch
@@ -0,0 +1,87 @@
+From 4e96cc4df0b6807cb487368afca64e022078ed6a Mon Sep 17 00:00:00 2001
+From: James Cowgill <james.cowgill@blaize.com>
+Date: Sun, 14 May 2023 13:23:17 +0100
+Subject: [PATCH] v4l2codecs: Always chain up to parent decide_allocation
+ function
+
+The `gst_video_decoder_negotiate_pool` function expects the
+`decide_allocation` function to always provide a pool and will fail to
+negotiate if the pool is missing. If we return immediately (even if we
+don't need to do anything special) negotiation will fail if the
+downstream element does not propose a pool.
+
+Fix by chaining up to the default `decide_allocation` function which
+adds a fallback pool if one was not already proposed.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/4630>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/70ff80a873d8202329df1731c06f1bfed464ad2a]
+Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
+---
+ sys/v4l2codecs/gstv4l2codech264dec.c | 3 ++-
+ sys/v4l2codecs/gstv4l2codech265dec.c | 3 ++-
+ sys/v4l2codecs/gstv4l2codecvp8dec.c  | 3 ++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/sys/v4l2codecs/gstv4l2codech264dec.c b/sys/v4l2codecs/gstv4l2codech264dec.c
+index 1a6b144e9b..bd9041533b 100644
+--- a/sys/v4l2codecs/gstv4l2codech264dec.c
++++ b/sys/v4l2codecs/gstv4l2codech264dec.c
+@@ -417,7 +417,7 @@ gst_v4l2_codec_h264_dec_decide_allocation (GstVideoDecoder * decoder,
+   /* If we are streaming here, then it means there is nothing allocation
+    * related in the new state and allocation can be ignored */
+   if (self->streaming)
+-    return TRUE;
++    goto no_internal_changes;
+ 
+   self->has_videometa = gst_query_find_allocation_meta (query,
+       GST_VIDEO_META_API_TYPE, NULL);
+@@ -452,6 +452,7 @@ gst_v4l2_codec_h264_dec_decide_allocation (GstVideoDecoder * decoder,
+ 
+   self->src_pool = gst_v4l2_codec_pool_new (self->src_allocator, &self->vinfo);
+ 
++no_internal_changes:
+   /* Our buffer pool is internal, we will let the base class create a video
+    * pool, and use it if we are running out of buffers or if downstream does
+    * not support GstVideoMeta */
+diff --git a/sys/v4l2codecs/gstv4l2codech265dec.c b/sys/v4l2codecs/gstv4l2codech265dec.c
+index 8d70d05220..3f0c08d6a4 100644
+--- a/sys/v4l2codecs/gstv4l2codech265dec.c
++++ b/sys/v4l2codecs/gstv4l2codech265dec.c
+@@ -446,7 +446,7 @@ gst_v4l2_codec_h265_dec_decide_allocation (GstVideoDecoder * decoder,
+   guint min = 0;
+ 
+   if (self->streaming)
+-    return TRUE;
++    goto no_internal_changes;
+ 
+   self->has_videometa = gst_query_find_allocation_meta (query,
+       GST_VIDEO_META_API_TYPE, NULL);
+@@ -465,6 +465,7 @@ gst_v4l2_codec_h265_dec_decide_allocation (GstVideoDecoder * decoder,
+       GST_PAD_SRC, self->min_pool_size + min + 1);
+   self->src_pool = gst_v4l2_codec_pool_new (self->src_allocator, &self->vinfo);
+ 
++no_internal_changes:
+   /* Our buffer pool is internal, we will let the base class create a video
+    * pool, and use it if we are running out of buffers or if downstream does
+    * not support GstVideoMeta */
+diff --git a/sys/v4l2codecs/gstv4l2codecvp8dec.c b/sys/v4l2codecs/gstv4l2codecvp8dec.c
+index ba63a029df..bdea1fdf76 100644
+--- a/sys/v4l2codecs/gstv4l2codecvp8dec.c
++++ b/sys/v4l2codecs/gstv4l2codecvp8dec.c
+@@ -284,7 +284,7 @@ gst_v4l2_codec_vp8_dec_decide_allocation (GstVideoDecoder * decoder,
+   guint num_bitstream;
+ 
+   if (self->streaming)
+-    return TRUE;
++    goto no_internal_changes;
+ 
+   self->has_videometa = gst_query_find_allocation_meta (query,
+       GST_VIDEO_META_API_TYPE, NULL);
+@@ -319,6 +319,7 @@ gst_v4l2_codec_vp8_dec_decide_allocation (GstVideoDecoder * decoder,
+ 
+   self->src_pool = gst_v4l2_codec_pool_new (self->src_allocator, &self->vinfo);
+ 
++no_internal_changes:
+   /* Our buffer pool is internal, we will let the base class create a video
+    * pool, and use it if we are running out of buffers or if downstream does
+    * not support GstVideoMeta */
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
index e4fa2a412f..f6d0711bd8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://0005-v4l2codecs-Always-chain-up-to-parent-decide_allocati.patch \
            file://CVE-2025-3887-1.patch \
            file://CVE-2025-3887-2.patch \
            "


