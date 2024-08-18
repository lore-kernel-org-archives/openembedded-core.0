Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA94C52D7C
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 16:47:40 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.192102.1723999651501754078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Aug 2024 09:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 40ADA21B5
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 18:47:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.9]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sfj3w-3Tjy0A0; Sun, 18 Aug 2024 18:47:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH 2/2] mesa: add support for rusticl
Date: Sun, 18 Aug 2024 18:48:34 +0200
Message-ID: <20240818164844.2738771-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240818164844.2738771-1-f_l_k@t-online.de>
References: <20240818164844.2738771-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1723999648-B17F9853-51B1C5D5/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e10ae66-dc54-48f6-8387-0e6cf144e2bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 16:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203483

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n.build-workaround-for-rusticl-build.patch | 27 +++++++++++
 ...6da9458c9d0348f2390dc0bea67cf140b1a0.patch | 45 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 34 +++++++++-----
 3 files changed, 96 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-meson.b=
uild-workaround-for-rusticl-build.patch
 create mode 100644 meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2=
390dc0bea67cf140b1a0.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-wo=
rkaround-for-rusticl-build.patch b/meta/recipes-graphics/mesa/files/0001-=
rusticl-meson.build-workaround-for-rusticl-build.patch
new file mode 100644
index 0000000000..9c953f961d
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-meson.build-workaroun=
d-for-rusticl-build.patch
@@ -0,0 +1,27 @@
+From b34ee4014ee9e3466ebafbd53745d9f9a13379da Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 11 Jul 2024 22:52:16 +0200
+Subject: [PATCH] rusticl/meson.build: workaround for rusticl build
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ src/gallium/frontends/rusticl/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/fro=
ntends/rusticl/meson.build
+index eef09d8f01e..efac4cab964 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -211,6 +211,7 @@ rusticl_llvm_bindings_rs =3D rust.bindgen(
+   c_args : [
+     rusticl_bindgen_c_args,
+     pre_args,
++   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
+   ],
+   dependencies : [
+     dep_clang,
+--=20
+2.45.2
+
diff --git a/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0b=
ea67cf140b1a0.patch b/meta/recipes-graphics/mesa/files/93e96da9458c9d0348=
f2390dc0bea67cf140b1a0.patch
new file mode 100644
index 0000000000..a676edf711
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/93e96da9458c9d0348f2390dc0bea67cf1=
40b1a0.patch
@@ -0,0 +1,45 @@
+From 93e96da9458c9d0348f2390dc0bea67cf140b1a0 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Sun, 18 Aug 2024 00:08:50 +0200
+Subject: [PATCH] rusticl: do not use CL vector types in bindings and cod=
e
+
+Bindgen seems to miscompile them and I kinda thought I've done this
+already in the past, but apparently not.
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/11722
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3071=
0>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/co=
mmit/93e96da9458c9d0348f2390dc0bea67cf140b1a0]
+---
+ src/gallium/frontends/rusticl/api/device.rs | 2 +-
+ src/gallium/frontends/rusticl/meson.build   | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/gallium/frontends/rusticl/api/device.rs b/src/gallium/f=
rontends/rusticl/api/device.rs
+index 9793092db5ad4..c1cb7902e0371 100644
+--- a/src/gallium/frontends/rusticl/api/device.rs
++++ b/src/gallium/frontends/rusticl/api/device.rs
+@@ -196,7 +196,7 @@ impl CLInfo<cl_device_info> for cl_device_id {
+             // TODO proper retrival from devices
+             CL_DEVICE_MEM_BASE_ADDR_ALIGN =3D> cl_prop::<cl_uint>(0x100=
0),
+             CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE =3D> {
+-                cl_prop::<cl_uint>(size_of::<cl_ulong16>() as cl_uint)
++                cl_prop::<cl_uint>(16 * size_of::<cl_ulong>() as cl_uin=
t)
+             }
+             CL_DEVICE_NAME =3D> cl_prop::<&str>(&dev.screen().name()),
+             CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR =3D> cl_prop::<cl_uint>(=
1),
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/fro=
ntends/rusticl/meson.build
+index 612e47bfe88e1..1fe75a611444d 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs =3D rust.bindgen(
+     '--raw-line', 'unsafe impl std::marker::Send for _cl_image_desc {}'=
,
+     '--raw-line', 'unsafe impl std::marker::Sync for _cl_image_desc {}'=
,
+     '--allowlist-type', 'cl_.*',
++    '--blocklist-type', '(__)?cl_.*[2348(16)]',
+     '--allowlist-type', 'cl.*_fn',
+     '--allowlist-var', 'CL_.*',
+     # needed for gl_sharing extension
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 40e7bed648..36d3ac5581 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,8 @@ PE =3D "2"
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
+           file://0001-rusticl-meson.build-workaround-for-rusticl-build.=
patch \
+           file://93e96da9458c9d0348f2390dc0bea67cf140b1a0.patch \
 "
=20
 SRC_URI[sha256sum] =3D "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a=
762ec6950a58addf"
@@ -34,7 +36,7 @@ do_install:append() {
 }
=20
 DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native p=
ython3-pyyaml-native"
-DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
+DEPENDS:append:class-target =3D " ${@bb.utils.contains_any('PACKAGECONFI=
G', 'opencl opencl-rusticl', 'mesa-native gcc-runtime', '', d)}"
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
@@ -45,7 +47,7 @@ PROVIDES =3D " \
     virtual/mesa \
     "
=20
-inherit meson pkgconfig python3native gettext features_check
+inherit meson rust pkgconfig python3native gettext features_check
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -72,8 +74,14 @@ EXTRA_OEMESON =3D " \
     -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
 "
=20
-EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
-EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
+EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains_any('PACKAG=
ECONFIG', 'opencl opencl-rusticl', '-Dintel-clc=3Dsystem', '', d)}"
+EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains_any('PACKAG=
ECONFIG', 'opencl opencl-rusticl', '-Dintel-clc=3Denabled -Dgallium-rusti=
cl=3Dfalse', '', d)}"
+
+do_configure:prepend() {
+	sed -i "s|@include@|${STAGING_INCDIR}|" ${S}/src/gallium/frontends/rust=
icl/meson.build
+	sed -i "s|@include_cpp@|${STAGING_INCDIR}\/c++\/14.2.0|" ${S}/src/galli=
um/frontends/rusticl/meson.build
+	sed -i "s|@include_cpp_target_sys@|${STAGING_INCDIR}\/c++\/14.2.0\/${TA=
RGET_SYS}|" ${S}/src/gallium/frontends/rusticl/meson.build
+}
=20
 def strip_comma(s):
     return s.strip(',')
@@ -103,10 +111,10 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3D=
disabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >=3D =
3.9
 VULKAN_DRIVERS =3D ""
-VULKAN_DRIVERS:append:x86 =3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', ',intel', '', d)},amd"
-VULKAN_DRIVERS:append:x86-64 =3D "${@bb.utils.contains('PACKAGECONFIG', =
'opencl', ',intel', '', d)},amd"
+VULKAN_DRIVERS:append:x86 =3D "${@bb.utils.contains_any('PACKAGECONFIG',=
 'opencl opencl-rusticl', ',intel', '', d)},amd"
