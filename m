Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCF4E63F3D
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:48:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19626.1771249724762120276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 830EF150C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:48:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8697A3F632
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:48:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/7] cmake: clean up variables shared between .bb and .inc
Date: Mon, 16 Feb 2026 13:48:31 +0000
Message-ID: <20260216134835.717366-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216134835.717366-1-ross.burton@arm.com>
References: <20260216134835.717366-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231205

Use EXTRA_OECMAKE in the non-cmake-inheriting cmake-native recipe, so
that the cmake.inc can assign once.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cmake/cmake-native_4.2.3.bb | 4 ++--
 meta/recipes-devtools/cmake/cmake_4.2.3.bb        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb b/meta/rec=
ipes-devtools/cmake/cmake-native_4.2.3.bb
index 128fef8a6e7..299cb4d1ea6 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM:append =3D " \
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
=20
-CMAKE_EXTRACONF =3D "\
+EXTRA_OECMAKE +=3D "\
     -DCMAKE_LIBRARY_PATH=3D${STAGING_LIBDIR_NATIVE} \
     -DBUILD_CursesDialog=3D1 \
     -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
@@ -41,7 +41,7 @@ do_configure () {
 	${S}/bootstrap --verbose --prefix=3D${prefix} \
 		${@oe.utils.parallel_make_argument(d, '--parallel=3D%d')} \
 		${@bb.utils.contains('CCACHE', 'ccache ', '--enable-ccache', '', d)} \
-		-- ${CMAKE_EXTRACONF}
+		-- ${EXTRA_OECMAKE}
 }
=20
 do_compile() {
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.3.bb b/meta/recipes-de=
vtools/cmake/cmake_4.2.3.bb
index 7c3dda2b157..233ceeae153 100644
--- a/meta/recipes-devtools/cmake/cmake_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.2.3.bb
@@ -33,7 +33,7 @@ python () {
     d.setVar("docdir_stripped", docdir_stripped)
 }
=20
-EXTRA_OECMAKE =3D " \
+EXTRA_OECMAKE +=3D " \
     -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
--=20
2.43.0


