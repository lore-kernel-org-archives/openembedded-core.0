Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229E9C36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:52 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.33368.1743020991896364573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eVYkBUBf;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso370260a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020991; x=1743625791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcf49NHgl+kh8SFhL2PhKUXyPUKwjux/8/Wo8m6yV+8=;
        b=eVYkBUBfrNWjVCj+UdrHxs4guwlZTOY1sX5Sm/uMRcW2t5Tjmnmd5DizwoKfwmwyjY
         I3ZmXsr2Xb9lD5qbRPVckMkzXc7lDTBt7QFofPsk3S4HF95SbfjGkXRWL7JXIORtRZl/
         ly+au6WLY39hd2Z3MrvnsQsD6/eQIrebWqg+A5vXXhSzE3c0lOqws9RxfCeF85BrvUa0
         KzWLlygVT/oPvwsVXI/ngda79/7ULm0yRfReWuRDa/JGCHvpGMunUkE7IS8ES5Pj6Tqv
         cZ4Tdpo0HEiMauWa35dQ8hs9Gmv6/WrIciYAwUrK43zsib0NNWJDLPOBsaPx9WZMpGBb
         iVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020991; x=1743625791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcf49NHgl+kh8SFhL2PhKUXyPUKwjux/8/Wo8m6yV+8=;
        b=GYjYGHRJj7a+BmlWA4awQXA5KhNOH4+IQdVkPMuqclVrwY/l2Q+X8jCF9FzN0bBDyL
         WGuFL/CxHdlSWoV0PsxkPAwWWapZVw0AyPI/oVJ1sbv09bvYZyC0aBnJohxQtsK7tB1y
         fXa5gXrEaBEce/0ELkpMgvVjPIZurUDMnv96NsWYgZMDHlqTtf0vykBI285Iqp7abdKi
         aHgCUmh/Qu3N763A13xJJmEO20JXcfHASk88H3+D9V8STxNknXokoeh/S/KbgGCQCH33
         76kdty7jztD8qRVkAiLDMSah5Go5dLQCtS3MD+Dd/jv7EyTH3hZJyOP3XHw0JPaMVgB1
         F6LA==
X-Gm-Message-State: AOJu0Yxx/6Rbw1Q4ffiFONcviwpdPOsdm6XitDOu/PP/xwUECG8fod2i
	CiCwvKbTI9aSHLjZ3W4yX2hhfW2/VdCITZWAtxySNJTaoIOjEd67G+FFPdUW
X-Gm-Gg: ASbGncsfmPWjQw4I66HTHCLQOxZg99LZUa6V1fTK+10KRe+S5jfP5wju6d4s/NyBPMb
	NyemXSw7+8K+5SqPveEaVUPfP+rf30LTzi4xYDvyRTXeG/1tMV1z9nLzsj9Ik9MqRKyL9E9SghE
	/gS/UkNwGnrFIhhHYu0BE2ceH74pCjCCGQvuuav5BrYcADfu+h29bMtdI16DMhTq8CdGayYwoWB
	my4/zuQk61E0u9Qxxb6xJ4lxcXgyb0+eX+l/d9RZ4cAEWrSZbxuWQwZj983oi99LENIQ2nnLfpH
	Mtp1IM8bBf5mGeXbFobekaaObx+LJUPeqOf5jsuWfUny5m9MZjNO1236EPusetn2XGM=
X-Google-Smtp-Source: AGHT+IEG9e+iF/3IyteXgNJPaEeI0bKq4XJk3ewFqUW5fNkrd1eLaNlPWAV/K0nwtU4d71ksjS/ruQ==
X-Received: by 2002:a17:90a:c88c:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-303a906c3fcmr1527950a91.27.1743020991082;
        Wed, 26 Mar 2025 13:29:51 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:50 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marc Ferland <marc.ferland@sonatest.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [styhead][PATCH v2 18/31] linux-firmware: split ath11k firmwares in separate packages
Date: Wed, 26 Mar 2025 17:28:04 -0300
Message-Id: <20250326202817.64437-19-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213678

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for ath11k based chips:

