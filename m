Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE11C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:40:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61450.1707136855296476083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DD921FB
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Feb 2024 04:41:37 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5159A3F762
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Feb 2024 04:40:54 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next PATCH 1/2] tunes/sve: Add support for sve2 instructions
Date: Mon,  5 Feb 2024 13:40:52 +0100
Message-Id: <20240205124053.14205-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 12:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194932

Add support for SVE2 and add to 8-2a, as it can be used there.
Also, clean up the comments

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/arch-armv8-2a.inc   | 1 +
 meta/conf/machine/include/arm/arch-armv8r.inc     | 1 +
 meta/conf/machine/include/arm/feature-arm-sve.inc | 9 ++++++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/=
machine/include/arm/arch-armv8-2a.inc
index 95368b0af79e..2b5fae140608 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -6,6 +6,7 @@ TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATUR=
ES', 'armv8-2a', ' -march
 MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a',=
 'armv8-2a:', '', d)}"
=20
 require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/arm/feature-arm-sve.inc
=20
 # Little Endian base configs
 AVAILTUNES +=3D "armv8-2a armv8-2a-crypto"
diff --git a/meta/conf/machine/include/arm/arch-armv8r.inc b/meta/conf/ma=
chine/include/arm/arch-armv8r.inc
index 0dcfd34c1a2b..2fea8d2517f4 100644
--- a/meta/conf/machine/include/arm/arch-armv8r.inc
+++ b/meta/conf/machine/include/arm/arch-armv8r.inc
@@ -10,6 +10,7 @@ MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATU=
RES', 'armv8r', 'armv8r:',
 require conf/machine/include/arm/arch-arm64.inc
 require conf/machine/include/arm/feature-arm-crc.inc
 require conf/machine/include/arm/feature-arm-crypto.inc
+require conf/machine/include/arm/feature-arm-sve.inc
=20
 # All ARMv8 has floating point hardware built in.  Null it here to avoid=
 any confusion for 32bit.
 TARGET_FPU_32 =3D ""
diff --git a/meta/conf/machine/include/arm/feature-arm-sve.inc b/meta/con=
f/machine/include/arm/feature-arm-sve.inc
index 279bf8c48627..bdae3d8fc300 100644
--- a/meta/conf/machine/include/arm/feature-arm-sve.inc
+++ b/meta/conf/machine/include/arm/feature-arm-sve.inc
@@ -1,5 +1,8 @@
-# Scalable Vector Extension (SVE) for:
-# armv8.2-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, armv8-r, armv9a
+# Scalable Vector Extension (SVE) for Armv8-A and R
+# Enabled by default for Armv9
=20
-TUNEVALID[sve] =3D "Enable SVE instructions for ARMv8 and ARMv9"
+TUNEVALID[sve] =3D "Enable SVE instructions for ARMv8"
 TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'sve'=
, '+sve', '', d)}"
+
+TUNEVALID[sve2] =3D "Enable SVE2 instructions for ARMv8"
+TUNE_CCARGS_MARCH_OPTS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'sve2=
', '+sve2', '', d)}"
--=20
2.39.3 (Apple Git-145)


