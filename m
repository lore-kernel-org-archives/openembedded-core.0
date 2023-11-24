Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5974CC636D0
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.134529.1700829119027826562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d7KYqT5M;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c8879a1570so23868351fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829117; x=1701433917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og/Z5Sj9P0YMveddYuS8oqwKP4loR4bV+9BRl+zthZI=;
        b=d7KYqT5MXxvV3bBqDUOIzYI3FKWyFpMdAGmMRZx2tx6ihBNIQuNpWB3Gd+VF6FOAsG
         YZLQEU4JBrgk4x3biA244bRuhB8pq9+0X4FpB+KpH7bk9cweqQEpIsgi5OKZbeKHDA6e
         P8mmUKKSu4tumc8aLQVoP7GiShBqhCEyjvy1U/Nr0cyUJQpuqhXJ+FE7yJh0NJs6x+ZN
         OGtr704eR7Tr4tXZgOu4FEVg8aJqKdK+f6I78Anq/qcogaYKBR1pARCzIDpJ4NBHazS7
         b/8AWvUtqlsjoWr3VVbRIeW243o7GQC87J3H8HpgovWZ4xLXVG+CSLenqWYmfuEqCQ5u
         UTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829117; x=1701433917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=og/Z5Sj9P0YMveddYuS8oqwKP4loR4bV+9BRl+zthZI=;
        b=ZmeGS0XJeCrX8o/ilRvDuHVm8xg0Fld1dpFfzJWCA4o5k+SJeRrLz5p1C6rXheViau
         iFDzBhjksMJs7CERIPoE9o4vC8pjxhGnCqXg/dLR/5t18TQalCzyt1pXLA3Qt4KfxV1v
         tq8FpSkXC0OqOCG15QUYcqNFDx4LYf77eHHNoCLXb1UUnVba8qBw/4bUTDvnzxjRU9wQ
         0lLC8ro8ZV4xd3R84LNNPeS/cIctY3n16I6593FbhYubNs/xTjiV6CedTV/VZy+rdX3p
         RTVaHLXEG93NLTo2it8B2nSkQvhq6jPp8RHarg9pLU+uTbgjUoiceMBzdCdDJx/ngSEh
         QJeA==
X-Gm-Message-State: AOJu0YwBsbhu2DYwwZVKg1PKCq5azILWDyKqTXgrBcWu5L+CtPbiVhV0
	10ig3LHUN9l/aTUJBin0zJwivzUaEiZ7KhANMVU=
X-Google-Smtp-Source: AGHT+IFQao8YFmSitJicPcWVVp+9QWz/lZGHPYUjOSz9qFgfvzBRKatQaHhXwiyk6Q4Ykv/TOyqj4g==
X-Received: by 2002:a2e:9909:0:b0:2c6:f1a9:e74 with SMTP id v9-20020a2e9909000000b002c6f1a90e74mr1826899lji.34.1700829117123;
        Fri, 24 Nov 2023 04:31:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 08/10] linux-firmware: package firmware for Qualcomm QCM2290 / QRB4210
Date: Fri, 24 Nov 2023 15:31:49 +0300
Message-Id: <20231124123151.1091665-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191191

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Package firmware files for the Qualcomm QCM2290 and QRB4210 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bc4170ca691df3eefa39fffd31c280b3ead111a9)
---
 .../linux-firmware/linux-firmware_20231030.bb | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index bd46f08724fc..55e0d7f71224 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -367,6 +367,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem ${PN}-qcom-qcm2290-wifi  \
+             ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
+             ${PN}-qcom-qrb4210-modem ${PN}-qcom-qrb4210-wifi  \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1319,6 +1322,15 @@ LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1353,6 +1365,15 @@ FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wc
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
+FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn"
+FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
+FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
+FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn"
+FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn"
+FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
+FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
+FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
+FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
@@ -1386,6 +1407,15 @@ RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
-- 
2.39.2


