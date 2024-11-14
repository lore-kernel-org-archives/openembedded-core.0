Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77688D68B3F
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 17:05:09 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.45.1731603893544004351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 09:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G+eoRFzT;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ff550d37a6so9094541fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731603891; x=1732208691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LETh9576nQNllldXwTUbGgoAKWUhkpITj4jU+EakG5Q=;
        b=G+eoRFzTc451T4Bpg8Ypekw+AmzeurrWeBZ41AucKQIYqVUwKYWxsbKGN9YLj9TnYA
         i/y91rYEDTQVJ8zrZWb2t53pnyrZkfGPNKxIJOsy9srGe0tFwISKfyLzqLhJ93E0KTY0
         gMs9M15GRxV/rwJzYrkonzcsP7vvGZo/utuhawJI0J59krMdssY1UgkxDNDB0ZwUYOaC
         fPM63lVPrcRZD2FSl+XSYpE6ebKvCevPeTUDKvqtECzS0Nksv8okpAiFR0WNH0JpzfE4
         mvw1ewSpzEMsG0zrghYAhe161jLUTR3zS9gJL+ftsD2ePm0tekgF2HKWA0RoHoZdbuDH
         6Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731603891; x=1732208691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LETh9576nQNllldXwTUbGgoAKWUhkpITj4jU+EakG5Q=;
        b=lgNEpYo51VOfGhJMu3UxGgeNceYk3VssypdTAV0y3u5xiqVrL7QJ9tMFdUlCTy3lS0
         1YZHjnAFZWEVZgPDsXbvPv18TA1t+SIVxeUXFGhXJ13dfXoyDPgFnDdEtxJxq0zrYOQW
         mhOuaEb8BrQgsCTKk/eKrDk/XeBPNgTiCiZOyczcFQ8r4p1Ktwe89hnzGYzThEFCURcy
         LuRp5bSj/z7ZkCXpp6eyi2G16OIW5yKj0ff/0RMATjIHci2ci+EiCwa0veX6GhgICTKW
         HyVKHw5gdIcjwPSOL+xi0hNW3H92ADRChx8794F6kJZe0/c8l1KRXZt5AuuRSrCbYqnA
         WSZw==
X-Gm-Message-State: AOJu0YzDJNtmM/rh6MDbPq5Z6v4d2vugGY0W5nTIUj9zuxzSpFbu+iKE
	Z24QoA1J25e4lp94kypkeQBO2cDH7cF46Uto2NQddVfABuWZfLv9/vzyca0JI3uINo4vL84hsri
	A
X-Google-Smtp-Source: AGHT+IGTJ9KGDiDbzXEO5s6jMIhAQf5+hUlZ8Qk2qhu7LMPSRgt4Pzdey22HnAHqK3tF237GmjjHCQ==
X-Received: by 2002:a05:651c:248:b0:2ef:21b3:cdef with SMTP id 38308e7fff4ca-2ff20259646mr128051941fa.25.1731603891082;
        Thu, 14 Nov 2024 09:04:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff5977e038sm2336891fa.47.2024.11.14.09.04.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 09:04:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-firmware: package QCS615 Adreno ZAP shader
Date: Thu, 14 Nov 2024 19:04:45 +0200
Message-Id: <20241114170445.3092435-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114170445.3092435-1-dmitry.baryshkov@linaro.org>
References: <20241114170445.3092435-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 17:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207175

Add a new package with the Adreno ZAP shader for the Qualcomm QCS615
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index daebdca13273..7b23f989e569 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -410,6 +410,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa \
+             ${PN}-qcom-qcs615-adreno \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno \
@@ -1450,6 +1451,7 @@ LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1509,6 +1511,7 @@ FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]64
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
+FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1567,6 +1570,7 @@ RPROVIDES:${PN}-qcom-qcm6490-audio = "${PN}-qcom-qcs6490-audio"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.39.5


