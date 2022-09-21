Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49354C6FA82
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 16:39:43 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web09.8655.1663778378053830382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 09:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id D486EC846
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 18:39:35 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.145]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ob2l5-1vDWd80; Wed, 21 Sep 2022 18:39:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHV2 2/2] virglrenderer: upgrade 0.9.1 -> 0.10.3
Date: Wed, 21 Sep 2022 18:39:22 +0200
Message-Id: <20220921163922.34474-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921163922.34474-1-f_l_k@t-online.de>
References: <20220921163922.34474-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1663778375-D8A4C9D3-15F0A06B/0/0 CLEAN NORMAL
X-TOI-MSGID: 65b987b5-602b-4dc0-885f-aa1a706bd904
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 16:39:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170954

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...uild-use-python3-directly-for-python.patch |  11 +-
 .../virglrenderer/cve-2022-0135.patch         | 117 ------------------
 .../virglrenderer/cve-2022-0175.patch         | 107 ----------------
 .../virglrenderer/virglrenderer_0.10.3.bb     |  33 +++++
 .../virglrenderer/virglrenderer_0.9.1.bb      |  25 ----
 5 files changed, 39 insertions(+), 254 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve=
-2022-0135.patch
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve=
-2022-0175.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.1=
0.3.bb
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.9=
.1.bb

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson=
.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virg=
lrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.=
patch
index 0fd1d511d6..8230ba588b 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-=
use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-=
use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 63788c63ed39a3ce9994f4315d8997e1a9300d4d Mon Sep 17 00:00:00 2001
+From c853c9e5c44f1b23a15a7ba629ee02f7d8ec23a0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -8,17 +8,18 @@ its configuration).
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 682d7c8..19d2eae 100644
+index 13d95bb..b241eb2 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -60,7 +60,7 @@ foreach w : warnings
-    endif
- endforeach
+@@ -64,7 +64,7 @@ flags =3D [
+=20
+ add_project_arguments(cc.get_supported_arguments(flags), language : 'c'=
)
 =20
 -prog_python =3D import('python').find_installation('python3')
 +prog_python =3D 'python3'
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0=
135.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-01=
35.patch
deleted file mode 100644
index ae42dc8f6c..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.pat=
ch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 63aee871365f9c9e7fa9125672302a0fb250d34d Mon Sep 17 00:00:00 2001
-From: Gert Wollny <gert.wollny@collabora.com>
-Date: Tue, 30 Nov 2021 09:16:24 +0100
-Subject: [PATCH 2/2] vrend: propperly check whether the shader image ran=
ge is
- correct
-
-Also add a test to check the integer underflow.
-
-Closes: #251
-Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
-Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
-
-cherry-pick from anongit.freedesktop.org/virglrenderer
-commit 2aed5d4...
-
-CVE: CVE-2022-0135
-Upstream-Status: Backport
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- src/vrend_decode.c          |  3 +-
- tests/test_fuzzer_formats.c | 57 +++++++++++++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+), 1 deletion(-)
-
-diff --git a/src/vrend_decode.c b/src/vrend_decode.c
-index 91f5f24..6771b10 100644
---- a/src/vrend_decode.c
-+++ b/src/vrend_decode.c
-@@ -1249,8 +1249,9 @@ static int vrend_decode_set_shader_images(struct v=
rend_context *ctx, const uint3
-    if (num_images < 1) {
-       return 0;
-    }
-+
-    if (start_slot > PIPE_MAX_SHADER_IMAGES ||
--       start_slot > PIPE_MAX_SHADER_IMAGES - num_images)
-+       start_slot + num_images > PIPE_MAX_SHADER_IMAGES)
-       return EINVAL;
-=20
-    for (uint32_t i =3D 0; i < num_images; i++) {
-diff --git a/tests/test_fuzzer_formats.c b/tests/test_fuzzer_formats.c
-index 154a2e5..e32caf0 100644
---- a/tests/test_fuzzer_formats.c
-+++ b/tests/test_fuzzer_formats.c
-@@ -958,6 +958,61 @@ static void test_vrend_set_signle_abo_heap_overflow=
() {
-     virgl_renderer_submit_cmd((void *) cmd, ctx_id, 0xde);
- }
-=20
-+static void test_vrend_set_shader_images_overflow()
-+{
-+    uint32_t num_shaders =3D PIPE_MAX_SHADER_IMAGES + 1;
-+    uint32_t size =3D num_shaders * VIRGL_SET_SHADER_IMAGE_ELEMENT_SIZE=
 + 3;
-+    uint32_t cmd[size];
-+    int i =3D 0;
-+    cmd[i++] =3D ((size - 1)<< 16) | 0 << 8 | VIRGL_CCMD_SET_SHADER_IMA=
GES;
-+    cmd[i++] =3D PIPE_SHADER_FRAGMENT;
-+    memset(&cmd[i], 0, size - i);
-+
-+    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
-+}
-+
-+/* Test adapted from yaojun8558363@gmail.com:
-+ * https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/250
-+*/
-+static void test_vrend_3d_resource_overflow() {
-+
-+    struct virgl_renderer_resource_create_args resource;
-+    resource.handle =3D 0x4c474572;
-+    resource.target =3D PIPE_TEXTURE_2D_ARRAY;
-+    resource.format =3D VIRGL_FORMAT_Z24X8_UNORM;
-+    resource.nr_samples =3D 2;
-+    resource.last_level =3D 0;
-+    resource.array_size =3D 3;
-+    resource.bind =3D VIRGL_BIND_SAMPLER_VIEW;
-+    resource.depth =3D 1;
-+    resource.width =3D 8;
-+    resource.height =3D 4;
-+    resource.flags =3D 0;
-+
-+    virgl_renderer_resource_create(&resource, NULL, 0);
-+    virgl_renderer_ctx_attach_resource(ctx_id, resource.handle);
-+
-+    uint32_t size =3D 0x400;
-+    uint32_t cmd[size];
-+    int i =3D 0;
-+    cmd[i++] =3D (size - 1) << 16 | 0 << 8 | VIRGL_CCMD_RESOURCE_INLINE=
_WRITE;
-+    cmd[i++] =3D resource.handle;
-+    cmd[i++] =3D 0; // level
-+    cmd[i++] =3D 0; // usage
-+    cmd[i++] =3D 0; // stride
-+    cmd[i++] =3D 0; // layer_stride
-+    cmd[i++] =3D 0; // x
-+    cmd[i++] =3D 0; // y
-+    cmd[i++] =3D 0; // z
-+    cmd[i++] =3D 8; // w
-+    cmd[i++] =3D 4; // h
-+    cmd[i++] =3D 3; // d
-+    memset(&cmd[i], 0, size - i);
-+
-+    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
-+}
-+
-+
- int main()
- {
-    initialize_environment();
-@@ -980,6 +1035,8 @@ int main()
-    test_cs_nullpointer_deference();
-    test_vrend_set_signle_abo_heap_overflow();
-=20
-+   test_vrend_set_shader_images_overflow();
-+   test_vrend_3d_resource_overflow();
-=20
-    virgl_renderer_context_destroy(ctx_id);
-    virgl_renderer_cleanup(&cookie);
---=20
-2.25.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0=
175.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-01=
75.patch
deleted file mode 100644
index 7fbab75091..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.pat=
ch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 5ca7aca001092c557f0b6fc1ba3db7dcdab860b7 Mon Sep 17 00:00:00 2001
-From: Gert Wollny <gert.wollny@collabora.com>
-Date: Tue, 30 Nov 2021 09:29:42 +0100
-Subject: [PATCH 1/2] vrend: clear memory when allocating a host-backed m=
emory
- resource
-
-Closes: #249
-Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
-Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
-
-cherry-pick from anongit.freedesktop.org/virglrenderer
-commit b05bb61...
-
-CVE: CVE-2022-0175
-Upstream-Status: Backport
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- src/vrend_renderer.c        |  2 +-
- tests/test_virgl_transfer.c | 51 +++++++++++++++++++++++++++++++++++++
- 2 files changed, 52 insertions(+), 1 deletion(-)
-
-diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
-index b8b2a36..2650cf2 100644
---- a/src/vrend_renderer.c
-+++ b/src/vrend_renderer.c
-@@ -6788,7 +6788,7 @@ vrend_resource_alloc_buffer(struct vrend_resource =
*gr, uint32_t flags)
-    if (bind =3D=3D VIRGL_BIND_CUSTOM) {
-       /* use iovec directly when attached */
-       gr->storage_bits |=3D VREND_STORAGE_HOST_SYSTEM_MEMORY;
--      gr->ptr =3D malloc(size);
-+      gr->ptr =3D calloc(1, size);
-       if (!gr->ptr)
-          return -ENOMEM;
-    } else if (bind =3D=3D VIRGL_BIND_STAGING) {
-diff --git a/tests/test_virgl_transfer.c b/tests/test_virgl_transfer.c
-index bf7f438..3c53c3d 100644
---- a/tests/test_virgl_transfer.c
-+++ b/tests/test_virgl_transfer.c
-@@ -952,6 +952,56 @@ START_TEST(virgl_test_transfer_near_res_bounds_with=
_stride_succeeds)
- }
- END_TEST
-=20
-+START_TEST(test_vrend_host_backed_memory_no_data_leak)
-+{
-+   struct iovec iovs[1];
-+   int niovs =3D 1;
-+
-+   struct virgl_context ctx =3D {0};
-+
-+   int ret =3D testvirgl_init_ctx_cmdbuf(&ctx);
-+
-+   struct virgl_renderer_resource_create_args res;
-+   res.handle =3D 0x400;
-+   res.target =3D PIPE_BUFFER;
-+   res.format =3D VIRGL_FORMAT_R8_UNORM;
-+   res.nr_samples =3D 0;
-+   res.last_level =3D 0;
-+   res.array_size =3D 1;
-+   res.bind =3D VIRGL_BIND_CUSTOM;
-+   res.depth =3D 1;
-+   res.width =3D 32;
-+   res.height =3D 1;
-+   res.flags =3D 0;
-+
-+   uint32_t size =3D 32;
-+   uint8_t* data =3D calloc(1, size);
-+   memset(data, 1, 32);
-+   iovs[0].iov_base =3D data;
-+   iovs[0].iov_len =3D size;
-+
-+   struct pipe_box box =3D {0,0,0, size, 1,1};
-+
-+   virgl_renderer_resource_create(&res, NULL, 0);
-+   virgl_renderer_ctx_attach_resource(ctx.ctx_id, res.handle);
-+
-+   ret =3D virgl_renderer_transfer_read_iov(res.handle, ctx.ctx_id, 0, =
0, 0,
-+                                          (struct virgl_box *)&box, 0, =
iovs, niovs);
-+
-+   ck_assert_int_eq(ret, 0);
-+
-+   for (int i =3D 0; i < 32; ++i)
-+      ck_assert_int_eq(data[i], 0);
-+
-+   virgl_renderer_ctx_detach_resource(1, res.handle);
-+
-+   virgl_renderer_resource_unref(res.handle);
-+   free(data);
-+
-+}
-+END_TEST
-+
-+
- static Suite *virgl_init_suite(void)
- {
-   Suite *s;
-@@ -981,6 +1031,7 @@ static Suite *virgl_init_suite(void)
-   tcase_add_test(tc_core, virgl_test_transfer_buffer_bad_strides);
-   tcase_add_test(tc_core, virgl_test_transfer_2d_array_bad_layer_stride=
);
-   tcase_add_test(tc_core, virgl_test_transfer_2d_bad_level);
-+  tcase_add_test(tc_core, test_vrend_host_backed_memory_no_data_leak);
-=20
-   tcase_add_loop_test(tc_core, virgl_test_transfer_res_read_valid, 0, P=
IPE_MAX_TEXTURE_TYPES);
-   tcase_add_loop_test(tc_core, virgl_test_transfer_res_write_valid, 0, =
PIPE_MAX_TEXTURE_TYPES);
---=20
-2.25.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb =
b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
new file mode 100644
index 0000000000..567c62b570
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.3.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "VirGL virtual OpenGL renderer"
+DESCRIPTION =3D "Virgil is a research project to investigate the possibi=
lity of \
+creating a virtual 3D GPU for use inside qemu virtual machines, that all=
ows \
+the guest operating system to use the capabilities of the host GPU to \
+accelerate 3D rendering."
+HOMEPAGE =3D "https://virgil3d.github.io/"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76d=
b10"
+
+DEPENDS =3D "libdrm libepoxy virtual/egl virtual/libgbm"
+SRCREV =3D "0922041ec6730122e0fec11404e6859e2efc4bc0"
+SRC_URI =3D "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=
=3Dmaster \
+           file://0001-meson.build-use-python3-directly-for-python.patch=
 \
+           "
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig features_check
+
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'v=
enus-experimental', '', d)}"
+
+PACKAGECONFIG[venus-experimental] =3D "-Dvenus-experimental=3Dtrue,-Dven=
us-experimental=3Dfalse,vulkan-loader vulkan-headers"
+PACKAGECONFIG[va] =3D "-Dvideo=3Dtrue,-Dvideo=3Dfalse,libva"
+PACKAGECONFIG[render-server] =3D "-Drender-server=3Dtrue,-Drender-server=
=3Dfalse"
+PACKAGECONFIG[drm-msm-experimental] =3D "-Ddrm-msm-experimental=3Dtrue,-=
Ddrm-msm-experimental=3Dfalse"
+PACKAGECONFIG[minigbm_allocation] =3D "-Dminigbm_allocation=3Dtrue,-Dmin=
igbm_allocation=3Dfalse"
+PACKAGECONFIG[venus-validate] =3D "-Dvenus-validate=3Dtrue,-Dvenus-valid=
ate=3Dfalse"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,libcheck"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b=
/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
deleted file mode 100644
index ad3688e300..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "VirGL virtual OpenGL renderer"
-DESCRIPTION =3D "Virgil is a research project to investigate the possibi=
lity of \
-creating a virtual 3D GPU for use inside qemu virtual machines, that all=
ows \
-the guest operating system to use the capabilities of the host GPU to \
-accelerate 3D rendering."
-HOMEPAGE =3D "https://virgil3d.github.io/"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76d=
b10"
-
-DEPENDS =3D "libdrm virtual/egl virtual/libgbm libepoxy"
-SRCREV =3D "363915595e05fb252e70d6514be2f0c0b5ca312b"
-SRC_URI =3D "git://anongit.freedesktop.org/git/virglrenderer;branch=3Dbr=
anch-0.9.1 \
-           file://0001-meson.build-use-python3-directly-for-python.patch=
 \
-           file://cve-2022-0135.patch \
-           file://cve-2022-0175.patch \
-           "
-
-S =3D "${WORKDIR}/git"
-
-inherit meson pkgconfig features_check
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.34.1


