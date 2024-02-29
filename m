Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6DEC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 16:24:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.337.1709223871873615968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 08:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 269DF1FB
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 08:25:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 046353F6C4
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 08:24:30 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: split out more firmware pieces
Date: Thu, 29 Feb 2024 16:24:29 +0000
Message-Id: <20240229162429.4039266-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 16:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196438

From: Ross Burton <ross.burton@arm.com>

Split _most_ of the rtl_nic drivers to a subpackage. Notably this does
not include rtl8168 as this is already split into a separate package.
These drivers are fairly common so this lets people install the essential
firmware easier.

Also split out some large firmware collections into subpackages:
- Mellanox (82M)
- Marvell Prestera (72M)
- QLogic 4xxxx (21M)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20231211.bb  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index 9347cde298d..3a3690bdc1b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -280,6 +280,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
              ${PN}-rtl8761 \
              ${PN}-rtl8168 \
              ${PN}-rtl8822 \
+             ${PN}-rtl-nic \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
              ${PN}-bcm-0bb4-0306 \
@@ -348,6 +349,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
              ${PN}-bnx2 \
              ${PN}-bnx2x \
              ${PN}-liquidio \
+             ${PN}-mellanox \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
              ${PN}-nvidia-gpu \
@@ -366,7 +368,9 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
              ${PN}-olpc-license ${PN}-olpc \
              ${PN}-phanfw-license ${PN}-phanfw \
              ${PN}-powervr-license ${PN}-powervr \
+             ${PN}-prestera \
              ${PN}-qat ${PN}-qat-license \
+             ${PN}-qed \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-=
5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
@@ -817,6 +821,7 @@ LICENSE:${PN}-rtl8761 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8822 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-license =3D "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl-nic =3D "WHENCE"
 LICENSE:${PN}-rtl8168 =3D "WHENCE"
=20
 FILES:${PN}-rtl-license =3D " \
@@ -852,6 +857,9 @@ FILES:${PN}-rtl8822 =3D " \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin \
 "
+FILES:${PN}-rtl-nic =3D " \
+  ${nonarch_base_libdir}/firmware/rtl_nic/*.fw \
+"
=20
 RDEPENDS:${PN}-rtl8188 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192ce +=3D "${PN}-rtl-license"
@@ -862,6 +870,7 @@ RDEPENDS:${PN}-rtl8821 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8761 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8822 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 +=3D "${PN}-whence-license"
+RDEPENDS:${PN}-rtl-nic +=3D "${PN}-whence-license"
=20
 # For TI wl1251
 LICENSE:${PN}-wl1251 =3D "Firmware-wl1251"
@@ -1325,6 +1334,9 @@ FILES:${PN}-qat-license   =3D "${nonarch_base_libdi=
r}/firmware/LICENCE.qat_firmwar
 FILES:${PN}-qat           =3D "${nonarch_base_libdir}/firmware/qat*.bin"
 RDEPENDS:${PN}-qat        =3D "${PN}-qat-license"
=20
+LICENSE:${PN}-qed         =3D "WHENCE"
+FILES:${PN}-qed           =3D "${nonarch_base_libdir}/firmware/qed/*"
+
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license =3D "Firmware-qcom"
 LICENSE:${PN}-qcom-yamato-license =3D "Firmware-qcom-yamato"
@@ -1467,6 +1479,12 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensor=
s =3D "${PN}-qcom-sc8280xp-lenov
=20
 FILES:${PN}-liquidio =3D "${nonarch_base_libdir}/firmware/liquidio"
=20
+FILES:${PN}-mellanox =3D "${nonarch_base_libdir}/firmware/mellanox"
+
+LICENSE:${PN}-prestera =3D "Firmware-Marvell"
+FILES:${PN}-prestera =3D "${nonarch_base_libdir}/firmware/mrvl/prestera"
+RDEPENDS:${PN}-prestera =3D "${PN}-marvell-license"
+
 # For Rockchip
 LICENSE:${PN}-rockchip-dptx =3D "Firmware-rockchip"
 FILES:${PN}-rockchip-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.rockchip"
--=20
2.34.1


