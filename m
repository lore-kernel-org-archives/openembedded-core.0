Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A77E748F9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.62151.1696176040916585002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s3G7PQOt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c63164a2b6so15587745ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176040; x=1696780840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZ3UFUMIK9IzKchMwpQ6cVs1lr8dqMY/wrNg8+whVUI=;
        b=s3G7PQOtiKMFZFhGJ/6bgx4i78KqkPLDYTvxI+ZpkDyxD8jLii2O1r2S3e1iaSYQPd
         sixqcig2ImajenfRS+ZCBiMtUFsS2ggDtfoHLVNVxw1IhwszKNOyHU0QFxQ7z9+DuQn7
         J0/TRQYbbRiFE6ogsysaNorImZggzdkngJJaRca8edvh3HmWNd5tKEpbg/b8g0CvgnMq
         JNU4XrhPDnOBkMiO2YmK9Wd0oQCbNgzpZtJSWkLrB+tnQssTaPJtUia7/wCPYlEARRVf
         Nc6P2eDPYOZ3PnIMSQKcrfP2mvieyzMD2eveZXDvodNSy9gZEB+Ml5V3pwwlNYynSUlK
         1mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176040; x=1696780840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ3UFUMIK9IzKchMwpQ6cVs1lr8dqMY/wrNg8+whVUI=;
        b=PL92Zj+C3n3YGOCIY5rWlFbwTAnxwM/nk3iMSmYdzqHMXPK/u9+h09CE3Mq+WTzdRM
         l21D0iOx19UA8OUG/xi1CLc2QAMi4yHfYNRF8ykMfrlO10d6EmzF5xkhcxONGxBiy0oA
         qQGqB1mNSHBqy1No1dFflrcMt2s4p2V03Q7oEKiXCaT0YsMWw9S5Gxc1X0MQgFEvmglN
         2XhweTVQBaroAdg6K/KzhACAD4TeC+py2RVODXbD+OcaVWM/Hi1wkVXcYcrGaJcCE7IZ
         ZXF5QMWRSyLCI8gi5L41V4tv2xmlpbgXzwXh/+mSftwifPtD5ZF2TYk/B0Lsjx8PYg8p
         qNlA==
X-Gm-Message-State: AOJu0YzDVeoEueYzgyO53jlDPXLhLy8sN7+dPYUw/Ipxtx3SnnF3fdpS
	tY6/mr3rImxEYVZy+/bg9TofexAr7y4dgpJqT75ytA==
X-Google-Smtp-Source: AGHT+IE3Qeml2ksGzlz3sBdOffFAlUeIYy9fhRriTfsL83hsfB05vwVvnXrOVq6Y5ldpcwOUf2k5SA==
X-Received: by 2002:a17:902:da8d:b0:1bd:e258:a256 with SMTP id j13-20020a170902da8d00b001bde258a256mr15066603plx.32.1696176039892;
        Sun, 01 Oct 2023 09:00:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/23] linux-firmware: package Dragonboard 845c sensors DSP firmware
Date: Sun,  1 Oct 2023 05:59:59 -1000
Message-Id: <af12592ec44f9c4e2fcf1a9215f5c887c5b8640c.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188501

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add package with sensors DSP firmware for Qualcomm RB3 aka Dragonboard
845c platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 632a8955ce8f6cd8fe66fef4b116747e11fa7085)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 36939f0423..d761673db3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -327,6 +327,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
              ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
@@ -1025,6 +1026,7 @@ LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
@@ -1058,6 +1060,7 @@ FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a6
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
+FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
@@ -1086,6 +1089,7 @@ RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
-- 
2.34.1


