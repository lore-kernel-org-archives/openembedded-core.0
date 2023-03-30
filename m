Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03937C7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.38934.1680210861955668362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SlU9FBZS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id x15so18507795pjk.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210861; x=1682802861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1Uzy6D8rTNuVpmksr7+Lr7nWWzmf8PYBvddCLsTE4s=;
        b=SlU9FBZSJHxf8wLAobjKWhIVEkzk35oudh2/70grUe596FsWqFT05eS/B2FZNLh4Nd
         ooY4h1/PnW1Pt2GJ2GeOzs/t9SgFKpbMOX41uSYU8JS2hezq/ES0dCBtxZ5g5Jc4t0+k
         kuG0htPV/nHtoTb0vaQqtS+g9BlUzmTwO3ANfZrjOcw/Do+GW/u32AVYcdpyyFLCUoQB
         cbKskkPuSTT/nNUEklluV2MK4t26PG6eDU/9I7O1CriRK9sF+G6kqvF8y3X5asS3VHCZ
         uBMUfq74M7skE43jlbLLX8NLV+vREsiBH+2hdatT+6qzTQuRx048H34BG0StPm7LLIZR
         BOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210861; x=1682802861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1Uzy6D8rTNuVpmksr7+Lr7nWWzmf8PYBvddCLsTE4s=;
        b=tF8bmCaMMfNzoNA/3qmUc/dJY0Gb3s4I16nx0u0CfEOztzfNhzsOY9glvltWNdb3wZ
         92/3PNoRMyAcA6nnpTTKrdRH9/bpRnWJzSXwimhAeqJy0jhALPYRcicjuJVyw53UYVEI
         XB9qkNr2UJ8FfbgFvG/bgwswbI8MNlWxV73vjNI2c5uk8YKFM7F4urVhmgQGe9ngPCGl
         JKur50kIsl0A1HiCnS1I34vun4J2miBug2duq8/kBYO992hGfQgpkYnoGyRLweOwONfL
         EBPk+kn1X+taTAIkpwOgE7bO+cYrl93xEWN40u92ZqItdozWxz3DJ73KtiXG7HiPCKkt
         kq/Q==
X-Gm-Message-State: AAQBX9eZlUO18qA0KI3mVwXVqepYEx8mtSNpALyHrqPMG3y87Aq62gmU
	H1xq8LdSBz+wd6vpKKaAOiQx6hmndbFeUG8d69w=
X-Google-Smtp-Source: AKy350bGJkLNuIQLNyUhkwJfooqEiQ9kh2pzR2fbqXl7JRucQTa8etwOsa+fpMe1u42DEGD1O/UWKA==
X-Received: by 2002:a17:90b:4d11:b0:23f:e32:7e62 with SMTP id mw17-20020a17090b4d1100b0023f0e327e62mr29542665pjb.12.1680210860875;
        Thu, 30 Mar 2023 14:14:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/14] lttng-modules: update to v2.13.9
Date: Thu, 30 Mar 2023 11:13:49 -1000
Message-Id: <28c844143b6f32313f15a2f1bb31dda4fd680714.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179366

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


