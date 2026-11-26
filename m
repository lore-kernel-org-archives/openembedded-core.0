Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13698.1795699461167133704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=LIYeUFni;
 spf=pass (domain: geanix.com, ip: 79.135.106.111, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795699458; x=1795958658;
	bh=CHIlIy9Cegw1SkZkCLrZ+nmXXM9ZGZwu7EUvqglgVes=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LIYeUFnid/d6O/FLPZHbgFA/uRWtk3w/3F7MV6B+hhxUPFKp6ru7N9vuQ3+dC9+Mk
	 SjMeSC2jKFq4hJ4j8Z/J5n20WjeKWE+faw7BaX16R04r1xaKFjfPwX3Orc9aavDA/C
	 yXrjENWaWwGSrQpJwzheBabA6h84gl15M5ucEonDhqlr76Xl6WEZatG2CUXL6xLKQk
	 QPaIRn/NlL0OmcNsvwVHEkTTXuxDnvOHFAiQFDlxIigfOJXbswI/Fl0TGNp5CZAjor
	 cguczuB5zgf4lAHNr9jTg8YS8yuiol/GDX+0jJ9E48Cn6a64Nq705W6F1MS8OnALnU
	 OmJ6mVie20FGw==
X-Pm-Submission-Id: 4jZy1r4HLcz1DF5P
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [OE-core][PATCH] erofs-utils: add lzma PACKAGECONFIG and enable it by default
Date: Thu, 26 Nov 2026 14:24:12 +0100
Message-ID: <20261126132412.2581866-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251301
Content-Type: text/plain; charset="utf-8"

configure enables LZMA support whenever it finds liblzma, but the recipe
doesn't depend on xz. erofs-utils-native gets it only by accident:
util-linux-libuuid unpacks a .tar.xz, so xz-native is added to its
do_unpack and ends up in the native sysroot. Target and nativesdk builds
never find liblzma, so their mkfs.erofs can't create LZMA compressed
images, e.g. the Compression=3Dlzma DDIs of meta-oe's
discoverable-disk-image class.

Add an lzma PACKAGECONFIG and enable it by default, which keeps native
as it is and makes target and nativesdk match it.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb b/met=
a/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
index 9c0db7c2c0..1b05b3dbf7 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
@@ -13,8 +13,9 @@ DEPENDS =3D "util-linux-libuuid"
=20
 inherit pkgconfig autotools
=20
-PACKAGECONFIG ??=3D "lz4 zlib"
+PACKAGECONFIG ??=3D "lz4 lzma zlib"
 PACKAGECONFIG[lz4] =3D "--enable-lz4,--disable-lz4,lz4"
+PACKAGECONFIG[lzma] =3D "--enable-lzma,--disable-lzma,xz"
 PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
=20
 # Would otherwise query the system the build is running on
--=20
2.56.0

