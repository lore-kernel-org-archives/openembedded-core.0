Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FB2C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:28:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.39844.1739143688112976528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hwzyviY8;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54504f29000so1431949e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739143686; x=1739748486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkQ1p4YBS92ZEBO1wA2nmy0qeDF/Ya8paDQ3Li8seFU=;
        b=hwzyviY8WzdEXS0XyrX5dOTXCGshJhWENbagvpvK1QZxQsd5p8e268yC+ltZ2Hrkck
         xYfuC2N91+2cOI47Ny0gyBIUp8heBi63iK39YEw4eLcBJVjD0ygGWtbU+cTkqDgz0NYj
         ktKKyu685pxeHPg+HpE0jstbOgOZJy7PuDuScifxxyYnVs06p7JPyF+EmsLkgbpTQgOZ
         q5i9R+ffRFA5guXXWJ93zNGKuKMColeoGszjsDiar0QMH6CmBxNAlDbwKAVDjiZ3a4tB
         a1nte072g4lxJq5X8+rdNbRLFIgtx6shp9cnrAYYO0UVPNlMVFnwsNLAHM0rU8x7iGV2
         ElHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143686; x=1739748486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkQ1p4YBS92ZEBO1wA2nmy0qeDF/Ya8paDQ3Li8seFU=;
        b=L0PJrzeYSgqftSo0YmPDdZLpiu4pLBZOlF3FJHXNa13kVv4nVAsiicS1NhAa+7zdee
         w3fwa4UFcNDbwg/KGHdh9Imal79h+Tm2799O8wFqxLVTbMdqaiyAhqapYmC6hbvSluhu
         +kuXTLZEhzyVwyzeakgNA9Wtnx8TqaTrnc2pur+Q+pKwkYlWi978lb5Hz5SquHo4fRDF
         W3sBnTIddzjAWiUQRoiZ2DW5K6PmRzgA9OieXtaZUk9mQytrM3f9+UxO4iWU7Z1mlExX
         zyyAKA7KKBFpwvXKqXGjIofZ6n6YdZPtA891EtMPb4cRdY4AXD0SK/+7TOZ9iC2s89oy
         rGkw==
X-Gm-Message-State: AOJu0YxO6luz55xcaSPuMr2OqX0miqr+JRCzBVKDBFCsSHNK8Qwwz+AA
	HoGUtBBTRghSOmf5YYHsJ+llMXNIQFfszQ86BXYtd2SAne2as0lBWQ5ozttlZyGOBvPrvXVnpXX
	HncA=
X-Gm-Gg: ASbGnctKKmSzu+UUEVhJlAnu5/Jp6Xi9ChtstnRe8ZrMVtnpw51RC8pPrfNs/YYHBbv
	8HKWamPWYNk61wF/416OLY46OP2F9C7DfG0WoNsqJkyuT6X6ccPvpGY0G82Ggyc3j+V65oDtCyU
	yHc4geb+z683xEueGBwLTNuXdpXflhzPqmI+4xltxQ1rHmJpDaBMNv05hTGPwIPcQ+NqwoT5G8S
	fHSzZBjGaE5CDalD9Rwyo2VsqL+JQwh0/OxfEsU4tIVhpxd4lSBxKc/fy6Jd0EVXbx/GlPg/vsw
	bP72I0MJ5A4XxOJA3bHMdbUamRQIBIk=
X-Google-Smtp-Source: AGHT+IH41bNswJoEgtCpeWwFA/ElnQre9vyFhYpcYIs91yK3czq5ui/8JSg8hzJ3+izvWJljv/Pbvg==
X-Received: by 2002:a19:6410:0:b0:545:9e:beda with SMTP id 2adb3069b0e04-545009ebf53mr2041144e87.49.1739143685845;
        Sun, 09 Feb 2025 15:28:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060412fsm1088782e87.230.2025.02.09.15.28.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:28:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: further split qca61x4 package
Date: Mon, 10 Feb 2025 01:28:03 +0200
Message-Id: <20250209232803.539008-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 23:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211056

Separate linux-firmware-qca-qca61x4 package into two independent pieces:
serial and USB. Serial part is going to be used for Qualcomm
Dragonboard820c and similar devices, where QCA6174 is attached over a
serial line, while USB package is required for devices where BT part of
the QCA chip is attached over USB.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20250109.bb | 57 +++++--------------
 1 file changed, 13 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index 80c94c5db3b5..b9323007420c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -398,7 +398,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-wcn7850 \
              ${PN}-ath12k-misc \
              ${PN}-qca \
-             ${PN}-qca-qca61x4 \
+             ${PN}-qca-qca61x4-serial \
+             ${PN}-qca-qca61x4-usb \
              ${PN}-qca-qca6390 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
@@ -591,7 +592,8 @@ LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
@@ -646,47 +648,13 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
 # firmwares that are not already included in other -ath12k- packages.
 ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
-FILES:${PN}-qca-qca61x4 = " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000201.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000300.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00130300.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00130302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00230302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000200.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000201.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000300.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00130300.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00130302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00230302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00440302.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_00440302.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0105.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0106.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0107.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0109.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0110.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130201.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010a.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010b.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_0303.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010a.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010b.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_0303.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00190200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
+FILES:${PN}-qca-qca61x4-serial = " \
+  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin \
+"
+FILES:${PN}-qca-qca61x4-usb = " \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
 "
 FILES:${PN}-qca-qca6390 = " \
   ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
@@ -786,7 +754,8 @@ RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
-RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
-- 
2.39.5


