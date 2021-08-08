Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.9162.1628425743583439114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 05:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lm1PZ8Vn;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id w20so1470584lfu.7
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdCSNfxN0v+du46ohlS1PNtKmHXQ927Z9U8nlouKS2c=;
        b=lm1PZ8VnoRlAyTQYTIT8aWQo8eRIdaeOE488V+mOTkZf8QNPY2Qny4D4iTackRymtI
         F37hTxtmOr5bi3O/a73Sob4CCfa5x2Wyjw3B19vfTcRcJmQnjBJ1r01rBqN7IkUuHxDm
         11tSJOERAd+mLPMoIcLYvwG+GoXzFcipVtVzxXJNy5rKwkfl6UelYqK33zvIkdvZfHSs
         8DERknDwMUtqS7+ZrWL2uz0beBGRIztdAs60Mo1ZuucoJulkNjSgonMr7ebPPkqrkzcw
         iuKik+ZFh0d7yht/1g2OGcw8YW8vzcr9f6vF3onb7R7Yw5/Tg71wd//aQfD8fYQYtn6c
         NLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdCSNfxN0v+du46ohlS1PNtKmHXQ927Z9U8nlouKS2c=;
        b=tkH8ZSAMxNMY2NWGKZBFE5N4OlPMffghULaFcE91VEuYHG5OpJ2Al83qXlZsPbX2tS
         6s9W7fgH0wCxk8ZOaladefIFIyUoNcZiVSDQel9wKWMR808BYCHCmBI5AA6Kf4vki12X
         CUq1BNtqUcrNn8kz3CxpbN++tvXWzwa5MaMg/l/LKEiUGWEjtljTvIeVVoUv6k/dLW2U
         V1pboo0G+piAJONBUR8xPbUH+MQkLhLcOcjLyKvkb/YDQaFZDoyOSZiloKPUezVgu0cb
         isbAm5B9fedco+abb5E4RIaoN8fFjATHnzdFDleLc0jXEyDvJsuJwIujpzowUqLHI/sy
         CxHQ==
X-Gm-Message-State: AOAM532JWh2W4NGhUDQmAErSC2AV3FjfpbnSwioSLrS9OoGe5yPAHcHc
	5UUZkn6wxt+KhstXpfwM7uJJ9VVHutjaUQ==
X-Google-Smtp-Source: ABdhPJzGNwE6inZCr5bypBFU82gTunRRShrJ93uXdK0A4qSOvF25pNwwfqLkgXv2ql8SbMhATO+cZQ==
X-Received: by 2002:ac2:5319:: with SMTP id c25mr3645976lfh.96.1628425740934;
        Sun, 08 Aug 2021 05:29:00 -0700 (PDT)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z24sm1407722lfr.105.2021.08.08.05.29.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 05:29:00 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: add more Qualcomm firmware packages
Date: Sun,  8 Aug 2021 15:28:54 +0300
Message-Id: <20210808122854.2890538-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware packages for the recent Qualcomm SoCs:

 - linux-firmware-qcom-adreno-a650, linux-firmware-qcom-adreno-a660,
   containing firmware for Adreno A630 and A650 GPUs

 - linux-firmware-qcom-sm8250-audio, linux-firmware-sm8250-compute,
   containing firmware for audio and comute DSPs on SM8250 (QRB5165)

 - linux-firmware-qcom-vpu-1.0, linux-firmware-qcom-vpu-2.0 containing
   firmware for newer Venus video encoder/decoder

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20210511.bb   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index fe46cb519259..d91a5562ac0e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
@@ -303,8 +303,11 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
-             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
+             ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
+             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
@@ -952,22 +955,34 @@ FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
+FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
+FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
+FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
+FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
+FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.30.2

