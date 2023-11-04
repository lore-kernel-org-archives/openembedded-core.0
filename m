Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5738CC001B0
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 19:57:17 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.16951.1699127828673855281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 12:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IVvcZmRQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507bd644a96so4534871e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699127826; x=1699732626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qht6MX07/VWi+C09EjAiDbqVkDARP3J34LKy4NzgdE4=;
        b=IVvcZmRQfO0fIcfNJtwIMf1Ra1RR/e4/RlFNgT3NIgwrzTygp4nR7ybiSNz/miOxZR
         7KWBI1EUVT2ZvjLRMz04lJmdM8QoNPPbjjGmrfY6VJYyCVo7jCEmBNnX4GdAzMpixdJo
         3HVWRzV4lHyVjERleQizE34HjhMXi67Y86eZkUns4yvrPQn/Dpddd/6PI2zY9bX8FzVe
         bdcUOT2O5j2zOOWyUzrLi7DGJ9pe6n6GXwwiziI4UeU80KBM2b+vLGEaHX+UifWSS4qg
         43tbdAvbmnxfwrGqB9EA/vbULgOXcmdFx3cX1xFTJiotRkv505hv/76mIbaWxgFhShxp
         ECVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699127826; x=1699732626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qht6MX07/VWi+C09EjAiDbqVkDARP3J34LKy4NzgdE4=;
        b=xBDB0eQRQZ3rpSCpou1D+j2PzuewYGM8GFPUYEYOVNNVgUona33jlA9z8U4sO+6yYV
         vZp67uOr+by/Z9seM+fJzjGY8to+EW4/UFgMTNGY+pmvVGehxhtNT265e+4QWRWTUHZh
         pXHRJQC0nmxUYUwwXORVII2TQMWctPXqv+EJx6AfGSFcQ4LHDS25NQF7W18nYpU3XuO6
         90Y3AgymBeO2x5VCgRFSEbZoSeNY7tIhfPoK2/ta6rHqyBbHK531rnuivyEXJhbBg7XU
         u1b8eGWKbHZFr0WeDI93zjJYPzY+NtrLpDWjgeSeyu3xmNDS5Ar6njIvN7SsFftYmh8T
         lKbg==
X-Gm-Message-State: AOJu0YzgqXmeS1AxUE/Zz47fG3zHsZylw0V+uwCdHcrCFXIUC44wNGAw
	XGncGoiqfuFQUKStvjnW+kywHM2+dsqm6KKiew8=
X-Google-Smtp-Source: AGHT+IFEyV9dLGsih7B2Z/6tGEl887E2/acjG/bYWt7Q/ed23WZGfCb/5Mbt02Mh+Cw61J3E9RaBrw==
X-Received: by 2002:a05:6512:1307:b0:509:4025:1ac6 with SMTP id x7-20020a056512130700b0050940251ac6mr11449752lfu.54.1699127826302;
        Sat, 04 Nov 2023 12:57:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b005079607556dsm595576lfb.146.2023.11.04.12.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:57:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-firmware: add missing depenencies on license packages
Date: Sat,  4 Nov 2023 22:56:57 +0300
Message-Id: <20231104195703.18923-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
References: <20231104195703.18923-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190175

Several Adreno packages lack dependency on the package with the license
file. Add corresponding RDEPENDS.

Fixes: bf00a042d2fa ("linux-firmware: split platform-specific Adreno shaders to separate packages")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index efe8de12567f..a4e154d4680f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1379,16 +1379,19 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
-- 
2.39.2


