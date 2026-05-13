Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDB5CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:36:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7721.1778679363355728490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nW1oL+UE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 771951596
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:35:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C7F83F836
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778679362; bh=1tZ3wrh8ebXrjFbe1Ntcf5is9N1LWzteDgeAfr/sDBg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nW1oL+UE2c1JHt7kAcQZN/YQlsBnJu6yLdi1YifIG5Zy3XKMOkLz/VELgAzPz51Sb
	 j/9m2jgajGiP6pBcenhp9yVhl58IcIvAC5lA6L5aT+b+G89lzShQn5DtAkcIkQXZ+5
	 ihmtO4X2EmnV50VP9b6wb+Nv2o0rtU5loMRpUp8A=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] libportal: split out GTK libraries into sub-packages
Date: Wed, 13 May 2026 14:35:54 +0100
Message-ID: <20260513133557.2951262-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513133557.2951262-1-ross.burton@arm.com>
References: <20260513133557.2951262-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236981

We shouldn't package the bare libportal and the GTK3 and GTK4 libraries
into one package. Instead package the UI libraries into separate
packages, so that dependencies are contained.

Add PACKAGECONFIGs for the gtk3 and gtk3 libraries so that they can be
controlled individually. Keep the existing behaviour of enabling both
GTK 3 and 4 as various recipes use both, but this allows building
libportal without any GTK dependencies if required.

The PACKAGECONFIG logic is "fun": if either of wayland or x11 are
enabled then we can enable GTK+3 by default, and if either of those
_and_ opengl are enabled then we can also do GTK 4.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/libportal/libportal_0.9.1.bb | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.1.bb b/meta/recip=
es-gnome/libportal/libportal_0.9.1.bb
index f4924355f93..59252e2a67b 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
@@ -9,14 +9,22 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539e=
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
+CAN_GTK =3D "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFE=
ATURES}', '1', '0', d)}"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '=
gtk4', '', d)}"
+PACKAGECONFIG ??=3D "${@oe.utils.vartrue('CAN_GTK', 'gtk3', '', d)} \
+                   ${@oe.utils.vartrue('CAN_GTK', '${@bb.utils.contains(=
"DISTRO_FEATURES", "opengl", "gtk4", "", d)}', '', d)}"
+
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


