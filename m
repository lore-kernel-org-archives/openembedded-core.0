Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31980C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.4675.1741809184868283392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d9T9fHj2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2552002a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809184; x=1742413984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hL/bm8iePA/nNJ+yOtejRdSb46TIADV9VkprQHgD3Kg=;
        b=d9T9fHj2/BzGDboGOFq676DR3rXeKnA2aWlxpVnmRhRl6GzBiSispfOJJdZ9gm4u6C
         W5eGCP6QvkE1JDLcachbDXwFhzXZ4wRvENCENMgDszO1dKug0YN4h1jElCFA5U397LK+
         lCzQ43aZrDCOvy6xOiGnMwpKCA4C1IQ+/zLYcKjRuRthiUQyv1WQ//xkqM2VkjwAMYfD
         dGHQrCWocXJmTv9p1/8EdwOH21zZtCqU8zm580n6Vb3hI53ntzIUSyRveZ9/fSw1rlmO
         tWhG267Q6HmP2Z5x4eDqnCkVke07OPPRCVdIFJJqtoATJEODbSVdWxoLmEC2Q/6yNUgC
         /CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809184; x=1742413984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL/bm8iePA/nNJ+yOtejRdSb46TIADV9VkprQHgD3Kg=;
        b=kLgS+L4D8x7SX4Uag3cU5xaIlQW6/mhJhFpR0sM2KqbXmaKqNFOhvg7hbxcW7aZIKR
         +3JbYwnMLEXsPNVFvZlk4lbmEJ00pdydO7u+Y4ClhoMjEEpSAgW9OyejsawKLauoveeO
         zpyUfE2EMyYCNo2pL9//J7dAvLUx6lBnko6FQdiC/dSsczHwXW3JOAnBDq01hVxJwA+e
         FBMm3jyB5DNus58MtxVn1vqw6SHuBFW2cQTm25aNsuj10MAUWcHXH0F+Zi/zN49jQ2hc
         kX8pSbw9WOr1tYeJYA2xPGODZga4StN2uCclTkEhvPQzWIRrOhnEMTv8JlJSFaOJXnWI
         5ErA==
X-Gm-Message-State: AOJu0Ywkd/tvS1T5365PhPJ6FJd+bBavfoquNOC+ZiciTdGfIEHZ7wMj
	oZMzot1lxdwX/Y1GO7pzJBESg1jYHsjgYrNRB0TAIIcMbEO993320cmIcIrj2PdahetG6O9WKtt
	6
X-Gm-Gg: ASbGncsnRu98dJI5Ej7tMmrW8xY/jq4/uEiqv0IVhCgMSz7v6ajO6xUNbPyeZ7jJ3l6
	m9qctxcKr4b7+rKdA1Pphiy2XVt7dxocsV1dmmQSCf6X9JCEhd0LPKOThw4kRZ5KAE8V4e8ZFoG
	G5XuxLu6UWkhxPhirJ/M6OPigmDLDkmiiJxPoJ740xhbMpvRjwJLxRiXoGo2eO6XQjVVUtd3RiD
	4sUfhxCGfz3tJbxveEFngukqHiXt7PuXtfqzWCcbarFhXeD/rCV8y+us8NOyMuYWvokPDOtO8Th
	Q46aOQX21qsz8w0mrecMcoO0cc/LQ71LUV4=
X-Google-Smtp-Source: AGHT+IHQMUCW1zD+/DXdnTvAtSjT2FV/TfIWreCvMZyV4cU8T6YE+V8aA2gJ+jUtHhJiThU0eoZAug==
X-Received: by 2002:a05:6a21:33a9:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-1f5ad42a4bamr945359637.10.1741809184081;
        Wed, 12 Mar 2025 12:53:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 16/25] grub: patch CVE-2025-1118
Date: Wed, 12 Mar 2025 12:52:24 -0700
Message-ID: <def610a1298ad7b8c98185a2b4c46f2c7173a950.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212683

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-1118.patch            | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-1118.patch b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
new file mode 100644
index 0000000000..e6906d909c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
@@ -0,0 +1,37 @@
+From 34824806ac6302f91e8cabaa41308eaced25725f Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Thu, 18 Apr 2024 20:29:39 +0100
+Subject: [PATCH] commands/minicmd: Block the dump command in lockdown mode
+
+The dump enables a user to read memory which should not be possible
+in lockdown mode.
+
+Fixes: CVE-2025-1118
+
+Reported-by: B Horn <b@horn.uk>
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-1118
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=34824806ac6302f91e8cabaa41308eaced25725f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/minicmd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
+index 286290866..8c5ee3e60 100644
+--- a/grub-core/commands/minicmd.c
++++ b/grub-core/commands/minicmd.c
+@@ -203,8 +203,8 @@ GRUB_MOD_INIT(minicmd)
+     grub_register_command ("help", grub_mini_cmd_help,
+ 			   0, N_("Show this message."));
+   cmd_dump =
+-    grub_register_command ("dump", grub_mini_cmd_dump,
+-			   N_("ADDR [SIZE]"), N_("Show memory contents."));
++    grub_register_command_lockdown ("dump", grub_mini_cmd_dump,
++				    N_("ADDR [SIZE]"), N_("Show memory contents."));
+   cmd_rmmod =
+     grub_register_command ("rmmod", grub_mini_cmd_rmmod,
+ 			   N_("MODULE"), N_("Remove a module."));
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 6f0c8a133f..bd0c9d2601 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45776.patch \
            file://CVE-2024-45777.patch \
            file://CVE-2025-0690.patch \
+           file://CVE-2025-1118.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


