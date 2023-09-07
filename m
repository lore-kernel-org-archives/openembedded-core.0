Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB96CEE14D4
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 06:56:46 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.7677.1694069798811052811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 23:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 551B537566
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Sep 2023 08:56:35 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.97]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qe8wN-0OCqw50; Thu, 7 Sep 2023 08:56:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: add intel raytracing support to opencl build
Date: Thu,  7 Sep 2023 08:56:30 +0200
Message-ID: <20230907065630.2838179-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694069795-FE4022E6-9CFED373/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d27d163-8e18-443f-a9bb-148d0d0d7484
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 06:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187361

Recently mesa added a patch that allows to cross-compile Intel Vulkan
ray tracing support.

- Backport this patch
- Build and install intel_clc for mesa-native
- Add a dependency on mesa-native to provide intel_clc for target build
- Add a dependency on python3-ply-native as needed to build intel-clc
- Automatically build Intel Vulkan ray tracing support if the opencl
  packageconfig was added

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...llow-using-intel_clc-from-the-system.patch | 99 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 15 ++-
 2 files changed, 112 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-intel-Allow-usi=
ng-intel_clc-from-the-system.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-inte=
l_clc-from-the-system.patch b/meta/recipes-graphics/mesa/files/0001-intel=
-Allow-using-intel_clc-from-the-system.patch
new file mode 100644
index 0000000000..5eefd02068
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-f=
rom-the-system.patch
@@ -0,0 +1,99 @@
+From ac503f5d7bf36f021c576029a64ac1a3199f6b5a Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Thu, 31 Aug 2023 13:16:29 -0400
+Subject: [PATCH] intel: Allow using intel_clc from the system
+
+With -Dintel-clc=3Dsystem, the build system will search for an `intel_cl=
c`
+binary and use it instead of building `intel_clc` itself.
+
+This allows Intel Vulkan ray tracing support to be built when cross
+compiling without terrible hacks (that would otherwise be necessary due
+to `intel_clc`'s dependence on SPIRV-LLVM-Translator, libclc, clang, and
+LLVM).
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2498=
3>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/28c1053c07c177854520f6283fa665f17618adb5]
+
+---
+ meson.build                      | 6 +++---
+ meson_options.txt                | 5 ++++-
+ src/intel/compiler/meson.build   | 6 +++++-
+ src/intel/vulkan/grl/meson.build | 2 +-
+ 4 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 16e86ec..00a6953 100644
+--- a/meson.build
++++ b/meson.build
+@@ -259,12 +259,12 @@ endif
+=20
+ with_microsoft_clc =3D get_option('microsoft-clc').enabled()
+ if ['x86_64'].contains(host_machine.cpu_family())
+-  with_intel_clc =3D get_option('intel-clc').enabled()
+-  with_intel_vk_rt =3D with_intel_vk and with_intel_clc
++  with_intel_clc =3D get_option('intel-clc') =3D=3D 'enabled'
+ else
+   with_intel_clc =3D false
+-  with_intel_vk_rt =3D false
+ endif
++with_intel_vk_rt =3D with_intel_vk and get_option('intel-clc') !=3D 'di=
sabled'
++
+ with_clc =3D with_microsoft_clc or with_intel_clc
+ with_libclc =3D with_clc
+ with_spirv_to_dxil =3D get_option('spirv-to-dxil')
+diff --git a/meson_options.txt b/meson_options.txt
+index 379aea3..9800531 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -607,9 +607,12 @@ option(
+=20
+ option(
+   'intel-clc',
+-  type : 'feature',
++  type : 'combo',
+   deprecated: {'true': 'enabled', 'false': 'disabled'},
+   value : 'disabled',
++  choices : [
++    'enabled', 'disabled', 'system',
++  ],
+   description : 'Build the intel-clc compiler (enables Vulkan Intel ' +
+                 'Ray Tracing on supported hardware).'
+ )
+diff --git a/src/intel/compiler/meson.build b/src/intel/compiler/meson.b=
uild
+index 9a03d37..774e955 100644
+--- a/src/intel/compiler/meson.build
++++ b/src/intel/compiler/meson.build
+@@ -168,7 +168,10 @@ libintel_compiler =3D static_library(
+ )
+=20
+ # For now this tool is only going to be used by Anv
+-if with_intel_clc
++if get_option('intel-clc') =3D=3D 'system'
++  prog_intel_clc =3D find_program('intel_clc', native : true)
++  dep_prog_intel_clc =3D []
++elif with_intel_clc
+   prog_intel_clc =3D executable(
+     'intel_clc',
+     ['intel_clc.c'],
+@@ -181,6 +184,7 @@ if with_intel_clc
+     dependencies : [idep_nir, idep_clc, idep_mesautil, idep_intel_dev],
+     native : true,
+   )
++  dep_prog_intel_clc =3D [prog_intel_clc]
+ endif
+=20
+ if with_tests
+diff --git a/src/intel/vulkan/grl/meson.build b/src/intel/vulkan/grl/mes=
on.build
+index c0056b3..02a72f5 100644
+--- a/src/intel/vulkan/grl/meson.build
++++ b/src/intel/vulkan/grl/meson.build
+@@ -143,7 +143,7 @@ foreach t : [['125', 'gfx125', 'dg2']]
+                                    # if fixed there
+       ],
+       env: ['MESA_SHADER_CACHE_DISABLE=3Dtrue'],
+-      depends : [prog_intel_clc]
++      depends : dep_prog_intel_clc
+     )
+   endforeach
+=20
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 79a1d975bf..09f2d9b9ab 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
+           file://0001-intel-Allow-using-intel_clc-from-the-system.patch=
 \
            "
=20
 SRC_URI[sha256sum] =3D "2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162=
f8f7da18eea8aed9"
@@ -35,6 +36,7 @@ do_install:append() {
 }
=20
 DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS:append:class-target =3D " mesa-native"
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
@@ -72,6 +74,9 @@ EXTRA_OEMESON =3D " \
     -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
 "
=20
+EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
+EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
+
 def strip_comma(s):
     return s.strip(',')
=20
@@ -137,7 +142,7 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisa=
bled"
=20
 # "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
 OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c spirv-tools"
+PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c spirv-tools python3-ply-native"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ""
@@ -181,7 +186,6 @@ PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@st=
rip_comma('${GALLIUMDRIVERS}')}
 PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
 PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisabled"
 PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,li=
bva-initial"
-
 PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddi=
sabled,libvdpau"
=20
 PACKAGECONFIG[lima] =3D ""
@@ -248,6 +252,13 @@ do_install:append () {
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
=20
+do_install:append:class-native () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', =
d)}; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
+    fi
+}
+
 # For the packages that make up the OpenGL interfaces, inject variables =
so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), a=
nd
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
--=20
2.41.0


