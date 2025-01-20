Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8998EC02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 15:46:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.39321.1737387972523358614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 07:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRSNapih;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43621d27adeso31372175e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 07:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387970; x=1737992770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7QLXZvM0MSLRLbaXLvFoNgtP619zguU2lTRpI9UM34=;
        b=cRSNapihzXAaeunm4dZo4FPNPD6wubJ9AqyRy6J7us1kmDpMKUsPtrnlsTrzXRQqha
         1108UVP9/IfqG7yptdt6qk+zFB1cN19jRLmOKa8NPxknDcClHVsprC0bbT9TEenkotUk
         hovEumy4qc5SALu63sHuPlCdR8/DfpquBziMA2F36DnPlXtuXJMoWpqfo+JyFM76bzXo
         LGnG/xU+BHfvTXjsMUe2YbyJZ3/pbsgzNBUdjbFd4RPxWxp1WXCcAIi3B6jSfRggIPWL
         BLUts+28UaTqFMK+ueOlko+aMMoL8ZRzwFXOLqhHpTpbSuSVSc7vWNwaoot+1OP3zWBb
         hrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387970; x=1737992770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7QLXZvM0MSLRLbaXLvFoNgtP619zguU2lTRpI9UM34=;
        b=aONuwnfr/+XUsivAjahME8jNAnkQjgY1m8QnDXx6fBwOelxfgeWdqxsfGUYQnSWdDI
         gC924pfxVzQRSo0GZ20WxMGmgPhXVXFP1eVlF9oubDQWlrpu/Ojc+Bp//Td0XqaRKNsL
         +897Vdvw5d4BaDYwn9NduCT6ST4pLYdQaOiGhx5JOmR+SzMzjJYQDEwiKfUNTrnNk3zn
         CrsERvst7whUAx3rG4cr9INwKcAkfOD/akObSUdXO4+Z3868quyyxYVXUmdN/xcKxg9l
         2Lkc5wOTAlWeaLV2COLPWE26sHdOsOZMg6YMLzWI37h5sdeT1LYBaKrM6nMiQPx4MOH/
         BZyg==
X-Gm-Message-State: AOJu0Ywstty2m5TCuBleEOM1qaBRX1L0xTGVZrtPTD8eUwg3p1uMiXyw
	jLIDVrSfEV3u94vDIIYpUiPIBAb0NMJ95lA3wzLjf5ft0jo8cAmmoXsADQ==
X-Gm-Gg: ASbGncsRrM/kCSvwJzVsaCfFHEvdv9slWNtVSBBRAbc7FQxbHCxDlY9NjMVNMz1+s1Z
	LkuCpgMnhr05T6SQ+ld2Wpc2pxLM1sy4i3WQjEPinwkDbipjiGD2vmpIIUE8jDSkILE35hLgogV
	ciUW+S9dFOZXsQ1jT9Fq+1jGO0NbSZX3EJ6V9XfvAgmm5K/KIe6uWjVQY3YMqPZ+/3xRzTT7xHX
	hqZsREiQMEkGKezAw2HdEHmtAtvAR907fEVF4rX0PUm4TsM9+t9aoUXSxH1MvWX16xQtstXeD/a
	bKcYZMoZ3qfmvx0xbh9OPf4jLTMWTMpugxJRTIXO+eaZEcx7wzKvNDxkz5S5jPKkCfWJxJR90cS
	OWIUdHd4mfvW3z+pnRQ==
X-Google-Smtp-Source: AGHT+IGlqcsFn6n9V0uKFLvDpfTGSDhAadweBQbbGiEzb4J+mgxu1F0EL1Mh6xS+LOp+6PA6ly6MYA==
X-Received: by 2002:a05:600c:4ed4:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-438913c8604mr123436655e9.3.1737387969912;
        Mon, 20 Jan 2025 07:46:09 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438904131f5sm141078725e9.11.2025.01.20.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:09 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH 1/3] linux-firmware: split ath10k firmwares in separate packages
Date: Mon, 20 Jan 2025 10:46:03 -0500
Message-Id: <20250120154605.3023068-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 15:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210040

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for ath10k based chips:

- linux-firmware-ath10k-qca4019
- linux-firmware-ath10k-qca6174
- linux-firmware-ath10k-qca9377
- linux-firmware-ath10k-qca9887
- linux-firmware-ath10k-qca9888
- linux-firmware-ath10k-qca988x
- linux-firmware-ath10k-qca9984
- linux-firmware-ath10k-qca99x0
- linux-firmware-ath10k-misc: catches all firmwares that are not
  already included in the other -ath10k- packages (currently empty).

