Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877AEC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 17:36:29 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.3016.1692812184797773986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 10:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HVDQpMfO;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b703a0453fso98054951fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692812183; x=1693416983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RubFrVYmF5q4WYxWUMoPaP9FwLbST5W9VPDOyiUlSE0=;
        b=HVDQpMfOViZXwRPTkJLS4tToakoAFGUpetoYfr8PM2CmcOGe9kr3kGVsqooFHU/A0Q
         WndivxBmGDLQ6dO7cSbs5ovXl+hQMcdheCFVVfLvSBvcQ9KEn+76iGil4d8vyv/WZaz7
         Jz2IOXHXfRXYZdUkZu7l0cXp29+kqH6lPLCGuusSEBVkOg8sSQHBJEi72mDW7GrM3LRl
         zgFrrdT9BDdJwrV98zjOWJ+rKbYfnRvchq3RTvZclQa1SFcV4skQ8l0bkc/3TBYej7X4
         Jj4IjCdvjGF2iYftI26WFU//hKwqIb7aj/NgXvl7/ePVZq10PzIU1UoLWqAaQFd5BxBq
         UZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692812183; x=1693416983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RubFrVYmF5q4WYxWUMoPaP9FwLbST5W9VPDOyiUlSE0=;
        b=jnHneqI/Z2qHYbfy8Yb/6CTBdxWpbB+K2Dh8MYsOPgxhj9ZChePEDEIoBRKW0mb8cc
         K12Rkc8R5MtpL2WGJ/DiHentbgZazmBFpU4s+IMmSxnJJdNXekeJNsraDSPjBlz8Bt8s
         qq5Wdk35x1AHe4psk+/iFwvye9+uhMx+tNPPDfOwWGI5JY3Y8WH0AoIZCHFgJdN2Q/QT
         YkpHIby9NdsQkR6A5ykp5QIhGzvtzxjg82P7UMr5V5GhOlzvM81clH1smMznl3GSHd7k
         ALzs9TaA3OUGfw35n7L4o5UIjiOsUdP625zrzZ68cWJvHC3WlcGEihS8F2eEZPnWstsu
         p6qg==
X-Gm-Message-State: AOJu0YwC37a0aMQpCrfva8nwnvlk0FITmXVbDCnlvjPh9BK0VMCHMjoa
	m3uKJia7Fr/9dU7I/a+g3y5VIcfbBKq/IbqhEEI=
X-Google-Smtp-Source: AGHT+IG6UPjOJuxCNJXzLqezlb2BTFSGI0IkD2i70LzYj8NdSki0iBaUbSU7a6O799gUWJvl8M94Ow==
X-Received: by 2002:a2e:7007:0:b0:2bc:d6a8:1efd with SMTP id l7-20020a2e7007000000b002bcd6a81efdmr3459655ljc.39.1692812182899;
        Wed, 23 Aug 2023 10:36:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e9256000000b002b9f4f3e16dsm3341578ljg.85.2023.08.23.10.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 10:36:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-firmware: package Dragonboard 845c sensors DSP firmware
Date: Wed, 23 Aug 2023 20:36:10 +0300
Message-Id: <20230823173610.1589565-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230823173610.1589565-1-dmitry.baryshkov@linaro.org>
References: <20230823173610.1589565-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 17:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186626

Add package with sensors DSP firmware for Qualcomm RB3 aka Dragonboard
845c platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 36939f04236f..d761673db390 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -327,6 +327,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
@@ -1025,6 +1026,7 @@ LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
@@ -1058,6 +1060,7 @@ FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a6
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
@@ -1086,6 +1089,7 @@ RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
-- 
2.39.2


