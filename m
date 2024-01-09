Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97606C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:28:50 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.16605.1704806923868722977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout11.t-online.de (Postfix) with SMTP id D6C821C270
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jan 2024 14:28:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.27]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNC9k-0OVpJJ0; Tue, 9 Jan 2024 14:28:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
Date: Tue,  9 Jan 2024 14:28:26 +0100
Message-ID: <20240109132826.2445412-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704806916-0E2D7850-A0EE14F3/0/0 CLEAN NORMAL
X-TOI-MSGID: 177e4c95-8161-4966-92a4-93e08a9037c3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 13:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193456

Besides the improvements that cmake offers compared to autotools,
the advantage would be that cmake config files get created.
This is useful so that other projects can find webp using cmake.

Remove EXTRA_OECONF settings because all of them are set like this
by default.

CMakeLists.txt doesn't provide an option for selecting neon but from
what I have tested it gets selected properly.

Downside is that there is no way to deactivate gif,jpeg,tiff,png or
opengl. The libraries are used whenever they are pulled into the sysroot.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-multimedia/webp/libwebp_1.3.2.bb | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb b/meta/recipes=
-multimedia/webp/libwebp_1.3.2.bb
index 63b0fd9a6c..c6a4b97884 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
@@ -18,40 +18,23 @@ SRC_URI[sha256sum] =3D "2a499607df669e40258e53d0ade80=
35ba4ec0175244869d1025d460562
=20
 UPSTREAM_CHECK_URI =3D "http://downloads.webmproject.org/releases/webp/i=
ndex.html"
=20
-EXTRA_OECONF =3D " \
-    --disable-wic \
-    --enable-libwebpmux \
-    --enable-libwebpdemux \
-    --enable-threading \
-"
+EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
=20
-# Do not trust configure to determine if neon is available.
-#
-EXTRA_OECONF_ARM =3D " \
-    ${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disab=
le-neon",d)} \
-"
-EXTRA_OECONF:append:arm =3D " ${EXTRA_OECONF_ARM}"
-EXTRA_OECONF:append:armeb =3D " ${EXTRA_OECONF_ARM}"
-
-inherit autotools lib_package
-
-PACKAGECONFIG ??=3D ""
-
-# libwebpdecoder is a subset of libwebp, don't build it unless requested
-PACKAGECONFIG[decoder] =3D "--enable-libwebpdecoder,--disable-libwebpdec=
oder"
+inherit cmake lib_package
=20
+PACKAGECONFIG ?=3D ""
 # Apply for examples programs: cwebp and dwebp
-PACKAGECONFIG[gif] =3D "--enable-gif,--disable-gif,giflib"
-PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[png] =3D "--enable-png,--disable-png,,libpng"
-PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
-
+PACKAGECONFIG[gif] =3D ",,giflib"
+PACKAGECONFIG[jpeg] =3D ",,jpeg"
+PACKAGECONFIG[png] =3D ",,libpng"
+PACKAGECONFIG[tiff] =3D ",,tiff"
 # Apply only for example program vwebp
-PACKAGECONFIG[gl] =3D "--enable-gl,--disable-gl,mesa-glut"
+PACKAGECONFIG[opengl] =3D ",,mesa-glut"
=20
 PACKAGES =3D+ "${PN}-gif2webp"
=20
 DESCRIPTION:${PN}-gif2webp =3D "Simple tool to convert animated GIFs to =
WebP"
 FILES:${PN}-gif2webp =3D "${bindir}/gif2webp"
=20
+FILES:${PN} +=3D "${datadir}"
 BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.43.0


