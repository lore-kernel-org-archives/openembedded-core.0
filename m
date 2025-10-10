Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7146CCD18A
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 16:08:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.109.1760112523544309073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 09:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f19GUC8Z;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AG8gYQ281048
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760112522;
	bh=XiGHXT66E0lbAGl/WjOO18qnUIW67EKgYFEJSV06lwE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=f19GUC8Zk33X3zreqNzDFiEfU5EoojGr2TzMZmYmemabHeihP4h4Gz1D++KNMgsXo
	 FG+DTMezDve0pGqixt5AW+yymuMp2O8KH3NvhVkSep8ulAb9RaeWPKfOd+fGbtZt3t
	 x2FOD/5JjnYx6R1S6EwTob1DNwbHRw1jBdVkaTEk=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AG8gvL1791077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:08:42 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 11:08:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 11:08:42 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AG8gpa2128853
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:08:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v7Ffe-0007Tv-Ao
	for openembedded-core@lists.openembedded.org; Fri, 10 Oct 2025 11:08:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v3 2/3] linux-firmware: Remove unlicensed firmware
Date: Fri, 10 Oct 2025 11:08:41 -0500
Message-ID: <20251010160842.28715-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251010160842.28715-1-reatmon@ti.com>
References: <20251010160842.28715-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224698

Create a new REMOVE_UNLICENSED variable and do_install() logic to
allow for marking certain firmware files as something to remove and not
package up.

This comes from the fact that the WHENCE file has a number of firmware
entries that have no license information or very questionable
declarations as to what the license is for the firmware.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Split single patch into three patches.
v2: Fix dash vs bash error in new do_install() code.

.../linux-firmware/linux-firmware_20250917.bb | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index a2e505bd93..4efdc73a45 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -5,6 +5,57 @@ that contains firmware binary blobs necessary for partial or full functionality
 of certain hardware devices."
 SECTION = "kernel"
 
+REMOVE_UNLICENSED = ""
+
+# For acenic - Alteon AceNIC Gigabit Ethernet card
+REMOVE_UNLICENSED += "acenic/tg1.bin acenic/tg2.bin"
+
+# For emi62 - EMI 6|2m USB Audio interface
+REMOVE_UNLICENSED += "emi62/bitstream.fw emi62/loader.fw emi62/midi.fw emi62/spdif.fw"
+
+# For snd-maestro3 - ESS Allegro Maestro3 audio device
+REMOVE_UNLICENSED += "ess/maestro3_assp_kernel.fw ess/maestro3_assp_minisrc.fw"
+
+# For s2255drv
+REMOVE_UNLICENSED += "f2255usb.bin"
+
+# For snd-korg1212 - Korg 1212 IO audio device
+REMOVE_UNLICENSED += "korg/k1212.dsp"
+
+# For lgs8gxx - Legend Silicon GB20600 demodulator driver
+REMOVE_UNLICENSED += "lgs8g75.fw"
+
+# For ti_usb_3410_5052 - Multi-Tech USB cell modems
+REMOVE_UNLICENSED += "mts_cdma.fw mts_gsm.fw mts_edge.fw mts_mt9234mu.fw mts_mt9234zba.fw"
+
+# For myri_sbus - MyriCOM Gigabit Ethernet
+REMOVE_UNLICENSED += "myricom/lanai.bin"
+
+# For qlogicpti - PTI Qlogic, ISP Driver
+REMOVE_UNLICENSED += "qlogic/isp1000.bin"
+
+# For cassini - Sun Cassini
+REMOVE_UNLICENSED += "sun/cassini.bin"
+
+# For dvb-ttusb-budget - Technotrend/Hauppauge Nova-USB devices
+REMOVE_UNLICENSED += "ttusb-budget/dspbootcode.bin"
+
+# For ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
+REMOVE_UNLICENSED += "ueagle-atm/930-fpga.bin ueagle-atm/CMVeiWO.bin ueagle-atm/CMVepFR10.bin ueagle-atm/DSP9p.bin ueagle-atm/eagleIII.fw ueagle-atm/adi930.fw ueagle-atm/CMVep.bin ueagle-atm/CMVepFR.bin ueagle-atm/DSPei.bin ueagle-atm/CMV9i.bin ueagle-atm/CMVepES03.bin ueagle-atm/CMVepIT.bin ueagle-atm/DSPep.bin ueagle-atm/CMV9p.bin ueagle-atm/CMVepES.bin ueagle-atm/CMVepWO.bin ueagle-atm/eagleI.fw ueagle-atm/CMVei.bin ueagle-atm/CMVepFR04.bin ueagle-atm/DSP9i.bin ueagle-atm/eagleII.fw"
+
+# For vicam - USB 3com HomeConnect (aka vicam)
+REMOVE_UNLICENSED += "vicam/firmware.fw"
+
+# For yam - YAM driver for AX.25
+REMOVE_UNLICENSED += "yam/1200.bin yam/9600.bin"
+
+# For snd-wavefront - ISA WaveFront sound card
+REMOVE_UNLICENSED += "yamaha/yss225_registers.bin"
+
+# For snd-ymfpci - Yamaha YMF724/740/744/754 audio devices
+REMOVE_UNLICENSED += "yamaha/ds1_ctrl.fw yamaha/ds1_dsp.fw yamaha/ds1e_ctrl.fw"
+
+
 LICENSE = "\
     Firmware-Abilis \
     & Firmware-adsp_sst \
@@ -429,6 +480,21 @@ do_install() {
         fi
         cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
         cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
+
+        # Remove all unlicensed firmware
+        for file in ${REMOVE_UNLICENSED}; do
+                echo "Remove unlicensed firmware: $file"
+                rm ${D}${nonarch_base_libdir}/firmware/$file
+                path_to_file=$(dirname $file)
+                while [ "${path_to_file}" != "." ]; do
+                        num_files=$(ls -A1 ${D}${nonarch_base_libdir}/firmware/$path_to_file | wc -l)
+                        if [ "$num_files" = "0" ]; then
+                                echo "Remove empty dir: $path_to_file"
+                                rm -rf ${D}${nonarch_base_libdir}/firmware/$path_to_file
+                        fi
+                        path_to_file=$(dirname $path_to_file)
+                done
+        done
 }
 
 PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
-- 
2.17.1


