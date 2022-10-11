Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91C6C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 13:33:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.7388.1665495174515855465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cTMZIL0C;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id nb11so31439756ejc.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ddZ5Ewrevga/iz2HqU0XTafLBhtDiGpu11roROOCxs=;
        b=cTMZIL0CksiV0GBtWp3thM5hGFRur9peXwL4SysCENkvvVZE/qh/jSW6SGAorOarQC
         EF9k1Snfvu71uj9HKWjFecIUwrQ5VbpRq5OXx18WHzA1/9H6Q0W5hGTRw3F2ssdd/P3R
         2LJvTYy10/wtoQH3RICzzUjDIMrCS2UmbMMay6qyPyIjcIBdtVnXS3yg7YSTg29x+d43
         yxfnyHQ2/cQsOZLh56Yd6OAwLqf6knqod3zTq/uMarISxPvkgf5uz2S5t5Rjuog3xmpo
         UzhmRhe0y5jk7Hc0x91CoVhblR7tTfer1gs9qvwZnQRIpWTsCu/peslufslet0vXe7zp
         kLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ddZ5Ewrevga/iz2HqU0XTafLBhtDiGpu11roROOCxs=;
        b=SP/hXwrhQ4qVX9lDnuIdFMbO4wpHjNoDej7dtpfB9467jq3lkGhg6eO0SltmPABfDz
         BbxbfmnZfvu+kEy3eRSDxMiiokxZenbkT3EmldV6t3yD19a/ySbhPQrEGrp+QjZmZ1iG
         Z6PTmRCmCqiV4PnBhbqiY6DbcntP4tWTs2zT57A+SlpDK3oSfoYO3IVlfFa6xiER5NN8
         Fv9kNLuUgcT2QsLJoCcn2qAfJ/eMjmmJq85A2JHujX8mXe1QIh0v2No6sPmQ5wd7ZfRj
         2STuRnTpHu9fWbakex/d8tquGdGt2qkY1g5gMyATmR8KVnXIGCZhR2Z3F+UOE0m632Wd
         Tk5g==
X-Gm-Message-State: ACrzQf2ih71wX+j9K5yQ9A5tJ2PG2wr/fsvv9J70FZAGYZCsHFq3gqlN
	HfU/V2PYU9MGCsEBE6UEwL8vuwyaM0g=
X-Google-Smtp-Source: 
 AMsMyM5AiaoSC1IPVM+TdwHzI3VY6ArDgju6rZu5325VYevVFPSekrQywwwwtD7BxL00J+S0cJwt1Q==
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr18879758ejb.514.1665495172360;
        Tue, 11 Oct 2022 06:32:52 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0045c329a5f81sm3432643edz.48.2022.10.11.06.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 06:32:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2 1/3] kernel: classes: Extract savedefconfig to a
 class
Date: Tue, 11 Oct 2022 14:32:44 +0100
Message-Id: <20221011133246.25707-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 13:33:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171623

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


