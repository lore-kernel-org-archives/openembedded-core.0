Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F85CE79CA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:58:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.35160.1695207487254364535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Krc2zcig;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3216ba1b01eso1348478f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695207485; x=1695812285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8Q3XVSQIF+0e8TJN32t2OX8fgNt8M8XIqe3MlRZdN4=;
        b=Krc2zcigJVM9c9LB2pHvkzuSS78AORWa/lo5nPsM8jISZXYQZYKCehWqVs1sYJgVX5
         WtTqLst+c1Z24UFMusyO/bzU0hT5vodm+LAj5hPrKaV1QWfIgPIWIM80W1HbV1d11Oxr
         2LmyBHB6PD4Cugn+9UZNwVHJfjLDD48Jh4JPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207485; x=1695812285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8Q3XVSQIF+0e8TJN32t2OX8fgNt8M8XIqe3MlRZdN4=;
        b=MjlJWYcNVeY2O1T/3tNjelqmv//8imUreqVpuSRg3Du7NwYzUsoCtHpFlBd5G6B1Fx
         k+HJlp/i0CHfV3RoMcxpTlSpPsjLGa/aLXXbhX+qVDDKcEnDTVzbfXDb4sx9s4KoT/6X
         aORymczwEPqLaPihWdIRyEYsljETZY/pX5lZmx530j1e6LYVs5p/N1Sf8whISk4kpZoO
         upHNoAYXBZxR/CzPe2j9LUdFHkqcZmGKsyG427GjtXE59MQMimPcviCo8jD9mpHHdtk1
         zPYuw8RwDyej3kMSKo8Hub5fNuK5Uf06PCgciK00qJF4o2tSMFe3Bqq/QjVwwVKvCRIR
         ntNw==
X-Gm-Message-State: AOJu0YwO2X6Ve+JkRLstb35j4oGmFXm5jcBIpcaep57Y3TqT7AZwILhQ
	fdbR/Y5FlfRmf1y7H1S6tM7B75cXlW2CBnL5NEA=
X-Google-Smtp-Source: AGHT+IGriTLzxQcsLnyDb28WSxSC0lHQzAsm3zJFd6wtyKPowQCiJ0SQEDz3Cf7Pkh+zaHJwTBmQ8g==
X-Received: by 2002:a5d:47c6:0:b0:31f:d52a:82af with SMTP id o6-20020a5d47c6000000b0031fd52a82afmr3278357wrc.49.1695207485633;
        Wed, 20 Sep 2023 03:58:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b0031f300a4c26sm426636wrm.93.2023.09.20.03.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:58:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] sstate: Fix nativesdk entry in SSTATE_ARCHS
Date: Wed, 20 Sep 2023 11:58:00 +0100
Message-Id: <20230920105802.1008778-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187920

PACKAGE_ARCH gets refined by each target so this value isn't valid in all contexts.
Tweak to use underlying variables to build it so that it remains valid in wider
contexts and works with new usage in sdpx and license classes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index afcda2980b3..67070440a6c 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -88,7 +88,7 @@ SSTATE_ARCHS = " \
     ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}_${SDK_OS} \
-    ${SDK_ARCH}_${PACKAGE_ARCH} \
+    ${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX} \
     allarch \
     ${PACKAGE_ARCH} \
     ${PACKAGE_EXTRA_ARCHS} \
-- 
2.39.2


