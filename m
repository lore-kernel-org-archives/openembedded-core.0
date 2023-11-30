Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7296C10DC2
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.5156.1701377886540269841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NQXOSNgT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6cdd584591eso1409439b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377886; x=1701982686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1IEPeV7y9azAnEQc+JMcCj6y3anlcPqDkSElaKKwJw=;
        b=NQXOSNgT00e/N2trPkJ7nZJA4cQvCGo7hTLSZbO+RjcsqAiZByCsg9LV7im1icvbpB
         e9ZbVXx8nkgjKwORbubfV0OBWxkPfnfaERYsieI7uVcx9sJV2v7WfufpcbbskbfiUAFB
         iQVketQZoE6meah9ID3/gxJNfbfLzM5O7efN5Cm/tqzRyWb9XM+ArkzSNzuL2L/nw01H
         02G5QVYdZGxSlZFh2a+n+vH/5bjL+A0wgvKweANTWAlPFWvGraZMJMp//z/t+A5Jzd7i
         VS8ACWQ3yabIKziWNxzI8oM3EnyWMUtGlSo36ZCcPEFVDKEb72ZypR4lAH6IuCwVLlJa
         gJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377886; x=1701982686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1IEPeV7y9azAnEQc+JMcCj6y3anlcPqDkSElaKKwJw=;
        b=bNpNb03N1HNcKYSmQEXJjMBYlh9lCHUmIT9fRquJBqsRfUdx/r1vu1bs4ROPAHlCJU
         5S1L4xIUYq3B9UHXPy2bzWPMkl35cEFBurdk5XFwse1JoXdZ91w1y3a2Td0OSlnXu//n
         DM8WM56xNyD6LyJxxSP9c7XoJYISUN2LfSJCFUz3us9h4jFdSnCna0MryA27CMNV4Yed
         fuKHZST5vvAigODKF8tPsb2TMoUf9TdPg4Z3YQibVpEWhyDPfOQqBdfLzF+cRXuH2fFQ
         /OgnK+K9xKPnxOHO5Focz+8RW2/3KpupFDxQyKdYrhGYImgcxLkI/u+wnI9vqShXXHtw
         cHeg==
X-Gm-Message-State: AOJu0Yysj+Mcivk7mFvX2A3dWrq+KYvkrC95L//Fmcu06B9mFTfS5N51
	xdWGVvBsF/XfbNMJ3324N3uOQzJBiXDaTRzfTJ7Vnw==
X-Google-Smtp-Source: AGHT+IHj2oJRF48x4t4AHm96/rDVlMjxjtsQmcn2nnfbkjBATP5ZJrJSPzYGMjcJO+HM7J+Dkp0KKg==
X-Received: by 2002:a05:6a00:8d3:b0:68e:41e9:10be with SMTP id s19-20020a056a0008d300b0068e41e910bemr25889044pfu.20.1701377885646;
        Thu, 30 Nov 2023 12:58:05 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/25] linux-firmware: package firmware for Qualcomm Adreno a702
Date: Thu, 30 Nov 2023 10:57:23 -1000
Message-Id: <a0569427f1c5d0e002d9659d5b102525247bf5e9.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191533

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Separate firmware for the Quacomm Adreno A702 GPU, found on Qualcomm
QCM2290 / QRB2210 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ad24c24dc534b2da7dbd858e1436f8c0d1e86809)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 800c621d6d..bd46f08724 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -364,7 +364,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
-             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
@@ -1313,6 +1313,7 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
@@ -1346,6 +1347,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
@@ -1378,6 +1380,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
-- 
2.34.1


