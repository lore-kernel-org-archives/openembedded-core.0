Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06534ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 20:45:36 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.15630.1663274729359460860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UqmPytA8;
 spf=pass (domain: linaro.org, ip: 209.85.167.42,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id s6so21068023lfo.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=I93WX9Un6vfJ/9pjajHP+Amm8sjg7GVJeXGIoGLW6zQ=;
        b=UqmPytA8cMXr5mBHfnEOH1bLf0Mxk3UJkm3KageNa4He5JcXqTw5/zKgfmWDW4aWHh
         5LUKQIed4lxw22fGEQ4M5p93hBIKURNANp2/Srmhn6f97l2Miro48vq+f3vgYjgMS11v
         XWS4EnsfCp4lZmk5r4r3Zr9lj/ed3Z26anScHr1yDL0oUkncKoxDIuCi+UQSQI91MlAD
         He/guTlxWwgScAVlgotZ8wQPLryJS4zBegNpG1LZQKOjFGGlS3lnhYXjJp/8AWKAbWZt
         TFfEdYpsF3o98RcwtRmTdGy7pyBeeP0s9fKOcYug2W+IAtf96i6cqGu8dcyq4Ctaifwe
         lA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I93WX9Un6vfJ/9pjajHP+Amm8sjg7GVJeXGIoGLW6zQ=;
        b=4NvgPWi/uUT343WKDJz0hP/zh7fr74wtwsrn7OilnbZI8eW/r4FZT1BB/dh0xv6Euo
         sYQWTABM3oS7sugjD1gfUA8x+t65OSIck2QqsgqA/KLQ9LU5WodRDLiY+iNnNun0TicL
         NS7SRriAHmC70TykQDvAXPlcIa3Ev5YjWPCXsVepQveiZSAJNlaH8g3TMp5kM2UobwAN
         6e5JOpMGcCx5nQNBNLk8jSCIkUj/003hjmeh5VExpvSkWklvWIf8J6gpULzCP80kSAkP
         fBe/rmKvHCE3ToBlLwq7yOQf2q4k/ZerNdK0my5qX5yMOYcUR3FAKqvxAiRMGOz1FHq6
         +PUQ==
X-Gm-Message-State: ACrzQf1kxZQEdKJnDXIjAFe4oZNDzez7YlXh1OTArg6T98tJeIoqWqNE
	ShpMb9yFUPQTeGfdrM1RHwjjmiL8sNILYw==
X-Google-Smtp-Source: 
 AMsMyM5DAt6Tegn8036eFEv5ChqesXgPnKwDo93GsYDm3jLuahP0ATULkwYZr5MKoVNRYtNaPei67w==
X-Received: by 2002:a19:911c:0:b0:497:9d9e:c2a2 with SMTP id
 t28-20020a19911c000000b004979d9ec2a2mr572967lfd.458.1663274727293;
        Thu, 15 Sep 2022 13:45:27 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 c1-20020a196541000000b0048a9b197863sm3108246lfj.235.2022.09.15.13.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:45:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: package new Qualcomm firmware
Date: Thu, 15 Sep 2022 23:45:23 +0300
Message-Id: <20220915204523.2407692-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220915204523.2407692-1-dmitry.baryshkov@linaro.org>
References: <20220915204523.2407692-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 20:45:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170773

Add packages for the new Qualcomm firmware released for Lenovo X13s
laptop.

The INSANE_SKIP:${PN} has to be provided to silent following warnings:

WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20220913.bb | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 5a953fd0e234..45c9d0e86123 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -311,6 +311,11 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -976,6 +981,11 @@ FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${n
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -996,12 +1006,21 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
 # For Amlogic VDEC
@@ -1081,3 +1100,6 @@ python populate_packages:prepend () {
 # Firmware files are generally not ran on the CPU, so they can be
 # allarch despite being architecture specific
 INSANE_SKIP = "arch"
+
+# Don't warn about already stripped files
+INSANE_SKIP:${PN} = "already-stripped"
-- 
2.30.2


