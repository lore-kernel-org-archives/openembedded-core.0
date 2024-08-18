Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4C3C5320E
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 16:47:40 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.192103.1723999652590528529
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Aug 2024 09:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 3F8322A270
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 18:47:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.9]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sfj3v-3Tjy090; Sun, 18 Aug 2024 18:47:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH 1/2] mesa: update 24.1.4 -> 24.2.0
Date: Sun, 18 Aug 2024 18:48:33 +0200
Message-ID: <20240818164844.2738771-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1723999648-92FFA853-EAD80700/0/0 CLEAN NORMAL
X-TOI-MSGID: f4d67da3-8531-4978-b72c-b45c0507fdc6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 16:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203484

- Remove 0001-amd-Include-missing-llvm-IR-header-Module.h.patch -> merged
- INSANE_SKIP dev-so. All .so files that are installed in ${libdir}/dri
  are now links to libdril_dri.so, but they should still not be part of
  the dev package, I assume?
- add PACKAGE for mesa-gallium-drivers and install libgallium-24.2.0.so
- add python3-pyyaml-native-dependency

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...lude-missing-llvm-IR-header-Module.h.patch | 41 -------------------
 .../{mesa-gl_24.1.4.bb =3D> mesa-gl_24.2.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  9 ++--
 .../mesa/{mesa_24.1.4.bb =3D> mesa_24.2.0.bb}   |  0
 4 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-mis=
sing-llvm-IR-header-Module.h.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_24.1.4.bb =3D> mesa-gl_24.2.0=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.1.4.bb =3D> mesa_24.2.0.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-ll=
vm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-I=
nclude-missing-llvm-IR-header-Module.h.patch
deleted file mode 100644
index 82ad88a079..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-h=
eader-Module.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 1 Jul 2024 23:09:29 -0700
-Subject: [PATCH] amd: Include missing llvm IR header Module.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-With LLVM-19, Module.h header is not being pulled, which results in
-compile errors e.g.
-
-src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for =
call to =E2=80=98unwrap(LLVMOpaqueModule*&)=E2=80=99
-  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTrip=
le());
-      |    ~~~~~~^~~~~~~~
-In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:2=
3,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
-                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa=
-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibr=
aryInfo.h:14,
-                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
-
-Its getting the definition from llvm/IR/Type.h instead of Module.h and c=
aused
-confusion to compiler
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/29993]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/amd/llvm/ac_llvm_helper.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_help=
er.cpp
-index 5d065279ad1..af4a50f8409 100644
---- a/src/amd/llvm/ac_llvm_helper.cpp
-+++ b/src/amd/llvm/ac_llvm_helper.cpp
-@@ -8,6 +8,7 @@
- #include <llvm/Analysis/TargetLibraryInfo.h>
- #include <llvm/IR/IRBuilder.h>
- #include <llvm/IR/LegacyPassManager.h>
-+#include <llvm/IR/Module.h>
- #include <llvm/IR/Verifier.h>
- #include <llvm/Target/TargetMachine.h>
- #include <llvm/MC/MCSubtargetInfo.h>
diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb b/meta/recipes-=
graphics/mesa/mesa-gl_24.2.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.1.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.2.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 499006655d..40e7bed648 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,11 +16,10 @@ PE =3D "2"
=20
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
-           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch=
 \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch\
 "
=20
-SRC_URI[sha256sum] =3D "7cf7c6f665263ad0122889c1d4b076654c1eedea7a2f38c6=
9c8c51579937ade1"
+SRC_URI[sha256sum] =3D "c02bb72cea290f78b11895a0c95c7c92394f180d7ff66d4a=
762ec6950a58addf"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -34,7 +33,7 @@ do_install:append() {
   fi
 }
=20
-DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native p=
ython3-pyyaml-native"
 DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
@@ -243,7 +242,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers mesa-tools \
+             mesa-vdpau-drivers mesa-gallium-drivers mesa-tools \
             "
=20
 do_install:append () {
@@ -335,6 +334,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
+FILES:mesa-gallium-drivers =3D "${libdir}/libgallium-*.so"
 FILES:libgbm =3D "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
@@ -362,6 +362,7 @@ FILES:libxatracker-dev =3D "${libdir}/libxatracker.so=
 ${libdir}/libxatracker.la \
 # catch all to get all the tools and data
 FILES:${PN}-tools =3D "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools =3D "1"
+INSANE_SKIP:${PN}-megadriver =3D "dev-so"
=20
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver =3D "mesa"
diff --git a/meta/recipes-graphics/mesa/mesa_24.1.4.bb b/meta/recipes-gra=
phics/mesa/mesa_24.2.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.1.4.bb
rename to meta/recipes-graphics/mesa/mesa_24.2.0.bb
--=20
2.45.2


