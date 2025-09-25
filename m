Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995EFCAC5B9
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:21:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.11.1758828077165630249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 12:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vkUWXd47;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PJLGkQ1498183
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758828076;
	bh=ySKSL0U2+AXOBRnl3cxNdhZ6K3l9bTzAkMIIhnr3oi8=;
	h=From:To:Subject:Date;
	b=vkUWXd47EVdG+7E6vXBUpjb9XuAxW5GbE6r3iNgNU8b26BDm/H3ty+65I6Dkp3qRf
	 KRGZhUo48Jv1E9fxkz7KdqBdJ8o0MHZ2dfagfDAtZL8iqXp2uDImFBV3RwADagWXBk
	 BM6WqPsRnZ9QX50nQbPSmv9oLf1oVLRIWXP1SdY0=
Received: from DFLE207.ent.ti.com (dfle207.ent.ti.com [10.64.6.65])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PJLG8r391980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:21:16 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 25 Sep
 2025 14:21:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 14:21:16 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PJLGZe062059
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:21:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v1rWl-0005fg-VU
	for openembedded-core@lists.openembedded.org; Thu, 25 Sep 2025 14:21:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] linux-firmware: Fix FILES for intel firmware
Date: Thu, 25 Sep 2025 14:21:15 -0500
Message-ID: <20250925192115.21761-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 19:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224047

The 20250917 version is installing the firmware files into the
/usr/lib/firmware/intel directory and symbolic links to those files
under /usr/lib/firmware.  FILES needs to be updated to correctly package
all of the files into the right packages.  Without this we get a dependency
from the linux-firmware-iwlwifi-* and linux-firmware-qat packages back to
linux-firmware which means you have to install ALL of the drivers when you
depend on the specific package.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux-firmware/linux-firmware_20250917.bb | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 5d5a5c8cae..f6bca28fbc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -1759,32 +1759,32 @@ LICENSE:${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 FILES:${PN}-iwlwifi-license = "${nonarch_base_libdir}/firmware/LICENCE.iwlwifi_firmware"
-FILES:${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode*"
-FILES:${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode*"
-FILES:${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode*"
-FILES:${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode*"
-FILES:${PN}-iwlwifi-3160-10 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-10.ucode*"
-FILES:${PN}-iwlwifi-3160-12 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-12.ucode*"
-FILES:${PN}-iwlwifi-3160-13 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-13.ucode*"
-FILES:${PN}-iwlwifi-3160-16 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-16.ucode*"
-FILES:${PN}-iwlwifi-3160-17 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-17.ucode*"
-FILES:${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode*"
-FILES:${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode*"
-FILES:${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode*"
-FILES:${PN}-iwlwifi-6000g2b-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-5.ucode*"
-FILES:${PN}-iwlwifi-6000g2b-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-6.ucode*"
-FILES:${PN}-iwlwifi-6050-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-4.ucode*"
-FILES:${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.ucode*"
-FILES:${PN}-iwlwifi-7260   = "${nonarch_base_libdir}/firmware/iwlwifi-7260-*.ucode*"
-FILES:${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.ucode*"
-FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode*"
-FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode*"
-FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode*"
-FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode*"
-FILES:${PN}-iwlwifi-9260   = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode*"
+FILES:${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-135-6.ucode*"
+FILES:${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-7.ucode*"
+FILES:${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-8.ucode*"
+FILES:${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-9.ucode*"
+FILES:${PN}-iwlwifi-3160-10 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-10.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-10.ucode*"
+FILES:${PN}-iwlwifi-3160-12 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-12.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-12.ucode*"
+FILES:${PN}-iwlwifi-3160-13 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-13.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-13.ucode*"
+FILES:${PN}-iwlwifi-3160-16 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-16.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-16.ucode*"
+FILES:${PN}-iwlwifi-3160-17 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-17.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-3160-17.ucode*"
+FILES:${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6000-4.ucode*"
+FILES:${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6000g2a-5.ucode*"
+FILES:${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6000g2a-6.ucode*"
+FILES:${PN}-iwlwifi-6000g2b-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-5.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6000g2b-5.ucode*"
+FILES:${PN}-iwlwifi-6000g2b-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-6.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6000g2b-6.ucode*"
+FILES:${PN}-iwlwifi-6050-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-4.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6050-4.ucode*"
+FILES:${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-6050-5.ucode*"
+FILES:${PN}-iwlwifi-7260   = "${nonarch_base_libdir}/firmware/iwlwifi-7260-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-7260-*.ucode*"
+FILES:${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-7265-*.ucode*"
+FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-7265D-*.ucode*"
+FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-8000C-*.ucode*"
+FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-8265-*.ucode*"
+FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-9000-*.ucode*"
+FILES:${PN}-iwlwifi-9260   = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-9260-*.ucode*"
 FILES:${PN}-iwlwifi-misc   = " \
-    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode* \
-    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm* \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-*.ucode* \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-*.pnvm* \
 "
 
 RDEPENDS:${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
@@ -1903,7 +1903,7 @@ RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 LICENSE:${PN}-qat         = "Firmware-qat"
 LICENSE:${PN}-qat-license = "Firmware-qat"
 FILES:${PN}-qat-license   = "${nonarch_base_libdir}/firmware/LICENCE.qat_firmware"
-FILES:${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin*"
+FILES:${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin* ${nonarch_base_libdir}/firmware/intel/qat/qat*.bin*"
 RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 
 LICENSE:${PN}-qed         = "WHENCE"
-- 
2.17.1


