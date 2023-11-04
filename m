Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40800C001B5
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.16955.1699127832876088696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pRU3u86h;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507c8316abcso4267712e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127831; x=1699732631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLkTGHAlLFIKaZRHY5uAVL01AyKd4mO5HlMAN+e5mak=;
        b=pRU3u86hDxDKPmxUs0EOkLCXbR8pATBT3/xdwDVcsL3Yf90Rk2VskOn/XSAxezK8BA
         D9bv70zfZVEB/k8dFrv1MLUfz0mKeL3Kggc/NAdnR6UXHpMI5Pn841cs3+K4snSUgrP+
         v2QVT1fwu3wMQkr0xZRXIkoduH9dbmSV+3ODTrOE6LQdY2uiqRxWpTiJreX6h/ZW5JSb
         7HrzqgB92VESvfv+9rtxbgyvntojoXkkAWiCWtZ20qAXOcYOG21kAI1vSrN9iJUPMF+n
         bZbFJuWXHPgLXQIz6EGBFVVuzAwSatut6NmjG7dcG4YfiTtEPvPYeN45dkDSE+QGinJY
         cmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127831; x=1699732631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLkTGHAlLFIKaZRHY5uAVL01AyKd4mO5HlMAN+e5mak=;
        b=E0in3vXhU5n1eZIN+PANWQTI9XRnMeoeYkwYd5fajH8WiuhMqUm03rKIDREWUHCLBf
         qxJrCbkfDzN3vgUzcmQ/xqpWju95/DdqEuZiQKw4AO6DJipGlXueCLrMubGVJoD3Wy8c
         0k3WHk7XvnyXnxajEMikESRtGRGH+mEzC95TVuBFhOH+zx11S+VTrUlS+H5ySMtmS62R
         Juizos19ZK9RLMy0H5LLxEP58fyZyXCI8c7CNc0iVD7ysncdLZl422QaMGmBW6DRD6pg
         GdldaHRrR/KTasEPUF/nCsyZPRUHzNwf1As+nVbBxwVFoQfylMxx+R/hyhT3Uw+9UV1a
         YthA==
X-Gm-Message-State: AOJu0YzNfOxW6Ygwht1oAmAtw8hP4c4b0b30J4ZGtXixuGYlwcZcBV17
	+45TtTIfev9H+IsOpzMYsMOUpEOuSzHu2GtUUnI=
X-Google-Smtp-Source: AGHT+IHo50ulsnTZRBUdulkl+z+p7Ag7raWD1Zlb1fEqgewxtyJCIRyTfx7AhAR74sziqiTPoCH1vw==
X-Received: by 2002:a05:6512:3b88:b0:507:a58f:79ad with SMTP id g8-20020a0565123b8800b00507a58f79admr24407320lfv.61.1699127830888;
        Sat, 04 Nov 2023 12:57:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-firmware: package Qualcomm Venus 6.0 firmware
Date: Sat,  4 Nov 2023 22:57:02 +0300
Message-Id: <20231104195703.18923-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190180

Package firmware for the Qualcomm video encoder / decoder (venus) core,
version 6.0

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index e88a88470ec8..a3c2f8e37065 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -361,7 +361,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-phanfw-license ${PN}-phanfw \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
-             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
+             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
@@ -1306,6 +1306,7 @@ LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
@@ -1349,6 +1350,7 @@ FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
+FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
 FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
@@ -1391,6 +1393,7 @@ RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
-- 
2.39.2


