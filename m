Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF454C46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.5161.1701377891520341757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OTAAngy5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cdd584591eso1409532b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377891; x=1701982691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lI6E/nOQcSKeEVxiKH+5zcL7ZBC1AY8HXqBv+wmwLY=;
        b=OTAAngy5w/ipQk0Ef9EZCYFLQW+JeOPPvQXis4SxSw0qXNDD2LJeNHwvUXizn9Vqo2
         aaiuRSLyEmzbePrmvN59Qq81N5QSBgsWl2J2p9c1QLIgYHRUd6vKSXgS7Pu06yah//KT
         Uh9vYVWc0AHFkT9UgDo+Vl/t+VvpqbDckYT+VmjZkHexXs+v7PfIUHiXxB6PdFMBPkQS
         9VQtu2rLN1sUQNLmhSMx5TaTRnGhApOjjv9kjI56hzkq33jApcwVlZB1UH+9bITA0gec
         TXJHKJm3khYocGH4KIpENNDuea2/XuH43pbCyKeR1Hwg1kYafxpWT707MSOK8izBsdRE
         vVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377891; x=1701982691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lI6E/nOQcSKeEVxiKH+5zcL7ZBC1AY8HXqBv+wmwLY=;
        b=eudiYLuJ1Tbq8trM8NeKWqQxqiZ0mN9GaUKiFjwDOoFrlOQ0o+UnEws1+FAx1faICg
         E41VNFKg0s476dgdDguETdfj/B8SlaYen7dSb3YuwFlvRwPG4SA+6DWTwv4yzf3cL4Kq
         Lcxj3WgjUP1a9nQpMXrBzsW/WNfzOLz+KjSzavpREBS+Ybj9FjHl6JUddLdaCisi1RgE
         iFHIiE/RytluVyxJmUDpYPWu77QzUuwdp5O5tNKxJNHfDYVoGLrmK4jPg7yw/r66x4Re
         WAA92ILWXOHdeinPlzjvq7tdxlCxA0vi6jTldGmKfJKZJOPiwbZ7nMVd3JtyQ8VVIrRK
         hFPw==
X-Gm-Message-State: AOJu0YxnxNLgrRm7FuOQkkUiIY6m8coNicnKQHGo5E5L6ga4nTszMjtY
	GRX8McMEotTDoRQ8mdvpa+e1f4Tgkpo/yxOYJO1bTQ==
X-Google-Smtp-Source: AGHT+IG7rs8lRdeAVDKWbNCrzxB4jmjcAd9db64CPoqJkJUENThNx9X78Vv3eupk3+e5kA4C4C3MCA==
X-Received: by 2002:a05:6a00:2d28:b0:6cb:daec:8b75 with SMTP id fa40-20020a056a002d2800b006cbdaec8b75mr23254964pfb.22.1701377890685;
        Thu, 30 Nov 2023 12:58:10 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 18/25] linux-firmware: package Robotics RB5 sensors DSP firmware
Date: Thu, 30 Nov 2023 10:57:26 -1000
Message-Id: <3c33f44d7f4a13bb5ae734bc38de894f0acae783.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191536

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add package with sensors DSP firmware for Qualcomm Robotics RB5
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 195df10fcbfa1ef7e073d3332943458064519ae0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index be8cb9b3e9..c0394b9b3b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -378,6 +378,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
+             ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
              ${PN}-lt9611uxc ${PN}-lontium-license \
@@ -1344,6 +1345,7 @@ LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1389,6 +1391,7 @@ FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/fir
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
+FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1431,6 +1434,7 @@ RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.34.1


