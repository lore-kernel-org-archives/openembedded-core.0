Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133F3C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:52 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.33358.1743020984148444996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWgUeJ+U;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso304021a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020983; x=1743625783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIaEs22Vs3wriV7mGRge3bJW2aoP0TMeV2sXevIYzzg=;
        b=KWgUeJ+USqDdjSKBhGjKulJ/ASXPhwkb5TYVZGmRNDKZx5WJw91s7pI1kliDIHHcRV
         2A6kN7acBoHFPJp9cdWKLGqbBD9oAiYKP+Hh+p6Y1cZwWcDQQPCn5hmZIF3CPW9+jMny
         8fUuwDv++9UlPJQHk7nK8gTXsgF3C5mUC3EYnLG+R8WnCyZ4DLqZSmiIU/HWdarcIX/j
         DVMM4QxQ9Tng8f6QJl8MIxKubLkwL7D9ey93rCkE54U6s8oYnb992n0nEzLjCPugMxhf
         aenFq6A/QrEZTFvWeE3R/YYibSOc2+5Je6S1nQM77gFj9sssyuDWBZt09U3VAGi5Ade1
         MwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020983; x=1743625783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIaEs22Vs3wriV7mGRge3bJW2aoP0TMeV2sXevIYzzg=;
        b=Z+jqnkrFN2cHX0UfPgx+KIPx4WpgvHHKyayNZCSz2z73UGFZaAywAggApHp+VcUekq
         P7YhlQsXoU2ARxK2RhrvPYAZVMFaXTxXS8Sy1igk0YXQdvOEiNv3ad3CiluLbsTzA/WH
         pLOHnSODMTmwuxOF90Ye1GWSqbdONh7hsHWoen8qkQBR7MEaMO3Y1XogjlDqG7ZSId5W
         kq0cAFROEWtby69UUuA6JGpunkf0sGn1EiOhzjDzyHmZwcTp3/Qj378iIO5kCy9M+Wcj
         XF39ktuO9ruW04YCcMaXMDuKYu/fo/ZM3xitI7Ii5oOAkpzymQTm8aN0dHf5VdXwKmFg
         bkyQ==
X-Gm-Message-State: AOJu0YwnNGHdX12EJ92pt7JSgd+MGl6zYsa0D4PCAuM2z2xCDJggkoly
	7W4NCsIL1ODmMK6RjYK4VzUhFHutMH7YGApgTurTQTOb1fdOWRlVNIv0GHBl
X-Gm-Gg: ASbGncvaIWNpA0iTTboZbMIjevLxEZQ6y6pFVE0u7/Rs84u/NEOh0QjDDhEsfOvhDdx
	0E2w1HbkXbb60oqQLHM6KDwlN9mW8w4VSq5Kf2nZERO3g0VwB2wqRaKDglcXBq3D7/oVJhKWhZF
	3RvajzE6PopZySIaM7NJLdgHd0SjP1xM0LUJDTYJOGhKmLDhAuIN+aFe3JV57AP0lLLyJEzXl2c
	6FEHPe95b2FnbYTFB9woFnvIZ7ZzR4SucdCJ2pdP8IE5cUD4hUxZlK039fqJwnVIjVKk/5vTpLh
	L5Vjw8s6fuRyc08zwm+OxE5TctSCmD4d+1dWom1naDOw+JLY2AEUnu4c9M/pFO4bTrA=
X-Google-Smtp-Source: AGHT+IFfsaOaPQcuYvKrncDg/Vm5vQxWJ+kP0XfCOowdrkN6cVx40r7n8QZjvn0hn+tVSZ/3IMN2Ng==
X-Received: by 2002:a17:90b:5824:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-303a7f6eb13mr1802149a91.14.1743020983152;
        Wed, 26 Mar 2025 13:29:43 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:42 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 15/31] linux-firmware: package firmware for Qualcomm AIC100 and QDU100
Date: Wed, 26 Mar 2025 17:28:01 -0300
Message-Id: <20250326202817.64437-16-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213675

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Split packages with firmware for Qualcomm AIC100 (AI accelerator) and
QDU100 (5G RAN Accelerator).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 856d828963a1bd3b2be0b5eef6df97ea682412c3)
---
 .../linux-firmware/linux-firmware_20241210.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index b3be4452ca97..d3757b5bbc92 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -400,6 +400,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qed \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
+             ${PN}-qcom-aic100 ${PN}-qcom-qdu100 \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
@@ -1422,6 +1423,8 @@ FILES:${PN}-linaro-license   = "${nonarch_base_libdir}/firmware/LICENCE.linaro"
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
 LICENSE:${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
+LICENSE:${PN}-qcom-aic100 = "Firmware-qcom"
+LICENSE:${PN}-qcom-qdu100 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
@@ -1478,6 +1481,10 @@ LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
+
+FILES:${PN}-qcom-aic100 = "${nonarch_base_libdir}/firmware/qcom/aic100/*"
+FILES:${PN}-qcom-qdu100 = "${nonarch_base_libdir}/firmware/qcom/qdu100/*"
+
 FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
@@ -1538,6 +1545,9 @@ FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm865
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
 
+RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
+
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
-- 
2.39.5


