Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D1FC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:11:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.43953.1655820659706961411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Du9wUgL+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id e2so8626917edv.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5rObMxAzrVManBvZqAsHqh1XDaT80JRgNWE8hc45Tk=;
        b=Du9wUgL+0UbsnrXPFCNdYmGV8J1i+vfgqP0EkRwHo6/3eJnz96RB9e4cIn/7f22FRQ
         RnDf1SJEGlbm15p5IB48VPSe4j6e/NfXKfyvaIUuXXJd+IOpbgfiIiJyUVLNSxZ76qZ+
         md983J0yJBUbUDtOBGcam9bYMIZWgmwAY3sLkDQjaVwuD2c2J/f6wggaolGe8very5ct
         9k/ZEmmNH0wqLqpfQ5qsG+Jlnx3ACz1EauAyapKPnzn1AyRqotG+aNugPxrB/Kp8nMfS
         sq9wCt7w7zkkEfQBDL0Dw5R5/PuY9QDNTlPDo/LjoxtdCovwqLFwInIdkt1wnwwEwb5/
         s1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5rObMxAzrVManBvZqAsHqh1XDaT80JRgNWE8hc45Tk=;
        b=L4lFg+z2ZrnASQgCEMKvjcLcoqhj52DHxWtc6bfQ/AUSdBGu8w/yCboMguONdLatKm
         F+iWrP/atK/oJ3XHzJNLHMjO4R4dVU4P2E0RqiIgjotqYqntqe+R2YHSEs9q142EwpQA
         OHpmxxiV8NLKAcLdR1T6gzCO7RMZuNy6QlICyFnRiBT2IxqOHzzuIqyuuntUf0eKDwbU
         qoMB90lsHi815X6y8eqoxZ7sUAqTUsntcPd6a9LiYC1ynR3j8AFOMCndDbp+VowNPWyW
         t4OA4vxsbcmVmNxL6+OivM1ScFvPasFvzNuQt57/nKWsizPNcb16Be1CNf78fcaMXnlB
         6JCw==
X-Gm-Message-State: AJIora/4bnl3me9j6MWbEsD+X9jKivUL5F9MZ9DCFSk8LnBw6hy3tZKY
	Qd05gyNHy/lOjgFTk/max6g3LFXAMbA=
X-Google-Smtp-Source: 
 AGRyM1uRg0UIYGXS7jM/NuWyZjoxtN0kuXe6C+3Teu8EmyDUFrJC/qXqhJHrOUp6LAH2x5e6YxnjYg==
X-Received: by 2002:a50:ed85:0:b0:435:6586:4b06 with SMTP id
 h5-20020a50ed85000000b0043565864b06mr25673667edr.315.1655820658188;
        Tue, 21 Jun 2022 07:10:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 kz5-20020a17090777c500b006ff0b457cdasm7695151ejc.53.2022.06.21.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:10:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][PATCH] mesa: backport a patch to support compositors
 without zwp_linux_dmabuf_v1 again
Date: Tue, 21 Jun 2022 16:10:48 +0200
Message-Id: <20220621141048.1970617-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167156

