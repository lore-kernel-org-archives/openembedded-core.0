Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301A3C7EE32
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.27567.1677860276935366832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cWhYXs8i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id u5so3173496plq.7
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQkJbmgZGUiVVRYsg4ceaD2pbFN4yU5Gqyfu4DroiYo=;
        b=cWhYXs8i/n791FezvfRNpPHkouSdwyqckskKXsC64qfOc/k2gWpknXQtl1M0IMKJbq
         ZKwMf6Hz3DlMCeYJPGYdaT2VrF9WYAykXUCvOCD2a1WqIpirm417C+0IBc8OzxgaNVnc
         rMVKgfCN59f4ghVAmJaM9uTaeQkazreISqum0DVVaAYoS4EdhWTdsxUXBkLVSd2yuUPg
         5kSt8jhYT8A68UhBmuxJ/BIM6WqQbO2jAguh9Bqkh0katieoutQvIELIAXE2XtNtvRfM
         o4UoeegAoxj06P0Z4VifX01eGbXC3nIcur2Y/f2yrzEGaSJmhz9AeCMCBxX4vApC4eVj
         wWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQkJbmgZGUiVVRYsg4ceaD2pbFN4yU5Gqyfu4DroiYo=;
        b=txdq4sif/ktkea8xy97494dQmqfUATzEltf2vEvX54IzYihwQSgOoqdogI1QYjcBpJ
         PH3tLEkXcpzvQeKtvOYz9rmhL+X7VtZmgSrmBlug4ZwZN7uJHRBMxJfUTVxuXXj7JV5X
         iytQ6qquQ2Obbosw78QX7cldNf+fwGFXzvL+woCoLSQ9SSpw0spLLScC8ZBiYZ2DBsro
         EJgwADvGt7/3ug6f9ZNLbfC5ZpxV6RD/3xRiOY09R8pLadHLJ2BQNC2a2ei2R+LriQU9
         EtCmWwMEKELSSCMvND+ItqdcIjXMoy/1DiOJZq8Z/PQf6choWp5LX9RxREhTgAtv4RjJ
         0W5g==
X-Gm-Message-State: AO0yUKW3Lga5Pz/JKUjnNgfgvReWog1Q3WD+9FOvBsr1F2WrJIWVWRX1
	tvK7XQ9UsYruplvkmHRUubXzMbj4l8BqSi4hA8c=
X-Google-Smtp-Source: AK7set87aLcXaDUpkZBkmFiK/8gJuq125TF1QLUS9thmdThke7mkry7qU8tNjhVpOJAOhQEP+yB22Q==
X-Received: by 2002:a17:902:da86:b0:19e:31a3:1a87 with SMTP id j6-20020a170902da8600b0019e31a31a87mr2662269plx.39.1677860275893;
        Fri, 03 Mar 2023 08:17:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/29] linux-firmware: add yamato fw files to qcom-adreno-a2xx package
Date: Fri,  3 Mar 2023 06:17:11 -1000
Message-Id: <f4ed38c59de9a7c593f9925fc4ce2e084929e036.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178002

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Newest linux-firmware release got firmware for Adreno A200. Add these
two files to the ${PN}-qcom-adreno-a2xx package. As these files are
licensed under a separate BSD-3-Clause license, add separate license
package too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56e1b2b06ef7f22d4ac5899046f650ae8ec0d547)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230117.bb      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index 9ae0b2be13..fa9e6f604b 100644
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
2.34.1


