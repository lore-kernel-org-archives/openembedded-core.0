Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6D727C346
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 08:56:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5B8uCpZ017767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 01:56:13 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 11 Jun 2019 01:56:12 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jun 2019 16:56:10 +0800
Message-ID: <1560243370-203684-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2019 08:56:12 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

For the moment,
0001~0004 are on master branch only.
0005~0007 are on stable-2.11 branch, but v2.11 has not been released yet.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ove-wrapper-definitions-for-obsolete-RCU..patch |  47 ++++
 ...ix-timer-trace-Improve-timer-tracing-v5.2.patch |  80 +++++++
 .../0003-Fix-pipe-stop-using-can_merge-v5.1.patch  |  42 ++++
 ...ix-mm-create-the-new-vm_fault_t-type-v5.1.patch |  65 ++++++
 ...an-drop-may_writepage-and-classzone_idx-f.patch |  92 ++++++++
 ...only-read-from-dev-random-after-its-pool-.patch |  76 ++++++
 ...start-and-number-from-syscall_get_argumen.patch | 259 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb  |   7 +
 8 files changed, 668 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-timer-trace-Improve-timer-tracing-v5.2.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-mm-vmscan-drop-may_writepage-and-classzone_idx-f.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-only-read-from-dev-random-after-its-pool-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-Remove-start-and-number-from-syscall_get_argumen.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
