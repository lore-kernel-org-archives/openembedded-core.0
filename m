Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA878C54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:12:41 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.74326.1724753556109424238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yIZvpTNu;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f50966c448so27290391fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 03:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724753554; x=1725358354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtSlIb6t1vieC8jCOOZqGlmbCY+vqx9vLJj9ZLefPxU=;
        b=yIZvpTNubVrr9o7bV5u8JXJfAsiYctjn3k2AI41xOUg7lpy7SEnGNaQzAg5lSxih4t
         QzdSxKavO7j6U1cowlf0CwPdBqZfY3dUB3yuHtzKT6Md5ICN6Z6H2lFfjM9U8B12n67f
         MJd6OIKJlB2Xty89CFwVQdq7MqGlv42II/nMIqYbX414P773+nPXbIbwQmgrZEdveZ0k
         Hk+g1rwc/XEedR2sDVJAtvnwl+e5VGXswiUZgpr2pOaelRjTzUaMTQtChkXBA9GBWhOz
         fTfJZiaNFiErBSqDJ+G4n77a8V3BY+Sw2yIQA6wOcJOih6AEmToodo6mBaY/eTcesP7i
         iRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753554; x=1725358354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtSlIb6t1vieC8jCOOZqGlmbCY+vqx9vLJj9ZLefPxU=;
        b=FsznZgbbS7izY61lN0doeYgcpA1pbp/fkS9tEsM1zxtIWhahBICNPwUdPCIwfy2rfS
         /unl7DSJI979RhFEkNfJE6BdfYZ7139iuwXTi9y5QUvJSbF/WnT4+EGmWbV+qzAGgKjh
         XaM37TClK7LzU9AXCUgiP6e3boMe5oC+89o1CCzfUbEhhWh980vfzQDOORLZG9k1Y3XL
         mbgEDJwL5qLy63jOA+UTJCsnQv4nAsl7+WEYkuA/9FqB36NSfp8Gxj9nWBdkod0h8Q+Y
         Zh1c/RS5iwXn6YeXEse2QG5LGiY3iXLr5nqLdCSxKiNbUo4oibEsPBkMXk75CU2E7LII
         vlLw==
X-Gm-Message-State: AOJu0YziSdXMGVm/OXl8i6jmBFefLZ1Vw5aPBBliZ6j1e8k+nd8EbF2I
	DKFQ5GmQ36jBkyMWoOy4SqwvqH4iKKoHY6f1WwDNv3TjgJXsnaJnjbQKO+W5IZWttwmR/gMkij3
	l
X-Google-Smtp-Source: AGHT+IG6XbP6XoUDeJU4P5TbiGTatPJ3/v/af/ZVudb1Vouh6tavjNL4rd/unZ8J/FKTpr6OIUiLrw==
X-Received: by 2002:a05:651c:b08:b0:2f5:11f6:66c6 with SMTP id 38308e7fff4ca-2f514a2587cmr17421341fa.13.1724753553491;
        Tue, 27 Aug 2024 03:12:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047a4e71sm15813451fa.17.2024.08.27.03.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:12:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: make qcom-sc8280xp-lenovo-x13s-audio install Linaro licence
Date: Tue, 27 Aug 2024 13:12:31 +0300
Message-Id: <20240827101232.127612-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203824

The linux-firmware-qcom-sc8280xp-lenovo-x13s-audio package includes
audio topology file which has separate licensing terms. Make this
package RDEPEND on the corresponding licence package.

Fixes: 958d6a209edf ("linux-firmware: package audio topology for Lenovo X13s")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20240811.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index d55ac9267d8f..bed90fb3699c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -357,6 +357,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-bnx2 \
              ${PN}-bnx2x \
              ${PN}-liquidio \
+             ${PN}-linaro-license \
              ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-license \
              ${PN}-mellanox \
              ${PN}-nvidia-license \
@@ -1360,6 +1361,9 @@ RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 LICENSE:${PN}-qed         = "WHENCE"
 FILES:${PN}-qed           = "${nonarch_base_libdir}/firmware/qed/*"
 
+LICENSE:${PN}-linaro-license = "Firmware-linaro"
+FILES:${PN}-linaro-license   = "${nonarch_base_libdir}/firmware/LICENCE.linaro"
+
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
 LICENSE:${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
@@ -1486,7 +1490,7 @@ RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
 # Only symlinks in qcom-qrb4210-wifi, firmware is in qcom-qcm2290-wifi
 # c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
 RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
-RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
-- 
2.39.2


