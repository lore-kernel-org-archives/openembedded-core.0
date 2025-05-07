Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14353C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 15:04:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.793.1746630268813151890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 08:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3oXplxn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22928d629faso65471615ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630268; x=1747235068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnHHzQc9CFkYcoAz0efpQka+2zfOgyWpdp6jzbMYVG0=;
        b=R3oXplxnbeBwG/bikRpTFef6oXmn0D58Pa/gsG5DUPsrSzJ/p+FnKsBsOPTvtSBaSQ
         DZUx9ncCnJX97fc2U/OMkLokpJVYae5ceGMp2tCOi3x52jZd3LDTs/GRzJWAHPcmpdl6
         iAPPfg3mFDJT1oYh+mgDu1C9zgb5fk1Oy6cjbHAb4EtSgDSo4AM8lS/5PUaKVi3wJ0OJ
         05C/N5LDAelNjchlfMeQDT5s+VVJeftorZFnG0uoRC9oBAJrhBSqTwJghcw5b17MRgdR
         PPxNeMvb9z+PVJPAr9C8cd8MfhmWVJ6UNRCTcYWYuIjCyJvd7S6OoBGLOjWhMRBLqQfH
         xu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630268; x=1747235068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnHHzQc9CFkYcoAz0efpQka+2zfOgyWpdp6jzbMYVG0=;
        b=Rfm9+oBX+uHp7Rl3ay+f0JD3X32MuczEiH0IXlTyYLgsj96cQeqI7XMapn/hownAFf
         IDRoDYdP3w1PK0/BLQALHpxel+9E++FngB73oumPH7F5d8Ptor7r3tt5uLg5SlhUk0I4
         8mqZW+/QzDrKRSu7GdHumX9M47MVo0NszLHKcuetGUHlVB0Sm7LmQ1B1IcCMpnjksxgn
         x7E3Dbydu/XnBEbfSBs065uGZKxqhVcU/rGZodk31FhLUZ5IPSNsY1pJ04JMgvavwdKc
         0QQIOuD/4gLuvqHAdOW/EH2VIgyG0Jg37o8V9IT3573nptn6jgJCe3Tdi53XzbTjAcOZ
         FgdA==
X-Gm-Message-State: AOJu0YyYxng/kXF93y/8LTQ02iQJrkgaZ2K98GuQ7VZkSIuL5+Zlk+8H
	7ZbWqbjvbdPQJCkLvxwqYJ5mUxDQNC/jfaa4AgDmWzBc14/X/xnQ3CMN7It4
X-Gm-Gg: ASbGncvE2GrQHb3ebYXuw1ByUW1769Ls3KUmxtSuxOQi2wLmHlG6duKEfJfB9c0VybA
	gLXSk5q9XTa1zBPekmoH4iCQZtDkh4ybai6yOj3oTcUOr/H5aIQrs6SIiyqejAb9vueE2Y9wWMO
	e3HavZuPqoF9G/HupkKTCfA5Bv0NltwW/rd0SUVMLIivCRYJBj4l+/CCn/xasOv6VmIH2RNhQHV
	mBcOqCypHGvzMLiGDrNtoOvu2UJbVYLeFa84eip5hjX/+R41RUZ+TsoTL3Btn0HisXwOEGNCNdB
	SXV1t8KZ3PFHzgKcCl20JDCQ1W//eHw6mg4E5hcpVKw=
X-Google-Smtp-Source: AGHT+IFnDGie7Zurc+UCNmcdh/NgRPMkru7f+UnbioMhM3efzU3glh5STePyyoGEti+XF9QI3X6tHQ==
X-Received: by 2002:a17:903:244c:b0:223:2361:e855 with SMTP id d9443c01a7336-22e5ece18b8mr49906645ad.39.1746630267906;
        Wed, 07 May 2025 08:04:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e61f3adccsm18011295ad.200.2025.05.07.08.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:04:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] arch-powerpc: Use -maltivec in compiler flags if altivec is in tune features
Date: Wed,  7 May 2025 08:04:25 -0700
Message-ID: <20250507150425.1132318-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216118

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index be687e2df7c..0719477c414 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -26,6 +26,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', ' -msoft-float
 TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', 'soft', '', d)}"
 
 TUNEVALID[altivec] = "Altivec"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'altivec', ' -maltivec', '', d)}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf powerpcle powerpcle-nf" 

