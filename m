Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E027EC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:45 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.8700.1678229316859405297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xbzyDMO/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id y19so8566544pgk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faL0shdJY64vEfPQsdCErZ0iMR46EXq8SZCEQP0zOMI=;
        b=xbzyDMO/jsY1b3KtGZbtZtgrhaXcRkF/2QnW79bdMmUvub85KyuEWcMBbqgVWI0Hdk
         IcHXP6fOWLZaoMKWApnxwxfZGZouOUAZNRYCZiwCSuQJ6J281j1lgoBco+65BgJvYwqL
         ranl1BBRi8Cscc36ESi7x+PEYNEVCDGdtIU8WY99uyzapVYUg+iPk5RtGXsrvkgl9rLA
         sEIe6IihSdvMF4hyLJkcAMlwBj9Vx1mB+mHiqkeHiUllsHtg59KJVfXvRhXiLloHGAXM
         lJCP3EMhTCp1D+OKECzezHyRuUFHpmjFrlCW9Di1Ixp9PyLvIX2wMTVVEjvkSjYZdtC6
         X5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faL0shdJY64vEfPQsdCErZ0iMR46EXq8SZCEQP0zOMI=;
        b=h7ibUGmz8tLOYk2RlbvUwWr3xEROTaSVv0TLUzhwCqwGxLKXwKIHpVKUNKwd9ynknE
         1sjth4YnQHjKh6AK0p3xhoEIBXDXHBQcUK1xZSKQA1/aUN3JUEwJgfZvzFJYqc+ucFQk
         +B7zdWvTXDDfRTyn5Z03uK1q6W9nj98u5u7AxT7CqK4+s7RAW6vNkLwNVyiaLWXNRZdQ
         XuVQ+5WVdaXJl6ZEqBpxoScerM+y+7dt7P+ee1Bvlqp4LMX/LoHOw1y4+lK4ImbQVvAx
         Cfv2yz7nKwBwf9jHBLMmZmnivkFC3S8/TPPfiw2KUnr6pwNn24YrOjLnYoGEpyZn7Cf0
         7NsA==
X-Gm-Message-State: AO0yUKUoUHL4f98xf7nhurETYzw1Ir+uoCv0+3PPirzxzGjpXK/HuPXS
	hydx42QxaXcD3lPaOZApSQVPy1Wooxn1u8SpJRw=
X-Google-Smtp-Source: AK7set8RTGJkrgSsUmTV1A79fHf+GNL2U/IzYADU0ntCY/JBU70gk78aEJE8Z7E/guLUXg2qQI7Lbw==
X-Received: by 2002:a62:5e03:0:b0:5b5:8e27:1394 with SMTP id s3-20020a625e03000000b005b58e271394mr13235140pfb.34.1678229315935;
        Tue, 07 Mar 2023 14:48:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/23] linux-firmware: add yamato fw files to qcom-adreno-a2xx package
Date: Tue,  7 Mar 2023 12:47:44 -1000
Message-Id: <420c41b9560574b10aa56fbe073509c56adda93e.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178132

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
 .../linux-firmware/linux-firmware_20230117.bb       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index de22df1eba..ce0c90d4c5 100644
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
@@ -305,7 +308,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-nvidia-gpu \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
-             ${PN}-qcom-license \
+             ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
@@ -961,13 +964,14 @@ RDEPENDS_${PN}-qat        = "${PN}-qat-license"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE_${PN}-qcom-license = "Firmware-qcom"
+LICENSE_${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
 LICENSE_${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE_${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE_${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE_${PN}-qcom-venus-5.4 = "Firmware-qcom"
 LICENSE_${PN}-qcom-vpu-1.0 = "Firmware-qcom"
 LICENSE_${PN}-qcom-vpu-2.0 = "Firmware-qcom"
-LICENSE_${PN}-qcom-adreno-a2xx = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE_${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE_${PN}-qcom-adreno-a4xx = "Firmware-qcom"
 LICENSE_${PN}-qcom-adreno-a530 = "Firmware-qcom"
@@ -987,13 +991,14 @@ LICENSE_${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE_${PN}-qcom-sm8250-compute = "Firmware-qcom"
 
 FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
+FILES_${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
 FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES_${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES_${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES_${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES_${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
-FILES_${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
+FILES_${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
 FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES_${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
@@ -1019,7 +1024,7 @@ RDEPENDS_${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a2xx = "${PN}-qcom-license"
-RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS_${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
-- 
2.34.1


