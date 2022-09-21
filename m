Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91871ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 06:49:30 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.3514.1663742967074218345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 23:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 0087B21259
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 08:49:23 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.145]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oatXv-18trph0; Wed, 21 Sep 2022 08:49:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] mesa: upgrade 22.1.6 -> 22.2.0
Date: Wed, 21 Sep 2022 08:49:15 +0200
Message-Id: <20220921064915.186408-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1663742963-EDFF0A26-41712A3F/0/0 CLEAN NORMAL
X-TOI-MSGID: 8460eb85-e202-4188-8b25-e4381c890eaa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 06:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170931

- add PACKAGECONFIG to build vulkan beta drivers
- add PACKAGECONFIG for zink and build it along with vulkan
- remove TLS-ELF patch and the associated PACKAGECONFIG. It looks like it=
s unneeded
- remove swrast_kms backport patch
- remove the patch that reverts the deprecation of drm_handle as it is no=
t applicable. Still needed ?
- fix patch fuzz warnings

License file has been changed, but no change of licenses
https://gitlab.freedesktop.org/mesa/mesa/-/commit/e6392fcf3d8b8dd7e3a8427=
755d8be2f2332366a

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 ------------------
 ...fine-__NR_futex-if-it-does-not-exist.patch |  10 +-
 ...sdetects-64bit-atomics-on-mips-clang.patch |   2 +-
 ...k-for-all-linux-host_os-combinations.patch |  10 +-
 ...ove-fix-ALWAYS_INLINE-compiler-error.patch |  20 ++-
 ...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 -------------
 ...ormat-Check-for-NEON-before-using-it.patch |   6 +-
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 -------
 meta/recipes-graphics/mesa/mesa.inc           |  16 +-
 .../mesa/{mesa_22.1.6.bb =3D> mesa_22.2.0.bb}   |   0
 10 files changed, 33 insertions(+), 363 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-egl-wayl=
