Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E32C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:42 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.33406.1743020976312865073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f5zekfNE;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso303880a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020975; x=1743625775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs4Ewl24nMMsHNwWozCyvcehhlOobAuZh2HpQeYXo6E=;
        b=f5zekfNEW6sJeZciQrSQIByzhqyH9OeEPvhC00/dNuxh0uqeLJTpS0kof6/h3ahPIt
         JkxdV4o5sZpuaJ6c67kadfAA9DIKglDXE06QNxsR0M/MxYXwZFpXfijvZJYNcC9G9hZM
         fyGUwO00aQ3Ja+pMuUSrKhCsV6bIatO+nLNaTvlQUc8NdOqoT9/EV7xj0CQSt6VynPix
         pCVNbSF2kQYbUEMNvcMUCwT7+zqS4leWJQ5Q8NKgrgmZWHVvmWpyG8vbvA+OjO7Hnq0l
         W1FT+wPH5LuTD75fB0brpja/7pSFx3eZdmXL4Rk5pe0qU7WNXMrQ7RmTJ3705rEJRCHU
         0XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020975; x=1743625775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs4Ewl24nMMsHNwWozCyvcehhlOobAuZh2HpQeYXo6E=;
        b=NAlkD+Th4uPCFf22JUNaF7sUAVfQTeF5Y7grmQ5qAh9Z6lAD9GZEm/1GeyQWll0uNB
         YtzLW0hjTrOy1fqg9cocn7HbLXfHvzkWEDKq3Oc9apYvy9+GUlYEF0N8AG9kZszQmiEm
         o83AQ0Occx4JPY+4OwumKw443Y7nI2KRohJ2La66pmuUWl1cSZcSF009BqPVj2C4hulQ
         0NYf3tK98LUXibh+AUHY+qGfNhNbPBpZnCV2n4tcU/segi1hf/xyPsGqwactF2ec0/g3
         P+vQR2c6O3o1svb+u/MAEVaZWTMVQqHd9s5n9fCpgnZ4jYK7knPhKEFeQLmwhPCFdEuG
         heSA==
X-Gm-Message-State: AOJu0YwzC5dJnyq6W2s9LQmYK4YqLPL/tWINP1E94vZjy5G8i7V1AttH
	b0rDUJdDUiseg329KMEDdbXPFpgp/cd1b/fdor5PnlPuKTmeBtmlHBO769mV
X-Gm-Gg: ASbGncs0mdn1N0oI6kygzOmbksL5DnWYvf7WdEXy273oqTMbZr3vYuSFwgMaMWO1zQZ
	oKLWm8vPqG9p9g6gVhx98SIJ4sNknYNX5URr0OZzB9yJSNpqBE88M5R33b2rdj30+pki2wUwhF6
	omV87NYIVCFdsFxRjwGf6CxaHn6B0W0hgD5GKLpeH0s2Mg2za1t0uwT/fcJkbDKgeOE2BjugBnc
	Bc7uBf6wSN32N2h6y34U1GtBfayKj9ldz+P3hnLvYwEIPJJRFEKgTc1MpY5f0maX1v6tSi3AXP6
	rCB7XZAdqbTZbFIG0Vbcc97E4sS0wNduWUBZJYNp0lVbgP7TnZMNgTymiVPU+55oEZY=
X-Google-Smtp-Source: AGHT+IGmvFRwahRzoOCjmT/cgtpQeDaoqUiU3IGsoZQ8Qzthf3pfDm4BKFEVM5sjUa3hdXcRmj03qQ==
X-Received: by 2002:a17:90b:2643:b0:2ff:7b15:813b with SMTP id 98e67ed59e1d1-303a7f70679mr1792224a91.17.1743020975332;
        Wed, 26 Mar 2025 13:29:35 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:34 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 12/31] linux-firmware: package Qualcomm X1 Elite audio DSP firmware
Date: Wed, 26 Mar 2025 17:27:58 -0300
Message-Id: <20250326202817.64437-13-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213672

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package ADSP firmware usable on Qualcomm X1 Elite CRD and QCP platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ae4ca92366b7be151a00ae75e7c68fe6f49713c)
---
 .../recipes-kernel/linux-firmware/linux-firmware_20241110.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index 6475277a079a..daebdca13273 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -424,7 +424,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
-             ${PN}-qcom-x1e80100-adreno \
+             ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1472,6 +1472,7 @@ LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
@@ -1532,6 +1533,7 @@ FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmwa
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
+FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1589,6 +1591,7 @@ RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.5


