Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD9CCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:41:30 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.4721.1757446883162960609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0kmSEfO;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b5e35453acso63968121cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757446881; x=1758051681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hog6wfYpz/xUKvqVKO5KL4ybNbaPvMXjgLs1UFltosI=;
        b=k0kmSEfOWKPZTfKiSLH6NTaeez1UjaIReTksCkLe2OBXPF9BWngV9UTYYsaWLMEwKZ
         3sFAThZnb0UAfeAfT6UjU7fJ+MK3mbvJDtlcUHC4n9UHaqbYjtHaQ4+Xfo9obW9fE4MX
         +BHeAWlivk9o4uICkCr2nkGZ7PgjtWnR2YbQqrF5Vy/gWZ1Z9cP5oLqOORi+AwNprapI
         ORllc6VLl7BiHqE1amo6nIklPBQOhecIS4J2f9l2vYWeCZM0JKxwCNC5s5x/rNZcsR5T
         lIuL1QiwdzEjiOTiK+mp49mdCFOFNrTCJdF2kWPHN2O1NTpI2x1Ko81UjtjvSs+iTOis
         0oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757446881; x=1758051681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hog6wfYpz/xUKvqVKO5KL4ybNbaPvMXjgLs1UFltosI=;
        b=pEZLRpBy6oG0yh/Pkk2ufSqm8mLW90zCmIgpnLOQ2Y8wcYWk8OhwfKWczA41gr0kXM
         DgC5K8BZkz6YQt5oo2BrqjQDSjSlSh1NYrzj0b0kgUi80PtC83PRAScIW8OLtxzOLFAp
         W72UE3mVdfUuVr81a6qSDAOpXpcQ37fpEQP8jduelJHRnpPCH3iaqGUMdonXl4FuJLxF
         AGurjYkXBmoFJqbhsxb1nYBnbWmNb4Tf1mmYtnFIO/I796eR+j9NXeLQq5eNKdW4WfS8
         17j9UEKYmtKYpu4n66Vtxvb20fK/bQodZGxx8uurocEGW/1BBtmxgESPCkcMaVApj5M1
         Y18g==
X-Gm-Message-State: AOJu0YxBP8qkzlXt9205AZhAmxyG8mILcefXQatb6562dNRaQMRuTDu+
	zAPS2UB37J+3WIWyjDasC+6IbYIJRhYZrT57wcbEoE2kvD6t2O6KmePmwc9aJw==
X-Gm-Gg: ASbGncvPQYhbZ8UCIL9LwDSzzcgovHdoiY8C87ALsB4TtClwZRpVSI2LTKT4UJbK4PT
	xzP4I/XyGeaQ7e+SpRT6qOcNHJ0o5Vf2PJeGejZJO6pXj77T0QVkaZtNEPV9ONXnQbAtdmWEXUD
	XouW+kmQfq+M21pfElPLigJcA2Qv7foO7INmmUGwoLE0CbkFTaIGK0/ohrDBkA035cZL7iv5iNU
	EZMAomg7TgDwwPCTBwHRrM1QGlKugJ1eAqkMuL7aXccDtME2IVYJPRyMBF0u2EAWp3f5ZeoPGgp
	nOnngKQVo0NY0CGSaadjeM4yfkcbCexDVPm0h0UbxQqFEyjFVK9utIP0h/Ab3z2cpqvIb8TUWmR
	dopGWT3ADwfFfkzPqHU6x8MBZ5smidoTIHCg29cN6TV+6NItcUsAQffJwlNqoz68xd6dHPWGvaI
	adzhKXOrKQuws=
X-Google-Smtp-Source: AGHT+IGmUVTw3lqJZyW5+AfJHMgHs5NmUGrw+pM5wlGQ7nJIqa4RpzNJ65jvi4w79Sw8z8SeWwSEvQ==
X-Received: by 2002:a05:622a:4244:b0:4b5:e83f:70b0 with SMTP id d75a77b69052e-4b5f84bb313mr156689271cf.83.1757446881520;
        Tue, 09 Sep 2025 12:41:21 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5e4cb960sm160431385a.33.2025.09.09.12.41.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:41:20 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: partition.py: fix help string
Date: Tue,  9 Sep 2025 15:41:12 -0400
Message-ID: <20250909194112.29537-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223138

The help suggests invoking 'wic help source-plugins' for information on how to
add a new plugin, this results in:

	usage: wic help [-h] {plugins,overview,kickstart,create,ls,cp,rm,write,list} ...
	wic help: error: argument help_topic: invalid choice: 'source-plugins' (choose from 'plugins', 'overview', 'kickstart', 'create', 'ls', 'cp', 'rm', 'write', 'list')

The proper command is 'wic help plugins'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 0c9b1a5b9620..531ac6eb3d4a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -178,7 +178,7 @@ class Partition():
         if self.source not in plugins:
             raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
                            "See 'wic list source-plugins' for a list of available"
-                           " --sources.\n\tSee 'wic help source-plugins' for "
+                           " --sources.\n\tSee 'wic help plugins' for "
                            "details on adding a new source plugin." %
                            (self.source, self.mountpoint))
 
-- 
2.44.0.501.g19981daefd7c


