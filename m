Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72.1622564513846049098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 09:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1B83101E
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A9023F719
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] mx: remove from Openembedded Core
Date: Tue,  1 Jun 2021 17:21:41 +0100
Message-Id: <20210601162144.2379642-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

MX is obsolete (last release 2012) and isn't used by anything in any
known layer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../mx/mx-1.0/fix-test-includes.patch         | 20 --------------
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb      | 16 -----------
 meta/recipes-graphics/mx/mx.inc               | 27 -------------------
 3 files changed, 63 deletions(-)
 delete mode 100644 meta/recipes-graphics/mx/mx-1.0/fix-test-includes.pat=
ch
 delete mode 100644 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
 delete mode 100644 meta/recipes-graphics/mx/mx.inc

diff --git a/meta/recipes-graphics/mx/mx-1.0/fix-test-includes.patch b/me=
ta/recipes-graphics/mx/mx-1.0/fix-test-includes.patch
deleted file mode 100644
index 82c93dd604..0000000000
--- a/meta/recipes-graphics/mx/mx-1.0/fix-test-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix missing include directory when building tests
-
-This patch is currently required for all versions of mx
-Upstream-Status: Submitted @ https://github.com/clutter-project/mx/issue=
s/82
-Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
-Index: git/tests/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/tests/Makefile.am	2013-05-08 15:18:56.918596425 +0100
-+++ git/tests/Makefile.am	2013-05-08 15:23:26.864781401 +0100
-@@ -10,7 +10,8 @@
-=20
- INCLUDES =3D \
- 	-I$(top_srcdir) \
--	-I$(top_builddir)
-+	-I$(top_builddir)\
-+	-I$(top_builddir)/mx
-=20
- noinst_PROGRAMS =3D 			\
- 	test-deform-texture		\
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-grap=
hics/mx/mx-1.0_1.4.7.bb
deleted file mode 100644
index 58a6997ffe..0000000000
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require mx.inc
-
-# The 1.4.7 tag does not build against cogl 1.14, pull in a revision wit=
h a fix
-SRCREV =3D "9b1db6b8060bd00b121a692f942404a24ae2960f"
-PV =3D "1.4.7+git${SRCPV}"
-
-# Exclude x.99.x versions from upstream checks
-UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>^\d+(\.(?!99)\d+)+)"
-
-SRC_URI =3D "git://github.com/clutter-project/mx.git;branch=3Dmx-1.4 \
-	   file://fix-test-includes.patch \
-	  "
-S =3D "${WORKDIR}/git"
-
-LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dfbc093901857fcd118f065f90=
0982c24 \
-                    file://mx/mx-widget.c;beginline=3D8;endline=3D20;md5=
=3D13bba3c973a72414a701e1e87b5ee879"
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/m=
x.inc
deleted file mode 100644
index c977849c96..0000000000
--- a/meta/recipes-graphics/mx/mx.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Clutter based UI widget library"
-DESCRIPTION =3D "Mx is a widget toolkit using Clutter that provides a se=
t of standard interface \
-elements, including buttons, progress bars, scroll bars and others. It a=
lso \
-implements some standard  managers. One other interesting feature is the=
 \
-possibility setting style properties from a CSS format file."
-HOMEPAGE =3D "https://github.com/clutter-project/mx"
-BUGTRACKER =3D "https://github.com/clutter-project/mx/issues"
-LICENSE =3D "LGPLv2.1"
-
-inherit clutter autotools features_check gobject-introspection gtk-doc
-# depends on clutter-1.0 which depends on cogl-1.0
-REQUIRED_DISTRO_FEATURES =3D "opengl"
-
-DEPENDS =3D "intltool-native clutter-1.0 dbus-glib gdk-pixbuf"
-
-SRC_URI =3D "http://source.clutter-project.org/sources/mx/${@get_verdir(=
"${PV}")}/mx-${PV}.tar.xz"
-
-EXTRA_OECONF =3D "--disable-gtk-widgets		\
-		--with-dbus			\
-		--with-winsys=3Dnone		\
-		--without-clutter-imcontext	\
-		--without-clutter-gesture	\
-		--without-startup-notification	\
-		--without-glade			\
-	       "
-
-FILES_${PN} +=3D "${datadir}"
--=20
2.25.1

