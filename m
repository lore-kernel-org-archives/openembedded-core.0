Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D6FC54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:09:42 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.74279.1724753374025755576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Yio4psdT;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f4f24263acso69795711fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724753372; x=1725358172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ty2AWZGi4NviCSv4Squ41U89R5+q/L3pzolAiqWI3Q=;
        b=Yio4psdTL2wDAjrLoe98/S0jhXj4juGgCPjnoV0CJ9ijGmEb3RUnPbHnEuCcmnsRo8
         7N51V4hzWj7uRdqL89HI8utSEpnShXxo/p9hxcnC2jVCJDOe1oTqcPswR/ep9plCl8Tb
         FZwD8dONVp7PAi00baZ/r1oFtbeqw9KFgKBX26m2Qz7FuQKzVR7ApWqaJjOy15xNtBM7
         YsD0fAQpqu/H+DNlJV2LILjTQU7fNhxJkaWyJRR0Jq9QBoinYMGL9MhiCEyMH5GVOPSv
         UepzOr6DKAEYwi6qWT1j3nQ2AP5dInxp3r8tw8/QOe7SStMo1WXPzJtpkJNGfq/j7eGx
         DHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753372; x=1725358172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ty2AWZGi4NviCSv4Squ41U89R5+q/L3pzolAiqWI3Q=;
        b=gUGmDth2PzimL3jHe6X9cfa+//M2M8hlk8V0ZlXe9PM0kaJoiN3PieGydLCwAQ3ePy
         kSEz4WXcpYZAXMmgOwLPAD2QLFTijktIedXc9Niy33Zc61FiRvKoQjOsETgzubw+QZ4y
         vaMeRKR6xBH05nJKjvboLQjKhcRqiS4HfQ0UkFLeMNu+90YPh11jXQM8y5m0uREQENas
         4/e3dkuHs2ZC4Nq5BYahG7ACT9FIYPVxmkeILnXji0Hp7uB2UPeWw4ZImi0nGUGA5Q88
         Kfp1Hj/uWbPg77KryS6RxgKSXlh50Zn0oIZnm3LehM31kLnT8NJ87P5TCpAk7KjBZST1
         WhBQ==
X-Gm-Message-State: AOJu0Yx0qEjnb74BIyAKkeOPlYAcKWwoc9kaUXTZ31a45D+MtUOTUNmT
	2QC6acGuiEOkNx+uTmznFUmDeMH1U0RfILd6oiaiACbAMTLnZ/JnfT8Tjh1ZBR0lvXOPYVzyBCv
	g
X-Google-Smtp-Source: AGHT+IH0/TML0cN5SxxL7qm7qQAWIxgSYn2B4hKLb7mef6dW7TTr4QdAKyf1yWBe/FMyDLn7rXuFdQ==
X-Received: by 2002:a05:651c:b27:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f4f571f622mr125527141fa.7.1724753371147;
        Tue, 27 Aug 2024 03:09:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047e0082sm15353001fa.70.2024.08.27.03.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:09:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] linux-firmware: package qcom-vpu firmware
Date: Tue, 27 Aug 2024 13:09:30 +0300
Message-Id: <20240827100930.127469-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203823

Release 20240811 has restructured the locations of Qualcomm VPU
firmware. Follow those changes and implement a single
linux-firmware-qcom-vpu package holding all VPU firmware files. Use
RPROVIDES to provide previously defined names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Dropped unrelated (audio topology) change.

---
 .../linux-firmware/linux-firmware_20240811.bb    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index b6fb0f9a4560..d55ac9267d8f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -382,7 +382,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qed \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
-             ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
+             ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
@@ -1368,8 +1368,7 @@ LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
-LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
-LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
@@ -1413,7 +1412,11 @@ FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
-FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
+FILES:${PN}-qcom-vpu = " \
+    ${nonarch_base_libdir}/firmware/qcom/vpu/* \
+    ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
+    ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
+"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
@@ -1458,8 +1461,7 @@ RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-vpu = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
@@ -1503,6 +1505,8 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 
+RPROVIDES:${PN}-qcom-vpu = "${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0"
+
 LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.39.2


