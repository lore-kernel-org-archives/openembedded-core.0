Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1758C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 16:06:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11746.1749139587705681560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 09:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD2001688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 09:06:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E2A753F673
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 09:06:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot: move arm64 disabling fragments to versioned recipe
Date: Thu,  5 Jun 2025 17:06:24 +0100
Message-ID: <20250605160624.1029863-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 16:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218055

More than just the u-boot_2025.04.bb includes u-boot-common.inc, such as
u-boot_2023.07.02.bb in meta-arm.

To avoid other recipes having to carry patches that may not affect them,
move the files to be specific to the recipe itself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ----
 meta/recipes-bsp/u-boot/u-boot_2025.04.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
index 6cd9c39430f..fd1eab5cdde 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,10 +16,6 @@ SRCREV =3D "34820924edbc4ec7803eb89d9852f4b870fa760a"
=20
 SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster;tag=3Dv${PV}"
=20
-# workarounds for aarch64 kvm qemu boot regressions
-SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg file:/=
/disable_CONFIG_USB.cfg"
-SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg fil=
e://disable_CONFIG_USB.cfg"
-
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp=
/u-boot/u-boot_2025.04.bb
index db8b2d58b46..89e964f627e 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
@@ -2,3 +2,7 @@ require u-boot-common.inc
 require u-boot.inc
=20
 DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-nati=
ve"
+
+# workarounds for aarch64 kvm qemu boot regressions
+SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg file:/=
/disable_CONFIG_USB.cfg"
+SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg fil=
e://disable_CONFIG_USB.cfg"
--=20
2.43.0


