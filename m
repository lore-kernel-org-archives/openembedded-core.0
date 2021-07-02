Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11928.1625242832205213805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043544"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043544"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:41 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776520"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/22] lttng-modules: update to v2.12.6
Date: Sat,  3 Jul 2021 00:20:04 +0800
Message-Id: <4c2c3d3b84d883b2f1ad94095187e6b5b39e663f.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To support building against v5.12+ and v5.13+ kernels, bumping to the
v2.12.6 lttng-release.

We drop the previously backported patches, and bring in the following
commits:

   0d8e4ab9 Version 2.12.6
   78f56ae3 fix: adjust ranges for RHEL 8.2 and 8.3
   4c996ea7 Disable block rwbs bitwise enum in default build
   4ac46085 Disable sched_switch bitwise enum in default build
   5e22c27b Add experimental bitwise enum config option
   937d307e Add defaults to Kconfig options
   4a114d43 Sync `show_inode_state()` macro with upstream stable kernels
   3bd6ac3e fix: block: remove disk_part_iter (v5.12)
   8bbb8c9d Fix: Backport of "Fix: increment buffer offset when failing to copy from user-space"
   30cddf69 Fix: increment buffer offset when failing to copy from user-space
   4733b9ab Sync `show_inode_state()` macro with Ubuntu 4.15 kernel
   ff21ec48 fix: mm, tracing: kfree event name mismatching with provider kmem (v5.12)
   b2b02c29 Set 'stable-2.12' branch in git review config
   00b42dbf fix backport: block: add a disk_uevent helper (v5.12)
   771ff089 fix: Adjust ranges for Ubuntu 5.4.0-67 kernel
   d8933959 fix: block: add a disk_uevent helper (v5.12)
   71034df1 Fix: properly compare type enumeration
   4d879d23 compiler warning cleanup: is_signed_type: compare -1 to 1
   fead3a9c Fix: bytecode linker: validate event and field array/sequence encoding
   92cc3e7f Fix: kretprobe: null ptr deref on session destroy
   49c603ef fix: mm, tracing: record slab name for kmem_cache_free() (v5.12)
   23a2f61f Fix: filter interpreter early-exits on uninitialized value
   b3fdf78b Fix: memory leaks on event destroy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2f027b8e2f842915a0ffdfd6c2c0597f3b02bce)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-Fix-memory-leaks-on-event-destroy.patch |  58 ----
 ...preter-early-exits-on-uninitialized-.patch | 159 ---------
 ...ecord-slab-name-for-kmem_cache_free-.patch |  91 ------
 ...be-null-ptr-deref-on-session-destroy.patch |  41 ---
 ...block-add-a-disk_uevent-helper-v5.12.patch | 305 ------------------
 ...block-add-a-disk_uevent-helper-v5.12.patch |  48 ---
 ...free-event-name-mismatching-with-pro.patch |  71 ----
 ...ules_2.12.5.bb => lttng-modules_2.12.6.bb} |   9 +-
 8 files changed, 1 insertion(+), 781 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.5.bb => lttng-modules_2.12.6.bb} (71%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
deleted file mode 100644
index 21da932a75..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From b3fdf78b15beb940918da1e41eb68e24ba31bb87 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Wed, 3 Mar 2021 10:10:16 -0500
-Subject: [PATCH 1/4] Fix: memory leaks on event destroy
-
-Both filter runtime and event enabler ref objects are owned by the
-event, but are not freed upon destruction of the event object, thus
-leaking memory.
-
-Upstream-status: backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ice9b1c18b47584838aea2b965494d3c8391f4c84
----
- lttng-events.c | 7 +++++++
- lttng-events.h | 1 +
- 2 files changed, 8 insertions(+)
-
-diff --git a/lttng-events.c b/lttng-events.c
-index f3398adc..984bd341 100644
---- a/lttng-events.c
-+++ b/lttng-events.c
-@@ -919,6 +919,8 @@ int _lttng_event_unregister(struct lttng_event *event)
- static
- void _lttng_event_destroy(struct lttng_event *event)
- {
-+	struct lttng_enabler_ref *enabler_ref, *tmp_enabler_ref;
-+
- 	switch (event->instrumentation) {
- 	case LTTNG_KERNEL_TRACEPOINT:
- 		lttng_event_put(event->desc);
-@@ -944,6 +946,11 @@ void _lttng_event_destroy(struct lttng_event *event)
- 	}
- 	list_del(&event->list);
- 	lttng_destroy_context(event->ctx);
-+	lttng_free_event_filter_runtime(event);
-+	/* Free event enabler refs */
-+	list_for_each_entry_safe(enabler_ref, tmp_enabler_ref,
-+				 &event->enablers_ref_head, node)
-+		kfree(enabler_ref);
- 	kmem_cache_free(event_cache, event);
- }
- 
-diff --git a/lttng-events.h b/lttng-events.h
-index 1b9ab167..13b6abf5 100644
---- a/lttng-events.h
-+++ b/lttng-events.h
-@@ -716,6 +716,7 @@ int lttng_enabler_attach_bytecode(struct lttng_enabler *enabler,
- 		struct lttng_kernel_filter_bytecode __user *bytecode);
- void lttng_enabler_event_link_bytecode(struct lttng_event *event,
- 		struct lttng_enabler *enabler);
-+void lttng_free_event_filter_runtime(struct lttng_event *event);
- 
- int lttng_probes_init(void);
- 
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
deleted file mode 100644
index 609690f05c..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From 23a2f61ffc6a656f136fa2044c0c3b8f79766779 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
- <jeremie.galarneau@efficios.com>
-Date: Wed, 3 Mar 2021 18:52:19 -0500
-Subject: [PATCH 2/4] Fix: filter interpreter early-exits on uninitialized
- value
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-I observed that syscall filtering on string arguments wouldn't work on
-my development machines, both running 5.11.2-arch1-1 (Arch Linux).
-
-For instance, enabling the tracing of the `openat()` syscall with the
-'filename == "/proc/cpuinfo"' filter would not produce events even
-though matching events were present in another session that had no
-filtering active. The same problem occurred with `execve()`.
-
-I tried a couple of kernel versions before (5.11.1 and 5.10.13, if
-memory serves me well) and I had the same problem. Meanwhile, I couldn't
-reproduce the problem on various Debian machines (the LTTng CI) nor on a
-fresh Ubuntu 20.04 with both the stock kernel and with an updated 5.11.2
-kernel.
-
-I built the lttng-modules with the interpreter debugging printout and
-saw the following warning:
-  LTTng: [debug bytecode in /home/jgalar/EfficiOS/src/lttng-modules/src/lttng-bytecode-interpreter.c:bytecode_interpret@1508] Bytecode warning: loading a NULL string.
-
-After a shedload (yes, a _shed_load) of digging, I figured that the
-problem was hidden in plain sight near that logging statement.
-
-In the `BYTECODE_OP_LOAD_FIELD_REF_USER_STRING` operation, the 'ax'
-register's 'user_str' is initialized with the stack value (the user
-space string's address in our case). However, a NULL check is performed
-against the register's 'str' member.
-
-I initialy suspected that both members would be part of the same union
-and alias each-other, but they are actually contiguous in a structure.
-
-On the unaffected machines, I could confirm that the `str` member was
-uninitialized to a non-zero value causing the condition to evaluate to
-false.
-
-Francis Deslauriers reproduced the problem by initializing the
-interpreter stack to zero.
-
-I am unsure of the exact kernel configuration option that reveals this
-issue on Arch Linux, but my kernel has the following option enabled:
-
-CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL:
-   Zero-initialize any stack variables that may be passed by reference
-   and had not already been explicitly initialized. This is intended to
-   eliminate all classes of uninitialized stack variable exploits and
-   information exposures.
-
-I have not tried to build without this enabled as, anyhow, this seems
-to be a legitimate issue.
-
-I have spotted what appears to be an identical problem in
-`BYTECODE_OP_LOAD_FIELD_REF_USER_SEQUENCE` and corrected it. However,
-I have not exercised that code path.
-
-The commit that introduced this problem is 5b4ad89.
-
-The debug print-out of the `BYTECODE_OP_LOAD_FIELD_REF_USER_STRING`
-operation is modified to print the user string (truncated to 31 chars).
-
-Upstream-status: backport
-
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I2da3c31b9e3ce0e1b164cf3d2711c0893cbec273
----
- lttng-filter-interpreter.c | 41 ++++++++++++++++++++++++++++++++++----
- 1 file changed, 37 insertions(+), 4 deletions(-)
-
-diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
-index 5d572437..6e5a5139 100644
---- a/lttng-filter-interpreter.c
-+++ b/lttng-filter-interpreter.c
-@@ -22,7 +22,7 @@ LTTNG_STACK_FRAME_NON_STANDARD(lttng_filter_interpret_bytecode);
-  * to handle user-space read.
-  */
- static
--char get_char(struct estack_entry *reg, size_t offset)
-+char get_char(const struct estack_entry *reg, size_t offset)
- {
- 	if (unlikely(offset >= reg->u.s.seq_len))
- 		return '\0';
-@@ -593,6 +593,39 @@ end:
- 	return ret;
- }
- 
-+#ifdef DEBUG
-+
-+#define DBG_USER_STR_CUTOFF 32
-+
-+/*
-+ * In debug mode, print user string (truncated, if necessary).
-+ */
-+static inline
-+void dbg_load_ref_user_str_printk(const struct estack_entry *user_str_reg)
-+{
-+	size_t pos = 0;
-+	char last_char;
-+	char user_str[DBG_USER_STR_CUTOFF];
-+
-+	pagefault_disable();
-+	do {
-+		last_char = get_char(user_str_reg, pos);
-+		user_str[pos] = last_char;
-+		pos++;
-+	} while (last_char != '\0' && pos < sizeof(user_str));
-+	pagefault_enable();
-+
-+	user_str[sizeof(user_str) - 1] = '\0';
-+	dbg_printk("load field ref user string: '%s%s'\n", user_str,
-+		last_char != '\0' ? "[...]" : "");
-+}
-+#else
-+static inline
-+void dbg_load_ref_user_str_printk(const struct estack_entry *user_str_reg)
-+{
-+}
-+#endif
-+
- /*
-  * Return 0 (discard), or raise the 0x1 flag (log event).
-  * Currently, other flags are kept for future extensions and have no
-@@ -1313,7 +1346,7 @@ uint64_t lttng_filter_interpret_bytecode(void *filter_data,
- 			estack_push(stack, top, ax, bx);
- 			estack_ax(stack, top)->u.s.user_str =
- 				*(const char * const *) &filter_stack_data[ref->offset];
--			if (unlikely(!estack_ax(stack, top)->u.s.str)) {
-+			if (unlikely(!estack_ax(stack, top)->u.s.user_str)) {
- 				dbg_printk("Filter warning: loading a NULL string.\n");
- 				ret = -EINVAL;
- 				goto end;
-@@ -1322,7 +1355,7 @@ uint64_t lttng_filter_interpret_bytecode(void *filter_data,
- 			estack_ax(stack, top)->u.s.literal_type =
- 				ESTACK_STRING_LITERAL_TYPE_NONE;
- 			estack_ax(stack, top)->u.s.user = 1;
--			dbg_printk("ref load string %s\n", estack_ax(stack, top)->u.s.str);
-+			dbg_load_ref_user_str_printk(estack_ax(stack, top));
- 			next_pc += sizeof(struct load_op) + sizeof(struct field_ref);
- 			PO;
- 		}
-@@ -1340,7 +1373,7 @@ uint64_t lttng_filter_interpret_bytecode(void *filter_data,
- 			estack_ax(stack, top)->u.s.user_str =
- 				*(const char **) (&filter_stack_data[ref->offset
- 								+ sizeof(unsigned long)]);
--			if (unlikely(!estack_ax(stack, top)->u.s.str)) {
-+			if (unlikely(!estack_ax(stack, top)->u.s.user_str)) {
- 				dbg_printk("Filter warning: loading a NULL sequence.\n");
- 				ret = -EINVAL;
- 				goto end;
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
deleted file mode 100644
index 71f99b80a3..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 49c603ef2dc6969f4454f0d849af00ee24bb7f04 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Thu, 4 Mar 2021 16:50:12 -0500
-Subject: [PATCH 3/4] fix: mm, tracing: record slab name for kmem_cache_free()
- (v5.12)
-
-See upstream commit:
-
-  commit 3544de8ee6e4817278b15fe08658de49abf58954
-  Author: Jacob Wen <jian.w.wen@oracle.com>
-  Date:   Wed Feb 24 12:00:55 2021 -0800
-
-    mm, tracing: record slab name for kmem_cache_free()
-
-    Currently, a trace record generated by the RCU core is as below.
-
-    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=00000000f3b49a66
-
-    It doesn't tell us what the RCU core has freed.
-
-    This patch adds the slab name to trace_kmem_cache_free().
-    The new format is as follows.
-
-    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=0000000037f79c8d name=dentry
-    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=00000000f78cb7b5 name=sock_inode_cache
-    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=0000000018768985 name=pool_workqueue
-    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=000000006a6cb484 name=radix_tree_node
-
-    We can use it to understand what the RCU core is going to free. For
-    example, some users maybe interested in when the RCU core starts
-    freeing reclaimable slabs like dentry to reduce memory pressure.
-
-    Link: https://lkml.kernel.org/r/20201216072804.8838-1-jian.w.wen@oracle.com
-
-Upstream-status: backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I1ee2fc476614cadcc8d3ac5d8feddc7910e1aa3a
----
- instrumentation/events/lttng-module/kmem.h | 27 ++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
-
-diff --git a/instrumentation/events/lttng-module/kmem.h b/instrumentation/events/lttng-module/kmem.h
-index b134620a..d787ea54 100644
---- a/instrumentation/events/lttng-module/kmem.h
-+++ b/instrumentation/events/lttng-module/kmem.h
-@@ -87,6 +87,32 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
- 	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags, node)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0))
-+LTTNG_TRACEPOINT_EVENT(kfree,
-+
-+	TP_PROTO(unsigned long call_site, const void *ptr),
-+
-+	TP_ARGS(call_site, ptr),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(unsigned long, call_site, call_site)
-+		ctf_integer_hex(const void *, ptr, ptr)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
-+
-+	TP_PROTO(unsigned long call_site, const void *ptr, const char *name),
-+
-+	TP_ARGS(call_site, ptr, name),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(unsigned long, call_site, call_site)
-+		ctf_integer_hex(const void *, ptr, ptr)
-+		ctf_string(name, name)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(kmem_free,
- 
- 	TP_PROTO(unsigned long call_site, const void *ptr),
-@@ -114,6 +140,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_free, kmem_cache_free,
- 
- 	TP_ARGS(call_site, ptr)
- )
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,3,0))
- LTTNG_TRACEPOINT_EVENT_MAP(mm_page_free, kmem_mm_page_free,
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch
deleted file mode 100644
index 8a839c2b43..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 92cc3e7f76a545a2cd4828576971f1eea83f4e68 Mon Sep 17 00:00:00 2001
-From: Francis Deslauriers <francis.deslauriers@efficios.com>
-Date: Wed, 17 Mar 2021 10:40:56 -0400
-Subject: [PATCH 4/4] Fix: kretprobe: null ptr deref on session destroy
-
-The `filter_bytecode_runtime_head` list is currently not initialized for
-the return event of the kretprobe. This caused a kernel null ptr
-dereference when destroying a session. It can reproduced with the
-following commands:
-
-  lttng create
-  lttng enable-event -k --function=lttng_test_filter_event_write my_event
-  lttng start
-  lttng stop
-  lttng destroy
-
-Upstream-status: backport 
-
-Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I1162ce8b10dd7237a26331531f048346b984eee7
----
- lttng-events.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lttng-events.c b/lttng-events.c
-index 984bd341..3450fa40 100644
---- a/lttng-events.c
-+++ b/lttng-events.c
-@@ -704,6 +704,8 @@ struct lttng_event *_lttng_event_create(struct lttng_channel *chan,
- 		event_return->enabled = 0;
- 		event_return->registered = 1;
- 		event_return->instrumentation = itype;
-+		INIT_LIST_HEAD(&event_return->bytecode_runtime_head);
-+		INIT_LIST_HEAD(&event_return->enablers_ref_head);
- 		/*
- 		 * Populate lttng_event structure before kretprobe registration.
- 		 */
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
deleted file mode 100644
index 3a2280ccdc..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
+++ /dev/null
@@ -1,305 +0,0 @@
-From 17cd2dc91cb82ed342b0da699f2b1a70c1bf6a03 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 15 Mar 2021 14:54:02 -0400
-Subject: [PATCH 2/4] fix: block: add a disk_uevent helper (v5.12)
-
-See upstream commit:
-
-  commit bc359d03c7ec1bf3b86d03bafaf6bbb21e6414fd
-  Author: Christoph Hellwig <hch@lst.de>
-  Date:   Sun Jan 24 11:02:39 2021 +0100
-
-    block: add a disk_uevent helper
-
-    Add a helper to call kobject_uevent for the disk and all partitions, and
-    unexport the disk_part_iter_* helpers that are now only used in the core
-    block code.
-
-Upstream-status: Backport [2.12.6]
-
-Change-Id: If6e8797049642ab382d5699660ee1dd734e92c90
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- Makefile               |   1 +
- lttng-statedump-impl.c |  34 +++++++++----
- src/wrapper/genhd.c    | 111 +++++++++++++++++++++++++++++++++++++++++
- wrapper/genhd.h        |  62 +++++++++++++++++++++++
- 4 files changed, 198 insertions(+), 10 deletions(-)
- create mode 100644 src/wrapper/genhd.c
-
-diff --git a/Makefile b/Makefile
-index a9aff3f1..34043cfb 100644
---- a/Makefile
-+++ b/Makefile
-@@ -80,6 +80,7 @@ ifneq ($(KERNELRELEASE),)
-                         wrapper/kallsyms.o \
-                         wrapper/irqdesc.o \
-                         wrapper/fdtable.o \
-+                        wrapper/genhd.o \
-                         lttng-wrapper-impl.o
- 
-   ifneq ($(CONFIG_HAVE_SYSCALL_TRACEPOINTS),)
-diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
-index 60b937c9..5511c7e8 100644
---- a/lttng-statedump-impl.c
-+++ b/lttng-statedump-impl.c
-@@ -250,13 +250,17 @@ int lttng_enumerate_block_devices(struct lttng_session *session)
- 	struct device_type *ptr_disk_type;
- 	struct class_dev_iter iter;
- 	struct device *dev;
-+	int ret = 0;
- 
- 	ptr_block_class = wrapper_get_block_class();
--	if (!ptr_block_class)
--		return -ENOSYS;
-+	if (!ptr_block_class) {
-+		ret = -ENOSYS;
-+		goto end;
-+	}
- 	ptr_disk_type = wrapper_get_disk_type();
- 	if (!ptr_disk_type) {
--		return -ENOSYS;
-+		ret = -ENOSYS;
-+		goto end;
- 	}
- 	class_dev_iter_init(&iter, ptr_block_class, NULL, ptr_disk_type);
- 	while ((dev = class_dev_iter_next(&iter))) {
-@@ -272,22 +276,32 @@ int lttng_enumerate_block_devices(struct lttng_session *session)
- 		    (disk->flags & GENHD_FL_SUPPRESS_PARTITION_INFO))
- 			continue;
- 
--		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
--		while ((part = disk_part_iter_next(&piter))) {
-+		/*
-+		 * The original 'disk_part_iter_init' returns void, but our
-+		 * wrapper can fail to lookup the original symbol.
-+		 */
-+		if (wrapper_disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0) < 0) {
-+			ret = -ENOSYS;
-+			goto iter_exit;
-+		}
-+
-+		while ((part = wrapper_disk_part_iter_next(&piter))) {
- 			char name_buf[BDEVNAME_SIZE];
- 
- 			if (lttng_get_part_name(disk, part, name_buf) == -ENOSYS) {
--				disk_part_iter_exit(&piter);
--				class_dev_iter_exit(&iter);
--				return -ENOSYS;
-+				wrapper_disk_part_iter_exit(&piter);
-+				ret = -ENOSYS;
-+				goto iter_exit;
- 			}
- 			trace_lttng_statedump_block_device(session,
- 					lttng_get_part_devt(part), name_buf);
- 		}
--		disk_part_iter_exit(&piter);
-+		wrapper_disk_part_iter_exit(&piter);
- 	}
-+iter_exit:
- 	class_dev_iter_exit(&iter);
--	return 0;
-+end:
-+	return ret;
- }
- 
- #ifdef CONFIG_INET
-diff --git a/src/wrapper/genhd.c b/src/wrapper/genhd.c
-new file mode 100644
-index 00000000..a5a6c410
---- /dev/null
-+++ b/src/wrapper/genhd.c
-@@ -0,0 +1,111 @@
-+/* SPDX-License-Identifier: (GPL-2.0-only OR LGPL-2.1-only)
-+ *
-+ * wrapper/genhd.c
-+ *
-+ * Wrapper around disk_part_iter_(init|next|exit). Using KALLSYMS to get the
-+ * addresses when available, else we need to have a kernel that exports this
-+ * function to GPL modules. This export was removed in 5.12.
-+ *
-+ * Copyright (C) 2021 Michael Jeanson <mjeanson@efficios.com>
-+ */
-+
-+#include <lttng/kernel-version.h>
-+#include <linux/module.h>
-+#include <wrapper/genhd.h>
-+
-+#if (defined(CONFIG_KALLSYMS) && \
-+	(LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0)))
-+
-+#include <wrapper/kallsyms.h>
-+
-+static
-+void (*disk_part_iter_init_sym)(struct disk_part_iter *piter, struct gendisk *disk,
-+			unsigned int flags);
-+
-+static
-+LTTNG_DISK_PART_TYPE *(*disk_part_iter_next_sym)(struct disk_part_iter *piter);
-+
-+static
-+void (*disk_part_iter_exit_sym)(struct disk_part_iter *piter);
-+
-+/*
-+ * This wrapper has an 'int' return type instead of the original 'void', to be
-+ * able to report the symbol lookup failure to the caller.
-+ *
-+ * Return 0 on success, -1 on error.
-+ */
-+int wrapper_disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
-+                          unsigned int flags)
-+{
-+	if (!disk_part_iter_init_sym)
-+		disk_part_iter_init_sym = (void *) kallsyms_lookup_funcptr("disk_part_iter_init");
-+
-+	if (disk_part_iter_init_sym) {
-+		disk_part_iter_init_sym(piter, disk, flags);
-+	} else {
-+		printk_once(KERN_WARNING "LTTng: disk_part_iter_init symbol lookup failed.\n");
-+		return -1;
-+	}
-+	return 0;
-+}
-+EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_init);
-+
-+LTTNG_DISK_PART_TYPE *wrapper_disk_part_iter_next(struct disk_part_iter *piter)
-+{
-+	if (!disk_part_iter_next_sym)
-+		disk_part_iter_next_sym = (void *) kallsyms_lookup_funcptr("disk_part_iter_next");
-+
-+	if (disk_part_iter_next_sym) {
-+		return disk_part_iter_next_sym(piter);
-+	} else {
-+		printk_once(KERN_WARNING "LTTng: disk_part_iter_next symbol lookup failed.\n");
-+		return NULL;
-+	}
-+}
-+EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_next);
-+
-+/*
-+ * We don't return an error on symbol lookup failure here because there is
-+ * nothing the caller can do to cleanup the iterator.
-+ */
-+void wrapper_disk_part_iter_exit(struct disk_part_iter *piter)
-+{
-+	if (!disk_part_iter_exit_sym)
-+		disk_part_iter_exit_sym = (void *) kallsyms_lookup_funcptr("disk_part_iter_exit");
-+
-+	if (disk_part_iter_exit_sym) {
-+		disk_part_iter_exit_sym(piter);
-+	} else {
-+		printk_once(KERN_WARNING "LTTng: disk_part_iter_exit symbol lookup failed.\n");
-+	}
-+}
-+EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_exit);
-+
-+#else
-+
-+/*
-+ * This wrapper has an 'int' return type instead of the original 'void', so the
-+ * kallsyms variant can report the symbol lookup failure to the caller.
-+ *
-+ * This variant always succeeds and returns 0.
-+ */
-+int wrapper_disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
-+                          unsigned int flags)
-+{
-+	disk_part_iter_init(piter, disk, flags);
-+	return 0;
-+}
-+EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_init);
-+
-+LTTNG_DISK_PART_TYPE *wrapper_disk_part_iter_next(struct disk_part_iter *piter)
-+{
-+	return disk_part_iter_next(piter);
-+}
-+EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_next);
-+
-+void wrapper_disk_part_iter_exit(struct disk_part_iter *piter)
-+{
-+	disk_part_iter_exit(piter);
-+}
-+EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_exit);
-+#endif
-diff --git a/wrapper/genhd.h b/wrapper/genhd.h
-index 98feb57b..6bae239d 100644
---- a/wrapper/genhd.h
-+++ b/wrapper/genhd.h
-@@ -13,6 +13,13 @@
- #define _LTTNG_WRAPPER_GENHD_H
- 
- #include <linux/genhd.h>
-+#include <lttng/kernel-version.h>
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
-+#define LTTNG_DISK_PART_TYPE struct block_device
-+#else
-+#define LTTNG_DISK_PART_TYPE struct hd_struct
-+#endif
- 
- #ifdef CONFIG_KALLSYMS_ALL
- 
-@@ -94,4 +101,59 @@ struct device_type *wrapper_get_disk_type(void)
- 
- #endif
- 
-+/*
-+ * This wrapper has an 'int' return type instead of the original 'void', to be
-+ * able to report the symbol lookup failure to the caller.
-+ *
-+ * Return 0 on success, -1 on error.
-+ */
-+int wrapper_disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
-+                          unsigned int flags);
-+LTTNG_DISK_PART_TYPE *wrapper_disk_part_iter_next(struct disk_part_iter *piter);
-+void wrapper_disk_part_iter_exit(struct disk_part_iter *piter);
-+
-+/*
-+ * Canary function to check for 'disk_part_iter_init()' at compile time.
-+ *
-+ * From 'include/linux/genhd.h':
-+ *
-+ *   extern void disk_part_iter_init(struct disk_part_iter *piter,
-+ *                                   struct gendisk *disk, unsigned int flags);
-+ *
-+ */
-+static inline
-+void __canary__disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
-+		unsigned int flags)
-+{
-+	disk_part_iter_init(piter, disk, flags);
-+}
-+
-+/*
-+ * Canary function to check for 'disk_part_iter_next()' at compile time.
-+ *
-+ * From 'include/linux/genhd.h':
-+ *
-+ *   struct block_device *disk_part_iter_next(struct disk_part_iter *piter);
-+ *
-+ */
-+static inline
-+LTTNG_DISK_PART_TYPE *__canary__disk_part_iter_next(struct disk_part_iter *piter)
-+{
-+	return disk_part_iter_next(piter);
-+}
-+
-+/*
-+ * Canary function to check for 'disk_part_iter_exit()' at compile time.
-+ *
-+ * From 'include/linux/genhd.h':
-+ *
-+ *   extern void disk_part_iter_exit(struct disk_part_iter *piter);
-+ *
-+ */
-+static inline
-+void __canary__disk_part_iter_exit(struct disk_part_iter *piter)
-+{
-+	return disk_part_iter_exit(piter);
-+}
-+
- #endif /* _LTTNG_WRAPPER_GENHD_H */
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
deleted file mode 100644
index e32b3e7a2e..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 127135b6a45d5fca828815c62308f72de97e5739 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Thu, 15 Apr 2021 13:56:24 -0400
-Subject: [PATCH 3/4] fix backport: block: add a disk_uevent helper (v5.12)
-
-Upstream-Status: Backport [2.12.6]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I717162069990577abe78e5e7fed28816f32b2c84
----
- {src/wrapper => wrapper}/genhd.c | 2 +-
- wrapper/genhd.h                  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
- rename {src/wrapper => wrapper}/genhd.c (98%)
-
-diff --git a/src/wrapper/genhd.c b/wrapper/genhd.c
-similarity index 98%
-rename from src/wrapper/genhd.c
-rename to wrapper/genhd.c
-index a5a6c410..cbec06f7 100644
---- a/src/wrapper/genhd.c
-+++ b/wrapper/genhd.c
-@@ -9,7 +9,7 @@
-  * Copyright (C) 2021 Michael Jeanson <mjeanson@efficios.com>
-  */
- 
--#include <lttng/kernel-version.h>
-+#include <lttng-kernel-version.h>
- #include <linux/module.h>
- #include <wrapper/genhd.h>
- 
-diff --git a/wrapper/genhd.h b/wrapper/genhd.h
-index 6bae239d..1b4a4201 100644
---- a/wrapper/genhd.h
-+++ b/wrapper/genhd.h
-@@ -13,7 +13,7 @@
- #define _LTTNG_WRAPPER_GENHD_H
- 
- #include <linux/genhd.h>
--#include <lttng/kernel-version.h>
-+#include <lttng-kernel-version.h>
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
- #define LTTNG_DISK_PART_TYPE struct block_device
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch
deleted file mode 100644
index dfc9427dca..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 853d5903a200d8a15b3f38780ddaea5c92fa1a03 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Mon, 19 Apr 2021 09:09:28 +0000
-Subject: [PATCH 4/4] fix: mm, tracing: kfree event name mismatching with
- provider kmem (v5.12)
-
-a8bc8ae5c932 ("fix: mm, tracing: record slab name for kmem_cache_free() (v5.12)")
-introduces the following call trace for kfree. This is caused by mismatch
-between kfree event and its provider kmem.
-
-This patch maps kfree to kmem_kfree.
-
-WARNING: CPU: 2 PID: 42294 at src/lttng-probes.c:81 fixup_lazy_probes+0xb0/0x1b0 [lttng_tracer]
-CPU: 2 PID: 42294 Comm: modprobe Tainted: G           O      5.12.0-rc6-yoctodev-standard #1
-Hardware name: Intel Corporation JACOBSVILLE/JACOBSVILLE, BIOS JBVLCRB2.86B.0014.P20.2004020248 04/02/2020
-RIP: 0010:fixup_lazy_probes+0xb0/0x1b0 [lttng_tracer]
-Code: 75 28 83 c3 01 3b 5d c4 74 22 48 8b 4d d0 48 63
-      c3 4c 89 e2 4c 89 f6 48 8b 04 c1 4c 8b 38 4c 89
-      ff e8 64 9f 4b de 85 c0 74 c3 <0f> 0b 48 8b 05 bf
-      f2 1e 00 48 8d 50 e8 48 3d f0 a0 98 c0 75 18 eb
-RSP: 0018:ffffb976807bfbe0 EFLAGS: 00010286
-RAX: 00000000ffffffff RBX: 0000000000000004 RCX: 0000000000000004
-RDX: 0000000000000066 RSI: ffffffffc03c10a7 RDI: ffffffffc03c11a1
-RBP: ffffb976807bfc28 R08: 0000000000000000 R09: 0000000000000001
-R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000004
-R13: ffffffffc03c2000 R14: ffffffffc03c10a7 R15: ffffffffc03c11a1
-FS:  00007f0ef9533740(0000) GS:ffffa100faa00000(0000) knlGS:0000000000000000
-CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
-CR2: 0000561e8f0aa000 CR3: 000000015b318000 CR4: 0000000000350ee0
-Call Trace:
- lttng_probe_register+0x38/0xe0 [lttng_tracer]
- ? __event_probe__module_load+0x520/0x520 [lttng_probe_module]
- __lttng_events_init__module+0x15/0x20 [lttng_probe_module]
- do_one_initcall+0x68/0x310
- ? kmem_cache_alloc_trace+0x2ad/0x4c0
- ? do_init_module+0x28/0x280
- do_init_module+0x62/0x280
- load_module+0x26e4/0x2920
- ? kernel_read_file+0x22e/0x290
- __do_sys_finit_module+0xb1/0xf0
- __x64_sys_finit_module+0x1a/0x20
- do_syscall_64+0x38/0x50
- entry_SYSCALL_64_after_hwframe+0x44/0xae
-
-Upstream-Status: Backport [2.12.6]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I00e8ee2b8c35f6f8602c88295f5113fbbd139709
----
- instrumentation/events/lttng-module/kmem.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/kmem.h b/instrumentation/events/lttng-module/kmem.h
-index d787ea54..c9edee61 100644
---- a/instrumentation/events/lttng-module/kmem.h
-+++ b/instrumentation/events/lttng-module/kmem.h
-@@ -88,7 +88,9 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
- )
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0))
--LTTNG_TRACEPOINT_EVENT(kfree,
-+LTTNG_TRACEPOINT_EVENT_MAP(kfree,
-+
-+	kmem_kfree,
- 
- 	TP_PROTO(unsigned long call_site, const void *ptr),
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
similarity index 71%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
index 1a01cb0c01..1dff2b05f7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb
@@ -11,16 +11,9 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           file://0001-Fix-memory-leaks-on-event-destroy.patch \
-           file://0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch  \
-           file://0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch \
-           file://0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch \
-           file://0005-fix-block-add-a-disk_uevent-helper-v5.12.patch \
-           file://0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch \
-           file://0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch \
            "
 
-SRC_URI[sha256sum] = "c4d1a1b42c728e37b6b7947ae16563a011c4b297311aa04d56f9a1791fb5a30a"
+SRC_URI[sha256sum] = "95ac2a2cf92d85d23ffbdaca6a1ec0d7c167211d1e0fb850ab90004a3f475eaa"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.31.1

