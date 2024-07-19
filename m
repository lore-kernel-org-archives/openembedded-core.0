Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0AFC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 07:55:43 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.14281.1721375735371658093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 00:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout11.t-online.de (Postfix) with SMTP id C2D6A89A6
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 09:55:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.70]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sUiSg-0Jm94r0; Fri, 19 Jul 2024 09:55:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: update 24.0.7 -> 24.1.4
Date: Fri, 19 Jul 2024 09:56:05 +0200
Message-ID: <20240719075605.2317257-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721375730-6BFF3EF1-78098BA8/0/0 CLEAN NORMAL
X-TOI-MSGID: 374b2bd9-8b0a-4bbf-a41b-dfdfb9e3d755
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 07:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202252

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
 ...on-t-encode-build-path-into-binaries.patch | 71 +++++++++++++++----
 .../{mesa-gl_24.0.7.bb =3D> mesa-gl_24.1.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 10 +--
 .../mesa/{mesa_24.0.7.bb =3D> mesa_24.1.4.bb}   |  0
 4 files changed, 61 insertions(+), 20 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.7.bb =3D> mesa-gl_24.1.4=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.7.bb =3D> mesa_24.1.4.bb} (=
100%)

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


