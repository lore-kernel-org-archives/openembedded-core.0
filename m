Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F884C6FA8F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:02 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.5607.1692931679405745695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0EYvln02;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68bec3a1c0fso443709b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931678; x=1693536478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ektUWTwtmdzJOt1Aoept6RFPYVgj6wCUiUfo3TmFCUg=;
        b=0EYvln021kbYDd6gNSc/nedrl3N+OumHqMtpIBYqiiXrXVuOjKMJlrY3EyaW3h76p2
         eChn0cE+eRbRE80caSHSlhVSXakyQruB2mjodco6kZyf/YLxkzSIoQvlzyihkqlKB78A
         K7w0AUcQzUgtPIWz9NNEYpdqvKcr/lDEQH/yx57yFGPDyxXebUc24qnb1bwPYIRN9rKL
         wZ16S77Fem93nZw/Qcjfw6w0Iu0EjNsv5Gnb8ozs468z3h8/FWBiKMGjVz/FAvZBusa1
         AAFImsYi74yaK4ieHITmEFRhrvFIPiau/mrba1xPMh26hav1/hpeYtSUDY9RFbMRHmX6
         5s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931678; x=1693536478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ektUWTwtmdzJOt1Aoept6RFPYVgj6wCUiUfo3TmFCUg=;
        b=Nsz0yoSvY5LyJyDFecp1rs4iaUKItd9TJXqnAH76p8PGwd3gBfyffjRPKE5e3kzfyK
         oIjCH2/b8sqCpOgLBL5MwRO1DkGJMXnSpKLhGYOLfXQOfm7YLvK2IaftT3IscDIjJXWT
         ugxnc50Kgig3cPJA/2LcqIPpQKwBJVs/PESirN4W54K3OZHDxhRrOeQ7Gz/dfTSxnDUW
         SD3iO+2p6myDLbSAsNLXjnNmKkFY6PP6Vtdi246uVF8K8De/KY5RbSTNzLYKxpRhrrIg
         YiKXOYl5fTbAFDl19CidQrT1MPASJczAGBBiFNE6ViZQTHapbMqMo++7HbeO2AT74FMx
         E7ww==
X-Gm-Message-State: AOJu0Yzbl02V+xOnia9PMBETiTTE6Nor0tsRFzznixh1hF6WZN1fTZcB
	Vttawj4Ox7Lu1UCQd0S/yc3Qbv4brAWUQaPXjkc=
X-Google-Smtp-Source: AGHT+IEd5PSq1+rDw3M9e/CSVc/RmDjBVPP3xuOwBn7gfnT7quUh9pFON6pZO7coD2BenOKB6An/XQ==
X-Received: by 2002:a05:6a20:939c:b0:12d:ba1e:d763 with SMTP id x28-20020a056a20939c00b0012dba1ed763mr16287453pzh.7.1692931678430;
        Thu, 24 Aug 2023 19:47:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] linux-firmware: package firmare for Dragonboard 410c
Date: Thu, 24 Aug 2023 16:47:31 -1000
Message-Id: <a3a369b9972967a8e22745fadf0a88db355f7e07.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186680

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Latest linux-firmware archive inclues firmware for the Dragonboard 410c
device (Qualcomm apq8016 SBC). Follow the rest of linux-firmware-qcom-*
packages as a template and create packages for the new firmware files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 380216e8d3b63d563ebfb10445fc6eb5e77eb9f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230625.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 046272337e..4f6dd409f4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -313,6 +313,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
@@ -978,6 +979,8 @@ LICENSE_${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE_${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE_${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE_${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE_${PN}-qcom-apq8016-modem = "Firmware-qcom"
+LICENSE_${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE_${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE_${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
@@ -1005,6 +1008,8 @@ FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES_${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES_${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES_${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
+FILES_${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES_${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES_${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES_${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
@@ -1030,6 +1035,8 @@ RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
-- 
2.34.1


