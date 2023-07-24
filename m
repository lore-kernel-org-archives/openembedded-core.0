Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1802C001DF
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 13:56:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.47230.1690206969632063002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 06:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fHl9I3mn;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-317009c0f9aso4018606f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 06:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690206968; x=1690811768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vuMJ3FMpG/AXgxvxOvI/h4V61g/sMgwvwl4HKrKVVI=;
        b=fHl9I3mneS4/q24kGDHXR1pUg77TwKSJK5TF4iuAdFfxDohsT/pf0iGz/reaV6sReh
         km7tV3p4tdSD/64NPR4w1MSyZD2J8ruXZrd1d89QbFTaAvkREcjAVQq9pTIm79UO1IZG
         UNZaWK/TvZidTQhNSnOdd/DTeqhCywtlYrSQYx/EKyM9Qb3o23wHXa07wJXyfvchU9AR
         XgYe5jL/UQo80xsHxSPebe42XpOfPJ/YhFX+qHTq+xPAw0rfkdsp5DqD/EsPlmBeBgqY
         X88r2KKti2XXKEz4VKG/3j2uwiImstK6ZZrS9Mya0MfrLV32f+RL0SunaVBgZWgqYSOq
         8p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206968; x=1690811768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vuMJ3FMpG/AXgxvxOvI/h4V61g/sMgwvwl4HKrKVVI=;
        b=ZmgRvI0Cnm4AcTFIcLJEkyCqGRXzAlmmIwLmBtP5Dd/Jlqwer67VnVS74uXSlhVsi/
         XQo4elUa//WgHh+Ov46S9cRH1LhIOoIJYZlf6WRT/rgzDq5XtHEcVM6R9QVt1msfGhWU
         gO8p7jFBRH5SzVC3fE9ujtxiMpEkevJFDooOgOGt8fK0vCZUYJX9uiquU9rfFNHYEqDZ
         UJSZd3xv71F6548MjzzHnc5wWw4CERoMrrJ6Ss+kfCpvhZqY+G3apRrfs1XicIwhATYi
         YT9auKLLQvnYBhkQbGRPRvDEbnVRltTWhBUT85rSnHzuo+eB9S0lo15uhTwbufvbJIxK
         b0BA==
X-Gm-Message-State: ABy/qLbGBtTcMwX9mjaCgkc8+GuVBgD1NbuqiE69dFtpj1NawHNHWZMF
	GudSRiNIvIfjTkL4E6sKoKYamtrqStGO0ISxP+L3WYC7
X-Google-Smtp-Source: APBJJlEeCAizfvcWgNRyrlL/AvLCxwrSWthU+Ejy37W9KCuSl9k9B5/JRXPqxC3VXikfk6+jwaSnDw==
X-Received: by 2002:a2e:7312:0:b0:2b6:d5af:1160 with SMTP id o18-20020a2e7312000000b002b6d5af1160mr6362622ljc.28.1690205135804;
        Mon, 24 Jul 2023 06:25:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e7d04000000b002b6d3261571sm2862871ljc.99.2023.07.24.06.25.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 06:25:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: package firmare for Dragonboard 410c
Date: Mon, 24 Jul 2023 16:25:17 +0300
Message-Id: <20230724132517.781666-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184787

Latest linux-firmware archive inclues firmware for the Dragonboard 410c
device (Qualcomm apq8016 SBC). Follow the rest of linux-firmware-qcom-*
packages as a template and create packages for the new firmware files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20230625.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 329a3e3c9aa0..a98a4e9b45a6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -315,6 +315,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
@@ -1000,6 +1001,8 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
@@ -1027,6 +1030,8 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${n
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
+FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
@@ -1053,6 +1058,8 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
-- 
2.39.2


