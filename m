Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C217FD609BB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:10:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26401.1765901407740769859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 08:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1446EFEC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:10:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7F393F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:10:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gdk-pixbuf: small cleanups
Date: Tue, 16 Dec 2025 16:10:00 +0000
Message-ID: <20251216161001.352088-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 16:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227977

Update homepage, as the wiki is mostly dead links.

Optionally build the manpages.

Remove the gdk-pixbuf-xlib package, as this was removed in 2.42[1]

Enable/disable building the tests, not just installing the tests, to
save build time if they're not needed.

Fix some indentation which was using the wrong spacing.

[1] gdk-pixbuf 3362e94c2 ("Remove obsolete Xlib helper library")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index 98993cc07d7..750098ba022 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Image loading library for GTK+"
 DESCRIPTION =3D "The GDK Pixbuf library provides: Image loading and savi=
ng \
 facilities, fast scaling and compositing of pixbufs and Simple animation=
 \
 loading (ie. animated GIFs)"
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/GdkPixbuf"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gdk-pixbuf"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues"
=20
 LICENSE =3D "LGPL-2.1-or-later"
@@ -16,7 +16,7 @@ DEPENDS =3D "glib-2.0 shared-mime-info"
=20
 SRC_URI[archive.sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3a=
c94c95a148cb669ab748e3c7"
=20
-inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-ev=
en gobject-introspection gi-docgen lib_package
+inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-ev=
en gobject-introspection gi-docgen lib_package manpages
=20
 SRC_URI +=3D "\
            file://run-ptest \
@@ -24,7 +24,7 @@ SRC_URI +=3D "\
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-comp=
ile.patch \
            "
=20
-GIR_MESON_OPTION =3D 'introspection'
+GIR_MESON_OPTION =3D "introspection"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
@@ -38,18 +38,12 @@ PACKAGECONFIG[jpeg] =3D "-Djpeg=3Denabled,-Djpeg=3Ddi=
sabled,jpeg"
 PACKAGECONFIG[tiff] =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
 PACKAGECONFIG[gif] =3D "-Dgif=3Denabled,-Dgif=3Ddisabled"
 PACKAGECONFIG[others] =3D "-Dothers=3Denabled,-Dothers=3Ddisabled"
-PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=3Df=
alse"
-
-EXTRA_OEMESON =3D "-Dman=3Dfalse"
-
-PACKAGES =3D+ "${PN}-xlib"
+PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,python3-docutils=
-native"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_tests=3Dtrue,-Dtest=
s=3Dfalse -Dinstalled_tests=3Dfalse"
=20
 # For GIO image type sniffing
 RDEPENDS:${PN} =3D "shared-mime-info"
=20
-FILES:${PN}-xlib =3D "${libdir}/*pixbuf_xlib*${SOLIBS}"
-ALLOW_EMPTY:${PN}-xlib =3D "1"
-
 FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
=20
 FILES:${PN}-bin +=3D "${datadir}/thumbnailers/gdk-pixbuf-thumbnailer.thu=
mbnailer"
@@ -57,7 +51,7 @@ FILES:${PN}-bin +=3D "${datadir}/thumbnailers/gdk-pixbu=
f-thumbnailer.thumbnailer"
 FILES:${PN}-dev +=3D " \
 	${bindir}/gdk-pixbuf-csource \
 	${bindir}/gdk-pixbuf-pixdata \
-        ${bindir}/gdk-pixbuf-print-mime-types \
+	${bindir}/gdk-pixbuf-print-mime-types \
 	${includedir}/* \
 "
=20
@@ -85,9 +79,9 @@ do_install:append() {
 }
=20
 do_install_ptest() {
-        # Remove a bad fuzzing attempt that sporadically fails without a=
 way to reproduce
+	# Remove a bad fuzzing attempt that sporadically fails without a way to=
 reproduce
 	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-randomly-modified.=
test
-        # https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/215
+	# https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/215
 	rm ${D}/${datadir}/installed-tests/gdk-pixbuf/pixbuf-jpeg.test
 }
=20
--=20
2.43.0