new file mode 100644
index 0000000..385af52
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
@@ -0,0 +1,47 @@
+From 92da05ce1f73488a57e7fd79e9c03113cefdb76f Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:33 -0400
+Subject: [PATCH] Fix: rcu: Remove wrapper definitions for obsolete RCU...
+ (v5.1)
+
+See upstream commit :
+
+commit 6ba7d681aca22e53385bdb35b1d7662e61905760
+Author: Paul E. McKenney <paulmck@linux.ibm.com>
+Date:   Wed Jan 9 15:22:03 2019 -0800
+
+    rcu: Remove wrapper definitions for obsolete RCU update functions
+
+    None of synchronize_rcu_bh, synchronize_rcu_bh_expedited, call_rcu_bh,
+    rcu_barrier_bh, synchronize_sched, synchronize_sched_expedited,
+    call_rcu_sched, rcu_barrier_sched, get_state_synchronize_sched, and
+    cond_synchronize_sched are actually used.  This commit therefore removes
+    their trivial wrapper-function definitions.
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+igned-off-by: He Zhe <zhe.he@windriver.com>
+---
+ lttng-events.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lttng-events.c b/lttng-events.c
+index 566080a..f4206c5 100644
+--- a/lttng-events.c
++++ b/lttng-events.c
+@@ -75,7 +75,12 @@ int _lttng_field_statedump(struct lttng_session *session,
+ 
+ void synchronize_trace(void)
+ {
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
++	synchronize_rcu();
++#else
+ 	synchronize_sched();
++#endif
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0))
+ #ifdef CONFIG_PREEMPT_RT_FULL
+ 	synchronize_rcu();
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-timer-trace-Improve-timer-tracing-v5.2.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-timer-trace-Improve-timer-tracing-v5.2.patch
new file mode 100644
index 0000000..e782ee0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-timer-trace-Improve-timer-tracing-v5.2.patch
@@ -0,0 +1,80 @@
+From d88e2fe5c3ea0d2c3055fba824be17223c418854 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 21 May 2019 16:33:10 -0400
+Subject: [PATCH] fix: timer/trace: Improve timer tracing (v5.2)
+
+See upstream commit:
+
+  commit f28d3d5346e97e60c81f933ac89ccf015430e5cf
+  Author: Anna-Maria Gleixner <anna-maria@linutronix.de>
+  Date:   Thu Mar 21 13:09:21 2019 +0100
+
+    timer/trace: Improve timer tracing
+
+    Timers are added to the timer wheel off by one. This is required in
+    case a timer is queued directly before incrementing jiffies to prevent
+    early timer expiry.
+
+    When reading a timer trace and relying only on the expiry time of the timer
+    in the timer_start trace point and on the now in the timer_expiry_entry
+    trace point, it seems that the timer fires late. With the current
+    timer_expiry_entry trace point information only now=jiffies is printed but
+    not the value of base->clk. This makes it impossible to draw a conclusion
+    to the index of base->clk and makes it impossible to examine timer problems
+    without additional trace points.
+
+    Therefore add the base->clk value to the timer_expire_entry trace
+    point, to be able to calculate the index the timer base is located at
+    during collecting expired timers.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/timer.h | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/timer.h b/instrumentation/events/lttng-module/timer.h
+index 8703ea0..997084f 100644
+--- a/instrumentation/events/lttng-module/timer.h
++++ b/instrumentation/events/lttng-module/timer.h
+@@ -89,6 +89,27 @@ LTTNG_TRACEPOINT_EVENT(timer_start,
+ )
+ #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0)) */
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,2,0))
++/**
++ * timer_expire_entry - called immediately before the timer callback
++ * @timer:	pointer to struct timer_list
++ *
++ * Allows to determine the timer latency.
++ */
++LTTNG_TRACEPOINT_EVENT(timer_expire_entry,
++
++	TP_PROTO(struct timer_list *timer, unsigned long baseclk),
++
++	TP_ARGS(timer, baseclk),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, timer, timer)
++		ctf_integer(unsigned long, now, jiffies)
++		ctf_integer_hex(void *, function, timer->function)
++		ctf_integer(unsigned long, baseclk, baseclk)
++	)
++)
++#else
+ /**
+  * timer_expire_entry - called immediately before the timer callback
+  * @timer:	pointer to struct timer_list
+@@ -107,6 +128,7 @@ LTTNG_TRACEPOINT_EVENT(timer_expire_entry,
+ 		ctf_integer_hex(void *, function, timer->function)
+ 	)
+ )
++#endif
+ 
+ /**
+  * timer_expire_exit - called immediately after the timer callback returns
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
new file mode 100644
index 0000000..359bd37
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
@@ -0,0 +1,42 @@
+From d6cd2c9598a06f0ba1ba885bbe754e8836528310 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:34 -0400
+Subject: [PATCH] Fix: pipe: stop using ->can_merge (v5.1)
+
+See upstream commit:
+
+  commit 01e7187b41191376cee8bea8de9f907b001e87b4
+  Author: Jann Horn <jannh@google.com>
+  Date:   Wed Jan 23 15:19:18 2019 +0100
+
+    pipe: stop using ->can_merge
+
+    Al Viro pointed out that since there is only one pipe buffer type to which
+    new data can be appended, it isn't necessary to have a ->can_merge field in
+    struct pipe_buf_operations, we can just check for a magic type.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ lib/ringbuffer/ring_buffer_splice.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ringbuffer/ring_buffer_splice.c b/lib/ringbuffer/ring_buffer_splice.c
+index 468641b..52179a7 100644
+--- a/lib/ringbuffer/ring_buffer_splice.c
++++ b/lib/ringbuffer/ring_buffer_splice.c
+@@ -43,7 +43,9 @@ static void lib_ring_buffer_pipe_buf_release(struct pipe_inode_info *pipe,
+ }
+ 
+ static const struct pipe_buf_operations ring_buffer_pipe_buf_ops = {
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,1,0))
+ 	.can_merge = 0,
++#endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,15,0))
+ 	.map = generic_pipe_buf_map,
+ 	.unmap = generic_pipe_buf_unmap,
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
new file mode 100644
index 0000000..47b17ad
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
@@ -0,0 +1,65 @@
+From 2ca0c84f0b4a915c555a0b83102d94ac941619ca Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:32 -0400
+Subject: [PATCH] Fix: mm: create the new vm_fault_t type (v5.1)
+
+See upstream commit:
+
+  commit 3d3539018d2cbd12e5af4a132636ee7fd8d43ef0
+  Author: Souptick Joarder <jrdr.linux@gmail.com>
+  Date:   Thu Mar 7 16:31:14 2019 -0800
+
+    mm: create the new vm_fault_t type
+
+    Page fault handlers are supposed to return VM_FAULT codes, but some
+    drivers/file systems mistakenly return error numbers.  Now that all
+    drivers/file systems have been converted to use the vm_fault_t return
+    type, change the type definition to no longer be compatible with 'int'.
+    By making it an unsigned int, the function prototype becomes
+    incompatible with a function which returns int.  Sparse will detect any
+    attempts to return a value which is not a VM_FAULT code.
+
+    VM_FAULT_SET_HINDEX and VM_FAULT_GET_HINDEX values are changed to avoid
+    conflict with other VM_FAULT codes.
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ lib/ringbuffer/ring_buffer_mmap.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ringbuffer/ring_buffer_mmap.c b/lib/ringbuffer/ring_buffer_mmap.c
+index 30dd93e..fab9458 100644
+--- a/lib/ringbuffer/ring_buffer_mmap.c
++++ b/lib/ringbuffer/ring_buffer_mmap.c
+@@ -20,7 +20,11 @@
+ /*
+  * fault() vm_op implementation for ring buffer file mapping.
+  */
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
++static vm_fault_t lib_ring_buffer_fault_compat(struct vm_area_struct *vma, struct vm_fault *vmf)
++#else
+ static int lib_ring_buffer_fault_compat(struct vm_area_struct *vma, struct vm_fault *vmf)
++#endif
+ {
+ 	struct lib_ring_buffer *buf = vma->vm_private_data;
+ 	struct channel *chan = buf->backend.chan;
+@@ -53,7 +57,13 @@ static int lib_ring_buffer_fault_compat(struct vm_area_struct *vma, struct vm_fa
+ 	return 0;
+ }
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
++static vm_fault_t lib_ring_buffer_fault(struct vm_fault *vmf)
++{
++	struct vm_area_struct *vma = vmf->vma;
++	return lib_ring_buffer_fault_compat(vma, vmf);
++}
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,11,0))
+ static int lib_ring_buffer_fault(struct vm_fault *vmf)
+ {
+ 	struct vm_area_struct *vma = vmf->vma;
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-mm-vmscan-drop-may_writepage-and-classzone_idx-f.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-mm-vmscan-drop-may_writepage-and-classzone_idx-f.patch
new file mode 100644
index 0000000..093bb59
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-mm-vmscan-drop-may_writepage-and-classzone_idx-f.patch
@@ -0,0 +1,92 @@
+From da00122ccfae6a73ec859826a0be1cf0902cfd11 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 21 May 2019 16:33:11 -0400
+Subject: [PATCH] fix: mm/vmscan: drop may_writepage and classzone_idx from
+ direct reclaim begin template (v5.2)
+
+See upstream commit:
+
+  commit 3481c37ffa1de58ef140d0fe9eabf56305e74666
+  Author: Yafang Shao <laoar.shao@gmail.com>
+  Date:   Mon May 13 17:19:14 2019 -0700
+
+    mm/vmscan: drop may_writepage and classzone_idx from direct reclaim begin template
+
+    There are three tracepoints using this template, which are
+    mm_vmscan_direct_reclaim_begin,
+    mm_vmscan_memcg_reclaim_begin,
+    mm_vmscan_memcg_softlimit_reclaim_begin.
+
+    Regarding mm_vmscan_direct_reclaim_begin,
+    sc.may_writepage is !laptop_mode, that's a static setting, and
+    reclaim_idx is derived from gfp_mask which is already show in this
+    tracepoint.
+
+    Regarding mm_vmscan_memcg_reclaim_begin,
+    may_writepage is !laptop_mode too, and reclaim_idx is (MAX_NR_ZONES-1),
+    which are both static value.
+
+    mm_vmscan_memcg_softlimit_reclaim_begin is the same with
+    mm_vmscan_memcg_reclaim_begin.
+
+    So we can drop them all.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/mm_vmscan.h | 37 ++++++++++++++++++++++++-
+ 1 file changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/mm_vmscan.h b/instrumentation/events/lttng-module/mm_vmscan.h
+index b9cd8b0..e9cbf5c 100644
+--- a/instrumentation/events/lttng-module/mm_vmscan.h
++++ b/instrumentation/events/lttng-module/mm_vmscan.h
+@@ -114,7 +114,42 @@ LTTNG_TRACEPOINT_EVENT(mm_vmscan_wakeup_kswapd,
+ )
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,8,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,2,0))
++
++LTTNG_TRACEPOINT_EVENT_CLASS(mm_vmscan_direct_reclaim_begin_template,
++
++	TP_PROTO(int order, gfp_t gfp_flags),
++
++	TP_ARGS(order, gfp_flags),
++
++	TP_FIELDS(
++		ctf_integer(int, order, order)
++		ctf_integer(gfp_t, gfp_flags, gfp_flags)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmscan_direct_reclaim_begin,
++
++	TP_PROTO(int order, gfp_t gfp_flags),
++
++	TP_ARGS(order, gfp_flags)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmscan_memcg_reclaim_begin,
++
++	TP_PROTO(int order, gfp_t gfp_flags),
++
++	TP_ARGS(order, gfp_flags)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmscan_memcg_softlimit_reclaim_begin,
++
++	TP_PROTO(int order, gfp_t gfp_flags),
++
++	TP_ARGS(order, gfp_flags)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,8,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(mm_vmscan_direct_reclaim_begin_template,
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-only-read-from-dev-random-after-its-pool-.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-only-read-from-dev-random-after-its-pool-.patch
new file mode 100644
index 0000000..d67b741
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-only-read-from-dev-random-after-its-pool-.patch
@@ -0,0 +1,76 @@
+From df0e746a05a267384785d66c9fca947eb4a9e517 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 21 May 2019 16:33:14 -0400
+Subject: [PATCH] fix: random: only read from /dev/random after its pool has
+ received 128 bits (v5.2)
+
+See upstream commit:
+
+  commit eb9d1bf079bb438d1a066d72337092935fc770f6
+  Author: Theodore Ts'o <tytso@mit.edu>
+  Date:   Wed Feb 20 16:06:38 2019 -0500
+
+    random: only read from /dev/random after its pool has received 128 bits
+
+    Immediately after boot, we allow reads from /dev/random before its
+    entropy pool has been fully initialized.  Fix this so that we don't
+    allow this until the blocking pool has received 128 bits.
+
+    We do this by repurposing the initialized flag in the entropy pool
+    struct, and use the initialized flag in the blocking pool to indicate
+    whether it is safe to pull from the blocking pool.
+
+    To do this, we needed to rework when we decide to push entropy from the
+    input pool to the blocking pool, since the initialized flag for the
+    input pool was used for this purpose.  To simplify things, we no
+    longer use the initialized flag for that purpose, nor do we use the
+    entropy_total field any more.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ instrumentation/events/lttng-module/random.h | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/random.h b/instrumentation/events/lttng-module/random.h
+index f165600..80b2279 100644
+--- a/instrumentation/events/lttng-module/random.h
++++ b/instrumentation/events/lttng-module/random.h
+@@ -38,6 +38,24 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(random__mix_pool_bytes, mix_pool_bytes_noloc
+ 	TP_ARGS(pool_name, bytes, IP)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,2,0))
++LTTNG_TRACEPOINT_EVENT_MAP(credit_entropy_bits,
++
++	random_credit_entropy_bits,
++
++	TP_PROTO(const char *pool_name, int bits, int entropy_count,
++		 unsigned long IP),
++
++	TP_ARGS(pool_name, bits, entropy_count, IP),
++
++	TP_FIELDS(
++		ctf_string(pool_name, pool_name)
++		ctf_integer(int, bits, bits)
++		ctf_integer(int, entropy_count, entropy_count)
++		ctf_integer(unsigned long, IP, IP)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_MAP(credit_entropy_bits,
+ 
+ 	random_credit_entropy_bits,
+@@ -55,6 +73,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(credit_entropy_bits,
+ 		ctf_integer(unsigned long, IP, IP)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_MAP(get_random_bytes,
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-Remove-start-and-number-from-syscall_get_argumen.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
new file mode 100644
index 0000000..d8206d0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
@@ -0,0 +1,259 @@
+From 9f70b60c19abc6dc0811e427ed5da4aa74620aca Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 9 Apr 2019 14:12:41 -0400
+Subject: [PATCH] Fix: Remove start and number from syscall_get_arguments()
+ args (v5.1)
+
+  commit b35f549df1d7520d37ba1e6d4a8d4df6bd52d136
+  Author: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
+  Date:   Mon Nov 7 16:26:37 2016 -0500
+
+    syscalls: Remove start and number from syscall_get_arguments() args
+
+    At Linux Plumbers, Andy Lutomirski approached me and pointed out that the
+    function call syscall_get_arguments() implemented in x86 was horribly
+    written and not optimized for the standard case of passing in 0 and 6 for
+    the starting index and the number of system calls to get. When looking at
+    all the users of this function, I discovered that all instances pass in only
+    0 and 6 for these arguments. Instead of having this function handle
+    different cases that are never used, simply rewrite it to return the first 6
+    arguments of a system call.
+
+    This should help out the performance of tracing system calls by ptrace,
+    ftrace and perf.
+
+    Link: http://lkml.kernel.org/r/20161107213233.754809394@goodmis.org
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ lttng-syscalls.c  | 57 ++++++++++++++++++++++++++++---------------------------
+ wrapper/syscall.h | 34 +++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 28 deletions(-)
+ create mode 100644 wrapper/syscall.h
+
+diff --git a/lttng-syscalls.c b/lttng-syscalls.c
+index bcc06b5..ebd9246 100644
+--- a/lttng-syscalls.c
++++ b/lttng-syscalls.c
+@@ -25,6 +25,7 @@
+ #include <wrapper/tracepoint.h>
+ #include <wrapper/file.h>
+ #include <wrapper/rcu.h>
++#include <wrapper/syscall.h>
+ #include <lttng-events.h>
+ 
+ #ifndef CONFIG_COMPAT
+@@ -361,9 +362,9 @@ struct lttng_syscall_filter {
+ static void syscall_entry_unknown(struct lttng_event *event,
+ 	struct pt_regs *regs, unsigned int id)
+ {
+-	unsigned long args[UNKNOWN_SYSCALL_NRARGS];
++	unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-	syscall_get_arguments(current, regs, 0, UNKNOWN_SYSCALL_NRARGS, args);
++	lttng_syscall_get_arguments(current, regs, args);
+ 	if (unlikely(in_compat_syscall()))
+ 		__event_probe__compat_syscall_entry_unknown(event, id, args);
+ 	else
+@@ -432,9 +433,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ 	case 1:
+ 	{
+ 		void (*fptr)(void *__data, unsigned long arg0) = entry->func;
+-		unsigned long args[1];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, args[0]);
+ 		break;
+ 	}
+@@ -443,9 +444,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ 		void (*fptr)(void *__data,
+ 			unsigned long arg0,
+ 			unsigned long arg1) = entry->func;
+-		unsigned long args[2];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, args[0], args[1]);
+ 		break;
+ 	}
+@@ -455,9 +456,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ 			unsigned long arg0,
+ 			unsigned long arg1,
+ 			unsigned long arg2) = entry->func;
+-		unsigned long args[3];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, args[0], args[1], args[2]);
+ 		break;
+ 	}
+@@ -468,9 +469,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ 			unsigned long arg1,
+ 			unsigned long arg2,
+ 			unsigned long arg3) = entry->func;
+-		unsigned long args[4];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, args[0], args[1], args[2], args[3]);
+ 		break;
+ 	}
+@@ -482,9 +483,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ 			unsigned long arg2,
+ 			unsigned long arg3,
+ 			unsigned long arg4) = entry->func;
+-		unsigned long args[5];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, args[0], args[1], args[2], args[3], args[4]);
+ 		break;
+ 	}
+@@ -497,9 +498,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ 			unsigned long arg3,
+ 			unsigned long arg4,
+ 			unsigned long arg5) = entry->func;
+-		unsigned long args[6];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, args[0], args[1], args[2],
+ 			args[3], args[4], args[5]);
+ 		break;
+@@ -512,9 +513,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
+ static void syscall_exit_unknown(struct lttng_event *event,
+ 	struct pt_regs *regs, int id, long ret)
+ {
+-	unsigned long args[UNKNOWN_SYSCALL_NRARGS];
++	unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-	syscall_get_arguments(current, regs, 0, UNKNOWN_SYSCALL_NRARGS, args);
++	lttng_syscall_get_arguments(current, regs, args);
+ 	if (unlikely(in_compat_syscall()))
+ 		__event_probe__compat_syscall_exit_unknown(event, id, ret,
+ 			args);
+@@ -588,9 +589,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
+ 		void (*fptr)(void *__data,
+ 			long ret,
+ 			unsigned long arg0) = entry->func;
+-		unsigned long args[1];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, ret, args[0]);
+ 		break;
+ 	}
+@@ -600,9 +601,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
+ 			long ret,
+ 			unsigned long arg0,
+ 			unsigned long arg1) = entry->func;
+-		unsigned long args[2];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, ret, args[0], args[1]);
+ 		break;
+ 	}
+@@ -613,9 +614,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
+ 			unsigned long arg0,
+ 			unsigned long arg1,
+ 			unsigned long arg2) = entry->func;
+-		unsigned long args[3];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, ret, args[0], args[1], args[2]);
+ 		break;
+ 	}
+@@ -627,9 +628,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
+ 			unsigned long arg1,
+ 			unsigned long arg2,
+ 			unsigned long arg3) = entry->func;
+-		unsigned long args[4];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, ret, args[0], args[1], args[2], args[3]);
+ 		break;
+ 	}
+@@ -642,9 +643,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
+ 			unsigned long arg2,
+ 			unsigned long arg3,
+ 			unsigned long arg4) = entry->func;
+-		unsigned long args[5];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, ret, args[0], args[1], args[2], args[3], args[4]);
+ 		break;
+ 	}
+@@ -658,9 +659,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
+ 			unsigned long arg3,
+ 			unsigned long arg4,
+ 			unsigned long arg5) = entry->func;
+-		unsigned long args[6];
++		unsigned long args[LTTNG_SYSCALL_NR_ARGS];
+ 
+-		syscall_get_arguments(current, regs, 0, entry->nrargs, args);
++		lttng_syscall_get_arguments(current, regs, args);
+ 		fptr(event, ret, args[0], args[1], args[2],
+ 			args[3], args[4], args[5]);
+ 		break;
+diff --git a/wrapper/syscall.h b/wrapper/syscall.h
+new file mode 100644
+index 0000000..8715f0c
+--- /dev/null
++++ b/wrapper/syscall.h
+@@ -0,0 +1,34 @@
++/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
++ *
++ * wrapper/syscall.h
++ *
++ * wrapper around asm/syscall.h.
++ *
++ * Copyright (C) 2019 Michael Jeanson <mjeanson@efficios.com>
++ */
++
++#ifndef _LTTNG_WRAPPER_SYSCALL_H
++#define _LTTNG_WRAPPER_SYSCALL_H
++
++#include <asm/syscall.h>
++#include <lttng-kernel-version.h>
++
++#define LTTNG_SYSCALL_NR_ARGS 6
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
++
++#define lttng_syscall_get_arguments(task, regs, args) \
++	syscall_get_arguments(task, regs, args)
++
++#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0) */
++
++static inline
++void lttng_syscall_get_arguments(struct task_struct *task,
++		struct pt_regs *regs, unsigned long *args)
++{
++	syscall_get_arguments(task, regs, 0, LTTNG_SYSCALL_NR_ARGS, args);
++}
++
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0) */
++
++#endif /* _LTTNG_WRAPPER_SYSCALL_H */
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
index 70a6843..964b875 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
@@ -15,6 +15,13 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch \
+           file://0002-fix-timer-trace-Improve-timer-tracing-v5.2.patch \
+           file://0003-Fix-pipe-stop-using-can_merge-v5.1.patch \
+           file://0004-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch \
+           file://0005-fix-mm-vmscan-drop-may_writepage-and-classzone_idx-f.patch \
+           file://0006-fix-random-only-read-from-dev-random-after-its-pool-.patch \
+           file://0007-Fix-Remove-start-and-number-from-syscall_get_argumen.patch \
            "
 
 SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
-- 
2.7.4


