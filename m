Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A77C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 16:35:43 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web08.23597.1639240542138820808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 08:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 69DFA126F
	for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 17:35:40 +0100 (CET)
Received: from localhost.localdomain ([84.163.37.8]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mw5LY-2dERzF0; Sat, 11 Dec 2021 17:35:40 +0100
From: MarkusVolk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [OE-core] [PATCH] libva: move PACKAGECONFIG options to libva.inc
Date: Sat, 11 Dec 2021 17:35:21 +0100
Message-Id: <20211211163521.2647454-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639240540-00001454-305617D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 8cf7f406-dd3f-4649-b4aa-34b9e091fc28
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 16:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159571

This fixes an error in libva-initial build if 'systemd' is in DISTRO_FEAT=
URES
and libdrm is set to be built with udev support.

| Run-time dependency xfixes found: NO (tried pkgconfig and cmake)
| Run-time dependency wayland-client found: YES 1.19.0
| Program wayland-scanner /usr/bin/wayland-scanner found: NO
|
| ../libva-2.13.0/meson.build:107:4: ERROR: Program 'wayland-scanner /usr=
/bin/wayland-scanner' not found
|
| A full log can be found at /home/flk/build/poky/build-rock/tmp/work/cor=
texa72-cortexa53-crypto-poky-linux/libva-initial/2.13.0-r0/build/meson-lo=
gs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.
---
 meta/recipes-graphics/libva/libva-initial_2.13.0.bb | 3 +++
 meta/recipes-graphics/libva/libva.inc               | 6 ++++++
 meta/recipes-graphics/libva/libva_2.13.0.bb         | 5 -----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.13.0.bb b/meta/r=
ecipes-graphics/libva/libva-initial_2.13.0.bb
index 4c3045bc65..453096822f 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.13.0.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.13.0.bb
@@ -1,5 +1,8 @@
 require libva.inc
=20
+PACKAGECONFIG ?=3D ""
+
 do_install:append () {
 	rm -f ${D}${libdir}/*.so*
 }
+
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphic=
s/libva/libva.inc
index bcf9757c1a..dcdc1f378c 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -27,3 +27,9 @@ UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/=
releases"
 DEPENDS =3D "libdrm"
=20
 inherit meson pkgconfig
+
+PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11 =
libxext libxfixes"
+PACKAGECONFIG[glx] =3D "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa"
+
+PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native wayland"
+
diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb b/meta/recipes-g=
raphics/libva/libva_2.13.0.bb
index ed2be289fc..63dc5af8f2 100644
--- a/meta/recipes-graphics/libva/libva_2.13.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
@@ -5,11 +5,6 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
 "
=20
-PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11 =
libxext libxfixes"
-PACKAGECONFIG[glx] =3D "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa"
-
-PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native wayland"
-
 PACKAGES =3D+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
=20
 RDEPENDS:${PN}-x11 =3D+ "${PN}"
--=20
2.25.1