and-deprecate-drm_handle_format-and-d.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-swrast_kms-use-=
swkmsDRI2Extension-instead-of-driDRI2.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-mak=
e-TLS-ELF-optional.patch
 rename meta/recipes-graphics/mesa/{mesa_22.1.6.bb =3D> mesa_22.2.0.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-dep=
recate-drm_handle_format-and-d.patch b/meta/recipes-graphics/mesa/files/0=
001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
deleted file mode 100644
index dac2de4e62..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-=
drm_handle_format-and-d.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 7796c2c56c960ac55e49246f0349ac52539ada55 Mon Sep 17 00:00:00 2001
-From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
-Date: Sun, 10 Apr 2022 22:54:36 -0300
-Subject: [PATCH] Revert "egl/wayland: deprecate drm_handle_format() and
- drm_handle_capabilities()"
-
-Commit af1ee8e010441f8f2ed8c77065b159652a4ac9fe dropped support to
-wl_drm, as we thought that most compositors from active projects were
-already supporting zwp_linux_dmabuf_v1.
-
-But that's not true, so revert this commit in order to give these
-projects a longer transition period.
-
-Note that we didn't add back the support to GEM name API, and that was
-on purpose.
-
-Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
-Reviewed-by: Simon Ser <contact@emersion.fr>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1582=
2>
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/c60fea8c228ae3f32e20d6b65c473d9f04871d20]
----
- src/egl/drivers/dri2/egl_dri2.h         |  1 +
- src/egl/drivers/dri2/platform_wayland.c | 59 +++++++++++++++++++------
- 2 files changed, 47 insertions(+), 13 deletions(-)
-
-diff --git a/src/egl/drivers/dri2/egl_dri2.h b/src/egl/drivers/dri2/egl_=
dri2.h
-index c466ff83c53..eecb32a53fd 100644
---- a/src/egl/drivers/dri2/egl_dri2.h
-+++ b/src/egl/drivers/dri2/egl_dri2.h
-@@ -283,6 +283,7 @@ struct dri2_egl_display
-    struct zwp_linux_dmabuf_feedback_v1 *wl_dmabuf_feedback;
-    struct dmabuf_feedback_format_table format_table;
-    bool authenticated;
-+   uint32_t capabilities;
-    char *device_name;
- #endif
-=20
-diff --git a/src/egl/drivers/dri2/platform_wayland.c b/src/egl/drivers/d=
ri2/platform_wayland.c
-index 5ff83cce08a..843434376a7 100644
---- a/src/egl/drivers/dri2/platform_wayland.c
-+++ b/src/egl/drivers/dri2/platform_wayland.c
-@@ -1343,7 +1343,7 @@ create_wl_buffer(struct dri2_egl_display *dri2_dpy=
,
-                  struct dri2_egl_surface *dri2_surf,
-                  __DRIimage *image)
- {
--   struct wl_buffer *ret;
-+   struct wl_buffer *ret =3D NULL;
-    EGLBoolean query;
-    int width, height, fourcc, num_planes;
-    uint64_t modifier =3D DRM_FORMAT_MOD_INVALID;
-@@ -1447,11 +1447,28 @@ create_wl_buffer(struct dri2_egl_display *dri2_d=
py,
-       ret =3D zwp_linux_buffer_params_v1_create_immed(params, width, he=
ight,
-                                                     fourcc, 0);
-       zwp_linux_buffer_params_v1_destroy(params);
-+   } else {
-+      struct wl_drm *wl_drm =3D
-+         dri2_surf ? dri2_surf->wl_drm_wrapper : dri2_dpy->wl_drm;
-+      int fd =3D -1, stride;
-+
-+      if (num_planes > 1)
-+         return NULL;
-+
-+      query =3D dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_F=
D, &fd);
-+      query &=3D dri2_dpy->image->queryImage(image, __DRI_IMAGE_ATTRIB_=
STRIDE, &stride);
-+      if (!query) {
-+         if (fd >=3D 0)
-+            close(fd);
-+         return NULL;
-+      }
-=20
--      return ret;
-+      ret =3D wl_drm_create_prime_buffer(wl_drm, fd, width, height, fou=
rcc, 0,
-+                                       stride, 0, 0, 0, 0);
-+      close(fd);
-    }
-=20
--   return NULL;
-+   return ret;
- }
-=20
- static EGLBoolean
-@@ -1698,16 +1715,21 @@ drm_handle_device(void *data, struct wl_drm *drm=
, const char *device)
- static void
- drm_handle_format(void *data, struct wl_drm *drm, uint32_t format)
- {
--   /* deprecated, as compositors already support the dma-buf protocol e=
xtension
--    * and so we can rely on dmabuf_handle_modifier() to receive formats=
 and
--    * modifiers */
-+   struct dri2_egl_display *dri2_dpy =3D data;
-+   int visual_idx =3D dri2_wl_visual_idx_from_fourcc(format);
-+
-+   if (visual_idx =3D=3D -1)
-+      return;
-+
-+   BITSET_SET(dri2_dpy->formats.formats_bitmap, visual_idx);
- }
-=20
- static void
- drm_handle_capabilities(void *data, struct wl_drm *drm, uint32_t value)
- {
--   /* deprecated, as compositors already support the dma-buf protocol e=
xtension
--    * and so we can rely on it to create wl_buffer's */
-+   struct dri2_egl_display *dri2_dpy =3D data;
-+
-+   dri2_dpy->capabilities =3D value;
- }
-=20
- static void
-@@ -2075,13 +2097,12 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
-    wl_registry_add_listener(dri2_dpy->wl_registry,
-                             &registry_listener_drm, dri2_dpy);
-=20
--   /* The compositor must expose the dma-buf interface. */
--   if (roundtrip(dri2_dpy) < 0 || dri2_dpy->wl_dmabuf =3D=3D NULL)
-+   if (roundtrip(dri2_dpy) < 0)
-       goto cleanup;
-=20
-    /* Get default dma-buf feedback */
--   if (zwp_linux_dmabuf_v1_get_version(dri2_dpy->wl_dmabuf) >=3D
--       ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_SINCE_VERSION) {
-+   if (dri2_dpy->wl_dmabuf && zwp_linux_dmabuf_v1_get_version(dri2_dpy-=
>wl_dmabuf) >=3D
-+                              ZWP_LINUX_DMABUF_V1_GET_DEFAULT_FEEDBACK_=
SINCE_VERSION) {
-       dmabuf_feedback_format_table_init(&dri2_dpy->format_table);
-       dri2_dpy->wl_dmabuf_feedback =3D
-          zwp_linux_dmabuf_v1_get_default_feedback(dri2_dpy->wl_dmabuf);
-@@ -2089,7 +2110,6 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
-                                                 &dmabuf_feedback_listen=
er, dri2_dpy);
-    }
-=20
--   /* Receive events from the interfaces */
-    if (roundtrip(dri2_dpy) < 0)
-       goto cleanup;
-=20
-@@ -2176,6 +2196,19 @@ dri2_initialize_wayland_drm(_EGLDisplay *disp)
-=20
-    dri2_wl_setup_swap_interval(disp);
-=20
-+   if (dri2_dpy->wl_drm) {
-+      /* To use Prime, we must have _DRI_IMAGE v7 at least. createImage=
FromFds
-+       * support indicates that Prime export/import is supported by the=
 driver.
-+       * We deprecated the support to GEM names API, so we bail out if =
the
-+       * driver does not suport Prime. */
-+      if (!(dri2_dpy->capabilities & WL_DRM_CAPABILITY_PRIME) ||
-+          (dri2_dpy->image->base.version < 7) ||
-+          (dri2_dpy->image->createImageFromFds =3D=3D NULL)) {
-+         _eglLog(_EGL_WARNING, "wayland-egl: display does not support p=
rime");
-+         goto cleanup;
-+      }
-+   }
-+
-    if (dri2_dpy->is_different_gpu &&
-        (dri2_dpy->image->base.version < 9 ||
-         dri2_dpy->image->blitImage =3D=3D NULL)) {
---=20
-2.35.1
-
diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_fu=
tex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-fu=
tex.h-Define-__NR_futex-if-it-does-not-exist.patch
index 3b0bfa323b..e7d92197be 100644
--- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-=
it-does-not-exist.patch
+++ b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-=
it-does-not-exist.patch
@@ -1,4 +1,4 @@
-From 253b042d2bf10e9abfa9cc508e0782aefd834145 Mon Sep 17 00:00:00 2001
+From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Oct 2020 11:03:47 -0700
 Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
@@ -18,12 +18,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/src/util/futex.h b/src/util/futex.h
-index 43097f4..941b0ec 100644
+index 2a2a00c..92fc123 100644
 --- a/src/util/futex.h
 +++ b/src/util/futex.h
-@@ -34,6 +34,10 @@
- #include <sys/syscall.h>
- #include <sys/time.h>
+@@ -38,6 +38,10 @@
+ #define SYS_futex SYS_futex_time64
+ #endif
 =20
 +#if !defined(SYS_futex) && defined(SYS_futex_time64)
 +# define SYS_futex SYS_futex_time64
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit=
-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meso=
n-misdetects-64bit-atomics-on-mips-clang.patch
index b08e4d86c2..9cd9bee2d2 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomic=
s-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomic=
s-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From d34bdbd80e5a1f309d2ba280cdc66ff0ee0e5c43 Mon Sep 17 00:00:00 2001
+From 3ef37c63f03ad6f2af407de350486fdd25e9132a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0=
001-meson.build-check-for-all-linux-host_os-combinations.patch
index aea23d0ec2..ec263ce479 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From f9c597a2c517eb85c23cbeeb2e95c55794c74cda Mon Sep 17 00:00:00 2001
+From d092a9000da62dfccca5b58fca56b94eb9989c48 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23.=
me>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index bca6b1f..70d06c0 100644
+index 250b528..b5c98f8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -172,7 +172,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
+@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi =3D with_shared_glapi and with_any_opengl
 =20
@@ -32,11 +32,11 @@ index bca6b1f..70d06c0 100644
 =20
  dri_drivers =3D get_option('dri-drivers')
  if dri_drivers.length() !=3D 0
-@@ -1074,7 +1074,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; =
}',
+@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
  endif
 =20
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system())
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'andr=
oid'].contains(host_machine.system())
 +if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].conta=
