Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8421712AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s88JtdOg027420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:39 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:22 -0400
Message-ID: <6df082a8d4a4b54ab2967a5746b37a20dc7f6834.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] lttng-modules: fix compilation for 3.17-rcX
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:49 -0000
Content-Type: text/plain

Updating the lttng-modules 2.5 recipe with backports from the master branch to
enable builds on 3.17 based kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...probes-should-calculate-alignment-and-eve.patch | 127 +++++++++++++++++++++
 ...e-kvm-instrumentation-compile-on-3.17-rc1.patch |  43 +++++++
 .../Update-statedump-to-3.17-nsproxy-locking.patch |  67 +++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |   3 +
 4 files changed, 240 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch b/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
new file mode 100644
index 000000000000..8c1722a4c22b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
@@ -0,0 +1,127 @@
+From d3de7f1468be0b18145ff85b3c1a7c7fb1d48c15 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Fri, 25 Jul 2014 12:30:43 -0400
+Subject: [PATCH 1/3] Fix: noargs probes should calculate alignment and event
+ length
+
+A noargs probe could have event fields. noargs just means that the probe
+does not receive any argument as parameter. However, it could very well
+serialize data into fields (global variables, constants, etc).
+
+It just happens that LTTng does not serialize any data in noargs events
+at the moment, but this may very well change.
+
+The if (0) with (void) variable access strategy to stop compiler from
+complaining from unused variables does not seem to work as expected with
+gcc 4.9.1. Use "unused" attribute instead.
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ probes/lttng-events.h | 49 +++++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 35 insertions(+), 14 deletions(-)
+
+diff --git a/probes/lttng-events.h b/probes/lttng-events.h
+index 596b70608584..ba9563b15cf9 100644
+--- a/probes/lttng-events.h
++++ b/probes/lttng-events.h
+@@ -456,10 +456,19 @@ static __used struct lttng_probe_desc TP_ID(__probe_desc___, TRACE_SYSTEM) = {
+ static inline size_t __event_get_size__##_name(size_t *__dynamic_len, _proto) \
+ {									      \
+ 	size_t __event_len = 0;						      \
+-	unsigned int __dynamic_len_idx = 0;				      \
++	unsigned int __dynamic_len_idx __attribute__((unused)) = 0;	      \
++									      \
++	_tstruct							      \
++	return __event_len;						      \
++}
++
++#undef DECLARE_EVENT_CLASS_NOARGS
++#define DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)	      \
++static inline size_t __event_get_size__##_name(size_t *__dynamic_len)	      \
++{									      \
++	size_t __event_len = 0;						      \
++	unsigned int __dynamic_len_idx __attribute__((unused)) = 0;	      \
+ 									      \
+-	if (0)								      \
+-		(void) __dynamic_len_idx;	/* don't warn if unused */    \
+ 	_tstruct							      \
+ 	return __event_len;						      \
+ }
+@@ -514,6 +523,15 @@ static inline size_t __event_get_align__##_name(_proto)			      \
+ 	return __event_align;						      \
+ }
+ 
++#undef DECLARE_EVENT_CLASS_NOARGS
++#define DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)	      \
++static inline size_t __event_get_align__##_name(void)			      \
++{									      \
++	size_t __event_align = 1;					      \
++	_tstruct							      \
++	return __event_align;						      \
++}
++
+ #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
+ 
+ 
+@@ -553,12 +571,16 @@ static inline size_t __event_get_align__##_name(_proto)			      \
+ #undef TP_STRUCT__entry
+ #define TP_STRUCT__entry(args...) args
+ 
+-#undef DECLARE_EVENT_CLASS
+-#define DECLARE_EVENT_CLASS(_name, _proto, _args, _tstruct, _assign, _print)  \
++#undef DECLARE_EVENT_CLASS_NOARGS
++#define DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)	      \
+ struct __event_typemap__##_name {					      \
+ 	_tstruct							      \
+ };
+ 
++#undef DECLARE_EVENT_CLASS
++#define DECLARE_EVENT_CLASS(_name, _proto, _args, _tstruct, _assign, _print)  \
++	DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)
++
+ #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
+ 
+ 
+@@ -760,15 +782,11 @@ static void __event_probe__##_name(void *__data, _proto)		      \
+ 	struct lttng_channel *__chan = __event->chan;			      \
+ 	struct lib_ring_buffer_ctx __ctx;				      \
+ 	size_t __event_len, __event_align;				      \
+-	size_t __dynamic_len_idx = 0;					      \
+-	size_t __dynamic_len[2 * ARRAY_SIZE(__event_fields___##_name)];	      \
+-	struct __event_typemap__##_name __typemap;			      \
++	size_t __dynamic_len_idx __attribute__((unused)) = 0;		      \
++	size_t __dynamic_len[2 * ARRAY_SIZE(__event_fields___##_name)] __attribute__((unused)); \
++	struct __event_typemap__##_name __typemap __attribute__((unused));    \
+ 	int __ret;							      \
+ 									      \
+-	if (0) {							      \
+-		(void) __dynamic_len_idx;	/* don't warn if unused */    \
+-		(void) __typemap;		/* don't warn if unused */    \
+-	}								      \
+ 	if (!_TP_SESSION_CHECK(session, __chan->session))		      \
+ 		return;							      \
+ 	if (unlikely(!ACCESS_ONCE(__chan->session->active)))		      \
+@@ -800,6 +818,9 @@ static void __event_probe__##_name(void *__data)			      \
+ 	struct lttng_channel *__chan = __event->chan;			      \
+ 	struct lib_ring_buffer_ctx __ctx;				      \
+ 	size_t __event_len, __event_align;				      \
++	size_t __dynamic_len_idx __attribute__((unused)) = 0;		      \
++	size_t __dynamic_len[2 * ARRAY_SIZE(__event_fields___##_name)] __attribute__((unused)); \
++	struct __event_typemap__##_name __typemap __attribute__((unused));    \
+ 	int __ret;							      \
+ 									      \
+ 	if (!_TP_SESSION_CHECK(session, __chan->session))		      \
+@@ -810,8 +831,8 @@ static void __event_probe__##_name(void *__data)			      \
+ 		return;							      \
+ 	if (unlikely(!ACCESS_ONCE(__event->enabled)))			      \
+ 		return;							      \
+-	__event_len = 0;						      \
+-	__event_align = 1;						      \
++	__event_len = __event_get_size__##_name(__dynamic_len);		      \
++	__event_align = __event_get_align__##_name();			      \
+ 	lib_ring_buffer_ctx_init(&__ctx, __chan->chan, __event, __event_len,  \
+ 				 __event_align, -1);			      \
+ 	__ret = __chan->ops->event_reserve(&__ctx, __event->id);	      \
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
new file mode 100644
index 000000000000..1e899db154f7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
@@ -0,0 +1,43 @@
+From 458c2022e992c057bd21d02e4c77bcc7d4d6cd6c Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 21 Aug 2014 11:15:50 -0400
+Subject: [PATCH 3/3] Update kvm instrumentation: compile on 3.17-rc1
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/arch/x86/kvm/trace.h | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/trace.h b/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
+index 2354884074eb..3c299c58a1cf 100644
+--- a/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
++++ b/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
+@@ -724,7 +724,7 @@ TRACE_EVENT(kvm_emulate_insn,
+ 		tp_memcpy(insn,
+ 		       vcpu->arch.emulate_ctxt.decode.fetch.data,
+ 		       15)
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0))
+ 		tp_assign(rip, vcpu->arch.emulate_ctxt.fetch.start)
+ 		tp_assign(csbase, kvm_x86_ops->get_segment_base(vcpu, VCPU_SREG_CS))
+ 		tp_assign(len, vcpu->arch.emulate_ctxt._eip
+@@ -732,6 +732,16 @@ TRACE_EVENT(kvm_emulate_insn,
+ 		tp_memcpy(insn,
+ 		       vcpu->arch.emulate_ctxt.fetch.data,
+ 		       15)
++#else
++		tp_assign(rip, vcpu->arch.emulate_ctxt._eip -
++			(vcpu->arch.emulate_ctxt.fetch.ptr -
++				vcpu->arch.emulate_ctxt.fetch.data))
++		tp_assign(csbase, kvm_x86_ops->get_segment_base(vcpu, VCPU_SREG_CS))
++		tp_assign(len, vcpu->arch.emulate_ctxt.fetch.ptr -
++			vcpu->arch.emulate_ctxt.fetch.data)
++		tp_memcpy(insn,
++		       vcpu->arch.emulate_ctxt.fetch.data,
++		       15)
+ #endif
+ 		tp_assign(flags, kei_decode_mode(vcpu->arch.emulate_ctxt.mode))
+ 		tp_assign(failed, failed)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
new file mode 100644
index 000000000000..ca03d33ed897
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
@@ -0,0 +1,67 @@
+From 4ba1f53c5aebb4433fedc25d65af010274985043 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 21 Aug 2014 10:53:12 -0400
+Subject: [PATCH 2/3] Update statedump to 3.17 nsproxy locking
+
+This Linux upstream commit introduces locking strategy back and forth:
+
+commit 728dba3a39c66b3d8ac889ddbe38b5b1c264aec3
+Author: Eric W. Biederman <ebiederm@xmission.com>
+Date:   Mon Feb 3 19:13:49 2014 -0800
+
+    namespaces: Use task_lock and not rcu to protect nsproxy
+
+Use the task lock starting from kernel 3.17 rather than RCU to access
+the task nsproxy.
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ lttng-statedump-impl.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
+index dad51ddaa250..e4caa488e436 100644
+--- a/lttng-statedump-impl.c
++++ b/lttng-statedump-impl.c
+@@ -378,6 +378,9 @@ int lttng_list_interrupts(struct lttng_session *session)
+ }
+ #endif
+ 
++/*
++ * Called with task lock held.
++ */
+ static
+ void lttng_statedump_process_ns(struct lttng_session *session,
+ 		struct task_struct *p,
+@@ -389,8 +392,18 @@ void lttng_statedump_process_ns(struct lttng_session *session,
+ 	struct nsproxy *proxy;
+ 	struct pid_namespace *pid_ns;
+ 
++	/*
++	 * Back and forth on locking strategy within Linux upstream for nsproxy.
++	 * See Linux upstream commit 728dba3a39c66b3d8ac889ddbe38b5b1c264aec3
++	 * "namespaces: Use task_lock and not rcu to protect nsproxy"
++	 * for details.
++	 */
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0))
+ 	rcu_read_lock();
+ 	proxy = task_nsproxy(p);
++#else /* #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0)) */
++	proxy = p->nsproxy;
++#endif /* #else #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0)) */
+ 	if (proxy) {
+ 		pid_ns = lttng_get_proxy_pid_ns(proxy);
+ 		do {
+@@ -402,7 +415,9 @@ void lttng_statedump_process_ns(struct lttng_session *session,
+ 		trace_lttng_statedump_process_state(session,
+ 			p, type, mode, submode, status, NULL);
+ 	}
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0))
+ 	rcu_read_unlock();
++#endif /* #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0)) */
+ }
+ 
+ static
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
index 9310f0f3eb63..04e2b0cccc85 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
@@ -18,6 +18,9 @@ SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
            file://Update-compaction-instrumentation-to-3.16-kernel.patch \
            file://Update-vmscan-instrumentation-to-3.16-kernel.patch \
+           file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
+           file://Update-statedump-to-3.17-nsproxy-locking.patch \
+           file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
1.8.1.2


