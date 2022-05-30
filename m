Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A724C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 17:02:21 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.39002.1653930140418252869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 10:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UDjjx5L7;
 spf=pass (domain: linaro.org, ip: 209.85.208.174,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id t13so9803731ljd.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZmssWcasKEppi/JT5T/Zkrs4Np9oUgSbmWg1wKO16VI=;
        b=UDjjx5L7H7+xP5MYJMkhesskmBu6qxlkIty8xBw2D+w2YKqF4kIHZ64PtrTY9hXH0j
         PzdOBLLl8hRWTiQCIsjCITx44ZiPrP+eooviNgGJNpORMbZut08n5X208Z1N76yXeYmS
         WvJcVQlOnW1pqFkU+F73olftNGAFsPyUhXPCT/iwGmtifwBRZQDYt4pp1EQrUH+mXuiA
         u1+YJ6ExWg4IE8Vws3ioEHK7cqqihmI4xs77coaUUw1hyIIA9+9YPewTSDQUjIO8oMb3
         4XpG4Ophe8STUy46ESu5m1NN+nsxwwK5wJgC9IRGtU2Y/KzT9Nto54KsADl6wMZzbxu8
         0q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZmssWcasKEppi/JT5T/Zkrs4Np9oUgSbmWg1wKO16VI=;
        b=XxGdQs0nfrYyOaXeLl+ZhgGAAd1A9zOVaGGOTr9lgcd8xA3TQuOKGybad24y5Rs+vm
         hS66/kPJPyAkwZQBVFWuUbYH+oLtDgnnbb+yvOeQLUNF0A8amuPhGPEBySmHGJUGv2ju
         iKznuG8KV7OXDPYqN+97AxRPg/kaqc/Zqd/2fs2tKjNckqzI+TC/BDmP8etYrasaLuGK
         hXf+tSIqpjvV9hV3H5Aafbj4kVpLBvRE9caVRhbUWFwv2fMohjwW4gpb51nu7+5ee1xN
         fFb1GwtvVj9PMapzjxEBa5zr3+jp6lVtEFrKKHMTyUsGdd9ysHlXGm9vTjRMvKmdv/CS
         cFxQ==
X-Gm-Message-State: AOAM5308t3y61pynVVVOBE9YU7GN3n8k07mtG1y84VyQviwcyxeQsvz1
	s3zo9bq6URVieOL7ZCvsklmXjg4iV8DeZw==
X-Google-Smtp-Source: 
 ABdhPJwRb+K1wDwTT83Mvn9ZS0bXzFYY8ZfKmnNbdY3acBLiOh+5D6FjIt83Gelr4iburFslfCsD8Q==
X-Received: by 2002:a2e:a448:0:b0:24c:8fe8:f3c6 with SMTP id
 v8-20020a2ea448000000b0024c8fe8f3c6mr32970481ljn.115.1653930138089;
        Mon, 30 May 2022 10:02:18 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 t2-20020ac24c02000000b0047255d210e6sm2410752lfq.21.2022.05.30.10.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 10:02:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] linux-firmware: package new Qualcomm firmware
Date: Mon, 30 May 2022 20:02:12 +0300
Message-Id: <20220530170213.1562720-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
References: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 17:02:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166295

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Create separate packages with firmware files for APQ8096 SoC and for
Adreno 2xx/4xx. Include A330 firmware into the 3xx package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a0cb8f9131d1f238dc150e583a7ff816645765f)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20220509.bb       | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 87d2efef121c..7da5eca89358 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -307,8 +307,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
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
@@ -961,11 +962,15 @@ FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
 FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
-FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
+FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
+FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
+FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -977,11 +982,15 @@ RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
-- 
2.30.2


