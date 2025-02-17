Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D493CC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 15:21:00 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.54148.1739805656902045969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 07:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PT8CL7qJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30615661f98so44739991fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 07:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739805655; x=1740410455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DltHtqO/Cu2CUBa7lQwATyOBYPMR9KF68vBBKpAjYg=;
        b=PT8CL7qJpeGLf0dTaWe2KGxsN4sH2Ku/abGffkLkeYCpwA18K5cMdc3KFk3ozdQtWH
         4zUiCQ+e14UITWgcxEjENZrsj9EISM9OKw4DYzBE0xYt3AEpUbXigSoUzsgZFeCwVMYO
         KxNP4cVoGoF5WFJJtNwgdL/mz444OUuitiil/IMj0UZUyIUmgPdb9hysq+TBaGXLlGiJ
         mEotsoc3wsAb4Dmp0vHDT1ak/DUknOkHm9xR5jLUBFtpdZa/9G6W6QNrMFxqVyXEPA0M
         oWQAViV6YnEiRmtfv8ZqR8UwrU0K8bSvHX6LidhRiraaj6q7l/PsNJv5ud1AmatCsf96
         OP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805655; x=1740410455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DltHtqO/Cu2CUBa7lQwATyOBYPMR9KF68vBBKpAjYg=;
        b=aVU/aHmgQMOkGWEj2xfwbC6qcGJhBa3dBMvYlxEmRWZiJHDREgUKwi9NpBQGBShLed
         FiFJax+bzjTyhTL4i4Ea0pA8symcwAcxlyesqj/eQ0LcQ7eLsvMoHzpnXBUbBOMB0x+Z
         ZJcKHUCrHWh3bX3q+cJGGGzsWmAjj7i3OKBcv2iJDmPqi0yRb1Wb+S0XSXs8TExBm2L4
         0loFib2iMq6ge7hrYm4hF2hboD3VhCPp2sKtt3eGILMVUQDFzPs2616ECR0xZI/1rclR
         hnDIbV1L3dRNFhdCci4zbXjIGTCoqZLnse6DALD3cMx+i+e89/Gv9Mm3Iy9Ez2Tdp5wy
         13tQ==
X-Gm-Message-State: AOJu0YzOXWwZO2Z8OmMYpAXClSv3+i+25+cKoQnKyjwwaBn/bK33Ulm7
	WZuRWazr7YZZhm2MBfYVQCyJzvLrVHJIJ5tZMUU7OJltVAxf6tyF6My80WVvOxNn69FV3puOXB+
	E
X-Gm-Gg: ASbGncvFYiUY1hkNHEJnB+Ez385QBtSI37yQ/oF8l0dmLy083RdpxavG0h8cWj/IU1D
	RAIxyiQkRaOA+itGkcLIhNfNfM6YaGxyvfv4nkFiQ+Qpj+rH7yJnLHWfNTsq6lEEFIfb3skaJ9t
	XrL9unveXs/TlmkUn23qpImHgWoO07gjIVDd12Y584Bgflq0JAIXIKFq4T1kBPY1WUSNvjYmYsQ
	ageeHbVY1D2flgdFAfCk/4r6d3i2FDKZeaWO3dWHBVvHq20IRIV5n8Wl3JaBKSkUV5+u+pflPcW
	L0nVuzZyYMpNI5+q0jPvpu4EIG+DUAQ=
X-Google-Smtp-Source: AGHT+IGKqMmxPDb0H3wXauQN99pzBZEQ2TlxCmoFXPnkz+IXXEOtggvh3uQx34bgcq4tsY4YOskNEQ==
X-Received: by 2002:a2e:994c:0:b0:308:fd11:770e with SMTP id 38308e7fff4ca-30927a57a9emr25278841fa.5.1739805654578;
        Mon, 17 Feb 2025 07:20:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a258703c9sm7399861fa.7.2025.02.17.07.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:20:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: drop the Lenovo T14s compat package
Date: Mon, 17 Feb 2025 17:20:53 +0200
Message-Id: <20250217152053.2164104-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 15:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211542

There are no backwards-compatibility links for the Lenovo T14s firmware,
drop the empty compat package.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---
Note, this is a fixup for a patch in master-next. I'm fine with this
patch going in separately or with it being squashed into the
corresponding commit.
---
 .../linux-firmware/linux-firmware_20250211.bb              | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index 65a80f25b29b..695788e31d05 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -497,7 +497,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8650-audio-tplg \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
-             ${PN}-qcom-x1e80100-lenovo-t14s-g6-compat ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute \
+             ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1904,7 +1904,6 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
-FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compat = "${nonarch_base_libdir}/firmware/qcom/21N1"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
@@ -1983,10 +1982,6 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 
-RRECOMMENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-x1e80100-lenovo-t14s-g6-compat"
-RRECOMMENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-x1e80100-lenovo-t14s-g6-compat"
-RRECOMMENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-x1e80100-lenovo-t14s-g6-compat"
-
 LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
-- 
2.39.5


