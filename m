Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11693C6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:32 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.106.1675289789212767910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v3nRJ/Hl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id u5so13294109pfm.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNxRMGT0o7TWzH9AB5tO6r9EfVqY2ILfqacJ9bwLw0Q=;
        b=v3nRJ/HlNPLn8YOGOcDhMJSXTK5PHCtZFbzGuofug6Gnq1GRn7J/NzSU3umBn7n5GI
         hdcTTahbOICQ15Jfl2QQOozxZju0MzKhs4eeIt239X/iBx4D3rl1NEaV45K1WE9NCe7+
         IBmxEsl2TVVDQvAAOoIkGCS/5xbk3LUSP2Qpt04AZsym5BKzIGFjjODAG6CLa6SPuK3M
         lYbKqKSRqEsgrsuBAV7MMc47jkHb+lfsIwQGAqUWvsAzqKTMC2KfMfuH6L51d+4lPQwj
         sGSqjN3P3EcsOWh86L33VUPu4zpQHjUuiuKpZhiEpLYMHUC1ztXSu+4rxJf16BvS3dBo
         7Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNxRMGT0o7TWzH9AB5tO6r9EfVqY2ILfqacJ9bwLw0Q=;
        b=TPVBLACcANNAjA3f1KEABALXu7Grh1AK+SVWr0Zkv9eq3sOly4V4b3WBRVrLYsQ3fd
         Y58bSLXnPHEyrEcHRDuOfdK05d3+Sdqgov72wPF989kiLsw5VB4JauLkT+SdiqkhcJ5G
         QiFl9HMQ6F08B04GbT91AdH/cwDpsq7TCkDmfX0YfRl3i2Lbg334epm+KuZu1kSKsFfF
         AStPHtT3hXQRGhOa0/X+NYRCyPW0PqO3mOZ3GJ/VehFok9yz6r4a9dRha5Kl+UTqP22R
         Sfi/H6MvaqRALKr4yaGpzKvQBSAWCt2TRUm4srYiyHdQPdW31GXJcZIsaxjjhr5xS73u
         k98A==
X-Gm-Message-State: AO0yUKWl05rt5FK354n9ktd0AVjqVmfAXuHfSgYG67pyJ74G6w6L+S4D
	haBvta55d4v+o4r3pt2klCmJLzijkj/fadfG97k=
X-Google-Smtp-Source: AK7set9zKupey3vVzf0KX6fbKPvmlrmfQE8ygnwX+RQelrA0CsJ8pzWLltgAlQUy93tweWqoeaCKZA==
X-Received: by 2002:a62:e81a:0:b0:580:fb8e:3044 with SMTP id c26-20020a62e81a000000b00580fb8e3044mr3821844pfi.22.1675289788044;
        Wed, 01 Feb 2023 14:16:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] lttng-modules: Fix for 5.10.163 kernel version
Date: Wed,  1 Feb 2023 12:15:59 -1000
Message-Id: <72851563e22b4b4c548a610a7e9f68fd2450daaa.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176665

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4ad1f430abe1e7706b43b36405f036fa23a4e6fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ++++++++++++++++
 ...e-the-correct-print-format-v5.10.163.patch | 61 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.8.bb             |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
new file mode 100644
index 0000000000..bfc49294b0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
@@ -0,0 +1,52 @@
+From 4fd2615b87b3cac0fd5bdc5fc82db05f6fcfdecf Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 17 Jan 2023 12:16:04 -0500
+Subject: [PATCH] fix: jbd2 upper bound for v5.10.163
+
+Use the correct upper bound of 5,11,0.
+
+Change-Id: I435b44b940c7346ed8c3ef0d445365ed156702d0
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ include/instrumentation/events/jbd2.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/instrumentation/events/jbd2.h b/include/instrumentation/events/jbd2.h
+index f7993511..9b77ab92 100644
+--- a/include/instrumentation/events/jbd2.h
++++ b/include/instrumentation/events/jbd2.h
+@@ -28,7 +28,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
+-	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
+@@ -97,7 +97,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_drop_transaction,
+ #endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
+-	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
+@@ -140,7 +140,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
+-	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
+-- 
+2.35.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
new file mode 100644
index 0000000000..8067cffaab
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
@@ -0,0 +1,61 @@
+From dd7be14bd04c1de309ba267097b03a308da87dae Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 17 Jan 2023 11:03:12 -0500
+Subject: [PATCH] fix: jbd2: use the correct print format (v5.10.163)
+
+See upstream commit :
+
+  commit d87a7b4c77a997d5388566dd511ca8e6b8e8a0a8
+  Author: Bixuan Cui <cuibixuan@linux.alibaba.com>
+  Date:   Tue Oct 11 19:33:44 2022 +0800
+
+    jbd2: use the correct print format
+
+    The print format error was found when using ftrace event:
+        <...>-1406 [000] .... 23599442.895823: jbd2_end_commit: dev 252,8 transaction -1866216965 sync 0 head -1866217368
+        <...>-1406 [000] .... 23599442.896299: jbd2_start_commit: dev 252,8 transaction -1866216964 sync 0
+
+    Use the correct print format for transaction, head and tid.
+
+Change-Id: I7601f5cbb86495c2607be7b11e02724c90b3ebf9
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ include/instrumentation/events/jbd2.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/instrumentation/events/jbd2.h b/include/instrumentation/events/jbd2.h
+index d5d8ea0c..f7993511 100644
+--- a/include/instrumentation/events/jbd2.h
++++ b/include/instrumentation/events/jbd2.h
+@@ -28,6 +28,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
+@@ -96,6 +97,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_drop_transaction,
+ #endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
+@@ -138,6 +140,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 6,0,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
+ 	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
+-- 
+2.35.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
index 542f42ae19..3cfc1bc58e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
@@ -11,6 +11,8 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://fix-jbd2-use-the-correct-print-format-v5.10.163.patch \
+           file://fix-jbd2-upper-bound-for-v5.10.163.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


