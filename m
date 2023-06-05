Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4567C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 22:15:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.90.1686003335780854586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 15:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=kOGhYohG;
 spf=pass (domain: linaro.org, ip: 209.85.208.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso8228330a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 15:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686003334; x=1688595334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oiiBoNPKH/QGzI4e8oJqDK10IbWx+c4zL9dS2zg8R7Q=;
        b=kOGhYohGPN5YkXFh08lkQrO3q8pPSTEU3/Dy/XgUuLuXqm3bryE3OM/Ov0Pzt4nKlN
         JmT7YBUlKylNb7Pd4iLcWEBiXa+SswE3SLzbp/w2/4fwRG2eaGIiqeRgNwa9FSfMZ5SH
         svJijyVnvZP5m48QFn2jpiQpVxnaqq9M5cJ2haNV8Wj/gOD3LOpXQ+oJiwa+dX9o6pFT
         4rF4HrBZA7Mlx0kU5YU9ZUSvXJP0CQnSiOsXIkVc/HEpfrzMWTpqG7Taj4CAj3soXIzy
         Ba49eUI4ZlPOwmfwMEXsUXBWxhuT3UG9pAt9mARMDIG1PEBkB3EGdmKyej0n0Q0hfJ0I
         FH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686003334; x=1688595334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiiBoNPKH/QGzI4e8oJqDK10IbWx+c4zL9dS2zg8R7Q=;
        b=V9PRwAG1iX7WgBBj1TVQD/6LkaKDqjeIhwOZITrCf3HmtlmVOnQot3bDxuzHzJl8K9
         WTZG7RRZKB0tzn9hXdtFtrxLsbeHdE4pwKhwMl77zJQqqLmy1BF0oZ3N3OBYWUhkr739
         8iLXJNH67Q+lDglDpo2jFmIeYCCiOEAMz/6qiWWtnWbn4z1GUCIRMZRPXt27FfSbjm7A
         2l2J4d7BNYnbFrHhHEJ2HP6bAj6Ih1U4qpIvJ4kYFD/pfK17HVQpt/l20WABMOj7HcVQ
         Eal9g4aauk5sg7H9jmrf27DdkHIadzTeUjLkSYJY4sDUa1GyK1EWweegsCqctAFlMPFL
         590Q==
X-Gm-Message-State: AC+VfDxbMTa/QW0qNFfZU188dJBY67brWTFDJXbnjZlCEzmwfaGCbW14
	qSct3M6Au8KMUJJWgVgmc/4I+hh63oC8MiE+QY8=
X-Google-Smtp-Source: ACHHUZ5CDo4yGqVwP1RY3PfzQGE0M/1KGyFVjLNohVkI9wdoXQ5coj9R24PRDelF0RgeWs5FzJ0Eiw==
X-Received: by 2002:a17:907:86ac:b0:977:d48f:97ad with SMTP id qa44-20020a17090786ac00b00977d48f97admr129348ejc.75.1686003333819;
        Mon, 05 Jun 2023 15:15:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bg6-20020a170906a04600b0096a16e49b0fsm4705068ejb.51.2023.06.05.15.15.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 15:15:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: fix building on riscv32
Date: Tue,  6 Jun 2023 01:15:25 +0300
Message-Id: <20230605221525.1277838-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 22:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182401

On riscv32 configurations OpenSSL fails to build with "undefined
reference to `__atomic_foo'" kind of errors. Change OpenSSL recipe to
use linux-latomic configuration instead of linux-generic32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index dca6f18e7454..f5f3f32a978c 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -118,7 +118,7 @@ do_configure () {
 		target=linux-ppc64le
 		;;
 	linux-riscv32)
-		target=linux-generic32
+		target=linux-latomic
 		;;
 	linux-riscv64)
 		target=linux-generic64
-- 
2.39.2


