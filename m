Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44041E7C4DC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:09:25 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web10.22921.1696435758994361275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=LczY2JqJ;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from behemoth.fritz.box (p200300e27f452f00ef8008d29b6d07c4.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:ef80:8d2:9b6d:7c4])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id CE4F932CCC6;
	Wed,  4 Oct 2023 17:09:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696435756; bh=Ywm+Rtk4YfWcbnAuhDUWWzZi7A9YCfuXH40b03tZh7k=;
	h=From:To:Cc:Subject:Date:From;
	b=LczY2JqJJ7vKitDtE63+w87ivBKoTt48itE1b2Eg1imK8ie2FvSUJhmohkezQa3VN
	 lKG3vmD0825/6ESgq4N6a+wsbqWpy+RisSphqcM2Y1PBTSoL60m6PsDXq0PEhoaPTk
	 tW/g9nno8wshq2GeVqARKbSvky7oMLZBYC41PkbcCbxBtIL89BUKK3o0jUDBGLylvu
	 x5QQHYGEPtvQ+vRZTXNZrND9oIh+nKYFSq/KKTdaAPj8UhtHutJY8W4hiKV/5Z15+t
	 2AtE0fUbXYqGHrewS8L5MAQE7CY3iwKIbHIkCuCVS3GS4O/x7vOn85Vqh3KxRxaglt
	 6zIOY8FTKt7iw==
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Subject: [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option for qmlgl
Date: Wed,  4 Oct 2023 18:09:11 +0200
Message-Id: <20231004160911.3030063-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 16:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188689

Gstreamer release 1.22.0 introduced option for Qt6 API.

Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.22.5.bb
index 93f0e76ee9..ca1e1d6046 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.=
bb
@@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libxfix=
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
@@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dpng=3D=
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
@@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
 "
=20
 FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*.prs"
+
+do_configure:prepend() {
+    # provide path to qtwaylandscanner
+    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
+}
--=20
2.39.2


