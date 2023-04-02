Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4368FC761AF
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.48836.1680453768303287475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RC2MjPdf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so30213246pjb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453767; x=1683045767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1Uzy6D8rTNuVpmksr7+Lr7nWWzmf8PYBvddCLsTE4s=;
        b=RC2MjPdfhU4XcNzz2A/WMrK/QltzCI5RsDlsirx5l8kKd3uF8QxFz1AiTdLw973lfx
         qad5uTzyN8JzX+nXSgwOhTU5I/8NcA4+WgpgmNrsFOWOwZ7OYfriUvnYRMq+IYiY0SH5
         Y9sYjEiOWjXcsSPz5QjqeFICb71coHd6whVIxiXs/vrK9SZL82/PFauvra5ZNAcr71ja
         EVihIXkM7HAOQdu3mdgAA8OJrcR/e4AdYQ2QenDS/IMXouZdC6rnFw52vGlbjZxvrFO2
         N0n6sWQuN3vZDH9G1hd+MRv7UhLa/+O1n1ny8Tv19z0cLZyj4emK+V46HgMTDz76XHUB
         /uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453767; x=1683045767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1Uzy6D8rTNuVpmksr7+Lr7nWWzmf8PYBvddCLsTE4s=;
        b=hvE9d7EDgT33ydewqrjV0RIO+j/ByR0VGLvYW8R2venb+wvOh8qHt83zlpk3YpP0WH
         6EkQ/fvNgvpvNWZ9hannBHADYtKlfKRbyIorrcE3f7MjmVsb1JUryDeiMGQUlGhMEc7Q
         FGGLjG7T6b+1hr5qNul9t9eD4qTGZjw9wFN7UyXCRNb96amLJf4eFqtsOxY/4rdhYeNo
         7gaxw7dREB31ryeTF7cfIL1GXlJ+B+VucLOCmELyZJPPTbvcq29WT7NQ+EIkeGigcWXz
         PDKV1cLH3YqILJebs8gHZGCC67sYBZ3PxGU02mWt7z7bv19VnJR5yisHAaUS2e7OquY0
         F25Q==
X-Gm-Message-State: AAQBX9eqsQsfqBJuX0+4Ihy3+C1obgyQTbUP9EgxlozwwiB6b0AN3EBh
	2LrpHoAJ1OGByn4D1a9y4UZPeKWk4Bhk9bVAQ3w=
X-Google-Smtp-Source: AKy350bQI1+RGEiuYyJ7W8Rv17vGW52eyXnKrTFEEzS6zgd4+Ok+3Q8HFNgyqjOoSZNMHAhtMFvmfg==
X-Received: by 2002:a17:903:4306:b0:1a1:98a9:4069 with SMTP id jz6-20020a170903430600b001a198a94069mr27754410plb.9.1680453767312;
        Sun, 02 Apr 2023 09:42:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/21] lttng-modules: update to v2.13.9
Date: Sun,  2 Apr 2023 06:42:07 -1000
Message-Id: <8864e50267327b474806de8b12ec60137a3cf17b.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179593

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping lttng-modules to version v2.13.9-4-g12f43cab, which comprises the following commits:

    da1f5a26 Version 2.13.9
    dc2d1294 fix: jbd2: use the correct print format (v5.4.229)
    d04c1211 fix: jbd2 upper bound for v5.10.163
    4b8864fc fix: jbd2: use the correct print format (v5.10.163)
    69d3aa79 fix: btrfs: move accessor helpers into accessors.h (v6.2)

