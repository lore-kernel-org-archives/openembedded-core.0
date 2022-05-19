Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DEBC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:43:37 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.4508.1652942610947179060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 23:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 1EC145565
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:43:29 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.174.3]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nrZsd-1Vrj4k0; Thu, 19 May 2022 08:43:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][RFC PATCH 2/2] libsdl2: rework and cleanup
Date: Thu, 19 May 2022 08:43:12 +0200
Message-Id: <20220519064312.391164-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519064312.391164-1-f_l_k@t-online.de>
References: <20220519064312.391164-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652942607-0000AD4E-8ED9F5E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 86aa04a5-02c2-433d-9a35-036d7c68781f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 06:43:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165866

- add libusb dependency because libsdl2 is looking for it
- remove xvm and xinerama since support has been dropped in sdl code
- allow native build for libxkbcommon and xkeyboard-config to allow
  alignment of native/target build
- align native and target build
- add PACKAGECONFIG options for pipewire and libdecor

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 17 ++++++++---------
 .../xorg-lib/libxkbcommon_1.4.0.bb              |  2 ++
 .../xorg-lib/xkeyboard-config_2.35.1.bb         |  2 ++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.22.bb
index 7678319770..a6550c3175 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -21,6 +21,8 @@ LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PAC=
KAGECONFIG', 'arm-neon', 'f
=20
 PROVIDES =3D "virtual/libsdl2"
=20
+DEPENDS =3D "libusb"
+
 SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://0001-video-restore-ability-to-disable-fb-accel-via-hin=
t.patch \
            "
@@ -43,9 +45,7 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -DSD=
L_ARTS=3DOFF \
                  -DSDL_PTHREADS=3DON \
                  -DSDL_RPATH=3DOFF \
                  -DSDL_SNDIO=3DOFF \
-                 -DSDL_X11_XVM=3DOFF \
                  -DSDL_X11_XCURSOR=3DOFF \
-                 -DSDL_X11_XINERAMA=3DOFF \
                  -DSDL_X11_XDBE=3DOFF \
                  -DSDL_X11_XFIXES=3DOFF \
                  -DSDL_X11_XINPUT=3DOFF \
@@ -55,24 +55,23 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -D=
SDL_ARTS=3DOFF \
 "
=20
 # opengl packageconfig factored out to make it easy for distros
-# and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d=
)}"
+# and BSP layers to pick either (desktop) opengl, gles, or no GL
+PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl gle=
s', d)}"
=20
-PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
-PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??=3D " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11'=
, d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio pipe=
wire x11 wayland', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
 PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
 PACKAGECONFIG[arm-neon]   =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF"
 PACKAGECONFIG[directfb]   =3D "-DSDL_DIRECTFB=3DON,-DSDL_DIRECTFB=3DOFF,=
directfb,directfb"
-PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
+PACKAGECONFIG[gles]       =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
 PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
 PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
+PACKAGECONFIG[libdecor]   =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND=
_LIBDECOR=3DOFF,libdecor,libdecor"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
+PACKAGECONFIG[pipewire]   =3D "-DSDL_PIPEWIRE=3DON,-DSDL_PIPEWIRE=3DOFF,=
pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11 libxext libxrandr libxrender"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
index 34652e9c4e..9840b0797b 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
@@ -34,3 +34,5 @@ python populate_packages:prepend () {
 # Fix a following runtime error:
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
 RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx=
11-locale', 'libx11-compose-data', d)}"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb b/=
meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
index 5215131e3e..46c73879e6 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
@@ -28,3 +28,5 @@ do_install:append () {
     install -d ${D}${datadir}/X11/xkb/compiled
     cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


