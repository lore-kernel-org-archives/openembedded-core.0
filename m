Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1664C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 08:09:53 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.14433.1721376584876005661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 01:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id CF52AEFD8
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 10:09:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.70]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sUigQ-2N0q8H0; Fri, 19 Jul 2024 10:09:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] mesa: update 24.0.7 -> 24.1.4
Date: Fri, 19 Jul 2024 10:10:47 +0200
Message-ID: <20240719081047.2382310-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721376582-BF7F0839-7D7A9B64/0/0 CLEAN NORMAL
X-TOI-MSGID: 712a644c-b85f-458c-808c-7f748982cd59
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202255

 - Remove two patches that have been merged upstream
 - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
   Upstream managed to fix this:
   https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_t=
ype=3Dheads#L839
 - Drop OPENCL_NATIVE since the according option has been removed from me=
son_options.txt
 - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-meson-do-not-pull-in-clc-for-clover.patch | 53 --------------
 .../0001-drisw-fix-build-without-dri3.patch   | 58 ---------------
 ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 -----------
 .../{mesa-gl_24.0.7.bb =3D> mesa-gl_24.1.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 10 +--
 .../mesa/{mesa_24.0.7.bb =3D> mesa_24.1.4.bb}   |  0
 7 files changed, 61 insertions(+), 173 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build=
-without-dri3.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-tr=
y-zink-if-not-enabled-in-mesa.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb =3D> mesa-gl_24.1.4=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb =3D> mesa_24.1.4.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pu=
ll-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert=
-meson-do-not-pull-in-clc-for-clover.patch
deleted file mode 100644
index 1711e22585..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-c=
lc-for-clover.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Fri, 8 Mar 2024 15:53:11 +0100
-Subject: [PATCH] Revert "meson: do not pull in clc for clover"
-
-This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
-Upstream-Status: Inappropriate [https://gitlab.freedesktop.org/mesa/mesa=
/-/merge_requests/27783/diffs?commit_id=3Da976f2c9f0c07f9e06cc9affd9124b4=
5bc60c2bd]
-
-Once the merge request above was added, it will only be possible to prov=
ide opencl spir-v with gallium-rusticl=3Dtrue. This is not yet supported =
in the mesa recipe.
-For now reverting this commit allows to still use clover with opencl-spi=
rv, which would otherwise be broken starting from mesa 24.0.2.
-
-After it was merged, this patch needs to be removed and rusticl support =
will be required
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson.build              | 3 ++-
- src/compiler/meson.build | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 2db6185..741b5d1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -813,6 +813,7 @@ if _opencl !=3D 'disabled'
-     error('The Clover OpenCL state tracker requires rtti')
-   endif
-=20
-+  with_clc =3D true
-   with_gallium_opencl =3D true
-   with_opencl_icd =3D _opencl =3D=3D 'icd'
- else
-@@ -837,7 +838,7 @@ if with_gallium_rusticl
- endif
-=20
- dep_clc =3D null_dep
--if with_gallium_opencl or with_clc
-+if with_clc
-   dep_clc =3D dependency('libclc')
- endif
-=20
-diff --git a/src/compiler/meson.build b/src/compiler/meson.build
-index 8d73544..1dae56d 100644
---- a/src/compiler/meson.build
-+++ b/src/compiler/meson.build
-@@ -79,7 +79,7 @@ subdir('nir')
-=20
- subdir('spirv')
-=20
--if with_clc
-+if with_opencl_spirv
-   subdir('clc')
- endif
- if with_gallium
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-withou=
t-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-with=
out-dri3.patch
deleted file mode 100644
index ab16152090..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.=
patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
-
-commit 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
-added dri3_priv.h header and dri3_check_multibuffer() function in drisw =
that
-can be build without dri3.
-
-  i686-buildroot-linux-gnu/bin/ld: src/glx/libglx.a.p/drisw_glx.c.o: in =
function `driswCreateScreenDriver':
-  drisw_glx.c:(.text.driswCreateScreenDriver+0x3a0): undefined reference=
 to `dri3_check_multibuffer'
-  collect2: error: ld returned 1 exit status
-
-Add HAVE_DRI3 guard around dri3_priv.h header and the zink code using
-dri3_check_multibuffer().
-
-Fixes: 1887368df41 ("glx/sw: check for modifier support in the kopper pa=
th")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/drisw_glx.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
---- a/src/glx/drisw_glx.c
-+++ b/src/glx/drisw_glx.c
-@@ -32,7 +32,9 @@
- #include <dlfcn.h>
- #include "dri_common.h"
- #include "drisw_priv.h"
-+#ifdef HAVE_DRI3
- #include "dri3_priv.h"
-+#endif
- #include <X11/extensions/shmproto.h>
- #include <assert.h>
- #include <vulkan/vulkan_core.h>
-@@ -995,6 +997,7 @@ driswCreateScreenDriver(int screen, struct glx_displ=
ay *priv,
-        goto handle_error;
-    }
-=20
-+#ifdef HAVE_DRI3
-    if (pdpyp->zink) {
-       bool err;
-       psc->has_multibuffer =3D dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_dis=
play *priv,
-          goto handle_error;
-       }
-    }
-+#endif
-=20
-    glx_config_destroy_list(psc->base.configs);
-    psc->base.configs =3D configs;
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode=
-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-f=
reedreno-don-t-encode-build-path-into-binaries.patch
index 5975ab4472..38871b6d11 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-=
path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From 66d73feaac088d1a588a44a1780f2eaf4335fccf Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Date: Tue, 16 Jul 2024 12:32:47 +0300
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -13,33 +13,76 @@ it manually when running the tests.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/30206]
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 ---
+ meson.build                      | 1 +
+ meson_options.txt                | 7 +++++++
  src/freedreno/afuc/meson.build   | 4 ++++
  src/freedreno/decode/meson.build | 4 +++-