ins(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args +=3D '-D_GNU_SOURCE'
  elif host_machine.system() =3D=3D 'sunos'
diff --git a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-A=
LWAYS_INLINE-compiler-error.patch b/meta/recipes-graphics/mesa/files/0001=
-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
index 48fc1e37ff..7989843eb4 100644
--- a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_I=
NLINE-compiler-error.patch
+++ b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_I=
NLINE-compiler-error.patch
@@ -1,3 +1,11 @@
+From da6e47f1717f34c73de388c56ffaf4861a07fdc5 Mon Sep 17 00:00:00 2001
+From: t bettler <thomas.bettler@gmail.com>
+Date: Sat, 9 Jul 2022 09:28:51 +0000
+Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
 Backport merge request to fix mesa compile error when debug build
 enabled.
=20
@@ -5,10 +13,6 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.=
org/mesa/mesa/-/merge_req
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
-From c69c6e7a35205557de73734ad4a1f411c8f99926 Mon Sep 17 00:00:00 2001
-From: t bettler <thomas.bettler@gmail.com>
-Date: Sat, 9 Jul 2022 09:28:51 +0000
-Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
@@ -17,13 +21,14 @@ fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98=
src_is_ssa=E2=80=99
=20
 Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
 Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1 ("nir/nir_opt_move: hand=
le non-SSA defs ")
+
 ---
  src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
  src/compiler/nir/nir_opt_move.c       |  2 +-
  2 files changed, 9 insertions(+), 3 deletions(-)
=20
 diff --git a/src/compiler/nir/nir_inline_helpers.h b/src/compiler/nir/ni=
r_inline_helpers.h
-index 125dd8a537c..ec33f0509f7 100644
+index 125dd8a..ec33f05 100644
 --- a/src/compiler/nir/nir_inline_helpers.h
 +++ b/src/compiler/nir/nir_inline_helpers.h
 @@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr, nir_foreach_dest_cb=
 cb, void *state)
@@ -48,7 +53,7 @@ index 125dd8a537c..ec33f0509f7 100644
 +   return _nir_foreach_src(instr, cb, state);
 +}
 diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_opt_=
