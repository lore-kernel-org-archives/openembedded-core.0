Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DB4E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 17:24:46 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.63833.1696181086058495572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 10:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 0F65A2DA93
	for <openembedded-core@lists.openembedded.org>; Sun,  1 Oct 2023 19:24:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.227.184]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qn0BM-0Gkslt0; Sun, 1 Oct 2023 19:24:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] mesa: Upgrade 23.1.8 -> 23.2.1
Date: Sun,  1 Oct 2023 19:24:36 +0200
Message-ID: <20231001172436.3774756-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1696181080-D0FD8E88-EA02D224/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b0ccfe6-0005-46d4-9432-ea0f25dca0a4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 17:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188514

- update 0001-gallium-Fix-build-with-llvm-17.patch
- remove as added upstream:
0001-intel-Allow-using-intel_clc-from-the-system.patch
- intel clc build is currently broken with llvm 17, but that issue is als=
o
present
  with mesa 23.1.8

https://gitlab.freedesktop.org/mesa/mesa/-/issues/9701
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24879
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/2153

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 19 ++--
 ...llow-using-intel_clc-from-the-system.patch | 99 -------------------
 .../{mesa-gl_23.1.8.bb =3D> mesa-gl_23.2.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  5 +-
 .../mesa/{mesa_23.1.8.bb =3D> mesa_23.2.1.bb}   |  0
 5 files changed, 12 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-intel-Allow-usi=
ng-intel_clc-from-the-system.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_23.1.8.bb =3D> mesa-gl_23.2.1=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.1.8.bb =3D> mesa_23.2.1.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with=
-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-=
with-llvm-17.patch
index 165708145a..237f940f0b 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-1=
7.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-1=
7.patch
@@ -1,4 +1,4 @@
-From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 2001
+From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 23 Jun 2023 01:20:38 -0700
 Subject: [PATCH] gallium: Fix build with llvm 17
@@ -9,16 +9,19 @@ so add conditions to exclude them for llvm >=3D 17
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/23827]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
=20
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/a=
uxiliary/gallivm/lp_bld_init.c
+index cd2108f..b1a4d03 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -42,8 +42,10 @@
-=20
- #include <llvm/Config/llvm-config.h>
- #include <llvm-c/Analysis.h>
+@@ -46,15 +46,19 @@
+ #if GALLIVM_USE_NEW_PASS =3D=3D 1
+ #include <llvm-c/Transforms/PassBuilder.h>
+ #elif GALLIVM_HAVE_CORO =3D=3D 1
 +#if LLVM_VERSION_MAJOR < 17
  #include <llvm-c/Transforms/Scalar.h>
 -#if LLVM_VERSION_MAJOR >=3D 7
@@ -26,8 +29,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#if LLVM_VERSION_MAJOR >=3D 7 && LLVM_VERSION_MAJOR < 17
  #include <llvm-c/Transforms/Utils.h>
  #endif
- #include <llvm-c/BitWriter.h>
-@@ -53,8 +55,10 @@
  #if LLVM_VERSION_MAJOR <=3D 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_AR=
M || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
  #include <llvm-c/Transforms/IPO.h>
  #endif
