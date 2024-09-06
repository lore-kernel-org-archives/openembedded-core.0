Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A20CE7AA5
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 01:33:01 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.25585.1725586371579169238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 18:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t/LFQCjW;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f7528f4658so1999341fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 18:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725586369; x=1726191169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCbGqg2YrkvNUdJNxBpIIrf6lNRmz/Kw//8eF4VDKF4=;
        b=t/LFQCjWWr9gKuDwXzIss6E/2zcF8We12ChgO1LpeU2lYRQsVCAuLnpQTnfvUHimIz
         0F1sIgckvIjSAc6EcaeAru45+jsqYXf4gn1fgX/2Eiyxr/ToPuUFhzSS3jVd4r1eG4DB
         IRRpzpGrS3BBKvmlDxwHeZ2HQbda8YyB3SfnGHI6EuPP4DxjJ8buDjfQhw2ou8lVWRP2
         nseydqizHi1FhtW45j9IXHys3uDOKg50FCHHJREfisdMp0dp1nW72Foe8c4FetJTNxGs
         Lc9nydOJv+7oyRd3BhrVyhO3RBQcGcUpTSkEd4OnWvUUvuTNyTU6KrteyM6wOM2xWgHz
         S7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725586369; x=1726191169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCbGqg2YrkvNUdJNxBpIIrf6lNRmz/Kw//8eF4VDKF4=;
        b=vVCqMthFkxccjCVkPj2ugFc5XkxtjoXsp6uA+E0B2yVQhUql3f2U9839TnkrOyBfMp
         zb0Glf0hLtl6eqT0WIZXYrf5FITYxG5T4WYxp7SbbA+fjG7kqSGtRBLmT1uQVWMbugPh
         s+kOwmjJNp8E7EEQX0ieN92QESjzHdXi3x97k2B7RxfeO9I4G+o2t4sLoPxpHGRMDVqo
         VLtHGI1xaECsLZyMDZSTdoGzowfdllCk8ZouEz86kg2JB1Qm7/OEfO7vvBHCx/pGNWgb
         Y5JGQoKCxZiDPPRucEaFt7tLfvtXN4hzITVz2X8RU+VaHBGuESPy2Ypjix3bHRs2M02R
         bB/Q==
X-Gm-Message-State: AOJu0YyZY5oG9SvQZAye0G6Ix0CCEr3i9TqdNeg8Ve/M+GM62Fvl+qu2
	IeV+QLM+CvBh20o7Yns+AGSeJpBh/2OYcFVJ1LNV8cXS3sluWAfuK9mst7mjVoBaChCbLES/65h
	C
X-Google-Smtp-Source: AGHT+IErzEFgkDbIq+/WxtC/LJklaRHtiI1HLkxljg/gbCJdUQBVjLUEriUvLeAOWmd3+NKccnM/Pg==
X-Received: by 2002:a2e:9816:0:b0:2f7:4e9b:93c4 with SMTP id 38308e7fff4ca-2f751ee7048mr3893521fa.19.1725586368811;
        Thu, 05 Sep 2024 18:32:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f66498ccf9sm3508711fa.65.2024.09.05.18.32.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 18:32:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: add packages for Qualcomm XElite GPU firmware
Date: Fri,  6 Sep 2024 04:32:47 +0300
Message-Id: <20240906013247.151885-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 01:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204246

Add two packages to handle Qualcomm XElite firmware, one for the
board-specific signed blob and one for the unsigned (generic) GPU
firmware files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20240811.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index ab22bc83bbe1..b620a6e24928 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -391,6 +391,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
+             ${PN}-qcom-adreno-g750 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
@@ -407,6 +408,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
+             ${PN}-qcom-x1e80100-adreno \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1401,6 +1403,7 @@ LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g750 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
@@ -1430,6 +1433,7 @@ LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1451,6 +1455,7 @@ FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
+FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
@@ -1482,6 +1487,7 @@ FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/c
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin"
+FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1497,6 +1503,7 @@ RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
@@ -1528,6 +1535,7 @@ RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.2


