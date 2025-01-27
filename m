Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2B0C0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 16:25:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.55952.1737995108754679695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 08:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ei1oz4dt;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso30570765e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737995107; x=1738599907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+548KKDyADlgrL7ZSJlmAkZovFhfnZchUs52gz5XLmw=;
        b=Ei1oz4dtUmBq0rOmLokz00S3pgAaj/pySVDR+/6HljqnuFi/+84ZjfbRZ0cl/BZaF+
         zfXrxgwUgTynqqTldQtSonBkiJ7dY4GTVQWhwZzqokKODgmuFnQGysM2C7lLVKFPm7pd
         mEKiNfPCCqiYdwp/ZY+3drI//Los+eCNEvQ/pN1RVSecl+2e5rEq2XugV36gHXhj5rTI
         WpXmwjLtCZEHRWD7OnZSIPYQwPKK8XXMr3rLZboOmCcweiieli6V0/hRtp+jYI6ehsr9
         cQkFu31kFUiHM60Yjbt27GMF/GoznvOKZ+LbVZIC9nL85Cj2bBxVerXrZSrub5Ba+up5
         yqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995107; x=1738599907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+548KKDyADlgrL7ZSJlmAkZovFhfnZchUs52gz5XLmw=;
        b=e+M1almOGK9a3CarwKjiL9WSQ952gO05cTrL603/NELT+yAMdzXnkhuBRgIG/TX3/g
         NCvmmJ5UPnrB0mjG5XuUck1detNRZj5Foyv2rumIK1uhBp6MWNMfTLzoJzES3KOGZJm5
         kohSv+jS570aWAlf9QMjiEMlUD+HVea/4ZnEoS3IMn7kUEW2q4ysh35eQ/ovwNMlToOh
         hGLoUgSY1sMJPNB3NNfvA/0y+0aySV7duDI97siCbebygZ/Eo5Pe9w+OJ+ljpQlA7Pkj
         cQbOQYwV1MEK9ovVBfXCeis2aOan/3bJf9Zd5aoQK1MxSaJqBSx/7kFtbVQyqFj6YUtr
         TUYw==
X-Gm-Message-State: AOJu0YxS/PvN9o2ZTfOKGQoHn+29Evc/mv3XufPJpNHoPQCq+07U2DHg
	Bef16bxXO79PLRX93QZw3oM8H9QV4Nt8eB7R/xBKrrLfW7VVHI4bXrbWRw==
X-Gm-Gg: ASbGncu30xcn/J3PGN4SRUfb9rhFprUSEVQno7dP1XTWCEx68vs31WPBPgs4Ho8grAW
	YSdxjjEqBwHW9go1SXQaIs6vAn31K56PZ+KrZ/BgKIkD8EMjdTROTznsLrKKRVxTqMfibspEdb7
	1Biv2xWmGw6gMGb+3eJ84wtwnEgiusGOofz1BlIrpYjA3C77Uu/0ks168qte2rgbH6PkMXv12eZ
	CwFsXNV2J4MyXucevB6VoWr5ya6v3wA7yXSgPeOsnkcc/KU6JD0l8gpgX6/1lughYyB2ZmMNEhg
	/hvkWjILaiPKqW4FGlMtySLyTaD87HhFuJaurXcE9Z+LaWinLtTEPmcph2nswtbEoZ01MgVOZ/u
	96KlyxwJKqSZRtbo2Z4IqQ2hU6Nh3rZOZNXIvBc4=
X-Google-Smtp-Source: AGHT+IGYG+RD4mBwTrBEDgX3taa33BsZTP9KrCf/JXZhgX/T8teQLBaFc59DKG1qSKed0kDfL/HjPw==
X-Received: by 2002:a05:600c:1c93:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-43891429c77mr353054625e9.24.1737995106602;
        Mon, 27 Jan 2025 08:25:06 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa599sm143599875e9.7.2025.01.27.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 08:25:06 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH 2/2] linux-firmware: split qca firmwares in separate packages
Date: Mon, 27 Jan 2025 11:24:40 -0500
Message-Id: <20250127162440.3869759-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127162440.3869759-1-marc.ferland@sonatest.com>
References: <20250127162440.3869759-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 16:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210305

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for firmwares under qca/:

