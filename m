Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FDBC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:26:07 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.19610.1713183964998922571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 05:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id AC985149DD
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 14:26:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.43.130]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwLPO-1tM25Z0; Mon, 15 Apr 2024 14:26:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] xwayland: update 23.2.5 -> 23.2.6
Date: Mon, 15 Apr 2024 14:26:10 +0200
Message-ID: <20240415122610.18887-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713183962-3DAE2D4A-C28FC24E/0/0 CLEAN NORMAL
X-TOI-MSGID: ed0d1acb-848c-4093-bec7-868441362f20
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198237

- add a PACKAGECONFIG for libdecor
- add PACKAGECONFIGS for xwayland_ei to avoid auto select

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xwayland/{xwayland_23.2.5.bb =3D> xwayland_23.2.6.bb}  | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.5.bb =3D> xwayland_=
23.2.6.bb} (80%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_23.2.6.bb
similarity index 80%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
index b934a873d1..f51429bc8c 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
@@ -10,7 +10,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5df87950af51ac2c5822094553ea1=
880"
=20
 SRC_URI =3D "https://www.x.org/archive/individual/xserver/xwayland-${PV}=
.tar.xz"
-SRC_URI[sha256sum] =3D "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f=
526a625ff9f4bd90"
+SRC_URI[sha256sum] =3D "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a2=
6eaf8b20835cfc6d"
=20
 UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
=20
@@ -20,10 +20,11 @@ REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
 DEPENDS +=3D "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayla=
nd-native wayland-protocols libdrm libepoxy libxcvt"
=20
 OPENGL_PKGCONFIGS =3D "glx glamor dri3"
-PACKAGECONFIG ??=3D "${XORG_CRYPTO} \
+PACKAGECONFIG ??=3D "${XORG_CRYPTO} ${XWAYLAND_EI} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${=
OPENGL_PKGCONFIGS}', '', d)} \
 "
 PACKAGECONFIG[dri3] =3D "-Ddri3=3Dtrue,-Ddri3=3Dfalse,libxshmfence"
+PACKAGECONFIG[libdecor] =3D "-Dlibdecor=3Dtrue,-Dlibdecor=3Dfalse,libdec=
or"
 PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue,-Dglx=3Dfalse,virtual/libgl virtual=
/libx11"
 PACKAGECONFIG[glamor] =3D "-Dglamor=3Dtrue,-Dglamor=3Dfalse,libepoxy vir=
tual/libgbm,libegl"
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunw=
ind"
@@ -34,6 +35,10 @@ XORG_CRYPTO ??=3D "openssl"
 PACKAGECONFIG[openssl] =3D "-Dsha1=3Dlibcrypto,,openssl"
 PACKAGECONFIG[nettle] =3D "-Dsha1=3Dlibnettle,,nettle"
 PACKAGECONFIG[gcrypt] =3D "-Dsha1=3Dlibgcrypt,,libgcrypt"
+XWAYLAND_EI ??=3D "xwayland_ei_false"
+PACKAGECONFIG[xwayland_ei_false] =3D "-Dxwayland_ei=3Dfalse"
+PACKAGECONFIG[xwayland_ei_portal] =3D "-Dxwayland_ei=3Dportal,,libei"
+PACKAGECONFIG[xwayland_ei_socket] =3D "-Dxwayland_ei=3Dsocket,,libei"
=20
 do_install:append() {
     # remove files not needed and clashing with xserver-xorg
--=20
2.44.0


