Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCF3C636F2
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.134528.1700829117215093861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TnZ6A7Cy;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso22405881fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829115; x=1701433915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE0qB1NMNkq8ExcNOAIAnTmKyzm22UfjPhCSccOFLYY=;
        b=TnZ6A7CyMqi5Hx/pKxGZr65mAPyObtvNXUG/y4LjIcPqgTaFZBHjTij1QhcmhihVHI
         +M9tvP3pdk7vT+rgNSTW37ka8tXRSEKOKGnu61OVf0guyf1FdiNUw5bE1cfDPrUSNK2H
         CVgBX1Wk2WPPySXqWvlvmLi1JABReKperEKF4HvduMH4X5Wu7rn6k2dpDparP34OU182
         eJ1CEAnFZJY/T9w29qog6GaIawnPTkywX3XyszfnxdtFGVnQIzgGwfl9FbWHniZT94sU
         GZekY56XU/SPGghMxraG5RvjFdRLS3GawVsGdtkLDNc42Rfbd5vu2w2hhhFWEziJWX/E
         x09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829115; x=1701433915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE0qB1NMNkq8ExcNOAIAnTmKyzm22UfjPhCSccOFLYY=;
        b=o/b34VoQ6898GZTrSQl83sCRqHknMtu5WFYAn6+XgaRDYeUh+hmS09Id5e/br+2v0y
         KlTT+qPmV/tWkvQsVgf4GOuGllyKMhXe5D7NWyEV1IqrTD2mgRRuT6Fka45iUpyprpe7
         Sejf5gJP4p0OF9s0lVp1ZZgZDnxFyin7x7Gm4ibf8nYXhJnUC4bL/cvKmMzgpreH/9r3
         W61OjyJWeodj5YMEomTYebQoSeYsne/vZ0O1h4l/s5qZtgFUltj71YUtn8gbv3nn56Ap
         HMoiIvLogqAsnKh3VEky3EhMR1M/11YFDEHjGIrO8ca9N4iuYVEUBcWoTPY19nRb2nHz
         p6gg==
X-Gm-Message-State: AOJu0YwEX4CEGtlXGNbgnIvlimscGqzEcIVDD6ZhV4Ts421Qyn3yvWYU
	A8DwaJQ85/MUL266Pi6sLAiUgENRxR+VHirnWps=
X-Google-Smtp-Source: AGHT+IGmD9VyqRLknyz9Fc35Vgd3Uaqjqj7kD9OdTvHHjHwNUu6lhs6fCGkhMGK9wxodYStaPpksig==
X-Received: by 2002:a2e:938b:0:b0:2c8:7699:7316 with SMTP id g11-20020a2e938b000000b002c876997316mr2253853ljh.30.1700829115322;
        Fri, 24 Nov 2023 04:31:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 05/10] linux-firmware: add notice file to sdm845 modem firmware
Date: Fri, 24 Nov 2023 15:31:46 +0300
Message-Id: <20231124123151.1091665-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191188

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Follow the upstream change (which moved wlanmdsp and notice files from
ath10k to sdm845 dir) and include notice file into the sdm845 modem
firmware package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e03d1b9cc06ae23a8abc8a30b1c09bd997465400)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 895d36cc02cf..2d446848fd6c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1359,7 +1359,7 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
-- 
2.39.2


