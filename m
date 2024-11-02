Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BC7E67497
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:23:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.8385.1730506984662014227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZNR1HrYZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2652092e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506983; x=1731111783; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/wIKueskG0DYiCQHLLS8qSTp00Nhu8Of/0n+7V+2P8=;
        b=ZNR1HrYZtN/DiasB12CqtaV73u+QHfyCbFjz5HZOoPbtiirSfZ7gbDwybODMAv1jp9
         MFxxPuXAHheSdVaZFgKNnRPMLPRCcpwST4F61Xis8Anm8x8H7kqd+O/Yevonnort7OVe
         Bnf5U/i0yLFmaZ07udFH/nD1jwtTfakklEmm1usYgF85ZQIKK+KWKBggDnN9IosQegWY
         9gRfkQ+DUTd6C7D4s5ADFJnU458fx+NQKFOSfc7Mk+pcShKhs7paxTTICgj8lBExaAaF
         56nssB90jn8bQtBMINxmYhETfKoW0dPWUUOYtk+1/ucLn2zpxZkye/eRFHkus6miGNd0
         3kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506983; x=1731111783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/wIKueskG0DYiCQHLLS8qSTp00Nhu8Of/0n+7V+2P8=;
        b=scvOxHlN3EQ7ZggYVj4i2y9GpdHvSzuMQNbYvWJUlLgXRIy4LgA83WDTysBJU4A+hl
         BWmqlgJlm+gXKO1F0XsgxCn0qdiA0peC+GlitR84EKgrrrRUcbfVwOYr0Yp+LsO0mS7k
         5QAouvy6d38ZIDns7U209R5Ozz6kuFT9yhEOJMEpVdtiXG577dQ7qeQJ8nFLm8vsGrjW
         6k+U0SHYgbceqkJZm24gThsKbeGdooGEUA8Jim2rPKbYJ+4xeM/7sjW1AP2i3GV0n51F
         hEKxrReLL0KQLa1PbHGNJwPbnbWwO+enWFIY72bxohBsckztb7P53TVKXiapcbXLT/lg
         vBIg==
X-Gm-Message-State: AOJu0YwupUqJpQ4Wqk+ZUQ/CoswAGPKA/jZwS9kphg9MbR1DnwznXREB
	vhUQ0gt8uwcMJryU21vaM2zn8DT9F17ar0RQHwAm+uX/7d1oszA1nh18U33D+tSqZHGVB/j8k/q
	o
X-Google-Smtp-Source: AGHT+IGNCqJ9mxYAyqYDwo8hXXvkT2Zx/5+Mmyy85eN/qdmmxYT390NsNZA5seBX6158i/teNM5lCg==
X-Received: by 2002:a05:6512:1105:b0:539:e776:71f2 with SMTP id 2adb3069b0e04-53b34a33f15mr13277300e87.52.1730506982527;
        Fri, 01 Nov 2024 17:23:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 02:22:51 +0200
Subject: [PATCH 5/6] linux-firmware: package IPA firmware for Qualcomm
 QCM6490 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-fix-qcm6490-firmware-v1-5-3465b5c9136d@linaro.org>
References: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
In-Reply-To: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3194;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/FDCOVuHpu8F4JVxCup4VQFC4Mq/aIn/IqecRNXqIIE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pqwc3QW0ZB3TZuXfP3bTopyOjzL0MsasPWlS9navPuE
 62U6G3tZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEvq7kYFgYEGeU1MwdnyPd
 739LbJ2I+HOjjwuWqbOzTD+5vF4sTYGHZ/a0EgPWtfL7k3szvJcuqE2YHmlxPK2wt8FPbvrmJz+
 DGiTft2Wbf0p7JfL4xyNx5nv7jrBzfyudbdJas7N4tZlSuMovpiV+U6p1qg493rW/xDzn2aInsZ
 ef1QdP+Xqt4onNsT5NX6NIB7HHIQLvbHgLlbgl7EXZ+f8/0RK7L+mxbqnO0uymhvvPK46UhGTo3
 JbrWL1ORu9vs6290wS1fY9YjVgubO3x+DRPmefrO3Vrn/PPHv2XK1DjT1jwzL60wkogrP1RZLKY
 w3L/1P+HWP4+kpA9nNRSd7xZZptGqaPEek6uOa2PI48BAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206647

Add the ${PN}-qcom-qcm6490-ipa firmware package, containing the
ipa_fws.mbn, the firmware for the onboard IPA core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index c99a1ea997f801f086f34e39f2dd5cd71210a82a..97e89b52c27e144f74f8eac22851a6c0bc7c929b 100644
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


