Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E7E75455
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:03:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.120131.1766581398355014243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eRrYeAGg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so38347505e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 05:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766581396; x=1767186196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W88XAx+Di/g/4KbpHFhAbfcU0xJXvrwR4MpnOwpBUGg=;
        b=eRrYeAGg6VotMhTVp3msiJcGdZFSIrjp7RcEW703xNYXTE5gpOxlcv+M8/UAEusECN
         wBsN5B8BoSILiE2M/a2QUvPL7z0e7Ws72l+cgGW0luoDKvv+mivsfl9wBUBZ2Z6ChfkN
         urT0E/28xr6w6cZIH8HR+cHakfo9KrQ0Iy2n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766581396; x=1767186196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W88XAx+Di/g/4KbpHFhAbfcU0xJXvrwR4MpnOwpBUGg=;
        b=JL5xvHQPLAxk9mFgKkCCkM+3hqWveWATYm5RFHjKc8L+mbOd+J2Sr8FPE6X0MMguWs
         vE1Yp1iiYDSF4dKayvsiKecFt4YnDznYEAUhbWhP/FD9ePzTUtU+6pTwD8m79ffNn+7Q
         eCzkJgi22apA6vmrnHBLgVU2E358dWrXp/HN3fyOEwDZR3+7gFE39KyOQF9ZM+9RXh+3
         Cok1VXHK0pYKVmPDZTd8ACjNGOZYv+7pfC/JXflqcmkmGw4oO8571LThd57KzyPFYZRx
         rY9iiXs9ckRNbaR5DZ+zTq7f4XBBNioVCeQmYokL+2lvrzsND20QUqpEXDl+k6IEjd4T
         XmyA==
X-Gm-Message-State: AOJu0Ywk5joFx0+GAYycgZutd0H3z4i+2y+8x4/qFn07LeMKN0i6all6
	ILji+ap5HWMcsEHOO4at8Y4i5ux2mVzMWSxBIMIR2HBv3FcAcTbp9WL7RTn+vD99XMz1LIoQ1I2
	tfJBxtqc=
X-Gm-Gg: AY/fxX5Ul11l9tEI7YSLAOIMSNjrgAXr7yt91Hzob5evA/Z7u5ZfOipOh/DSmngrGOx
	h70ikml//YHVISPHjsFUMu75HKdTCEdYZpzpZRxPFG+Uq+qTFnx4lw3kJrVXvZEqOq2bsV4R7M9
	SLjUaCaVn86HESSDTFmiBC8xBJ9+wJEBKHwQpjJWNILEvAo60k3giEi2duf/SxdSNKpovo+qHCU
	mLCznQrU8ORFQHmGWb5rQwaRjpGlJwhS5g+DAxWFxjFOCZuaE1HNodyIe8eMstNjXKzKCJtX5kd
	Tf/zE/25cNLWhEIEx4WJ45c6uBHwJLPwXFvLiimTpjLoIvOmf42vnZO4rvIUIoGypYzrH2VlZJs
	U3aGMYDzFlD0WjMSkX/ndTT/1bEFnjLRSyEqMFOIrqNky7UZfclGEMW9ULeTKW1AUAkzqienEEP
	ZNS4h9A3Zeh7NK5XQUDH1rsYVzweKvLpMXlODR1A==
X-Google-Smtp-Source: AGHT+IG+EUm1ostCDRV/hO3wejH5D26H7RC4zeLBcEst2yDBkSUR6FysAfQPlFMWs+ABJOQD+3lcQA==
X-Received: by 2002:a05:6000:25c1:b0:430:fd60:93fb with SMTP id ffacd0b85a97d-4324e4fabc3mr19814908f8f.32.1766581395973;
        Wed, 24 Dec 2025 05:03:15 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ba8f:f3f3:92e:64bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm34259471f8f.20.2025.12.24.05.03.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:03:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/glibc: Increase VM memory
Date: Wed, 24 Dec 2025 13:03:14 +0000
Message-ID: <20251224130314.1717117-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 13:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228531

We're seeing OOM killer issues when testing glibc on KVM system mode testing
which leads to hanging selftests on the autobuilder. The processes killed in
the images are semi-random.

Increase the memory size to avoid these hanging builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 0838e8ac33c..b2b115972ff 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -70,7 +70,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             bitbake("core-image-minimal")
 
             # start runqemu
-            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 1024"))
+            qemu = s.enter_context(runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams = "-m 2048"))
 
             # validate that SSH is working
             status, _ = qemu.run("uname")