move.c
-index 81bcde5c436..051c3cc6295 100644
+index 81bcde5..051c3cc 100644
 --- a/src/compiler/nir/nir_opt_move.c
 +++ b/src/compiler/nir/nir_opt_move.c
 @@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
@@ -60,6 +65,3 @@ index 81bcde5c436..051c3cc6295 100644
  }
 =20
  static bool
---=20
-2.34.1
-
diff --git a/meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDR=
I2Extension-instead-of-driDRI2.patch b/meta/recipes-graphics/mesa/files/0=
001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch
deleted file mode 100644
index db25e16f4a..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Exten=
sion-instead-of-driDRI2.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From feb4ec510b1328fdd9aa77305d3273d1f9c7e124 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 9 Jun 2022 11:42:05 +0200
-Subject: [PATCH] swrast_kms: use swkmsDRI2Extension instead of
- driDRI2Extension
-
-This set of changes:
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15649
-
-caused a regression in Xorg when using swrast_kms:
-   (EE) AIGLX error: Calling driver entry point failed
-
-This commit changes the swrast_kms driver to use a dedicated screen init=
 function
-(which I believe was overlooked); I also took the opportunity to rename =
the
-associated plumbling to have swrast-specific names.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/16942]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/gallium/frontends/dri/dri2.c       | 16 ++++++++--------
- src/gallium/frontends/dri/dri_screen.h |  4 ++--
- src/gallium/frontends/dri/dri_util.c   |  2 +-
- src/gallium/targets/dri/target.c       |  2 +-
- 4 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/src/gallium/frontends/dri/dri2.c b/src/gallium/frontends/dr=
i/dri2.c
-index 63ac9d5..de33789 100644
---- a/src/gallium/frontends/dri/dri2.c
-+++ b/src/gallium/frontends/dri/dri2.c
-@@ -2508,7 +2508,7 @@ release_pipe:
-  * Returns the struct gl_config supported by this driver.
-  */
- static const __DRIconfig **
--dri_kms_init_screen(__DRIscreen * sPriv)
-+dri_swrast_kms_init_screen(__DRIscreen * sPriv)
- {
- #if defined(GALLIUM_SOFTPIPE)
-    const __DRIconfig **configs;
-@@ -2613,8 +2613,8 @@ static const struct __DRIDriverVtableExtensionRec =
galliumdrm_vtable =3D {
-  * hook. The latter is used to explicitly initialise the kms_swrast dri=
ver
-  * rather than selecting the approapriate driver as suggested by the lo=
ader.
-  */
--const struct __DriverAPIRec dri_kms_driver_api =3D {
--   .InitScreen =3D dri_kms_init_screen,
-+const struct __DriverAPIRec dri_swrast_kms_driver_api =3D {
-+   .InitScreen =3D dri_swrast_kms_init_screen,
-    .DestroyScreen =3D dri_destroy_screen,
-    .CreateBuffer =3D dri2_create_buffer,
-    .DestroyBuffer =3D dri_destroy_buffer,
-@@ -2633,17 +2633,17 @@ const __DRIextension *galliumdrm_driver_extensio=
ns[] =3D {
-     NULL
- };
-=20
--static const struct __DRIDriverVtableExtensionRec dri_kms_vtable =3D {
-+static const struct __DRIDriverVtableExtensionRec dri_swrast_kms_vtable=
 =3D {
-    .base =3D { __DRI_DRIVER_VTABLE, 1 },
--   .vtable =3D &dri_kms_driver_api,
-+   .vtable =3D &dri_swrast_kms_driver_api,
- };
-=20
--const __DRIextension *dri_kms_driver_extensions[] =3D {
-+const __DRIextension *dri_swrast_kms_driver_extensions[] =3D {
-     &driCoreExtension.base,
-     &driImageDriverExtension.base,
--    &driDRI2Extension.base,
-+    &swkmsDRI2Extension.base,
-     &gallium_config_options.base,
--    &dri_kms_vtable.base,
-+    &dri_swrast_kms_vtable.base,
-     NULL
- };
-=20
-diff --git a/src/gallium/frontends/dri/dri_screen.h b/src/gallium/fronte=
nds/dri/dri_screen.h
-index 0ee2feb..0bb8817 100644
---- a/src/gallium/frontends/dri/dri_screen.h
-+++ b/src/gallium/frontends/dri/dri_screen.h
-@@ -168,8 +168,8 @@ dri_destroy_screen_helper(struct dri_screen * screen=
);
- void
- dri_destroy_screen(__DRIscreen * sPriv);
-=20
--extern const struct __DriverAPIRec dri_kms_driver_api;
--extern const __DRIextension *dri_kms_driver_extensions[];
-+extern const struct __DriverAPIRec dri_swrast_kms_driver_api;
-+extern const __DRIextension *dri_swrast_kms_driver_extensions[];
- extern const struct __DriverAPIRec galliumdrm_driver_api;
- extern const __DRIextension *galliumdrm_driver_extensions[];
- extern const struct __DriverAPIRec galliumsw_driver_api;
-diff --git a/src/gallium/frontends/dri/dri_util.c b/src/gallium/frontend=
s/dri/dri_util.c
-index 8d60526..03614e1 100644
---- a/src/gallium/frontends/dri/dri_util.c
-+++ b/src/gallium/frontends/dri/dri_util.c
-@@ -187,7 +187,7 @@ swkmsCreateNewScreen(int scrn, int fd,
- 		     const __DRIconfig ***driver_configs, void *data)
- {
-    return driCreateNewScreen2(scrn, fd, extensions,
--                              dri_kms_driver_extensions,
-+                              dri_swrast_kms_driver_extensions,
-                               driver_configs, data);
- }
-=20
-diff --git a/src/gallium/targets/dri/target.c b/src/gallium/targets/dri/=
target.c
-index 9b78351..e02b03b 100644
---- a/src/gallium/targets/dri/target.c
-+++ b/src/gallium/targets/dri/target.c
-@@ -25,7 +25,7 @@ const __DRIextension **__driDriverGetExtensions_kms_sw=
rast(void);
-=20
- PUBLIC const __DRIextension **__driDriverGetExtensions_kms_swrast(void)
- {
--   return dri_kms_driver_extensions;
-+   return dri_swrast_kms_driver_extensions;
- }
-=20
- #endif
diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-=
NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-f=
ormat-Check-for-NEON-before-using-it.patch
index 5c6165c281..d22ff3c8a8 100644
--- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-be=
fore-using-it.patch
+++ b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-be=
fore-using-it.patch
@@ -1,4 +1,4 @@
-From fdb2face4eeac3c20eedcca7520f4e7014225fb4 Mon Sep 17 00:00:00 2001
+From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Dec 2021 19:57:42 -0800
 Subject: [PATCH] util/format: Check for NEON before using it
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index 36c5e52..f0a0097 100644
+index c071250..0880984 100644
 --- a/src/util/format/u_format.c
 +++ b/src/util/format/u_format.c
-@@ -1138,7 +1138,7 @@ static void
+@@ -1184,7 +1184,7 @@ static void
  util_format_unpack_table_init(void)
  {
     for (enum pipe_format format =3D PIPE_FORMAT_NONE; format < PIPE_FOR=
MAT_COUNT; format++) {
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-E=
LF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-mak=
e-TLS-ELF-optional.patch
deleted file mode 100644
index af11baee86..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opti=
onal.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From bf41fa026ae3d378e62fd83d03a6f5933b52ca04 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair@alistair23.me>
-Date: Thu, 14 Nov 2019 13:08:31 -0800
-Subject: [PATCH] meson.build: make TLS ELF optional
-
-USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
-TLS GLX optional again" patch updated to the latest mesa.
-
-For details, see:
-https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
-
-This prevents runtime segfault on musl:
-
-Traceback (most recent call last):
-  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/co=
re/decorator/__init__.py", line 36, in wrapped_f
-    return func(*args, **kwargs)
-  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/ru=
ntime/cases/parselogs.py", line 378, in test_parselogs
-    self.assertEqual(errcount, 0, msg=3Dself.msg)
-AssertionError: 1 !=3D 0 : Log: /home/pokybuild/yocto-worker/musl-qemux8=
6/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0=
/target_logs/Xorg.0.log
-
-Upstream-Status: Inappropriate [configuration]
----
- meson.build       | 7 +++++--
- meson_options.txt | 6 ++++++
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 70d06c0..1441611 100644
---- a/meson.build
-+++ b/meson.build
-@@ -490,8 +490,11 @@ foreach platform : _platforms
-   pre_args +=3D '-DHAVE_@0@_PLATFORM'.format(platform.to_upper())
- endforeach
-=20
--use_elf_tls =3D true
--pre_args +=3D '-DUSE_ELF_TLS'
-+use_elf_tls =3D false
-+if get_option('elf-tls')
-+  use_elf_tls =3D true
-+  pre_args +=3D '-DUSE_ELF_TLS'
-+endif
-=20
- if with_platform_android and get_option('platform-sdk-version') >=3D 29
-   # By default the NDK compiler, at least, emits emutls references inst=
ead of
-diff --git a/meson_options.txt b/meson_options.txt
-index 1f6ef38..99cc5cb 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -440,6 +440,12 @@ option(
-   value : true,
-   description : 'Enable direct rendering in GLX and EGL for DRI',
- )
-+option(
-+  'elf-tls',
-+  type : 'boolean',
-+  value : true,
-+  description : 'Enable TLS support in ELF',
-+)
- option('egl-lib-suffix',
-   type : 'string',
-   value : '',
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index ea7ed4fd27..8a74e0a80a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,22 +10,19 @@ HOMEPAGE =3D "http://mesa3d.org"
 BUGTRACKER =3D "https://bugs.freedesktop.org"
 SECTION =3D "x11"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D9a383ee9f65a4e939d66=
30e9b067ff58"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9dc=
533a0735ef10"
=20
 PE =3D "2"
=20
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
-           file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
-           file://0001-Revert-egl-wayland-deprecate-drm_handle_format-an=
d-d.patch \
-           file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driD=
RI2.patch \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
            "
=20
-SRC_URI[sha256sum] =3D "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5=
050c5cec376e671a"
+SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f449473328=
80f2d0066bdafa8c"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -95,7 +92,7 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm =
virgl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-	${@bb.utils.contains('TCLIBC', 'glibc', 'elf-tls', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
 # "gbm" requires "opengl"
@@ -104,7 +101,6 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisab=
led"
 X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
-PACKAGECONFIG[elf-tls] =3D "-Delf-tls=3Dtrue, -Delf-tls=3Dfalse"
 PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Ddisab=
led,libxvmc"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
@@ -117,7 +113,7 @@ VULKAN_DRIVERS:append:x86:class-target =3D ",intel"
 VULKAN_DRIVERS:append:x86-64:class-target =3D ",intel"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'broadco=
m', ',broadcom', '', d)}"
-PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',"
+PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-hea=
ders"
=20
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
=20
@@ -137,6 +133,7 @@ PACKAGECONFIG[freedreno] =3D ""
 PACKAGECONFIG[kmsro] =3D ""
 PACKAGECONFIG[vc4] =3D ""
 PACKAGECONFIG[v3d] =3D ""
+PACKAGECONFIG[zink] =3D ""
=20
 GALLIUMDRIVERS =3D "swrast"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
@@ -149,6 +146,7 @@ GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKA=
GECONFIG', 'freedreno', ',fre
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'kmsro',=
 ',kmsro', '', d)}"
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'vc4', '=
,vc4', '', d)}"
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'v3d', '=
,v3d', '', d)}"
+GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'zink', =
',zink', '', d)}"
=20
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600=
', ',radeonsi', '', d)}"
@@ -177,6 +175,8 @@ GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKA=
GECONFIG', 'lima', ',lima', '
 PACKAGECONFIG[panfrost] =3D ""
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'panfros=
t', ',panfrost', '', d)}"
=20
+PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3Dfal=
se"
+
 PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
=20
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
diff --git a/meta/recipes-graphics/mesa/mesa_22.1.6.bb b/meta/recipes-gra=
phics/mesa/mesa_22.2.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_22.2.0.bb
--=20
2.34.1


