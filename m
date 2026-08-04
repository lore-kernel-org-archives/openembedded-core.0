Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4A6C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 17:11:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21546.1785863510524489270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 10:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=STVXiyRS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18D5F1476
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:11:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DD653F632
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863510; bh=BFaT97Xos3wks6XRfxpqHlqMoySZJXFIrg4efwzqSnI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=STVXiyRS++MYi+LyPkXFm6O6BFV8H6MPHobWmniYhBKQnHx1VGF1l633RlBOIcI55
	 ZMkpfR4lRaktVJiZG1RujYTsF6HWihRqkHuoYsDl4K7KZAT7A0stID8jmCmQI5inYN
	 3xgZCtCs27xdJ9nKzr4mTGsTP+aiCJv0+rgKKdFY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] xwininfo: use meson to build
Date: Tue,  4 Aug 2026 18:11:44 +0100
Message-ID: <20260804171144.665123-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804171144.665123-1-ross.burton@arm.com>
References: <20260804171144.665123-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 17:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242793

Since 1.1.7 xwinfino can use meson to build, so use it.

Replace the gettext-native dependency with virtual/libiconv, because
that is what the dependency actually is: the autoconf check was overly
eager.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb b/meta/reci=
pes-graphics/xorg-app/xwininfo_1.1.7.bb
index 6fc49e8729f..f3f0ed5cd43 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.7.bb
@@ -7,9 +7,11 @@ windows.  Information may include window position, size,=
 color depth, \
 and a number of other items."
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da1b9559d7b7997a6e9588012ebf87=
69a"
-DEPENDS +=3D "libxext libxmu gettext-native"
+DEPENDS +=3D "libxext libxmu virtual/libiconv"
=20
 PE =3D "0"
=20
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "bee14d594cc86cc59aae1015c1b452a71bf60c304131e271=
6ca1cf0df733b4ac"
+
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


