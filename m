Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD178D5E370
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22570.1765892172910989327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64212FEC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:05 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 333E33F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] freetype: use meson instead of autotools
Date: Tue, 16 Dec 2025 13:36:00 +0000
Message-ID: <20251216133603.1003572-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133603.1003572-1-ross.burton@arm.com>
References: <20251216133603.1003572-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227953

Port the options to Meson, and drop all of the autoconf tweaking.

Enable Harfbuzz support using dynamic loading by default. If Harfbuzz is
present at runtime then FreeType will use it for improved hinting. Do
not RDEPENDS on harfbuzz so that it's only used if already present in
the rendering stack.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../freetype/freetype_2.14.1.bb               | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.14.1.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.14.1.bb
index 97344c4c5ee..dc59e5656b5 100644
--- a/meta/recipes-graphics/freetype/freetype_2.14.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.14.1.bb
@@ -18,26 +18,15 @@ SRC_URI[sha256sum] =3D "32427e8c471ac095853212a37aef8=
16c60b42052d4d9e48230bab3bdf2
=20
 UPSTREAM_CHECK_REGEX =3D "freetype-(?P<pver>\d+(\.\d+)+)"
=20
-inherit autotools pkgconfig multilib_header
+inherit meson pkgconfig multilib_header
=20
-# Adapt autotools to work with the minimal autoconf usage in freetype
-AUTOTOOLS_SCRIPT_PATH =3D "${S}/builds/unix"
-CONFIGURE_SCRIPT =3D "${S}/configure"
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader --exclude=3Dautomake -I ."
+PACKAGECONFIG ??=3D "harfbuzz pixmap zlib"
=20
-PACKAGECONFIG ??=3D "zlib pixmap"
-
-PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
-PACKAGECONFIG[bzip2] =3D "--with-bzip2,--without-bzip2,bzip2"
-# harfbuzz results in a circular dependency so enabling is non-trivial
-PACKAGECONFIG[harfbuzz] =3D "--with-harfbuzz,--without-harfbuzz,harfbuzz=
"
-PACKAGECONFIG[pixmap] =3D "--with-png,--without-png,libpng"
-PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
-PACKAGECONFIG[freetypeconfig] =3D "--enable-freetype-config=3Dyes,--enab=
le-freetype-config=3Dno,"
-
-EXTRA_OECONF =3D "CC_BUILD=3D'${BUILD_CC}'"
-
-TARGET_CPPFLAGS +=3D "-D_FILE_OFFSET_BITS=3D64"
+PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli=
"
+PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Denabled,-Dbzip2=3Ddisabled,bzip2"
+PACKAGECONFIG[harfbuzz] =3D "-Dharfbuzz=3Ddynamic,-Dharfbuzz=3Ddisabled"
+PACKAGECONFIG[pixmap] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
+PACKAGECONFIG[zlib] =3D "-Dzlib=3Dsystem,-Dzlib=3Ddisabled,zlib"
=20
 do_install:append() {
 	oe_multilib_header freetype2/freetype/config/ftconfig.h
--=20
2.43.0


