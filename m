Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76076C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 15:46:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.39323.1737387974349037734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 07:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lGVNhlmk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd730so33146255e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387972; x=1737992772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yc9PB9qxPB6peJRasmMawo1CGcof9Toqwm4T+LrHvpw=;
        b=lGVNhlmkyjrv3SydL8/JU5KHn0CmKj2sj6q5AkN3xl3rRVn0NBo2YEAzwab5QzjqWN
         eEOEgnSoQyey9W817JZogDrgiNmyGBuvKnLVFigKivH/VzMKSErgUtz9Y/VNfeKINYZW
         5PuATsI84Y3TiOQhIWj9h/+57+wicU1Rp/eG89Ggo7kB+jQqCQeXO6UNkMpsUe/9+16A
         NjkHig7EI0LVB+Hn5HuSYK8ot1d3mKKVQ4enph6N6R2iWbaedoqZwyNWdtnrwFh+Fj37
         bsU+l0uXlHZ6I3jmFUxz6zlLqdtxJJLkKKXR8xZ9KKPUIv7PQNDXcXGOhq83pk08SPrD
         Yo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387972; x=1737992772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yc9PB9qxPB6peJRasmMawo1CGcof9Toqwm4T+LrHvpw=;
        b=DJU9P2X6A6DV2p4qjuWFwLw1Y0GOk/IqSPOOA63LZHWsuhXb3Ryj506KeHGMr57aAj
         aq9f9VOHNzSKKCqOdEMeW87VnHcFJTyE4AldG8FNb93EWXYNMei1Zfd5Ofy3Slre1Jd7
         ObYDykVSC3Wy/9WIUKS3IzDg6w3cilpKRxtANVN2vqBLs/0/C8/eT46UEGBpFwCFlPGB
         vPa1inGR7DA7UVbfgiq1K5f4Lp748SuxyO7YOHcfbN8PtmlAu91fExnXVLEgksxQaruc
         e9mNPrKZd01LGJfK/ByJOJnuMH+ms3gqsG58+yBvZZSziZCRXINs7Hk4Sb7TVOezGMtX
         L8ag==
X-Gm-Message-State: AOJu0YwMFtb6Z//Jrz7czXqBtoZeh6rPTAi3oCKJEg4Z9YvO4QxN63To
	Itl8pY3tLTrSDQtzeeXLIUwStyOsvVuc5WVvy6DzLjYci5btc4RZ1l3+9g==
X-Gm-Gg: ASbGncshl9WaECtwVyQAKk81k3G0/2i+3Fw5knkbmzQ1OwHKssBvCSlUdd3i9EZN0BP
	eCn2zymmNmgbZ9hSnUKmbt37PDI2zTrhU3i/PCKY/LW3olZsHbFs67rbzhy16VmceyHiG++XuCE
	w7I1GczFc3l4DQqT3Ms1AzsGBTRoAsfBifeXj33xFlOD/r0zP7KsFWnx7Nww45ZNXbMFlwDqsCS
	TymtJL7HdRFMB/iM3IwpmGVYeST3WwSkSKzsrlx2+REZAA88k/SBQvbqzag/Ywz6gi9w0L4//GN
	Gd40StapS4oMT+251YYjr/RRc3TKIbPpzGSPwYdTNd36hu0ytSxqkSHPy7FmTcL5+1chF5SmM16
	S9pSXIPCTSFrZI7nGTA==
X-Google-Smtp-Source: AGHT+IEXPlLqg3AnFhdRtPunTLAOL+qSEnKCcTmJCTcN3ORGaKpd4E/cReU/Z1jZExUBm5X9oEf+oA==
X-Received: by 2002:a05:600c:34cf:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-4389145288emr135177325e9.29.1737387971616;
        Mon, 20 Jan 2025 07:46:11 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438904131f5sm141078725e9.11.2025.01.20.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:10 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH 2/3] linux-firmware: split ath11k firmwares in separate packages
Date: Mon, 20 Jan 2025 10:46:04 -0500
Message-Id: <20250120154605.3023068-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120154605.3023068-1-marc.ferland@sonatest.com>
References: <20250120154605.3023068-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 15:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210041

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
---
 .../linux-firmware/linux-firmware_20241210.bb | 52 +++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index 7b53712cbe..f1a664c4fd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -354,7 +354,17 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
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
@@ -526,6 +536,16 @@ LICENSE:${PN}-ath10k-qca99x0 = "Firmware-qualcommAthos_ath10k"
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
@@ -550,9 +570,20 @@ ALLOW_EMPTY:${PN}-ath10k = "1"
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
@@ -575,6 +606,15 @@ RDEPENDS:${PN}-ath10k-qca99x0 += "${PN}-ath10k-license"
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
 
@@ -1731,6 +1771,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
+# Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RRECOMMENDS:linux-firmware', ' ' + ' '.join(firmware_pkgs))
@@ -1743,6 +1784,9 @@ python populate_packages:prepend () {
 
     ath10k_pkgs = filter(lambda x: x.find('-ath10k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath10k', ' ' + ' '.join(ath10k_pkgs))
+
+    ath11k_pkgs = filter(lambda x: x.find('-ath11k-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-ath11k', ' ' + ' '.join(ath11k_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.34.1


