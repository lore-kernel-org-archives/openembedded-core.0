Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AC6C41535
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.17268.1699127830272799171
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kx+Az3Pj;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507ad511315so4573009e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127828; x=1699732628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etznmcc8hoO5TRZopAjuShmE/JMpbCvEfcEJ5uF8ZpM=;
        b=kx+Az3Pjqj+xCAd5gqcY1HJnUDQT05dFK+gvK9AxLSJclnD33osJEb0YTA4y2OiVJw
         hqaNe75wZcPMXt7m8pFq6DhxKw1aybSJ+wm3BANVQ4x2MPzdZTIRnL+CuJkRTSGWlC8l
         8WvU+ZYamcWDfebJHPCi3wqA7Ngbo2TYJtMqP/IT8VrAesf4aFr16r+QV5c5VdQ1G7Kl
         Y22p8RUH7Hc1mvtt1LwmrH/H4W8K8N94HMB55TzfYjNQb+6cc/hDNnaw1IftazuqsFdH
         v9ztyVnzJQZopmfRTRzRFbciDE51PWaaU6nosfs3kiALETNwE1BIu5FdG7yihH0BceEU
         iHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127828; x=1699732628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etznmcc8hoO5TRZopAjuShmE/JMpbCvEfcEJ5uF8ZpM=;
        b=H/i1ekIe8SsWYHXLn3PQNgMC1Ano4+a0jrj5rhesobqP4fdOnXsbZdFJVMpPl6GIxx
         nxAyGNXr4gCUIe2r0t8eAWkZ+UQIyiVfU6gZcNsTUJAO08qIdr3CCORotMnATZiGpeJ7
         /EppnN+aj67es5BjTwDa+BZxWtXb+XfslXq+qfs4bRi4r6sPMjI6A2nB35AebLcVfGNF
         g9+5Lf4GZB1rvhKgHvbQnzqgW4XhrkdMNkVWxCkyCmLDV8gLavjmAdsKa2tstijUJ1G9
         Y9nkXDbZjU3Lr+RPQwu0WA4wxxTNwOgOPbCsasQIYeQeJICok3oJHn38TmHVe33WZYZI
         FyuA==
X-Gm-Message-State: AOJu0YxFH63RV5oPNs1cmFu4feds1i59dSN6iDThgh8T77VadZUm32Wx
	Z8b0CaNilkf2KtooauJnGw445qil358qEYJBzxU=
X-Google-Smtp-Source: AGHT+IFf4++h5BgU5aKP4TWASm1ibkmDXuMHi24/5yrur0osX7pRZ+hhvIris6cywlVZeVLLpKrilw==
X-Received: by 2002:a05:6512:2244:b0:500:9a45:62f with SMTP id i4-20020a056512224400b005009a45062fmr25262257lfu.8.1699127828208;
        Sat, 04 Nov 2023 12:57:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-firmware: add audio topology symlink to the X13's audio package
Date: Sat,  4 Nov 2023 22:56:59 +0300
Message-Id: <20231104195703.18923-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190177

Add new symlink required for the sound driver to find the audio topology
to the linux-firmware--qcom-sc8280xp-lenovo-x13s-audio package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 491662de37e9..fa0c466a09a3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1351,7 +1351,7 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
-- 
2.39.2


