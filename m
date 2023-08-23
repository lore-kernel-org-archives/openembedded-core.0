Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889B0C3DA66
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 17:36:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3015.1692812183418339660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 10:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NuVtlIgt;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso90326561fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692812181; x=1693416981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9rIcmPgI5rcU/JZGQK7sWMTTi+3TCwR44mzpgwYfRI=;
        b=NuVtlIgt9+c74tEPSowKFNmFXx3s9Z6atjJh8eC6AD7cs9I5vGrjOT2yoWCRUTGBNy
         +ty8EeUYYfu6H2E/+ewqi4tLkOKh5L3S5onarsLtGnhMNYXyZroToPXxSxznAjnX14xQ
         MBsOmXfB1Xj/clxSMVkczqd17DQLOHtRwvfpmrk9tKgJZEm/LiEvMXVqGqMV2Swz9KLi
         bnJpCfQFk/f6tr+qnKuqEG8mI89NYL2lrEk3deBwNk8F5E54piZZLE1TvlFAYTI2NtOh
         DGQNNp3v95zYcePuQYrA43luZIsLuWASytp5Lb3y2GVw7oXOF4Re4iDnDNzAlHvE/yft
         bmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692812181; x=1693416981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9rIcmPgI5rcU/JZGQK7sWMTTi+3TCwR44mzpgwYfRI=;
        b=QRhPQzsuuCexPjUTb2r4Ej7isYk3pFFeHqDdEgpP80Ejw5WLMC1EvuAl1cgC0OjTJR
         tkZ1ybBoVAqZrCDWtghYPI653RYNPLMLp5Hoy2LKZ3KORSdT+xZ1ePWvSKYKT/hWdG88
         7ugNDSPKJe4zOLCHJERtWZChoyC+cFtdrp6PXiwHoqm1ZsL613d3oufbs28Xde1beu62
         dJx2YPKEt5NKD6yCOpNEbheCjdU7LOKCAgwDOKirjyfwez/90weIjvtZaCZXQ+uoN6yP
         W81l78a2SSFPJJdp5wcjNq5m1R6MzBBA686mP+jPJpurjcy2SG5+TV4eNv+QyMxe4X9c
         vcew==
X-Gm-Message-State: AOJu0YxDUuUn0neuDQs/G3QhpXCmPjvYLLbuNGANTJ4lPzXMw1+IS2k0
	E5Zu4dL0jyilufyU64p36hPamTFuMw65gTRLRfQ=
X-Google-Smtp-Source: AGHT+IG6/8q8QY3OG8134ZSN++s8CRIRpcPOtFecBPAZwvIzxhh6xwjzPxbVcAvnVasqk+pWLid2/Q==
X-Received: by 2002:a05:651c:14f:b0:2bc:c4af:36b9 with SMTP id c15-20020a05651c014f00b002bcc4af36b9mr6016566ljd.52.1692812180808;
        Wed, 23 Aug 2023 10:36:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e9256000000b002b9f4f3e16dsm3341578ljg.85.2023.08.23.10.36.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 10:36:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-firmware: package audio topology for Lenovo X13s
Date: Wed, 23 Aug 2023 20:36:09 +0300
Message-Id: <20230823173610.1589565-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230823173610.1589565-1-dmitry.baryshkov@linaro.org>
References: <20230823173610.1589565-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 17:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186625

Add audio topology description to the qcom-sc8280xp-lenovo-x13s-audio
package. The file is licensed is copyright by Linaro and licensed under
BSD 3-clause license.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20230804.bb              | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 4defab434de2..36939f04236f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -34,6 +34,7 @@ LICENSE = "\
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-linaro \
     & Firmware-Lontium \
     & Firmware-Marvell \
     & Firmware-moxa \
@@ -97,6 +98,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
+                    file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
@@ -167,6 +169,7 @@ NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
+NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
@@ -1014,7 +1017,7 @@ LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
-LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
@@ -1047,7 +1050,7 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
-- 
2.39.2


