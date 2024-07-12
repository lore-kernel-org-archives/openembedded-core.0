Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74922C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:51:31 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.4272.1720777888764994868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 04B244FFD
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:50:51 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.121]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sSCvS-3SFqcL0; Fri, 12 Jul 2024 11:50:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] mesa: fixes for rusticl implementation
Date: Fri, 12 Jul 2024 11:51:55 +0200
Message-ID: <20240712095155.66983-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1720777850-267FBC65-E21C8FC9/0/0 CLEAN NORMAL
X-TOI-MSGID: 6eb11a44-b6cf-41a8-9d32-6d149b6ca6a4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201818

- Add dependencies for clang and gcc-runtime to provide needed headers. A=
dd a dependency
  for bindgen-cli-native to allow creating the rust bindings
- Disable rusticl build for mesa-native
- Add a PACKAGECONFIG for rusticl
- inherit rust to make rusticl buildable
- Add a crude hack to make the compiler includes visible to bindgen-cli
  Without this the headers will be taken from host and that is inappropri=
ate for yocto/oe
  If they are not found the build fails

There is still a compile issue left that suggests to me that a rust updat=
e is required:
error[E0658]: use of unstable library feature 'offset_of'
 --> src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs:3:13312
  |
3 | ...() - 8usize] ; ["Offset of field: _IO_FILE::_flags"] [:: std :: me=
m :: offset_of ! (_IO_FILE , _flags) - 0usize] ; ["Offset of field: ...
  |                                                          ^^^^^^^^^^^^=
^^^^^^^^^^^^^^
  |
  =3D note: see issue #106655 <https://github.com/rust-lang/rust/issues/1=
06655> for more information

error[E0658]: use of unstable library feature 'offset_of'
 --> src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs:3:13418

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n.build-workaround-for-rusticl-build.patch | 27 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 22 ++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-meson.b=
uild-workaround-for-rusticl-build.patch

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
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index b403a2481a..ba3c8c147f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -16,6 +16,7 @@ PE =3D "2"
=20
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
+           file://0001-rusticl-meson.build-workaround-for-rusticl-build.=
patch \
 "
=20
 SRC_URI[sha256sum] =3D "63236426b25a745ba6aa2d6daf8cd769d5ea01887b0745ab=
7124d2ef33a9020d"
@@ -33,7 +34,7 @@ do_install:append() {
 }
=20
 DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
-DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native', '', d)}"
+DEPENDS:append:class-target =3D " ${@bb.utils.contains('PACKAGECONFIG', =
'opencl', 'mesa-native gcc-runtime', '', d)}"
 EXTRANATIVEPATH +=3D "chrpath-native"
 PROVIDES =3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
@@ -44,7 +45,7 @@ PROVIDES =3D " \
     virtual/mesa \
     "
=20
-inherit meson pkgconfig python3native gettext features_check
+inherit meson rust pkgconfig python3native gettext features_check
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -72,7 +73,13 @@ EXTRA_OEMESON =3D " \
 "
=20
 EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
-EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"
+EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECON=
FIG', 'opencl', '-Dintel-clc=3Denabled -Dgallium-rusticl=3Dfalse', '', d)=
}"
+
+do_configure:prepend() {
+	sed -i "s|@include@|${STAGING_INCDIR}|" ${S}/src/gallium/frontends/rust=
icl/meson.build
+	sed -i "s|@include_cpp@|${STAGING_INCDIR}\/c++\/14.1.0|" ${S}/src/galli=
um/frontends/rusticl/meson.build
+	sed -i "s|@include_cpp_target_sys@|${STAGING_INCDIR}\/c++\/14.1.0\/${TA=
RGET_SYS}|" ${S}/src/gallium/frontends/rusticl/meson.build
+}
=20
 def strip_comma(s):
     return s.strip(',')
@@ -139,8 +146,10 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3D=
enabled, -Dgles1=3Ddisabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
-# "opencl" requires libclc from meta-clang
-PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue,=
-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools pyt=
hon3-ply-native"
+# "opencl-clover" requires libclc from meta-clang
+PACKAGECONFIG[opencl-clover] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3D=
true,-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tool=
s python3-ply-native"
+# "opencl" requires libclc, bindgen-cli and clang from meta-clang
+PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue,-Dgallium-rusticl=3D=
false,libclc bindgen-cli-native python3-ply-native clang"
=20
 PACKAGECONFIG[broadcom] =3D ""
 PACKAGECONFIG[etnaviv] =3D ""
@@ -223,7 +232,8 @@ DEV_PKG_DEPENDENCY =3D ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
=20
-RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains_any('PACKAGECONFIG', =
'opencl opencl-clover', 'libclc', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl-clover', 'spirv-tools', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
--=20
2.45.2


