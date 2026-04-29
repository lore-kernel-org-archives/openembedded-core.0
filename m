Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1503CCD13DE
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.895.1777481312642106048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gTgJOS66;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7F911BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0D463F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481312; bh=XGRkZNu681+tMJMuHgaxfX79G7Ixel6Kon+2P4q2Nes=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gTgJOS66lFNvUtcjAz/vW9rPfSzLD4JGZQbSpCduPC+G7plkdvwsWR3Rh90RXP/vl
	 SHO3uSK374+6w+SgYKKveiqXMl86vkvdY25tyrQmIPhlTGVu4qlsFJD21znR8qvVzL
	 3JV5VMTpfi6PC8P58MtX9we+SbbE3l7OccpOA/As=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-firmware: split out MediaTek mt7996 firmare
Date: Wed, 29 Apr 2026 17:48:19 +0100
Message-ID: <20260429164821.3425757-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236120

The firmware for the MT7996/MT7992/MT7990 devices that use the mt7996e
driver comes to 13MB. Split it out of the -mediatek catch-all as that
accounts for over 20% of the firmware:

linux-firmware: PACKAGES: added "linux-firmware-mt7996"
linux-firmware/linux-firmware-mediatek: PKGSIZE changed from 61848181 to =
49149973 (-21%)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20260410.bb          | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
index 6bb6034d6c7..b34f8ef2557 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
@@ -524,7 +524,7 @@ do_install() {
 PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cw1200-license ${PN}-cw1200 \
              ${PN}-ralink-license ${PN}-ralink \
-             ${PN}-mt76x-license ${PN}-mt7601u ${PN}-mt7650 ${PN}-mt76x2=
 \
+             ${PN}-mt76x-license ${PN}-mt7601u ${PN}-mt7650 ${PN}-mt76x2=
 ${PN}-mt7996 \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-amdgpu-aldebaran \
@@ -1185,6 +1185,14 @@ FILES:${PN}-mt76x2 =3D " \
 "
 RDEPENDS:${PN}-mt76x2 +=3D "${PN}-mt76x-license"
=20
+# MediaTek MT7996/MT7992/MT7990 (mt7996e.ko)
+LICENSE:${PN}-mt7996 =3D "Firmware-mediatek"
+
+FILES:${PN}-mt7996 =3D " \
+  ${firmwaredir}/mediatek/mt7996 \
+"
+RDEPENDS:${PN}-mt7996 +=3D "${PN}-mediatek-license"
+
 # For MediaTek
 LICENSE:${PN}-mediatek =3D "Firmware-mediatek"
 LICENSE:${PN}-mediatek-license =3D "Firmware-mediatek"
--=20
2.43.0