* the same will be needed for kirkstone

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 ++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch b/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
new file mode 100644
index 0000000000..dac2de4e62
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
@@ -0,0 +1,158 @@
+From 7796c2c56c960ac55e49246f0349ac52539ada55 Mon Sep 17 00:00:00 2001
+From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
+Date: Sun, 10 Apr 2022 22:54:36 -0300
+Subject: [PATCH] Revert "egl/wayland: deprecate drm_handle_format() and
+ drm_handle_capabilities()"
+
+Commit af1ee8e010441f8f2ed8c77065b159652a4ac9fe dropped support to
+wl_drm, as we thought that most compositors from active projects were
+already supporting zwp_linux_dmabuf_v1.
+
+But that's not true, so revert this commit in order to give these
+projects a longer transition period.
+
+Note that we didn't add back the support to GEM name API, and that was
+on purpose.
+
+Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
+Reviewed-by: Simon Ser <contact@emersion.fr>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15822>
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/c60fea8c228ae3f32e20d6b65c473d9f04871d20]
+---
+ src/egl/drivers/dri2/egl_dri2.h         |  1 +
+ src/egl/drivers/dri2/platform_wayland.c | 59 +++++++++++++++++++------
+ 2 files changed, 47 insertions(+), 13 deletions(-)
+
+diff --git a/src/egl/drivers/dri2/egl_dri2.h b/src/egl/drivers/dri2/egl_dri2.h
+index c466ff83c53..eecb32a53fd 100644
+--- a/src/egl/drivers/dri2/egl_dri2.h
++++ b/src/egl/drivers/dri2/egl_dri2.h
+@@ -283,6 +283,7 @@ struct dri2_egl_display
+    struct zwp_linux_dmabuf_feedback_v1 *wl_dmabuf_feedback;
+    struct dmabuf_feedback_format_table format_table;
+    bool authenticated;
++   uint32_t capabilities;
+    char *device_name;
+ #endif
+ 
+diff --git a/src/egl/drivers/dri2/platform_wayland.c b/src/egl/drivers/dri2/platform_wayland.c
+index 5ff83cce08a..843434376a7 100644
+--- a/src/egl/drivers/dri2/platform_wayland.c
++++ b/src/egl/drivers/dri2/platform_wayland.c
+@@ -1343,7 +1343,7 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
+                  struct dri2_egl_surface *dri2_surf,
+                  __DRIimage *image)
+ {
+-   struct wl_buffer *ret;
++   struct wl_buffer *ret = NULL;
+    EGLBoolean query;
+    int width, height, fourcc, num_planes;
+    uint64_t modifier = DRM_FORMAT_MOD_INVALID;
+@@ -1447,11 +1447,28 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
+       ret = zwp_linux_buffer_params_v1_create_immed(params, width, height,
+                                                     fourcc, 0);
+       zwp_linux_buffer_params_v1_destroy(params);
++   } else {
++      struct wl_drm *wl_drm =
++         dri2_surf ? dri2_surf->wl_drm_wrapper : dri2_dpy->wl_drm;
++      int fd = -1, stride;
++
++      if (num_planes > 1)
++         return NULL;
++
++      query = dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_FD, &fd);
++      query &= dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_STRIDE, &stride);
++      if (!query) {
++         if (fd >= 0)
++            close(fd);
++         return NULL;
++      }
+ 
+-      return ret;
++      ret = wl_drm_create_prime_buffer(wl_drm, fd, width, height, fourcc, 0,
++                                       stride, 0, 0, 0, 0);
++      close(fd);
+    }
+ 
+-   return NULL;
++   return ret;
+ }
+ 
+ static EGLBoolean
+@@ -1698,16 +1715,21 @@ drm_handle_device(void *data, struct wl_drm *drm, const char *device)
+ static void
+ drm_handle_format(void *data, struct wl_drm *drm, uint32_t format)
+ {
+-   /* deprecated, as compositors already support the dma-buf protocol extension
+-    * and so we can rely on dmabuf_handle_modifier() to receive formats and
+-    * modifiers */
++   struct dri2_egl_display *dri2_dpy = data;
++   int visual_idx = dri2_wl_visual_idx_from_fourcc(format);
++
++   if (visual_idx == -1)
++      return;
++
++   BITSET_SET(dri2_dpy->formats.formats_bitmap, visual_idx);
+ }
+ 
+ static void
+ drm_handle_capabilities(void *data, struct wl_drm *drm, uint32_t value)
+ {
+-   /* deprecated, as compositors already support the dma-buf protocol extension
+-    * and so we can rely on it to create wl_buffer's */
++   struct dri2_egl_display *dri2_dpy = data;
++
++   dri2_dpy->capabilities = value;
+ }
+ 
+ static void
+@@ -2075,13 +2097,12 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
+    wl_registry_add_listener(dri2_dpy->wl_registry,
+                             &registry_listener_drm, dri2_dpy);
+ 
+-   /* The compositor must expose the dma-buf interface. */
+-   if (roundtrip(dri2_dpy) < 0 || dri2_dpy->wl_dmabuf == NULL)
++   if (roundtrip(dri2_dpy) < 0)
+       goto cleanup;
+ 
+    /* Get default dma-buf feedback */
+-   if (zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
+-       ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
++   if (dri2_dpy->wl_dmabuf && zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
++                              ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
+       dmabuf_feedback_format_table_init(&dri2_dpy->format_table);
+       dri2_dpy->wl_dmabuf_feedback =
+          zwp_linux_dmabuf_v1_get_default_feedback(dri2_dpy->wl_dmabuf);
+@@ -2089,7 +2110,6 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
+                                                 &dmabuf_feedback_listener, dri2_dpy);
+    }
+ 
+-   /* Receive events from the interfaces */
+    if (roundtrip(dri2_dpy) < 0)
+       goto cleanup;
+ 
+@@ -2176,6 +2196,19 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
+ 
+    dri2_wl_setup_swap_interval(disp);
+ 
++   if (dri2_dpy->wl_drm) {
++      /* To use Prime, we must have _DRI_IMAGE v7 at least. createImageFromFds
++       * support indicates that Prime export/import is supported by the driver.
++       * We deprecated the support to GEM names API, so we bail out if the
++       * driver does not suport Prime. */
++      if (!(dri2_dpy->capabilities & WL_DRM_CAPABILITY_PRIME) ||
++          (dri2_dpy->image->base.version < 7) ||
++          (dri2_dpy->image->createImageFromFds == NULL)) {
++         _eglLog(_EGL_WARNING, "wayland-egl: display does not support prime");
++         goto cleanup;
++      }
++   }
++
+    if (dri2_dpy->is_different_gpu &&
+        (dri2_dpy->image->base.version < 9 ||
+         dri2_dpy->image->blitImage == NULL)) {
+-- 
+2.35.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0628151e96..afac8014fe 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
            "
 
 SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
-- 
2.35.1


