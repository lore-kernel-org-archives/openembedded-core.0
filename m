Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1A3CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 15:10:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37130.1778857809205739113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 08:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FJpkPeLf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256B22880
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:10:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9F003F85F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778857808; bh=6APfLtjU7O08zG7tsTULKnRYWAf4Nxw3rNsbwfG0pUk=;
	h=From:To:Subject:Date:From;
	b=FJpkPeLfMTCW9DHkqdZVbubit6I4Mc1n3AsdkOn3DHHMFOuAdO2FTVJI5SuogpgqL
	 Jn/D1RYJh05kRT8qYs2z39q6W1p6jR0yMM64bR94vcnC1b8b393qhfL8r5VVk9gD1R
	 T+Z9EpTB6+hT8iJ8Vrp84LpnJWV3QRxIuF4Qox6g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] librsvg: remove dependency on literation-fonts
Date: Fri, 15 May 2026 16:10:02 +0100
Message-ID: <20260515151004.2591185-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 15:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237177

librsvg 2.42 onwards[1] from 2018 ship the fonts they need for the test
suite instead of assuming the system has the right fonts, so we don't
need to depend on liberation-fonts for the tests.

[1] librsvg ec3353e89 ("Use a hard-coded font file to render test images,
    for predictable font rendering")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.61.3.bb
index 69bbc27c68c..00f8599828c 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd6538=
0cdd255951079008b364516c"
=20
 SECTION =3D "x11/utils"
 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-na=
tive cargo-native cargo-c-native"
-RDEPENDS:${PN}-ptest +=3D "rsvg liberation-fonts"
+RDEPENDS:${PN}-ptest +=3D "rsvg"
 BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit cargo_common gnomebase pixbufcache gobject-introspection rust va=
la gi-docgen cargo-update-recipe-crates ptest-cargo
--=20
2.43.0


