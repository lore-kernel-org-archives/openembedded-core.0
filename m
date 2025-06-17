Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3D5C7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.23161.1750176285268725166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lJhn+lhs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d710d8so73306615ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176284; x=1750781084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyDdgCVpjdDmRPMoR5Z/qsZrLax2U9xVqctrw999I7Q=;
        b=lJhn+lhs0cNIF3LgjcuuTP3yziVIeaa6f4SpGV2wP/WTvJwkdvl0T6rxTd3lJdjH3O
         JHl7JEwHa6FHlGKMRcuNrueLIIbGPVtcsY5KJIYq6KqbjtR2ulabm3TIZ3fLWI0XjD0e
         8i/x2Uroj4uMROPpMQk5E/0IDehzkFcU0BMXy60H7JCOQt7Np0WnJXtIuXltr1y0uq/6
         M2MCaZMufKu4BBcAL1AW0y8toGpK3vXg6L+6/H3SlaQ1SQnJUkPoAAsVL4vvfPHutWbq
         zRGg3VaNuMKX99Y2kTUBixCysjY4VZHU1bMLkTlrChT67K3h0eFsGHw72/Z7Ht3q2GeR
         DBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176284; x=1750781084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyDdgCVpjdDmRPMoR5Z/qsZrLax2U9xVqctrw999I7Q=;
        b=rQUuE/1RUCN+0AK4PKLvNPi8sGymW95Sza0+r+iMvCuD7Py8xDW3w844RmOMk/u1Mc
         GttsJDOl4YUPlI0oZOLP2O0WmPo1+PvdIlz5o4novyKZO/9nsKLNiJlsofCWf7zGMUKm
         coMxCap/39Pw3rjGxNknceTMPYH4AKsjVo2qGrg9EDx7wbPGiB9E6eCdMU2Qpklt0tj8
         lf143b0zZ6aNCaTxl3uDOlErmhEYYhSfRUtf3YSeAyXUAeOCYgGgVmhlN9izbYMVjQxD
         vzmuuKtE5f1a77k9+k4gJgzYkbzaS0+KJPl1P8kM4L9Q6AFfM8onZvgoLH04LEj7NxGN
         u3iA==
X-Gm-Message-State: AOJu0Yz+Ovk350N+o6pBea38j5bc6vQjo7VNP8YAL4ubrVwzO2BVMNAe
	nrkHOA99Ttj/tuRISQazQS6eUzFh4IOaxmfO6dT3Dj4JH7BYsOhljWH6CLU6LlJ0I/dSDILEdNs
	ide71
X-Gm-Gg: ASbGncsiBaf9z5bf9HROZ6qo9vWjYlA8IybyDEAh55D0Khaz7EOszgQl1rKzZmQjSK6
	cZcebi7P7aO4DJ1/oRmhT01/g8CJy0/raOX1K5owuXzcDgQtKcoweFG09WPgLraflshmdX3kEOx
	tGCnhcGiBhwCkxpZEOYt7TJEDzr8+ujKysGjFBJmcn/qwT/gKVECfuSBQAeKf3xuTgoOhgR/KBY
	Oat39vcPo0TP+lp1bdXGDngHQdeAWl2/JD5cpeusN1NfsXGoHw1mFIbA8iBGlqtviFullJRcNG/
	JlIuCK1X552j6/Y4KwMFFBlmmB1Lv3daaLaW8TtzBayjluYWrRzJbg==
X-Google-Smtp-Source: AGHT+IGGtNdSjwYDEfGvKbgkQ+YxffnzUqgiOgu6PMGRh3sZ68sLkFdEbDqTTvhXBDcPx7mrA4fN9g==
X-Received: by 2002:a17:902:ce89:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2366b3dd319mr227430005ad.32.1750176284385;
        Tue, 17 Jun 2025 09:04:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
Date: Tue, 17 Jun 2025 09:04:24 -0700
Message-ID: <8ee21ec40e9f25ee97ec077b93751fea14b66e32.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218907

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


