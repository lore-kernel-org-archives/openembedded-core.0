Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FDAC5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 04:15:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.70967.1724732132487675862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 21:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SNp2JdPL;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f401b2347dso43056811fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 21:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724732130; x=1725336930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AJlU/UFNVQ9tsrdpEqf/GG98aeElwtlX8xdKD768eYw=;
        b=SNp2JdPLEq8/bd8shZbuFvfDob1kHcyCUOluvp5iY0xUte1bSDYAT5XCZjHtv/KvKV
         dk6qwugpn7VItPN+2h/ADAOqZyZdN+Qfkz5mGNS3rxY7ZYtYsGcG2/Bo0X7rD56FqEmk
         WJVN2ScLjsc5fa6xJso0DoM4NpX47P7XrieHYjbQsHKYrcYz09v5NCyrUyV2gGEMxMTF
         fln4ZA4iaCmwpLjq28iVGyw93qJ4R3MHNjML1qZuOILUdUEGGvU5ToFkxfbeH1D+JMRW
         rOAQUBjuSu4z+Kmm1+UxH2ZeBrnlbTu7RdNkA3svxzr/8ZeyssQAJmKbaihx6i0cd1Yj
         9l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724732130; x=1725336930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJlU/UFNVQ9tsrdpEqf/GG98aeElwtlX8xdKD768eYw=;
        b=h/ii32trF7U803ZYxJGLkn3c9+J1VG97hehL1Ayp3KwIzoK8aoAQ64u5gJXKvTBaAi
         /3K2uFruOreo9WdOaRMaWybPMwXnjHKzlxMxbUEdxzDbexYvhT3xS+3hDT05dnza1r/v
         kbYLCOT/vwEPquVqtc7BtJAar01R+t6sxkZBtxggIru9rQ8Sndn9V8lW88uMe8ocQVN7
         Au+M+ePXw5Ffp05uKxvQEP29vwsQO5DsSlyfb84iGmclzAZUe8JO3jMoM3VSr82FDjNs
         ZzH1ndoBIsI3u9+Y1HQZcSiuCrFAy2HWf/a7jEmiHvK8t8T+uXBy3JrpMrx6GIGUYo2a
         IqQA==
X-Gm-Message-State: AOJu0Yx0Hk7CD/OJ3FqYfxgEn2HDIPBxIyxiRLcfJncYlUDSMrBsxtO9
	bjzreEl+bWV7/iqAl5aKa6aVdubwFiTK5FZMasr2lyY0KEvWIxUk5ZQmtAFU3iNx9y1ytUnS0ap
	D
X-Google-Smtp-Source: AGHT+IE7eoUAIfmXk/WotPqikTwDOKN4If4PDBcSwI8ZNcQakvWCU/TJZBtR1ztLIAom5uG0+vBEYQ==
X-Received: by 2002:a2e:be91:0:b0:2f3:e2fd:7def with SMTP id 38308e7fff4ca-2f514b90146mr6111431fa.6.1724732129157;
        Mon, 26 Aug 2024 21:15:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047c6663sm14865871fa.51.2024.08.26.21.15.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 21:15:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: package qcom-vpu firmware
Date: Tue, 27 Aug 2024 07:15:28 +0300
Message-Id: <20240827041528.1586037-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 04:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203775

Release 20240811 has restructured the locations of Qualcomm VPU
firmware. Follow those changes and implement a single
linux-firmware-qcom-vpu package holding all VPU firmware files. Use
RPROVIDES to provide previously defined names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20240811.bb  | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index b6fb0f9a4560..468dbbe67488 100644
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
@@ -1452,14 +1455,15 @@ FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a6
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
+FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin"
+FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-vpu = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
@@ -1503,6 +1507,8 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 
+RPROVIDES:${PN}-qcom-vpu = "${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0"
+
 LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.39.2