- src/freedreno/meson.build        | 2 +-
- 3 files changed, 8 insertions(+), 2 deletions(-)
+ src/freedreno/meson.build        | 5 ++++-
+ 5 files changed, 19 insertions(+), 2 deletions(-)
=20
+diff --git a/meson.build b/meson.build
+index 3bc837813f967..5c94e76649c63 100644
+--- a/meson.build
++++ b/meson.build
+@@ -76,6 +76,7 @@ if with_tools.contains('all')
+     'imagination',
+   ]
+ endif
++with_tools_for_development =3D get_option('tools-for-development')
+=20
+ with_any_vulkan_layers =3D get_option('vulkan-layers').length() !=3D 0
+ with_intel_tools =3D with_tools.contains('intel') or with_tools.contain=
s('intel-ui')
+diff --git a/meson_options.txt b/meson_options.txt
+index 753bebd961e3f..9bc308b512c13 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -537,6 +537,13 @@ option(
+   description : 'List of tools to build. (Note: `intel-ui` selects `int=
el`)',
+ )
+=20
++option(
++  'tools-for-development',
++  type : 'boolean',
++  value : false,
++  description : 'Support running tools from the build tree (for develop=
ers)',
++)
++
+ option(
+   'power8',
+   type : 'feature',
 diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.b=
uild
-index bb7cebf5a748..351cc31ef2de 100644
+index bb7cebf5a748c..351cc31ef2dec 100644
 --- a/src/freedreno/afuc/meson.build
 +++ b/src/freedreno/afuc/meson.build
-@@ -56,6 +56,7 @@ if with_tests
+@@ -56,10 +56,12 @@ if with_tests
    asm_fw =3D custom_target('afuc_test.fw',
      output: 'afuc_test.fw',
-     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm=
'), '@OUTPUT@'],
+     command: [asm, files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPU=
T@'],
++    env: {'RNN_PATH': rnn_src_path},
+   )
+   asm_fw_a7xx =3D custom_target('afuc_test_a7xx.fw',
+     output: 'afuc_test_a7xx.fw',
+     command: [asm, files('../.gitlab-ci/traces/afuc_test_a7xx.asm'), '@=
OUTPUT@'],
 +    env: {'RNN_PATH': rnn_src_path},
    )
    test('afuc-asm',
      diff,
-@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
+@@ -120,11 +122,13 @@ if cc.sizeof('size_t') > 4
      disasm_fw =3D custom_target('afuc_test.asm',
        output: 'afuc_test.asm',
-       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw'), '-g', '630'],
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.=
fw')],
++      env: {'RNN_PATH': rnn_src_path},
+       capture: true
+     )
+     disasm_fw_a7xx =3D custom_target('afuc_test_a7xx.asm',
+       output: 'afuc_test_a7xx.asm',
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test_=
a7xx.fw')],
 +      env: {'RNN_PATH': rnn_src_path},
        capture: true
      )
      test('afuc-disasm',
 diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/mes=
on.build
-index 469eeb4eb597..dfa1c12d0d9f 100644
+index 469eeb4eb5975..915ba11af3b33 100644
 --- a/src/freedreno/decode/meson.build
 +++ b/src/freedreno/decode/meson.build
 @@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
@@ -61,18 +104,20 @@ index 469eeb4eb597..dfa1c12d0d9f 100644
 =20
      test('crashdec-' + name,
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index 98e49b8fcf0e..145e72597eb9 100644
+index 98e49b8fcf0e9..f8bdc5299841b 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
-@@ -6,7 +6,7 @@ inc_freedreno_rnn =3D include_directories('rnn')
+@@ -6,7 +6,10 @@ inc_freedreno_rnn =3D include_directories('rnn')
 =20
  rnn_src_path =3D dir_source_root + '/src/freedreno/registers'
  rnn_install_path =3D get_option('datadir') + '/freedreno/registers'
 -rnn_path =3D rnn_src_path + ':' + get_option('prefix') + '/' + rnn_inst=
all_path
 +rnn_path =3D get_option('prefix') + '/' + rnn_install_path
++if with_tools_for_development
++  rnn_path =3D rnn_src_path + ':' + rnn_path
++endif
 =20
  dep_lua =3D dependency('lua54', 'lua53', 'lua52', 'lua', required: fals=
e,
                       allow_fallback: true, version: '>=3D5.2')
 --=20
-2.39.2
-
+GitLab
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-=
if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxe=
xt-don-t-try-zink-if-not-enabled-in-mesa.patch
deleted file mode 100644
index 036a0b4945..0000000000
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-=
enabled-in-mesa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
-
-Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
-added an automatic zink fallback even when the zink gallium is not
-enabled at build time.
-
-It leads to unexpected error log while loading drisw driver and
-zink is not installed on the rootfs:
-
-  MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so
-
-Fixes: 7d9ea77b459 ("glx: add automatic zink fallback loading between hw=
 and sw drivers")
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/27478]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/glx/glxext.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
---- a/src/glx/glxext.c
-+++ b/src/glx/glxext.c
-@@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
- #endif /* HAVE_DRI3 */
-       if (!debug_get_bool_option("LIBGL_DRI2_DISABLE", false))
-          dpyPriv->dri2Display =3D dri2CreateDisplay(dpy);
-+#if defined(HAVE_ZINK)
-       if (!dpyPriv->dri3Display && !dpyPriv->dri2Display)
-          try_zink =3D !debug_get_bool_option("LIBGL_KOPPER_DISABLE", fa=
lse) &&
-                     !getenv("GALLIUM_DRIVER");
-+#endif /* HAVE_ZINK */
-    }
- #endif /* GLX_USE_DRM */
-    if (glx_direct)
---=20
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb b/meta/recipes-=
graphics/mesa/mesa-gl_24.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 973b762135..a73e9d52c5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,14 +16,11 @@ PE =3D "2"
=20
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patc=
h \
-           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch =
\
            file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=
 \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
 "
=20
-SRC_URI[sha256sum] =3D "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae=
2c7d96db93f6c26a"
+SRC_URI[sha256sum] =3D "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c6=
9c8c51579937ade1"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -144,9 +141,8 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c spirv-tools python3-ply-native"
+# "opencl" requires libclc from meta-clang
+PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue,=
-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools pyt=
hon3-ply-native"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ""
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.7.bb b/meta/recipes-gra=
phics/mesa/mesa_24.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.7.bb
rename to meta/recipes-graphics/mesa/mesa_24.1.4.bb
--=20
2.45.1


