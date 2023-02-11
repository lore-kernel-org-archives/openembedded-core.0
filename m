Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FABC636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:36:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.11322.1676129785104420895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=F2Wyr1j6;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id j17so12872698lfr.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b80QDN3V/fHMiF2Me9zYnp/OyImCLb9Eoz2casRiNm8=;
        b=F2Wyr1j6TkITvzXG7vVi992NZk4F/S9PKDEBoShAKOhB6v4MLwXpSCfVJmi7/G7wep
         ii7V0wSrd1qCbXT96SlBGdWXJJYKLRwjaKv8OcPtfyMCsPCxEBuR3QiD9EQwHGFer5Xh
         +MfeR3jbpTacKkixjFsNfGtnBdIhZS7cc0QfemIJSTkatmwRkE+yCH6nj2wMLScUVWbi
         46Cl4ZnTk/FqQtuSBZmEQ5EXLVVtsOuYdB2RwmTv6fZV2Eep0x0UEbnuVYCi4NHKxQGN
         IkAqfLD2UOvQLdN7NGl6WaBEGyCBe8wH+Paub6SkFoEQSwJnm2QBwJg7BDXHrvd5yLVY
         fnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b80QDN3V/fHMiF2Me9zYnp/OyImCLb9Eoz2casRiNm8=;
        b=JNBod1Otg4OwtNBBpL2SBH/bXp3uUnPT3H08q9RR0Jw2EMhfeBGwiJsrUa06/43Q9E
         uuBg9P7DtaMz6vQa87mWoQOJB8S6yU/RIGe2NE1wkZnc/ktrGxmkNGGMtdYlzZzTon6b
         0IrOtHplHl3kZx3BmLMu+fD46As3v4FZYPf97Vpq0uzua1B3dSthyZ/S5mpd0ZbvUSwP
         3N4w23J5UahhL/q+CqAcX2+DiDGxjl0LaJjDJter01UgI79qQmkzle5ZVHBFFqgTh9Ao
         aO2D3BQ73si2Yh3d2h0z8PpGXtKkO3+xqvMXcRUQe7rWL1oLpDi1ZB1ZlMLwFC2jOL15
         HSHw==
X-Gm-Message-State: AO0yUKUp1fHP9AHpey0RdDLa5QV4oh68oEhbxBgerMqwtS2xcGcjhphK
	9WgY9I7gSmnXuMFSojHv9aTOhQ9YeFzxxL8o
X-Google-Smtp-Source: AK7set99/Py7rJZT6z78yO5I6jsQl955jS+6FCRZGM+091vjNsJQUW/KU8KPnLeTj1HZzWzbrt3HgA==
X-Received: by 2002:ac2:4425:0:b0:4cb:1645:7259 with SMTP id w5-20020ac24425000000b004cb16457259mr4394364lfl.61.1676129782551;
        Sat, 11 Feb 2023 07:36:22 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y12-20020ac255ac000000b004b57bbaef87sm540019lfg.224.2023.02.11.07.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:36:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: properly set license for all Qualcomm firmware
Date: Sat, 11 Feb 2023 18:36:14 +0300
Message-Id: <20230211153615.2112747-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 15:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177005

It is not enough to depend on the ${PN}-qcom-license package. Set
LICENSE variable for all the qcom packages to point to the proper
license.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20230117.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index 1dce06c8f599..9ae0b2be13e4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -983,6 +983,31 @@ RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
+
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
-- 
2.30.2


