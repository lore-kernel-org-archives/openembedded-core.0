Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1E2C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 14:18:53 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.79595.1724768327185377609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 07:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EEs1AylR;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so29843831fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724768325; x=1725373125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mp4hDiJ2wrkG0GfM3XBmeL53BbQ1hBpcPrQ2xUA4ROI=;
        b=EEs1AylR7S4maxkmOWLF2aP/BWe+YkzadW4O7ZJBO2IuRiSvXYS57loxuXfUPNhQtV
         cWI1P76DWd1FWvIKPeWPQrtKarcGG2Q8XHMAcloigNj0C6AqF73JO1sNh4fYgoZqwRu1
         UIp6DQCLlLNAafBeDpCltiKKjaUHepQxn86q0pJrVdbu0Pqwc2Ys8FdygKdAh/EnjIRN
         /dSHkkz3K5ruCvdvKpoRZs0wRnWu3+UOP9sTDx/OkQXbbM7+tBEwa3qB4Rn4HXzb4sKr
         4N6hGwC/I8S26OO9T+MgCJa4sUNRBZphGxMofF+Ej5hemvATHthkeR9EbY982At5fxww
         aeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768325; x=1725373125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp4hDiJ2wrkG0GfM3XBmeL53BbQ1hBpcPrQ2xUA4ROI=;
        b=HW//NaRqAJ7jwqTwI4Sy+xo5x6P1IUCT7jBFfif12jimdJdgd6CNP8GpxLD5XrulzA
         E5A6gsgn7PArGtuvwC/Tjs/FlNrkCwYk4xD/vNcFTUV7pm7v8HGDOWtCw8u7yt75pX6Z
         dVWucUazsaCsgjOUs2QURvGsoeN8ZBz0VUZlbi4FZAoivQPIEaMQdUmBysn65dJ4a8mb
         W8R+ZPlM0cG+oe5kfCRTy5r0CwL0d3fsH/UP1VciZggL8zPcuQkKq+gGWJG9tbCt0nE8
         A369bPf5TkPWATVrkufcf2KINSzloHPjEvpdd4Rh/pUc8uwpAm0TbgUUsF3nEAhfUzS2
         rRUg==
X-Gm-Message-State: AOJu0YzJ2fwOq48cZENxWHZ/ehYpxM4Qd5CuOxxi4tse5bWpFvLvX605
	823/kZpCzOjKc7wj20PLdroIEfc7dij+SLcpbv8Ue9NebjRe9JY5OaPEDyF5KOW8HByoo8LpwSL
	D
X-Google-Smtp-Source: AGHT+IHfUREpa1vU6z9X/L3zPCtKo1bPT/NTkfA9S/XKzXjpK9igLcqVfw7MHBAziolY5GdJX8Q6dQ==
X-Received: by 2002:a05:6512:108d:b0:533:415e:cd69 with SMTP id 2adb3069b0e04-53438831ee6mr8318817e87.23.1724768324708;
        Tue, 27 Aug 2024 07:18:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea36c03sm1800987e87.105.2024.08.27.07.18.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:18:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: use wildcards to grab all qcom-qcm2290/qrb4210 wifi files
Date: Tue, 27 Aug 2024 17:18:42 +0300
Message-Id: <20240827141842.339122-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827141842.339122-1-dmitry.baryshkov@linaro.org>
References: <20240827141842.339122-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 14:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203847

It makes little sense to keep board-specific firmware-5.bin in
linux-firmware-ath10k package if the wlanmdsp.mbn file is a part of the
linux-firmware-qcom-qcm2290 / -qrb4210 packages. Use wildcards to pick
those files too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index c66fdf071d94..3128fc3a4e8e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -1441,12 +1441,12 @@ FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/m
 FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn"
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
-FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn"
+FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
-FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/wlanmdsp.mbn"
+FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
-- 
2.39.2


