Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFAC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:28:14 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.44162.1655821684661327383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4VVY0g9w;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id fu3so27898006ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VIEezqTxBwWTTOb6zTfLuOzzib3uiLwn+ckD44l4sDA=;
        b=4VVY0g9wadwdt6KUOOgScDlTpr+KKOzFibN21knSaMn1lakXB471IbDSpkO46cb1mY
         TnYIORinWWWOA8Z1k8F7i2qDaWZuoo8DZMfxyur6X4/r5+FC5YsuULB7OlfEPV/NYfzh
         RFytEXmztnGKVbZnbFxfPnWdqCUlOwNMCd0g2lLcG6M+BmE66A7YbtQoqf6Bu4XZay9n
         qJ0QeU49+kViyNAwZ4PUgObeZKtAfoezU1vSTu9tmhZllwluLsUXx+7jdwf/CxZc5c7i
         9dmBfX11POiYG2g/j/MBGRW+adf/dWUAZkmUieKOlku6O/qWKW2thZZK6zSvaK0FYmzh
         IfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VIEezqTxBwWTTOb6zTfLuOzzib3uiLwn+ckD44l4sDA=;
        b=nLUbMuSq7kyxBF6eJd7IRHS9KbF+D8uoQbJs1MWJvrs/aeYO0LgmK2bJm83Dlz1FKZ
         /hgis73wP7elSfx1IbAB1V3fJZaWL4iEGnJYTZGqzyL3Z7vKVJJWdpR2R68n2f/3R1vz
         7AIp+ULT79yj1xQoCsSLVBQ9WqXqQLuQt5RKl/dRdDRpJgIZN0YM/ufFYV6eId4uobuR
         ebCgAlKm8aUn6m7zXfGJZ48+lacfd7uLr3i9HigCwZYKKKTVS3LObj0JJtI6ieS743nL
         m3UisFdXgR73k35h2J7ZtaLUaafBXGS6YU1L6+P1KxQdNKl5uxK5rpF16gs2F6Jsohih
         nvrQ==
X-Gm-Message-State: AJIora/SOqp1Sl3hTSFxldG6xqCNokobKXp7IKmHGwSbzwkD8MqqdVtx
	ub4gA0k2TPqN8Pj5fyDzWzQYp3L8pWhK7Qi6Tzg2rQ==
X-Google-Smtp-Source: 
 AGRyM1sN93oI92f0b9DpXTcLCRnOqJfQX/k6/u3uOsYo8q9IXC0ujZGuvcqVyKbJ/D3Sq91M/lt/bvpVzzC/Ts4vVMg=
X-Received: by 2002:a17:906:f17:b0:6fe:94f6:cb8a with SMTP id
 z23-20020a1709060f1700b006fe94f6cb8amr25798848eji.456.1655821682782; Tue, 21
 Jun 2022 07:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220621141048.1970617-1-Martin.Jansa@gmail.com>
In-Reply-To: <20220621141048.1970617-1-Martin.Jansa@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 21 Jun 2022 04:27:50 -1000
Message-ID: 
 <CAOSpxdaaXMnP+_TtAVTZuBxqZ4t+iFtOOYQmf2pvTX-38uEP2w@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] mesa: backport a patch to support compositors
 without zwp_linux_dmabuf_v1 again
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167159

On Tue, Jun 21, 2022 at 4:10 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * the same will be needed for kirkstone

I've got it in the patchset currently under test.

