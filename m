Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.1899.1607974838153689781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SqSyciNi;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id p12so8356880qvj.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 11:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ylG+pEkZSBl2WAmJ38DgxtOOe7epf86LXu808cuYIJs=;
        b=SqSyciNi1CkBdY4Kq6JqmScN9Ib5+Xh2MlFLiLmm5gOrHy22dXEbvlUMNSzBIEJeYU
         b4UREIS4fZSIjZxUL9zKT0TQ/W2+VAY0I+mIq7j79kL+X8EVMyMcb2ky7N4OOaA3yNUK
         JnE3rlS16p27OCv1tJrp64HJ/Xs+VqP8Tfpp5Vdrjl/xXRKg21lVdjnD5135zLQsS+dt
         tcjasmCNL1iTolXnTuFptduoORcKKXt0/I7uvJtQ5PmQXVCWc+NW0SkkXeq7EGhH4RsZ
         4Gm5h2R8krQB6Q9IE/hDWPhjYphBIVkj8qrRdIdVoVO5inxEah8R3oviWg9O1Zns9d8n
         vyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ylG+pEkZSBl2WAmJ38DgxtOOe7epf86LXu808cuYIJs=;
        b=ebTQqfYntYUhxrat5YnLkWX8r9HTZqJyVQ6ojnnA19VsyLGEd+8r5m7isWsXTbDO7X
         3eVOgeZM3wOtopzzkUfeNS5gHODTHkJ+/SYhi0Xh/fsgitn3+zrLEeEkOlTcwRAoggmG
         s4PbtdG+c7NW7cZvuMkXDRphWERD/qCQErLwbqxxa3JS/H515tt4gNOuO+e2ISZFNVLZ
         p6YO2lZTOruj5/IMbg54xZinElyrMCR6YQSKmKZw208gmt4as1z3PznzghGWqjXhYztn
         vpMPdAMrbQddPAdWK8u3jTlsBVLKqSOSVBen1CUCq6kf9S2ZJtUDlmjB8gqvmOv4V/nR
         ymqw==
X-Gm-Message-State: AOAM5318qrszOyxaVRnhw2aU8kSFTurkgLaQtocPPDsJ0CBbEfHG9i5T
	loVNSwZV+44/dIuUNUSbq7NEKDIb7Fug7Q==
X-Google-Smtp-Source: ABdhPJzajyHja1RIlt4iLOyZc/Vu075lq6Jyu16PIWqiVRiGn3cHCjUBI4RX3psb4WubUDgquJcomQ==
X-Received: by 2002:a0c:f4cd:: with SMTP id o13mr33407378qvm.31.1607974836360;
        Mon, 14 Dec 2020 11:40:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.cable.comcast.com ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id r25sm425056qtu.88.2020.12.14.11.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 11:40:35 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] lttng-modules: Fix build with 5.10+ kernel
Date: Mon, 14 Dec 2020 11:40:32 -0800
Message-Id: <20201214194032.452603-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport build relevant patches from upstream to fix build issues

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  87 +++++++
 ...racepoint-Optimize-using-static_call.patch | 215 ++++++++++++++++++
 ...ext4-fast-commit-recovery-path-v5.10.patch |  99 ++++++++
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 +++++++++++++++
 .../lttng/lttng-modules_2.12.3.bb             |   4 +
 5 files changed, 584 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-tracepoint-Optimize-using-static_call.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-ext4-fast-commit-recovery-path-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
