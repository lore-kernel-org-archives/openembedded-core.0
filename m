Return-Path: <luna.graefje@orbitalsystems.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D3CC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:04:09 +0000 (UTC)
Received: from dd28620.kasserver.com (dd28620.kasserver.com [85.13.163.5])
 by mx.groups.io with SMTP id smtpd.web08.9361.1644314647944449337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: orbitalsystems.de,
 ip: 85.13.163.5, mailfrom: luna.graefje@orbitalsystems.de)
Received: from gos-thonk.fritz.box (ip5f5af03f.dynamic.kabel-deutschland.de
 [95.90.240.63])
	by dd28620.kasserver.com (Postfix) with ESMTPSA id 902ADCE20F14;
	Tue,  8 Feb 2022 11:04:03 +0100 (CET)
From: =?UTF-8?q?Luna=20Gr=C3=A4fje?= <luna.graefje@orbitalsystems.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Luna=20Gr=C3=A4fje?= <luna.graefje@orbitalsystems.de>
Subject: [PATCH] tune-cortexa72: Fix a misspelt override in
 PACKAGE_EXTRA_ARCHS
Date: Tue,  8 Feb 2022 11:03:59 +0100
Message-Id: <20220208100359.49461-1-luna.graefje@orbitalsystems.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:04:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161488

Without this, the string "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc}" will
show up in some bash tasks (notably opkg-arch-config.do_compile which is
how I found out about this) which will break things (besides obviously
not doing the intended thing of expanding to a list of architectures)

Signed-off-by: Luna Gr=C3=A4fje <luna.graefje@orbitalsystems.de>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/me=
ta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 1a20b04483..b0a017e444 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -11,7 +11,7 @@ ARMPKGARCH:tune-cortexa72             =3D "cortexa72"
 ARMPKGARCH:tune-cortexa72-crypto      =3D "cortexa72"
 TUNE_FEATURES:tune-cortexa72          =3D "${TUNE_FEATURES:tune-armv8a-c=
rc} cortexa72"
 TUNE_FEATURES:tune-cortexa72-crypto   =3D "${TUNE_FEATURES:tune-cortexa7=
2} crypto"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72        =3D "${PACKAGE_EXTRA_ARCHS:tun=
e-armv8-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72        =3D "${PACKAGE_EXTRA_ARCHS:tun=
e-armv8a-crc} cortexa72"
 PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto =3D "${PACKAGE_EXTRA_ARCHS:tun=
e-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
 BASE_LIB:tune-cortexa72            =3D "lib64"
 BASE_LIB:tune-cortexa72-crypto     =3D "lib64"
--=20
2.32.0


