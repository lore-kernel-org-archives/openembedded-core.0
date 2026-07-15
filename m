Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F74C4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6669.1784124321486810789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MXP5RDZl;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48CE1477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD4513F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124320; bh=Zz+2EMrCsYhFhEVjL+6Sj9FWWD58bEj07Z/tgVv8yVo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MXP5RDZlNS+r6rghu68G6JNvq0LXPQXt9LvaZWIFYzBINV9U8Fxl0L+8a7cq8T4iU
	 RHo6n7F/sB6Uixf2N7BTa8pH19jsKqC2rTFc/lR2/CjdeSH1QCmmKJJdcoqaLvSdyT
	 DxKZgya3KHe21aqHM2iej/DSZIAT5QfTgkbk7jxU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] xkbcomp: build with meson
Date: Wed, 15 Jul 2026 15:05:05 +0100
Message-ID: <20260715140507.2329605-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240970

The meson.build requires that bison is present, even if it may not be
needed.

Drop --disable-selective-error as this isn't an option in meson.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb b/meta/recip=
es-graphics/xorg-app/xkbcomp_1.5.0.bb
index 67bed254ac9..df9f1934710 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb
@@ -9,11 +9,11 @@ be read directly by XKB-capable X servers or utilities.=
"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbe5e191f04d3f2cd80aa83b928ba9=
84c"
=20
-DEPENDS +=3D "libxkbfile"
+DEPENDS +=3D "bison-native libxkbfile"
=20
 BBCLASSEXTEND =3D "native"
=20
-EXTRA_OECONF +=3D "--disable-selective-werror"
+XORGBUILDCLASS =3D "meson"
=20
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2=
f33c7141b8486060"
--=20
2.43.0


