Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E800C433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 07:30:41 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.2893.1647070240289531987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 23:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id 79A81432D
	for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:30:37 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.239]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nSwCz-1FWgtt0; Sat, 12 Mar 2022 08:30:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3 1/3] mesa: update to 22.0.0
Date: Sat, 12 Mar 2022 08:30:20 +0100
Message-Id: <20220312073022.2894-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647070237-0000EDC4-D9F8E359/0/0 CLEAN NORMAL
X-TOI-MSGID: 23da9e22-a3db-4855-aad8-40588de26b05
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 07:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163081

- remove 0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch that wa=
s applied upstream

- adjust 0002-meson.build-make-TLS-ELF-optional.patch

- fix patch fuzz

- DRI1 drivers have been removed! For all AMD/Nvidia Cards gallium-llvm i=
s required

License-Update: removed references to deleted code.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...fine-__NR_futex-if-it-does-not-exist.patch |  5 ++-
 ...sdetects-64bit-atomics-on-mips-clang.patch |  8 ++--
 ...k-for-all-linux-host_os-combinations.patch | 10 ++---
 ...ormat-Check-for-NEON-before-using-it.patch | 10 ++---
 ...unt-for-64bit-time_t-on-32bit-arches.patch | 41 -----------------
 ...02-meson.build-make-TLS-ELF-optional.patch | 44 +++++++++----------
 meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb  | 16 -------
 meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb  | 13 ++++++
 meta/recipes-graphics/mesa/mesa.inc           | 13 +++---
 meta/recipes-graphics/mesa/mesa_21.3.7.bb     |  5 ---
 meta/recipes-graphics/mesa/mesa_22.0.0.bb     |  2 +
 11 files changed, 58 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-v3dv-account-fo=
r-64bit-time_t-on-32bit-arches.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa_21.3.7.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_22.0.0.bb

diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_fu=
tex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-fu=
tex.h-Define-__NR_futex-if-it-does-not-exist.patch
index 8bedbac669..3b0bfa323b 100644
--- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-=
it-does-not-exist.patch
+++ b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-=
it-does-not-exist.patch
@@ -1,4 +1,4 @@
-From 8973e297f2f9b17498b9dc0e37a19481d4bb7df9 Mon Sep 17 00:00:00 2001
+From 253b042d2bf10e9abfa9cc508e0782aefd834145 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Oct 2020 11:03:47 -0700
 Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
@@ -12,10 +12,13 @@ working
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/util/futex.h | 4 ++++
  1 file changed, 4 insertions(+)
=20
+diff --git a/src/util/futex.h b/src/util/futex.h
+index 43097f4..941b0ec 100644
 --- a/src/util/futex.h
 +++ b/src/util/futex.h
 @@ -34,6 +34,10 @@
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit=
-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meso=
n-misdetects-64bit-atomics-on-mips-clang.patch
index 15485feb71..b08e4d86c2 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomic=
s-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomic=
s-on-mips-clang.patch
@@ -1,16 +1,17 @@
-From bb2f0bea553d51d659a9bc46f7ae186885405151 Mon Sep 17 00:00:00 2001
+From d34bdbd80e5a1f309d2ba280cdc66ff0ee0e5c43 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/util/u_atomic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
-index e4bffa8..58e1ddd 100644
+index 5a5eab4..e499516 100644
 --- a/src/util/u_atomic.c
 +++ b/src/util/u_atomic.c
 @@ -21,7 +21,7 @@
@@ -22,6 +23,3 @@ index e4bffa8..58e1ddd 100644
 =20
  #include <stdint.h>
  #include <pthread.h>
---=20
-2.24.1
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0=
001-meson.build-check-for-all-linux-host_os-combinations.patch
index b6f86743e1..aea23d0ec2 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From 38e984073e4c23b6278d1a2ff21e894fda7b93c5 Mon Sep 17 00:00:00 2001
+From f9c597a2c517eb85c23cbeeb2e95c55794c74cda Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23.=
me>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 932eb13..efc6171 100644
+index bca6b1f..70d06c0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -153,7 +153,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
+@@ -172,7 +172,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi =3D with_shared_glapi and with_any_opengl
 =20
