Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0D1CAC583
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:48:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18306.1757512093253913901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735F816F8
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:48:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 607483F63F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:48:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libical: improve buildpath situation
Date: Wed, 10 Sep 2025 14:48:07 +0100
Message-ID: <20250910134807.2366064-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910134807.2366064-1-ross.burton@arm.com>
References: <20250910134807.2366064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223215

Take an upstream patch to remove buildpaths from the generator's CMake
files, so we don't need to sed them out.

Also, the generator tool is only needed when cross-compiling libical,
so we don't actually need to install it in the target package. This has
the nice side-effect of removing libxml2 from the target RDEPENDS as it
is only used in the tool.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libical/libical/flags.patch               | 40 +++++++++++++++++++
 .../recipes-support/libical/libical_3.0.20.bb | 13 +++---
 2 files changed, 48 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/flags.patch

diff --git a/meta/recipes-support/libical/libical/flags.patch b/meta/reci=
pes-support/libical/libical/flags.patch
new file mode 100644
index 00000000000..5fa4b479ee3
--- /dev/null
+++ b/meta/recipes-support/libical/libical/flags.patch
@@ -0,0 +1,40 @@
+From a5642fa1cd8c835209b39ec99e534d341779c985 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Wed, 10 Sep 2025 09:52:37 +0200
+Subject: [PATCH] libical-glib: Hide some target options in the installed=
 CMake
+ files
+
+The build paths could be shown in the installed .cmake files, thus
+hide them from there, because they are needed.
+
+Closes https://github.com/libical/libical/issues/532
+
+Upstream-Status: Submitted [https://github.com/libical/libical/pull/1010=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/libical-glib/CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLis=
ts.txt
+index 9f69e9c5..aa55e013 100644
+--- a/src/libical-glib/CMakeLists.txt
++++ b/src/libical-glib/CMakeLists.txt
+@@ -8,8 +8,8 @@ add_executable(ical-glib-src-generator
+   tools/xml-parser.h
+ )
+
+-target_compile_options(ical-glib-src-generator PUBLIC ${GLIB_CFLAGS} ${=
LIBXML_CFLAGS} -DG_LOG_DOMAIN=3D\"src-generator\")
+-target_link_libraries(ical-glib-src-generator ${GLIB_LIBRARIES} ${LIBXM=
L_LIBRARIES})
++target_compile_options(ical-glib-src-generator PRIVATE ${GLIB_CFLAGS} $=
{LIBXML_CFLAGS} -DG_LOG_DOMAIN=3D\"src-generator\")
++target_link_libraries(ical-glib-src-generator PRIVATE ${GLIB_LIBRARIES}=
 ${LIBXML_LIBRARIES})
+
+ install(
+   TARGETS ical-glib-src-generator
+@@ -130,7 +130,7 @@ target_link_libraries(ical-glib PRIVATE ical ${GLIB_=
LIBRARIES})
+ if(NOT SHARED_ONLY AND NOT STATIC_ONLY)
+   add_library(ical-glib-static STATIC ${LIBICAL_GLIB_SOURCES})
+   add_dependencies(ical-glib-static ical-header)
+-  target_compile_options(ical-glib-static PUBLIC ${GLIB_CFLAGS} -DG_LOG=
_DOMAIN=3D"libical-glib" -DLIBICAL_GLIB_COMPILATION)
++  target_compile_options(ical-glib-static PRIVATE ${GLIB_CFLAGS} -DG_LO=
G_DOMAIN=3D"libical-glib" -DLIBICAL_GLIB_COMPILATION)
+   target_link_libraries(ical-glib-static ${GLIB_LIBRARIES})
+ endif()
diff --git a/meta/recipes-support/libical/libical_3.0.20.bb b/meta/recipe=
s-support/libical/libical_3.0.20.bb
index d62c88e3477..7f85522e91c 100644
--- a/meta/recipes-support/libical/libical_3.0.20.bb
+++ b/meta/recipes-support/libical/libical_3.0.20.bb
@@ -14,6 +14,7 @@ SECTION =3D "libs"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
+           file://flags.patch \
           "
 SRC_URI[sha256sum] =3D "e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca=
0a2c9d5c3510b4c2"
=20
@@ -45,11 +46,13 @@ EXTRA_OECMAKE:append:class-target =3D " -DIMPORT_ICAL=
_GLIB_SRC_GENERATOR=3D${STAGING
=20
 do_install:append () {
     # Remove build host references (https://github.com/libical/libical/i=
ssues/532)
-    sed -i \
-       -e 's,${STAGING_LIBDIR},${libdir},g' \
-       -e 's,${STAGING_INCDIR},${includedir},g' \
-       ${D}${libdir}/cmake/LibIcal/LibIcal*.cmake \
-       ${D}${libdir}/cmake/LibIcal/Ical*.cmake
+    sed -i -e 's,${STAGING_LIBDIR},${libdir},g' ${D}${libdir}/cmake/LibI=
cal/LibIcalTargets.cmake
+}
+
+# This tool is only needed to cross-compile, delete it from the target p=
ackages
+do_install:append:class-target() {
+    rm -f ${D}${libexecdir}/libical/ical-glib-src-generator
+    rm -f ${D}${libdir}/cmake/LibIcal/IcalGlibSrcGenerator*.cmake
 }
=20
 BBCLASSEXTEND =3D "native"
--=20
2.43.0


