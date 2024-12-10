Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5CAE77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 23:46:38 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.7688.1733874391615739061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 15:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=isfWKlax;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so62451741fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 15:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874389; x=1734479189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foitNYAThdmKcaHVEROnXxQ0DRavsrfXln7FMWkJank=;
        b=isfWKlaxtTS+i+lbH1awB41vwMtLCL5n4xMAAzba1rrlon6T2OCtLJtQgeWtaqkYuA
         OYkP01/OiskLXMnUWdZpw4syadv2kswzgIiHBx4+hDR9P2gcx5Pq25emcLCQMSWLtmfu
         CZ1cWGg3kxaO+LxyV5k7i3WrG1dRIXPdo1TWal1rVlQ0D1sL7HUDKfH3S4Uvnk3ytiOu
         joNVrSyqP1uINsKlwOHTJ6e73c7UUT6KN54U60zuGYfgDjRqxGv2TH19UBpxezvYmujj
         ylRDL42jiDq2Ey2lVZixxMzyIWX0fNRapOAggLqeyqHaDJfVOLHbcJnobpuNsfK6x7NC
         qnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874389; x=1734479189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foitNYAThdmKcaHVEROnXxQ0DRavsrfXln7FMWkJank=;
        b=hbbkr/PdG6c0lirNEMrFRKM1OpjK14F+a6LkKpH+RyL1/Mu3SZAiiCTtAb8JGFFls6
         124+81kE6t7Jpz5FFGoG/ZDLDUsUeIRKbuXDCRiwwgpB4kxKDJdNZ8hbgg8HgeVIDoeY
         FLRvRX8HvkWkdJR6s/91PB+59zrRR5Dd19WSPhzl8DMRk3eirw4bTReMJpwWuj2Pdxjs
         crqWA4VYGN2/jNoZvQLVN584e7bmOBW/s4l+2LLcyAuvFyyjKuFouJUQcar5M6SpL2W4
         vPuAeR9BS0fdKELn4XfVsMaCXTU2uDjmdwaK+XDEeQMYYySrip3NL9Nu96mKoBrtOnZh
         YxPg==
X-Gm-Message-State: AOJu0Yx8RsfR7kKkRXHvx6LrGVOZCZV5bH0CTccSEMlE5gOvc5BYnZim
	n+aZMUGLxjDdoJVeTfvm8JomByJHXCM9BtBmPRFsE3wBWo/dmz7775s1GGox9/wWCzUZjaaV2I2
	jVLk=
X-Gm-Gg: ASbGncuBxpmhS4mNrrDcl4pSVyOzr4WX3KWqTilbEnIRKcLmGbeIJfIH1o+1L02QCNL
	BOVAp7UbX6ic/g3t6JUlxcXuz/xBat0CXBRohM04WYq5UtY4NZUbC3Zzep+4xHDtFXVdgrbGclm
	hVk4GRlORsHCtXYTchkQa0RbDmOa2TpIg33GXRjAfcT7epD8ZT/94Sn7Njbs5lrvYrc0k7WPfja
	V+3PPvoSfrDfcgLoQX7ZfCKm6MYKOP726qd8mNmDPM6kc8mQFVbMJwgM4NPYYzqCZvm1w==
X-Google-Smtp-Source: AGHT+IEfkum39MfRhCu+m3ab4J/1I90XUYROTCHspLBnE4Oxls15kJftcbS5KGAaQk5Vgznzw7TaiA==
X-Received: by 2002:a05:6512:308c:b0:540:228d:b8d3 with SMTP id 2adb3069b0e04-5402a5d6f83mr198159e87.1.1733874389467;
        Tue, 10 Dec 2024 15:46:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402955eeb7sm128851e87.203.2024.12.10.15.46.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:46:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: package firmware for Qualcomm AIC100 and QDU100
Date: Wed, 11 Dec 2024 01:46:24 +0200
Message-Id: <20241210234624.1650171-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210234624.1650171-1-dmitry.baryshkov@linaro.org>
References: <20241210234624.1650171-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 23:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208567

Split packages with firmware for Qualcomm AIC100 (AI accelerator) and
QDU100 (5G RAN Accelerator).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20241210.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index b3be4452ca97..d3757b5bbc92 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -400,6 +400,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qed \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
+             ${PN}-qcom-aic100 ${PN}-qcom-qdu100 \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
@@ -1422,6 +1423,8 @@ FILES:${PN}-linaro-license   = "${nonarch_base_libdir}/firmware/LICENCE.linaro"
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
 LICENSE:${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
+LICENSE:${PN}-qcom-aic100 = "Firmware-qcom"
+LICENSE:${PN}-qcom-qdu100 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
@@ -1478,6 +1481,10 @@ LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
+
+FILES:${PN}-qcom-aic100 = "${nonarch_base_libdir}/firmware/qcom/aic100/*"
+FILES:${PN}-qcom-qdu100 = "${nonarch_base_libdir}/firmware/qcom/qdu100/*"
+
 FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
@@ -1538,6 +1545,9 @@ FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm865
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
 
+RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
+
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
-- 
2.39.5


