Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E97CCF9F2
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9356.1761659196419614970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q9UT37/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29490944023so41954695ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659196; x=1762263996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e80B4dowYD7M/NSiNQSgZHNH4A798avMYirIYBmLw04=;
        b=q9UT37/ygPG3DYm1neTugibEzx2gahb1HTvUgi1s7xVh9ksWekHSeEeAuljutqI4A4
         rtm2nzUOX20314CAaPKuxzjLwvjtxrthA8GKNyTHHLHyIToN3UMZPgh7hDPwubBhOJws
         R8zOnBXtEA//eFEbpJqlm56cqoNSud+i2RI0k0WZX444QpzlqZHAnHTIv6u813W2AlU8
         KCR1Nu/5RLD9lKvT5dVZquRIRBc1crckqPa/9p1ptscpfvrxT5HMgsiRT4W1KXXf5z98
         A429wTczw8vp5P4HrN4xo7jU6N/pxvp0biNOtEaf/858RlseQOwN84kYul+3bvzwh9pi
         OWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659196; x=1762263996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e80B4dowYD7M/NSiNQSgZHNH4A798avMYirIYBmLw04=;
        b=p5fMqiy8AS3wzCK1ncLhOeDZEV4/HygHPKfXImu+DmgUJh0Bs+MAIrVJjSJnYSNc+h
         JhxvGLjb/8H+eT40qgULYMzuXYyC8in0pdyKgHiuVmnyV8PFjXD8MneCjF7PQ1ctvRt8
         dTsMHQeqTr8mGs26vUWCETtL1Tj9c9eF5AwYA5Zis3OpuLGsSR0g7SGINxRVtYLGcbCy
         p1KQ8MTjKZGHaC/XJ7n/pj38f8+KgkR3I4oTF2+UqV5Sp8oLZVXjgV1BAKn99F/h7eyx
         EY639HcCZmpobwgGXframJ9SyF7ZpOpU7pjWU+FcCsz38aDmQ6HBhFUZka2MG5GKOTNc
         Ok6w==
X-Gm-Message-State: AOJu0YzNUR6LVShIwlDy6upXpcPsnW3tgMRJRBimVey0cSzdwf/X7Vqt
	kIuuT4i+AfbujLCANP2kNFmKi+LCxMJTSsWZJhLWCtYSFvhBuCeIPCkxGIHivt4zZRn2dyiigp8
	N6LO7GIY=
X-Gm-Gg: ASbGncvvV+85qa1bWBI+IEhaPlnygxbhWukCCw+3wf/rBrbwp/0/iQNPbVM3mhAoOuL
	zjpUpOGVKMMBjysIIsW181BurxTN7UhHdUiDCTNoftqDnmUEp6XmwQIsAh8I6q803186RVL8UGH
	vJlBkqiuKuh51IIgTxVTMBTsLQdBIvOcck30aYB4lJPoqc46eWkAJGLI7ZJTG6Lq/WbMFZp45/Y
	glfFnyC4oUPOfai2oCDdVwOLPWiNtxg2kcYFQxv3GR/8kek6PnX1swIEAicpHjcNfvbYzUXh6cs
	+8l5DvcrF3wGedt/47pwSiqnIsEs6sqQHeug2HgOFYi6A1eY6bgnY6MHy59UJPNtSmYFWItOJ/L
	Y65DvbRqHAm+sniT8xsHJouO+r6r2PNTqWs3BFCa+50baWV37KcPU/+yxGJsyge/jWqQ=
X-Google-Smtp-Source: AGHT+IGUt+qcHW0Osc0o0PLKZgTM6xvuJugOJveUpU1yV0/Y5GzLxYXec3OYFbYYSerfb+16nwXS2Q==
X-Received: by 2002:a17:902:cec2:b0:290:ac36:2ece with SMTP id d9443c01a7336-294cb3c8f9amr50294475ad.18.1761659195616;
        Tue, 28 Oct 2025 06:46:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] gstreamer1.0-plugins-bad: fix buffer allocation fail for v4l2codecs
Date: Tue, 28 Oct 2025 06:46:16 -0700
Message-ID: <1be0de000bb852f1acc9644c1cb702336d7fdd61.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225406

From: Daniel Semkowicz <dse@thaumatec.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


