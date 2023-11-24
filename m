Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42897C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.134328.1700829120569503347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X45w/iFT;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso22406431fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829118; x=1701433918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSvay8BTD659FXVLxO6wcXFOivDdBGPDYq704snGBzU=;
        b=X45w/iFTubQJMTnYFlCUcn/d/ahlxc6SfGIOo9ZEiMBo9fXpIJaI4Nyr1IHLF3+mYv
         D2UkocqKUimqdYCSCkERsJuBiypS2eU92b+JvfyOvyeIG3IAYPYbe1Bs1xT7jRtWfh1d
         AVOvB2aTMrSn/0M26+u9GSCJeploTvxbN5cWnb8i/xhIy7d3LtfMCsMI6oqpxdLTx4Pd
         mVL53Zx0CIKBvaG8HsYpmD70JpyC+AtiCo0jC7mjqAB4HYFLur9PX3KjwFb3UHf1oySF
         Pjim3DgFq7o6no5v0D6F43i7+0TI1JrkGBF5hYpvpbIKhyktZYknJLsCKLSlA+6VYZ+1
         kFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829118; x=1701433918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSvay8BTD659FXVLxO6wcXFOivDdBGPDYq704snGBzU=;
        b=bb2ejyFAu3og4CB/lA8bY/1wfWklrz1GymFsvR2Hmy+6T1BvapqvcAMMNZ5x+c12sD
         ONmT/ej/mRhFn3PU6fAnkZM0xw4VJ8WhLZXRKwP0tpV80lzISp9Rzj4f2UyaeGsB+EdS
         HRt4raVkDjyGqxGTIj9Qvw3Nb62orO5Q6H9FDlbh6YJ+odBXUlnTAPlB1amdraY5j/AH
         BVJKD9XXymzuzcXemPEtiWNYiJHNjS8clNUx3uJkgmsBp6/xoyAb7T0qGki8Xzu1jXOT
         N2bXH3mffFWfrH3dyFQzUmEoiwJtRmWpXZWf0vO6h9dgq6LM3YXw+nmtMmWe04Vvgqup
         5Cpw==
X-Gm-Message-State: AOJu0YxK2axss03EKTsMpyPfH8yO5jyFpxMoNaHjC6rYPYBlRM65odFU
	XojFESNU8TondodU2HF9GLLVou91YzeHBLf2Dq4=
X-Google-Smtp-Source: AGHT+IHh3JfYpVyPYF2QPx+BcnC93+yzZYsUxAHxd6cvG+U+1dBIGk8e8jq2Wpx0gnKUDKod0KWXsQ==
X-Received: by 2002:a2e:93cf:0:b0:2c7:f79e:9c5a with SMTP id p15-20020a2e93cf000000b002c7f79e9c5amr1632286ljh.49.1700829118652;
        Fri, 24 Nov 2023 04:31:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 10/10] linux-firmware: package Robotics RB5 sensors DSP firmware
Date: Fri, 24 Nov 2023 15:31:51 +0300
Message-Id: <20231124123151.1091665-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191193

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add package with sensors DSP firmware for Qualcomm Robotics RB5
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 195df10fcbfa1ef7e073d3332943458064519ae0)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index be8cb9b3e9ff..c0394b9b3b95 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -378,6 +378,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
+             ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
@@ -1344,6 +1345,7 @@ LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1389,6 +1391,7 @@ FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/fir
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
+FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1431,6 +1434,7 @@ RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.2


