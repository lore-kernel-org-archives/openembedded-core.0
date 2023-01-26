Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A583C61DA2
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 15:02:24 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.75508.1674745337045640845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 07:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8KcoFLk;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-142b72a728fso2646872fac.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 07:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Oo6btHIrc0n3GGplkS7kIn7ovMAggSgHg37LLI/Bs=;
        b=V8KcoFLkmBPBPLaYsedojdmgFgCAASwJBiy64rmhbxEt2OtHItL7DUIintmPJw4d7I
         yF+CWoJS8zwl/43KmpNcfalOVTcBuX0TEbBEhhKURtJQrCwXrTYWAMmhWmIrIw3k+GPJ
         3YXr4E/dDSVeiZ1lC/4357LQWQktnNeM8WR620EJqMy7dI/qEiBPBr4NpVoJ+QzEpo8r
         uKA/1TDyJSY4p9QYuSmil7iUMqXSYmcutNT53WUOkchk3sBfWnshYE1GWpX4fNrSo5ca
         CR3JthlgzorM2wJAe+oj/3zzWi1/WostMSuqU51r+674j4NvvieNrwsqBCB1wdLWf1iw
         JK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Oo6btHIrc0n3GGplkS7kIn7ovMAggSgHg37LLI/Bs=;
        b=JnOIw98o0L7EcXDBkybDCmPlxpeB0m4vHV4SQZjWRqTjCmbp2Yruh+Gn1UB4tlRdEE
         6tF2LsVEdLlJfDPrY+G+Vej73z201hvYgbvgWiasuRy6OufW0jNcvDOnYCRpNQ9ythL3
         BNvWBf8kfG7bcvpGaEvL8DIykjDkB0aW8HJPYJvnLf7ln2dQcbAOu1MY+/97xx++e0aw
         LePVc2Y9rtrsS8GPnaDxV5O7uLUL2Do0Aqia+bJNchjer9GWZE3v8u01D/En+FoQTNLH
         tF3Q7YNvuILSvYkw4DolqHB+WTjly64l5PP8HfNvyTZr6Wo06tAXhkwjyb4NzwUA5NuR
         62Mw==
X-Gm-Message-State: AO0yUKXziDx7ZZwDoFtjPw+Nl7cwWOCIwgUsoSraBLOFKB1towHsOVVY
	5e6WsI2CjzA8ZzDrcZ/IIx/Q+KeHLZQ=
X-Google-Smtp-Source: AK7set/cPJyF27hO2tMK7SvtR9I+l88k0E/DHSTpuDLkqJnEb2lkZQIS+aMbfelWRPLcgP8DbQOYkA==
X-Received: by 2002:a05:6870:3488:b0:163:1bbb:4b2b with SMTP id n8-20020a056870348800b001631bbb4b2bmr1211027oah.23.1674745335894;
        Thu, 26 Jan 2023 07:02:15 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:75b5:cc59:51f7:fd2f])
        by smtp.gmail.com with ESMTPSA id q1-20020ae9e401000000b006fc2f74ad12sm1024773qkc.92.2023.01.26.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:02:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [langdale][kirkstone]PATCH 1/1] lttng-modules: Fix for 5.10.163 kernel version
Date: Thu, 26 Jan 2023 10:02:13 -0500
Message-Id: <20230126150213.335693-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126150213.335693-1-akuster808@gmail.com>
References: <20230126150213.335693-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 15:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176403

From: Armin Kuster <akuster@mvista.com>

