Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3700C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.23119.1750176028508139244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vt09OSXn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235f9ea8d08so58393505ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176028; x=1750780828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyDdgCVpjdDmRPMoR5Z/qsZrLax2U9xVqctrw999I7Q=;
        b=Vt09OSXnt+Na2Cu7SvkYg6vxYcgnyKOQ68OniItIDMjuxdLu41wYfWdiw9qYKdvQBf
         bnivekojBCXqB6LqT/sCqaN2zPKgTNygAxRlNaC5uKGaopEWkS2kF2BqryPUzJTYd94Q
         kTJb1DKuvCNQLxOVVuzKObODjSp5Tix4eW+cvcIyXg2CIsbes/n2G8VopEmcqc7sSpCB
         MwYxEgFqVwCaXfRIFX0xg84hdZY+WI6XORKiEqcKtYrcBhMeeudpqrpGmCfz3ZJjxVNe
         3I05dJLzho/XTSfZ20ZxmdHl++AnU/Lhsz0ClPMFsj4T4OGqLhUY5bFvbs3Qb6gNwouu
         s9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176028; x=1750780828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyDdgCVpjdDmRPMoR5Z/qsZrLax2U9xVqctrw999I7Q=;
        b=quVUhruii3z/A9cOJtXSaX9QMu2m89AZWagRaUsBkkZ5cXskJb7x809aAMOlnTuQq4
         Bk+GdYp7gB4jep/eZjcHedEmSmhgxdtIJanurvl5ytJPbQDn2D1cWiRmk4DZsk+5jkk0
         nJ5ATLURKalCIFMo50Vt4Wi233ZAtJT6wYIYCo7uL4s3dnCUyG1UT0CTrNCOMTPtejS/
         3/0yn7fj80CGqtC0AQhEXIlUlTjPTJiFIibUI8Dbz74A2F2YyiWVJzOSIZjp41svV8UO
         QwtwKvGE405SmSQbrqTy426c2lDJjphR/YR3i1Qf0j8/7+arGKaYLzf0jtK5eNQ+hYGZ
         HnYA==
X-Gm-Message-State: AOJu0Yy6pHicAKyGu0v9g0Xh6Vpzrn0+DqSzxRzbjztAw6xibGT9uCjY
	Qi4RVjvqrpSrvyZe5H+NNmMSJDMYh/VNmDGkLGwTJmHhm4GGaN+KigFqpeDUbCDpc3rigyHrpkw
	MJaXg
X-Gm-Gg: ASbGnct8/0abv7rkVee0jnGSnHYoBHXTSdpja5st4Zd3tCZzLtVNQwjzZc0xbU2gpo2
	JEtXMd0OrLD3Ashq5JLOtapTO6x71jgGSctuqTLOGcB/EFg1P7zpTbvfIv9vCCjKDCpWFR93eX/
	OE2Zn9zpy20FaSVEkU6ezANUl4ePwrntT8sq7kE2hisCkTQNEPUjaVeyncrNYOk2IVx5M5yyeLm
	01lpaRsiWBfsgZKbUgip0MZTZUuP9Ybsl8zpE8pkR6lj4/ziKa9EXswEYzYfC4W4UsREpekhIk8
	XfBxHkfjX39/pUqxQbHC5jvz8iYBEoyxxXVQry5ZCKl/uZ9Vs0yQ3Q==
X-Google-Smtp-Source: AGHT+IFbZQ7+YrdxOEdRtrrbvSEC8pbUWa2j3c9EyppWrzHzTGQC7HUo9S9HhW7arBRwj/3SVp7Jkw==
X-Received: by 2002:a17:902:f551:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-2366aeea034mr216524685ad.0.1750176022549;
        Tue, 17 Jun 2025 09:00:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/12] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
Date: Tue, 17 Jun 2025 08:59:52 -0700
Message-ID: <fd79c20430ad5c540522ddbe72ef235379c628bd.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218900

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

Remove aarch64 for ARM Cortex-R52 processor as it supports only 32-bit
ISA but not 64-bit ISA. Also update ARMPKGARCH for cortexr52hf.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 89f0e09450..e8667bc16b 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -10,11 +10,10 @@ require conf/machine/include/arm/arch-armv8r.inc
 
 AVAILTUNES                             += "cortexr52"
 ARMPKGARCH:tune-cortexr52               = "cortexr52"
-# We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexr52            = "aarch64 crc simd cortexr52"
+TUNE_FEATURES:tune-cortexr52            = "${TUNE_FEATURES:tune-armv8r-crc-simd} cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
 
 AVAILTUNES                             += "cortexr52hf"
-ARMPKGARCH:tune-cortexr52hf             = "cortexr52"
+ARMPKGARCH:tune-cortexr52hf             = "cortexr52hf"
 TUNE_FEATURES:tune-cortexr52hf          = "${TUNE_FEATURES:tune-cortexr52} callconvention-hard"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    = "cortexr52hf"
-- 
2.43.0


