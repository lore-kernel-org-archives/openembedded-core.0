Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AA8C27C77
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:42:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11343.1718116957682033084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Su6E74ZK;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f6fabe9da3so24274005ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718116957; x=1718721757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VtwgyvLIp5zwoVOs5xJf7euaGJjtJz97PKSM95BqvU=;
        b=Su6E74ZK09QpMpXS1An4aQR/ZQ2CBiwwnAc0X7AoJQX6JN/sKWAt8wzqeXl1sXGAy2
         u3CU7L4pDjU+Jc5m98QUyfWa4UxL7OFlNdBk0cA7h1zqS4X5GylsYMNqTmO6K77vSXm1
         Sgj85Ptwey17wWpaO3mepjLpoYwJGhSzi0NKtqkN1mfqPzUPW7tBtFpGqTS+05cNlh3t
         /nyAivzAwCoazaQ8Yu4O5JmBtkQPYhF1v5JOrND/xTtAEdUF/Mp/5I40Hbfu+ofs1evJ
         xpXrpxP5Nfo5osE0qTchioTYFysmCENwGKSmdSGjjf/OzwLzWl3EybGIJre+lmIUmGgS
         aPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718116957; x=1718721757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VtwgyvLIp5zwoVOs5xJf7euaGJjtJz97PKSM95BqvU=;
        b=YVHLvHc0ayTe/qFa/QLPuGjWmxm1b4o/MGPy+BYq+VqKnwmb6Gurmdm+/JNjpUuoHM
         oEvx2VHFynBvdXW9+bCOOTY4nyozTwdg0FVBTpPjA5w62LVAqJG8D4Kow/qgygkTH4sK
         NibJGFuP3DsApbMg3Wo7rhPVCKiJ4wenT+UP5gz+gofn2D9DLx1sthD5ml3ECy3tCHW4
         KjyzYEne/4eR91yP8ZwFeKGJ1HFnFJ+q7BtZbBlAVYCZi1oZjpNxPccUo4A9/PZjP/Ow
         qUp6qlCERWnRivzTXswYOklJdmvs1idEo0B3drqo9umt/RrPWJ7BOM9/EFQgKRrwQKiL
         36xA==
X-Gm-Message-State: AOJu0YxQDf1zvGRUCd1M0ItQvp9LBL7puAqqo/INAGGfeDwHY8qzrvD2
	q3bEqFj0QOVOLs+Lyn9wcLnkJvp5PBpSDTXAIn6eCXGefM5bV770GfOoUg==
X-Google-Smtp-Source: AGHT+IEP2ds5igvehNECx3lYZa/KehjXLBfmJD6rt2+D+SjKrPNqnmeb+Mfzc2ANXCWqvojdyDLitA==
X-Received: by 2002:a17:903:2451:b0:1f7:178d:6990 with SMTP id d9443c01a7336-1f7178d6d08mr57847205ad.22.1718116956665;
        Tue, 11 Jun 2024 07:42:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6da30cc2asm81872895ad.236.2024.06.11.07.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:42:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ltp: Fix build break with clang on risv64
Date: Tue, 11 Jun 2024 07:42:34 -0700
Message-ID: <20240611144234.1635459-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200532

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop setting compiler-rt explicitly

 ...-__clear_cache-declaration-for-clang.patch | 32 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240524.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
new file mode 100644
index 00000000000..ade6a52b63f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -0,0 +1,32 @@
+From 2d384f268791ecd5ff0f26c8137dd4de0a1c4566 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 22:52:56 -0700
+Subject: [PATCH] Add __clear_cache declaration for clang
+
+__clear_cache was enabled on RISCV recently with 7352ba02390116f1cd6a9b583860ba28aa0a1b7a
+however it fails to compile with clang19 on RISCV
+With this error
+
+  hugemmap15.c:51:2: error: call to undeclared function '__clear_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+      51 |         __clear_cache(p, p + COPY_SIZE);
+         |         ^
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-June/038762.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Hui Min Mina Chou <minachou@andestech.com>
+---
+ testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+index a84ba6476..856e22ff3 100644
+--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
++++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
+@@ -21,6 +21,7 @@
+ 
+ #if defined(__clang__)
+ 	#pragma clang optimize off
++	void __clear_cache(void *start, void *end);
+ #endif
+ 
+ #define _GNU_SOURCE
diff --git a/meta/recipes-extended/ltp/ltp_20240524.bb b/meta/recipes-extended/ltp/ltp_20240524.bb
index 1aafed0bf59..7105154712f 100644
--- a/meta/recipes-extended/ltp/ltp_20240524.bb
+++ b/meta/recipes-extended/ltp/ltp_20240524.bb
@@ -28,6 +28,7 @@ SRCREV = "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://0001-Add-__clear_cache-declaration-for-clang.patch \
            "
 
 S = "${WORKDIR}/git"

