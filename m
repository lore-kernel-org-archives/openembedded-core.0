Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D2BC61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.16754.1675547335084070219
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=11gUuJZV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id bd15so6016297pfb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJe03iYzufy6BIRB3fUD7P7uTXYpGbHUNekUa6RzXt0=;
        b=11gUuJZVZCLTI+FezpH3FkTZgQZCmWQkV4yloMlg58t/0+atHR77+HDXq6tG0soxmr
         2H1LQIlkVg6Zb//33M5LHk8LviVN2BWzyc917snQraQtMrCRBkjOjmbmiiOUOMl/Q5mZ
         s3GIbEEbHPDTsCAGY+EijKNyP89rJNbXkXhz3UhQ+jTa3dhzyycVMqhZ7iKyboW0pCQu
         fADhtgfG60/eID57Y1i9LmyNc035nv6W2DwAUdEnePlfa7YnGNQcusdftFN4fNLhbhTo
         Qau0bApxk58QLe3pEfHZSDBPrF1rAeOr76w+9IbWT9yUK8p/Dxrw2Qet+RK5dixRx6Ov
         brUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJe03iYzufy6BIRB3fUD7P7uTXYpGbHUNekUa6RzXt0=;
        b=IlidrYNy+pcu3smA6QgSY4iQnH2VXexoeDQxATwVYJDZss4dnwKKVg5hPvK1hVgSvv
         v1R0C9nuCElLiTlEkJGh4Bbtd9ru1Tii+/yki+siU83ebvSKVkO6jqkZLWYxMjvQFgEX
         FobW9pwp01Lu9GRCx2d5C5J9ezN04rNLnemxgtY93o9n0c+rbwITrMRb3IdzklFU2wkY
         hRDx1WoHRw8NYndWXtmhByT2HcctALsJKBF13j3XW+dE3hN9Y5J9ZvTuxzt5NlBm4Fnz
         pyW9KR6c0mqjBHFpSYo6yoZJlteoRB6wyw8kYRDRHlU6HCmgM4vAyIXye28MB2Xn2gSA
         YwnA==
X-Gm-Message-State: AO0yUKUMOU4XTgough02FOVr8yee7fFRlwx9DIwKAlm2tCZA3I3pI7/N
	n9f8xGGk2jSDwXQEf+aEUghlyyaQa4DFOYT/AXQ=
X-Google-Smtp-Source: AK7set+v0tt9JPueeagl33aBbCId+U3n1NGa/Osq5N7fhSijfSuwhgM/VOcD3JO3YnL7QS/XzuK3QQ==
X-Received: by 2002:a05:6a00:882:b0:593:96a2:d60a with SMTP id q2-20020a056a00088200b0059396a2d60amr19948705pfj.30.1675547338819;
        Sat, 04 Feb 2023 13:48:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] lttng-modules: fix build with 5.4.229 kernel
Date: Sat,  4 Feb 2023 11:48:32 -1000
Message-Id: <520d957e14be77f73c82a295f685d189381d8f72.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176774

Fixes:

In file included from TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/define_trace.h:87,
                 from TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../instrumentation/events/lttng-module/jbd2.h:183,
                 from TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/lttng-probe-jbd2.c:29:
TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/lttng-tracepoint-event-impl.h:130:6: error: conflicting types for 'trace_jbd2_run_stats'
  130 | void trace_##_name(_proto);
      |      ^~~~~~
TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/lttng-tracepoint-event-impl.h:42:2: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
   42 |  LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS(args))
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/lttng-tracepoint-event-impl.h:84:2: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
   84 |  LTTNG_TRACEPOINT_EVENT_MAP(name, name,    \
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../instrumentation/events/lttng-module/jbd2.h:107:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT'
  107 | LTTNG_TRACEPOINT_EVENT(jbd2_run_stats,
      | ^~~~~~~~~~~~~~~~~~~~~~
In file included from TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/trace/events/jbd2.h:9,
                 from TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/lttng-probe-jbd2.c:18:
TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/linux/tracepoint.h:243:21: note: previous definition of 'trace_jbd2_run_stats' was here
  243 |  static inline void trace_##name(proto)    \
      |                     ^~~~~~
TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/linux/tracepoint.h:406:2: note: in expansion of macro '__DECLARE_TRACE'
  406 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
      |  ^~~~~~~~~~~~~~~
TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/linux/tracepoint.h:542:2: note: in expansion of macro 'DECLARE_TRACE'
  542 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
      |  ^~~~~~~~~~~~~
TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/trace/events/jbd2.h:234:1: note: in expansion of macro 'TRACE_EVENT'
  234 | TRACE_EVENT(jbd2_run_stats,
      | ^~~~~~~~~~~
  CC [M]  TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/lttng-probe-ext4.o

Backport from upstream master branch fixes:

https://github.com/lttng/lttng-modules/commit/b28830a0dcdf95ec3e6b390b4d032667deaad0c0
https://github.com/lttng/lttng-modules/commit/4fd2615b87b3cac0fd5bdc5fc82db05f6fcfdecf
https://github.com/lttng/lttng-modules/commit/612c99eb24bf72f4d47d02025e92de8c35ece14e

Note that master branch upstream has restructured the location of header files, so the patches
do not apply cleanly.  This patch combines the changes in the above commits in the old header location.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ix-jbd2-use-the-correct-print-format.patch | 147 ++++++++++++++++++
 .../lttng/lttng-modules_2.11.9.bb             |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch
new file mode 100644
index 0000000000..b4939188cc
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch
@@ -0,0 +1,147 @@
+fix: jbd2: use the correct print format
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
+Upstream-status: Backport
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+Note: combines three upstream commits:
+https://github.com/lttng/lttng-modules/commit/b28830a0dcdf95ec3e6b390b4d032667deaad0c0
+https://github.com/lttng/lttng-modules/commit/4fd2615b87b3cac0fd5bdc5fc82db05f6fcfdecf
+https://github.com/lttng/lttng-modules/commit/612c99eb24bf72f4d47d02025e92de8c35ece14e
+
+diff --git a/instrumentation/events/lttng-module/jbd2.h b/instrumentation/events/lttng-module/jbd2.h
+--- a/instrumentation/events/lttng-module/jbd2.h
++++ b/instrumentation/events/lttng-module/jbd2.h
+@@ -29,6 +29,25 @@ LTTNG_TRACEPOINT_EVENT(jbd2_checkpoint,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,4,229, 5,5,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
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
+@@ -41,6 +60,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(jbd2_commit
+ 		ctf_integer(int, transaction, commit_transaction->t_tid)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_commit, jbd2_start_commit,
+ 
+@@ -79,6 +99,25 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(jbd2_com
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,4,229, 5,5,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
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
+@@ -91,6 +130,7 @@ LTTNG_TRACEPOINT_EVENT(jbd2_end_commit,
+ 		ctf_integer(int, head, journal->j_tail_sequence)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode_data,
+ 	TP_PROTO(struct inode *inode),
+@@ -103,7 +143,48 @@ LTTNG_TRACEPOINT_EVENT(jbd2_submit_inode
+ 	)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(2,6,32))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,2,0) \
++	|| LTTNG_KERNEL_RANGE(5,4,229, 5,5,0) \
++	|| LTTNG_KERNEL_RANGE(5,10,163, 5,11,0) \
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
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb
index d30478c1a1..8e9c44241b 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.9.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0017-fix-random-remove-unused-tracepoints-v5.18.patch \
            file://0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch \
            file://0019-fix-random-tracepoints-removed-in-stable-kernels.patch \
+           file://fix-jbd2-use-the-correct-print-format.patch \
            "
 
 SRC_URI[md5sum] = "cfb23ea6bdaf1ad40c7f9ac098b4016d"
-- 
2.25.1


