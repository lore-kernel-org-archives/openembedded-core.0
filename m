Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.1705.1616180326617538654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SUQBcA0M;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id h7so7562774qtx.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NTMT7duYNhavb1SmNY4Y9fDXpzVVR+JdmgoWkI0di6Y=;
        b=SUQBcA0M7j0gQLRwri095PiNMdnGt9ZFvMdoaru1Ahsf++dKAq0Rp5FSpSkmW8p9pc
         TeZHoil3XArY7Y30lSPTecQcqyFSAnNJDkZHpMq0SVEx7NH8ygyY+P5fJfWYQkFZ1d3K
         sXP3JW6Nz3spexwY6aSkMA9BXQPVBslSAewo1sRS3j+Ot9Cz4C6r5oV/Fi45QkprpVKJ
         KXxfLRvfuWQ3ebuoYuhhZd+v1f5A4nfuSkDZcGx3zzn4MnaRR68wHRT0ngwyDEjSG8JH
         wZp3gvVhPkh61DTKJgeVOTInl41l6mMLWG9WeKQUJPqpImBF+a04xOHrLsI3dLI36qax
         DO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTMT7duYNhavb1SmNY4Y9fDXpzVVR+JdmgoWkI0di6Y=;
        b=ecmZGxOyVviS3q6OzXDCk8Qi++3glvc3VkN+EUVV3ErEP+W+Tbtv5/1bySprtOsKiZ
         dOtwhH3DYAOYa84Kr2TlUMpdqjJKQaNjKCHwT+UZrhY3F60rF3/ZVCs6b74tSvoCNL4o
         sAp8kNWv4OyISf3uqQ8qZSMAzGvrORPFK9PkYLXT/nZROA21V1rn5OCj3Vfv+OJb2Ce9
         s9A3YKCuKmdOVNngaejpQtps4QKzZp+U5hKyjJip0YUMx+Z/EP0DQp3NrHlD+d/koBh+
         BJfVIme0CAOXFo/G1vOUsPchRe6E6PSqiqO9F9yjeDV5ylWfSfhKCmscFYNqYyCuiuDM
         4xpw==
X-Gm-Message-State: AOAM532mAcegqo3+v/aZknYOUO/BRz8pygOBjrbMwCt2ex81PYc0uU+a
	k48KNOEjJZU1FNWgnf3WwXk=
X-Google-Smtp-Source: ABdhPJyOKPxdxDl5eEMLq/XZ4yCcM0Cdzp4biborDUaecV7SIiMKaIhQc8aSTEhMtN5rL5H+GROjBg==
X-Received: by 2002:ac8:702:: with SMTP id g2mr21575qth.215.1616180325555;
        Fri, 19 Mar 2021 11:58:45 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] lttng-modules: backport patches to fix build against 5.12+ kernel
Date: Fri, 19 Mar 2021 14:58:36 -0400
Message-Id: <7b17c2dc3265bf988e902ed67502cb7403b2d0cf.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There are four changes in addition to the 2.12.5 release that we
need to build against the 5.12 kernel. Rather than only rely on
people knowing to use devupstream support to build against newer
kernels, we backport the 4 patches while waiting for release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...01-Fix-memory-leaks-on-event-destroy.patch |  58 +++++++
 ...preter-early-exits-on-uninitialized-.patch | 159 ++++++++++++++++++
 ...ecord-slab-name-for-kmem_cache_free-.patch |  91 ++++++++++
 ...be-null-ptr-deref-on-session-destroy.patch |  41 +++++
 .../lttng/lttng-modules_2.12.5.bb             |   4 +
 5 files changed, 353 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
