Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7751DC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 17:40:05 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.51079.1669916394881004121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 09:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 13C93269DE
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Dec 2022 18:39:52 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.248]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0nXJ-33Ap2v0; Thu, 1 Dec 2022 18:39:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
Date: Thu,  1 Dec 2022 18:39:42 +0100
Message-Id: <20221201173942.1218836-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669916389-6BFFB9DD-30E8FB4A/0/0 CLEAN NORMAL
X-TOI-MSGID: b30c7421-89ad-4b1b-9f47-db47431a48c2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 17:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174199

- remove deprecated xvmc PACKAGECONFIG
- remove futex.h patch. Code has been reworked, still needed?

Note: mesa-22.3.0 will require libperfetto update to v28. Otherwise compi=
lation will fail.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...fine-__NR_futex-if-it-does-not-exist.patch | 34 -------------------
 ...k-for-all-linux-host_os-combinations.patch |  7 ++--
 .../{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  4 +--
 .../mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb}   |  0
 5 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Define-=
__NR_futex-if-it-does-not-exist.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_fu=
tex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-fu=
tex.h-Define-__NR_futex-if-it-does-not-exist.patch
deleted file mode 100644
index e7d92197be..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-=
it-does-not-exist.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Oct 2020 11:03:47 -0700
-Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
-
-__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
-they only have 64bit variant of time_t. Glibc defines SYS_futex interfac=
e based on
-__NR_futex, since this is used in applications, such applications start
-to fail to build for these newer architectures. This patch defines a
-fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
-working
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/util/futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/util/futex.h b/src/util/futex.h
-index 2a2a00c..92fc123 100644
---- a/src/util/futex.h
-+++ b/src/util/futex.h
-@@ -38,6 +38,10 @@
- #define SYS_futex SYS_futex_time64
- #endif
-=20
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+# define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, const struc=
t timespec *timeout, void *addr2, int val3)
- {
-    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0=
001-meson.build-check-for-all-linux-host_os-combinations.patch
index ec263ce479..2031ea957a 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
@@ -23,16 +23,16 @@ diff --git a/meson.build b/meson.build
 index 250b528..b5c98f8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
+@@ -173,7 +173,7 @@
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi =3D with_shared_glapi and with_any_opengl
 =20
--system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
+-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
)
 +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux'=
)
 =20
  dri_drivers =3D get_option('dri-drivers')
  if dri_drivers.length() !=3D 0
-@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
+@@ -1072,7 +1072,7 @@
  endif
 =20
  # TODO: this is very incomplete
@@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644
    pre_args +=3D '-D_GNU_SOURCE'
  elif host_machine.system() =3D=3D 'sunos'
    pre_args +=3D '-D__EXTENSIONS__'
+
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-=
graphics/mesa/mesa-gl_22.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 115621228a..86bd91ff5c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,7 +17,6 @@ PE =3D "2"
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
-           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
            ${NATIVE_PATCHES} \
            "
@@ -25,7 +24,7 @@ NATIVE_PATCHES ?=3D ""
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD =
enabled
 NATIVE_PATCHES:class-native =3D "file://0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch"
=20
-SRC_URI[sha256sum] =3D "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b=
885d2ea2d5c098d6"
+SRC_URI[sha256sum] =3D "644bf936584548c2b88762111ad58b4aa3e4688874200e5a=
4eb74e53ce301746"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisable=
d"
 X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
-PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Ddisab=
led,libxvmc"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
 PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgproto =
libxshmfence"
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes-gra=
phics/mesa/mesa_22.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
rename to meta/recipes-graphics/mesa/mesa_22.3.0.bb
--=20
2.34.1


