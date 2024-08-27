Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E977CC54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:12:41 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.75149.1724753556672350119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mofhN0NC;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so60514461fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 03:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724753555; x=1725358355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQUCf8r7uHDID6Q/b8+9ae8Yj/VvshRgq9SyyWpVE+g=;
        b=mofhN0NCIJhzTddwK7g4RwVZjDfphhQ3IhBQQWto6IenQ0yU9ERrYbYVj6WKf39XDB
         tiZzL/2ddtrPl+CqRs8si/72411efqSbNkqgQDlDo+e2OqMFPO6UQSZhKEBSks7dCl78
         rfzX5ciYZ+wKL/qH/xgUwV1mhts7/EGleu6c6Hv4LZ0UW8uRwSm2pQMTgHF2dsSzCuK+
         63+TsMd+Fs8Sh6sFRr6OdAL1Tlz8AGPpzglyJr56RG23H7WWOcAX7FALVdYOxn2BwJ/c
         iGWtGprowXpjrFGAmCUHxmmUd9b6s1YuE49LKtaNCOWo8HiNOzx3ibWuF11BaUnTFc9B
         oKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753555; x=1725358355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQUCf8r7uHDID6Q/b8+9ae8Yj/VvshRgq9SyyWpVE+g=;
        b=ZBtZkOr0DFVPcJjTxNTZKB3yXEshOjDTQfmFyMRMuMojHw6M1cgcT8DBRVyP+78FDs
         pN9WcYYE3SDkh1RlvwuTj73RuHR+f7yJ/h8PSll3to2IW8qliuFTrupmPF7Y+TBPNx6y
         gg07XI7b6/KoTvMiH+W/laUrBhd73QdIUmelzIexOlQY51zely31Wc11o1AkJoPUgDhC
         A/90O2GuuN50leOZlOiJK2Z9I0z++DYbCqGZ9/ohmbbPfdKnRoeutxalB876xP1A8CC8
         lL6L3kl3diddL969s5dp8C/slTkOwFS94Ox7Pn+H97L/+1uyWOU8lPI3n8/G53cVn26w
         H7dg==
X-Gm-Message-State: AOJu0Yz11pxRWeNS4Tgwoq9Mec/uykkAZPSaRi2E1BIckcOFwmwz4fgd
	q6flNd7Z2SFnmdkt8FwZhf+yLttkvQHj+RvaQ0MjyTGCU7gqnVYmVqSvL0YlDDMNU+fvbNOnPhy
	g
X-Google-Smtp-Source: AGHT+IFC4AAwDoFYBUMDFsulmHBb3/A99w3KoVhVRL1dkZ94b3yxhnadrW6KJYOWJRRQ8fXgJRRNUw==
X-Received: by 2002:a05:651c:b93:b0:2ee:847f:9e9b with SMTP id 38308e7fff4ca-2f4f5776bf8mr65252101fa.28.1724753554073;
        Tue, 27 Aug 2024 03:12:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047a4e71sm15813451fa.17.2024.08.27.03.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:12:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: add packages with SM8550 and SM8650 audio topology files
Date: Tue, 27 Aug 2024 13:12:32 +0300
Message-Id: <20240827101232.127612-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827101232.127612-1-dmitry.baryshkov@linaro.org>
References: <20240827101232.127612-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203825

Split audio topology files to separate packages so that users of the
corresponding boards don't have to pull in the whole linux-firmware
package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20240811.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index bed90fb3699c..468371ed6810 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -400,6 +400,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
+             ${PN}-qcom-sm8550-audio-tplg \
+             ${PN}-qcom-sm8650-audio-tplg \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1408,6 +1410,8 @@ LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1459,6 +1463,8 @@ FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a6
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
+FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin"
+FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1503,6 +1509,8 @@ RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.2


