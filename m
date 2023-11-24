Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CABAC636D3
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.134327.1700829118363644130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PfYp4+xQ;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so23992841fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829116; x=1701433916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd1bWhfMtBafmz0e2Nu+uWwyPaeJuzMyzDPgRBIByjE=;
        b=PfYp4+xQSszahla/Jdgay40NO+blbJYqiVfmw/gQJtcapWizemzDsSkXLThP0I0lTt
         vi9TXGNrTEGL2xMu1av75Mzz8Wv3zrpiAUcRP5UIFkGPFnjfcSij3UzuqmOGUdKTicPi
         guR2839rfHKpwtTx9KP9jxE0eDwelK13sl29MRgLK6mv/WXlnfgb+7n5eFVnueUlgb1t
         bCN2B8fAoxqNxdKuzMx9cBYNUqm+mE54ka5qM1MFLHfeava1z54EviRegr3rbsQ4wv9+
         S+FdZMj3mEVk9e3x/lAxC9+aEHonBTHzHbFkK96t+6+i2CC1u16tu4bm5+ZJLJfBBQ/U
         7tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829116; x=1701433916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd1bWhfMtBafmz0e2Nu+uWwyPaeJuzMyzDPgRBIByjE=;
        b=Qc3oWHRq+ZI4R+yZ51jT/2zLI8a2IacPEQAb/M9jEQImB8SXPlkAQexYUjbjdSllLE
         T5AjyC2mlh1d9gMDWP4FQ0ZzAJ+NA/in6lO8IUwGJW7n2V9k3BdC9S2HTMVQT05AhYSr
         KtJBhkpLYWvY+arRUqZ5xS70LS99eUhDtudMLdMnKbDwfQ+Dn3zhDKbXJ9l0jquD7Mbl
         5Figh/yxAkUA/dIEO4fu57IDhR66abswJQ1AbJugqxdIXGPRlslZZpR+6d7/vkcxwKyL
         iJAtKBqutP8iYTMLAcJu7+Ik2L6FmIWyqAVj/PniToxujZV6GxfsZqMR5Knit27PXHCQ
         RLig==
X-Gm-Message-State: AOJu0Yw10HTvQ3HYdJCKnY9wpDTxHg1VAeAS5QynmDVA6jvt5ArRMjpy
	w6yXHj/mlhB/XVMCZlduYZQM6nqycNJOXODndow=
X-Google-Smtp-Source: AGHT+IEnm+bRdSFrQfaCC0D3XHM0jUaGuS0NV1Dpp7m2dk+8oThJ9gMIBNB0SIRqI2eY318bw8zxYA==
X-Received: by 2002:a2e:9095:0:b0:2c5:3339:71d6 with SMTP id l21-20020a2e9095000000b002c5333971d6mr2004290ljg.19.1700829116503;
        Fri, 24 Nov 2023 04:31:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 07/10] linux-firmware: package firmware for Qualcomm Adreno a702
Date: Fri, 24 Nov 2023 15:31:48 +0300
Message-Id: <20231124123151.1091665-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191190

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Separate firmware for the Quacomm Adreno A702 GPU, found on Qualcomm
QCM2290 / QRB2210 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ad24c24dc534b2da7dbd858e1436f8c0d1e86809)
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 800c621d6dd0..bd46f08724fc 100644
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
2.39.2


