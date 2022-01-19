Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03344C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4713.1642588901646943290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RTW97jdi;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id v123so4508944wme.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MajzCMvyKg1FsfSC/BCVBXO97sNYL5ko/KDws5TF1Jw=;
        b=RTW97jdiUxm7TZZEmjHQkk9/pZ1WrehncAohadJD9ECz3MQuvxxq5mmf7NOZXPk1B1
         fwdmmQE7ey84OhQA6X2BAzyd2K1b8EyJjkW45AsLBDnXqclUIl9y4HCmIN1NLzPV2nFW
         Wuf6azuuOHS+I984LjyAcDtDlSTTBKvNCDhmetiw5blHLZL0Q6mW8RyZEXPHb2lLfVF/
         m1aMJvH4eHP/VkTIlhj6WcKtcSDx/B7Nowp+NQL4OOleOEpqtLzy07tSXnEaqv+Eicex
         e9n0GrWkQzFZrzU3RqWvd1PctSAnWCsKU1J2sHgdXykzur62ZzOxX08KYHQJvWVTju3o
         jZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MajzCMvyKg1FsfSC/BCVBXO97sNYL5ko/KDws5TF1Jw=;
        b=HS3QkmDspcwk97y2GB21XVQOymDEOwSCm4VSHgBL8VquzDpo1+yrA7K0i05vHms3i1
         mR+mgygTCnl2kDo3HYdhAEcMqMXfzINqqDEiP+mlDE6nIgdPIs5zqFP0A1eqAuxqjuXz
         GJ73v4lVkor3yRT1TfVbQLO2fqga3hrJ3j+7lgKhbykD5cR5JXLQl6YOgXZulA/+7ARq
         UzwnR0wGMdzgupo+UFvpY6b4jmhjlxbnxnA0ZMDuLULA9j3OIVLkyjq62goIgnSPDKcO
         JsJFRe3ZgJNnbPUBYJ9t7qW0duSvJahwppsCVdwK8Bk59KRDTregKJLOQtYIUyOSFm1r
         yG4w==
X-Gm-Message-State: AOAM533fIDhn0eAqt3mf7f91GVESAXrl5hnBP69qYSxtt9y4sJbsBkWO
	8UvHRs+gJ6aNRzDDathKVn5wnFjgllw=
X-Google-Smtp-Source: 
 ABdhPJx9dikHLlj8AuRxV2F0mv1PHnCdkjTUM1G7kTArbaI9h02CTMewQPkxZ7EMqq0gNWkqXLw74Q==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr29010711wrl.586.1642588900212;
        Wed, 19 Jan 2022 02:41:40 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/39] e2fsprogs: upgrade 1.46.4 -> 1.46.5
Date: Wed, 19 Jan 2022 11:40:58 +0100
Message-Id: <20220119104117.2120127-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160711

From: Alexander Kanavin <alex.kanavin@gmail.com>

Remove patch as upstream addressed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ct_io-expect-correct-expected-output.patch | 69 -------------------
 ...-missing-check-for-permission-denied.patch |  2 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  2 +-
 ...2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} | 11 ++-
 4 files changed, 7 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} (94%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
deleted file mode 100644
index f198df83eb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From ea5adf259e01c790f9ba69d6fe88d691de410b6f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 22 Aug 2021 14:37:32 +0200
-Subject: [PATCH] tests/u_direct_io/expect: correct expected output
-
-This is likely the right fix, but upstream needs to confirm.
-
-Upstream-Status: Inappropriate [issue reported https://github.com/tytso/e2fsprogs/issues/80]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/u_direct_io/expect | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/tests/u_direct_io/expect b/tests/u_direct_io/expect
-index b0cdc730..830cbd75 100644
---- a/tests/u_direct_io/expect
-+++ b/tests/u_direct_io/expect
-@@ -19,8 +19,8 @@ Filesystem OS type:       Linux
- Inode count:              32768
- Block count:              32768
- Reserved block count:     1638
--Overhead clusters:        5131
--Free blocks:              27631
-+Overhead clusters:        6155
-+Free blocks:              26607
- Free inodes:              32757
- First block:              0
- Block size:               4096
-@@ -29,27 +29,29 @@ Reserved GDT blocks:      7
- Blocks per group:         32768
- Fragments per group:      32768
- Inodes per group:         32768
--Inode blocks per group:   1024
-+Inode blocks per group:   2048
- Flex block group size:    16
- Mount count:              0
- Check interval:           15552000 (6 months)
- Reserved blocks uid:      0
- Reserved blocks gid:      0
- First inode:              11
--Inode size:	          128
-+Inode size:	          256
-+Required extra isize:     32
-+Desired extra isize:      32
- Journal inode:            8
- Default directory hash:   half_md4
- Journal backup:           inode blocks
- Directories:              2
-  Group  0: block bitmap at 9, inode bitmap at 25, inode table at 41
--           27631 free blocks, 32757 free inodes, 2 used directories
-+           26607 free blocks, 32757 free inodes, 2 used directories
- e2fsck -fn -N test_filesys $LOOP
- Pass 1: Checking inodes, blocks, and sizes
- Pass 2: Checking directory structure
- Pass 3: Checking directory connectivity
- Pass 4: Checking reference counts
- Pass 5: Checking group summary information
--test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
-+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
- Exit status is 0
- e2fsck -fn -N test_filesys $TMPFILE
- Pass 1: Checking inodes, blocks, and sizes
-@@ -57,5 +59,5 @@ Pass 2: Checking directory structure
- Pass 3: Checking directory connectivity
- Pass 4: Checking reference counts
- Pass 5: Checking group summary information
--test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
-+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
- Exit status is 0
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index a4f98246bb..29078f9dd3 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From f1e161a48f74b46ae3c99921971c4b5ae8d587c9 Mon Sep 17 00:00:00 2001
+From 22d7557905534d9e1b39f7d2a6d2036a40bf0c4e Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 41a4047622..902a369eb0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 550b5fbece84dde16ce9910c2cad390ea4a2f5d5 Mon Sep 17 00:00:00 2001
+From 5408b6463ee700a080a15102bccccdeb2615d734 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
similarity index 94%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index f42cefcaf9..16c183eed3 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -4,14 +4,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-tests-u_direct_io-expect-correct-expected-output.patch \
+           "
+SRC_URI:append:class-native = " \
+           file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
+           file://quiet-debugfs.patch \
            "
 
-SRC_URI:append:class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-                                file://quiet-debugfs.patch \
-"
-
-SRCREV = "849005eac51ea2097bd9e5f2b0adc16b53c5486d"
+SRCREV = "02540dedd3ddc52c6ae8aaa8a95ce75c3f8be1c0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.20.1


