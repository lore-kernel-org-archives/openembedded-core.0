Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3420ACD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:14:20 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web10.32443.1711955650768954585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 00:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=eZekLeRn;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from behemoth.fritz.box (p200300e27f09d20007db403ffb5b1e18.dip0.t-ipconnect.de [IPv6:2003:e2:7f09:d200:7db:403f:fb5b:1e18])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id D4E9D33F5E9;
	Mon,  1 Apr 2024 08:14:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1711955649; bh=LYLTDnsz+RKChdK2dTaUVcrQBXqJIUifAOcpHbi3kHw=;
	h=From:To:Cc:Subject:Date:From;
	b=eZekLeRnmZmh9jwICukK1y+uVr7cdVn/ZRIhuVHsW1bjWDhvpFd5URSlKGveyXsBV
	 UrYpmGJkWq8f7DHASerfGT5FQtby4dBfmgHVjWvaEzVw/GiZQCEHjpVfLJitKDr+iu
	 K7pnZ7BVJC7+BJb5Wt6CUgdazpurkmOfvuIAFwoY7UxvcRaz+hivdHkO7b2xswEEeM
	 9iLMjagGZV2mDHSCp/NzREsc+jetQHMlc4EORg0GpHSbkQUyiUW1sRZu9Hd3XpTjhB
	 zo7XRMUtEsE82Xopdfs89GAOF/Y93JI1eu6kvNc09IWj3+Jbj2dh+1JE1KRlJSkqwG
	 mWIUQhBTn898Q==
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Subject: [PATCH v2] gstreamer1.0-plugins-good: Provide Qt6 option for qmlgl
Date: Mon,  1 Apr 2024 09:13:55 +0200
Message-Id: <20240401071355.1702280-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 07:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197673

Introduce PACKAGECONFIG option for Qt6 and provide meson cross-build
file that helps meson to locate qt native binaries.

Qt provides pkg-config files since Qt6.3+, but those files are not
sufficient to detect native tools that are located in the
recipe-sysroot-native location, because pkg-config does not know about
the location of them. Thus, introduce a helper config that points mesons
to those binaries.

Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
---
 .../gstreamer1.0-plugins-good_1.22.11.bb       | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.22.11.bb
index edd8609b7c..3b95bd6e46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11=
.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11=
.bb
@@ -12,6 +12,17 @@ SRC_URI[sha256sum] =3D "6ddd032381827d31820540735f0004=
b429436b0bdac19aaeab44fa22fa
=20
 S =3D "${WORKDIR}/gst-plugins-good-${PV}"
=20
+do_write_config:append() {
+    cat >${WORKDIR}/meson-qt6.cross <<EOF
+[binaries]
+qmake =3D '${STAGING_BINDIR_NATIVE}/qmake'
+moc =3D '${STAGING_DIR_NATIVE}/usr/libexec/moc'
+rcc =3D '${STAGING_DIR_NATIVE}/usr/libexec/rcc'
+uic =3D '${STAGING_DIR_NATIVE}/usr/libexec/uic'
+lrelease =3D '${STAGING_BINDIR_NATIVE}/lrelease'
+EOF
+}
+
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
                     file://gst/replaygain/rganalysis.c;beginline=3D1;end=
line=3D23;md5=3Db60ebefd5b2f5a8e0cab6bfee391a5fe"
@@ -35,7 +46,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libxfix=
es libxdamage"
 X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabled -Dxi=
magesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
 X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisabled -=
Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
=20
-QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland"=
, "qtwayland", "", d)}"
+QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland",=
 "qtwayland", "", d)}"
=20
 PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm-nat=
ive"
 PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip2"
@@ -52,7 +63,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dpng=3D=
disabled,libpng"
 PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4l2=3D=
disabled,v4l-utils"
 PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mp=
g123"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
-PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
+PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
+PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,qtbase q=
tdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
 PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,spee=
x"
@@ -78,4 +90,6 @@ EXTRA_OEMESON +=3D " \
     -Dwaveform=3Ddisabled \
 "
=20
+MESON_CROSS_FILE:class-target:append =3D "${@bb.utils.contains('PACKAGEC=
ONFIG', 'qt6', ' --cross ${WORKDIR}/meson-qt6.cross', '', d)}"
+
 FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*.prs"
--=20
2.40.1


