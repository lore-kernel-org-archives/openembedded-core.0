Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FA7C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:36:35 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.11323.1676129785501092836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vqGVAmYs;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id bi36so12840486lfb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqV5fPV+6QcQxVjSfktnNml0HOo+7hS75DzPZqroyJc=;
        b=vqGVAmYsNomHxsjUZ67Dq82PRbsUkQgeUWsiwt4FzS5mOL4D5WXn67vOUpXyDEx5Tj
         nKnFMgdKgh4gG5JFqjEHWGHb8kHcIF3pAOzBvp8HZErD1vAu7b+ucnBcS2jEAm4Gn3m2
         YEZOHMMH+2b8g8MxrkZvWDbMB1Va5iqxs9iw/l164L+kdHWue+umjcsW1W1zr0YEQwh5
         b9m5Y+9UxofWvxLrdVJPyj6PWhaK+yH2onhsD1jqqQ66r8akk0CCnIZl+vIunl9Vat85
         YLW7T+xgYXOJHuHg0ycA+UZBgDbcoxTTB0IvdLsdqqLEK64SExtTO9KuA3ihRAvjzRnn
         CHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqV5fPV+6QcQxVjSfktnNml0HOo+7hS75DzPZqroyJc=;
        b=OknlIIwj4Bm4SrNZErbd6c3aubEeVUba2KjpuKAfz58s+dUkZIspZNwaKe6kZv+u6T
         Qr0CvMy9zH9J3WdqoPF32p6TdlV16c8BiRVyRi/PiT1WGoZRujb+GcGsnRMY1rpenW7c
         fc8JNNWqerMiwyJUrq4PXJAM3MaWB7WTkAXg6aG05y6k+IKTjWY5GtHqt0q5uD9CXNgt
         hQNCiT0pJs6i5I2dcXMdnNzFYzgs774M2M+mFno0KAfwMbblNsdUCTNQimQRHgnf0P8s
         9Brc8leQoEPx3jR7BunduJycYj7FJ2ri/kzM8PU5ipZu+fwVrpGaTf7CktES8ubh1Ica
         wtDQ==
X-Gm-Message-State: AO0yUKVfbnbZi0tInnKg3BfR7w4FP2QXgmSvG/LsbTzB4ltyW7FYudUP
	OjL5skLSB0DdZtBMoSECMJyz5RNMcIFh0K1m
X-Google-Smtp-Source: AK7set9JsRxHaurymyP/U515xPtWXR9eGbSMv1ol6T7LI6qZWWMrAznMQd6/aZGB7m8UwyCTgD6H1g==
X-Received: by 2002:ac2:5281:0:b0:4db:28ce:e600 with SMTP id q1-20020ac25281000000b004db28cee600mr1283419lfm.1.1676129783633;
        Sat, 11 Feb 2023 07:36:23 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y12-20020ac255ac000000b004b57bbaef87sm540019lfg.224.2023.02.11.07.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:36:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: add yamato fw files to qcom-adreno-a2xx package
Date: Sat, 11 Feb 2023 18:36:15 +0300
Message-Id: <20230211153615.2112747-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230211153615.2112747-1-dmitry.baryshkov@linaro.org>
References: <20230211153615.2112747-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 15:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177006

Newest linux-firmware release got firmware for Adreno A200. Add these
two files to the ${PN}-qcom-adreno-a2xx package. As these files are
licensed under a separate BSD-3-Clause license, add separate license
package too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20230117.bb      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index 9ae0b2be13e4..fa9e6f604b3f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -45,6 +45,7 @@ LICENSE = "\
     & Firmware-phanfw \
     & Firmware-qat \
     & Firmware-qcom \
+    & Firmware-qcom-yamato \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
     & Firmware-qualcommAthos_ar3k \
@@ -109,6 +110,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
                     file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
+                    file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
                     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
                     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
                     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
@@ -177,6 +179,7 @@ NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
+NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
 NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
@@ -307,7 +310,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-nvidia-gpu \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
-             ${PN}-qcom-license \
+             ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
@@ -983,13 +986,14 @@ RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
+LICENSE:${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
-LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
@@ -1009,13 +1013,14 @@ LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
+FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
 FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
-FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
+FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/a530*.*"
@@ -1034,13 +1039,14 @@ FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/c
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
+
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
-- 
2.30.2


