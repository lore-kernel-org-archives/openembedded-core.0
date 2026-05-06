Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4C5CD3440
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 15:14:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21207.1778080431282176354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 08:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ax94lECH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 692C71A00
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2026 08:13:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6809F3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2026 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778080430; bh=psxfFIX2+iGZmG14aP91se8Gbd3IDs2AQUscb5BljJg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ax94lECH49LS+RHlp56qvPX4wnSjKpu1v4zLI/sCJni+VLNb/lyUa9VLK7j8MyH+q
	 BLBscpA81vnpG51SnEU07bDw+ONznHd3pn66Z8fzeGRYgBVeL5JQ1ZO33CKWbmaSq+
	 9wBuIYfH1quAx2Q5IANfPUaDYbeu70Io8DGp2PsU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] harfbuzz: upgrade 12.3.2 -> 14.2.0
Date: Wed,  6 May 2026 16:13:45 +0100
Message-ID: <20260506151345.1389998-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506151345.1389998-1-ross.burton@arm.com>
References: <20260506151345.1389998-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236542

Highlights from 13.0.0:

- New public hb-vector API for vector output of glyph outlines. The only
  supported output format currently is SVG.
- New public hb-raster API for rasterizing glyphs to A8 / BGRA32 images.

Highlights from 13.1.0:

- The harfbuzz-raster library can now render bitmap color glyph formats
  (CBDT and sbix). It now also has an API to serialize / deserialize
  images to and from PNGs. This new functionality requires libpng, and
  will not be available if HarfBuzz is built without libpng.
- Install hb-raster command line utility.

Highlights from 13.1.1:

- Support gzip-compressed SVG glyphs in harfbuzz-raster
  and harfbuzz-vector libraries. This new functionality requires zlib,
  and will not be available if HarfBuzz is built without zlib.

Hights from 14.0.0:

- New libharfbuzz-gpu library: GPU text rasterization based on the Slug
  algorithm by Eric Lengyel. Encodes glyph outlines on the CPU into
  compact blobs that the GPU decodes and rasterizes directly in the
  fragment shader, with no intermediate bitmap atlas.

Add PACKAGECONFIGs for the new auxiliary libraries and optional
dependencies. This includes the new option for the subset library, which
is enabled by default to preserve existing behaviour.

Based on work by Wang Mingyu <wangmy@fujitsu.com>.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{harfbuzz_12.3.2.bb =3D> harfbuzz_14.2.0.bb}       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.2.bb =3D> harfbuzz_=
14.2.0.bb} (77%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
similarity index 77%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
index 95aa5ea531c..c130819f317 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2=
a67cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "6f6db164359a2da5a84ef826615b448b33e6306067ad829d=
85d5b0bf936f1bb8"
+SRC_URI[sha256sum] =3D "94017020f96d025bb66ae91574e4cf334bcad23e8175a8a4=
0565b3721bc2eaff"
=20
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github=
-releases
=20
@@ -23,11 +23,15 @@ FULL_OPTIMIZATION =3D "-Os ${DEBUG_LEVELFLAG}"
=20
 EXTRA_OEMESON =3D "-Dtests=3Ddisabled"
=20
-PACKAGECONFIG ??=3D "cairo gobject glib icu freetype"
+PACKAGECONFIG ??=3D "cairo gobject subset glib icu freetype"
=20
 # Optional harfbuzz libraries
 PACKAGECONFIG[cairo] =3D "-Dcairo=3Denabled,-Dcairo=3Ddisabled,cairo"
 PACKAGECONFIG[gobject] =3D "-Dgobject=3Denabled,-Dgobject=3Ddisabled,gli=
b-2.0-native glib-2.0"
+PACKAGECONFIG[gpu] =3D "-Dgpu=3Denabled,-Dgpu=3Ddisabled"
+PACKAGECONFIG[raster] =3D "-Draster=3Denabled,-Draster=3Ddisabled"
+PACKAGECONFIG[subset] =3D "-Dsubset=3Denabled,-Dsubset=3Ddisabled"
+PACKAGECONFIG[vector] =3D "-Dvector=3Denabled,-Dvector=3Ddisabled"
=20
 # Unicode providers
 PACKAGECONFIG[glib] =3D "-Dglib=3Denabled,-Dglib=3Ddisabled,glib-2.0"
@@ -37,6 +41,10 @@ PACKAGECONFIG[icu] =3D "-Dicu=3Denabled,-Dicu=3Ddisabl=
ed,icu"
 PACKAGECONFIG[chafa] =3D "-Dchafa=3Denabled,-Dchafa=3Ddisabled,chafa"
 PACKAGECONFIG[freetype] =3D "-Dfreetype=3Denabled,-Dfreetype=3Ddisabled,=
freetype"
 PACKAGECONFIG[graphite] =3D "-Dgraphite2=3Denabled,-Dgraphite2=3Ddisable=
d,graphite2"
+# Optional dependency in the raster library
+PACKAGECONFIG[png] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
+# Optional dependency in the raster and vector libraries
+PACKAGECONFIG[zlib] =3D "-Dzlib=3Denabled,-Dzlib=3Ddisabled,zlib"
=20
 do_install:append() {
     # If no tools are installed due to PACKAGECONFIG then this directory=
 might
--=20
2.43.0


