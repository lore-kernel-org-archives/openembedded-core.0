Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13293.1795698133676022108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=KUuJxJW7;
 spf=pass (domain: geanix.com, ip: 109.224.244.106, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795698129; x=1795957329;
	bh=CHIlIy9Cegw1SkZkCLrZ+nmXXM9ZGZwu7EUvqglgVes=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KUuJxJW7Deom4UYJEY9cbOPh+1+YqcZ2h9ubPlByftubLerqKA9qxSi6KyCuyrbju
	 9CGVDtqxagLTeMJGLHnJQo0ZYNijy8DMC6p11yLp9/2aQFJhmVK3Z8B1UOMUSN0Yl0
	 a39izHtrJ2hnObk0z5bVlCajKxBwd8Xy1Tu7rFurSNzPJ5dK1lheMdVtSdx9N/0mZg
	 BHZaiGtxnKQeV8Uejo3IlDS4GQuwqXgnGEDDl5qOud0fMtsFs/4QChi2gEygzIw+3N
	 D1Nun/KkTXi66xkmR33yq7yQqrh17y0CmR1fJy7a++yn3dqvydlmrwVI8JWAy/VHBz
	 0Eva48St58+gw==
X-Pm-Submission-Id: 4jZxXG42m3z1DDrZ
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH] erofs-utils: add lzma PACKAGECONFIG and enable it by default
Date: Thu, 26 Nov 2026 14:01:59 +0100
Message-ID: <20261126130159.2579764-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251295
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

