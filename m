Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34C1C624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:19:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14.1788283175130962253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=t6E+kxk9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2DB31756
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:19:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A0643F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788283174; bh=A0CK7GR2VJIzttSySuunDFDsMuhoKfGmQv5cfQBDsLo=;
	h=From:To:Subject:Date:From;
	b=t6E+kxk9XYs8zduH3KUIF/N8MfPy46Fo3fQo5zMldFeV75JmQo9C+CyNTK409zIy/
	 RiodN9Sz5QQhd0iXbPyEQptiFrpYKNWag8/KeQqonJrA2xG8UbMcHv8V5QUKPs91/E
	 xPCeOj7VvetzGR6EViv55CeG9beJTPn40qqjglfU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libical: refresh build path removal
Date: Tue,  1 Sep 2026 18:19:31 +0100
Message-ID: <20260901171931.2580614-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244839

Change a do_install:append sed expression into a patch that has been
submitted upstream.

Add a link to the relevant upstream bug for the ical-glib-src-generator
removal.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libical/libical/icu-flags.patch           | 35 +++++++++++++++++++
 meta/recipes-support/libical/libical_4.0.5.bb |  7 ++--
 2 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/icu-flags.patch

diff --git a/meta/recipes-support/libical/libical/icu-flags.patch b/meta/=
recipes-support/libical/libical/icu-flags.patch
new file mode 100644
index 00000000000..bbe7977f741
--- /dev/null
+++ b/meta/recipes-support/libical/libical/icu-flags.patch
@@ -0,0 +1,35 @@
+From febd94a4aa1968396959be44909ce580312f8930 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 1 Sep 2026 16:25:18 +0100
+Subject: [PATCH] libical: mark ICU linkage as private
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
+Upstream-Status: Submitted [https://github.com/libical/libical/pull/1366=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/libical/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
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
diff --git a/meta/recipes-support/libical/libical_4.0.5.bb b/meta/recipes=
-support/libical/libical_4.0.5.bb
index 8ec656edd21..4760772a02c 100644
--- a/meta/recipes-support/libical/libical_4.0.5.bb
+++ b/meta/recipes-support/libical/libical_4.0.5.bb
@@ -12,6 +12,7 @@ SECTION =3D "libs"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://flags.patch \
+           file://icu-flags.patch \
            "
 SRC_URI[sha256sum] =3D "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b896=
5102581401e67c9c"
=20
@@ -43,12 +44,8 @@ EXTRA_OECMAKE +=3D "-DLIBICAL_JAVA_BINDINGS=3DFalse"
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


