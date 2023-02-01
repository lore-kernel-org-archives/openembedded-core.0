Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B5AC636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:22 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.24353.1675260853437997603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0vLGHmxV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id cr11so11007785pfb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNxRMGT0o7TWzH9AB5tO6r9EfVqY2ILfqacJ9bwLw0Q=;
        b=0vLGHmxVOPD8Wrakge2y2disGjBhLSsjWNvjXP40UhWuW8j0VRS23LP+b3eS0q7Ub1
         tIqPalRglb3W7je2WEG6JY3GQXQF/ERjY0Q7pl6l4Brw4kVVP/DlLN9dFOiKeilmgrxR
         PRf6Eh78XlZxbDp5advRG0P0YCVbm13X5w8Ppzje1dAtxXCXctkPuKiPrxYL7kZldkcm
         cObCgIvcitC3UVwMzHDGqeAtdmBXRBaNAyvB2Vlygu8maMTe9amjqNBMU0mEA55eFpax
         q+woySBzCDvkKhHwJ1e6maXJwxXnG/YTPQaRoXSofVva/FWH7eZ/1Vlqb9BYb83vwEQN
         cqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNxRMGT0o7TWzH9AB5tO6r9EfVqY2ILfqacJ9bwLw0Q=;
        b=f/U6+a0zR7RNpzus6IvBJoAkTN9DUsS3u711WdpKmimJdzqOxUWMWUQ/Co7dNhc4tD
         76W9jAiDD8xAcOh4q2S2ESlDNnbDrGHIQJWCog7YSI6ULklZM5o2lIbHgcD7/CaCMjtL
         DiVFsd9twYvQJEDFIDLOvq/0usXHoGGm0ZJbthntgqdCJtjMNE3JsdMFXvxWCR4yAMAZ
         jzsATr1hJgf2fDXTf7CkbNOc5IeaGenaOjmOQ4wYZcZcXIpeIdI2sPrL0gjHOt1v5Bkf
         2sSx9FuCVUxz6VUowmlLiCQRtQY01PZeGZhCNAGMvELpkbMV8hJzU9NW18MtkImBiXnv
         NFJw==
X-Gm-Message-State: AO0yUKUEcADVJiKWIJcEKWu0CMNnFkeNSIJG9f2q/NZsY/FySKHllRwQ
	s7R9k0FZzhJJ8G+PVPvbkMxOE1limSfeIrJtXLs=
X-Google-Smtp-Source: AK7set8kW7Q2wlUiSTB+/ZJT60y0c5ydX4Nc4qeBfqD3MR52xzeW8++WadB4Tzz5WQGihYTFXOagxg==
X-Received: by 2002:a62:f24e:0:b0:593:a33f:3acf with SMTP id y14-20020a62f24e000000b00593a33f3acfmr2242914pfl.1.1675260852366;
        Wed, 01 Feb 2023 06:14:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/17] lttng-modules: Fix for 5.10.163 kernel version
Date: Wed,  1 Feb 2023 04:13:43 -1000
Message-Id: <cdbe68d4a9b29a1b2073587c24dd22a82e7c5189.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176540

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