Fixes building after updating to 5.10.163 kernel

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  |  52 ++++++
 ...e-the-correct-print-format-v5.10.163.patch |  61 +++++++
 ...ix-jbd2-use-the-correct-print-format.patch | 153 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.7.bb             |   3 +
 4 files changed, 269 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch

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
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch
new file mode 100644
index 0000000000..8d210485af
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch
@@ -0,0 +1,153 @@
+From b28830a0dcdf95ec3e6b390b4d032667deaad0c0 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 12 Jan 2023 13:52:22 -0500
+Subject: [PATCH] fix: jbd2: use the correct print format
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
+Change-Id: Ic053f0e0c1e24ebc75bae51d07696aaa5e1c0094
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ include/instrumentation/events/jbd2.h | 77 +++++++++++++++++++++++++++
+ 1 file changed, 77 insertions(+)
+
+Index: lttng-modules-2.13.7/include/instrumentation/events/jbd2.h
+===================================================================
+--- lttng-modules-2.13.7.orig/include/instrumentation/events/jbd2.h
++++ lttng-modules-2.13.7/include/instrumentation/events/jbd2.h
+@@ -27,6 +27,23 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
++	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
++	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(jbd2_commit,
++
++	TP_PROTO(journal_t *journal, transaction_t *commit_transaction),
++
++	TP_ARGS(journal, commit_transaction),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, journal->j_fs_dev->bd_dev)
++		ctf_integer(char, sync_commit, commit_transaction->t_synchronous_commit)
++		ctf_integer(tid_t, transaction, commit_transaction->t_tid)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(jbd2_commit,
+ 
+ 	TP_PROTO(journal_t *journal, transaction_t *commit_transaction),
+@@ -39,6 +56,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(jbd2_commit
+ 		ctf_integer(int, transaction, commit_transaction->t_tid)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_start_commit,
+ 
+@@ -77,6 +95,23 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_com
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
++	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
++	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
++LTTNG_TRACEPOINT_EVENT(jbd2_end_commit,
++	TP_PROTO(journal_t *journal, transaction_t *commit_transaction),
++
++	TP_ARGS(journal, commit_transaction),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, journal->j_fs_dev->bd_dev)
++		ctf_integer(char, sync_commit, commit_transaction->t_synchronous_commit)
++		ctf_integer(tid_t, transaction, commit_transaction->t_tid)
++		ctf_integer(tid_t, head, journal->j_tail_sequence)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(jbd2_end_commit,
+ 	TP_PROTO(journal_t *journal, transaction_t *commit_transaction),
+ 
+@@ -89,6 +124,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_end_commit,
+ 		ctf_integer(int, head, journal->j_tail_sequence)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
+ 	TP_PROTO(struct inode *inode),
+@@ -101,6 +137,46 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,15,87, 5,16,0) \
++	|| LTTNG_KERNEL_RANGE(6,0,18, 6,1,0) \
++	|| LTTNG_KERNEL_RANGE(6,1,4, 6,2,0))
++LTTNG_TRACEPOINT_EVENT(jbd2_run_stats,
++	TP_PROTO(dev_t dev, tid_t tid,
++		 struct transaction_run_stats_s *stats),
++
++	TP_ARGS(dev, tid, stats),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, dev)
++		ctf_integer(tid_t, tid, tid)
++		ctf_integer(unsigned long, wait, stats->rs_wait)
++		ctf_integer(unsigned long, running, stats->rs_running)
++		ctf_integer(unsigned long, locked, stats->rs_locked)
++		ctf_integer(unsigned long, flushing, stats->rs_flushing)
++		ctf_integer(unsigned long, logging, stats->rs_logging)
++		ctf_integer(__u32, handle_count, stats->rs_handle_count)
++		ctf_integer(__u32, blocks, stats->rs_blocks)
++		ctf_integer(__u32, blocks_logged, stats->rs_blocks_logged)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint_stats,
++	TP_PROTO(dev_t dev, tid_t tid,
++		 struct transaction_chp_stats_s *stats),
++
++	TP_ARGS(dev, tid, stats),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, dev)
++		ctf_integer(tid_t, tid, tid)
++		ctf_integer(unsigned long, chp_time, stats->cs_chp_time)
++		ctf_integer(__u32, forced_to_close, stats->cs_forced_to_close)
++		ctf_integer(__u32, written, stats->cs_written)
++		ctf_integer(__u32, dropped, stats->cs_dropped)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(jbd2_run_stats,
+ 	TP_PROTO(dev_t dev, unsigned long tid,
+ 		 struct transaction_run_stats_s *stats),
+@@ -136,6 +212,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint_s
+ 		ctf_integer(__u32, dropped, stats->cs_dropped)
+ 	)
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,4,0))
+ LTTNG_TRACEPOINT_EVENT(jbd2_update_log_tail,
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
index 49c584dff4..d3c6a9a1ad 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
@@ -11,6 +11,9 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://fix-jbd2-use-the-correct-print-format.patch \
+           file://fix-jbd2-use-the-correct-print-format-v5.10.163.patch \
+           file://fix-jbd2-upper-bound-for-v5.10.163.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


