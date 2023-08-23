Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D559EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.13067.1692801398219934589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cpUnQuQr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bf078d5f33so45146925ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801397; x=1693406197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3TDniYM3EoAbm2OLW0KRkus2Mlrz3LKQl7tFY6lEyk=;
        b=cpUnQuQriGL6GTlFrq5b+US/44IKtky7b1rfgZoxT5Rh9V8qn4uzzUHSPMmNY3g/Dq
         7s0jr/8Ek/IcAbXP0Rhgbp/qN4Jv+p7yAvRRNwpgu73epj20LZLJCozjyph+fdfDMfsQ
         B0teoJ1gF26LdjQlS9I9wcM6La2mywpn9ynswaMlF5buKVsa/zl04ZCwAzClV3QP1Na8
         CXCpwJXKFDTlyT5FYQwPJhaJLh7k0FUDVDJN6P6r/NxrYquIUXRi68gbMuYYyqBi2xK/
         U1y5uhMyIC2zYKozXKzBONqw6pVPa//UHeIS4TQ9Tiqzf1YvVEaRIxR+dSRFnDX5deJE
         wIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801397; x=1693406197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TDniYM3EoAbm2OLW0KRkus2Mlrz3LKQl7tFY6lEyk=;
        b=i+Jab6N6+YGfZbW44mxE85GIf10HxYtlYyS25fFirxNDi5f2YKQrr7Ff2vQaFIgUkU
         mY/2cKzeQxZA6uEVMa5d2zY5ZMw6lmNgawkavUHKUFBuXGj1eYclEORr93XMkofVS557
         ELvfF7xg2zQUXAcaUpaZNDHOaDweBEoAlK4DAqfpyabD7Nn0//P3OadVQ8dAO4ZM4cRg
         hOauSCH4QS3TrqqX4Avq9Izk3brPOvFzji5gUnyqMjuh2KYay8uzi0HF1eOE/fiTqtd5
         epCUwZLEH1cQWLIXx+mHi7hDJKEKr+uq1T8Y+WwpOPNYvbyDGdXOdUnRuOZ5l9ueWtTD
         Mlmw==
X-Gm-Message-State: AOJu0YzJbTU85RVU1kpgEfoGnYTwHlKoV2ka7oFWNYob9BEuvobvCVxb
	UW7n0SY1gbOKBBSBW7KDE38jN0DKXHAKehCY+sI=
X-Google-Smtp-Source: AGHT+IFcmU6k0aXP2cBkLlLgeS5vIPmT+omhvO5S0Cjsv+3I6Kz47F9y4KT2bOGgUY7RZ6weUM/X5w==
X-Received: by 2002:a17:902:b198:b0:1bd:a26a:58cd with SMTP id s24-20020a170902b19800b001bda26a58cdmr11734324plr.15.1692801397241;
        Wed, 23 Aug 2023 07:36:37 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/36] linux-firmware: package firmare for Dragonboard 410c
Date: Wed, 23 Aug 2023 04:35:39 -1000
Message-Id: <fb66b90c7ea5f315b75624d95d4d5a01ffe09a30.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186590

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Latest linux-firmware archive inclues firmware for the Dragonboard 410c
device (Qualcomm apq8016 SBC). Follow the rest of linux-firmware-qcom-*
packages as a template and create packages for the new firmware files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 380216e8d3b63d563ebfb10445fc6eb5e77eb9f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit ffd5eeb866254a958846c7099d1d46e553beed56)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230625.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 9e3196d5bd..7d0a794e8e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -315,6 +315,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
@@ -1000,6 +1001,8 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
@@ -1027,6 +1030,8 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${n
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
+FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
@@ -1053,6 +1058,8 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
-- 
2.34.1


