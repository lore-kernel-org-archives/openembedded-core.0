Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03E0EF5872
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:48:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19627.1771249724851468041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E1A11570
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:48:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2EE4A3F632
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:48:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/7] cmake: consolidate CMAKE_USE_SYSTEM_LIBRARIES
Date: Mon, 16 Feb 2026 13:48:32 +0000
Message-ID: <20260216134835.717366-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216134835.717366-1-ross.burton@arm.com>
References: <20260216134835.717366-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231206

Move CMAKE_USE_SYSTEM_LIBRARIES=3D1 to cmake.inc so that all builds use
system libraries unless told otherwise.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cmake/cmake-native_4.2.3.bb | 1 -
 meta/recipes-devtools/cmake/cmake.inc             | 2 ++
 meta/recipes-devtools/cmake/cmake_4.2.3.bb        | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb b/meta/rec=
ipes-devtools/cmake/cmake-native_4.2.3.bb
index 299cb4d1ea6..0845be49e57 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
@@ -25,7 +25,6 @@ do_configure[cleandirs] =3D "${B}"
 EXTRA_OECMAKE +=3D "\
     -DCMAKE_LIBRARY_PATH=3D${STAGING_LIBDIR_NATIVE} \
     -DBUILD_CursesDialog=3D1 \
-    -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
index 5b8c1922b18..1b84c785d03 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -24,3 +24,5 @@ SRC_URI[sha256sum] =3D "7efaccde8c5a6b2968bad6ce0fe60e1=
9b6e10701a12fce948c2bf79bac
 UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 CVE_STATUS[CVE-2016-10642] =3D "cpe-incorrect: This is specific to the n=
pm package that installs cmake, so isn't relevant to OpenEmbedded"
+
+EXTRA_OECMAKE +=3D "-DCMAKE_USE_SYSTEM_LIBRARIES=3D1"
\ No newline at end of file
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.3.bb b/meta/recipes-de=
vtools/cmake/cmake_4.2.3.bb
index 233ceeae153..cf559d764a0 100644
--- a/meta/recipes-devtools/cmake/cmake_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.2.3.bb
@@ -35,7 +35,6 @@ python () {
=20
 EXTRA_OECMAKE +=3D " \
     -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
-    -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
--=20
2.43.0


