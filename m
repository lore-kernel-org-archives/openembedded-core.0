Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156B4CC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 14:57:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15756.1791989869985822720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 07:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lziigxUp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 181F61570
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 133B33F673
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791989869; bh=3lTYQ4utMAgKa24gNsDMmTLpcAx6VNH8m/akMhlcTZc=;
	h=From:To:Subject:Date:From;
	b=lziigxUpZDwUttzn+/ja+bpVw47o1nqbsJ9/zOTSuIRgnMkBGUS3ggOFyBYLhOYyc
	 pP0DhgFJUM5MOWK4Uw4gGD5+xM4LC1JSoXcYAjrM7+OmCNnZ2LIlE65pKX8Fhu17qp
	 YLDkzpa+Vs6fW0eQop1o4lggDgzmZ0n7i0dXqzwI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] freetype: upgrade 2.14.3 -> 2.15.0
Date: Wed, 14 Oct 2026 15:57:41 +0100
Message-ID: <20261014145744.1818933-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 14:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247775

- Support for the ISO Open Font Format, Edition 5.

  - The  new  'VARC' table  allows  a  file  size reduction  of  CJK
    Variation fonts by up to 90%.

  - OpenType fonts with  more than 65536 glyphs can  now be handled.
    The  new tables  related to  this feature  are all  written with
    uppercase  letters:  'MAXP',  'GLYF',  'LOCA',  'HHEA',  'VHEA',
    'HMTX', 'VMTX', 'GVAR', 'DMAP'.

  - The new 'GLYF' table also supports outlines with mixed cubic and
    conic segments.

- The anti-aliased rasterizer now uses dynamic heap memory for large
  glyphs,  which  significantly improves  its performance  at  sizes
  above 40 ppem.

- The  TrueType   version  40  interpreter  got   several  ClearType
  rendering  improvements.   It  now   better  honors  'gasp'  table
  requests  for  symmetric  grid  fitting and  smoothing,  and  more
  closely  emulates  native   ClearType  horizontal  hinting.   This
  includes improved handling of rounded point instructions, `ROUND`,
  CVT cut-in, minimum distance, and composite glyph positioning.

  These changes improve  the rendering of fonts such  as 'Segoe UI',
  'Calibri', 'Corbel', 'Constantia', 'Malgun Gothic', 'SimSun',  and
  'Comic Sans MS'.

- Continued efforts to scrutinize FreeType with AI tools resulted in
  more bugs  being fixed, some with  potential security implications
  (e.g., CVE-2026-95512).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../freetype/{freetype_2.14.3.bb =3D> freetype_2.15.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.14.3.bb =3D> freetype_=
2.15.0.bb} (94%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.14.3.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.15.0.bb
similarity index 94%
rename from meta/recipes-graphics/freetype/freetype_2.14.3.bb
rename to meta/recipes-graphics/freetype/freetype_2.15.0.bb
index 924bcbfc4f7..cb9c410b467 100644
--- a/meta/recipes-graphics/freetype/freetype_2.14.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.15.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Deeb073d5=
fb86d23c52bb9b84aa256307 \
                     "
=20
 SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] =3D "36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28=
cf11ba775e785a5f"
+SRC_URI[sha256sum] =3D "93cd47eb719c325107f2d3cf087d06299e944c3b48a40b55=
537302304dea1dd5"
=20
 UPSTREAM_CHECK_REGEX =3D "freetype-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.43.0


