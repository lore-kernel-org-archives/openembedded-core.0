Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEA3C79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 17:01:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3022.1788541293506754841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 10:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=B1ePJOxC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EC11153B
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 10:01:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F45C3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788541292; bh=FLafMCS9fUF/kkomK9DYOPJcqdKIGTUi8uAEWEqlU0k=;
	h=From:To:Subject:Date:From;
	b=B1ePJOxCWEj7ST4iE3usHeF86B4GnJ0x33uYRr6MM9zDq0Em80AiNonU8GPEbvglR
	 IN2EP7i1jVF6Cy43GY1NBLMPQkAZek5EazYDB3u4Y5A+Ig6HikWvxs9mHGlI+VJyKJ
	 DZ0jW3Aps5zEpZ2d64cWZBZXNhK8mEMEeljGVz3o=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libical: refresh build path removal
Date: Fri,  4 Sep 2026 18:01:28 +0100
Message-ID: <20260904170128.2665899-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 17:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245126

Fixes have been merged upstream, so replace our patch and a sed with an
upstreamed patch that will be in libical 4.0.6.

Add a link to the relevant upstream bug for the ical-glib-src-generator
removal.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...001-Mark-ICU-as-private-linkage-1366.patch | 76 +++++++++++++++++++
 .../libical/libical/flags.patch               | 38 ----------
 meta/recipes-support/libical/libical_4.0.5.bb |  8 +-
 3 files changed, 78 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/0001-Mark-ICU-as=
-private-linkage-1366.patch
 delete mode 100644 meta/recipes-support/libical/libical/flags.patch

