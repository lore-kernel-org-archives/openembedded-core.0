Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7708CC5474E
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 06:19:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.7187.1724825981598641964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 23:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tGmO8JKF;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-534366c1aa2so5441576e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 23:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724825979; x=1725430779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0tQ7l51/Li6p8FyJ+vjc5sq8uXUNKiqibKdtj8hG2fE=;
        b=tGmO8JKFeYJky4dszVyKwPNnzsuNVSmmHio1tUiOpqmY/lQhnLlIVOGvFFsmY24i4/
         cCSagSAmBTidCIoNy0Gg7Eak/IdVhxnYFHsLZCaCcW7gNcOYUqAGd3ASILSRWBdtQM9C
         OTeDzG5YCDX/T44MmqSXY+YsLnLFTxKqzMo+Ix4zrPWvTr7rypnSHdTl98WKij7um5a4
         atqfeCGDYi/bZBa5+ZgNkZZ3u0z+GRvyhiCQeFh7jEuKiDiX4tF5f+J4CvUJZCvyjRxU
         ORcm4u9GMJga+IuYaHvSP9dMDvsDfDTsNN0WoRtFNqnBC5QosHmrDx1LlA+NA7oK9/i8
         z0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724825979; x=1725430779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tQ7l51/Li6p8FyJ+vjc5sq8uXUNKiqibKdtj8hG2fE=;
        b=gOiP4xlN+GjhP97FR1qjm4zGS8jHXKKMqMBfmZB69N9PRj2xxE9oyetiBq2B74dcCL
         jH31ZszRTOFY3ZpbXXXKtt/B0oEBez0GBklMY5oUJj2P0fwgDjlnymSdXx9jwAiLY54D
         LGu+ILQnroUUuTTotLxIumAWW+/owZg2tRNS4Vgtnk0ciFPtVUM4nvXkORllWB6ZFn0/
         r+SlFFqlNwe4i4G+9kJtxXnAsM5mSjurf5lfHXfE3MgvURcl/InFrRbQpQIXAxqFqnVj
         LH9YCPJg77aL6UPMmjo2UjXrgQm7U06RnNXjDvhoP9mj4BYcoGozpL8cIKwLdlYdv8de
         fPww==
X-Gm-Message-State: AOJu0YxfbIuMpJc/0MjMo5+RDoqUUEqmTjy1E3ripqdLOS+adoQOPrNo
	p6pjsoZA6aNtBroEZ9U5CH+1GCUjPP5rXtSvqizAi46xX1DYjarIc/iAOEs1P9D7TFlCj2wBQwJ
	4
X-Google-Smtp-Source: AGHT+IHFu5TwpMlaFcWZcnuoiFDvydoaC6/U8iKm6yq0R3VxQMz6ofoGuzhEVbK6gOI3uh1J4/exgg==
X-Received: by 2002:a05:6512:3da9:b0:52d:6663:5cbe with SMTP id 2adb3069b0e04-5343882c7ebmr9905230e87.12.1724825978553;
        Tue, 27 Aug 2024 23:19:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5942bsm2048058e87.123.2024.08.27.23.19.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:19:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] linux-firmware: package qcom-vpu firmware
Date: Wed, 28 Aug 2024 09:19:36 +0300
Message-Id: <20240828061937.410739-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 06:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203867

Release 20240811 has restructured the locations of Qualcomm VPU
firmware (see commit [1]). Follow those changes and implement a single
linux-firmware-qcom-vpu package holding all VPU firmware files.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/commit/36db650dae038be945fb04def591fc726255b09f

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v2:
 - Point to the upstream commit (Quentin Schultz)
 - Dropped RPROVIDES (Quentin Schultz)
 - Dropped rogue FILES:${PN}-qcom-vpu-2.0 (Quentin Schultz)

Changes since v1:
 - Dropped unrelated (audio topology) change.
---
 .../linux-firmware/linux-firmware_20240811.bb     | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index 34f21ab9b325..3128fc3a4e8e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -383,7 +383,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qed \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
-             ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
+             ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
@@ -1374,8 +1374,7 @@ LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
-LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
-LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
@@ -1421,8 +1420,11 @@ FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
-FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
-FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
+FILES:${PN}-qcom-vpu = " \
+    ${nonarch_base_libdir}/firmware/qcom/vpu/* \
+    ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
+    ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
+"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
@@ -1468,8 +1470,7 @@ RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-vpu = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
-- 
2.39.2


