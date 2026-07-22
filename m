Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DF7C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 15:43:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3157.1784734978741544901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 08:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=OkL3mVxK;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 173AC168F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E03853F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734978; bh=a00kWZE7b+4RIsovFoYycTWtClKerG2krAYkozY3/YA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OkL3mVxK/WWdfcG3DfE5Yjn8f+FeY/o+2GvUyD5D2tpGXW28/eFesPqtA2dGmlNpL
	 XtUQ6yKvl37G8V71Md5hpxAT/cXTZ36hPrzBX9fb8gD0rHEJ13cD0oGzDlSvan3kHI
	 DklwK7SSob2I80ix2R9zOSmpCau7yTfcRDZy6X74=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] xorg-lib-common: add builder class variable
Date: Wed, 22 Jul 2026 16:42:46 +0100
Message-ID: <20260722154247.2987545-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722154247.2987545-1-ross.burton@arm.com>
References: <20260722154247.2987545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 15:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241702

Add a variable XORGBUILDCLASS to control which builder class is used.

Defaults to autotools for no change, but this lets recipes switch to
Meson if they can.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/re=
cipes-graphics/xorg-lib/xorg-lib-common.inc
index 25697e8471b..a32e47f63b4 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -12,10 +12,12 @@ SRC_URI =3D "${XORG_MIRROR}/individual/lib/${XORG_PN}=
-${PV}.${XORG_EXT}"
=20
 S =3D "${UNPACKDIR}/${XORG_PN}-${PV}"
=20
-inherit autotools features_check pkgconfig
+XORGBUILDCLASS ??=3D "autotools"
+inherit_defer ${XORGBUILDCLASS}
+
+inherit features_check pkgconfig
=20
 EXTRA_OECONF =3D "--disable-docs --disable-specs"
-
 UNKNOWN_CONFIGURE_OPT_IGNORE +=3D "--disable-docs --disable-specs"
=20
 REQUIRED_DISTRO_FEATURES ?=3D "x11"
--=20
2.43.0


