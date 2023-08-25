Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860B4EE49A0
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:12 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.5609.1692931682881608459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ntHQa05S;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a7f4f7a8easo238408b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931682; x=1693536482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPrdiRwlliI3LxryxAplBciVqukjZJe1bW0z1Ngauxs=;
        b=ntHQa05Sez8W5wD1g6zDcaes2dbn9lYFJc/zasHwE1vDjlb62oGEseW6dqdq/4nwU1
         Lkz/93CkWELCsXlY09yuwpQTHp0kDSijBCJWXU8sX+mj1eCqbLuhPN9fvVNm8opRovdP
         vPIr+cHrpEfHodxF/6nkFfbb2IjtIBcHtcxQSVKSJmAjDLglnKYtEBjhA8S0sx5fQQEo
         lS42+L5niZ2PWOcRLuWHrh6RGtuMORhHYi4rlsgQ8LlEPaaO3WhY8xngOrAG2dhsmKSR
         iOoJlnbMY+YY6qbIgVf1i9rFrc1zJeQU5gkRZ8r+ka83fC2Wpl+Oe6ewK/aZm6/AYv8f
         mxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931682; x=1693536482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPrdiRwlliI3LxryxAplBciVqukjZJe1bW0z1Ngauxs=;
        b=jXmxehRKfGbx5Olj23cxMavxNJPGjrlfaFEBNT0HY6s+KtyphFG2we5kMJSSI5OnZs
         XKIO0JdD7s+qmKbzS/BGTF5pNz+m77Tgt8RF1jg0rsYQ1eQAM9avxA71T5gTY0UA6LoE
         XRjkoskgbrK/0sqPgDByC2Fuj5kC8Y9RKmAAkQzO7bHTefG2SqDDR7MsoX1r7bQkQZdE
         j3Bm+K8WyKle8AIR8gZYR+Flmo+MIHPAc0vXSNmzP9TesdlUcAA09UBgY0YX0Pd4AvI8
         AwfAOhJdrkSsvBhIjGE5EGFSPB/poRCL+qxtVBgVamxNIBVcWol+8oABVJz8r3Q3dTsW
         fbXA==
X-Gm-Message-State: AOJu0YxA00m1GBmJH4gUStTtidKS3Zi1QhsR89beY+E2e2NNO1T1cHcD
	VhlC2NcQ66ascTCW5psDJF1KfEcI6xKyyyGukcA=
X-Google-Smtp-Source: AGHT+IH3Hc5bBgLO76gShwyW1Gbjoku3my6iMhu+7uP8ZoDfyDqLUlhjrs5kFKfLRta1//lDgzNDcg==
X-Received: by 2002:a05:6808:8d1:b0:3a7:ae8:79d9 with SMTP id k17-20020a05680808d100b003a70ae879d9mr1422714oij.43.1692931681807;
        Thu, 24 Aug 2023 19:48:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.48.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:48:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] linux-firmware: split platform-specific Adreno shaders to separate packages
Date: Thu, 24 Aug 2023 16:47:33 -1000
Message-Id: <486453cca6986d3dc383f235dedb7c2e103d74c7.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186682

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

For newest Qualcomm platforms the firmware for the Adreno GPU consists
of two parts: platform-independent SQE/GMU/GPMU/PFP/PM4 and
platform-specific ZAP shader, which is used during the boot process. As
the platform-independent parts can be shared between different
platforms, split the platform-specific part to the separate package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf00a042d2fa2eb4b20d8c5982926758821bf990)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230625.bb  | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index ff7cb94859..7fe7e51240 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -315,14 +315,14 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
-             ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
-             ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
-             ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
+             ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
@@ -990,15 +990,18 @@ LICENSE_${PN}-qcom-adreno-a660 = "Firmware-qcom"
 LICENSE_${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE_${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE_${PN}-qcom-apq8096-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE_${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
 LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
 LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
 LICENSE_${PN}-qcom-sdm845-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE_${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE_${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE_${PN}-qcom-sm8250-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE_${PN}-qcom-sm8250-compute = "Firmware-qcom"
 
 FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
@@ -1012,12 +1015,13 @@ FILES_${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES_${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
-FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
-FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
-FILES_${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
+FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
+FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
+FILES_${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES_${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES_${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
 FILES_${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
+FILES_${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
 FILES_${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES_${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES_${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
@@ -1025,9 +1029,11 @@ FILES_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/q
 FILES_${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
 FILES_${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES_${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
+FILES_${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES_${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES_${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES_${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 RDEPENDS_${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
-- 
2.34.1


