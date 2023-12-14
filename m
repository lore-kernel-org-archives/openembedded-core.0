Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6445BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:56:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24273.1702565762450066063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C628C15
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 06:56:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AFAF3F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 06:56:01 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] machine/arch-armv9: remove crc and sve tunes, they are mandatory
Date: Thu, 14 Dec 2023 14:55:59 +0000
Message-Id: <20231214145559.1536461-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192389

From: Ross Burton <ross.burton@arm.com>

As per the Arm ARM section A2.3.2, FEAT_CRC32 is mandatory in Armv8.1
onwards, so there's no need to have an explicit optional tune for it.

SVE (which was a choice here) and SVE2 (which was not) are both optional
with v9.0, but GCC's -march=3Darmv9-a defaults to enabling both SVE and
SVE2 on the grounds that there are no implementations of Armv9 that
don't support SVE2.  This means there's no point having an explicit sve
feature as it's enabled out of the box.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/include/arm/arch-armv9a.inc | 22 ++++---------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv9a.inc b/meta/conf/ma=
chine/include/arm/arch-armv9a.inc
index 6945dea333b..e8d7c08a63b 100644
--- a/meta/conf/machine/include/arm/arch-armv9a.inc
+++ b/meta/conf/machine/include/arm/arch-armv9a.inc
@@ -1,33 +1,19 @@
-DEFAULTTUNE ?=3D "armv9a-crc"
+DEFAULTTUNE ?=3D "armv9a"
=20
 TUNEVALID[armv9a] =3D "Enable instructions for ARMv9-a"
 TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', =
' -march=3Darmv9-a', '', d)}"
 MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', '=
armv9a:', '', d)}"
=20
 require conf/machine/include/arm/arch-arm64.inc
-require conf/machine/include/arm/feature-arm-crc.inc
 require conf/machine/include/arm/feature-arm-crypto.inc
-require conf/machine/include/arm/feature-arm-sve.inc
=20
 # Little Endian base configs
-AVAILTUNES +=3D "armv9a armv9a-crc armv9a-crc-crypto armv9a-crc-crypto-s=
ve armv9a-crypto"
-ARMPKGARCH:tune-armv9a                    ?=3D "armv9a"
-ARMPKGARCH:tune-armv9a-crc                ?=3D "armv9a"
-ARMPKGARCH:tune-armv9a-crypto             ?=3D "armv9a"
-ARMPKGARCH:tune-armv9a-crc-crypto         ?=3D "armv9a"
-ARMPKGARCH:tune-armv9a-crc-crypto-sve     ?=3D "armv9a"
+AVAILTUNES +=3D "armv9a armv9a-crypto"
+ARMPKGARCH:tune-armv9a                     ?=3D "armv9a"
+ARMPKGARCH:tune-armv9a-crypto              ?=3D "armv9a"
 TUNE_FEATURES:tune-armv9a                  =3D "aarch64 armv9a"
-TUNE_FEATURES:tune-armv9a-crc              =3D "${TUNE_FEATURES:tune-arm=
v9a} crc"
 TUNE_FEATURES:tune-armv9a-crypto           =3D "${TUNE_FEATURES:tune-arm=
v9a} crypto"
-TUNE_FEATURES:tune-armv9a-crc-crypto       =3D "${TUNE_FEATURES:tune-arm=
v9a-crc} crypto"
-TUNE_FEATURES:tune-armv9a-crc-crypto-sve   =3D "${TUNE_FEATURES:tune-arm=
v9a-crc-crypto} sve"
 PACKAGE_EXTRA_ARCHS:tune-armv9a            =3D "aarch64 armv9a"
-PACKAGE_EXTRA_ARCHS:tune-armv9a-crc        =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-armv9a} armv9a-crc"
 PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-armv9a} armv9a-crypto"
-PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-armv9a-crc} armv9a-crypto armv9a-crc-crypto"
-PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto-sve =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv9a-crc-crypto} armv9a-crc-crypto-sve"
 BASE_LIB:tune-armv9a                       =3D "lib64"
-BASE_LIB:tune-armv9a-crc                   =3D "lib64"
 BASE_LIB:tune-armv9a-crypto                =3D "lib64"
-BASE_LIB:tune-armv9a-crc-crypto            =3D "lib64"
-BASE_LIB:tune-armv9a-crc-crypto-sve        =3D "lib64"
--=20
2.34.1


