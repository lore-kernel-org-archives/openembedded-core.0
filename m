Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CF7C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:35:26 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.87273.1674768925100370726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c3vncgSl;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id w15so2451316qvs.11
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWHKPZLiFesUAHZeB7+lVf7PPeqLEL0hwL92mHqVlZ4=;
        b=c3vncgSlYGSziTsnE7pnB3C/+nWXAtaVy202K+yQ23Mf2ooBbzmKqhYjdb/jtr0Ofa
         cayDEI77Mf8/PIDQIEtMblzVOVj6tODk3OjnH867TqOLgGOOLg8cZnO27BOIJvmDGJij
         Hnb62pIlqvqAsPCEs34B8vAdCFRS5HpXL4yWgXDx2FTcitLtK1vASsn0P24DCcGCxVi8
         OEtICRCOPrv/IlSqn89XFZIL1g5CpWFpTHQVVIrkJSRaurWPsQp0logYISn5P/8D2ISx
         v4SAvboNHioL5CM86jbOksmMx4yw/aIOTW18ShJ5DcfwJ4EdCV8Ea1pMkM+Xx6QDAi+u
         v2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWHKPZLiFesUAHZeB7+lVf7PPeqLEL0hwL92mHqVlZ4=;
        b=yhQxA0X8MlLC6VCWqAteBuqwipkgIu9bKUKjSxLuRVonqgx+9qR671GCc3EdJ7+jU1
         xFI/bf9PUgi79yMmMPc7LRJ8Wuv7YCMK1AqyxMNqfRv1H5SL7aKsQeh3dSlPSUYKUINo
         mRYgqm7HzLVIgZFqGcPps/yIU+xrRtg+y9hOf3X+Jpw2NhYsP20aq8WD6jBjHHua+syT
         p6PPwwxqocyMKR2P0xtpjFjQ1HPLy73vCxTDPKm9fwt834pbJmrju96szhzDrzL9DNYk
         ULAnoZjMOSAxBm6a0pSsezHODlls1Jflpsf9Y4nGk22Ktt+q6I5ZApuUluy9T8lOF432
         aFcg==
X-Gm-Message-State: AFqh2koXkP0RStRpiyFj/6J41soIfdNu/OOVme07PtgwOVfGlGnrWIwt
	XO9EO4ZkKmx1TTtzc/TpFrlgYboKhU0=
X-Google-Smtp-Source: AMrXdXu/o2YiG9SlsqOoNikWheGJ9aQ8LRJabfnPLV879oO9WKPqPd22D15xBLm0vojmsjY0JywOvw==
X-Received: by 2002:a05:6214:2f01:b0:4c6:e395:b702 with SMTP id od1-20020a0562142f0100b004c6e395b702mr63624612qvb.34.1674768923879;
        Thu, 26 Jan 2023 13:35:23 -0800 (PST)
Received: from mvwork.mvista.com (99-157-111-72.lightspeed.tukrga.sbcglobal.net. [99.157.111.72])
        by smtp.gmail.com with ESMTPSA id q1-20020ae9e401000000b006fc2f74ad12sm1643553qkc.92.2023.01.26.13.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:35:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] lttng-modules: Fix for 5.10.163 kernel version
Date: Thu, 26 Jan 2023 16:33:22 -0500
Message-Id: <20230126213322.2175754-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 21:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176427

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
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
2.37.3


