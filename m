Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA64CD343B
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 15:14:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21206.1778080430735655751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 08:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YmeGrvGA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B984919F6
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2026 08:13:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6B1B3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2026 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778080430; bh=v2UvU/rzdz/b+BFQ5ge1mtk5TAxhbJL81LOdm2BMLBM=;
	h=From:To:Subject:Date:From;
	b=YmeGrvGAa8Lkalsc9jD1m8Aj5I5L0MSeUvukHpUKM8QQD2zYCLk3+4FH8IjR5wO9d
	 F46UadLEWGHFhvb5RnKDR5S0/mJVdOWN97wo4ZXvsvld9VN3wR5unG1DxY23GNIkBx
	 HLzelI9pdA0yQHmGtBkNTV/8SAYDm0ToNOCLkKE4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] harfbuzz: improve packaging
Date: Wed,  6 May 2026 16:13:44 +0100
Message-ID: <20260506151345.1389998-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236541

Harfbuzz is a core library that has minimal dependencies
(libharfbuzz.so) and a number of auxiliary libraries that perform
specific functions, such as libharfbuzz-subset (generate font subsets)
and libharfbuzz-cairo (Cairo rendering).

Add a missing PACKAGECONFIG for the GObject option and organise the list
of options into logical groups to reflect what they do.

As the number of auxiliary libraries is growing, stop doing the library
packaging by hand and instead simply use do_split_packages to pull every
auxiliary library into its own package.  This removes the cairo and
libgobject dependencies from the main package as they're now in separate
packages.

Stop packaging the headers and library symlinks into separate packages
and put them all into harfbuzz-dev. This ensures that if the dev headers
are requested, they are all installed.

Update the homepage and bugtracker links to reflect the current URLs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../harfbuzz/harfbuzz_12.3.2.bb               | 33 ++++++++++---------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
index 6ce275acb59..95aa5ea531c 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Text shaping library"
 DESCRIPTION =3D "HarfBuzz is an OpenType text shaping engine."
-HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/HarfBuzz"
-BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3DHar=
fBuzz"
+HOMEPAGE =3D "https://harfbuzz.github.io"
+BUGTRACKER =3D "https://github.com/harfbuzz/harfbuzz"
 SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a67cfef01e99e48=
93d \
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3=
c2a67cfef01e99e4893d \
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "6f6db164359a2da5a84ef826615b448b33e6306067ad829d=
85d5b0bf936f1bb8"
=20
-DEPENDS +=3D "glib-2.0-native"
-
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github=
-releases
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
@@ -25,17 +23,20 @@ FULL_OPTIMIZATION =3D "-Os ${DEBUG_LEVELFLAG}"
=20
 EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
=20
-PACKAGECONFIG ??=3D "cairo freetype glib icu"
+PACKAGECONFIG ??=3D "cairo gobject glib icu freetype"
+
+# Optional harfbuzz libraries
 PACKAGECONFIG[cairo] =3D "-Dcairo=3Denabled,-Dcairo=3Ddisabled,cairo"
-PACKAGECONFIG[chafa] =3D "-Dchafa=3Denabled,-Dchafa=3Ddisabled,chafa"
-PACKAGECONFIG[freetype] =3D "-Dfreetype=3Denabled,-Dfreetype=3Ddisabled,=
freetype"
+PACKAGECONFIG[gobject] =3D "-Dgobject=3Denabled,-Dgobject=3Ddisabled,gli=
b-2.0-native glib-2.0"
+
+# Unicode providers
 PACKAGECONFIG[glib] =3D "-Dglib=3Denabled,-Dglib=3Ddisabled,glib-2.0"
-PACKAGECONFIG[graphite] =3D "-Dgraphite2=3Denabled,-Dgraphite2=3Ddisable=
d,graphite2"
 PACKAGECONFIG[icu] =3D "-Dicu=3Denabled,-Dicu=3Ddisabled,icu"
=20
-PACKAGES =3D+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
-
-LEAD_SONAME =3D "libharfbuzz.so"
+# Optional dependencies
+PACKAGECONFIG[chafa] =3D "-Dchafa=3Denabled,-Dchafa=3Ddisabled,chafa"
+PACKAGECONFIG[freetype] =3D "-Dfreetype=3Denabled,-Dfreetype=3Ddisabled,=
freetype"
+PACKAGECONFIG[graphite] =3D "-Dgraphite2=3Denabled,-Dgraphite2=3Ddisable=
d,graphite2"
=20
 do_install:append() {
     # If no tools are installed due to PACKAGECONFIG then this directory=
 might
@@ -43,11 +44,11 @@ do_install:append() {
     [ ! -d ${D}${bindir} ] || rmdir --ignore-fail-on-non-empty ${D}${bin=
dir}
 }
=20
-FILES:${PN}-icu =3D "${libdir}/libharfbuzz-icu.so.*"
-FILES:${PN}-icu-dev =3D "${libdir}/libharfbuzz-icu.so \
-                       ${libdir}/pkgconfig/harfbuzz-icu.pc \
-"
-FILES:${PN}-subset =3D "${libdir}/libharfbuzz-subset.so.*"
+python populate_packages:prepend () {
+    do_split_packages(d, '${libdir}', r'^libharfbuzz-(.+)\.so\..*$', '${=
PN}-%s', 'HarfBuzz %s library', allow_links=3DTrue, prepend=3DTrue)
+}
+
+PACKAGES_DYNAMIC =3D "^${PN}-.*"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.43.0