diff --git a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-inte=
l_clc-from-the-system.patch b/meta/recipes-graphics/mesa/files/0001-intel=
-Allow-using-intel_clc-from-the-system.patch
deleted file mode 100644
index 5eefd02068..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-f=
rom-the-system.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ac503f5d7bf36f021c576029a64ac1a3199f6b5a Mon Sep 17 00:00:00 2001
-From: Matt Turner <mattst88@gmail.com>
-Date: Thu, 31 Aug 2023 13:16:29 -0400
-Subject: [PATCH] intel: Allow using intel_clc from the system
-
-With -Dintel-clc=3Dsystem, the build system will search for an `intel_cl=
c`
-binary and use it instead of building `intel_clc` itself.
-
-This allows Intel Vulkan ray tracing support to be built when cross
-compiling without terrible hacks (that would otherwise be necessary due
-to `intel_clc`'s dependence on SPIRV-LLVM-Translator, libclc, clang, and
-LLVM).
-
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2498=
3>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/28c1053c07c177854520f6283fa665f17618adb5]
-
----
- meson.build                      | 6 +++---
- meson_options.txt                | 5 ++++-
- src/intel/compiler/meson.build   | 6 +++++-
- src/intel/vulkan/grl/meson.build | 2 +-
- 4 files changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 16e86ec..00a6953 100644
---- a/meson.build
-+++ b/meson.build
-@@ -259,12 +259,12 @@ endif
-=20
- with_microsoft_clc =3D get_option('microsoft-clc').enabled()
- if ['x86_64'].contains(host_machine.cpu_family())
--  with_intel_clc =3D get_option('intel-clc').enabled()
--  with_intel_vk_rt =3D with_intel_vk and with_intel_clc
-+  with_intel_clc =3D get_option('intel-clc') =3D=3D 'enabled'
- else
-   with_intel_clc =3D false
--  with_intel_vk_rt =3D false
- endif
-+with_intel_vk_rt =3D with_intel_vk and get_option('intel-clc') !=3D 'di=
sabled'
-+
- with_clc =3D with_microsoft_clc or with_intel_clc
- with_libclc =3D with_clc
- with_spirv_to_dxil =3D get_option('spirv-to-dxil')
-diff --git a/meson_options.txt b/meson_options.txt
-index 379aea3..9800531 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -607,9 +607,12 @@ option(
-=20
- option(
-   'intel-clc',
--  type : 'feature',
-+  type : 'combo',
-   deprecated: {'true': 'enabled', 'false': 'disabled'},
-   value : 'disabled',
-+  choices : [
-+    'enabled', 'disabled', 'system',
-+  ],
-   description : 'Build the intel-clc compiler (enables Vulkan Intel ' +
-                 'Ray Tracing on supported hardware).'
- )
-diff --git a/src/intel/compiler/meson.build b/src/intel/compiler/meson.b=
uild
-index 9a03d37..774e955 100644
---- a/src/intel/compiler/meson.build
-+++ b/src/intel/compiler/meson.build
-@@ -168,7 +168,10 @@ libintel_compiler =3D static_library(
- )
-=20
- # For now this tool is only going to be used by Anv
--if with_intel_clc
-+if get_option('intel-clc') =3D=3D 'system'
-+  prog_intel_clc =3D find_program('intel_clc', native : true)
-+  dep_prog_intel_clc =3D []
-+elif with_intel_clc
-   prog_intel_clc =3D executable(
-     'intel_clc',
-     ['intel_clc.c'],
-@@ -181,6 +184,7 @@ if with_intel_clc
-     dependencies : [idep_nir, idep_clc, idep_mesautil, idep_intel_dev],
-     native : true,
-   )
-+  dep_prog_intel_clc =3D [prog_intel_clc]
- endif
-=20
- if with_tests
-diff --git a/src/intel/vulkan/grl/meson.build b/src/intel/vulkan/grl/mes=
on.build
-index c0056b3..02a72f5 100644
---- a/src/intel/vulkan/grl/meson.build
-+++ b/src/intel/vulkan/grl/meson.build
-@@ -143,7 +143,7 @@ foreach t : [['125', 'gfx125', 'dg2']]
-                                    # if fixed there
-       ],
-       env: ['MESA_SHADER_CACHE_DISABLE=3Dtrue'],
--      depends : [prog_intel_clc]
-+      depends : dep_prog_intel_clc
-     )
-   endforeach
-=20
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb b/meta/recipes-=
graphics/mesa/mesa-gl_23.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 4e824500dd..e5c405a972 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,11 +18,10 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mes=
a-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
-           file://0001-intel-Allow-using-intel_clc-from-the-system.patch=
 \
            file://0001-meson-Disable-cmake-dependency-detector-for-llvm.=
patch \
-           "
+"
=20
-SRC_URI[sha256sum] =3D "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13=
e736f36134db14ad"
+SRC_URI[sha256sum] =3D "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8=
a259b20df8bbc1cc"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta/recipes-graphics/mesa/mesa_23.1.8.bb b/meta/recipes-gra=
phics/mesa/mesa_23.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.1.8.bb
rename to meta/recipes-graphics/mesa/mesa_23.2.1.bb
--=20
2.42.0


