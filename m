Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109C7C36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:32 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.33353.1743020968674451415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=USDeHE2l;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30185d00446so421193a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020968; x=1743625768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ug1Gwzev0B30zGUyNZO74n42S9Zgwyia/KX6b4FL9r8=;
        b=USDeHE2lIrPzkHUlq7a82EmbUO43+Y+QoRaP92Sl562MZ4SgbNJ9/l0HTSc4CAnu2t
         aQhnCGnBh3UgiEUuMSNYwI+0evN5E/+xHIdTacsgrWS0OsiQqdJ4vKEcvIos6CAgMD9k
         wx+EkEKDOIrXBfDyksmmC8ML4csSDfnr/vJpQ0pXlzbVCUC9+CL3fW1M2TyZQrasRJX5
         iFJboDd0IUK1VP8ZnmqSOFdl+AVj4hmI4dwjvMzCWLg0QSYkNrIQ04Y2zzwcOEm/HkKw
         0GAYNho+wGvPw1/T/khV/6+kLcq8tFXwXUfxnGLUUCu0D59BSwzs+1JycmT/hf38YZPA
         5t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020968; x=1743625768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug1Gwzev0B30zGUyNZO74n42S9Zgwyia/KX6b4FL9r8=;
        b=CNyBhyxoUgC9+0YH9jXW7rlBYTU8x5A2OF2PiXiN73xJktSa4JZeVkSWBDzSA9ywS0
         XIJ3T9tBpUUncI0jwtTgvtEjKG5jCCI1/CVTajJhDSSPtYDriiXMLCC8UrmjLOVxWed+
         n7+87z/jOQdznpF4BLXlHnhQIxgIrX6XTLcTgupG7OXPCw7bH3+X+8fEDwMrrNtcOWN0
         3Qh9dpbHMKXNF2MBoamaCIAIwCVB0hsMFME2xp7tBD9NyTL8np0ETbWHQqTup4w+CVhS
         0FXu/NmGyOKU9T5vSlkqvSBYpGporv7yVgNzVKM3KDl+4VRs7VHTg4U/b8KHotHyjRgQ
         4QPQ==
X-Gm-Message-State: AOJu0Yyjh9hkXlppp+UnUUlcjHXn+Fh2kDk9IIb0c0QDRkDvMEgrvenw
	4SByadDE9VvmdibHuduOdsw+5VWtIDCcMw+nCAlEpOoK0CDSOAIlyjubovbg
X-Gm-Gg: ASbGncuJB8CIXnXocpyRT5sLla7Dnf7SDmhyHTft4Eq/9C2Vy5BA9iD6aMYe4/Z6COw
	vrHv9j42vz6csojmxvDBcfYsI4vCz/ehcUbGDjfDz+P+m7yUSGh96Qb7C2e/QQtPMedjQ6H0Wck
	XHupnPGeV2KWbeCWdaofkV686imvH9mY3NaBa4qjdathtK+dq5TY2v9Q4bg355mkjRQNC2yNlJ1
	x39C1DkmgKOFCKJ0Txz6YQGj3jiiZo/cuCFmLOUu6+Z+oT3aQez/8n0Kgq27Lz7SbRzpYQne81S
	g3rHV5We6s2OVOgfBEOfsFjN2Q2qDSDGyKIagemDPS2J53GMqVB3wmM5ZzNQjpwE+AqdZoXge3I
	R2g==
X-Google-Smtp-Source: AGHT+IEiqZWoZ64SzqLE6/KwHQU0ZrJP9JvIMuttF/lt0QaB/tnbhJDwJ5oKyuizUQWcbYyRnaRDug==
X-Received: by 2002:a17:90b:570e:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-303a5fa14b7mr1676232a91.3.1743020967737;
        Wed, 26 Mar 2025 13:29:27 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:27 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 09/31] linux-firmware: package IPA firmware for Qualcomm QCM6490 platforms
Date: Wed, 26 Mar 2025 17:27:55 -0300
Message-Id: <20250326202817.64437-10-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213669

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add the ${PN}-qcom-qcm6490-ipa firmware package, containing the
ipa_fws.mbn, the firmware for the onboard IPA core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d29ddafab782d8a8a8383ea0124b44fee7277062)
---
 .../linux-firmware/linux-firmware_20241017.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index c99a1ea997f8..97e89b52c27e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -409,7 +409,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
-             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
+             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa \
+             ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
@@ -1448,6 +1449,7 @@ LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1505,6 +1507,7 @@ FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wl
 FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
+FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1558,6 +1561,7 @@ RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.39.5


