Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F230C4708E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.16956.1699127833563943228
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BMtlvm1k;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507cd62472dso4592450e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127831; x=1699732631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoEbZtK7IRIh/2UBhyANpFDX2LIWfK0Cp/grVtjE05k=;
        b=BMtlvm1kXUPm9wjtDtI6yMJTFlUnv58wyV5coInbJ+MZbfh+fYA80ltnbYTkDj8Mks
         ei7RNuRdN/R+UlO2N8rZQO2uJra8wRNt7i+0iKbBOdDoyzrKkdhfgeB7jTJMHZ99YcSh
         REjVRIJHS1b0YkFtjeM7e51AfoIB76Z1ojrUBCzA7oA7TT540slJaba58P3PZjIosmtq
         C/zWp08zKy3OBlgS1wlboDhT03lr4nX51nUhsmURCTJW9qrnyMIsaQtYTAjM9gCISYL5
         9O7VR/7yD2C4w9Nl1/gtsFRC3odNvGdhoHv/hxNRElaXqYg8KjfpDI4nB+ODpplBzQVt
         UAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127831; x=1699732631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoEbZtK7IRIh/2UBhyANpFDX2LIWfK0Cp/grVtjE05k=;
        b=QC86p+CqP/B0yYeGO4UKKRg5O/ou3UnsoKdH0P+L2jnbqBuX9/nhvwvzsG30jaRr9t
         mIIw6O9UqfA/JTe+nMz91B53Te+j0Xlxb/u7OHG8OvSYmwgKxARnZ97TuT2nLbg780ok
         me8oZXBGKqzljFqEnD8w2qHQawEeiRR/Mq7DBsneW6TOVhBol1fSVs+7ZVDs36SVae1g
         5W/c3PFOL8QKSspKJWyM9EzjdjBbBqW0ffbdR447RZXPNlak8vzXRx/vzCxSkJfYdW8q
         JYuiRs+MKdDVg0e/abz7cibmxCaVZdEELj7ZQpWQvDUzry2lVe7qPpAoPAOSvqOA47aY
         x8mw==
X-Gm-Message-State: AOJu0YxEjqNq1errq/2F7mH0jiXIHtpXZYfFeeRPkKZDcZgoBCTO143I
	IIUMHwJuaC+77UmjddRq8PZUJfvZRer1Vou4x+0=
X-Google-Smtp-Source: AGHT+IGC7RCQ7+EKSoJh4Jj0BGh5fA1zea/6HG+Wu4ZbvUXSGJ5+CgH7OUsQ3er4J5kWegToeWfxdg==
X-Received: by 2002:a05:6512:3d94:b0:507:9b69:6028 with SMTP id k20-20020a0565123d9400b005079b696028mr2682874lfv.24.1699127831663;
        Sat, 04 Nov 2023 12:57:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH 8/8] linux-firmware: package Robotics RB5 sensors DSP firmware
Date: Sat,  4 Nov 2023 22:57:03 +0300
Message-Id: <20231104195703.18923-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190181

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add package with sensors DSP firmware for Qualcomm Robotics RB5
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index a3c2f8e37065..55fb811010d5 100644
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
@@ -1343,6 +1344,7 @@ LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1388,6 +1390,7 @@ FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/fir
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
+FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1430,6 +1433,7 @@ RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.2


