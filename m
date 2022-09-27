Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE98C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.14422.1664301264056667834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JEWi/FqN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id jm5so9726006plb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=CGlNt66noQgcTS237X5JXpOVqtZ6y2jyLEvWtOjmNAM=;
        b=JEWi/FqNnQyhhFD/iKVz4dMyUeficXxRNLHC7GgJWKzojCJmiCLdRi0dSAvJhoXVIZ
         AWkS0/6dvhlVqU+WMGd1iq7GetqpiNeZEMuH1n2xDUYW+oO4J8tkwhhl3IsShtvvlqdr
         /9/WOkCVinJ2eChrTzFcESjxY7laFdKU+kvydiNk/CBSaPEfvqpH1eKG3uQKuHLDkKSm
         KVDECZ/uXBzjBaprQKVsdOwrBjfiyOiPjpVy0a2cINrMFsH1Xc6iHItyMojV/vjloQPF
         sGyI35e8DPlbotiUg258J7uoXLA3mY+l63zlf1YDt8jQA7S0zkruxa4DyWOThqoVYxnU
         bPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CGlNt66noQgcTS237X5JXpOVqtZ6y2jyLEvWtOjmNAM=;
        b=KV1FpIYQGJL3OxdwBK6mvLdflX/yjcBRp8tgo3vejRGx7Cgl7KqYKnn7PoDysOC8RB
         v6Ci5AKUuAvNHt8s8baj7jANre/eFB19u1apDJnHz2i34LoK9WO4k5WQvqb9kaI0rUHx
         yL6PpLF9r4apnDLNZJ7CUXPVx3/2OhxvK9xo8Hk0cli8QwehbU3WohKE8H82OGwv1EDo
         yGGYx8DTismGLKuLtbfEhX8zq1L8ZDwD7Vut+E1gQbIO9pQ+VLYGLkKLEeweK6+EwEWj
         fEc1nHKDtB7+wgMeDYBq6QEuQFCeteR8Hsbwb3pb6LHx/q0RdEE4FGk0U+Zalg++QI8O
         n4SQ==
X-Gm-Message-State: ACrzQf1VWauUf9H1kEec4LoOlU+ePDN6jjGYVpUIn7zffe9ZoXbv05cc
	ozZZRLp6ChFXDM2iJ7nWoOeUP3iomJqnaPWW
X-Google-Smtp-Source: 
 AMsMyM5ennTKtr/fexoD1BLRCQCYlXUuNOOstpIuSrQwZoQyXwIODLYzhbw2JQlD2JJUHUZiyHdOIg==
X-Received: by 2002:a17:90a:e293:b0:202:6eab:acac with SMTP id
 d19-20020a17090ae29300b002026eabacacmr5667561pjz.203.1664301263083;
        Tue, 27 Sep 2022 10:54:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] linux-firmware: package new Qualcomm firmware
Date: Tue, 27 Sep 2022 07:53:58 -1000
Message-Id: 
 <705de0a585b9e6343075eb6af41b8f8972ee327d.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664301116.git.steve@sakoman.com>
References: <cover.1664301116.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171121

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Create separate packages with firmware files for APQ8096 SoC and for
Adreno 2xx/4xx. Include A330 firmware into the 3xx package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a0cb8f9131d1f238dc150e583a7ff816645765f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220913.bb       | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 683da1c411..52ea8259eb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -308,8 +308,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
-             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
+             ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -962,11 +963,15 @@ FILES_${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES_${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES_${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES_${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
-FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES_${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
+FILES_${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES_${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
 FILES_${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES_${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES_${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES_${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES_${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
+FILES_${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES_${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES_${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES_${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -978,11 +983,15 @@ RDEPENDS_${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a2xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
+RDEPENDS_${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS_${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
-- 
2.25.1


