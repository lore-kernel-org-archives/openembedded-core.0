Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEE4C43217
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:18:27 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.17815.1665559101133482434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/Lb0jk4;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w18so9659239ejq.11
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ddZ5Ewrevga/iz2HqU0XTafLBhtDiGpu11roROOCxs=;
        b=m/Lb0jk4MXMVvUvSooKp91VqGAP/PRxxRktixEdNApnqZSwP94Ju5jkV4zd6k59Mfi
         gwXQL8KTw1iJkTqkKHx/J+yshATeijBbeySY2GeaXzFI19iEMczV6FnIaqnXyZ2pN3WK
         SJN1gblWV5V0v0P8G8r9ymLlTVnEQtI5yWTN1apqFNrv6NeR1mse+Q5mMcaNvrofo9/5
         6QxvzFSpthfCOW49zdHYhMupcAIujzJjdp6lnEWJr57mvwb9r5NzobZZfasIa/5ruWPR
         jE/l4MZrcM9ZZ8h6t2ulKt5/yPxV3QLN6teEXoZRk4ZdUUPE5/Ud/RTp/rq+gdh/u+BJ
         gW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ddZ5Ewrevga/iz2HqU0XTafLBhtDiGpu11roROOCxs=;
        b=x4vCGapAb2Vo6pOtatQMFY+TLZ6NvVdPLxUNB36JTBL8Y36zEaMuV/KWmNzS5AWNt+
         8Dx1VTR7sjr/ewLH4qmvn1S1MsBTyaB4GDX2GzryyFbC/dpsJNjoR5BuLIjkqwAMgJN9
         DJ5ZD4aYuqb3lw461Qtwb65m3URe3jXjRiXdB3+3A3P+TveOBZAwjJc/+HiyMAv+jDbb
         ziEpn6sVv3dNk6Q4rSDd8uJOQ9YdDMFrspcBZ5avd5PE8VYAX+VcU5ueXK0rX9ayrGZI
         wFZ1IcIjDgrVxWET1GHWi/lwPmG331/rq1uAztkEdqA92BN/PlP6r/he+WwAsLvi873S
         UjTw==
X-Gm-Message-State: ACrzQf2ybTTmZqq6fh7cZVjF+tcmwuFna6NkpQ/gBTmHp94osKOVVrWY
	Kzq6iiRQCAMMoLziYYqSITWuyj2f/28=
X-Google-Smtp-Source: AMsMyM6quBHsXje+06QFtHJb8FkHOxDQZzMj8RUy1g/2Xb5lTg8dHAWdPS0Lzxu2ILOIsJfTEPG5aw==
X-Received: by 2002:a17:906:6a09:b0:78d:ed9c:d880 with SMTP id qw9-20020a1709066a0900b0078ded9cd880mr2652889ejc.424.1665559099302;
        Wed, 12 Oct 2022 00:18:19 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id ch8-20020a0564021bc800b00459ad800bbcsm10601960edb.33.2022.10.12.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 00:18:18 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig to a class
Date: Wed, 12 Oct 2022 08:18:11 +0100
Message-Id: <20221012071813.778-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171650

Move savedefconfig task to a class so we can reuse it in other recipes
which support it.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes-recipe/cml1-savedefconfig.bbclass | 12 ++++++++++++
 meta/classes-recipe/kernel.bbclass             |  9 +--------
 2 files changed, 13 insertions(+), 8 deletions(-)
 create mode 100644 meta/classes-recipe/cml1-savedefconfig.bbclass

diff --git a/meta/classes-recipe/cml1-savedefconfig.bbclass b/meta/classes-recipe/cml1-savedefconfig.bbclass
new file mode 100644
index 000000000000..c340aac11204
--- /dev/null
+++ b/meta/classes-recipe/cml1-savedefconfig.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+do_savedefconfig() {
+	bbplain "Saving defconfig to:\n${B}/defconfig"
+	oe_runmake -C ${B} savedefconfig
+}
+do_savedefconfig[nostamp] = "1"
+addtask savedefconfig after do_configure
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e4e69e076375..eae7b2f78a9e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -634,14 +634,7 @@ kernel_do_configure() {
 	${KERNEL_CONFIG_COMMAND}
 }
 
-do_savedefconfig() {
-	bbplain "Saving defconfig to:\n${B}/defconfig"
-	oe_runmake -C ${B} savedefconfig
-}
-do_savedefconfig[nostamp] = "1"
-addtask savedefconfig after do_configure
-
-inherit cml1
+inherit cml1 cml1-savedefconfig
 
 # Need LD, HOSTLDFLAGS and more for config operations
 KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
-- 
2.35.1