- linux-firmware-qca-qca61x4
- linux-firmware-qca-wcn3988
- linux-firmware-qca-wcn399x
- linux-firmware-qca-wcn6750
- linux-firmware-qca-qca2066
- linux-firmware-qca-wcn7850
- linux-firmware-qca-misc: catches all firmwares that are not already
  included in the other -qca- packages (currently empty).

linux-firmware-qca is now a meta package that depends on all of the
split-out qca packages.

Note: Content of the FILES:${PN}-qca* variables taken from WHENCE.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../linux-firmware/linux-firmware_20241210.bb | 142 +++++++++++++++++-
 1 file changed, 136 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index 78bf13d878..79c273063e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -395,6 +395,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-wcn7850 \
              ${PN}-ath12k-misc \
              ${PN}-qca \
+             ${PN}-qca-qca61x4 \
+             ${PN}-qca-wcn3988 \
+             ${PN}-qca-wcn399x \
+             ${PN}-qca-wcn6750 \
+             ${PN}-qca-qca2066 \
+             ${PN}-qca-wcn7850 \
+             ${PN}-qca-misc \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -580,7 +587,13 @@ LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
+LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
+LICENSE:${PN}-qca-misc = "Firmware-qualcommAthos_ath10k & Firmware-qcom"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES:${PN}-ar3k = " \
@@ -628,9 +641,116 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
 # firmwares that are not already included in other -ath12k- packages.
 ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
-FILES:${PN}-qca = " \
-  ${nonarch_base_libdir}/firmware/qca \
-"
+FILES:${PN}-qca-qca61x4 = " \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000201.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000300.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00130300.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00130302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00230302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000200.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000201.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000300.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00130300.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00130302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00230302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00440302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00440302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
+  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
+  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0105.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0106.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0107.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0109.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0110.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130201.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010a.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010b.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_0303.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010a.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010b.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_0303.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00190200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
+"
+FILES:${PN}-qca-wcn3988 = " \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
+  ${nonarch_base_libdir}/firmware/qca/apnv10.bin \
+  ${nonarch_base_libdir}/firmware/qca/apnv11.bin \
+"
+FILES:${PN}-qca-wcn399x = " \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv \
+  ${nonarch_base_libdir}/firmware/qca/crnv21.bin \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv \
+  ${nonarch_base_libdir}/firmware/qca/crnv32.bin \
+  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin \
+"
+FILES:${PN}-qca-wcn6750 = " \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.bin \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b09 \
+"
+FILES:${PN}-qca-qca2066 = " \
+  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.301 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.302 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.309 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111 \
+"
+FILES:${PN}-qca-wcn7850 = " \
+  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112 \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin \
+"
+FILES:${PN}-qca-misc = "${nonarch_base_libdir}/firmware/qca/*"
+# -qca is a virtual package that depends upon all qca packages.
+ALLOW_EMPTY:${PN}-qca = "1"
+# -qca-misc is a catch all package that includes all the qca
+# firmwares that are not already included in other -qca- packages.
+ALLOW_EMPTY:${PN}-qca-misc = "1"
+
 
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
@@ -658,8 +778,14 @@ RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
-RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
-
+RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
+RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
+RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
+RDEPENDS:${PN}-qca-misc += "${PN}-ath10k-license ${PN}-qcom-license"
 # For ralink
 LICENSE:${PN}-ralink = "Firmware-ralink-firmware"
 LICENSE:${PN}-ralink-license = "Firmware-ralink-firmware"
@@ -1909,6 +2035,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
 # Make linux-firmware-ath12k depend on all of the split-out ath12k packages.
+# Make linux-firmware-qca depend on all of the split-out qca packages.
 # Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
@@ -1929,6 +2056,9 @@ python populate_packages:prepend () {
     ath12k_pkgs = filter(lambda x: x.find('-ath12k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath12k', ' ' + ' '.join(ath12k_pkgs))
 
+    qca_pkgs = filter(lambda x: x.find('-qca-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-qca', ' ' + ' '.join(qca_pkgs))
+
     amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
 }
-- 
2.34.1