@@ -31,8 +31,8 @@ index 932eb13..efc6171 100644
 +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux'=
)
 =20
  dri_drivers =3D get_option('dri-drivers')
- if dri_drivers.contains('auto')
-@@ -970,7 +970,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }'=
,
+ if dri_drivers.length() !=3D 0
+@@ -1074,7 +1074,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; =
}',
  endif
 =20
  # TODO: this is very incomplete
diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-=
NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-f=
ormat-Check-for-NEON-before-using-it.patch
index 80b9af08e8..5c6165c281 100644
--- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-be=
fore-using-it.patch
+++ b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-be=
fore-using-it.patch
@@ -1,4 +1,4 @@
-From 4febda271c6bb0dc69ebf573446c6922a1ec35fb Mon Sep 17 00:00:00 2001
+From fdb2face4eeac3c20eedcca7520f4e7014225fb4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Dec 2021 19:57:42 -0800
 Subject: [PATCH] util/format: Check for NEON before using it
@@ -13,13 +13,14 @@ In file included from ../mesa-21.3.0/src/util/format/=
u_format_unpack_neon.c:35:
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/14032]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/util/format/u_format.c             | 2 +-
  src/util/format/u_format_unpack_neon.c | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index 36c5e52008e..f0a00971691 100644
+index 36c5e52..f0a0097 100644
 --- a/src/util/format/u_format.c
 +++ b/src/util/format/u_format.c
 @@ -1138,7 +1138,7 @@ static void
