Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692CCCDB472
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6000.1781960412885121281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JcW7EadC;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-462cdb88d01so1977609f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960411; x=1782565211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdSon0fS9dg0ni+BMGK6qXxxUXNNhiTrMa+iOF5UDdo=;
        b=JcW7EadC1zFH2b2o7oG6D4jpoFBhMKD6TZhXlbRNSGjBPoCMKpPNNwEklSmD7knA6d
         SNu1hC3qjgt3f/HwtjZxPGYdvabHMwY+LnqHQZIF5emppZps21aLyiw4JNUDBgLs/mpV
         Kqys7qplM3aqDT6VVgcL/D2SPy5tBaMfs92dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960411; x=1782565211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdSon0fS9dg0ni+BMGK6qXxxUXNNhiTrMa+iOF5UDdo=;
        b=bGDQchTSPkSDhBTSKDl63xyf16uOfFpzuLuhuOpf9uhFkSaKmhnqdH1yqGtnNAg1jS
         mkFl8QNXI1cnRKq1J+MQ+x7rmwMZyB7lnA2bCOXlBslVUTWp2FRfgXfaChy0wrPmnWyj
         XYoF4JW85esRKEheT72XjTS/0OZQMeKvkE5sKSjYmxF6wQyla/P8ncGK+/GB2Pn0JFma
         oUriG5cpdEsUP8o+9DygmbMnJQT5NrXjkzVroPB/QXArCDnvSIvgc0hL4zbJN1nDRdEU
         YP+wL3rKv7iM00i28Tl1yvnBNyKU8h5BOzsjdAVPZooTkvE4jBdi9PaoamHD5iygaaN/
         uyMQ==
X-Gm-Message-State: AOJu0Yw76Rj2QV+19uxTJQkVtkVr5k3fvZ0q3FthCi3ej5vwp3mMwUEG
	hOWXY/2bR+5/PeRACI2rCOBaP5+WJNk7SaG3hKBBTtBagcM4nDwCDKC6OPopbK9K/seUNC5OLJ7
	chfqp
X-Gm-Gg: AfdE7cmSnfZHIpSWDmECnk3iLNurHGl922Dyijz9rifOGezjuqoNdP4FM4bcg1h6Shl
	MHAjR68JVT67aVgNhhzPA7Or1IpFGf7FGEby/MjzefOcAEqN/NWx7T8ZcCZg6+yS2px8k2Ni6Im
	qAV1hM3ClGMnkhujhYsL01XyPa6XavfbZXhbAsk7ddB1iWyEkDDxGZWtzaYtcQtH9ghH8UWVvn7
	HPvu2xBm2GMTkhSoMKrLc9m7d79ofg1HO6ah9f9MrsxHTjyZX5k1fWFR4Fjq25FWBlFDLDy5S38
	zOrO459BHpk/h1QW9ib3NtTLcZpmv1fcxhjKBj18Q5xqsXCr0KfTtnQip9zXIUsPnxvaQlQwevF
	fCJWCTbpDxZdGgYF+Axg69epiG3bkkGWnfAcG/2tI/7RnwtmY3Z9jcxa8LGQ7JGAbAABD2MdG5Z
	fpVKyak9N50U99HhP3zQG/MllCNhjy+NVBJ2d8m7F19RPC9anU9aANV5SnR9FpIyJ5x8T/V80g+
	jLmXMl8x2NVK+1I
X-Received: by 2002:a05:6000:4b15:b0:464:c5be:37fe with SMTP id ffacd0b85a97d-4651dffdebdmr11320064f8f.15.1781960410923;
        Sat, 20 Jun 2026 06:00:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/36] gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer creation
Date: Sat, 20 Jun 2026 14:59:21 +0200
Message-ID: <510aa424109c7c3fdd663c2c6be4a0a325fdda98.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239215

From: Tushar Darote <tdarote@qti.qualcomm.com>

