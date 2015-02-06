Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0ADF72E51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t16GVEs0001341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:14 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:14 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:06 -0500
Message-ID: <201cd02e79730800b496a22d7981e8e5d3db8a3a.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] lttng: update to 2.6.0-stable
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:17 -0000
Content-Type: text/plain

To fix build issues against the v3.19 kernel, we can safely update to
the lttng 2.6 stable branches.

This allows us to drop two backported patches that are already part of
this update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...probes-should-calculate-alignment-and-eve.patch | 130 ---------------------
 ...e-kvm-instrumentation-compile-on-3.17-rc1.patch |  46 --------
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |  35 ++----
 ...tng-modules_2.5.2.bb => lttng-modules_2.6.0.bb} |   6 +-
 4 files changed, 12 insertions(+), 205 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.5.2.bb => lttng-modules_2.6.0.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch b/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
deleted file mode 100644
index 9c3dc9c1e16e..000000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
-From d3de7f1468be0b18145ff85b3c1a7c7fb1d48c15 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Fri, 25 Jul 2014 12:30:43 -0400
-Subject: [PATCH 1/3] Fix: noargs probes should calculate alignment and event
- length
-
-A noargs probe could have event fields. noargs just means that the probe
-does not receive any argument as parameter. However, it could very well
-serialize data into fields (global variables, constants, etc).
-
-It just happens that LTTng does not serialize any data in noargs events
-at the moment, but this may very well change.
-
-The if (0) with (void) variable access strategy to stop compiler from
-complaining from unused variables does not seem to work as expected with
-gcc 4.9.1. Use "unused" attribute instead.
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- probes/lttng-events.h | 49 +++++++++++++++++++++++++++++++++++--------------
- 1 file changed, 35 insertions(+), 14 deletions(-)
-
-diff --git a/probes/lttng-events.h b/probes/lttng-events.h
-index 596b70608584..ba9563b15cf9 100644
---- a/probes/lttng-events.h
-+++ b/probes/lttng-events.h
-@@ -456,10 +456,19 @@ static __used struct lttng_probe_desc TP_ID(__probe_desc___, TRACE_SYSTEM) = {
- static inline size_t __event_get_size__##_name(size_t *__dynamic_len, _proto) \
- {									      \
- 	size_t __event_len = 0;						      \
--	unsigned int __dynamic_len_idx = 0;				      \
-+	unsigned int __dynamic_len_idx __attribute__((unused)) = 0;	      \
-+									      \
-+	_tstruct							      \
-+	return __event_len;						      \
-+}
-+
-+#undef DECLARE_EVENT_CLASS_NOARGS
-+#define DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)	      \
-+static inline size_t __event_get_size__##_name(size_t *__dynamic_len)	      \
-+{									      \
-+	size_t __event_len = 0;						      \
-+	unsigned int __dynamic_len_idx __attribute__((unused)) = 0;	      \
- 									      \
--	if (0)								      \
--		(void) __dynamic_len_idx;	/* don't warn if unused */    \
- 	_tstruct							      \
- 	return __event_len;						      \
- }
-@@ -514,6 +523,15 @@ static inline size_t __event_get_align__##_name(_proto)			      \
- 	return __event_align;						      \
- }
- 
-+#undef DECLARE_EVENT_CLASS_NOARGS
-+#define DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)	      \
-+static inline size_t __event_get_align__##_name(void)			      \
-+{									      \
-+	size_t __event_align = 1;					      \
-+	_tstruct							      \
-+	return __event_align;						      \
-+}
-+
- #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
- 
- 
-@@ -553,12 +571,16 @@ static inline size_t __event_get_align__##_name(_proto)			      \
- #undef TP_STRUCT__entry
- #define TP_STRUCT__entry(args...) args
- 
--#undef DECLARE_EVENT_CLASS
--#define DECLARE_EVENT_CLASS(_name, _proto, _args, _tstruct, _assign, _print)  \
-+#undef DECLARE_EVENT_CLASS_NOARGS
-+#define DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)	      \
- struct __event_typemap__##_name {					      \
- 	_tstruct							      \
- };
- 
-+#undef DECLARE_EVENT_CLASS
-+#define DECLARE_EVENT_CLASS(_name, _proto, _args, _tstruct, _assign, _print)  \
-+	DECLARE_EVENT_CLASS_NOARGS(_name, _tstruct, _assign, _print)
-+
- #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
- 
- 
-@@ -760,15 +782,11 @@ static void __event_probe__##_name(void *__data, _proto)		      \
- 	struct lttng_channel *__chan = __event->chan;			      \
- 	struct lib_ring_buffer_ctx __ctx;				      \
- 	size_t __event_len, __event_align;				      \
--	size_t __dynamic_len_idx = 0;					      \
--	size_t __dynamic_len[2 * ARRAY_SIZE(__event_fields___##_name)];	      \
--	struct __event_typemap__##_name __typemap;			      \
-+	size_t __dynamic_len_idx __attribute__((unused)) = 0;		      \
-+	size_t __dynamic_len[2 * ARRAY_SIZE(__event_fields___##_name)] __attribute__((unused)); \
-+	struct __event_typemap__##_name __typemap __attribute__((unused));    \
- 	int __ret;							      \
- 									      \
--	if (0) {							      \
--		(void) __dynamic_len_idx;	/* don't warn if unused */    \
--		(void) __typemap;		/* don't warn if unused */    \
--	}								      \
- 	if (!_TP_SESSION_CHECK(session, __chan->session))		      \
- 		return;							      \
- 	if (unlikely(!ACCESS_ONCE(__chan->session->active)))		      \
-@@ -800,6 +818,9 @@ static void __event_probe__##_name(void *__data)			      \
- 	struct lttng_channel *__chan = __event->chan;			      \
- 	struct lib_ring_buffer_ctx __ctx;				      \
- 	size_t __event_len, __event_align;				      \
-+	size_t __dynamic_len_idx __attribute__((unused)) = 0;		      \
-+	size_t __dynamic_len[2 * ARRAY_SIZE(__event_fields___##_name)] __attribute__((unused)); \
-+	struct __event_typemap__##_name __typemap __attribute__((unused));    \
- 	int __ret;							      \
- 									      \
- 	if (!_TP_SESSION_CHECK(session, __chan->session))		      \
-@@ -810,8 +831,8 @@ static void __event_probe__##_name(void *__data)			      \
- 		return;							      \
- 	if (unlikely(!ACCESS_ONCE(__event->enabled)))			      \
- 		return;							      \
--	__event_len = 0;						      \
--	__event_align = 1;						      \
-+	__event_len = __event_get_size__##_name(__dynamic_len);		      \
-+	__event_align = __event_get_align__##_name();			      \
- 	lib_ring_buffer_ctx_init(&__ctx, __chan->chan, __event, __event_len,  \
- 				 __event_align, -1);			      \
- 	__ret = __chan->ops->event_reserve(&__ctx, __event->id);	      \
--- 
-1.8.1.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
deleted file mode 100644
index 3541b50b7922..000000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-
-From 458c2022e992c057bd21d02e4c77bcc7d4d6cd6c Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Thu, 21 Aug 2014 11:15:50 -0400
-Subject: [PATCH 3/3] Update kvm instrumentation: compile on 3.17-rc1
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- instrumentation/events/lttng-module/arch/x86/kvm/trace.h | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/trace.h b/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
-index 2354884074eb..3c299c58a1cf 100644
---- a/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
-+++ b/instrumentation/events/lttng-module/arch/x86/kvm/trace.h
-@@ -724,7 +724,7 @@ TRACE_EVENT(kvm_emulate_insn,
- 		tp_memcpy(insn,
- 		       vcpu->arch.emulate_ctxt.decode.fetch.data,
- 		       15)
--#else
-+#elif (LINUX_VERSION_CODE < KERNEL_VERSION(3,17,0))
- 		tp_assign(rip, vcpu->arch.emulate_ctxt.fetch.start)
- 		tp_assign(csbase, kvm_x86_ops->get_segment_base(vcpu, VCPU_SREG_CS))
- 		tp_assign(len, vcpu->arch.emulate_ctxt._eip
-@@ -732,6 +732,16 @@ TRACE_EVENT(kvm_emulate_insn,
- 		tp_memcpy(insn,
- 		       vcpu->arch.emulate_ctxt.fetch.data,
- 		       15)
-+#else
-+		tp_assign(rip, vcpu->arch.emulate_ctxt._eip -
-+			(vcpu->arch.emulate_ctxt.fetch.ptr -
-+				vcpu->arch.emulate_ctxt.fetch.data))
-+		tp_assign(csbase, kvm_x86_ops->get_segment_base(vcpu, VCPU_SREG_CS))
-+		tp_assign(len, vcpu->arch.emulate_ctxt.fetch.ptr -
-+			vcpu->arch.emulate_ctxt.fetch.data)
-+		tp_memcpy(insn,
-+		       vcpu->arch.emulate_ctxt.fetch.data,
-+		       15)
- #endif
- 		tp_assign(flags, kei_decode_mode(vcpu->arch.emulate_ctxt.mode))
- 		tp_assign(failed, failed)
--- 
-1.8.1.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
index 30f825c4141a..bbfa38a0b5f6 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
@@ -8,11 +8,11 @@ it as-is.
 
 Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
 
-diff --git a/Makefile b/Makefile
-index a9d1cb1..c1b65b9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -43,19 +43,19 @@ obj-m += lib/
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -62,19 +62,19 @@ obj-m += lib/
  endif # CONFIG_TRACEPOINTS
  
  else # KERNELRELEASE
@@ -37,26 +37,11 @@ index a9d1cb1..c1b65b9 100644
 -	$(MAKE) -C $(KERNELDIR) M=$(PWD) $@
 +	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) $@
  endif # KERNELRELEASE
-diff --git a/README b/README
-index 8c5dd46..6bd3334 100644
---- a/README
-+++ b/README
-@@ -27,8 +27,8 @@ access to your full kernel source tree), and use:
- If you need to specify the target directory to the kernel you want to build
- against, use:
- 
--% KERNELDIR=path_to_kernel_dir make
--# KERNELDIR=path_to_kernel_dir make modules_install
-+% KERNEL_SRC=path_to_kernel_dir make
-+# KERNEL_SRC=path_to_kernel_dir make modules_install
- # depmod -a kernel_version
- 
- Use lttng-tools to control the tracer. LTTng tools should automatically load
-diff --git a/probes/Makefile b/probes/Makefile
-index 225803c..3449866 100644
---- a/probes/Makefile
-+++ b/probes/Makefile
-@@ -212,18 +212,18 @@ endif
+Index: git/probes/Makefile
+===================================================================
+--- git.orig/probes/Makefile
++++ git/probes/Makefile
+@@ -231,18 +231,18 @@ endif
  endif
  
  else
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
index 6ec83d090a5d..d0039b3b1473 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
@@ -11,14 +11,12 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 inherit module
 
-SRCREV = "16d7431c3a78605ea598dbd3f081a2b1a8463f23"
+SRCREV = "9e8bcbf975844986f021e99e2a30ceedc41b46a8"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.5 \
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.6 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
-           file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
            "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
2.1.0


