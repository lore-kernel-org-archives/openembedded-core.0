Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C1AE6F09F
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:23:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.8270.1730506982045511520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uSN/b7hw;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2652068e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506980; x=1731111780; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZJDl4R9l8UABJF04Okdt6yVjrwN/xxYoRn/gcTyvX4=;
        b=uSN/b7hw0EMYIlycdfsMKyuuxb/x0FWIjjdRu9e1PY1202Fb0C6XdltUdvQEow5yei
         iM2RL6/RkAel6dB7P0EgOQ+bbxpHm7d+d9YDnoiU91e1tvYAAwHgV+tByKtFvNZzhM+b
         n3pinhores12pSm74pz/7Ja9juP2socC6v1vB24rUcdf29G5J0ry14vLHWDhR+l2iMSW
         OVsEB/SWfPuykRNuUcktxJrxiEjOUkkSCwnRu/h5bAUTrOCMj7w+2SEXmMShSf0ul31n
         v5L2hHGA3ETBS28AC44MpIC3FodEdTdicnsnMHBmqS9SP2Zv8ajiDvizEks/M34rMfjR
         MD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506980; x=1731111780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZJDl4R9l8UABJF04Okdt6yVjrwN/xxYoRn/gcTyvX4=;
        b=GJm3ZEZmkO8FmjnFPR+mKIVhYkVNC/3SLiWYvgslZz9dn6PNCNbWguJdL5geEr8YQy
         GSmpFOKqj7B3GE3FVEPz7YWuhssvLy2FJ273qis7DVPZFTVrank1JrXh3vPozoIVmj5d
         aycVO+1h6I2SnXf2axGJxBLRuqvkBt2JSykPVxaVv9Qya0su1N+PA6t/gsvUhkeMmDDc
         r7DqrDW+yUKGW2I1zgpacpSYbUBYG8AVw3YtDkklv6DIsQzZEKC2JCv6IIkIjd318m1M
         xHZP6bsNr3Ll4G8eBEfvhT8fWfOS1QLTp05b8hN0VD0lukhd/cCm2TmZ+raonT0rsuXh
         CoNw==
X-Gm-Message-State: AOJu0YzbRnE/7tqx73fgVBrpwhT5/xMYHil60SZKmS3L+I2o0r9Sdd/B
	IXQK3n+/FKZ19Z4nGntO0HJrec76GTDFxeZmtRFScvD7OJ+MF8IhYPWNKCrXqNQ=
X-Google-Smtp-Source: AGHT+IEHTUhV/aEToAE/ZSfCSc1wNU9ew7kEu1vWlUnE8yeZaiaaBQIkkM0YMCqiklosnkt/yuLfzQ==
X-Received: by 2002:a05:6512:1255:b0:539:dca9:19a2 with SMTP id 2adb3069b0e04-53b3491c152mr11759475e87.39.1730506980095;
        Fri, 01 Nov 2024 17:23:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:22:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 02:22:50 +0200
Subject: [PATCH 4/6] linux-firmware: make ${PN}-qcom-adreno-a663 depend on
 -a660
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-fix-qcm6490-firmware-v1-4-3465b5c9136d@linaro.org>
References: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
In-Reply-To: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qyAqgCbcIps4ES9YKpC9mpcVAQ34C4Rj8AQMu0Vt7sk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJXDZmyhV0dQF7HHHUXRKnV3vrYWTIZcksDzCO
 sCJ6NYUmduJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyVw2QAKCRCLPIo+Aiko
 1SuyB/9qtCe/839tmeJAMlGDZNSiAhGvqZBgHr0WzBB/tpaW/KonAINW6NOcK5odoNNVuD1l3fN
 irunkV+Ph+ra4YSf0hs5MxvnqtRYiSIF1Wd+T1YXgkC7RyNWF2HU2juz46Q4SjvyMVOOh4ydsS4
 lKMvnJdyPA6fTcxp+FY8/dxMuotiJMyaDzDNIO0mRSXSnDFa+L/+wuTglbp3aJbIbqXwMNklAfu
 Yz/Ib29WnTmAct8iMOWTjzl8Iuy+WmSWQUIlT31NNG1dDDqIsD5XMzFPBDrt99pwTAhRDg5R04T
 ioKYrL/V8BOOwE4EhYtsPNNbdDBad86V2tYgN300v02R14LI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206646

Adreno A663 requires two files to function: one is a663_gmu.bin,
provided by the ${PN}-qcom-adreno-a663 package, another one is
a660_sqe.fw, provided by the ${PN}-qcom-adreno-a660 package.

Make the ${PN}-qcom-adreno-a663 depend on -a660, so that the platforms
requiring A663 firmware don't have to care about the details and can
simply require the A663 firmware package.

Fixes: 02dec6af254c ("linux-firmware: Add qcom-adreno-a663 package")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index b40c33d5ada81856965519a195a774b828177aa9..c99a1ea997f801f086f34e39f2dd5cd71210a82a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -1543,7 +1543,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license ${PN}-qcom-adreno-a660"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"

-- 
2.39.5


