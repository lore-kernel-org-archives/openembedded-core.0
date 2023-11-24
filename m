Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6BFC61DF7
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.134530.1700829119851895622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wYkWh03v;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c87adce180so22660931fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829118; x=1701433918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fm/RPm4eb/1/hVeRNu/UlVn5OWoCEeTLwVEUBuLmxs=;
        b=wYkWh03v9sAZvZuQeBkmlTxRkZnZaBjAeTLyAoEqKmAEvXzildHZjVRWAastO7rhVA
         xz70sJTHJaMy+XnGmSn2rSxlLqfsMbL6MLuiJ7S0ctNP0lsy87ONBiZkOaokv6AckQyU
         M7ZqQyXfe8b8v/OTVxAvRaSRNa5pCFkmO8/yoMRks0+WQGZRuscaCOvEPIl0QE1AVJ9t
         3BZ8qK5DkjQxzTKa0Z4utaJr0TuSNLE2uBGF8c9LEkTmD8ei3usfO8OakX+xNXxmBF+M
         TcgV7csWakk0UoZ8Ay9eqoohQxXo9M45eF+vR7MC5b7/4wKdFmkG/Ej2MBUJbGAKHiJP
         HQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829118; x=1701433918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fm/RPm4eb/1/hVeRNu/UlVn5OWoCEeTLwVEUBuLmxs=;
        b=aIsID3ZMG0UJoZvRh2eLu7wgyYl80y5NPt5XfMWfmpMz6/x6zbdRYqYPoM9eUe2Eix
         0/SEDdOGs9iKsOlD4Wrt18xrDD9RijOTiyufQFQ5EC5IMT5CZtZGDmaAdyxycCoQxqun
         PazsFumjJPFpSP+rCDAQyThLyEolQXVLTHF1boPKD0U2m7Jl5SaKBYaMHPu7SzhJUq+A
         y5SjjqRxnTXjw5lF/LbwSCW0j07nUasGH2gRmVMy0reAP9O5Os76Ac6dEK2zJZrte9Yo
         jpP7OErixpkGyVOp37xIUTCYPUQi1X6mF0pQMTHRpTBa/hWnlc6PG3g9tbuJ0j+FRLDn
         1yWw==
X-Gm-Message-State: AOJu0Yzov5GM1hV1GvnTyu+iKgJsUdSyzFQE/GSZ+z8TdCQ4KyferwMg
	lhodjt8SzuN9ivndZcH934SHY1lIduKDP5PKVVE=
X-Google-Smtp-Source: AGHT+IEly974ZksYhFmqlDA0bhnOrHQS85mCQkvlYqAYTR4g4eOk0Vv7kyixIX7njao05QNLag9csA==
X-Received: by 2002:a2e:3207:0:b0:2c5:6cb:2e50 with SMTP id y7-20020a2e3207000000b002c506cb2e50mr1913015ljy.27.1700829117885;
        Fri, 24 Nov 2023 04:31:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 09/10] linux-firmware: package Qualcomm Venus 6.0 firmware
Date: Fri, 24 Nov 2023 15:31:50 +0300
Message-Id: <20231124123151.1091665-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191192

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Package firmware for the Qualcomm video encoder / decoder (venus) core,
version 6.0

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 51a64bd01adf3a81086e6368af01abaf4081a515)
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 55e0d7f71224..be8cb9b3e9ff 100644
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
@@ -1307,6 +1307,7 @@ LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
@@ -1350,6 +1351,7 @@ FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
+FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
 FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
@@ -1392,6 +1394,7 @@ RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
-- 
2.39.2


