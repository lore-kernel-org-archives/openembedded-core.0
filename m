Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62A6CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:37:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81674.1778607427034136212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZmhOlMZy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A7B6168F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CD553F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778607426; bh=b5EJ/oVhG+Ud63JHe8R7rvEyeeFZTOhzuvzslbIM7eM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZmhOlMZyEhA8sh+JeZkpxsIf6Q0OOCzdKSL2k+cNUJ8e2W7BKHgHg+RqOaU5LAo5D
	 AmuM6DL8LXgnIz7Tsnf+0dmL2usuWt8Mk4znkQHp/BmFhTkykKwrCKgd2/vgAXB0ZZ
	 nISJ0gmjqdv0aKGI0VscsniKkKnb6XzEJ5b/9cSM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libportal split out gtk libs
Date: Tue, 12 May 2026 18:36:59 +0100
Message-ID: <20260512173702.4114193-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512173702.4114193-1-ross.burton@arm.com>
References: <20260512173702.4114193-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236899

---
 meta/recipes-gnome/libportal/libportal_0.9.1.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.1.bb b/meta/recip=
es-gnome/libportal/libportal_0.9.1.bb
index f4924355f93..be58eeeaea1 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
@@ -9,14 +9,20 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539e=
c061b899bce1d9ce9404"
 SRC_URI =3D "git://github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=
=3Dmain"
 SRCREV =3D "8f5dc8d192f6e31dafe69e35219e3b707bde71ce"
=20
-inherit meson gi-docgen gobject-introspection vala features_check pkgcon=
fig
+inherit meson gi-docgen gobject-introspection vala pkgconfig
 GIDOCGEN_MESON_OPTION =3D 'docs'
=20
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+DEPENDS +=3D "glib-2.0 glib-2.0-native"
=20
-DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', '${GTK3DIST=
ROFEATURES}', 'gtk3', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gt=
k4', '', d)}"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '=
gtk4', '', d)}"
+PACKAGECONFIG[gtk3] =3D "-Dbackend-gtk3=3Denabled,-Dbackend-gtk3=3Ddisab=
led,gtk+3"
 PACKAGECONFIG[gtk4] =3D "-Dbackend-gtk4=3Denabled,-Dbackend-gtk4=3Ddisab=
led,gtk4"
=20
 EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)} -Dbackend-qt5=3Ddisabled"
+
+PACKAGES =3D+ "${PN}-gtk3 ${PN}-gtk4"
+
+FILES:${PN}-gtk3 =3D "${libdir}/libportal-gtk3${SOLIBS} ${libdir}/girepo=
sitory-1.0/*Gtk3-1.0.typelib"
+FILES:${PN}-gtk4 =3D "${libdir}/libportal-gtk4${SOLIBS} ${libdir}/girepo=
sitory-1.0/*Gtk4-1.0.typelib"
--=20
2.43.0