+VULKAN_DRIVERS:append:x86-64 =3D "${@bb.utils.contains_any('PACKAGECONFI=
G', 'opencl opencl-rusticl', ',intel', '', d)},amd"
 # i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 =3D "${@bb.utils.contains('PACKAGECONFIG', 'o=
pencl', ',intel', '', d)},amd"
+VULKAN_DRIVERS:append:i686 =3D "${@bb.utils.contains_any('PACKAGECONFIG'=
, 'opencl opencl-rusticl', ',intel', '', d)},amd"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'broadco=
m', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'gallium=
-llvm', ',swrast', '', d)}"
@@ -142,6 +150,8 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisa=
bled"
=20
 # "opencl" requires libclc from meta-clang
 PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue,=
-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools pyt=
hon3-ply-native"
+# "opencl-rusticl" requires libclc, bindgen-cli and clang from meta-clan=
g
+PACKAGECONFIG[opencl-rusticl] =3D "-Dgallium-rusticl=3Dtrue,-Dgallium-ru=
sticl=3Dfalse,libclc bindgen-cli-native python3-ply-native clang"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ""
@@ -165,7 +175,7 @@ GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKA=
GECONFIG', 'kmsro', ',kmsro',
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'vc4', '=
,vc4', '', d)}"
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'v3d', '=
,v3d', '', d)}"
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'zink', =
',zink', '', d)}"
-GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'opencl'=
, ',iris', '', d)}"
+GALLIUMDRIVERS:append =3D"${@bb.utils.contains_any('PACKAGECONFIG', 'ope=
ncl opencl-rusticl', ',iris', '', d)}"
=20
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600=
', ',radeonsi', '', d)}"
@@ -228,7 +238,8 @@ DEV_PKG_DEPENDENCY =3D ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
=20
-RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains_any('PACKAGECONFIG', =
'opencl opencl-rusticl', 'libclc', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'spirv-tools', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -240,6 +251,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
+             libopencl-rusticl libopencl-rusticl-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
@@ -258,7 +270,7 @@ do_install:append () {
 }
=20
 do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', =
d)}; then
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl opencl-rusticl'=
, 'true', 'false', d)}; then
         install -d ${D}${bindir}
         install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
     fi
@@ -341,6 +353,7 @@ FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
 FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium=
-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-rusticl =3D "${libdir}/libRusticlOpenCL.so.* ${sysconfdi=
r}/OpenCL/vendors/rusticl.icd"
 FILES:libglapi =3D "${libdir}/libglapi.so.*"
 FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
 FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
@@ -355,6 +368,7 @@ FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* $=
{includedir}/GLES ${libdir}/p
 FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
 FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
+FILES:libopencl-rusticl-dev =3D "${libdir}/libRusticlOpenCL.so"
 FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h=
 ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
--=20
2.45.2


