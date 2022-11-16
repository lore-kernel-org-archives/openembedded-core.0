Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FFAC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 18:49:35 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web08.796.1668624566737334351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 10:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p2pUJZBZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id l127so19560608oia.8
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 10:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOuMmf1FLg1Bqm2359TGe7yGzPlH1h2Q3HwLG50xzDM=;
        b=p2pUJZBZAk2TrmfGx9Vtp6dFEAKZebmv21cUQFcD1uiHO2CTn6+y24FHY0/OOf4sMY
         /w4v16RGPT09xq/U/xiwnRtDmQqdtSnaMM4om7q0MWHkZ3NAOpXrsA490vONa77TzCJy
         h4Rk05jItXGPKVUk9fA3aCGGvlMBN/iHhTGVFPgpYAu3JgCjVUfoh1xob7pSfpZXrao9
         32nRW1eWMooQ9a45GKTHZf1uFjJU52g6bueVk5pVTHohZzBb4rpiAc5qGMp9sMMtkXmc
         f8vDqRPt4aX4DFRwzga2l8mT3RZjES04L0ILZEoc6AP08pAEa6d/UFDkKMNJbZyLM7kZ
         2mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOuMmf1FLg1Bqm2359TGe7yGzPlH1h2Q3HwLG50xzDM=;
        b=Se8+qlZA7w4Q45OuRcTxaXX3IENEZgSFDFbb9yj0cfOWoV1E2AQV1lCvoRsqZnhUIt
         qH4k42eCQkgpWCs+bSejXp6zgTgAW9/blutFauvnIUV8HHb7hIZdpol244x8lH6djImL
         2X0bce7rOEHhNokDV6FjWaiHt3r4DURJVDHMLxxDGqBRp/7sWnp1w1JibrBzbTGViM8O
         5+KzKAmtiqkzzkczt7OuKkZoTJEUMUih9SPBYKgcz6X7S6E4H9kwHxLfKFiN2mAT0OgX
         D76tusq8+NTYJhvJtvFw8wdo0cqJZTJVusWlqeQt34OlhbbjFf1wrqhi+Ny5HQwNaszj
         uk6A==
X-Gm-Message-State: ANoB5pnt1bo3azwN1Rd+IyfDY1XniMfD5VhO7V1eFZGSPWOdHcrBweeI
	Hv05JghBwR2x1DX8c32QSdVVzh888Pc=
X-Google-Smtp-Source: AA0mqf7Tpw3MY+pBn0WAVixfA1TruUNrZqlQRNJoHegrg2YD4QOTsKvZpccA/Gwl86B5CNGAk5Cesw==
X-Received: by 2002:a05:6808:1186:b0:35a:eae4:b8c5 with SMTP id j6-20020a056808118600b0035aeae4b8c5mr2308689oil.155.1668624565642;
        Wed, 16 Nov 2022 10:49:25 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id j59-20020a9d17c1000000b0066da36d2c45sm2831329otj.22.2022.11.16.10.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:49:25 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] qemu-helper-native: Correctly pass program name as argv[0]
Date: Wed, 16 Nov 2022 12:49:19 -0600
Message-Id: <20221116184919.2085915-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 18:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173389

The previous version of this wasn't correctly passing the program name
as argv[0], and was also over-complicated anyway because argv[] is
guaranteed to be terminated with a NULL pointer, so it can be passed
directly to the execv'd process without needing to be copied.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../qemu/qemu-helper/qemu-oe-bridge-helper.c      | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
index cadf2a012ac..9434e1d2699 100644
--- a/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
+++ b/meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
@@ -8,6 +8,7 @@
 
 #include <stdio.h>
 #include <unistd.h>
+#include <stdlib.h>
 
 void try_program(char const* path, char** args) {
     if (access(path, X_OK) == 0) {
@@ -18,22 +19,14 @@ void try_program(char const* path, char** args) {
 int main(int argc, char** argv) {
     char* var;
 
-    /* Copy arguments so that they are a NULL terminated list, skipping argv[0]
-     * since it is this program name */
-    char** args = malloc(argc * sizeof(char*));
-    for (int i = 0; i < argc - 1; i++) {
-        args[i] = argv[i + 1];
-    }
-    args[argc - 1] = NULL;
-
     var = getenv("QEMU_BRIDGE_HELPER");
     if (var && var[0] != '\0') {
-        execvp(var, args);
+        execvp(var, argv);
         return 1;
     }
 
-    try_program("/usr/libexec/qemu-bridge-helper", args);
-    try_program("/usr/lib/qemu/qemu-bridge-helper", args);
+    try_program("/usr/libexec/qemu-bridge-helper", argv);
+    try_program("/usr/lib/qemu/qemu-bridge-helper", argv);
 
     fprintf(stderr, "No bridge helper found\n");
     return 1;
-- 
2.33.0


