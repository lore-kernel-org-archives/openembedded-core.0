Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E574C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 17:46:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.14648.1639417565046573132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 178CE6D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:46:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30313F73B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:46:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libical: upgrade to 3.0.12
Date: Mon, 13 Dec 2021 17:46:01 +0000
Message-Id: <20211213174601.643090-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 17:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159657

Disable tests to save some build time as we can't install them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libical/{libical_3.0.11.bb =3D> libical_3.0.12.bb} | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.11.bb =3D> libical_3.0.=
12.bb} (83%)

diff --git a/meta/recipes-support/libical/libical_3.0.11.bb b/meta/recipe=
s-support/libical/libical_3.0.12.bb
similarity index 83%
rename from meta/recipes-support/libical/libical_3.0.11.bb
rename to meta/recipes-support/libical/libical_3.0.12.bb
index b16081e9e28..b2b2211b9b4 100644
--- a/meta/recipes-support/libical/libical_3.0.11.bb
+++ b/meta/recipes-support/libical/libical_3.0.12.bb
@@ -12,14 +12,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1910a2a76d=
df6a9ba369182494170d87 \
                     "
 SECTION =3D "libs"
=20
-SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BP}.tar.gz \
-"
-SRC_URI[sha256sum] =3D "1e6c5e10c5a48f7a40c68958055f0e2759d9ab3563aca172=
73fe35a5df7dbbf1"
+SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/$=
{BP}.tar.gz"
+SRC_URI[sha256sum] =3D "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e=
9f8856cee6d35830"
 UPSTREAM_CHECK_URI =3D "https://github.com/libical/libical/releases"
=20
 inherit cmake pkgconfig
=20
-DEPENDS:append:class-target =3D " libical-native"
+DEPENDS +=3D "libical-native"
=20
 PACKAGECONFIG ??=3D "icu glib"
 PACKAGECONFIG[bdb] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=3DTrue,db"
@@ -29,13 +28,16 @@ PACKAGECONFIG[icu] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE=
_ICU=3DTrue,icu"
=20
 # No need to use perl-native, the host perl is sufficient.
 EXTRA_OECMAKE +=3D "-DPERL_EXECUTABLE=3D${HOSTTOOLS_DIR}/perl"
+# Disable the test suite as we can't install it
+EXTRA_OECMAKE +=3D "-DLIBICAL_BUILD_TESTING=3Dfalse"
 # doc build fails with linker error (??) for libical-glib so disable it
 EXTRA_OECMAKE +=3D "-DICAL_BUILD_DOCS=3Dfalse"
=20
+# Tell the cross-libical where the tool it needs to build is
 EXTRA_OECMAKE:append:class-target =3D " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=
=3D${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
=20
 do_install:append () {
-    # Remove build host references
+    # Remove build host references (https://github.com/libical/libical/i=
ssues/532)
     sed -i \
        -e 's,${STAGING_LIBDIR},${libdir},g' \
        -e 's,${STAGING_INCDIR},${includedir},g' \
--=20
2.25.1