- linux-firmware-ath11k-ipq5018
- linux-firmware-ath11k-ipq6018
- linux-firmware-ath11k-ipq8074
- linux-firmware-ath11k-qca2066
- linux-firmware-ath11k-qca6390
- linux-firmware-ath11k-qcn9074
- linux-firmware-ath11k-wcn6750
- linux-firmware-ath11k-wcn6855
- linux-firmware-ath11k-misc: catches all firmwares that are not
  already included in the other -ath11k- packages (currently empty).

linux-firmware-ath11k is now a meta package that depends on all of the
split-out ath11k packages.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit 635f0cc49f91b79b1cee40e2825514d7ce474d32)
---
 .../linux-firmware/linux-firmware_20250109.bb | 52 +++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index da253219c0c5..8211bd1eb13f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -357,7 +357,17 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath10k-qca99x0 \
              ${PN}-ath10k-wcn3990 \
              ${PN}-ath10k-misc \
-             ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
+             ${PN}-ath11k \
+             ${PN}-ath11k-ipq5018 \
+             ${PN}-ath11k-ipq6018 \
+             ${PN}-ath11k-ipq8074 \
+             ${PN}-ath11k-qca2066 \
+             ${PN}-ath11k-qca6390 \
+             ${PN}-ath11k-qcn9074 \
+             ${PN}-ath11k-wcn6750 \
+             ${PN}-ath11k-wcn6855 \
+             ${PN}-ath11k-misc \
+             ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -529,6 +539,16 @@ LICENSE:${PN}-ath10k-qca99x0 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-wcn3990 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-misc    = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-ipq5018 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-ipq6018 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-ipq8074 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-qca2066 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-qca6390 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-misc    = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
@@ -553,9 +573,20 @@ ALLOW_EMPTY:${PN}-ath10k = "1"
 # firmwares that are not already included in other -ath10k- packages.
 ALLOW_EMPTY:${PN}-ath10k-misc = "1"
 
-FILES:${PN}-ath11k = " \
-  ${nonarch_base_libdir}/firmware/ath11k \
-"
+FILES:${PN}-ath11k-ipq5018 = "${nonarch_base_libdir}/firmware/ath11k/IPQ5018"
+FILES:${PN}-ath11k-ipq6018 = "${nonarch_base_libdir}/firmware/ath11k/IPQ6018"
+FILES:${PN}-ath11k-ipq8074 = "${nonarch_base_libdir}/firmware/ath11k/IPQ8074"
+FILES:${PN}-ath11k-qca2066 = "${nonarch_base_libdir}/firmware/ath11k/QCA2066"
+FILES:${PN}-ath11k-qca6390 = "${nonarch_base_libdir}/firmware/ath11k/QCA6390"
+FILES:${PN}-ath11k-qcn9074 = "${nonarch_base_libdir}/firmware/ath11k/QCN9074"
+FILES:${PN}-ath11k-wcn6750 = "${nonarch_base_libdir}/firmware/ath11k/WCN6750"
+FILES:${PN}-ath11k-wcn6855 = "${nonarch_base_libdir}/firmware/ath11k/WCN6855"
+FILES:${PN}-ath11k-misc = "${nonarch_base_libdir}/firmware/ath11k/*"
+# -ath11k is a virtual package that depends upon all ath11k packages.
+ALLOW_EMPTY:${PN}-ath11k = "1"
+# -ath11k-misc is a catch all package that includes all the ath11k
+# firmwares that are not already included in other -ath11k- packages.
+ALLOW_EMPTY:${PN}-ath11k-misc = "1"
 
 FILES:${PN}-ath12k = " \
   ${nonarch_base_libdir}/firmware/ath12k \
@@ -578,6 +609,15 @@ RDEPENDS:${PN}-ath10k-qca99x0 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-wcn3990 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-ipq5018 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-ipq6018 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-ipq8074 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-qca2066 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-qca6390 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-qcn9074 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
 
@@ -1734,6 +1774,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
+# Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RRECOMMENDS:linux-firmware', ' ' + ' '.join(firmware_pkgs))
@@ -1746,6 +1787,9 @@ python populate_packages:prepend () {
 
     ath10k_pkgs = filter(lambda x: x.find('-ath10k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath10k', ' ' + ' '.join(ath10k_pkgs))
+
+    ath11k_pkgs = filter(lambda x: x.find('-ath11k-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-ath11k', ' ' + ' '.join(ath11k_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.39.5