Steve

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...nd-deprecate-drm_handle_format-and-d.patch | 158 ++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |   1 +
>  2 files changed, 159 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch b/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
> new file mode 100644
> index 0000000000..dac2de4e62
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
> @@ -0,0 +1,158 @@
> +From 7796c2c56c960ac55e49246f0349ac52539ada55 Mon Sep 17 00:00:00 2001
> +From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> +Date: Sun, 10 Apr 2022 22:54:36 -0300
> +Subject: [PATCH] Revert "egl/wayland: deprecate drm_handle_format() and
> + drm_handle_capabilities()"
> +
> +Commit af1ee8e010441f8f2ed8c77065b159652a4ac9fe dropped support to
> +wl_drm, as we thought that most compositors from active projects were
> +already supporting zwp_linux_dmabuf_v1.
> +
> +But that's not true, so revert this commit in order to give these
> +projects a longer transition period.
> +
> +Note that we didn't add back the support to GEM name API, and that was
> +on purpose.
> +
> +Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> +Reviewed-by: Simon Ser <contact@emersion.fr>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15822>
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/c60fea8c228ae3f32e20d6b65c473d9f04871d20]
> +---
> + src/egl/drivers/dri2/egl_dri2.h         |  1 +
> + src/egl/drivers/dri2/platform_wayland.c | 59 +++++++++++++++++++------
> + 2 files changed, 47 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/egl/drivers/dri2/egl_dri2.h b/src/egl/drivers/dri2/egl_dri2.h
> +index c466ff83c53..eecb32a53fd 100644
> +--- a/src/egl/drivers/dri2/egl_dri2.h
> ++++ b/src/egl/drivers/dri2/egl_dri2.h
> +@@ -283,6 +283,7 @@ struct dri2_egl_display
> +    struct zwp_linux_dmabuf_feedback_v1 *wl_dmabuf_feedback;
> +    struct dmabuf_feedback_format_table format_table;
> +    bool authenticated;
> ++   uint32_t capabilities;
> +    char *device_name;
> + #endif
> +
> +diff --git a/src/egl/drivers/dri2/platform_wayland.c b/src/egl/drivers/dri2/platform_wayland.c
> +index 5ff83cce08a..843434376a7 100644
> +--- a/src/egl/drivers/dri2/platform_wayland.c
> ++++ b/src/egl/drivers/dri2/platform_wayland.c
> +@@ -1343,7 +1343,7 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
> +                  struct dri2_egl_surface *dri2_surf,
> +                  __DRIimage *image)
> + {
> +-   struct wl_buffer *ret;
> ++   struct wl_buffer *ret = NULL;
> +    EGLBoolean query;
> +    int width, height, fourcc, num_planes;
> +    uint64_t modifier = DRM_FORMAT_MOD_INVALID;
> +@@ -1447,11 +1447,28 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy,
> +       ret = zwp_linux_buffer_params_v1_create_immed(params, width, height,
> +                                                     fourcc, 0);
> +       zwp_linux_buffer_params_v1_destroy(params);
> ++   } else {
> ++      struct wl_drm *wl_drm =
> ++         dri2_surf ? dri2_surf->wl_drm_wrapper : dri2_dpy->wl_drm;
> ++      int fd = -1, stride;
> ++
> ++      if (num_planes > 1)
> ++         return NULL;
> ++
> ++      query = dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_FD, &fd);
> ++      query &= dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_STRIDE, &stride);
> ++      if (!query) {
> ++         if (fd >= 0)
> ++            close(fd);
> ++         return NULL;
> ++      }
> +
> +-      return ret;
> ++      ret = wl_drm_create_prime_buffer(wl_drm, fd, width, height, fourcc, 0,
> ++                                       stride, 0, 0, 0, 0);
> ++      close(fd);
> +    }
> +
> +-   return NULL;
> ++   return ret;
> + }
> +
> + static EGLBoolean
> +@@ -1698,16 +1715,21 @@ drm_handle_device(void *data, struct wl_drm *drm, const char *device)
> + static void
> + drm_handle_format(void *data, struct wl_drm *drm, uint32_t format)
> + {
> +-   /* deprecated, as compositors already support the dma-buf protocol extension
> +-    * and so we can rely on dmabuf_handle_modifier() to receive formats and
> +-    * modifiers */
> ++   struct dri2_egl_display *dri2_dpy = data;
> ++   int visual_idx = dri2_wl_visual_idx_from_fourcc(format);
> ++
> ++   if (visual_idx == -1)
> ++      return;
> ++
> ++   BITSET_SET(dri2_dpy->formats.formats_bitmap, visual_idx);
> + }
> +
> + static void
> + drm_handle_capabilities(void *data, struct wl_drm *drm, uint32_t value)
> + {
> +-   /* deprecated, as compositors already support the dma-buf protocol extension
> +-    * and so we can rely on it to create wl_buffer's */
> ++   struct dri2_egl_display *dri2_dpy = data;
> ++
> ++   dri2_dpy->capabilities = value;
> + }
> +
> + static void
> +@@ -2075,13 +2097,12 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
> +    wl_registry_add_listener(dri2_dpy->wl_registry,
> +                             &registry_listener_drm, dri2_dpy);
> +
> +-   /* The compositor must expose the dma-buf interface. */
> +-   if (roundtrip(dri2_dpy) < 0 || dri2_dpy->wl_dmabuf == NULL)
> ++   if (roundtrip(dri2_dpy) < 0)
> +       goto cleanup;
> +
> +    /* Get default dma-buf feedback */
> +-   if (zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
> +-       ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
> ++   if (dri2_dpy->wl_dmabuf && zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=
> ++                              ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
> +       dmabuf_feedback_format_table_init(&dri2_dpy->format_table);
> +       dri2_dpy->wl_dmabuf_feedback =
> +          zwp_linux_dmabuf_v1_get_default_feedback(dri2_dpy->wl_dmabuf);
> +@@ -2089,7 +2110,6 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
> +                                                 &dmabuf_feedback_listener, dri2_dpy);
> +    }
> +
> +-   /* Receive events from the interfaces */
> +    if (roundtrip(dri2_dpy) < 0)
> +       goto cleanup;
> +
> +@@ -2176,6 +2196,19 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
> +
> +    dri2_wl_setup_swap_interval(disp);
> +
> ++   if (dri2_dpy->wl_drm) {
> ++      /* To use Prime, we must have _DRI_IMAGE v7 at least. createImageFromFds
> ++       * support indicates that Prime export/import is supported by the driver.
> ++       * We deprecated the support to GEM names API, so we bail out if the
> ++       * driver does not suport Prime. */
> ++      if (!(dri2_dpy->capabilities & WL_DRM_CAPABILITY_PRIME) ||
> ++          (dri2_dpy->image->base.version < 7) ||
> ++          (dri2_dpy->image->createImageFromFds == NULL)) {
> ++         _eglLog(_EGL_WARNING, "wayland-egl: display does not support prime");
> ++         goto cleanup;
> ++      }
> ++   }
> ++
> +    if (dri2_dpy->is_different_gpu &&
> +        (dri2_dpy->image->base.version < 9 ||
> +         dri2_dpy->image->blitImage == NULL)) {
> +--
> +2.35.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 0628151e96..afac8014fe 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch \
> +           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
>             "
>
>  SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
> --
> 2.35.1
>

