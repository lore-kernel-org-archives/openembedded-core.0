Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B12C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.17270.1699127831924406168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AR3HyJlU;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507cee17b00so4050233e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127830; x=1699732630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5boMBZLFRD4AiczJMSsgrJFPnzyP+0MtdqIcO85P9Y=;
        b=AR3HyJlUVPiqT0Lu90f7JewtkQ7CXb/UKsPllXUpRPkHWTMlIXr9clv+Ol1rDsFxAV
         aljbTr4Jwngtud51aZcmrALObBZth5k2klh99p4saIuJbwMx93TA14vTB03VkN5l4BBA
         5CQiuPV4kXLyLO2p+DH9UixIMtIkE/CmX/sdPywb4/yAfgJY4qpSvjmMcL0NfMdxmEuB
         tjE1Q5ACJjYGsY3FhJ9WC8opcDzNnjvAnDIzdZmGqeTaD0eYL0nXkxJsYVpaLCRNuG3b
         i6Q4rvxngDNcWAcPdBaXOVdcxx6GHuz+gyotOEolmocLSLAVimwf6he97CFypTFvAH0I
         cZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127830; x=1699732630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5boMBZLFRD4AiczJMSsgrJFPnzyP+0MtdqIcO85P9Y=;
        b=jbIfJ03Ak2hbAQxpDFM9pwnHLSUJrXsRBseHZ77bADh9oV349wjfWhQhOnbkze+ax8
         U1gWQcnZYVbI5NdUO+fUp2kUqXaq4hl1dnCjA05jyMeXG1mD3iMnMDngQQWvYWAaCMnL
         Arf7+xSZPwnL6NMr18+7/KFaAn1r2GgAQu1Sf7GfVVMdj4GK50taf6d7bJ8gR0IaUxwQ
         tIloSQGf8lxrJ6sCn5993TocF0/6JKCuFRnvOwbU6gYkpdtNu0YmdclAYjus5L5JXF1g
         acxAu0olru7wDu35d8E+gk48/bUq0RG3Ao40oravCw0EZcikdlaiqSzTUS4anC4lNCRy
         vcJg==
X-Gm-Message-State: AOJu0Yxfa9iHKV0C89d3IEKi3hfnmvNMUmjAm1EtcVZagLRyKL0eCP2N
	3ab0NWA5k3B9hM9jUv1ycQoI/xrnym4InX5GmUg=
X-Google-Smtp-Source: AGHT+IH+4+yFMyKNSkjhyVMdy7PQfYrNZDvtcpDRKyLRmaV/Y4BSdWobl5mEFD6gUwNJAQpLIYK/Sg==
X-Received: by 2002:a19:7607:0:b0:508:1227:5a0f with SMTP id c7-20020a197607000000b0050812275a0fmr16220769lff.65.1699127829911;
        Sat, 04 Nov 2023 12:57:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-firmware: package firmware for Qualcomm QCM2290 / QRB4210
Date: Sat,  4 Nov 2023 22:57:01 +0300
Message-Id: <20231104195703.18923-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190179

Package firmware files for the Qualcomm QCM2290 and QRB4210 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20231030.bb | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index f79e37e40293..e88a88470ec8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -367,6 +367,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem ${PN}-qcom-qcm2290-wifi  \
+             ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
+             ${PN}-qcom-qrb4210-modem ${PN}-qcom-qrb4210-wifi  \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1318,6 +1321,15 @@ LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1352,6 +1364,15 @@ FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wc
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
+FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn"
+FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
+FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
+FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn"
+FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn"
+FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
+FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
+FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
+FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
@@ -1385,6 +1406,15 @@ RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
-- 
2.39.2