linux-firmware-ath10k is now a meta package that depends on all of the
split-out ath10k packages.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../linux-firmware/linux-firmware_20241210.bb | 56 ++++++++++++++++---
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index d3757b5bbc..7b53712cbe 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -343,7 +343,17 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-carl9170 \
              ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
              ${PN}-ar3k-license ${PN}-ar3k \
-             ${PN}-ath10k-license ${PN}-ath10k-wcn3990 ${PN}-ath10k \
+             ${PN}-ath10k-license ${PN}-ath10k \
+             ${PN}-ath10k-qca4019 \
+             ${PN}-ath10k-qca6174 \
+             ${PN}-ath10k-qca9377 \
+             ${PN}-ath10k-qca9887 \
+             ${PN}-ath10k-qca9888 \
+             ${PN}-ath10k-qca988x \
+             ${PN}-ath10k-qca9984 \
+             ${PN}-ath10k-qca99x0 \
+             ${PN}-ath10k-wcn3990 \
+             ${PN}-ath10k-misc \
              ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
@@ -505,7 +515,16 @@ LICENSE:${PN}-carl9170 = "GPL-2.0-or-later"
 LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca4019 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca6174 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9377 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9887 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9888 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca988x = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9984 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca99x0 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-wcn3990 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-misc    = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
@@ -515,12 +534,21 @@ FILES:${PN}-ar3k = " \
 "
 
 FILES:${PN}-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
-FILES:${PN}-ath10k = " \
-  ${nonarch_base_libdir}/firmware/ath10k \
-"
-FILES:${PN}-ath10k-wcn3990 = " \
-  ${nonarch_base_libdir}/firmware/ath10k/WCN3990 \
-"
+FILES:${PN}-ath10k-qca4019 = "${nonarch_base_libdir}/firmware/ath10k/QCA4019"
+FILES:${PN}-ath10k-qca6174 = "${nonarch_base_libdir}/firmware/ath10k/QCA6174"
+FILES:${PN}-ath10k-qca9377 = "${nonarch_base_libdir}/firmware/ath10k/QCA9377"
+FILES:${PN}-ath10k-qca9887 = "${nonarch_base_libdir}/firmware/ath10k/QCA9887"
+FILES:${PN}-ath10k-qca9888 = "${nonarch_base_libdir}/firmware/ath10k/QCA9888"
+FILES:${PN}-ath10k-qca988x = "${nonarch_base_libdir}/firmware/ath10k/QCA988X"
+FILES:${PN}-ath10k-qca9984 = "${nonarch_base_libdir}/firmware/ath10k/QCA9984"
+FILES:${PN}-ath10k-qca99x0 = "${nonarch_base_libdir}/firmware/ath10k/QCA99X0"
+FILES:${PN}-ath10k-wcn3990 = "${nonarch_base_libdir}/firmware/ath10k/WCN3990"
+FILES:${PN}-ath10k-misc = "${nonarch_base_libdir}/firmware/ath10k/*"
+# -ath10k is a virtual package that depends upon all ath10k packages.
+ALLOW_EMPTY:${PN}-ath10k = "1"
+# -ath10k-misc is a catch all package that includes all the ath10k
+# firmwares that are not already included in other -ath10k- packages.
+ALLOW_EMPTY:${PN}-ath10k-misc = "1"
 
 FILES:${PN}-ath11k = " \
   ${nonarch_base_libdir}/firmware/ath11k \
@@ -536,8 +564,16 @@ FILES:${PN}-qca = " \
 
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
-RDEPENDS:${PN}-ath10k += "${PN}-ath10k-wcn3990"
+RDEPENDS:${PN}-ath10k-qca4019 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca6174 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9377 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9887 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9888 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca988x += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9984 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca99x0 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-wcn3990 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
@@ -1694,6 +1730,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware depend on all of the split-out packages.
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
+# Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RRECOMMENDS:linux-firmware', ' ' + ' '.join(firmware_pkgs))
@@ -1703,6 +1740,9 @@ python populate_packages:prepend () {
 
     ibt_pkgs = filter(lambda x: x.find('-ibt-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ibt', ' ' + ' '.join(ibt_pkgs))
+
+    ath10k_pkgs = filter(lambda x: x.find('-ath10k-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-ath10k', ' ' + ' '.join(ath10k_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.34.1


