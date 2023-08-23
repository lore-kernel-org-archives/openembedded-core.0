Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C338EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13071.1692801403521307562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nQuTgMso;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bf62258c4dso26382975ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801402; x=1693406202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C63NOZOShcbgNq/nYhwpz9WUm8GUwm2g1uY8hdcuP8w=;
        b=nQuTgMsogSVEnikfECegYESpRbGUrCB4jtv0FRy1lMz4JDCSR+bN5Hn8FaUhZ6bFo3
         JlZZrolBaF/CHTBXgE09hKE7L9kMJobBMlMgqMWVDCSLR5mM/kDKms2r1uUP5b227Tvo
         xG+do4Tvq4Tyili6d5ySqpWoB0qx96sAFms4qhRpz+gN+5OSw9o7PoKVw5qKdDAr2mEy
         sRa8gcDNncOkFaZr7TLlW//aRA2J9fx02T49t0QTjQvEA3Udt8ke5/35vZDdx39Jo3Og
         subleS7HfIfmjWWv6x/IN69rjcdHPnJMGvNqVWUZda9bqUiuJaWyIRsuxuNFfyqI5ssT
         nSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801402; x=1693406202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C63NOZOShcbgNq/nYhwpz9WUm8GUwm2g1uY8hdcuP8w=;
        b=Nh4dFy+pQwfFXwyvujxgwKw6ELpfHV83KqTm4lnJbSC5r2tJ6o7WGExyQOKu/dk5XW
         AthpChs+Q9JAzOgbVxMclE6Uo0rQBVTeCJZvNJBYvKmpAg1WCQru/F0aa3fscFKa+IdM
         5AnJ4U/j7hahgNDyV/leOcqBlpijMfnCO5oJozT4G+rftUc9IJqF64hqMUUKh+aGLGF1
         rGEQvEbVh2fovvG1CR2ksdYD/Wl7tfoV/yff2xVodhXuLGcPZ8fnXCjJXYLrl9iI9JFI
         EL4qdtdGiqka/yyHbqL4SwlemD0kFRzzMCnyGovTZH67wMda8TP87NI8BpCMSxTHOhFv
         UkrA==
X-Gm-Message-State: AOJu0YxJbp3CdhdNVI5+mQawGcfVCjeOIjjPYc/rYwyvpQeSE9E/p6Nu
	lpDP71HEm19kayRa00unSJJMh0TB2mKgjp3SpO4=
X-Google-Smtp-Source: AGHT+IHIXs2RuOfH1R6luUeCNN5bbOx2ZgvappCWcdDaNmfMOVyO1Kb8HOcP6RSFNKR9lSfGB2YwCw==
X-Received: by 2002:a17:902:ef89:b0:1bf:7dfd:5043 with SMTP id iz9-20020a170902ef8900b001bf7dfd5043mr7028034plb.2.1692801402542;
        Wed, 23 Aug 2023 07:36:42 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/36] linux-firmware: split platform-specific Adreno shaders to separate packages
Date: Wed, 23 Aug 2023 04:35:41 -1000
Message-Id: <e21f3d57736993c5c4bda67428afca7503a3dece.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186592

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
index e3670c63b2..6765226b9d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -317,14 +317,14 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
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
@@ -1012,15 +1012,18 @@ LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
@@ -1034,12 +1037,13 @@ FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
-FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/a530*.*"
-FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
-FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
+FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
+FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
+FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
+FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
@@ -1047,9 +1051,11 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/q
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
+FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 
-- 
2.34.1


