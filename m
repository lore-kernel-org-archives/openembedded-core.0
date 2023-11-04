Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AFBC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.16954.1699127831049464468
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hZ2BdBLW;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507e85ebf50so3967340e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127829; x=1699732629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5JHwxIwNSdUfeSLqVhcajHgg+kx9wASnT+l63HcqlU=;
        b=hZ2BdBLWsublyDA3E5XAbd7OD37LC4yA0bplZvxXt0IOU7ij3ba3nlmvUQkhLzXDMH
         3BJqBSUjEqORREos31KfMQdB+S5my1KKsMfBKTEUiWULZx4P3d3E6XoPCPbxoMZo9uSb
         5Y2Ru11jVflbPPdreOme6TwCJ3i5Mo9UDZw4Puz8Cxi6wUaWs5o+dHYv58qnvOzdT5zJ
         YovL83fwJg2HFS1Z6wwu33UZmb4YXbobUJ1geXIrK8TlbBNGx/R7Ii/YRH9bhtMEp6wi
         I2EcV47XcH/La7G1WIgQ1s352Il1KZYR4lzICCvkrkBiOH5DGEPM08X0+K+eXBlVsMua
         j1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127829; x=1699732629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5JHwxIwNSdUfeSLqVhcajHgg+kx9wASnT+l63HcqlU=;
        b=rhAMnrczBpaJRKda/cpW6p/2J1bR0cIrlHVcoDmRqnY1BJrFsL/tbp8OEcZZ5ISRHP
         3scK4EmvD9v2epUqU39L7KsPdayPvVqd9OjNICXbI1HGeTftHN4qf6BTi9rfnEoliDla
         3lX9fJd5ry2KMS8/uteW8u/58gWxCS0cCbJt8E5Ct6Rt9Xlx84P4Bxf2Me2R1j+okX0H
         ZbGTrMVRFe3s/hPqEJZpkchKpeHHI4x7mC164PFWn87RiHPmk44w8TrDH/rpxHRlXzGk
         1FrnftTd3oijvJDyig6gcci7HLWojXkqnnfyxnBgywU9h1QHzMMnKkp/Od091wy2rM01
         6pgw==
X-Gm-Message-State: AOJu0YzHyp6fNiuPIv474a9w9MMiDLs4Uw10ZvKKYTdFTg/0JJb/wHV9
	526cLyfoguLaCZb/4j723h86p//vzsQVimUaLOk=
X-Google-Smtp-Source: AGHT+IG/LKk9lRDQ5wXrJaa80o9o1p4tyHpjHjgF8UyPfDm40IxYotmsyBJGBUNkVSKs7aHr6P99RA==
X-Received: by 2002:a05:6512:3995:b0:509:fbf:f235 with SMTP id j21-20020a056512399500b005090fbff235mr20292587lfu.6.1699127829124;
        Sat, 04 Nov 2023 12:57:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-firmware: package firmware for Qualcomm Adreno a702
Date: Sat,  4 Nov 2023 22:57:00 +0300
Message-Id: <20231104195703.18923-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190178

Separate firmware for the Quacomm Adreno A702 GPU, found on Qualcomm
QCM2290 / QRB2210 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index fa0c466a09a3..f79e37e40293 100644
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
@@ -1312,6 +1312,7 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
@@ -1345,6 +1346,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
@@ -1377,6 +1379,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
-- 
2.39.2


