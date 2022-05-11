Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EF8C433FE
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:58:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hDGs0hGC;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237886; x=1683773886;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=A1RzPSirdlyiDzYOa9g2fIQxy9cPdNfMIYf4j7er6wQ=;
  b=hDGs0hGCmgAWTFngst8hQMrbuZnkAoFVLQ6SCQd+uuBLUM0vywNJ7vYb
   LHrLdguIyMji5/kvX1iHRNQBVLl9g/Q4m+heJips9/osZF2iw0L+ZdWAa
   Fes7612fF8d9qTDwfw6is0MjzaMfIsoWPLJP5heiMm49MTt9ShO0khfsZ
   GKwsCIrg3XCCGpopXJIRmDwJO8w02csSRiYYH6DZ0ta2SXacOB0xge7HZ
   /kncNhlbD9YKBVHrcb8AHb+l8qMhN+RCdz9auDXUvW6heRQBZN+BJY4Q9
   hcBJLGFF9dac7dJFb55F7y1mMdchIzycVqODTjzgUaAO1qH4rPmQs584f
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106079"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106079"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:05 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754853"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:03 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/17] lttng-modules: support kernel 5.18+
Date: Wed, 11 May 2022 10:57:30 +0800
Message-Id: 
 <99c3034acf03a3099d78523c33501e58703a13b7.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165483

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Backporting changes from lttng master to support building against
the 5.18+ kernel. No changes required to the patches. Once a new
-stable 2.13.x is released, we can drop these patches. To enable
newer kernel development against the LTS, it is worth pulling these
in while we wait for an upstream release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a7237a47488442513741930ea55d69dd6bd7be4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...x-compaction-migratepages-event-name.patch |  37 ++++
 ...vent-allow-same-provider-and-event-n.patch |  48 +++++
 ...g-Don-t-re-read-p-state-when-emittin.patch | 183 ++++++++++++++++++
 .../0004-fix-block-remove-genhd.h-v5.18.patch |  45 +++++
 ...emove-REQ_OP_WRITE_SAME-support-v5.1.patch |  79 ++++++++
 ...ndom-remove-unused-tracepoints-v5.18.patch |  47 +++++
 ...rethook-for-kretprobe-if-possible-v5.patch |  72 +++++++
 ...ore-Remove-scsi-scsi_request.h-v5.18.patch |  44 +++++
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  76 ++++++++
 ...n-cleanup-the-compaction-trace-event.patch | 106 ++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  14 +-
 11 files changed, 750 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
