Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A47BC3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:02 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.33420.1743020997338214132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0bPn2gS;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22423adf751so5809705ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020996; x=1743625796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNk2ph1rv2UiPhhzjg3qKubcriZPaFBe4ba83j+QNMA=;
        b=E0bPn2gSfRi0/k8vyttL+H98+YUHTUX4NtvqBdUDgGYkifzYeRH8PjaL6M8qpW5xs9
         iSjre0tbBbQwjMg2hLvMiMvGeFIhbmz8YhKv3gIeommfo+AXHK50RTZPjEK8QB/T/MuJ
         eJN7BiujZDY1gLBgR3Y3jEhEnvGtejYQL6P2NHJ5so9hKw4TEgZACaYPk545nNAHa4B2
         vFyaG/n7AxROR1WQhnu+sicZcLe/A6l34ymrwrD4Vm+NZP5N3volLVsj5N1nYJO7QNMd
         1mdJg1Ho+Y04ed2Ok5mWXmWIxc9MwvCgpky50WpZ3WWpGQOCfVehsfeE+3j+Ewozd90X
         Ls9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020996; x=1743625796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNk2ph1rv2UiPhhzjg3qKubcriZPaFBe4ba83j+QNMA=;
        b=Y4udpnqHcW8suQCXese7CAclSKdYSV2ICdwAPLfSPCqpaVafCDc/1EAztDeU96w9Oj
         MDDBd8eDFZQqqBpuDK8cL7z/3238AFbl2Tec608jt3wZGDgNnA6oFvykzix+0sPgQBOp
         lnhr/o6p89uqTHrlVAyQEFSMAXu014oQ9NQTJ4IcgHUmo8jxZ92gpRLKTYBHYA0+J7GV
         4ZgnaXLqhukSTRmSUTZJpcRzTiawrA9ectFSoMiQhGOXY9tw0HEhQS2nFBdpAUL8zbWD
         JzwNllBKl9/pQSrU4JBe7M5rD/CZsOrrMbcdOpAbRpyzWfhGLFkTiZ8/AHY/dH1JgCVv
         ywqA==
X-Gm-Message-State: AOJu0YwpBK4PL/dpx8nJcRKb0V+CLizr26Wl2JTrpndu1gAoUtGl5+cR
	mPlKAub2F+ClXXlt0E19IRYT87H8x/VQD0B4ANqcWIFiSp8jyH3nm4+HMSBF
X-Gm-Gg: ASbGncunbQqH+PtAQ6pEV3mNs4DASfZEs/DLhWfM0eQDF/pbeZqeMTGASWQlC4JAN1F
	ZTFtXrzVcbUB/lvsmelhH7kXB3gADO/UxWDd4DkgGbtsy0AjEuQzKvGq/Y0Vrb0nYJDcWXucisy
	axhws6aYXx130j+yfFagh5iai7tg2HDcHYQPPhf5g2g/BZ2i0f4guGCYEpHKmKjlxr2EPs0cv9r
	zNboqBqcwCCuKFKBNaXBRfHJcg16kGMgPxPRloe/Al+6YSw4XG+jAaTutstOp4JtL1qg4eLKNE9
	I4u5AsbSUb9vs/9Qz69Til0uu1qRP3Dtu5mPb6+gzTXrgAQ+uymCr77LzH74w+HMfUI=
X-Google-Smtp-Source: AGHT+IGsVgB94elm3WepvQRFJwhIvlupypNGpR9Qkj1yJAFrf16BTr03HYLfaUvoBcxCxMjyEE6QNg==
X-Received: by 2002:a17:90b:53d0:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-303a916a704mr1557243a91.33.1743020996381;
        Wed, 26 Mar 2025 13:29:56 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:55 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marc Ferland <marc.ferland@sonatest.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 20/31] linux-firmware: split ath12k firmwares in separate packages
Date: Wed, 26 Mar 2025 17:28:06 -0300
Message-Id: <20250326202817.64437-21-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213680

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for ath12k based chips:

- linux-firmware-ath12k-qcn9274
- linux-firmware-ath12k-wcn7850
- linux-firmware-ath12k-misc: catches all firmwares that are not
  already included in the other -ath12k- packages (currently empty).

linux-firmware-ath12k is now a meta package that depends on all of the
split-out ath11k packages.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c35c99c60f1aad5757de0cd754c0d15aa622122a)
---
 .../linux-firmware/linux-firmware_20250109.bb | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index 6380a5303c41..d2c0c7c1fdcb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -393,7 +393,11 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
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
@@ -575,6 +579,10 @@ LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-misc    = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
@@ -614,9 +622,14 @@ ALLOW_EMPTY:${PN}-ath11k = "1"
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
@@ -645,6 +658,9 @@ RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
@@ -1895,6 +1911,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
+# Make linux-firmware-ath12k depend on all of the split-out ath12k packages.
 # Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
@@ -1912,6 +1929,9 @@ python populate_packages:prepend () {
     ath11k_pkgs = filter(lambda x: x.find('-ath11k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath11k', ' ' + ' '.join(ath11k_pkgs))
 
+    ath12k_pkgs = filter(lambda x: x.find('-ath12k-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-ath12k', ' ' + ' '.join(ath12k_pkgs))
+
     amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
 }
-- 
2.39.5


