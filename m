Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42753C0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 08:59:08 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.39653.1738400342022516073
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 00:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NU9UMO2Y;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e49a10f5so2886830e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 00:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738400340; x=1739005140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXBLVSgRI3Wr3fzCfAMM1/62kZYJN3LX4Xww5UeHAcY=;
        b=NU9UMO2YIeT2B1UmlsqPhd/me+wfOp4v39Txw6RVMroN2gjEewCLbPvAgq+fioIs7o
         I5e6Mntu464w6lQRGARIQapftqDMP+Oa9ELhr2Q189MwlA3NRhlBycYcIIfbtjUr7zcR
         OqGGg/OG/M1JGg8u2RNWrBSK/vbPqgIRh+050mCZOGj6hA4Sw8wzWYeF/a638igBRDre
         F4WS+T39rLS0QSf0Y08FkwLv5F+2lGu+przmy2lBS3XmFTvolYazNxg/ZqCYoPZtp/8D
         YnAev3MBf2X6hZsuxJu6lSDJ8Kjxe77jUqNETDDL46ij4fCk9epSsODLIbDJPQZZ7eEe
         7kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738400340; x=1739005140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXBLVSgRI3Wr3fzCfAMM1/62kZYJN3LX4Xww5UeHAcY=;
        b=RJ8ggDl3rzfC5tYR5ObWTc5hV/AjKE/z+Gf05YRsxrCHiB8WKb3emG/cfsi2h6NN/a
         e3jSzsTq+mocA8eqpK35b9Vxm09RoMQnsOFD6jeBxgVGU8I7haXkXeEqxqPyUhdcKI70
         DltOa5G/pDULkoUNAN9nrMbviMYW6BE38fKO10VOZfqt19lvERduRkOz6/B2Iby9wVfR
         4w2NgYY+K0ZcBwvOr5+iqgvm6MmHqRC4uMoA0K1FH1svP7f5s7VpQnHL4ZfXUyAjUGsV
         SQsGMhlKuuOW6w/KLQSxcnTyfxMEcut15gfpjSj02C/PFqDYKD77m61/TJzICUhpVN8Q
         D3lg==
X-Gm-Message-State: AOJu0Yx71mpNC5fgI/iDkscSBU4FOgbcqENbbmhU0u0ohYXgRL1uMCNg
	MjHcpWrzOHdl7hZHGYV9VjsBSrzia6ejkxxTh4XitdHRa26qtbLiS8QTeCAYGpii3ZDXkrCS6ix
	ogjkxNX7Z
X-Gm-Gg: ASbGncsOKAVMipIdA1Yus5FCeHPHbTW5LqWPykjhiUrkLuhHTI5Ac95T2Yr3+XRsgG/
	+6G9X2zcGQwS++UZIXiYmOLDLpLrfVQC+eeIvBR3lO7JPxK/fWRhOVTcBjAjS63WsWO6FIoXKi1
	C3AYrGhq8quD70Z4xTh+FrCY0dlTgVM97QWaPymAYzbGwbkp9JDeMaOsVYkpSSO+69lMGjUese0
	C8Ulkw5ASJ84+Rb5SAHckMf0VrJznf5OGobTHVUIXp7bvu+K7nXT+LrbZw2gdUQQr51czsw027I
	FQZxsePHPA+aw+0y4trKPZZDv1MMBQA=
X-Google-Smtp-Source: AGHT+IFqEJJD+LvOtlrBSxdO4OQbH2+runVfz42H5AH8KNnrvf4l6TzWE1TIYbfE0DQ7Kxh9TuWe/g==
X-Received: by 2002:ac2:547b:0:b0:540:2a76:584b with SMTP id 2adb3069b0e04-543e4c32c1fmr3705963e87.36.1738400339590;
        Sat, 01 Feb 2025 00:58:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf10d7sm696889e87.43.2025.02.01.00.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 00:58:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: split the qca6390 firmware
Date: Sat,  1 Feb 2025 10:58:56 +0200
Message-Id: <20250201085856.3508331-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 08:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210503

The HCI firmware for the QCA6390 BT/WiFi chips doesn't logically belong
to the USB-only linux-firmware-qca-qca61x4 package. Split it to the
separate package in order to simplify firmware management. This follows
the pending WHENCE change in the linux-firmware upstream, where the
QCA6390 firmware is split to a separate section.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20250109.bb            | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index f0b710a6cc6a..2ed27b648738 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -399,6 +399,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-misc \
              ${PN}-qca \
              ${PN}-qca-qca61x4 \
+             ${PN}-qca-qca6390 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
@@ -591,6 +592,7 @@ LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
@@ -664,8 +666,6 @@ FILES:${PN}-qca-qca61x4 = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
-  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
   ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
@@ -688,6 +688,10 @@ FILES:${PN}-qca-qca61x4 = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
 "
+FILES:${PN}-qca-qca6390 = " \
+  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
+  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
+"
 FILES:${PN}-qca-wcn3988 = " \
   ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
   ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
@@ -783,6 +787,7 @@ RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
 RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
-- 
2.39.5