diff --git a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-privat=
e-linkage-1366.patch b/meta/recipes-support/libical/libical/0001-Mark-ICU=
-as-private-linkage-1366.patch
new file mode 100644
index 00000000000..53bd1683af2
--- /dev/null
+++ b/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linka=
ge-1366.patch
@@ -0,0 +1,76 @@
+From 13642054f650795446f6020d9d2e14d147b8da51 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross@burtonini.com>
+Date: Wed, 2 Sep 2026 16:14:44 +0100
+Subject: [PATCH] Mark ICU as private linkage (#1366)
+
+* libical-glib: Hide some target options in the installed CMake files
+
+The build paths could be shown in the installed .cmake files, thus
+hide them from there, because they are not needed.
+
+Closes https://github.com/libical/libical/issues/532
+
+* libical: mark ICU linkage as private
+
+There's no need to expose the ICU linkage publically as the .so will
+pull this in itself.
+
+This has a side-effect of removing build/sysroot paths from the installe=
d
+.cmake files.
+
+Closes #532.
+
+---------
+
+Co-authored-by: Milan Crha <mcrha@redhat.com>
+(cherry picked from commit 38c7e6d31a3a1a4bd67479f402c323fb0679271e)
+
+Upstream-Status: Backport [libical 13642054f650795446f6020d9d2e14d147b8d=
a51]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/libical-glib/CMakeLists.txt | 9 +++++----
+ src/libical/CMakeLists.txt      | 2 +-
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLis=
ts.txt
+index d63bbf3c..470a4d22 100644
+--- a/src/libical-glib/CMakeLists.txt
++++ b/src/libical-glib/CMakeLists.txt
+@@ -24,16 +24,17 @@ if(NOT DEFINED LIBXML2_DEFINITIONS)
+ endif()
+ target_compile_options(
+   ical-glib-src-generator
+-  PUBLIC
++  PRIVATE
+     ${GLIB_CFLAGS}
+     ${LIBXML2_DEFINITIONS}
+     -DG_LOG_DOMAIN=3D\"src-generator\"
+ )
+ target_link_libraries(
+   ical-glib-src-generator
+-  ${GLIB_LDFLAGS}
+-  ${GOBJECT_LDFLAGS}
+-  ${LIBXML2_LIBRARIES}
++  PRIVATE
++    ${GLIB_LDFLAGS}
++    ${GOBJECT_LDFLAGS}
++    ${LIBXML2_LIBRARIES}
+ )
+=20
+ install(
+diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
+index 6fc2e953..583f2eeb 100644
+--- a/src/libical/CMakeLists.txt
++++ b/src/libical/CMakeLists.txt
+@@ -294,7 +294,7 @@ if(DEFINED CMAKE_THREAD_LIBS_INIT)
+   target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
+ endif()
+ if(ICU_FOUND)
+-  target_link_libraries(ical ${ICU_LIBRARIES})
++  target_link_libraries(ical PRIVATE ${ICU_LIBRARIES})
+   if(VCPKG_MANIFEST_MODE)
+     if(NOT APPLE AND NOT WIN32)
+       target_link_libraries(ical "m;stdc++")
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libical/libical/flags.patch b/meta/reci=
pes-support/libical/libical/flags.patch
deleted file mode 100644
index 868314591c3..00000000000
--- a/meta/recipes-support/libical/libical/flags.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From cba8f762f6a3270530550915d957c01f3da9a601 Mon Sep 17 00:00:00 2001
-From: Milan Crha <mcrha@redhat.com>
-Date: Wed, 10 Sep 2025 09:52:37 +0200
-Subject: [PATCH] libical-glib: Hide some target options in the installed=
 CMake
-
- files
-
-The build paths could be shown in the installed .cmake files, thus
-hide them from there, because they are needed.
-
-Closes https://github.com/libical/libical/issues/532
-
-Upstream-Status: Submitted [https://github.com/libical/libical/pull/1010=
]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/libical-glib/CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLis=
ts.txt
-index d63bbf3..d820160 100644
---- a/src/libical-glib/CMakeLists.txt
-+++ b/src/libical-glib/CMakeLists.txt
-@@ -24,13 +24,14 @@ if(NOT DEFINED LIBXML2_DEFINITIONS)
- endif()
- target_compile_options(
-   ical-glib-src-generator
--  PUBLIC
-+  PRIVATE
-     ${GLIB_CFLAGS}
-     ${LIBXML2_DEFINITIONS}
-     -DG_LOG_DOMAIN=3D\"src-generator\"
- )
- target_link_libraries(
-   ical-glib-src-generator
-+  PRIVATE
-   ${GLIB_LDFLAGS}
-   ${GOBJECT_LDFLAGS}
-   ${LIBXML2_LIBRARIES}
diff --git a/meta/recipes-support/libical/libical_4.0.5.bb b/meta/recipes=
-support/libical/libical_4.0.5.bb
index 8ec656edd21..952e2c60540 100644
--- a/meta/recipes-support/libical/libical_4.0.5.bb
+++ b/meta/recipes-support/libical/libical_4.0.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6d929449=
3d031c817783b0400a126c89 \
 SECTION =3D "libs"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://flags.patch \
+           file://0001-Mark-ICU-as-private-linkage-1366.patch \
            "
 SRC_URI[sha256sum] =3D "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b896=
5102581401e67c9c"
=20
@@ -43,12 +43,8 @@ EXTRA_OECMAKE +=3D "-DLIBICAL_JAVA_BINDINGS=3DFalse"
 # Tell the cross-libical where the tool it needs to build is
 EXTRA_OECMAKE:append:class-target =3D " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=
=3D${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
=20
-do_install:append () {
-    # Remove build host references (https://github.com/libical/libical/i=
ssues/532)
-    sed -i -e 's,${STAGING_LIBDIR},${libdir},g' ${D}${libdir}/cmake/LibI=
cal/LibIcalTargets.cmake
-}
-
 # This tool is only needed to cross-compile, delete it from the target p=
ackages
+# https://github.com/libical/libical/issues/1365
 do_install:append:class-target() {
     rm -f ${D}${libexecdir}/libical/ical-glib-src-generator
     rm -f ${D}${libdir}/cmake/LibIcal/IcalGlibSrcGenerator*.cmake
--=20
2.43.0