We drop our previously backported commits as well, since they are part
of the release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79d8e93adde07ff3a4a239d66649ee566a2437d6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ccessor-helpers-into-accessors.h-v6..patch | 45 --------------
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ----------------
 ...e-the-correct-print-format-v5.10.163.patch | 61 -------------------
 ...ules_2.13.8.bb => lttng-modules_2.13.9.bb} |  5 +-
 4 files changed, 1 insertion(+), 162 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.8.bb => lttng-modules_2.13.9.bb} (83%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
deleted file mode 100644
index 26ae605b31..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 69d3aa79a641f539cfd5c11b46b2dd9b4df9b0f0 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 16 Jan 2023 15:01:51 -0500
-Subject: [PATCH] fix: btrfs: move accessor helpers into accessors.h (v6.2)
-
-See upstream commit :
-
-  commit 07e81dc94474eb62705c6f96d9ab1a5a797b8703
-  Author: Josef Bacik <josef@toxicpanda.com>
-  Date:   Wed Oct 19 10:51:00 2022 -0400
-
-    btrfs: move accessor helpers into accessors.h
-
-    This is a large patch, but because they're all macros it's impossible to
-    split up.  Simply copy all of the item accessors in ctree.h and paste
-    them in accessors.h, and then update any files to include the header so
-    everything compiles.
-
-Upstream-Status: Backport
-
-Change-Id: I1f0876dd8b7a8687f6802b60c3e3baabd017cc52
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 785f16ac..01157107 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -9,6 +9,10 @@
- #include <linux/writeback.h>
- #include <lttng/kernel-version.h>
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0))
-+#include <../fs/btrfs/accessors.h>
-+#endif
-+
- #ifndef _TRACE_BTRFS_DEF_
- #define _TRACE_BTRFS_DEF_
- struct btrfs_root;
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
deleted file mode 100644
index bfc49294b0..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 4fd2615b87b3cac0fd5bdc5fc82db05f6fcfdecf Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 17 Jan 2023 12:16:04 -0500
-Subject: [PATCH] fix: jbd2 upper bound for v5.10.163
-
-Use the correct upper bound of 5,11,0.
-
-Change-Id: I435b44b940c7346ed8c3ef0d445365ed156702d0
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- include/instrumentation/events/jbd2.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/instrumentation/events/jbd2.h b/include/instrumentation/events/jbd2.h
-index f7993511..9b77ab92 100644
---- a/include/instrumentation/events/jbd2.h
-+++ b/include/instrumentation/events/jbd2.h
-@@ -28,7 +28,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
--	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -97,7 +97,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_drop_transaction,
- #endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
--	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -140,7 +140,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
--	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
--- 
-2.35.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
deleted file mode 100644
index 8067cffaab..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From dd7be14bd04c1de309ba267097b03a308da87dae Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 17 Jan 2023 11:03:12 -0500
-Subject: [PATCH] fix: jbd2: use the correct print format (v5.10.163)
-
-See upstream commit :
-
-  commit d87a7b4c77a997d5388566dd511ca8e6b8e8a0a8
-  Author: Bixuan Cui <cuibixuan@linux.alibaba.com>
-  Date:   Tue Oct 11 19:33:44 2022 +0800
-
-    jbd2: use the correct print format
-
-    The print format error was found when using ftrace event:
-        <...>-1406 [000] .... 23599442.895823: jbd2_end_commit: dev 252,8 transaction -1866216965 sync 0 head -1866217368
-        <...>-1406 [000] .... 23599442.896299: jbd2_start_commit: dev 252,8 transaction -1866216964 sync 0
-
-    Use the correct print format for transaction, head and tid.
-
-Change-Id: I7601f5cbb86495c2607be7b11e02724c90b3ebf9
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- include/instrumentation/events/jbd2.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/instrumentation/events/jbd2.h b/include/instrumentation/events/jbd2.h
-index d5d8ea0c..f7993511 100644
---- a/include/instrumentation/events/jbd2.h
-+++ b/include/instrumentation/events/jbd2.h
-@@ -28,6 +28,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -96,6 +97,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_drop_transaction,
- #endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
-@@ -138,6 +140,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
-+	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
- 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
- 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
--- 
-2.35.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
similarity index 83%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
index c04796be16..a08386b053 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
@@ -11,15 +11,12 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://fix-jbd2-use-the-correct-print-format-v5.10.163.patch \
-           file://fix-jbd2-upper-bound-for-v5.10.163.patch \
-           file://0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "f525d3d48ea3a475cb535339c201666d0e4c75ec8c46d29837bcf381ea02cb19"
+SRC_URI[sha256sum] = "bf808b113544287cfe837a6382887fa66354ef5cc8216460cebbef3d27dc3581"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.34.1


