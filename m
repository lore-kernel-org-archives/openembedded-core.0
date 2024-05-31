Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357B5C41513
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 11:55:16 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
 by mx.groups.io with SMTP id smtpd.web11.9663.1717156513908144511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 04:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VrM4c0rgxzB0;
	Fri, 31 May 2024 13:55:12 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VrM4b4z9xzsFZ;
	Fri, 31 May 2024 13:55:11 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 31 May 2024 13:53:56 +0200
Subject: [PATCH 1/3] linux-firmware: update to 20240513
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-panthor-v1-1-1a76fd752c1b@cherry.de>
References: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
In-Reply-To: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 11:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200065

From: Quentin Schulz <quentin.schulz@cherry.de>

Update the linux-firmware recipe to the most recent upstream tag.

LICENSE.amdgpu md5 checksum changed because they bumped the Copyright
year[1].

Some of qcom-sdm845-modem files got replaced by a symlink to their
counterpart in ath10k/WCN3990/hw1.0/. The same happened to files in
qcom-qcm2290-wifi, but to ath10k/WCN3990/hw1.0/qcm2290/. Finally,
qcom-qrb4210-wifi also got its file symlinked to
ath10k/WCN3990/hw1.0/qrb4210/ which in turn is a symlink to
ath10k/WCN3990/hw1.0/qcm2290/.[2] This meant that qrb4210-wifi now
RDEPENDS on qcm2290-wifi for the target of the links to be present when
installing it, and also that sdm845-modem and qcm2290-wifi packages have
to be before the ath10k catch-all package.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=9442c72e361c1e1130a19248598ad6ab5282ba09
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...ware_20240312.bb => linux-firmware_20240513.bb} | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
index 13538afede..026e5dba00 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
@@ -82,7 +82,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
+                    file://LICENSE.amdgpu;md5=1433dfea38c97a2e563a248a863dcb94 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
@@ -154,7 +154,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "514da1cd8b363373030f0c16749feb8d"
+WHENCE_CHKSUM  = "ae024b46fd393d199f66bbe1f3ff5254"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -241,7 +241,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "b2327a54ad1897c828008caf63af5ee15469ba723a5016be58f2b44f07bd4b94"
+SRC_URI[sha256sum] = "9f05edb99668135d37cedc4fdd18aac2802dc9e4566e086e6c6c2e321f3ecc4e"
 
 inherit allarch
 
@@ -322,6 +322,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
+             ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
@@ -384,13 +385,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem ${PN}-qcom-qcm2290-wifi  \
              ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
-             ${PN}-qcom-qrb4210-modem ${PN}-qcom-qrb4210-wifi  \
+             ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
-             ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
@@ -1419,12 +1420,12 @@ FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/m
 FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn"
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
-FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn"
+FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
-FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn"
+FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
@@ -1433,7 +1434,8 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp"
+FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp \
+                                 ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
@@ -1468,7 +1470,9 @@ RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license"
+# Only symlinks in qcom-qrb4210-wifi, firmware is in qcom-qcm2290-wifi
+# c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
+RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"

-- 
2.45.1


