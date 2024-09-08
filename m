Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A20EE6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 06:53:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.25374.1725778418140641116
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Sep 2024 23:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vvn+OvK/;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365aa568ceso2314889e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Sep 2024 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725778416; x=1726383216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z75ozexfuzPx9SLuFXauxOcVm33Ok4qM1amHLAgYPQc=;
        b=vvn+OvK/mqOzFTf5aaP+fO/q0kBKu4zVxJve31a3O9APPIRP8h7aVid/JYhDQqdCGx
         xNGsbrK4eYFkCHi3OWAjh+2d0HpHn2peV6iIsQgMIwRdQ5W30EjkM/RuaJqlBRRBLrQ7
         wltaday7cdNUpV8hfzdQg//qLzb6BL+V1AXfdoGaSl4gwtHSbKP1hvyftNX3vSj1a61s
         rkgjGC78G4JpBwsEVFz1E9/NO4NO7KMm4VhGNakbW3ZuEtdbqwU4xM6oMEq9FPIQDAne
         2TlYAHRvenQTYrf/VPkrdMMYeFEazn2cHivq0fGMUuP8Mt0UPCVb8/dFYisIBbgiwFH5
         BUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725778416; x=1726383216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z75ozexfuzPx9SLuFXauxOcVm33Ok4qM1amHLAgYPQc=;
        b=sCsVXi4wf/++qX/5Emv48mOpsDO8zWWEqPvKY08mvPpyWD9rVBYH2LrCoFdgoUyKq1
         V6ehpDZoqDsQ5JJA/Czd/u0hgHYmnGxojvmvnPVSDCST3VESYXEgIyWFf/FcvtRtzJjZ
         ba6rP773PpeHh1mH7U4i2zn1RpsNEvz+pbWYd6ze1baELnE5v8lPlmWXbMRS428J2B6j
         rx6q/gLHA15BQwIJVNqNGn+IBRUC7Fxa0M3+55mOQxE9Mo6GPgCaszEL0j5jR1qjrlbl
         EoCJ/+anVDYv6QB0lLAu2CcKOuUXpkkyYZ9QQPgO3O9RVzEqln5tm7jxsHNIjaMqm68J
         QCqA==
X-Gm-Message-State: AOJu0YyV/F4U7H8V2kRZeXSy5PhPziTUvKIFrq4xu+xoEybFeP9JB0id
	H0y6juVnsP5C7ZoY+DxgDmeYtJWSqP/jSze4yE98f4w2ok/i8R5+GJGLZlL2l13QoA+CytUYzC4
	3
X-Google-Smtp-Source: AGHT+IG6lhZSYnGZtzJU8fpYo50dID0aa3OfA/QxzxtIeSUbPmQ7A0jQHx+ldICDUcxq3QFket0V1A==
X-Received: by 2002:a05:6512:3f12:b0:533:4785:82ab with SMTP id 2adb3069b0e04-536587a67a8mr5044351e87.1.1725778414900;
        Sat, 07 Sep 2024 23:53:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870235sm328823e87.87.2024.09.07.23.53.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 23:53:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: split ath10k package
Date: Sun,  8 Sep 2024 09:53:33 +0300
Message-Id: <20240908065333.2930464-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 06:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204295

A lot of Qualcomm-based devices incorporate WCN3990 WiFi/BT chips. The
ath10k firmware package provides two small files for such boards, the
rest of ath10k firmware isn't applicable. Split the WCN3990 firmware
package to simplify using of the WiFI in the resource-constrained
environments (e.g. from the initramfs).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20240811.bb          | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index b620a6e24928..033e832cef43 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -331,7 +331,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
              ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
-             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
+             ${PN}-ar3k-license ${PN}-ar3k \
+             ${PN}-ath10k-license ${PN}-ath10k-wcn3990 ${PN}-ath10k \
+             ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -487,6 +489,7 @@ LICENSE:${PN}-carl9170 = "GPL-2.0-or-later"
 LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-wcn3990 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
@@ -499,6 +502,9 @@ FILES:${PN}-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAt
 FILES:${PN}-ath10k = " \
   ${nonarch_base_libdir}/firmware/ath10k \
 "
+FILES:${PN}-ath10k-wcn3990 = " \
+  ${nonarch_base_libdir}/firmware/ath10k/WCN3990 \
+"
 
 FILES:${PN}-ath11k = " \
   ${nonarch_base_libdir}/firmware/ath11k \
@@ -514,6 +520,8 @@ FILES:${PN}-qca = " \
 
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k += "${PN}-ath10k-wcn3990"
+RDEPENDS:${PN}-ath10k-wcn3990 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
-- 
2.39.2


