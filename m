Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1000C6FD1E
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:35 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.8697.1678229315108481274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=w07X+0KY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id s18so8587474pgq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lF54qiVWWqWJMbpVMSknllGvGqNMmqw142wJ+TsHpU=;
        b=w07X+0KYZmPBn0eLSUTCN1aIR0bUFEG7j3iR3bZyq6IyWlR0q2mjTt4s5Jc7RReQcK
         X85nPTTVnvk92eq8F3SnX8TIWRS8yZF3VXCKryZChOs8Wft5/hFG+Jc+hw0iklCxCvjq
         MAwnE8C/PzZObc7IkSpgmYoKiB4H8FUDPpeHy6mfMBtDWGbFAHxI27r6QQtFI5iPENRs
         RPKMpIHowo59lJ3dAC9WejBMC2mJhTC2flBkuvYO55tTjM1GP4wQzqNqDgZ3+XoJz7jM
         sI7HnCnxrNIGl4I+hVYnifTnrbGbwDU9vDxbhgDruNw/4J3VhxE5verTColZkBVHUk2d
         lsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lF54qiVWWqWJMbpVMSknllGvGqNMmqw142wJ+TsHpU=;
        b=vT6WgN0gTerdwpagY0sIm5Yp18YFgaaJ2qAgD7GwIc1wr9CHCo4O0WqVOWXzATBsMD
         7VGjgIN+DP6htdV4wxpLcYEkS+XC8Cfsji3wuaU0MphS/F5SHq6OLtNiCNyeBj+XAt8w
         Vd42KKe72ggYEYjhgnuwES8h5c9ce0H80Y7vtrpw9X5/oatbbCf4PgjZX4mmaOLU4d5Q
         s2IwVlNfbStj4fL1M+O/W24OkQoqKt1H6rNAnYczW44hNQRvVqp5ATQpvpBQC+IaxRy9
         FntS/uE2i2mp6Sc6hOw+cEVWSMnn0t4vX9dZWo5/Na+D+FCr2IkrBRHGIzNaQUsKSTbr
         eaBw==
X-Gm-Message-State: AO0yUKXVcGUIqqysENdhvfvYzRGQBn9/JZBcmMYuNU06/InTs2NeVzT4
	vFq3vTgPt2txAjm63YgBFE5uiJG0E4e7/24pzAs=
X-Google-Smtp-Source: AK7set8mlMRju/7MiNdqcXbkgoH50dbyDJQwpm6i1mV1FvK541XWWriSCCERo1A47IFaQPkBkBQO4g==
X-Received: by 2002:a62:6541:0:b0:5a8:d97d:c346 with SMTP id z62-20020a626541000000b005a8d97dc346mr14011205pfb.12.1678229314137;
        Tue, 07 Mar 2023 14:48:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/23] linux-firmware: properly set license for all Qualcomm firmware
Date: Tue,  7 Mar 2023 12:47:43 -1000
Message-Id: <2cb8f5efb99df37c8e2103ecdc7f482ee129650a.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178131

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

It is not enough to depend on the ${PN}-qcom-license package. Set
LICENSE variable for all the qcom packages to point to the proper
license.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9dc41e18dc138a7cce920f8e4c85eb3130c0d553)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230117.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index ad2f4ac334..de22df1eba 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -961,6 +961,31 @@ RDEPENDS_${PN}-qat        = "${PN}-qat-license"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE_${PN}-qcom-license = "Firmware-qcom"
+LICENSE_${PN}-qcom-venus-1.8 = "Firmware-qcom"
+LICENSE_${PN}-qcom-venus-4.2 = "Firmware-qcom"
+LICENSE_${PN}-qcom-venus-5.2 = "Firmware-qcom"
+LICENSE_${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE_${PN}-qcom-vpu-1.0 = "Firmware-qcom"
+LICENSE_${PN}-qcom-vpu-2.0 = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a2xx = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a3xx = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a4xx = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a630 = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a650 = "Firmware-qcom"
+LICENSE_${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE_${PN}-qcom-apq8096-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
+LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
+LICENSE_${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
+LICENSE_${PN}-qcom-sdm845-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-sdm845-compute = "Firmware-qcom"
+LICENSE_${PN}-qcom-sdm845-modem = "Firmware-qcom"
+LICENSE_${PN}-qcom-sm8250-audio = "Firmware-qcom"
+LICENSE_${PN}-qcom-sm8250-compute = "Firmware-qcom"
+
 FILES_${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES_${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES_${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
-- 
2.34.1


