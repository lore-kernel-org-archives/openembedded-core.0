Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782DEC0218A
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 16:25:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.55944.1737995093428196342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 08:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hob4bxcc;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43635796b48so29922315e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737995091; x=1738599891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLtu3SamU9IlTyjwVaZxlxx34jrWeber6260y/WWmQM=;
        b=Hob4bxccGa1H4MgtP08vJxlSrPDtom5G9u9n3bTWlhf8I18D51eKifokA8dZH1uskG
         Xd03VNM6B7aAPIovsm8oyTBSz7lNtNIAkCXdHHiJbZKIXNv0hoqWQvDFTnULTkXzOyNL
         fPSyG9q8Opjs4loZ2Wide3Xd1FtqFrJ+AYpliBn18FPGi4kFrLukctWs2BzxJi++n4Rk
         q0PE97mtPOFeV4b4TNXJPzHbpW2w0KDRBON4s679eW8Fn7mLF+KzvCnH+BuqpnTxWn8O
         M+rZyRYyRKaQDDou4hDvoU15dRYdw+geYciTAOgVvYI01LhWrIPE8qE7C+YpVJhIJjSC
         57DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995091; x=1738599891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLtu3SamU9IlTyjwVaZxlxx34jrWeber6260y/WWmQM=;
        b=abCseEMdAzIMk7ku3FY2EK9kT46jcRe0vgVZ2JmjXZFU/WA1sS70tbZ4QakRD+ouCk
         8hJgtk39nvDIuRWNSJV2oVuxv+is/61fUVLO8FExNiH7998DrC94tuBxqyNJdQlLqQJk
         3KTQ2gKAZ21dxc/pglBwBDvjKoaRjWziLsv10uzyhqd5kA1ryErSzw96AkLbi9wP2gbi
         LhWw5L/pbJvGu9ITsdTG6Qzz3o5bwrdhl6nj+cmWGzMB2PwFwZd6t3ECIgIJvp+K0lsf
         qtFo3i7x2POtLoCMaN3laPjpXqhdnSdt0Rr5QY2eLZP6IWwr+S5EP9uM1OzxN3+mrkSJ
         AcWQ==
X-Gm-Message-State: AOJu0YydwH+n8J0nk3fUTxezDQRyx7eHBXduy0IElhBOendypc302Qdg
	BGcVAeRi1uMtnSbvx60AgCwuxnrmzI5km44XisNqYvsQzi0SXvaH6o1jmA==
X-Gm-Gg: ASbGncuxstYqVcxVzh2OGB6GUZohasJRf2blCVsEp7RbyilRaxADs0lj+JgCg4Fxryt
	fAihHW3Lucptk0dEXaiMKKMlKX/M+BnATExGG9h5gJX9czeCrIYOJaTFA9P+7JWxB5/RdJIpvfC
	UYsEirLErlN1NnYZeauxeqv00lyKuiZPW9jP0g0lbmZds24oxH4s1m/GcsDernfQwiqNLnINHcl
	xiceyTPPFzTvZ59W7ooYmh/SUCfktjVKlwKy30mD18VWItaAaXZhp3TBRW1jYKQndW46oU59rb5
	haJ/4ubHbL3ntsms34JFUpfw5n2yssIj/80GtXgQrqna2dJ6nBIjdNC4p+jCk0VLljGvZvp8chz
	RUWbGtSk7T+cLniOnDx0I47FXLYVc
X-Google-Smtp-Source: AGHT+IHNJ4lBP80hsbtBUEmYbBrPSXXwFkB3XWBrnywvKdYTswbygtwFWKSSnZqWhoT37h3vWb8u3g==
X-Received: by 2002:a05:600c:6d46:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-438bcfd440dmr110738085e9.0.1737995090717;
        Mon, 27 Jan 2025 08:24:50 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa599sm143599875e9.7.2025.01.27.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 08:24:50 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH 1/2] linux-firmware: split ath12k firmwares in separate packages
Date: Mon, 27 Jan 2025 11:24:39 -0500
Message-Id: <20250127162440.3869759-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 16:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210304

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for ath12k based chips:

- linux-firmware-ath12k-qcn9274
- linux-firmware-ath12k-wcn7850
- linux-firmware-ath12k-misc: catches all firmwares that are not
  already included in the other -ath12k- packages (currently empty).

linux-firmware-ath12k is now a meta package that depends on all of the
split-out ath11k packages.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../linux-firmware/linux-firmware_20241210.bb | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index 242a698667..78bf13d878 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -390,7 +390,11 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath11k-wcn6750 \
              ${PN}-ath11k-wcn6855 \
              ${PN}-ath11k-misc \
-             ${PN}-ath12k ${PN}-qca \
+             ${PN}-ath12k \
+             ${PN}-ath12k-qcn9274 \
+             ${PN}-ath12k-wcn7850 \
+             ${PN}-ath12k-misc \
+             ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -572,6 +576,10 @@ LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-misc    = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
@@ -611,9 +619,14 @@ ALLOW_EMPTY:${PN}-ath11k = "1"
 # firmwares that are not already included in other -ath11k- packages.
 ALLOW_EMPTY:${PN}-ath11k-misc = "1"
 
-FILES:${PN}-ath12k = " \
-  ${nonarch_base_libdir}/firmware/ath12k \
-"
+FILES:${PN}-ath12k-qcn9274 = "${nonarch_base_libdir}/firmware/ath12k/QCN9274"
+FILES:${PN}-ath12k-wcn7850 = "${nonarch_base_libdir}/firmware/ath12k/WCN7850"
+FILES:${PN}-ath12k-misc = "${nonarch_base_libdir}/firmware/ath12k/*"
+# -ath12k is a virtual package that depends upon all ath12k packages.
+ALLOW_EMPTY:${PN}-ath12k = "1"
+# -ath12k-misc is a catch all package that includes all the ath12k
+# firmwares that are not already included in other -ath12k- packages.
+ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
 FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
@@ -642,6 +655,9 @@ RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
@@ -1892,6 +1908,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
+# Make linux-firmware-ath12k depend on all of the split-out ath12k packages.
 # Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
@@ -1909,6 +1926,9 @@ python populate_packages:prepend () {
     ath11k_pkgs = filter(lambda x: x.find('-ath11k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath11k', ' ' + ' '.join(ath11k_pkgs))
 
+    ath12k_pkgs = filter(lambda x: x.find('-ath12k-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-ath12k', ' ' + ' '.join(ath12k_pkgs))
+
     amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
 }
-- 
2.34.1


