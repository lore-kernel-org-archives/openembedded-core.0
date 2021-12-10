Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FE1C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:02:59 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web12.7444.1639144979063240466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id 542C691E0
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 15:02:57 +0100 (CET)
Received: from localhost.localdomain ([84.163.46.27]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mvgUC-1pEZeb0; Fri, 10 Dec 2021 15:02:56 +0100
From: MarkusVolk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [OE-core] [PATCH] libva: move wayland PACKAGECONFIG to libva.inc
Date: Fri, 10 Dec 2021 15:02:34 +0100
Message-Id: <20211210140234.3713-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1639144976-00001460-3A443717/0/0 CLEAN NORMAL
X-TOI-MSGID: c932fb78-6ec3-4745-bfdc-d72d26125335
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159523

I encountered an error while trying to build libva under wayland. libva-i=
nitial
was missing wayland-native dependency and failed like this:

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

This commit moves the PACKAGECONFIG[wayland] to libva.inc to make it avai=
lable to libva-initial also

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libva/libva.inc       | 7 +++++++
 meta/recipes-graphics/libva/libva_2.13.0.bb | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphic=
s/libva/libva.inc
index bcf9757c1a..0e2721e291 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -27,3 +27,10 @@ UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva=
/releases"
 DEPENDS =3D "libdrm"
=20
 inherit meson pkgconfig
+
+PACKAGECONFIG:append =3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+"
+
+PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native wayland"
+
diff --git a/meta/recipes-graphics/libva/libva_2.13.0.bb b/meta/recipes-g=
raphics/libva/libva_2.13.0.bb
index ed2be289fc..a8c6355b01 100644
--- a/meta/recipes-graphics/libva/libva_2.13.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.13.0.bb
@@ -2,14 +2,12 @@ require libva.inc
=20
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)}=
 \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
 "
=20
 PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes,-Dwith_x11=3Dno,virtual/libx11 =
libxext libxfixes"
 PACKAGECONFIG[glx] =3D "-Dwith_glx=3Dyes,-Dwith_glx=3Dno,virtual/mesa"
=20
-PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native wayland"
-
 PACKAGES =3D+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
=20
 RDEPENDS:${PN}-x11 =3D+ "${PN}"
--=20
2.25.1