Use GstBuffer metadata when constructing wl_shm buffers so stride and size reflect the actual buffer layout.
This fixes incorrect rendering with DMA-backed buffers that include padding or custom strides.
(cherry picked from commit 866915fa7bcbe563849aa1100033c684a805fc24)

Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...added-buffers-in-wl_shm-buffer-creat.patch | 238 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.28.2.bb        |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
new file mode 100644
index 00000000000..2bb00e2b1d9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -0,0 +1,238 @@
+From 2af4bc8562f970207e3b1f6fc0b377ecf116a69c Mon Sep 17 00:00:00 2001
+From: Tushar Darote <tdarote@qti.qualcomm.com>
+Date: Mon, 8 Jun 2026 18:05:51 +0530
+Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
+
+Use GstBuffer metadata when constructing wl_shm buffers so stride and
+size reflect the actual buffer layout. This fixes incorrect rendering
+with DMA-backed buffers that include padding or custom strides.
+
+gst_wl_shm_memory_construct_wl_buffer() now takes a GstBuffer instead of
+a GstMemory. It derives the video layout from the buffer's GstVideoMeta
+when present (width, height, stride and offset), falling back to the
+caps-derived GstVideoInfo otherwise, and computes the real memory
+footprint (plane_offset + stride * height) rather than the unpadded
+GstVideoInfo size. The single-memory and fd-memory checks that used to
+live in the callers are now performed inside the function.
+
+All callers in gstwlwindow, waylandsink and gtkwaylandsink are updated
+accordingly.
+
+Upstream-Status: Backport [adapted from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11370 due to API differences]
+
+Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
+---
+ ext/gtk/gstgtkwaylandsink.c              | 11 ++---
+ ext/wayland/gstwaylandsink.c             | 11 ++---
+ gst-libs/gst/wayland/gstwlshmallocator.c | 59 ++++++++++++++++++------
+ gst-libs/gst/wayland/gstwlshmallocator.h |  2 +-
+ gst-libs/gst/wayland/gstwlwindow.c       |  4 +-
+ 5 files changed, 52 insertions(+), 35 deletions(-)
+
+diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
+index 0660b30..81bcd7f 100644
+--- a/ext/gtk/gstgtkwaylandsink.c
++++ b/ext/gtk/gstgtkwaylandsink.c
+@@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+       gst_gtk_wayland_sink_get_instance_private (self);
+   GstBuffer *to_render;
+   GstWlBuffer *wlbuffer;
+-  GstMemory *mem;
+   struct wl_buffer *wbuf = NULL;
+ 
+   GstFlowReturn ret = GST_FLOW_OK;
+@@ -1240,8 +1239,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+   }
+ 
+   /* update video info from video meta */
+-  mem = gst_buffer_peek_memory (buffer, 0);
+-
+   GST_LOG_OBJECT (self,
+       "buffer %" GST_PTR_FORMAT " does not have a wl_buffer from our "
+       "display, creating it", buffer);
+@@ -1301,9 +1298,8 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (priv->display,
+           &priv->render_info)) {
+-    if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-      wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
+-          &priv->render_info);
++    wbuf = gst_wl_shm_memory_construct_wl_buffer (buffer, priv->display,
++        &priv->render_info);
+ 
+     /* If nothing worked, copy into our internal pool */
+     if (!wbuf) {
+@@ -1328,8 +1324,7 @@ handle_shm:
+ 
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+-        mem = gst_buffer_peek_memory (to_render, 0);
+-        wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
++        wbuf = gst_wl_shm_memory_construct_wl_buffer (to_render, priv->display,
+             &priv->render_info);
+ 
+         if (G_UNLIKELY (!wbuf))
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 443db24..60aa11d 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+   GstWaylandSink *self = GST_WAYLAND_SINK (vsink);
+   GstBuffer *to_render;
+   GstWlBuffer *wlbuffer;
+-  GstMemory *mem;
+   struct wl_buffer *wbuf = NULL;
+ 
+   GstFlowReturn ret = GST_FLOW_OK;
+@@ -1086,8 +1085,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+   }
+ 
+   /* update video info from video meta */
+-  mem = gst_buffer_peek_memory (buffer, 0);
+-
+   GST_LOG_OBJECT (self,
+       "buffer %" GST_PTR_FORMAT " does not have a wl_buffer from our "
+       "display, creating it", buffer);
+@@ -1147,9 +1144,8 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
+ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (self->display,
+           &self->render_info)) {
+-    if (gst_buffer_n_memory (buffer) == 1 && gst_is_fd_memory (mem))
+-      wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
+-          &self->video_info);
++    wbuf = gst_wl_shm_memory_construct_wl_buffer (buffer, self->display,
++        &self->video_info);
+ 
+     /* If nothing worked, copy into our internal pool */
+     if (!wbuf) {
+@@ -1173,8 +1169,7 @@ handle_shm:
+ 
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+-        mem = gst_buffer_peek_memory (to_render, 0);
+-        wbuf = gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
++        wbuf = gst_wl_shm_memory_construct_wl_buffer (to_render, self->display,
+             &self->video_info);
+ 
+         if (G_UNLIKELY (!wbuf))
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayland/gstwlshmallocator.c
+index 671f2b7..11fb22c 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.c
++++ b/gst-libs/gst/wayland/gstwlshmallocator.c
+@@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * vinfo)
+ }
+ 
+ struct wl_buffer *
+-gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
+-    const GstVideoInfo * info)
++gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf,
++    GstWlDisplay * display, const GstVideoInfo * info)
+ {
++  GstMemory *mem;
++  GstVideoMeta *vmeta;
++  GstVideoInfo vinfo;
+   gint width, height, stride;
+-  gsize offset, size, memsize, maxsize;
++  gsize plane_offset = 0;
++  gsize mem_offset = 0;
++  gsize size, memsize, maxsize;
+   enum wl_shm_format format;
+   struct wl_shm_pool *wl_pool;
+   struct wl_buffer *wbuffer;
+ 
+-  if (!gst_wl_shm_validate_video_info (info)) {
++  /* Ensure the buffer has exactly one memory block */
++  if (gst_buffer_n_memory (buf) != 1)
++    return NULL;
++
++  /* Retrieve the memory and ensure it is FD backed */
++  mem = gst_buffer_peek_memory (buf, 0);
++  if (!gst_is_fd_memory (mem))
++    return NULL;
++
++  /* Start from caps-derived video info */
++  vinfo = *info;
++
++  /* Override layout using GstVideoMeta if present */
++  vmeta = gst_buffer_get_video_meta (buf);
++  if (vmeta) {
++    vinfo.width = vmeta->width;
++    vinfo.height = vmeta->height;
++    vinfo.stride[0] = vmeta->stride[0];
++    vinfo.offset[0] = vmeta->offset[0];
++  }
++
++  /* Validate the final video layout */
++  if (!gst_wl_shm_validate_video_info (&vinfo)) {
+     GST_DEBUG_OBJECT (display, "Unsupported strides and offsets.");
+     return NULL;
+   }
+ 
+-  width = GST_VIDEO_INFO_WIDTH (info);
+-  height = GST_VIDEO_INFO_HEIGHT (info);
+-  stride = GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
+-  size = GST_VIDEO_INFO_SIZE (info);
+-  format = gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (info));
++  width = GST_VIDEO_INFO_WIDTH (&vinfo);
++  height = GST_VIDEO_INFO_HEIGHT (&vinfo);
++  stride = GST_VIDEO_INFO_PLANE_STRIDE (&vinfo, 0);
++  plane_offset = GST_VIDEO_INFO_PLANE_OFFSET (&vinfo, 0);
++
++  /* wl_shm requires the actual memory footprint of the buffer */
++  size = plane_offset + (stride * height);
++  format = gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (&vinfo));
+ 
+-  memsize = gst_memory_get_sizes (mem, &offset, &maxsize);
+-  offset += GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++  memsize = gst_memory_get_sizes (mem, &mem_offset, &maxsize);
+ 
+-  g_return_val_if_fail (gst_is_fd_memory (mem), NULL);
+   g_return_val_if_fail (size <= memsize, NULL);
+-  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, info),
++  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, &vinfo),
+       NULL);
+ 
+   GST_DEBUG_OBJECT (display, "Creating wl_buffer from SHM of size %"
+@@ -110,8 +138,9 @@ gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * display,
+ 
+   wl_pool = wl_shm_create_pool (gst_wl_display_get_shm (display),
+       gst_fd_memory_get_fd (mem), memsize);
+-  wbuffer = wl_shm_pool_create_buffer (wl_pool, offset, width, height, stride,
+-      format);
++  wbuffer =
++      wl_shm_pool_create_buffer (wl_pool, mem_offset + plane_offset, width,
++      height, stride, format);
+   wl_shm_pool_destroy (wl_pool);
+ 
+   return wbuffer;
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayland/gstwlshmallocator.h
+index 4309bd7..38f3ba5 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.h
++++ b/gst-libs/gst/wayland/gstwlshmallocator.h
+@@ -33,7 +33,7 @@ GST_WL_API
+ void gst_wl_shm_init_once (void);
+ 
+ GST_WL_API
+-struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem,
++struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf,
+     GstWlDisplay * display, const GstVideoInfo * info);
+ 
+ G_END_DECLS
+diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gstwlwindow.c
+index 3c5c3cc..cd9c964 100644
+--- a/gst-libs/gst/wayland/gstwlwindow.c
++++ b/gst-libs/gst/wayland/gstwlwindow.c
+@@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
+     buf = gst_buffer_new_allocate (alloc, info.size, NULL);
+     gst_buffer_memset (buf, 0, 0, info.size);
+ 
+-    wlbuf =
+-        gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (buf, 0),
+-        priv->display, &info);
++    wlbuf = gst_wl_shm_memory_construct_wl_buffer (buf, priv->display, &info);
+ 
+     g_object_unref (alloc);
+   }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
index cdf3a20dff6..72f2cc73424 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
 SRC_URI[sha256sum] = "6467e3964828f4d7d08bfe1fbb4d76287a1c8fa76674e59e101a149c020fefd7"
 