@@ -32,7 +33,7 @@ index 36c5e52008e..f0a00971691 100644
        if (unpack) {
           util_format_unpack_table[format] =3D unpack;
 diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_=
format_unpack_neon.c
-index a4a5cb1f723..1e4f794a295 100644
+index a4a5cb1..1e4f794 100644
 --- a/src/util/format/u_format_unpack_neon.c
 +++ b/src/util/format/u_format_unpack_neon.c
 @@ -23,7 +23,7 @@
@@ -44,6 +45,3 @@ index a4a5cb1f723..1e4f794a295 100644
 =20
  /* armhf builds default to vfp, not neon, and refuses to compile neon i=
ntrinsics
   * unless you tell it "no really".
---=20
-2.34.1
-
diff --git a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit=
-time_t-on-32bit-arches.patch b/meta/recipes-graphics/mesa/files/0001-v3d=
v-account-for-64bit-time_t-on-32bit-arches.patch
deleted file mode 100644
index e87d7d7311..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t=
-on-32bit-arches.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 7 Dec 2021 11:13:27 -0800
-Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches
-
-This makes is a bit more portable, especially on 32bit architectures
-with 64bit time_t defaults. Especially on musl its a must.
-
-Fixes
-../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format specif=
ies type 'long' but the argument has type 'time_t' (aka 'long long') [-We=
rror,-Wformat]
-              time.tv_sec);
-              ^~~~~~~~~~~
-
-Also reported here [1]
-
-[1] https://github.com/agherzan/meta-raspberrypi/issues/969
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/14118]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/broadcom/vulkan/v3dv_bo.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo=
.c
-index 71679ce..dc5e7f5 100644
---- a/src/broadcom/vulkan/v3dv_bo.c
-+++ b/src/broadcom/vulkan/v3dv_bo.c
-@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)
-=20
-       struct timespec time;
-       clock_gettime(CLOCK_MONOTONIC, &time);
--      fprintf(stderr, "  now:               %ld\n",
--              time.tv_sec);
-+      fprintf(stderr, "  now:               %lld\n",
-+              (long long)time.tv_sec);
-    }
-=20
-    if (cache->size_list_size) {
---=20
-2.34.1
-
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-E=
LF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-mak=
e-TLS-ELF-optional.patch
index 35ab8d5a72..af11baee86 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opti=
onal.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opti=
onal.patch
@@ -1,4 +1,4 @@
-From 8f2f48b41aa17eec3c4d63685e3296f28e60b980 Mon Sep 17 00:00:00 2001
+From bf41fa026ae3d378e62fd83d03a6f5933b52ca04 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -17,36 +17,36 @@ Traceback (most recent call last):
   File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/ru=
ntime/cases/parselogs.py", line 378, in test_parselogs
     self.assertEqual(errcount, 0, msg=3Dself.msg)
 AssertionError: 1 !=3D 0 : Log: /home/pokybuild/yocto-worker/musl-qemux8=
6/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0=
/target_logs/Xorg.0.log
------------------------
-Central error: [    10.477] (EE) Failed to load /usr/lib/xorg/modules/ex=
tensions/libglx.so: Error relocating /usr/lib/libGL.so.1: alphasort: init=
ial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
-***********************
=20
 Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
-
 ---
- meson.build       | 2 +-
+ meson.build       | 7 +++++--
  meson_options.txt | 6 ++++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
+ 2 files changed, 11 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 23618c1..c8cc5e3 100644
+index 70d06c0..1441611 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -476,7 +476,7 @@ endif
- use_elf_tls =3D false
- if (not ['freebsd', 'openbsd', 'haiku'].contains(host_machine.system())=
 and
-     (not with_platform_android or get_option('platform-sdk-version') >=3D=
 29) and
--    (not with_platform_windows or not with_shared_glapi))
-+    (not with_platform_windows or not with_shared_glapi) and get_option=
('elf-tls'))
-   pre_args +=3D '-DUSE_ELF_TLS'
-   use_elf_tls =3D true
+@@ -490,8 +490,11 @@ foreach platform : _platforms
+   pre_args +=3D '-DHAVE_@0@_PLATFORM'.format(platform.to_upper())
+ endforeach
+=20
+-use_elf_tls =3D true
+-pre_args +=3D '-DUSE_ELF_TLS'
++use_elf_tls =3D false
++if get_option('elf-tls')
++  use_elf_tls =3D true
++  pre_args +=3D '-DUSE_ELF_TLS'
++endif
 =20
+ if with_platform_android and get_option('platform-sdk-version') >=3D 29
+   # By default the NDK compiler, at least, emits emutls references inst=
ead of
 diff --git a/meson_options.txt b/meson_options.txt
-index 29c402c..f70d9b2 100644
+index 1f6ef38..99cc5cb 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -455,6 +455,12 @@ option(
+@@ -440,6 +440,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
@@ -56,6 +56,6 @@ index 29c402c..f70d9b2 100644
 +  value : true,
 +  description : 'Enable TLS support in ELF',
 +)
- option(
-   'prefer-iris',
-   type : 'boolean',
+ option('egl-lib-suffix',
+   type : 'string',
+   value : '',
diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb b/meta/recipes-=
graphics/mesa/mesa-gl_21.3.7.bb
deleted file mode 100644
index 142bb743b1..0000000000
--- a/meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require mesa.inc
-
-SUMMARY +=3D " (OpenGL only, no EGL/GLES)"
-
-PROVIDES =3D "virtual/libgl virtual/mesa"
-
-S =3D "${WORKDIR}/mesa-${PV}"
-
-# At least one DRI rendering engine is required to build mesa.
-# When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??=3D "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'x11', 'osmesa gallium', d)}"
-PACKAGECONFIG:class-target =3D "opengl dri ${@bb.utils.contains('DISTRO_=
FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
-
-# 21.0.0 version fails to build when any driver is enabled in DRIDRIVERS
-# ./mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building =
dri drivers require at least one windowing system
-DRIDRIVERS ?=3D ""
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb b/meta/recipes-=
graphics/mesa/mesa-gl_22.0.0.bb
new file mode 100644
index 0000000000..f2bc8f6b5b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb
@@ -0,0 +1,13 @@
+require mesa.inc
+
+SUMMARY +=3D " (OpenGL only, no EGL/GLES)"
+
+PROVIDES =3D "virtual/libgl virtual/mesa"
+
+S =3D "${WORKDIR}/mesa-${PV}"
+
+# At least one DRI rendering engine is required to build mesa.
+# When no X11 is available, use osmesa for the rendering engine.
+PACKAGECONFIG ??=3D "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', 'x11', 'osmesa gallium', d)}"
+PACKAGECONFIG:class-target =3D "opengl ${@bb.utils.contains('DISTRO_FEAT=
URES', 'x11', 'x11', 'osmesa gallium', d)}"
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 2f79e8b34d..503a7efba5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE =3D "http://mesa3d.org"
 BUGTRACKER =3D "https://bugs.freedesktop.org"
 SECTION =3D "x11"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D17a4ea65de7a9ab42437=
f3131e616a7f"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D9a383ee9f65a4e939d66=
30e9b067ff58"
=20
 PE =3D "2"
=20
@@ -20,10 +20,9 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
-           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.pat=
ch \
            "
=20
-SRC_URI[sha256sum] =3D "b4fa9db7aa61bf209ef0b40bef83080999d86ad98df8b8b4=
fada7c128a1efc3d"
+SRC_URI[sha256sum] =3D "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711=
a647979987601250"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -84,7 +83,7 @@ def strip_comma(s):
     return s.strip(',')
=20
 PACKAGECONFIG:class-target ??=3D "${@bb.utils.filter('DISTRO_FEATURES', =
'wayland vulkan', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl egl gles gbm dri gallium virgl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl egl gles gbm gallium virgl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',=
 'dri3', '', d)} \
                    elf-tls \
@@ -94,7 +93,7 @@ PACKAGECONFIG:class-nativesdk ?=3D "gbm gallium egl ope=
ngl elf-tls x11"
=20
 PACKAGECONFIG:remove:libc-musl =3D "elf-tls"
=20
-# "gbm" requires "dri", "opengl"
+# "gbm" requires "opengl"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
=20
 X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr"
@@ -104,8 +103,6 @@ PACKAGECONFIG[elf-tls] =3D "-Delf-tls=3Dtrue, -Delf-t=
ls=3Dfalse"
 PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Ddisab=
led,libxvmc"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
-# "dri" requires "opengl"
-PACKAGECONFIG[dri] =3D "-Ddri-drivers=3D${@strip_comma('${DRIDRIVERS}')}=
, -Ddri-drivers=3D'', xorgproto libdrm"
 PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgproto =
libxshmfence"
=20
 # Vulkan drivers need dri3 enabled
@@ -122,7 +119,7 @@ PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3D=
false"
 # "gles" requires "opengl"
 PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled, -Dgles1=3D=
disabled -Dgles2=3Ddisabled"
=20
-# "egl" requires "dri", "opengl"
+# "egl" requires "opengl"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
=20
 PACKAGECONFIG[broadcom] =3D ""
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.7.bb b/meta/recipes-gra=
phics/mesa/mesa_21.3.7.bb
deleted file mode 100644
index 4cb7e80eb5..0000000000
--- a/meta/recipes-graphics/mesa/mesa_21.3.7.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require ${BPN}.inc
-DRIDRIVERS ??=3D ""
-DRIDRIVERS:append:x86:class-target =3D ",r100,r200,nouveau,i965"
-DRIDRIVERS:append:x86-64:class-target =3D ",r100,r200,nouveau,i965"
-
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.0.bb b/meta/recipes-gra=
phics/mesa/mesa_22.0.0.bb
new file mode 100644
index 0000000000..96e8aa38d6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_22.0.0.bb
@@ -0,0 +1,2 @@
+require ${BPN}.inc
+
--=20
2.25.1


