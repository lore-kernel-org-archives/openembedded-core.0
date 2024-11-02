Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3678E6F09C
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:23:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.8268.1730506975404660461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tlwJ8/TI;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f1292a9bso2922948e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506973; x=1731111773; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jxg0D7tFICxpZyOeRHn+2GJWWHf2ULR3sJxpyJ6hja0=;
        b=tlwJ8/TI66rInkbm2wBeIsLlCMTibd/iNVgTmP+HjjgW3uUYpuu2OyUMnaDxBDPm4z
         w7eVq/Ccjo1gTKZmVi24TX5sGMrZveyxce9qkKTESfHqnXkQI1yVtlEzfxGfpRMyAvrv
         YL24r/olQORUrcNq3kjaCLyY7RQQHgBw9fCQcKTvR3AjJij6mNlW8/Ya+B9LVNbzHzfN
         x6oQR91PXY08nSc2/mXuFc6MOsTMU6gkwj/PW+cEtIUxn0NO8it5yGyL4OWYemdKbexg
         m+zsFvg0wzW2KKuNBeiBPtaPO1zc3g4HWSpGUvwVGzLr6CUCxDOAmEsCVjIJQHbhLMc2
         OnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506973; x=1731111773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jxg0D7tFICxpZyOeRHn+2GJWWHf2ULR3sJxpyJ6hja0=;
        b=ihAarSsMRqpQym1k2k8LSsmWpSAEfuZdGYNxv5PK1syFhYBeBjbM20gqxYXIs34pSl
         vMZXQFN338dTc2yIvyzRFInnjZsPdTF2xf9usI967Ruo22My+dQwLnFTWOr4HlG4V9mj
         cWn6zp97cTNDmqk6UZMSnJXn6G5bIQoVML+vG7U6zaXNS8nZXbXcb8xvfGxfvB1aVF4F
         AdxaIl41DEKgfjSfGwqeaK4uIc3iV7LFMoMWoUXvUhWuMRQ41iuR93eYq2fLi3O702Lf
         ejzPtNKf71+PknFfCB75y1tI9jlWWKVzIL4lUxA/Bfxnq1yYB6RFjeii2g1X1CX6GVOm
         G1qA==
X-Gm-Message-State: AOJu0Yw61DJa5/o+IPRFHgkxzYMDjMFaLzo/OVPG2xcyrBIUe1ZqwMlC
	Jyd9CbTXjZ6pd9HipbrFhTlvm56YznMlcKA0b2kY+bw1gYg8FBi2WR0fGEHveAI=
X-Google-Smtp-Source: AGHT+IEXT4T55W+LsLaGfkcwWrN5T1AjH3h1VERPtrqKQ9mrbLpw084UKUdpacNftvA3eY1uUZBhEQ==
X-Received: by 2002:a05:6512:3c95:b0:539:ea66:597e with SMTP id 2adb3069b0e04-53b348b7e77mr11522230e87.2.1730506973429;
        Fri, 01 Nov 2024 17:22:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:22:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 02:22:47 +0200
Subject: [PATCH 1/6] linux-firmware: add battmgr.jsn to
 ${PN}-qcom-qcm6490-audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-fix-qcm6490-firmware-v1-1-3465b5c9136d@linaro.org>
References: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
In-Reply-To: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0faF3yLZm26su5GX3KvoNLXBF4LiRR2onp+7jWTmNf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJXDZSCCjjjeNQl2pSmfQDkyinaCxxkJHD5G8W
 ZGCmkhGnWOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyVw2QAKCRCLPIo+Aiko
 1cp/B/9+EupSAKeIAoy11POlv/1r15vTDQ8eosKPmexm/YC8yw7v3kBApzzNj3OG5CjlnEwSQJe
 /nn7scEGVDpnB+Nz0Od+Gm/VF+TMFkAdJYF8WXzsiKObI9qhXKbzOCN2Vz+a5o7xcCCMrVKlgkT
 N36i0vkIH3/lzpVJKZ8C1roDySenDZ64CVFk64FK82qlpo9Tg9T7s5YjbcGBK5Rm4RROX3buWNE
 zlu/3CeA9YqNs123hXj0b4AGcN6WHXeksO30gk08xopZe4vOPTOlaEA0fugIVTdnspvC1Dpdi5T
 bfbIENE9A/tC4rz17Fmg22HXLZ+rjIuAhmMlTU4C8veLHSwj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206643

The battmgr.jsn file describes one of the services provided by the audio
DSP. Add it to the ${PN}-qcom-qcom6490-audio package (for the reference,
see the ${PN}-qcom-sc8280xp-lenovo-x13s-audio package, which also
incorporates corresponding battmgr.jsn file.

Fixes: 1d421fa263bc ("linux-firmware: Add qcom-qcm6490-{audio,compute} firmware packages")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 9dcb0313a9a157a77dbf87c7aa34dd6ce5144a12..d75a587db93186b89699e0054a3e2959496a52ca 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -1498,7 +1498,7 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
-FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.*"
+FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"

-- 
2.39.5