new file mode 100644
index 0000000000..e988f7a3d5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
@@ -0,0 +1,37 @@
+From c312bda00d2dc10ce5f6c1189acbefee5c6c8c6c Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Tue, 29 Mar 2022 16:34:07 -0400
+Subject: [PATCH 01/10] Fix: compaction migratepages event name
+
+The commit "fix: mm: compaction: fix the migration stats in trace_mm_compaction_migratepages() (v5.17)"
+
+Triggers this warning:
+
+    LTTng: event provider mismatch: The event name needs to start with provider name + _ + one or more letter, provider: compaction, event name: mm_compaction_migratepages
+
+Upstream-Status: Backport
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I01c7485af765084dafb33bf33ae392e60bfbf1e7
+---
+ include/instrumentation/events/compaction.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
+index 340e41f5..15964537 100644
+--- a/include/instrumentation/events/compaction.h
++++ b/include/instrumentation/events/compaction.h
+@@ -98,7 +98,9 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
+ #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
+-LTTNG_TRACEPOINT_EVENT(mm_compaction_migratepages,
++LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
++
++	compaction_migratepages,
+ 
+ 	TP_PROTO(unsigned long nr_all,
+ 		unsigned int nr_succeeded),
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
new file mode 100644
index 0000000000..00367eebf8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
@@ -0,0 +1,48 @@
+From a7eb2e3d0a4beb1ee80b132927641dd05ef2d542 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Mon, 4 Apr 2022 15:49:32 -0400
+Subject: [PATCH 02/10] Fix: tracepoint event: allow same provider and event
+ name
+
+Using the same name for the provider (TRACE_SYSTEM) and event name
+causes a compilation error because the same identifiers are emitted
+twice.
+
+Fix this by prefixing the provider identifier with
+"__provider_event_desc___".
+
+Upstream-Status: Backport
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I8cdf8f859e35b8bd5c19737860d12f1ed546dfc2
+---
+ include/lttng/tracepoint-event-impl.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/lttng/tracepoint-event-impl.h b/include/lttng/tracepoint-event-impl.h
+index 38b1dc43..dcb22247 100644
+--- a/include/lttng/tracepoint-event-impl.h
++++ b/include/lttng/tracepoint-event-impl.h
+@@ -1255,7 +1255,7 @@ static const struct lttng_kernel_event_desc __event_desc___##_map = {	\
+ #define TP_ID1(_token, _system)	_token##_system
+ #define TP_ID(_token, _system)	TP_ID1(_token, _system)
+ 
+-static const struct lttng_kernel_event_desc * const TP_ID(__event_desc___, TRACE_SYSTEM)[] = {
++static const struct lttng_kernel_event_desc * const TP_ID(__provider_event_desc___, TRACE_SYSTEM)[] = {
+ #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
+ };
+ 
+@@ -1274,8 +1274,8 @@ static const struct lttng_kernel_event_desc * const TP_ID(__event_desc___, TRACE
+ /* non-const because list head will be modified when registered. */
+ static __used struct lttng_kernel_probe_desc TP_ID(__probe_desc___, TRACE_SYSTEM) = {
+ 	.provider_name = __stringify(TRACE_SYSTEM),
+-	.event_desc = TP_ID(__event_desc___, TRACE_SYSTEM),
+-	.nr_events = ARRAY_SIZE(TP_ID(__event_desc___, TRACE_SYSTEM)),
++	.event_desc = TP_ID(__provider_event_desc___, TRACE_SYSTEM),
++	.nr_events = ARRAY_SIZE(TP_ID(__provider_event_desc___, TRACE_SYSTEM)),
+ 	.head = { NULL, NULL },
+ 	.lazy_init_head = { NULL, NULL },
+ 	.lazy = 0,
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
new file mode 100644
index 0000000000..afe514de82
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
@@ -0,0 +1,183 @@
+From 8e52fd71e693619f7a58de2692e59f0c826e9988 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 13:52:57 -0400
+Subject: [PATCH 03/10] fix: sched/tracing: Don't re-read p->state when
+ emitting sched_switch event (v5.18)
+
+See upstream commit :
+
+  commit fa2c3254d7cfff5f7a916ab928a562d1165f17bb
+  Author: Valentin Schneider <valentin.schneider@arm.com>
+  Date:   Thu Jan 20 16:25:19 2022 +0000
+
+    sched/tracing: Don't re-read p->state when emitting sched_switch event
+
+    As of commit
+
+      c6e7bd7afaeb ("sched/core: Optimize ttwu() spinning on p->on_cpu")
+
+    the following sequence becomes possible:
+
+                          p->__state = TASK_INTERRUPTIBLE;
+                          __schedule()
+                            deactivate_task(p);
+      ttwu()
+        READ !p->on_rq
+        p->__state=TASK_WAKING
+                            trace_sched_switch()
+                              __trace_sched_switch_state()
+                                task_state_index()
+                                  return 0;
+
+    TASK_WAKING isn't in TASK_REPORT, so the task appears as TASK_RUNNING in
+    the trace event.
+
+    Prevent this by pushing the value read from __schedule() down the trace
+    event.
+
+Upstream-Status: Backport
+
+Change-Id: I46743cd006be4b4d573cae2d77df7d6d16744d04
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/sched.h | 88 +++++++++++++++++++++++---
+ 1 file changed, 78 insertions(+), 10 deletions(-)
+
+diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
+index 91953a6f..339bec94 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -20,7 +20,37 @@
+ #ifndef _TRACE_SCHED_DEF_
+ #define _TRACE_SCHED_DEF_
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,15,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++
++static inline long __trace_sched_switch_state(bool preempt,
++		unsigned int prev_state,
++		struct task_struct *p)
++{
++        unsigned int state;
++
++#ifdef CONFIG_SCHED_DEBUG
++        BUG_ON(p != current);
++#endif /* CONFIG_SCHED_DEBUG */
++
++        /*
++         * Preemption ignores task state, therefore preempted tasks are always
++         * RUNNING (we will not have dequeued if state != RUNNING).
++         */
++        if (preempt)
++                return TASK_REPORT_MAX;
++
++        /*
++         * task_state_index() uses fls() and returns a value from 0-8 range.
++         * Decrement it by 1 (except TASK_RUNNING state i.e 0) before using
++         * it for left shift operation to get the correct task->state
++         * mapping.
++         */
++	state = __task_state_index(prev_state, p->exit_state);
++
++        return state ? (1 << (state - 1)) : state;
++}
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,15,0))
+ 
+ static inline long __trace_sched_switch_state(bool preempt, struct task_struct *p)
+ {
+@@ -321,43 +351,81 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_wakeup_template, sched_wakeup_new,
+ /*
+  * Tracepoint for task switches, performed by the scheduler:
+  */
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
+ LTTNG_TRACEPOINT_EVENT(sched_switch,
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0))
+ 	TP_PROTO(bool preempt,
+-		 struct task_struct *prev,
+-		 struct task_struct *next),
++		unsigned int prev_state,
++		struct task_struct *prev,
++		struct task_struct *next),
+ 
+-	TP_ARGS(preempt, prev, next),
++	TP_ARGS(preempt, prev_state, prev, next),
++
++	TP_FIELDS(
++		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
++		ctf_integer(pid_t, prev_tid, prev->pid)
++		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
++#ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
++		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
+ #else
+-	TP_PROTO(struct task_struct *prev,
++		ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev_state, prev))
++#endif
++		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
++		ctf_integer(pid_t, next_tid, next->pid)
++		ctf_integer(int, next_prio, next->prio - MAX_RT_PRIO)
++	)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0))
++
++LTTNG_TRACEPOINT_EVENT(sched_switch,
++
++	TP_PROTO(bool preempt,
++		 struct task_struct *prev,
+ 		 struct task_struct *next),
+ 
+-	TP_ARGS(prev, next),
+-#endif /* #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0)) */
++	TP_ARGS(preempt, prev, next),
+ 
+ 	TP_FIELDS(
+ 		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
+ 		ctf_integer(pid_t, prev_tid, prev->pid)
+ 		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,4,0))
+ #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
+ 		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(preempt, prev))
+ #else
+ 		ctf_integer(long, prev_state, __trace_sched_switch_state(preempt, prev))
+ #endif
++		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
++		ctf_integer(pid_t, next_tid, next->pid)
++		ctf_integer(int, next_prio, next->prio - MAX_RT_PRIO)
++	)
++)
++
+ #else
++
++LTTNG_TRACEPOINT_EVENT(sched_switch,
++
++	TP_PROTO(struct task_struct *prev,
++		 struct task_struct *next),
++
++	TP_ARGS(prev, next),
++
++	TP_FIELDS(
++		ctf_array_text(char, prev_comm,	prev->comm, TASK_COMM_LEN)
++		ctf_integer(pid_t, prev_tid, prev->pid)
++		ctf_integer(int, prev_prio, prev->prio - MAX_RT_PRIO)
+ #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
+ 		ctf_enum(task_state, long, prev_state, __trace_sched_switch_state(prev))
+ #else
+ 		ctf_integer(long, prev_state, __trace_sched_switch_state(prev))
+-#endif
+ #endif
+ 		ctf_array_text(char, next_comm, next->comm, TASK_COMM_LEN)
+ 		ctf_integer(pid_t, next_tid, next->pid)
+ 		ctf_integer(int, next_prio, next->prio - MAX_RT_PRIO)
+ 	)
+ )
++#endif
+ 
+ /*
+  * Tracepoint for a task being migrated:
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
new file mode 100644
index 0000000000..9248ffe4ff
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
@@ -0,0 +1,45 @@
+From 868e0b6db59159197c2cec3550fa4ad5e6572bc5 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 13:54:59 -0400
+Subject: [PATCH 04/10] fix: block: remove genhd.h (v5.18)
+
+See upstream commit :
+
+  commit 322cbb50de711814c42fb088f6d31901502c711a
+  Author: Christoph Hellwig <hch@lst.de>
+  Date:   Mon Jan 24 10:39:13 2022 +0100
+
+    block: remove genhd.h
+
+    There is no good reason to keep genhd.h separate from the main blkdev.h
+    header that includes it.  So fold the contents of genhd.h into blkdev.h
+    and remove genhd.h entirely.
+
+Upstream-Status: Backport
+
+Change-Id: I7cf2aaa3a4c133320b95f2edde49f790f9515dbd
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/genhd.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/wrapper/genhd.h b/include/wrapper/genhd.h
+index 3c6dbcbe..4a59b68e 100644
+--- a/include/wrapper/genhd.h
++++ b/include/wrapper/genhd.h
+@@ -12,7 +12,11 @@
+ #ifndef _LTTNG_WRAPPER_GENHD_H
+ #define _LTTNG_WRAPPER_GENHD_H
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++#include <linux/blkdev.h>
++#else
+ #include <linux/genhd.h>
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
+ #define LTTNG_GENHD_FL_HIDDEN GENHD_FL_HIDDEN
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
new file mode 100644
index 0000000000..0751827613
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
@@ -0,0 +1,79 @@
+From 2bc7cb7193124d20aa4e1b5dbad0410bfb97a470 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 14:12:13 -0400
+Subject: [PATCH 05/10] fix: scsi: block: Remove REQ_OP_WRITE_SAME support
+ (v5.18)
+
+See upstream commit :
+
+  commit 73bd66d9c834220579c881a3eb020fd8917075d8
+  Author: Christoph Hellwig <hch@lst.de>
+  Date:   Wed Feb 9 09:28:28 2022 +0100
+
+    scsi: block: Remove REQ_OP_WRITE_SAME support
+
+    No more users of REQ_OP_WRITE_SAME or drivers implementing it are left,
+    so remove the infrastructure.
+
+Upstream-Status: Backport
+
+Change-Id: Ifbff71f79f8b590436fc7cb79f82d90c6e033d84
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/block.h | 32 ++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
+index 3e1104d7..050a59a2 100644
+--- a/include/instrumentation/events/block.h
++++ b/include/instrumentation/events/block.h
+@@ -66,6 +66,37 @@ LTTNG_TRACEPOINT_ENUM(block_rq_type,
+ #define lttng_bio_op(bio)	bio_op(bio)
+ #define lttng_bio_rw(bio)	((bio)->bi_opf)
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++#ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
++#define blk_rwbs_ctf_integer(type, rwbs, op, rw, bytes)			      \
++		ctf_enum(block_rq_type, type, rwbs,					      \
++			( (op) == REQ_OP_WRITE ? RWBS_FLAG_WRITE : \
++			( (op) == REQ_OP_DISCARD ? RWBS_FLAG_DISCARD :	      \
++			( (op) == REQ_OP_SECURE_ERASE ? (RWBS_FLAG_DISCARD | RWBS_FLAG_SECURE) : \
++			( (op) == REQ_OP_FLUSH ? RWBS_FLAG_FLUSH :	      \
++			( (op) == REQ_OP_READ ? RWBS_FLAG_READ :	      \
++			( 0 ))))))					      \
++			| ((rw) & REQ_RAHEAD ? RWBS_FLAG_RAHEAD : 0)	      \
++			| ((rw) & REQ_SYNC ? RWBS_FLAG_SYNC : 0)	      \
++			| ((rw) & REQ_META ? RWBS_FLAG_META : 0)	      \
++			| ((rw) & REQ_PREFLUSH ? RWBS_FLAG_PREFLUSH : 0)      \
++			| ((rw) & REQ_FUA ? RWBS_FLAG_FUA : 0))
++#else
++#define blk_rwbs_ctf_integer(type, rwbs, op, rw, bytes)			      \
++		ctf_integer(type, rwbs,					      \
++			( (op) == REQ_OP_WRITE ? RWBS_FLAG_WRITE : \
++			( (op) == REQ_OP_DISCARD ? RWBS_FLAG_DISCARD :	      \
++			( (op) == REQ_OP_SECURE_ERASE ? (RWBS_FLAG_DISCARD | RWBS_FLAG_SECURE) : \
++			( (op) == REQ_OP_FLUSH ? RWBS_FLAG_FLUSH :	      \
++			( (op) == REQ_OP_READ ? RWBS_FLAG_READ :	      \
++			( 0 ))))))					      \
++			| ((rw) & REQ_RAHEAD ? RWBS_FLAG_RAHEAD : 0)	      \
++			| ((rw) & REQ_SYNC ? RWBS_FLAG_SYNC : 0)	      \
++			| ((rw) & REQ_META ? RWBS_FLAG_META : 0)	      \
++			| ((rw) & REQ_PREFLUSH ? RWBS_FLAG_PREFLUSH : 0)      \
++			| ((rw) & REQ_FUA ? RWBS_FLAG_FUA : 0))
++#endif /* CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM */
++#else
+ #ifdef CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM
+ #define blk_rwbs_ctf_integer(type, rwbs, op, rw, bytes)			      \
+ 		ctf_enum(block_rq_type, type, rwbs,					      \
+@@ -95,6 +126,7 @@ LTTNG_TRACEPOINT_ENUM(block_rq_type,
+ 			| ((rw) & REQ_PREFLUSH ? RWBS_FLAG_PREFLUSH : 0)      \
+ 			| ((rw) & REQ_FUA ? RWBS_FLAG_FUA : 0))
+ #endif /* CONFIG_LTTNG_EXPERIMENTAL_BITWISE_ENUM */
++#endif
+ 
+ #elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,1,0))
+ 
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
new file mode 100644
index 0000000000..9c2f70d4af
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
@@ -0,0 +1,47 @@
+From 369d82bb1746447514c877088d7c5fd0f39140f8 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 14:33:42 -0400
+Subject: [PATCH 06/10] fix: random: remove unused tracepoints (v5.18)
+
+See upstream commit :
+
+  commit 14c174633f349cb41ea90c2c0aaddac157012f74
+  Author: Jason A. Donenfeld <Jason@zx2c4.com>
+  Date:   Thu Feb 10 16:40:44 2022 +0100
+
+    random: remove unused tracepoints
+
+    These explicit tracepoints aren't really used and show sign of aging.
+    It's work to keep these up to date, and before I attempted to keep them
+    up to date, they weren't up to date, which indicates that they're not
+    really used. These days there are better ways of introspecting anyway.
+
+Upstream-Status: Backport
+
+Change-Id: I3b8c3e2732e7efdd76ce63204ac53a48784d0df6
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ src/probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/probes/Kbuild b/src/probes/Kbuild
+index e26b4359..8d6ff0f2 100644
+--- a/src/probes/Kbuild
++++ b/src/probes/Kbuild
+@@ -187,8 +187,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
+   CFLAGS_lttng-probe-printk.o += -Wframe-larger-than=2200
+ endif
+ 
++# Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=  $(shell \
+-    if [ $(VERSION) -ge 4 \
++    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
++      -a \
++      $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 5 -a $(SUBLEVEL) -ge 2 \) \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -eq 4 -a $(SUBLEVEL) -ge 9 \) \
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
new file mode 100644
index 0000000000..effd37ffe1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
@@ -0,0 +1,72 @@
+From 3c46ddc134621dba65030263aa321dd6bdae3ba3 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 15:02:10 -0400
+Subject: [PATCH 07/10] fix: kprobes: Use rethook for kretprobe if possible
+ (v5.18)
+
+See upstream commit :
+
+  commit 73f9b911faa74ac5107879de05c9489c419f41bb
+  Author: Masami Hiramatsu <mhiramat@kernel.org>
+  Date:   Sat Mar 26 11:27:05 2022 +0900
+
+    kprobes: Use rethook for kretprobe if possible
+
+    Use rethook for kretprobe function return hooking if the arch sets
+    CONFIG_HAVE_RETHOOK=y. In this case, CONFIG_KRETPROBE_ON_RETHOOK is
+    set to 'y' automatically, and the kretprobe internal data fields
+    switches to use rethook. If not, it continues to use kretprobe
+    specific function return hooks.
+
+Upstream-Status: Backport
+
+Change-Id: I2b7670dc04e4769c1e3c372582ad2f555f6d7a66
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/kprobes.h     | 17 +++++++++++++++++
+ src/probes/lttng-kretprobes.c |  2 +-
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/include/wrapper/kprobes.h b/include/wrapper/kprobes.h
+index b546d615..51d32b7c 100644
+--- a/include/wrapper/kprobes.h
++++ b/include/wrapper/kprobes.h
+@@ -29,4 +29,21 @@ struct kretprobe *lttng_get_kretprobe(struct kretprobe_instance *ri)
+ 
+ #endif /* LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0) */
+ 
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++static inline
++unsigned long lttng_get_kretprobe_retaddr(struct kretprobe_instance *ri)
++{
++	return get_kretprobe_retaddr(ri);
++}
++
++#else
++
++static inline
++unsigned long lttng_get_kretprobe_retaddr(struct kretprobe_instance *ri)
++{
++	return (unsigned long) ri->ret_addr;
++}
++#endif
++
+ #endif /* _LTTNG_WRAPPER_KPROBES_H */
+diff --git a/src/probes/lttng-kretprobes.c b/src/probes/lttng-kretprobes.c
+index 5cb2e953..565df739 100644
+--- a/src/probes/lttng-kretprobes.c
++++ b/src/probes/lttng-kretprobes.c
+@@ -81,7 +81,7 @@ int _lttng_kretprobes_handler(struct kretprobe_instance *krpi,
+ 		int ret;
+ 
+ 		payload.ip = (unsigned long) lttng_get_kretprobe(krpi)->kp.addr;
+-		payload.parent_ip = (unsigned long) krpi->ret_addr;
++		payload.parent_ip = lttng_get_kretprobe_retaddr(krpi);
+ 
+ 		lib_ring_buffer_ctx_init(&ctx, event_recorder, sizeof(payload),
+ 					 lttng_alignof(payload), &lttng_probe_ctx);
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
new file mode 100644
index 0000000000..13c504b859
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
@@ -0,0 +1,44 @@
+From e8d2f286b5b208ac8870d0a9c167b170e96169b3 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 15:08:48 -0400
+Subject: [PATCH 08/10] fix: scsi: core: Remove <scsi/scsi_request.h> (v5.18)
+
+See upstream commit :
+
+  commit 26440303310591e29121964ede0048583cb3126d
+  Author: Christoph Hellwig <hch@lst.de>
+  Date:   Thu Feb 24 18:55:52 2022 +0100
+
+    scsi: core: Remove <scsi/scsi_request.h>
+
+    This header is empty now except for an include of <linux/blk-mq.h>, so
+    remove it.
+
+Upstream-Status: Backport
+
+Change-Id: Ic8ee3352f1e8bddfcd44c31be9b788db82f183aa
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/block.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/block.h b/include/instrumentation/events/block.h
+index 050a59a2..882e6e08 100644
+--- a/include/instrumentation/events/block.h
++++ b/include/instrumentation/events/block.h
+@@ -11,9 +11,9 @@
+ #include <linux/trace_seq.h>
+ #include <lttng/kernel-version.h>
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0))
++#if LTTNG_KERNEL_RANGE(4,11,0, 5,18,0)
+ #include <scsi/scsi_request.h>
+-#endif /* (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0)) */
++#endif /* LTTNG_KERNEL_RANGE(4,11,0, 5,18,0) */
+ 
+ #ifndef _TRACE_BLOCK_DEF_
+ #define _TRACE_BLOCK_DEF_
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
new file mode 100644
index 0000000000..90fec9dc58
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
@@ -0,0 +1,76 @@
+From 82fbf9d383ff9069808fb0f5f75c660098dbae52 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 5 Apr 2022 14:57:41 -0400
+Subject: [PATCH 09/10] Rename genhd wrapper to blkdev
+
+The genhd.h header was folded into blkdev.h in v5.18, rename our wrapper
+to follow upstream.
+
+Upstream-Status: Backport
+
+Change-Id: I4ec94fb94d11712dd20f0680aea1de77fbfa9d17
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/{genhd.h => blkdev.h} | 10 +++++-----
+ src/lttng-statedump-impl.c            |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+ rename include/wrapper/{genhd.h => blkdev.h} (93%)
+
+diff --git a/include/wrapper/genhd.h b/include/wrapper/blkdev.h
+similarity index 93%
+rename from include/wrapper/genhd.h
+rename to include/wrapper/blkdev.h
+index 4a59b68e..0d5ad90f 100644
+--- a/include/wrapper/genhd.h
++++ b/include/wrapper/blkdev.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: (GPL-2.0-only or LGPL-2.1-only)
+  *
+- * wrapper/genhd.h
++ * wrapper/blkdev.h
+  *
+  * wrapper around block layer functions and data structures. Using
+  * KALLSYMS to get its address when available, else we need to have a
+@@ -9,8 +9,8 @@
+  * Copyright (C) 2011-2014 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+  */
+ 
+-#ifndef _LTTNG_WRAPPER_GENHD_H
+-#define _LTTNG_WRAPPER_GENHD_H
++#ifndef _LTTNG_WRAPPER_BLKDEV_H
++#define _LTTNG_WRAPPER_BLKDEV_H
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
+ #include <linux/blkdev.h>
+@@ -45,7 +45,7 @@ struct class *wrapper_get_block_class(void)
+ /*
+  * Canary function to check for 'block_class' at compile time.
+  *
+- * From 'include/linux/genhd.h':
++ * From 'include/linux/blkdev.h':
+  *
+  *   extern struct class block_class;
+  */
+@@ -104,4 +104,4 @@ struct device_type *wrapper_get_disk_type(void)
+ 
+ #endif
+ 
+-#endif /* _LTTNG_WRAPPER_GENHD_H */
++#endif /* _LTTNG_WRAPPER_BLKDEV_H */
+diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
+index 4d7b2921..0e753090 100644
+--- a/src/lttng-statedump-impl.c
++++ b/src/lttng-statedump-impl.c
+@@ -41,7 +41,7 @@
+ #include <wrapper/namespace.h>
+ #include <wrapper/irq.h>
+ #include <wrapper/tracepoint.h>
+-#include <wrapper/genhd.h>
++#include <wrapper/blkdev.h>
+ #include <wrapper/file.h>
+ #include <wrapper/fdtable.h>
+ #include <wrapper/sched.h>
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch b/meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
new file mode 100644
index 0000000000..892d3f0d23
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
@@ -0,0 +1,106 @@
+From f9208dc00756dfa0a2f191799722030bdf3f793d Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 4 Apr 2022 15:14:01 -0400
+Subject: [PATCH 10/10] fix: mm: compaction: cleanup the compaction trace
+ events (v5.18)
+
+See upstream commit :
+
+  commit abd4349ff9b8d242376b67711254221f64f447c7
+  Author: Baolin Wang <baolin.wang@linux.alibaba.com>
+  Date:   Tue Mar 22 14:45:56 2022 -0700
+
+    mm: compaction: cleanup the compaction trace events
+
+    As Steven suggested [1], we should access the pointers from the trace
+    event to avoid dereferencing them to the tracepoint function when the
+    tracepoint is disabled.
+
+    [1] https://lkml.org/lkml/2021/11/3/409
+
+Upstream-Status: Backport
+
+Change-Id: I6c08250df8596e8dbc76780ae5d95c899c12e6fe
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/compaction.h | 17 ++++++++++++++++-
+ src/probes/Kbuild                           | 17 ++++++++++++++++-
+ src/probes/lttng-probe-compaction.c         |  5 +++++
+ 3 files changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/compaction.h b/include/instrumentation/events/compaction.h
+index 15964537..ecae39a8 100644
+--- a/include/instrumentation/events/compaction.h
++++ b/include/instrumentation/events/compaction.h
+@@ -97,7 +97,22 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(compaction_isolate_template,
+ 
+ #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
++
++	compaction_migratepages,
++
++	TP_PROTO(struct compact_control *cc,
++		unsigned int nr_succeeded),
++
++	TP_ARGS(cc, nr_succeeded),
++
++	TP_FIELDS(
++		ctf_integer(unsigned long, nr_migrated, nr_succeeded)
++		ctf_integer(unsigned long, nr_failed, cc->nr_migratepages - nr_succeeded)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
+ 
+ 	compaction_migratepages,
+diff --git a/src/probes/Kbuild b/src/probes/Kbuild
+index 8d6ff0f2..54784477 100644
+--- a/src/probes/Kbuild
++++ b/src/probes/Kbuild
+@@ -167,7 +167,22 @@ ifneq ($(CONFIG_BTRFS_FS),)
+   endif # $(wildcard $(btrfs_dep))
+ endif # CONFIG_BTRFS_FS
+ 
+-obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
++# A dependency on internal header 'mm/internal.h' was introduced in v5.18
++compaction_dep = $(srctree)/mm/internal.h
++compaction_dep_wildcard = $(wildcard $(compaction_dep))
++compaction_dep_check = $(shell \
++if [ \( $(VERSION) -ge 6 \
++   -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
++   -z "$(compaction_dep_wildcard)" ] ; then \
++  echo "warn" ; \
++else \
++  echo "ok" ; \
++fi ;)
++ifeq ($(compaction_dep_check),ok)
++  obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
++else
++  $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
++endif # $(wildcard $(compaction_dep))
+ 
+ ifneq ($(CONFIG_EXT4_FS),)
+   ext4_dep = $(srctree)/fs/ext4/*.h
+diff --git a/src/probes/lttng-probe-compaction.c b/src/probes/lttng-probe-compaction.c
+index f8ddf384..ffaf45f0 100644
+--- a/src/probes/lttng-probe-compaction.c
++++ b/src/probes/lttng-probe-compaction.c
+@@ -10,6 +10,11 @@
+ 
+ #include <linux/module.h>
+ #include <lttng/tracer.h>
++#include <lttng/kernel-version.h>
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++#include "../mm/internal.h"
++#endif
+ 
+ /*
+  * Create the tracepoint static inlines from the kernel to validate that our
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index a959ce9211..c33920e0d0 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -9,7 +9,19 @@ inherit module
 
 include lttng-platforms.inc
 
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-Fix-compaction-migratepages-event-name.patch \
+           file://0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch \
+           file://0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch \
+           file://0004-fix-block-remove-genhd.h-v5.18.patch \
+           file://0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch \
+           file://0006-fix-random-remove-unused-tracepoints-v5.18.patch \
+           file://0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch \
+           file://0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch \
+           file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
+          "
+
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-- 
2.35.3