new file mode 100644
index 0000000000..22ebe0ceb0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
@@ -0,0 +1,87 @@
+From e9db0eec9d10c91ce082ab0cf7964c7af9f189ce Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 26 Oct 2020 13:41:02 -0400
+Subject: [PATCH 1/3] fix: objtool: Rename frame.h -> objtool.h (v5.10)
+
+See upstream commit :
+
+  commit 00089c048eb4a8250325efb32a2724fd0da68cce
+  Author: Julien Thierry <jthierry@redhat.com>
+  Date:   Fri Sep 4 16:30:25 2020 +0100
+
+    objtool: Rename frame.h -> objtool.h
+
+    Header frame.h is getting more code annotations to help objtool analyze
+    object files.
+
+    Rename the file to objtool.h.
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/d90539367a52330d331698eb2cca569c3782c863]
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ic2283161bebcbf1e33b72805eb4d2628f4ae3e89
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lttng-filter-interpreter.c     |  2 +-
+ wrapper/{frame.h => objtool.h} | 17 +++++++++++------
+ 2 files changed, 12 insertions(+), 7 deletions(-)
+ rename wrapper/{frame.h => objtool.h} (59%)
+
+diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
+index 21169f0..5d57243 100644
+--- a/lttng-filter-interpreter.c
++++ b/lttng-filter-interpreter.c
+@@ -8,7 +8,7 @@
+  */
+ 
+ #include <wrapper/uaccess.h>
+-#include <wrapper/frame.h>
++#include <wrapper/objtool.h>
+ #include <wrapper/types.h>
+ #include <linux/swab.h>
+ 
+diff --git a/wrapper/frame.h b/wrapper/objtool.h
+similarity index 59%
+rename from wrapper/frame.h
+rename to wrapper/objtool.h
+index 6e6dc81..f00b688 100644
+--- a/wrapper/frame.h
++++ b/wrapper/objtool.h
+@@ -1,18 +1,23 @@
+ /* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
+  *
+- * wrapper/frame.h
++ * wrapper/objtool.h
+  *
+  * Copyright (C) 2016 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+  */
+ 
+-#ifndef _LTTNG_WRAPPER_FRAME_H
+-#define _LTTNG_WRAPPER_FRAME_H
++#ifndef _LTTNG_WRAPPER_OBJTOOL_H
++#define _LTTNG_WRAPPER_OBJTOOL_H
+ 
+ #include <linux/version.h>
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+-
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++#include <linux/objtool.h>
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+ #include <linux/frame.h>
++#endif
++
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+ 
+ #define LTTNG_STACK_FRAME_NON_STANDARD(func) \
+ 	STACK_FRAME_NON_STANDARD(func)
+@@ -23,4 +28,4 @@
+ 
+ #endif
+ 
+-#endif /* _LTTNG_WRAPPER_FRAME_H */
++#endif /* _LTTNG_WRAPPER_OBJTOOL_H */
+-- 
+2.29.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-tracepoint-Optimize-using-static_call.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-tracepoint-Optimize-using-static_call.patch
new file mode 100644
index 0000000000..fa6dedf67c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-tracepoint-Optimize-using-static_call.patch
@@ -0,0 +1,215 @@
+From 5c88bdd47f745b81acb03c8470a8926b528a4a69 Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
+Date: Mon, 14 Dec 2020 11:07:26 -0800
+Subject: [PATCH] tracepoint: Optimize using static_call()
+
+Currently the tracepoint site will iterate a vector and issue indirect
+calls to however many handlers are registered (ie. the vector is
+long).
+
+Using static_call() it is possible to optimize this for the common
+case of only having a single handler registered. In this case the
+static_call() can directly call this handler. Otherwise, if the vector
+is longer than 1, call a function that iterates the whole vector like
+the current code.
+
+Upstream-Status: Backport[https://github.com/lttng/lttng-modules/commit/0116245fd67c8cf8e63a63e6c964577f0d734e36]
+
+Change-Id: I739dd84d62cc1a821b8bd8acff74fa29aa25d22f
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lttng-statedump-impl.c    | 106 ++++++++++++++++++++++++++++++++------
+ probes/lttng.c            |   7 ++-
+ tests/probes/lttng-test.c |   7 ++-
+ wrapper/tracepoint.h      |   8 +++
+ 4 files changed, 110 insertions(+), 18 deletions(-)
+
+diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
+index a6fa71a..3aef1aa 100644
+--- a/lttng-statedump-impl.c
++++ b/lttng-statedump-impl.c
+@@ -55,26 +55,102 @@
+ #define LTTNG_INSTRUMENTATION
+ #include <instrumentation/events/lttng-module/lttng-statedump.h>
+ 
+-DEFINE_TRACE(lttng_statedump_block_device);
+-DEFINE_TRACE(lttng_statedump_end);
+-DEFINE_TRACE(lttng_statedump_interrupt);
+-DEFINE_TRACE(lttng_statedump_file_descriptor);
+-DEFINE_TRACE(lttng_statedump_start);
+-DEFINE_TRACE(lttng_statedump_process_state);
+-DEFINE_TRACE(lttng_statedump_process_pid_ns);
++LTTNG_DEFINE_TRACE(lttng_statedump_block_device,
++	TP_PROTO(struct lttng_session *session,
++		dev_t dev, const char *diskname),
++	TP_ARGS(session, dev, diskname));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_end,
++	TP_PROTO(struct lttng_session *session),
++	TP_ARGS(session));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_interrupt,
++	TP_PROTO(struct lttng_session *session,
++		unsigned int irq, const char *chip_name,
++		struct irqaction *action),
++	TP_ARGS(session, irq, chip_name, action));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_file_descriptor,
++	TP_PROTO(struct lttng_session *session,
++		struct files_struct *files,
++		int fd, const char *filename,
++		unsigned int flags, fmode_t fmode),
++	TP_ARGS(session, files, fd, filename, flags, fmode));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_start,
++	TP_PROTO(struct lttng_session *session),
++	TP_ARGS(session));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_state,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		int type, int mode, int submode, int status,
++		struct files_struct *files),
++	TP_ARGS(session, p, type, mode, submode, status, files));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_pid_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct pid_namespace *pid_ns),
++	TP_ARGS(session, p, pid_ns));
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+-DEFINE_TRACE(lttng_statedump_process_cgroup_ns);
++LTTNG_DEFINE_TRACE(lttng_statedump_process_cgroup_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct cgroup_namespace *cgroup_ns),
++	TP_ARGS(session, p, cgroup_ns));
+ #endif
+-DEFINE_TRACE(lttng_statedump_process_ipc_ns);
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_ipc_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct ipc_namespace *ipc_ns),
++	TP_ARGS(session, p, ipc_ns));
++
+ #ifndef LTTNG_MNT_NS_MISSING_HEADER
+-DEFINE_TRACE(lttng_statedump_process_mnt_ns);
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_mnt_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct mnt_namespace *mnt_ns),
++	TP_ARGS(session, p, mnt_ns));
++
+ #endif
+-DEFINE_TRACE(lttng_statedump_process_net_ns);
+-DEFINE_TRACE(lttng_statedump_process_user_ns);
+-DEFINE_TRACE(lttng_statedump_process_uts_ns);
+-DEFINE_TRACE(lttng_statedump_network_interface);
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_net_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct net *net_ns),
++	TP_ARGS(session, p, net_ns));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_user_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct user_namespace *user_ns),
++	TP_ARGS(session, p, user_ns));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_uts_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct uts_namespace *uts_ns),
++	TP_ARGS(session, p, uts_ns));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_time_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct time_namespace *time_ns),
++	TP_ARGS(session, p, time_ns));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_network_interface,
++	TP_PROTO(struct lttng_session *session,
++		struct net_device *dev, struct in_ifaddr *ifa),
++	TP_ARGS(session, dev, ifa));
++
+ #ifdef LTTNG_HAVE_STATEDUMP_CPU_TOPOLOGY
+-DEFINE_TRACE(lttng_statedump_cpu_topology);
++LTTNG_DEFINE_TRACE(lttng_statedump_cpu_topology,
++	TP_PROTO(struct lttng_session *session, struct cpuinfo_x86 *c),
++	TP_ARGS(session, c));
+ #endif
+ 
+ struct lttng_fd_ctx {
+diff --git a/probes/lttng.c b/probes/lttng.c
+index 05bc138..7ddaa69 100644
+--- a/probes/lttng.c
++++ b/probes/lttng.c
+@@ -8,7 +8,7 @@
+  */
+ 
+ #include <linux/module.h>
+-#include <linux/tracepoint.h>
++#include <wrapper/tracepoint.h>
+ #include <linux/uaccess.h>
+ #include <linux/gfp.h>
+ #include <linux/fs.h>
+@@ -32,7 +32,10 @@
+ #define LTTNG_LOGGER_COUNT_MAX	1024
+ #define LTTNG_LOGGER_FILE	"lttng-logger"
+ 
+-DEFINE_TRACE(lttng_logger);
++LTTNG_DEFINE_TRACE(lttng_logger,
++	PARAMS(const char __user *text, size_t len),
++	PARAMS(text, len)
++);
+ 
+ static struct proc_dir_entry *lttng_logger_dentry;
+ 
+diff --git a/tests/probes/lttng-test.c b/tests/probes/lttng-test.c
+index b450e7d..a4fa064 100644
+--- a/tests/probes/lttng-test.c
++++ b/tests/probes/lttng-test.c
+@@ -25,7 +25,12 @@
+ #define LTTNG_INSTRUMENTATION
+ #include <instrumentation/events/lttng-module/lttng-test.h>
+ 
+-DEFINE_TRACE(lttng_test_filter_event);
++LTTNG_DEFINE_TRACE(lttng_test_filter_event,
++	PARAMS(int anint, int netint, long *values,
++		char *text, size_t textlen,
++		char *etext, uint32_t * net_values),
++	PARAMS(anint, netint, values, text, textlen, etext, net_values)
++);
+ 
+ #define LTTNG_TEST_FILTER_EVENT_FILE	"lttng-test-filter-event"
+ 
+diff --git a/wrapper/tracepoint.h b/wrapper/tracepoint.h
+index c4ba012..bc19d8c 100644
+--- a/wrapper/tracepoint.h
++++ b/wrapper/tracepoint.h
+@@ -14,6 +14,14 @@
+ #include <linux/tracepoint.h>
+ #include <linux/module.h>
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++#define LTTNG_DEFINE_TRACE(name, proto, args)		\
++	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
++#else
++#define LTTNG_DEFINE_TRACE(name, proto, args)		\
++	DEFINE_TRACE(name)
++#endif
++
+ #ifndef HAVE_KABI_2635_TRACEPOINT
+ 
+ #define kabi_2635_tracepoint_probe_register tracepoint_probe_register
+-- 
+2.29.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-ext4-fast-commit-recovery-path-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-ext4-fast-commit-recovery-path-v5.10.patch
new file mode 100644
index 0000000000..ee25b53b22
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-ext4-fast-commit-recovery-path-v5.10.patch
@@ -0,0 +1,99 @@
+From 6a7b96408a8733f433af0ada966cf3027a6771e0 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 26 Oct 2020 17:03:23 -0400
+Subject: [PATCH 2/3] fix: ext4: fast commit recovery path (v5.10)
+
+See upstream commit :
+
+  commit 8016e29f4362e285f0f7e38fadc61a5b7bdfdfa2
+  Author: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
+  Date:   Thu Oct 15 13:37:59 2020 -0700
+
+    ext4: fast commit recovery path
+
+    This patch adds fast commit recovery path support for Ext4 file
+    system. We add several helper functions that are similar in spirit to
+    e2fsprogs journal recovery path handlers. Example of such functions
+    include - a simple block allocator, idempotent block bitmap update
+    function etc. Using these routines and the fast commit log in the fast
+    commit area, the recovery path (ext4_fc_replay()) performs fast commit
+    log recovery.
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/e68322f3615fa6c8dbf25a0860b44af181ac99ec]
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ia65cf44e108f2df0b458f0d335f33a8f18f50baa
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ instrumentation/events/lttng-module/ext4.h | 41 ++++++++++++++++++++++
+ 1 file changed, 41 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
+index b172c8d..6e74aba 100644
+--- a/instrumentation/events/lttng-module/ext4.h
++++ b/instrumentation/events/lttng-module/ext4.h
+@@ -1274,6 +1274,18 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_load_extent,
+ 	)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
++	TP_PROTO(struct super_block *sb, unsigned long ino),
++
++	TP_ARGS(sb, ino),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(ino_t, ino, ino)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
+ 	TP_PROTO(struct inode *inode),
+ 
+@@ -1284,6 +1296,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
+ 		ctf_integer(ino_t, ino, inode->i_ino)
+ 	)
+ )
++#endif
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
+ 
+@@ -1895,6 +1908,34 @@ LTTNG_TRACEPOINT_EVENT(ext4_es_shrink_exit,
+ 
+ #endif
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT(ext4_fc_replay_scan,
++	TP_PROTO(struct super_block *sb, int error, int off),
++
++	TP_ARGS(sb, error, off),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(int, error, error)
++		ctf_integer(int, off, off)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_fc_replay,
++	TP_PROTO(struct super_block *sb, int tag, int ino, int priv1, int priv2),
++
++	TP_ARGS(sb, tag, ino, priv1, priv2),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(int, tag, tag)
++		ctf_integer(int, ino, ino)
++		ctf_integer(int, priv1, priv1)
++		ctf_integer(int, priv2, priv2)
++	)
++)
++#endif
++
+ #endif /* LTTNG_TRACE_EXT4_H */
+ 
+ /* This part must be outside protection */
+-- 
+2.29.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
new file mode 100644
index 0000000000..5be64bc054
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
@@ -0,0 +1,179 @@
+From f8d9e119f86fa9104de4ecaa8a7cd59ad90171ab Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 27 Oct 2020 12:10:05 -0400
+Subject: [PATCH 3/3] fix: btrfs: make ordered extent tracepoint take
+ btrfs_inode (v5.10)
+
+See upstream commit :
+
+  commit acbf1dd0fcbd10c67826a19958f55a053b32f532
+  Author: Nikolay Borisov <nborisov@suse.com>
+  Date:   Mon Aug 31 14:42:40 2020 +0300
+
+    btrfs: make ordered extent tracepoint take btrfs_inode
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/7dc441388e195df35a1e64fbf36856153bdc33f8]
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I096d0801ffe0ad826cfe414cdd1c0857cbd2b624
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ instrumentation/events/lttng-module/btrfs.h | 120 +++++++++++++++-----
+ 1 file changed, 90 insertions(+), 30 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index 52fcfd0..d47f328 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -346,7 +346,29 @@ LTTNG_TRACEPOINT_EVENT(btrfs_handle_em_exist,
+ )
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, inode->root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(ino_t, ino, btrfs_ino(inode))
++		ctf_integer(u64, file_offset, ordered->file_offset)
++		ctf_integer(u64, start, ordered->disk_bytenr)
++		ctf_integer(u64, len, ordered->num_bytes)
++		ctf_integer(u64, disk_len, ordered->disk_num_bytes)
++		ctf_integer(u64, bytes_left, ordered->bytes_left)
++		ctf_integer(unsigned long, flags, ordered->flags)
++		ctf_integer(int, compress_type, ordered->compress_type)
++		ctf_integer(int, refs, refcount_read(&ordered->refs))
++		ctf_integer(u64, root_objectid, inode->root->root_key.objectid)
++	)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
+ 
+ 	TP_PROTO(const struct inode *inode,
+@@ -458,7 +480,39 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
+ )
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
+@@ -494,7 +548,41 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
+ 
+ 	TP_ARGS(inode, ordered)
+ )
++#else
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
+ 
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++#endif
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__writepage,
+ 
+ 	TP_PROTO(const struct page *page, const struct inode *inode,
+@@ -563,34 +651,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_sync_file,
+ 	)
+ )
+ #else
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__writepage,
+ 
+ 	TP_PROTO(struct page *page, struct inode *inode,
+-- 
+2.29.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
index ca79e27df6..dc996fd327 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
@@ -12,6 +12,10 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            file://0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch \
+           file://0001-tracepoint-Optimize-using-static_call.patch \
+           file://0001-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch \
+           file://0002-fix-ext4-fast-commit-recovery-path-v5.10.patch \
+           file://0003-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch \
            "
 
 SRC_URI[sha256sum] = "673ef85c9f03e9b8fed10795e09d4e68add39404b70068d08b10f7b85754d7f0"
-- 
2.29.2