new file mode 100644
index 0000000000..21da932a75
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
@@ -0,0 +1,58 @@
+From b3fdf78b15beb940918da1e41eb68e24ba31bb87 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Wed, 3 Mar 2021 10:10:16 -0500
+Subject: [PATCH 1/4] Fix: memory leaks on event destroy
+
+Both filter runtime and event enabler ref objects are owned by the
+event, but are not freed upon destruction of the event object, thus
+leaking memory.
+
+Upstream-status: backport
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ice9b1c18b47584838aea2b965494d3c8391f4c84
+---
+ lttng-events.c | 7 +++++++
+ lttng-events.h | 1 +
+ 2 files changed, 8 insertions(+)
+
+diff --git a/lttng-events.c b/lttng-events.c
+index f3398adc..984bd341 100644
+--- a/lttng-events.c
++++ b/lttng-events.c
+@@ -919,6 +919,8 @@ int _lttng_event_unregister(struct lttng_event *event)
+ static
+ void _lttng_event_destroy(struct lttng_event *event)
+ {
++	struct lttng_enabler_ref *enabler_ref, *tmp_enabler_ref;
++
+ 	switch (event->instrumentation) {
+ 	case LTTNG_KERNEL_TRACEPOINT:
+ 		lttng_event_put(event->desc);
+@@ -944,6 +946,11 @@ void _lttng_event_destroy(struct lttng_event *event)
+ 	}
+ 	list_del(&event->list);
+ 	lttng_destroy_context(event->ctx);
++	lttng_free_event_filter_runtime(event);
++	/* Free event enabler refs */
++	list_for_each_entry_safe(enabler_ref, tmp_enabler_ref,
++				 &event->enablers_ref_head, node)
++		kfree(enabler_ref);
+ 	kmem_cache_free(event_cache, event);
+ }
+ 
+diff --git a/lttng-events.h b/lttng-events.h
+index 1b9ab167..13b6abf5 100644
+--- a/lttng-events.h
++++ b/lttng-events.h
+@@ -716,6 +716,7 @@ int lttng_enabler_attach_bytecode(struct lttng_enabler *enabler,
+ 		struct lttng_kernel_filter_bytecode __user *bytecode);
+ void lttng_enabler_event_link_bytecode(struct lttng_event *event,
+ 		struct lttng_enabler *enabler);
++void lttng_free_event_filter_runtime(struct lttng_event *event);
+ 
+ int lttng_probes_init(void);
+ 
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
new file mode 100644
index 0000000000..609690f05c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
@@ -0,0 +1,159 @@
+From 23a2f61ffc6a656f136fa2044c0c3b8f79766779 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
+ <jeremie.galarneau@efficios.com>
+Date: Wed, 3 Mar 2021 18:52:19 -0500
+Subject: [PATCH 2/4] Fix: filter interpreter early-exits on uninitialized
+ value
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+I observed that syscall filtering on string arguments wouldn't work on
+my development machines, both running 5.11.2-arch1-1 (Arch Linux).
+
+For instance, enabling the tracing of the `openat()` syscall with the
+'filename == "/proc/cpuinfo"' filter would not produce events even
+though matching events were present in another session that had no
+filtering active. The same problem occurred with `execve()`.
+
+I tried a couple of kernel versions before (5.11.1 and 5.10.13, if
+memory serves me well) and I had the same problem. Meanwhile, I couldn't
+reproduce the problem on various Debian machines (the LTTng CI) nor on a
+fresh Ubuntu 20.04 with both the stock kernel and with an updated 5.11.2
+kernel.
+
+I built the lttng-modules with the interpreter debugging printout and
+saw the following warning:
+  LTTng: [debug bytecode in /home/jgalar/EfficiOS/src/lttng-modules/src/lttng-bytecode-interpreter.c:bytecode_interpret@1508] Bytecode warning: loading a NULL string.
+
+After a shedload (yes, a _shed_load) of digging, I figured that the
+problem was hidden in plain sight near that logging statement.
+
+In the `BYTECODE_OP_LOAD_FIELD_REF_USER_STRING` operation, the 'ax'
+register's 'user_str' is initialized with the stack value (the user
+space string's address in our case). However, a NULL check is performed
+against the register's 'str' member.
+
+I initialy suspected that both members would be part of the same union
+and alias each-other, but they are actually contiguous in a structure.
+
+On the unaffected machines, I could confirm that the `str` member was
+uninitialized to a non-zero value causing the condition to evaluate to
+false.
+
+Francis Deslauriers reproduced the problem by initializing the
+interpreter stack to zero.
+
+I am unsure of the exact kernel configuration option that reveals this
+issue on Arch Linux, but my kernel has the following option enabled:
+
+CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL:
+   Zero-initialize any stack variables that may be passed by reference
+   and had not already been explicitly initialized. This is intended to
+   eliminate all classes of uninitialized stack variable exploits and
+   information exposures.
+
+I have not tried to build without this enabled as, anyhow, this seems
+to be a legitimate issue.
+
+I have spotted what appears to be an identical problem in
+`BYTECODE_OP_LOAD_FIELD_REF_USER_SEQUENCE` and corrected it. However,
+I have not exercised that code path.
+
+The commit that introduced this problem is 5b4ad89.
+
+The debug print-out of the `BYTECODE_OP_LOAD_FIELD_REF_USER_STRING`
+operation is modified to print the user string (truncated to 31 chars).
+
+Upstream-status: backport
+
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I2da3c31b9e3ce0e1b164cf3d2711c0893cbec273
+---
+ lttng-filter-interpreter.c | 41 ++++++++++++++++++++++++++++++++++----
+ 1 file changed, 37 insertions(+), 4 deletions(-)
+
+diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
+index 5d572437..6e5a5139 100644
+--- a/lttng-filter-interpreter.c
++++ b/lttng-filter-interpreter.c
+@@ -22,7 +22,7 @@ LTTNG_STACK_FRAME_NON_STANDARD(lttng_filter_interpret_bytecode);
+  * to handle user-space read.
+  */
+ static
+-char get_char(struct estack_entry *reg, size_t offset)
++char get_char(const struct estack_entry *reg, size_t offset)
+ {
+ 	if (unlikely(offset >= reg->u.s.seq_len))
+ 		return '\0';
+@@ -593,6 +593,39 @@ end:
+ 	return ret;
+ }
+ 
++#ifdef DEBUG
++
++#define DBG_USER_STR_CUTOFF 32
++
++/*
++ * In debug mode, print user string (truncated, if necessary).
++ */
++static inline
++void dbg_load_ref_user_str_printk(const struct estack_entry *user_str_reg)
++{
++	size_t pos = 0;
++	char last_char;
++	char user_str[DBG_USER_STR_CUTOFF];
++
++	pagefault_disable();
++	do {
++		last_char = get_char(user_str_reg, pos);
++		user_str[pos] = last_char;
++		pos++;
++	} while (last_char != '\0' && pos < sizeof(user_str));
++	pagefault_enable();
++
++	user_str[sizeof(user_str) - 1] = '\0';
++	dbg_printk("load field ref user string: '%s%s'\n", user_str,
++		last_char != '\0' ? "[...]" : "");
++}
++#else
++static inline
++void dbg_load_ref_user_str_printk(const struct estack_entry *user_str_reg)
++{
++}
++#endif
++
+ /*
+  * Return 0 (discard), or raise the 0x1 flag (log event).
+  * Currently, other flags are kept for future extensions and have no
+@@ -1313,7 +1346,7 @@ uint64_t lttng_filter_interpret_bytecode(void *filter_data,
+ 			estack_push(stack, top, ax, bx);
+ 			estack_ax(stack, top)->u.s.user_str =
+ 				*(const char * const *) &filter_stack_data[ref->offset];
+-			if (unlikely(!estack_ax(stack, top)->u.s.str)) {
++			if (unlikely(!estack_ax(stack, top)->u.s.user_str)) {
+ 				dbg_printk("Filter warning: loading a NULL string.\n");
+ 				ret = -EINVAL;
+ 				goto end;
+@@ -1322,7 +1355,7 @@ uint64_t lttng_filter_interpret_bytecode(void *filter_data,
+ 			estack_ax(stack, top)->u.s.literal_type =
+ 				ESTACK_STRING_LITERAL_TYPE_NONE;
+ 			estack_ax(stack, top)->u.s.user = 1;
+-			dbg_printk("ref load string %s\n", estack_ax(stack, top)->u.s.str);
++			dbg_load_ref_user_str_printk(estack_ax(stack, top));
+ 			next_pc += sizeof(struct load_op) + sizeof(struct field_ref);
+ 			PO;
+ 		}
+@@ -1340,7 +1373,7 @@ uint64_t lttng_filter_interpret_bytecode(void *filter_data,
+ 			estack_ax(stack, top)->u.s.user_str =
+ 				*(const char **) (&filter_stack_data[ref->offset
+ 								+ sizeof(unsigned long)]);
+-			if (unlikely(!estack_ax(stack, top)->u.s.str)) {
++			if (unlikely(!estack_ax(stack, top)->u.s.user_str)) {
+ 				dbg_printk("Filter warning: loading a NULL sequence.\n");
+ 				ret = -EINVAL;
+ 				goto end;
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
new file mode 100644
index 0000000000..71f99b80a3
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
@@ -0,0 +1,91 @@
+From 49c603ef2dc6969f4454f0d849af00ee24bb7f04 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 4 Mar 2021 16:50:12 -0500
+Subject: [PATCH 3/4] fix: mm, tracing: record slab name for kmem_cache_free()
+ (v5.12)
+
+See upstream commit:
+
+  commit 3544de8ee6e4817278b15fe08658de49abf58954
+  Author: Jacob Wen <jian.w.wen@oracle.com>
+  Date:   Wed Feb 24 12:00:55 2021 -0800
+
+    mm, tracing: record slab name for kmem_cache_free()
+
+    Currently, a trace record generated by the RCU core is as below.
+
+    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=00000000f3b49a66
+
+    It doesn't tell us what the RCU core has freed.
+
+    This patch adds the slab name to trace_kmem_cache_free().
+    The new format is as follows.
+
+    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=0000000037f79c8d name=dentry
+    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=00000000f78cb7b5 name=sock_inode_cache
+    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=0000000018768985 name=pool_workqueue
+    ... kmem_cache_free: call_site=rcu_core+0x1fd/0x610 ptr=000000006a6cb484 name=radix_tree_node
+
+    We can use it to understand what the RCU core is going to free. For
+    example, some users maybe interested in when the RCU core starts
+    freeing reclaimable slabs like dentry to reduce memory pressure.
+
+    Link: https://lkml.kernel.org/r/20201216072804.8838-1-jian.w.wen@oracle.com
+
+Upstream-status: backport
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I1ee2fc476614cadcc8d3ac5d8feddc7910e1aa3a
+---
+ instrumentation/events/lttng-module/kmem.h | 27 ++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/kmem.h b/instrumentation/events/lttng-module/kmem.h
+index b134620a..d787ea54 100644
+--- a/instrumentation/events/lttng-module/kmem.h
++++ b/instrumentation/events/lttng-module/kmem.h
+@@ -87,6 +87,32 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
+ 	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags, node)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0))
++LTTNG_TRACEPOINT_EVENT(kfree,
++
++	TP_PROTO(unsigned long call_site, const void *ptr),
++
++	TP_ARGS(call_site, ptr),
++
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, call_site, call_site)
++		ctf_integer_hex(const void *, ptr, ptr)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
++
++	TP_PROTO(unsigned long call_site, const void *ptr, const char *name),
++
++	TP_ARGS(call_site, ptr, name),
++
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, call_site, call_site)
++		ctf_integer_hex(const void *, ptr, ptr)
++		ctf_string(name, name)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_free,
+ 
+ 	TP_PROTO(unsigned long call_site, const void *ptr),
+@@ -114,6 +140,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_free, kmem_cache_free,
+ 
+ 	TP_ARGS(call_site, ptr)
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,3,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_free, kmem_mm_page_free,
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch
new file mode 100644
index 0000000000..8a839c2b43
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch
@@ -0,0 +1,41 @@
+From 92cc3e7f76a545a2cd4828576971f1eea83f4e68 Mon Sep 17 00:00:00 2001
+From: Francis Deslauriers <francis.deslauriers@efficios.com>
+Date: Wed, 17 Mar 2021 10:40:56 -0400
+Subject: [PATCH 4/4] Fix: kretprobe: null ptr deref on session destroy
+
+The `filter_bytecode_runtime_head` list is currently not initialized for
+the return event of the kretprobe. This caused a kernel null ptr
+dereference when destroying a session. It can reproduced with the
+following commands:
+
+  lttng create
+  lttng enable-event -k --function=lttng_test_filter_event_write my_event
+  lttng start
+  lttng stop
+  lttng destroy
+
+Upstream-status: backport 
+
+Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I1162ce8b10dd7237a26331531f048346b984eee7
+---
+ lttng-events.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lttng-events.c b/lttng-events.c
+index 984bd341..3450fa40 100644
+--- a/lttng-events.c
++++ b/lttng-events.c
+@@ -704,6 +704,8 @@ struct lttng_event *_lttng_event_create(struct lttng_channel *chan,
+ 		event_return->enabled = 0;
+ 		event_return->registered = 1;
+ 		event_return->instrumentation = itype;
++		INIT_LIST_HEAD(&event_return->bytecode_runtime_head);
++		INIT_LIST_HEAD(&event_return->enablers_ref_head);
+ 		/*
+ 		 * Populate lttng_event structure before kretprobe registration.
+ 		 */
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
index ea36a3464b..5b05c644a6 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
@@ -11,6 +11,10 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+           file://0001-Fix-memory-leaks-on-event-destroy.patch \
+           file://0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch  \
+           file://0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch \
+           file://0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch \
            "
 
 SRC_URI[sha256sum] = "c4d1a1b42c728e37b6b7947ae16563a011c4b297311aa04d56f9a1791fb5a30a"
-- 
2.19.1

