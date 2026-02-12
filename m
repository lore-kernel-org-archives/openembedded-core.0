Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB98EEE36A5
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:43:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49971.1770914581624688786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEAB6339
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:42:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBD783F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:43:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] cmake: use system libuv
Date: Thu, 12 Feb 2026 16:42:51 +0000
Message-ID: <20260212164254.1110652-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212164254.1110652-1-ross.burton@arm.com>
References: <20260212164254.1110652-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231044

We have a recipe for libuv in oe-core, so use it in the target recipe to
avoid vendoring in more code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cmake/cmake_4.2.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_4.2.3.bb b/meta/recipes-de=
vtools/cmake/cmake_4.2.3.bb
index cf559d764a..e6abc06c85 100644
--- a/meta/recipes-devtools/cmake/cmake_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.2.3.bb
@@ -2,7 +2,7 @@ require cmake.inc
=20
 inherit cmake bash-completion
=20
-DEPENDS +=3D "curl expat zlib libarchive xz ncurses bzip2"
+DEPENDS +=3D "curl expat zlib libarchive xz ncurses bzip2 libuv"
=20
 SRC_URI:append:class-nativesdk =3D " \
     file://OEToolchainConfig.cmake \
@@ -15,7 +15,6 @@ LICENSE:append =3D " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append =3D " \
     file://Utilities/cmjsoncpp/LICENSE;md5=3D5d73c165a0f9e86a1342f32d19e=
c5926 \
     file://Utilities/cmlibrhash/COPYING;md5=3Da8c2a557a5c53b1c12cddbee98=
c099af \
-    file://Utilities/cmlibuv/LICENSE;md5=3Dad93ca1fffe931537fcf64f6fcce0=
84d \
 "
=20
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
@@ -37,7 +36,6 @@ EXTRA_OECMAKE +=3D " \
     -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=3D0 \
-    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
     -DBUILD_CursesDialog=3D0 \
 "
--=20
2.43.0


