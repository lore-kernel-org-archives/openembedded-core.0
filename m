Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 May 2019 04:08:34 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 806DD6C4D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 04:08:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 21:01:28 -0700
X-ExtLoop1: 1
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by fmsmga005.fm.intel.com with ESMTP; 16 May 2019 21:01:26 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 12:02:19 +0800
Message-Id: <20190517040219.8946-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [master][warrior][PATCH] lttng-modules: Fix build errors for kernel v5.1
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
X-List-Received-Date: Fri, 17 May 2019 04:08:34 -0000

Backport patches from upstream to fix build errors when building with
kernel v5.1.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...-create-the-new-vm_fault_t-type-v5.1.patch |  66 +++++
 ...rapper-definitions-for-obsolete-RCU..patch |  48 ++++
 ...3-Fix-pipe-stop-using-can_merge-v5.1.patch |  43 +++
 ...ert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch |  52 ++++
 ...-and-number-from-syscall_get_argumen.patch | 260 ++++++++++++++++++
 .../lttng/lttng-modules_2.10.9.bb             |   5 +
 6 files changed, 474 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
new file mode 100644
index 0000000000..12e32e8452
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch
@@ -0,0 +1,66 @@
+From 55026979d71852aa2cf5e19bb4adb2db98affd1e Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:32 -0400
+Subject: [PATCH 1/5] Fix: mm: create the new vm_fault_t type (v5.1)
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
+Upstream-Status: Backport [http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2ca0c84f0b4a915c555a0b83102d94ac941619ca]
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/ringbuffer/ring_buffer_mmap.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ringbuffer/ring_buffer_mmap.c b/lib/ringbuffer/ring_buffer_mmap.c
+index 4b1b7b3..6592a82 100644
+--- a/lib/ringbuffer/ring_buffer_mmap.c
++++ b/lib/ringbuffer/ring_buffer_mmap.c
+@@ -32,7 +32,11 @@
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
+@@ -65,7 +69,13 @@ static int lib_ring_buffer_fault_compat(struct vm_area_struct *vma, struct vm_fa
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
+2.17.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
new file mode 100644
index 0000000000..9d7fcf217a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch
@@ -0,0 +1,48 @@
+From 68f073a5cdd89f905cb39895f5c2f160a6585672 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:33 -0400
+Subject: [PATCH 2/5] Fix: rcu: Remove wrapper definitions for obsolete RCU...
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
+Upstream-Status: Backport [http://git.lttng.org/?p=lttng-modules.git;a=commit;h=92da05ce1f73488a57e7fd79e9c03113cefdb76f]
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lttng-events.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lttng-events.c b/lttng-events.c
+index 47431ca..3481bd4 100644
+--- a/lttng-events.c
++++ b/lttng-events.c
+@@ -89,7 +89,12 @@ int _lttng_field_statedump(struct lttng_session *session,
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
+2.17.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
new file mode 100644
index 0000000000..bc028537fd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-pipe-stop-using-can_merge-v5.1.patch
@@ -0,0 +1,43 @@
+From 9a203973ad3cbefb67a6032fd66e746d19b2d1c3 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:34 -0400
+Subject: [PATCH 3/5] Fix: pipe: stop using ->can_merge (v5.1)
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
+Upstream-Status: Backport [http://git.lttng.org/?p=lttng-modules.git;a=commit;h=d6cd2c9598a06f0ba1ba885bbe754e8836528310]
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lib/ringbuffer/ring_buffer_splice.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ringbuffer/ring_buffer_splice.c b/lib/ringbuffer/ring_buffer_splice.c
+index 8d14666..93cad29 100644
+--- a/lib/ringbuffer/ring_buffer_splice.c
++++ b/lib/ringbuffer/ring_buffer_splice.c
+@@ -56,7 +56,9 @@ static void lib_ring_buffer_pipe_buf_release(struct pipe_inode_info *pipe,
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
+2.17.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
new file mode 100644
index 0000000000..0e0ab76509
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch
@@ -0,0 +1,52 @@
+From f65f074de41fcc2c176397d54947f5ae2104671b Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 18 Mar 2019 16:20:35 -0400
+Subject: [PATCH 4/5] Fix: Revert "KVM: MMU: show mmu_valid_gen..." (v5.1)
+
+See upstream commit :
+
+  commit b59c4830ca185ba0e9f9e046fb1cd10a4a92627a
+  Author: Sean Christopherson <sean.j.christopherson@intel.com>
+  Date:   Tue Feb 5 13:01:30 2019 -0800
+
+    Revert "KVM: MMU: show mmu_valid_gen in shadow page related tracepoints"
+
+    ...as part of removing x86 KVM's fast invalidate mechanism, i.e. this
+    is one part of a revert all patches from the series that introduced the
+    mechanism[1].
+
+    This reverts commit 2248b023219251908aedda0621251cffc548f258.
+
+Upstream-Status: Backport [http://git.lttng.org/?p=lttng-modules.git;a=commit;h=8a88382fb09bbeda443044ee8cdb8f92040636bc]
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ .../events/lttng-module/arch/x86/kvm/mmutrace.h        | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
+index e3f7abd..71e8b34 100644
+--- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
++++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
+@@ -13,7 +13,15 @@
+ #undef TRACE_SYSTEM
+ #define TRACE_SYSTEM kvm_mmu
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,1,0))
++
++#define LTTNG_KVM_MMU_PAGE_FIELDS \
++	ctf_integer(__u64, gfn, (sp)->gfn) \
++	ctf_integer(__u32, role, (sp)->role.word) \
++	ctf_integer(__u32, root_count, (sp)->root_count) \
++	ctf_integer(bool, unsync, (sp)->unsync)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
+ 
+ #define LTTNG_KVM_MMU_PAGE_FIELDS \
+ 	ctf_integer(unsigned long, mmu_valid_gen, (sp)->mmu_valid_gen) \
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
new file mode 100644
index 0000000000..53583abaa0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch
@@ -0,0 +1,260 @@
+From bd3fb656df0fedb0f87d1ef3690260a1d4b135e5 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 9 Apr 2019 14:12:41 -0400
+Subject: [PATCH 5/5] Fix: Remove start and number from syscall_get_arguments()
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
+Upstream-Status: Backport [http://git.lttng.org/?p=lttng-modules.git;a=commit;h=1b7b9c650ebb94358365512199559b0ece3e657c]
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ lttng-syscalls.c  | 57 ++++++++++++++++++++++++-----------------------
+ wrapper/syscall.h | 34 ++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 28 deletions(-)
+ create mode 100644 wrapper/syscall.h
+
+diff --git a/lttng-syscalls.c b/lttng-syscalls.c
+index 0b980a1..c9dc275 100644
+--- a/lttng-syscalls.c
++++ b/lttng-syscalls.c
+@@ -38,6 +38,7 @@
+ #include <wrapper/tracepoint.h>
+ #include <wrapper/file.h>
+ #include <wrapper/rcu.h>
++#include <wrapper/syscall.h>
+ #include <lttng-events.h>
+ 
+ #ifndef CONFIG_COMPAT
+@@ -374,9 +375,9 @@ struct lttng_syscall_filter {
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
+@@ -445,9 +446,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -456,9 +457,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -468,9 +469,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -481,9 +482,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -495,9 +496,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -510,9 +511,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -525,9 +526,9 @@ void syscall_entry_probe(void *__data, struct pt_regs *regs, long id)
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
+@@ -601,9 +602,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
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
+@@ -613,9 +614,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
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
+@@ -626,9 +627,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
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
+@@ -640,9 +641,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
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
+@@ -655,9 +656,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
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
+@@ -671,9 +672,9 @@ void syscall_exit_probe(void *__data, struct pt_regs *regs, long ret)
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
+2.17.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
index 70a6843263..417c8b1724 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
@@ -15,6 +15,11 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-Fix-mm-create-the-new-vm_fault_t-type-v5.1.patch \
+           file://0002-Fix-rcu-Remove-wrapper-definitions-for-obsolete-RCU..patch \
+           file://0003-Fix-pipe-stop-using-can_merge-v5.1.patch \
+           file://0004-Fix-Revert-KVM-MMU-show-mmu_valid_gen.-v5.1.patch \
+           file://0005-Fix-Remove-start-and-number-from-syscall_get_argumen.patch \
            "
 
 SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
-- 
2.17.0


