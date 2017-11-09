Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 78A6978498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 13:35:09 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id 78so7667968qkz.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 05:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=7C+UEzxMeT/JloT9Sl9mdU+Ie7h6fCCZ+mNqoZXjkeU=;
	b=HbwdvrY0ZaHJjQvz1Ny/jMlSAW9gSm4N5MB1lHuiF8zNLwAJzugz86EniUn0UsqTGs
	l8PqDQWdidHcJ35IJFnjyVL6wy/xr4lMNBir7y4DAW5WUSSaTcGLlNGuvAYsNwVF7SVr
	juf2axP2BcPmX3FhPczs51ZzeRuTY0WqIKfaEU3FbU5dDvOOrXtSb3DRbjY2NmS3ZnqR
	VmAtMelBFpacsbutBy3DqpEAhh0yP6t6QKw0hW6HYpPY9r84dPmVP0kE6baEeqEjVmXc
	3eQbzTrnKdokgMMyYW2M3BaJOK/oHrBrFdyFJXT3r84e3M7RfbuioQs2oSF3fLErI7YX
	WPXA==
X-Gm-Message-State: AJaThX7UbZQhhDXjbTLRu3HUn5wk1YSU8I/x9cBDG41p5tyWVHOzBaAD
	a3RDDTo+gZKIjLJvVGWhsZjFyA==
X-Google-Smtp-Source: AGs4zMZnxAvvHOEJm/RumGOV2XWKuEoXgajKVIZl5cFBtuAGnPdi+4masVrqzntP7Fl326zmnunfKQ==
X-Received: by 10.55.18.102 with SMTP id c99mr706229qkh.337.1510234509824;
	Thu, 09 Nov 2017 05:35:09 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id q15sm4645825qkj.8.2017.11.09.05.35.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Nov 2017 05:35:08 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 09 Nov 2017 11:34:59 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  9 Nov 2017 11:34:59 -0200
Message-Id: <20171109133459.28404-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] lttng-modules: Upgrade to 2.9.5 release
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
X-List-Received-Date: Thu, 09 Nov 2017 13:35:10 -0000

This upgrade is critical as it fixes the support for Linux 4.14 LTS kernel.

The changlog is:

2017-10-05 LTTng modules 2.9.5
	* Fix: update block instrumentation for 4.14 kernel
	* Revert "Fix: update block instrumentation for kernel 4.14"

2017-10-03 (National Techies Day) LTTng modules 2.9.4
	* Fix: version check error in btrfs instrumentation
	* Fix: update btrfs instrumentation for kernel 4.14
	* Fix: update writeback instrumentation for kernel 4.14
	* Fix: update block instrumentation for kernel 4.14
	* Fix: vmalloc wrapper on kernel < 2.6.38
	* Fix: vmalloc wrapper on kernel >= 4.12
	* Add kmalloc failover to vmalloc
	* Fix: mmap: caches aliased on virtual addresses
	* Fix: update ext4 instrumentation for kernel 4.13
	* Fix: Sleeping function called from invalid context
	* Fix: sched for v4.11.5-rt1
	* Fix: handle missing ftrace header on v4.12

This also removes the previously backported patches as they are part
of 2.9.4 release and the missing fix is part of 2.9.5 release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This patch should be backported for rocko. Even though this is a
version bump, it makes sense to upgrade instead of including all those
changes as patches.


 ...Fix-handle-missing-ftrace-header-on-v4.12.patch |  96 ----
 .../0002-Fix-sched-for-v4.11.5-rt1.patch           |  31 --
 ...ping-function-called-from-invalid-context.patch | 133 ------
 ...date-ext4-instrumentation-for-kernel-4.13.patch | 189 --------
 ...-mmap-caches-aliased-on-virtual-addresses.patch | 100 ----
 .../0006-Add-kmalloc-failover-to-vmalloc.patch     | 519 ---------------------
 .../0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch  |  37 --
 ...0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch |  34 --
 ...tng-modules_2.9.3.bb => lttng-modules_2.9.5.bb} |  15 +-
 9 files changed, 4 insertions(+), 1150 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-handle-missing-ftrace-header-on-v4.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sched-for-v4.11.5-rt1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Sleeping-function-called-from-invalid-context.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-update-ext4-instrumentation-for-kernel-4.13.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-mmap-caches-aliased-on-virtual-addresses.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Add-kmalloc-failover-to-vmalloc.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.3.bb => lttng-modules_2.9.5.bb} (63%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-handle-missing-ftrace-header-on-v4.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-handle-missing-ftrace-header-on-v4.12.patch
deleted file mode 100644
index 37c1f9af49..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-handle-missing-ftrace-header-on-v4.12.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From fea65d0c097a42cf163bf7035985a6da330b9a1f Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Fri, 23 Jun 2017 14:29:42 -0400
-Subject: [PATCH 1/8] Fix: handle missing ftrace header on v4.12
-Organization: O.S. Systems Software LTDA.
-
-Properly handle the case where we build against the distro headers of a
-kernel >= 4.12 and ftrace is enabled but the private header is
-unavailable.
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- Makefile.ABI.workarounds | 21 +++++++++++++++++++++
- lttng-events.h           |  2 +-
- probes/Kbuild            | 19 ++++---------------
- 3 files changed, 26 insertions(+), 16 deletions(-)
-
-diff --git a/Makefile.ABI.workarounds b/Makefile.ABI.workarounds
-index c3717f8..2e6c4aa 100644
---- a/Makefile.ABI.workarounds
-+++ b/Makefile.ABI.workarounds
-@@ -27,3 +27,24 @@ RT_PATCH_VERSION:=$(shell $(TOP_LTTNG_MODULES_DIR)/rt-patch-version.sh $(CURDIR)
- ifneq ($(RT_PATCH_VERSION), 0)
-   ccflags-y += -DRT_PATCH_VERSION=$(RT_PATCH_VERSION)
- endif
-+
-+# Starting with kernel 4.12, the ftrace header was moved to private headers
-+# and as such is not available when building against distro headers instead
-+# of the full kernel sources. In the situation, define LTTNG_FTRACE_MISSING_HEADER
-+# so we can enable the compat code even if CONFIG_DYNAMIC_FTRACE is enabled.
-+ifneq ($(CONFIG_DYNAMIC_FTRACE),)
-+  ftrace_dep = $(srctree)/kernel/trace/trace.h
-+  ftrace_dep_check = $(wildcard $(ftrace_dep))
-+  have_ftrace_header = $(shell \
-+    if [ $(VERSION) -ge 5 -o \( $(VERSION) -eq 4 -a $(PATCHLEVEL) -ge 12 \) ] ; then \
-+      if [ -z "$(ftrace_dep_check)" ] ; then \
-+        echo "no" ; \
-+        exit ; \
-+      fi; \
-+    fi; \
-+    echo "yes" ; \
-+    )
-+  ifeq ($(have_ftrace_header), no)
-+    ccflags-y += -DLTTNG_FTRACE_MISSING_HEADER
-+  endif
-+endif
-diff --git a/lttng-events.h b/lttng-events.h
-index 173f369..5a96bf3 100644
---- a/lttng-events.h
-+++ b/lttng-events.h
-@@ -810,7 +810,7 @@ int lttng_kretprobes_event_enable_state(struct lttng_event *event,
- }
- #endif
- 
--#ifdef CONFIG_DYNAMIC_FTRACE
-+#if defined(CONFIG_DYNAMIC_FTRACE) && !defined(LTTNG_FTRACE_MISSING_HEADER)
- int lttng_ftrace_register(const char *name,
- 			  const char *symbol_name,
- 			  struct lttng_event *event);
-diff --git a/probes/Kbuild b/probes/Kbuild
-index 78bf3fb..cc1c065 100644
---- a/probes/Kbuild
-+++ b/probes/Kbuild
-@@ -259,22 +259,11 @@ ifneq ($(CONFIG_KRETPROBES),)
- endif # CONFIG_KRETPROBES
- 
- ifneq ($(CONFIG_DYNAMIC_FTRACE),)
--  ftrace_dep = $(srctree)/kernel/trace/trace.h
--  ftrace_dep_check = $(wildcard $(ftrace_dep))
--  ftrace = $(shell \
--    if [ $(VERSION) -ge 5 -o \( $(VERSION) -eq 4 -a $(PATCHLEVEL) -ge 12 \) ] ; then \
--      if [ -z "$(ftrace_dep_check)" ] ; then \
--        echo "warn" ; \
--        exit ; \
--      fi; \
--    fi; \
--    echo "lttng-ftrace.o" ; \
--    )
--  ifeq ($(ftrace),warn)
-+  ifeq ($(have_ftrace_header),yes)
-+    obj-$(CONFIG_LTTNG) += lttng-ftrace.o
-+  else
-     $(warning Files $(ftrace_dep) not found. Probe "ftrace" is disabled. Use full kernel source tree to enable it.)
--    ftrace =
--  endif # $(ftrace),warn
--  obj-$(CONFIG_LTTNG) += $(ftrace)
-+  endif
- endif # CONFIG_DYNAMIC_FTRACE
- 
- # vim:syntax=make
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sched-for-v4.11.5-rt1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sched-for-v4.11.5-rt1.patch
deleted file mode 100644
index d85630565a..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sched-for-v4.11.5-rt1.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8db274f8dda050c4f2ee3dbd0f36a5ad8f8bd993 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 10 Jul 2017 18:13:11 -0400
-Subject: [PATCH 2/8] Fix: sched for v4.11.5-rt1
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- instrumentation/events/lttng-module/sched.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/instrumentation/events/lttng-module/sched.h b/instrumentation/events/lttng-module/sched.h
-index e6f36b1..cb5b5b2 100644
---- a/instrumentation/events/lttng-module/sched.h
-+++ b/instrumentation/events/lttng-module/sched.h
-@@ -541,7 +541,8 @@ LTTNG_TRACEPOINT_EVENT(sched_stat_runtime,
- #endif
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,12,0) || \
--	LTTNG_RT_KERNEL_RANGE(4,9,27,18, 4,10,0,0))
-+	LTTNG_RT_KERNEL_RANGE(4,9,27,18, 4,10,0,0) || \
-+	LTTNG_RT_KERNEL_RANGE(4,11,5,1, 4,12,0,0))
- /*
-  * Tracepoint for showing priority inheritance modifying a tasks
-  * priority.
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Sleeping-function-called-from-invalid-context.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Sleeping-function-called-from-invalid-context.patch
deleted file mode 100644
index d444a0728a..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Sleeping-function-called-from-invalid-context.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From c1af5643e0df56b92481f7a7bc4110a58e4e5abb Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Fri, 21 Jul 2017 08:22:04 -0400
-Subject: [PATCH 3/8] Fix: Sleeping function called from invalid context
-Organization: O.S. Systems Software LTDA.
-
-It affects system call instrumentation for accept, accept4 and connect,
-only on the x86-64 architecture.
-
-We need to use the LTTng accessing functions to touch user-space memory,
-which take care of disabling the page fault handler, so we don't preempt
-while in preempt-off context (tracepoints disable preemption).
-
-Fixes #1111
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- .../x86-64-syscalls-3.10.0-rc7_pointers_override.h | 47 ++++++++++++++--------
- 1 file changed, 31 insertions(+), 16 deletions(-)
-
-diff --git a/instrumentation/syscalls/headers/x86-64-syscalls-3.10.0-rc7_pointers_override.h b/instrumentation/syscalls/headers/x86-64-syscalls-3.10.0-rc7_pointers_override.h
-index 5e91004..6bf5291 100644
---- a/instrumentation/syscalls/headers/x86-64-syscalls-3.10.0-rc7_pointers_override.h
-+++ b/instrumentation/syscalls/headers/x86-64-syscalls-3.10.0-rc7_pointers_override.h
-@@ -2,7 +2,7 @@
- 
- #define OVERRIDE_64_connect
- SC_LTTNG_TRACEPOINT_EVENT_CODE(connect,
--	TP_PROTO(sc_exit(long ret,) int fd, struct sockaddr * uservaddr, int addrlen),
-+	TP_PROTO(sc_exit(long ret,) int fd, struct sockaddr __user * uservaddr, int addrlen),
- 	TP_ARGS(sc_exit(ret,) fd, uservaddr, addrlen),
- 	TP_locvar(
- 		__typeof__(uservaddr->sa_family) sa_family;
-@@ -16,21 +16,28 @@ SC_LTTNG_TRACEPOINT_EVENT_CODE(connect,
- 			memset(tp_locvar, 0, sizeof(*tp_locvar));
- 			if (addrlen < sizeof(tp_locvar->sa_family))
- 				goto skip_code;
--			(void) get_user(tp_locvar->sa_family, &uservaddr->sa_family);
-+			(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->sa_family,
-+					&uservaddr->sa_family, sizeof(tp_locvar->sa_family));
- 			switch (tp_locvar->sa_family) {
- 			case AF_INET:
- 				if (addrlen < sizeof(struct sockaddr_in))
- 					goto skip_code;
--				(void) get_user(tp_locvar->dport, &((struct sockaddr_in *) uservaddr)->sin_port);
--				(void) get_user(tp_locvar->v4addr, &((struct sockaddr_in *) uservaddr)->sin_addr.s_addr);
-+				(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->dport,
-+						&((struct sockaddr_in __user *) uservaddr)->sin_port,
-+						sizeof(tp_locvar->dport));
-+				(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->v4addr,
-+						&((struct sockaddr_in __user *) uservaddr)->sin_addr.s_addr,
-+						sizeof(tp_locvar->v4addr));
- 				tp_locvar->v4addr_len = 4;
- 				break;
- 			case AF_INET6:
- 				if (addrlen < sizeof(struct sockaddr_in6))
- 					goto skip_code;
--				(void) get_user(tp_locvar->dport, &((struct sockaddr_in6 *) uservaddr)->sin6_port);
--				if (copy_from_user(tp_locvar->v6addr,
--						&((struct sockaddr_in6 *) uservaddr)->sin6_addr.in6_u.u6_addr8,
-+				(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->dport,
-+						&((struct sockaddr_in6 __user *) uservaddr)->sin6_port,
-+						sizeof(tp_locvar->dport));
-+				if (lib_ring_buffer_copy_from_user_check_nofault(tp_locvar->v6addr,
-+						&((struct sockaddr_in6 __user *) uservaddr)->sin6_addr.in6_u.u6_addr8,
- 						sizeof(tp_locvar->v6addr)))
- 					memset(tp_locvar->v6addr, 0, sizeof(tp_locvar->v6addr));
- 				tp_locvar->v6addr_len = 8;
-@@ -63,26 +70,34 @@ SC_LTTNG_TRACEPOINT_EVENT_CODE(connect,
- #define LTTNG_SYSCALL_ACCEPT_code_pre											\
- 	sc_inout(													\
- 		memset(tp_locvar, 0, sizeof(*tp_locvar));								\
--		(void) get_user(tp_locvar->uaddr_len, upeer_addrlen);							\
-+		(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->uaddr_len,				\
-+				upeer_addrlen, sizeof(tp_locvar->uaddr_len));						\
- 	)														\
- 	sc_out(														\
- 		if (tp_locvar->uaddr_len < sizeof(tp_locvar->sa_family))						\
- 			goto skip_code;											\
--		(void) get_user(tp_locvar->sa_family, &upeer_sockaddr->sa_family);					\
-+		(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->sa_family,				\
-+				&upeer_sockaddr->sa_family, sizeof(tp_locvar->sa_family));				\
- 		switch (tp_locvar->sa_family) {										\
- 		case AF_INET:												\
- 			if (tp_locvar->uaddr_len < sizeof(struct sockaddr_in))						\
- 				goto skip_code;										\
--			(void) get_user(tp_locvar->sport, &((struct sockaddr_in *) upeer_sockaddr)->sin_port);		\
--			(void) get_user(tp_locvar->v4addr, &((struct sockaddr_in *) upeer_sockaddr)->sin_addr.s_addr);	\
-+			(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->sport,				\
-+					&((struct sockaddr_in __user *) upeer_sockaddr)->sin_port,			\
-+					sizeof(tp_locvar->sport));							\
-+			(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->v4addr,				\
-+					&((struct sockaddr_in __user *) upeer_sockaddr)->sin_addr.s_addr,		\
-+					sizeof(tp_locvar->v4addr));							\
- 			tp_locvar->v4addr_len = 4;									\
- 			break;												\
- 		case AF_INET6:												\
- 			if (tp_locvar->uaddr_len < sizeof(struct sockaddr_in6))						\
- 				goto skip_code;										\
--			(void) get_user(tp_locvar->sport, &((struct sockaddr_in6 *) upeer_sockaddr)->sin6_port);	\
--			if (copy_from_user(tp_locvar->v6addr,								\
--					&((struct sockaddr_in6 *) upeer_sockaddr)->sin6_addr.in6_u.u6_addr8,		\
-+			(void) lib_ring_buffer_copy_from_user_check_nofault(&tp_locvar->sport,				\
-+					&((struct sockaddr_in6 __user *) upeer_sockaddr)->sin6_port,			\
-+					sizeof(tp_locvar->sport));							\
-+			if (lib_ring_buffer_copy_from_user_check_nofault(tp_locvar->v6addr,				\
-+					&((struct sockaddr_in6 __user *) upeer_sockaddr)->sin6_addr.in6_u.u6_addr8,	\
- 					sizeof(tp_locvar->v6addr)))							\
- 				memset(tp_locvar->v6addr, 0, sizeof(tp_locvar->v6addr));				\
- 			tp_locvar->v6addr_len = 8;									\
-@@ -93,7 +108,7 @@ SC_LTTNG_TRACEPOINT_EVENT_CODE(connect,
- 
- #define OVERRIDE_64_accept
- SC_LTTNG_TRACEPOINT_EVENT_CODE(accept,
--	TP_PROTO(sc_exit(long ret,) int fd, struct sockaddr * upeer_sockaddr, int * upeer_addrlen),
-+	TP_PROTO(sc_exit(long ret,) int fd, struct sockaddr __user * upeer_sockaddr, int __user * upeer_addrlen),
- 	TP_ARGS(sc_exit(ret,) fd, upeer_sockaddr, upeer_addrlen),
- 	TP_locvar(
- 		LTTNG_SYSCALL_ACCEPT_locvar
-@@ -116,7 +131,7 @@ SC_LTTNG_TRACEPOINT_EVENT_CODE(accept,
- 
- #define OVERRIDE_64_accept4
- SC_LTTNG_TRACEPOINT_EVENT_CODE(accept4,
--	TP_PROTO(sc_exit(long ret,) int fd, struct sockaddr * upeer_sockaddr, int * upeer_addrlen, int flags),
-+	TP_PROTO(sc_exit(long ret,) int fd, struct sockaddr __user * upeer_sockaddr, int __user * upeer_addrlen, int flags),
- 	TP_ARGS(sc_exit(ret,) fd, upeer_sockaddr, upeer_addrlen, flags),
- 	TP_locvar(
- 		LTTNG_SYSCALL_ACCEPT_locvar
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-update-ext4-instrumentation-for-kernel-4.13.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-update-ext4-instrumentation-for-kernel-4.13.patch
deleted file mode 100644
index c835d06cf5..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-update-ext4-instrumentation-for-kernel-4.13.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 500c99a45fc0da09d1dc7b9e62bf58d562856a9a Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 21 Aug 2017 14:47:08 -0400
-Subject: [PATCH 4/8] Fix: update ext4 instrumentation for kernel 4.13
-Organization: O.S. Systems Software LTDA.
-
-See this upstream commit :
-
-  commit a627b0a7c15ee4d2c87a86d5be5c8167382e8d0d
-  Author: Eric Whitney <enwlinux@gmail.com>
-  Date:   Sun Jul 30 22:30:11 2017 -0400
-
-      ext4: remove unused metadata accounting variables
-
-      Two variables in ext4_inode_info, i_reserved_meta_blocks and
-      i_allocated_meta_blocks, are unused.  Removing them saves a little
-      memory per in-memory inode and cleans up clutter in several tracepoints.
-      Adjust tracepoint output from ext4_alloc_da_blocks() for consistency
-      and fix a typo and whitespace near these changes.
-
-Upstream-Status: Backport [2.9.4]
-
-      Signed-off-by: Eric Whitney <enwlinux@gmail.com>
-      Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-      Reviewed-by: Jan Kara <jack@suse.cz>
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- instrumentation/events/lttng-module/ext4.h | 96 ++++++++++++++++++++++++++----
- 1 file changed, 86 insertions(+), 10 deletions(-)
-
-diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
-index e87b534..fe6f802 100644
---- a/instrumentation/events/lttng-module/ext4.h
-+++ b/instrumentation/events/lttng-module/ext4.h
-@@ -689,6 +689,19 @@ LTTNG_TRACEPOINT_EVENT(ext4_sync_fs,
- 	)
- )
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,13,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_alloc_da_blocks,
-+	TP_PROTO(struct inode *inode),
-+
-+	TP_ARGS(inode),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(unsigned int, data_blocks, EXT4_I(inode)->i_reserved_data_blocks)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT(ext4_alloc_da_blocks,
- 	TP_PROTO(struct inode *inode),
- 
-@@ -701,6 +714,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_alloc_da_blocks,
- 		ctf_integer(unsigned int, meta_blocks, EXT4_I(inode)->i_reserved_meta_blocks)
- 	)
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT(ext4_mballoc_alloc,
- 	TP_PROTO(struct ext4_allocation_context *ac),
-@@ -833,17 +847,49 @@ LTTNG_TRACEPOINT_EVENT(ext4_forget,
- )
- #endif
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,13,0))
- LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
- 	TP_PROTO(struct inode *inode, int used_blocks, int quota_claim),
- 
- 	TP_ARGS(inode, used_blocks, quota_claim),
--#else
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(__u64, i_blocks, inode->i_blocks)
-+		ctf_integer(int, used_blocks, used_blocks)
-+		ctf_integer(int, reserved_data_blocks,
-+				EXT4_I(inode)->i_reserved_data_blocks)
-+		ctf_integer(int, quota_claim, quota_claim)
-+		ctf_integer(TP_MODE_T, mode, inode->i_mode)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
-+	TP_PROTO(struct inode *inode, int used_blocks, int quota_claim),
-+
-+	TP_ARGS(inode, used_blocks, quota_claim),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(__u64, i_blocks, inode->i_blocks)
-+		ctf_integer(int, used_blocks, used_blocks)
-+		ctf_integer(int, reserved_data_blocks,
-+				EXT4_I(inode)->i_reserved_data_blocks)
-+		ctf_integer(int, reserved_meta_blocks,
-+				EXT4_I(inode)->i_reserved_meta_blocks)
-+		ctf_integer(int, allocated_meta_blocks,
-+				EXT4_I(inode)->i_allocated_meta_blocks)
-+		ctf_integer(int, quota_claim, quota_claim)
-+		ctf_integer(TP_MODE_T, mode, inode->i_mode)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34))
-+LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
- 	TP_PROTO(struct inode *inode, int used_blocks),
- 
- 	TP_ARGS(inode, used_blocks),
--#endif
- 
- 	TP_FIELDS(
- 		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-@@ -856,14 +902,27 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
- 				EXT4_I(inode)->i_reserved_meta_blocks)
- 		ctf_integer(int, allocated_meta_blocks,
- 				EXT4_I(inode)->i_allocated_meta_blocks)
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
--		ctf_integer(int, quota_claim, quota_claim)
--#endif
- 		ctf_integer(TP_MODE_T, mode, inode->i_mode)
- 	)
- )
-+#endif
- 
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,13,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
-+	TP_PROTO(struct inode *inode),
-+
-+	TP_ARGS(inode),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(__u64, i_blocks, inode->i_blocks)
-+		ctf_integer(int, reserved_data_blocks,
-+				EXT4_I(inode)->i_reserved_data_blocks)
-+		ctf_integer(TP_MODE_T, mode, inode->i_mode)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0))
- LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
- 	TP_PROTO(struct inode *inode),
- 
-@@ -880,7 +939,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
- 		ctf_integer(TP_MODE_T, mode, inode->i_mode)
- 	)
- )
--#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0)) */
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34))
- LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
- 	TP_PROTO(struct inode *inode, int md_needed),
- 
-@@ -898,8 +957,25 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
- 		ctf_integer(TP_MODE_T, mode, inode->i_mode)
- 	)
- )
--#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,2,0)) */
-+#endif
-+
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,13,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_da_release_space,
-+	TP_PROTO(struct inode *inode, int freed_blocks),
-+
-+	TP_ARGS(inode, freed_blocks),
- 
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(__u64, i_blocks, inode->i_blocks)
-+		ctf_integer(int, freed_blocks, freed_blocks)
-+		ctf_integer(int, reserved_data_blocks,
-+				EXT4_I(inode)->i_reserved_data_blocks)
-+		ctf_integer(TP_MODE_T, mode, inode->i_mode)
-+	)
-+)
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34))
- LTTNG_TRACEPOINT_EVENT(ext4_da_release_space,
- 	TP_PROTO(struct inode *inode, int freed_blocks),
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-mmap-caches-aliased-on-virtual-addresses.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-mmap-caches-aliased-on-virtual-addresses.patch
deleted file mode 100644
index 7f25c6a709..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-mmap-caches-aliased-on-virtual-addresses.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 90715ba61e3fa66c1bb438138c8716c6e72356f9 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Tue, 19 Sep 2017 12:16:58 -0400
-Subject: [PATCH 5/8] Fix: mmap: caches aliased on virtual addresses
-Organization: O.S. Systems Software LTDA.
-
-Some architectures (e.g. implementations of arm64) implement their
-caches based on the virtual addresses (rather than physical address).
-It has the upside of making the cache access faster (no TLB lookup
-required to access the cache line), but the downside of requiring
-virtual mappings (e.g. kernel vs user-space) to be aligned on the number
-of bits used for cache aliasing.
-
-Perform dcache flushing for the entire sub-buffer in the get_subbuf
-operation on those architectures, thus ensuring we don't end up with
-cache aliasing issues.
-
-An alternative approach we could eventually take would be to create a
-kernel mapping for the ring buffer that is aligned with the user-space
-mapping.
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lib/ringbuffer/ring_buffer_frontend.c | 44 +++++++++++++++++++++++++++++++++++
- 1 file changed, 44 insertions(+)
-
-diff --git a/lib/ringbuffer/ring_buffer_frontend.c b/lib/ringbuffer/ring_buffer_frontend.c
-index dc1ee45..e77d789 100644
---- a/lib/ringbuffer/ring_buffer_frontend.c
-+++ b/lib/ringbuffer/ring_buffer_frontend.c
-@@ -54,6 +54,7 @@
- #include <linux/delay.h>
- #include <linux/module.h>
- #include <linux/percpu.h>
-+#include <asm/cacheflush.h>
- 
- #include <wrapper/ringbuffer/config.h>
- #include <wrapper/ringbuffer/backend.h>
-@@ -1149,6 +1150,47 @@ void lib_ring_buffer_move_consumer(struct lib_ring_buffer *buf,
- }
- EXPORT_SYMBOL_GPL(lib_ring_buffer_move_consumer);
- 
-+#if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
-+static void lib_ring_buffer_flush_read_subbuf_dcache(
-+		const struct lib_ring_buffer_config *config,
-+		struct channel *chan,
-+		struct lib_ring_buffer *buf)
-+{
-+	struct lib_ring_buffer_backend_pages *pages;
-+	unsigned long sb_bindex, id, i, nr_pages;
-+
-+	if (config->output != RING_BUFFER_MMAP)
-+		return;
-+
-+	/*
-+	 * Architectures with caches aliased on virtual addresses may
-+	 * use different cache lines for the linear mapping vs
-+	 * user-space memory mapping. Given that the ring buffer is
-+	 * based on the kernel linear mapping, aligning it with the
-+	 * user-space mapping is not straightforward, and would require
-+	 * extra TLB entries. Therefore, simply flush the dcache for the
-+	 * entire sub-buffer before reading it.
-+	 */
-+	id = buf->backend.buf_rsb.id;
-+	sb_bindex = subbuffer_id_get_index(config, id);
-+	pages = buf->backend.array[sb_bindex];
-+	nr_pages = buf->backend.num_pages_per_subbuf;
-+	for (i = 0; i < nr_pages; i++) {
-+		struct lib_ring_buffer_backend_page *backend_page;
-+
-+		backend_page = &pages->p[i];
-+		flush_dcache_page(pfn_to_page(backend_page->pfn));
-+	}
-+}
-+#else
-+static void lib_ring_buffer_flush_read_subbuf_dcache(
-+		const struct lib_ring_buffer_config *config,
-+		struct channel *chan,
-+		struct lib_ring_buffer *buf)
-+{
-+}
-+#endif
-+
- /**
-  * lib_ring_buffer_get_subbuf - get exclusive access to subbuffer for reading
-  * @buf: ring buffer
-@@ -1291,6 +1333,8 @@ retry:
- 	buf->get_subbuf_consumed = consumed;
- 	buf->get_subbuf = 1;
- 
-+	lib_ring_buffer_flush_read_subbuf_dcache(config, chan, buf);
-+
- 	return 0;
- 
- nodata:
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Add-kmalloc-failover-to-vmalloc.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Add-kmalloc-failover-to-vmalloc.patch
deleted file mode 100644
index 82007691a6..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-Add-kmalloc-failover-to-vmalloc.patch
+++ /dev/null
@@ -1,519 +0,0 @@
-From df57c35ddc8772652d8daa1e53da07f4c7819d8d Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 25 Sep 2017 10:56:20 -0400
-Subject: [PATCH 6/8] Add kmalloc failover to vmalloc
-Organization: O.S. Systems Software LTDA.
-
-This patch is based on the kvmalloc helpers introduced in kernel 4.12.
-
-It will gracefully failover memory allocations of more than one page to
-vmalloc for systems under high memory pressure or fragmentation.
-
-See Linux kernel commit:
-  commit a7c3e901a46ff54c016d040847eda598a9e3e653
-  Author: Michal Hocko <mhocko@suse.com>
-  Date:   Mon May 8 15:57:09 2017 -0700
-
-    mm: introduce kv[mz]alloc helpers
-
-    Patch series "kvmalloc", v5.
-
-    There are many open coded kmalloc with vmalloc fallback instances in the
-    tree.  Most of them are not careful enough or simply do not care about
-    the underlying semantic of the kmalloc/page allocator which means that
-    a) some vmalloc fallbacks are basically unreachable because the kmalloc
-    part will keep retrying until it succeeds b) the page allocator can
-    invoke a really disruptive steps like the OOM killer to move forward
-    which doesn't sound appropriate when we consider that the vmalloc
-    fallback is available.
-
-    As it can be seen implementing kvmalloc requires quite an intimate
-    knowledge if the page allocator and the memory reclaim internals which
-    strongly suggests that a helper should be implemented in the memory
-    subsystem proper.
-
-    Most callers, I could find, have been converted to use the helper
-    instead.  This is patch 6.  There are some more relying on __GFP_REPEAT
-    in the networking stack which I have converted as well and Eric Dumazet
-    was not opposed [2] to convert them as well.
-
-    [1] http://lkml.kernel.org/r/20170130094940.13546-1-mhocko@kernel.org
-    [2] http://lkml.kernel.org/r/1485273626.16328.301.camel@edumazet-glaptop3.roam.corp.google.com
-
-    This patch (of 9):
-
-    Using kmalloc with the vmalloc fallback for larger allocations is a
-    common pattern in the kernel code.  Yet we do not have any common helper
-    for that and so users have invented their own helpers.  Some of them are
-    really creative when doing so.  Let's just add kv[mz]alloc and make sure
-    it is implemented properly.  This implementation makes sure to not make
-    a large memory pressure for > PAGE_SZE requests (__GFP_NORETRY) and also
-    to not warn about allocation failures.  This also rules out the OOM
-    killer as the vmalloc is a more approapriate fallback than a disruptive
-    user visible action.
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lib/prio_heap/lttng_prio_heap.c       |   7 +-
- lib/ringbuffer/ring_buffer_backend.c  |  22 ++---
- lib/ringbuffer/ring_buffer_frontend.c |  13 +--
- lttng-context-perf-counters.c         |   6 +-
- lttng-context.c                       |   6 +-
- lttng-events.c                        |   6 +-
- wrapper/vmalloc.h                     | 169 +++++++++++++++++++++++++++++++++-
- 7 files changed, 198 insertions(+), 31 deletions(-)
-
-diff --git a/lib/prio_heap/lttng_prio_heap.c b/lib/prio_heap/lttng_prio_heap.c
-index 6db7f52..01ed69f 100644
---- a/lib/prio_heap/lttng_prio_heap.c
-+++ b/lib/prio_heap/lttng_prio_heap.c
-@@ -26,6 +26,7 @@
- 
- #include <linux/slab.h>
- #include <lib/prio_heap/lttng_prio_heap.h>
-+#include <wrapper/vmalloc.h>
- 
- #ifdef DEBUG_HEAP
- void lttng_check_heap(const struct lttng_ptr_heap *heap)
-@@ -70,12 +71,12 @@ int heap_grow(struct lttng_ptr_heap *heap, size_t new_len)
- 		return 0;
- 
- 	heap->alloc_len = max_t(size_t, new_len, heap->alloc_len << 1);
--	new_ptrs = kmalloc(heap->alloc_len * sizeof(void *), heap->gfpmask);
-+	new_ptrs = lttng_kvmalloc(heap->alloc_len * sizeof(void *), heap->gfpmask);
- 	if (!new_ptrs)
- 		return -ENOMEM;
- 	if (heap->ptrs)
- 		memcpy(new_ptrs, heap->ptrs, heap->len * sizeof(void *));
--	kfree(heap->ptrs);
-+	lttng_kvfree(heap->ptrs);
- 	heap->ptrs = new_ptrs;
- 	return 0;
- }
-@@ -109,7 +110,7 @@ int lttng_heap_init(struct lttng_ptr_heap *heap, size_t alloc_len,
- 
- void lttng_heap_free(struct lttng_ptr_heap *heap)
- {
--	kfree(heap->ptrs);
-+	lttng_kvfree(heap->ptrs);
- }
- 
- static void heapify(struct lttng_ptr_heap *heap, size_t i)
-diff --git a/lib/ringbuffer/ring_buffer_backend.c b/lib/ringbuffer/ring_buffer_backend.c
-index f760836..3efa1d1 100644
---- a/lib/ringbuffer/ring_buffer_backend.c
-+++ b/lib/ringbuffer/ring_buffer_backend.c
-@@ -71,7 +71,7 @@ int lib_ring_buffer_backend_allocate(const struct lib_ring_buffer_config *config
- 	if (unlikely(!pages))
- 		goto pages_error;
- 
--	bufb->array = kmalloc_node(ALIGN(sizeof(*bufb->array)
-+	bufb->array = lttng_kvmalloc_node(ALIGN(sizeof(*bufb->array)
- 					 * num_subbuf_alloc,
- 				  1 << INTERNODE_CACHE_SHIFT),
- 			GFP_KERNEL | __GFP_NOWARN,
-@@ -90,7 +90,7 @@ int lib_ring_buffer_backend_allocate(const struct lib_ring_buffer_config *config
- 	/* Allocate backend pages array elements */
- 	for (i = 0; i < num_subbuf_alloc; i++) {
- 		bufb->array[i] =
--			kzalloc_node(ALIGN(
-+			lttng_kvzalloc_node(ALIGN(
- 				sizeof(struct lib_ring_buffer_backend_pages) +
- 				sizeof(struct lib_ring_buffer_backend_page)
- 				* num_pages_per_subbuf,
-@@ -102,7 +102,7 @@ int lib_ring_buffer_backend_allocate(const struct lib_ring_buffer_config *config
- 	}
- 
- 	/* Allocate write-side subbuffer table */
--	bufb->buf_wsb = kzalloc_node(ALIGN(
-+	bufb->buf_wsb = lttng_kvzalloc_node(ALIGN(
- 				sizeof(struct lib_ring_buffer_backend_subbuffer)
- 				* num_subbuf,
- 				1 << INTERNODE_CACHE_SHIFT),
-@@ -122,7 +122,7 @@ int lib_ring_buffer_backend_allocate(const struct lib_ring_buffer_config *config
- 		bufb->buf_rsb.id = subbuffer_id(config, 0, 1, 0);
- 
- 	/* Allocate subbuffer packet counter table */
--	bufb->buf_cnt = kzalloc_node(ALIGN(
-+	bufb->buf_cnt = lttng_kvzalloc_node(ALIGN(
- 				sizeof(struct lib_ring_buffer_backend_counts)
- 				* num_subbuf,
- 				1 << INTERNODE_CACHE_SHIFT),
-@@ -154,15 +154,15 @@ int lib_ring_buffer_backend_allocate(const struct lib_ring_buffer_config *config
- 	return 0;
- 
- free_wsb:
--	kfree(bufb->buf_wsb);
-+	lttng_kvfree(bufb->buf_wsb);
- free_array:
- 	for (i = 0; (i < num_subbuf_alloc && bufb->array[i]); i++)
--		kfree(bufb->array[i]);
-+		lttng_kvfree(bufb->array[i]);
- depopulate:
- 	/* Free all allocated pages */
- 	for (i = 0; (i < num_pages && pages[i]); i++)
- 		__free_page(pages[i]);
--	kfree(bufb->array);
-+	lttng_kvfree(bufb->array);
- array_error:
- 	vfree(pages);
- pages_error:
-@@ -191,14 +191,14 @@ void lib_ring_buffer_backend_free(struct lib_ring_buffer_backend *bufb)
- 	if (chanb->extra_reader_sb)
- 		num_subbuf_alloc++;
- 
--	kfree(bufb->buf_wsb);
--	kfree(bufb->buf_cnt);
-+	lttng_kvfree(bufb->buf_wsb);
-+	lttng_kvfree(bufb->buf_cnt);
- 	for (i = 0; i < num_subbuf_alloc; i++) {
- 		for (j = 0; j < bufb->num_pages_per_subbuf; j++)
- 			__free_page(pfn_to_page(bufb->array[i]->p[j].pfn));
--		kfree(bufb->array[i]);
-+		lttng_kvfree(bufb->array[i]);
- 	}
--	kfree(bufb->array);
-+	lttng_kvfree(bufb->array);
- 	bufb->allocated = 0;
- }
- 
-diff --git a/lib/ringbuffer/ring_buffer_frontend.c b/lib/ringbuffer/ring_buffer_frontend.c
-index e77d789..1e43980 100644
---- a/lib/ringbuffer/ring_buffer_frontend.c
-+++ b/lib/ringbuffer/ring_buffer_frontend.c
-@@ -65,6 +65,7 @@
- #include <wrapper/kref.h>
- #include <wrapper/percpu-defs.h>
- #include <wrapper/timer.h>
-+#include <wrapper/vmalloc.h>
- 
- /*
-  * Internal structure representing offsets to use at a sub-buffer switch.
-@@ -147,8 +148,8 @@ void lib_ring_buffer_free(struct lib_ring_buffer *buf)
- 	struct channel *chan = buf->backend.chan;
- 
- 	lib_ring_buffer_print_errors(chan, buf, buf->backend.cpu);
--	kfree(buf->commit_hot);
--	kfree(buf->commit_cold);
-+	lttng_kvfree(buf->commit_hot);
-+	lttng_kvfree(buf->commit_cold);
- 
- 	lib_ring_buffer_backend_free(&buf->backend);
- }
-@@ -245,7 +246,7 @@ int lib_ring_buffer_create(struct lib_ring_buffer *buf,
- 		return ret;
- 
- 	buf->commit_hot =
--		kzalloc_node(ALIGN(sizeof(*buf->commit_hot)
-+		lttng_kvzalloc_node(ALIGN(sizeof(*buf->commit_hot)
- 				   * chan->backend.num_subbuf,
- 				   1 << INTERNODE_CACHE_SHIFT),
- 			GFP_KERNEL | __GFP_NOWARN,
-@@ -256,7 +257,7 @@ int lib_ring_buffer_create(struct lib_ring_buffer *buf,
- 	}
- 
- 	buf->commit_cold =
--		kzalloc_node(ALIGN(sizeof(*buf->commit_cold)
-+		lttng_kvzalloc_node(ALIGN(sizeof(*buf->commit_cold)
- 				   * chan->backend.num_subbuf,
- 				   1 << INTERNODE_CACHE_SHIFT),
- 			GFP_KERNEL | __GFP_NOWARN,
-@@ -305,9 +306,9 @@ int lib_ring_buffer_create(struct lib_ring_buffer *buf,
- 
- 	/* Error handling */
- free_init:
--	kfree(buf->commit_cold);
-+	lttng_kvfree(buf->commit_cold);
- free_commit:
--	kfree(buf->commit_hot);
-+	lttng_kvfree(buf->commit_hot);
- free_chanbuf:
- 	lib_ring_buffer_backend_free(&buf->backend);
- 	return ret;
-diff --git a/lttng-context-perf-counters.c b/lttng-context-perf-counters.c
-index 8afc11f..260e5d0 100644
---- a/lttng-context-perf-counters.c
-+++ b/lttng-context-perf-counters.c
-@@ -119,7 +119,7 @@ void lttng_destroy_perf_counter_field(struct lttng_ctx_field *field)
- #endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,10,0)) */
- 	kfree(field->event_field.name);
- 	kfree(field->u.perf_counter->attr);
--	kfree(events);
-+	lttng_kvfree(events);
- 	kfree(field->u.perf_counter);
- }
- 
-@@ -237,7 +237,7 @@ int lttng_add_perf_counter_to_ctx(uint32_t type,
- 	int ret;
- 	char *name_alloc;
- 
--	events = kzalloc(num_possible_cpus() * sizeof(*events), GFP_KERNEL);
-+	events = lttng_kvzalloc(num_possible_cpus() * sizeof(*events), GFP_KERNEL);
- 	if (!events)
- 		return -ENOMEM;
- 
-@@ -372,6 +372,6 @@ name_alloc_error:
- error_alloc_perf_field:
- 	kfree(attr);
- error_attr:
--	kfree(events);
-+	lttng_kvfree(events);
- 	return ret;
- }
-diff --git a/lttng-context.c b/lttng-context.c
-index 406f479..544e95f 100644
---- a/lttng-context.c
-+++ b/lttng-context.c
-@@ -95,12 +95,12 @@ struct lttng_ctx_field *lttng_append_context(struct lttng_ctx **ctx_p)
- 		struct lttng_ctx_field *new_fields;
- 
- 		ctx->allocated_fields = max_t(size_t, 1, 2 * ctx->allocated_fields);
--		new_fields = kzalloc(ctx->allocated_fields * sizeof(struct lttng_ctx_field), GFP_KERNEL);
-+		new_fields = lttng_kvzalloc(ctx->allocated_fields * sizeof(struct lttng_ctx_field), GFP_KERNEL);
- 		if (!new_fields)
- 			return NULL;
- 		if (ctx->fields)
- 			memcpy(new_fields, ctx->fields, sizeof(*ctx->fields) * ctx->nr_fields);
--		kfree(ctx->fields);
-+		lttng_kvfree(ctx->fields);
- 		ctx->fields = new_fields;
- 	}
- 	field = &ctx->fields[ctx->nr_fields];
-@@ -240,7 +240,7 @@ void lttng_destroy_context(struct lttng_ctx *ctx)
- 		if (ctx->fields[i].destroy)
- 			ctx->fields[i].destroy(&ctx->fields[i]);
- 	}
--	kfree(ctx->fields);
-+	lttng_kvfree(ctx->fields);
- 	kfree(ctx);
- }
- 
-diff --git a/lttng-events.c b/lttng-events.c
-index c86a756..7132485 100644
---- a/lttng-events.c
-+++ b/lttng-events.c
-@@ -130,7 +130,7 @@ struct lttng_session *lttng_session_create(void)
- 	int i;
- 
- 	mutex_lock(&sessions_mutex);
--	session = kzalloc(sizeof(struct lttng_session), GFP_KERNEL);
-+	session = lttng_kvzalloc(sizeof(struct lttng_session), GFP_KERNEL);
- 	if (!session)
- 		goto err;
- 	INIT_LIST_HEAD(&session->chan);
-@@ -161,7 +161,7 @@ struct lttng_session *lttng_session_create(void)
- err_free_cache:
- 	kfree(metadata_cache);
- err_free_session:
--	kfree(session);
-+	lttng_kvfree(session);
- err:
- 	mutex_unlock(&sessions_mutex);
- 	return NULL;
-@@ -210,7 +210,7 @@ void lttng_session_destroy(struct lttng_session *session)
- 	kref_put(&session->metadata_cache->refcount, metadata_cache_destroy);
- 	list_del(&session->list);
- 	mutex_unlock(&sessions_mutex);
--	kfree(session);
-+	lttng_kvfree(session);
- }
- 
- int lttng_session_statedump(struct lttng_session *session)
-diff --git a/wrapper/vmalloc.h b/wrapper/vmalloc.h
-index 2332439..2dd06cb 100644
---- a/wrapper/vmalloc.h
-+++ b/wrapper/vmalloc.h
-@@ -25,6 +25,9 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#include <linux/version.h>
-+#include <linux/vmalloc.h>
-+
- #ifdef CONFIG_KALLSYMS
- 
- #include <linux/kallsyms.h>
-@@ -51,8 +54,6 @@ void wrapper_vmalloc_sync_all(void)
- }
- #else
- 
--#include <linux/vmalloc.h>
--
- static inline
- void wrapper_vmalloc_sync_all(void)
- {
-@@ -60,4 +61,168 @@ void wrapper_vmalloc_sync_all(void)
- }
- #endif
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,12,0))
-+static inline
-+void *lttng_kvmalloc_node(unsigned long size, gfp_t flags, int node)
-+{
-+	void *ret;
-+
-+	ret = kvmalloc_node(size, flags, node);
-+	if (is_vmalloc_addr(ret)) {
-+		/*
-+		 * Make sure we don't trigger recursive page faults in the
-+		 * tracing fast path.
-+		 */
-+		wrapper_vmalloc_sync_all();
-+	}
-+	return ret;
-+}
-+
-+static inline
-+void *lttng_kvzalloc_node(unsigned long size, gfp_t flags, int node)
-+{
-+	return lttng_kvmalloc_node(size, flags | __GFP_ZERO, node);
-+}
-+
-+static inline
-+void *lttng_kvmalloc(unsigned long size, gfp_t flags)
-+{
-+	return lttng_kvmalloc_node(size, flags, NUMA_NO_NODE);
-+}
-+
-+static inline
-+void *lttng_kvzalloc(unsigned long size, gfp_t flags)
-+{
-+	return lttng_kvzalloc_node(size, flags, NUMA_NO_NODE);
-+}
-+
-+static inline
-+void lttng_kvfree(const void *addr)
-+{
-+	kvfree(addr);
-+}
-+
-+#else
-+
-+#include <linux/slab.h>
-+#include <linux/mm.h>
-+
-+/*
-+ * kallsyms wrapper of __vmalloc_node with a fallback to kmalloc_node.
-+ */
-+static inline
-+void *__lttng_vmalloc_node_fallback(unsigned long size, unsigned long align,
-+                         gfp_t gfp_mask, pgprot_t prot, int node, void *caller)
-+{
-+	void *ret;
-+
-+#ifdef CONFIG_KALLSYMS
-+	/*
-+	 * If we have KALLSYMS, get * __vmalloc_node which is not exported.
-+	 */
-+	void *(*lttng__vmalloc_node)(unsigned long size, unsigned long align,
-+			gfp_t gfp_mask, pgprot_t prot, int node, void *caller);
-+
-+	lttng__vmalloc_node = (void *) kallsyms_lookup_funcptr("__vmalloc_node");
-+	ret = lttng__vmalloc_node(size, align, gfp_mask, prot, node, caller);
-+#else
-+	/*
-+	 * If we don't have KALLSYMS, fallback to kmalloc_node.
-+	 */
-+	ret = kmalloc_node(size, flags, node);
-+#endif
-+
-+	return ret;
-+}
-+
-+/**
-+ * lttng_kvmalloc_node - attempt to allocate physically contiguous memory, but upon
-+ * failure, fall back to non-contiguous (vmalloc) allocation.
-+ * @size: size of the request.
-+ * @flags: gfp mask for the allocation - must be compatible with GFP_KERNEL.
-+ *
-+ * Uses kmalloc to get the memory but if the allocation fails then falls back
-+ * to the vmalloc allocator. Use lttng_kvfree to free the memory.
-+ *
-+ * Reclaim modifiers - __GFP_NORETRY, __GFP_REPEAT and __GFP_NOFAIL are not supported
-+ */
-+static inline
-+void *lttng_kvmalloc_node(unsigned long size, gfp_t flags, int node)
-+{
-+	void *ret;
-+
-+	/*
-+	 * vmalloc uses GFP_KERNEL for some internal allocations (e.g page tables)
-+	 * so the given set of flags has to be compatible.
-+	 */
-+	WARN_ON_ONCE((flags & GFP_KERNEL) != GFP_KERNEL);
-+
-+	/*
-+	 * If the allocation fits in a single page, do not fallback.
-+	 */
-+	if (size <= PAGE_SIZE) {
-+		return kmalloc_node(size, flags, node);
-+	}
-+
-+	/*
-+	 * Make sure that larger requests are not too disruptive - no OOM
-+	 * killer and no allocation failure warnings as we have a fallback
-+	 */
-+	ret = kmalloc_node(size, flags | __GFP_NOWARN | __GFP_NORETRY, node);
-+	if (!ret) {
-+		if (node == NUMA_NO_NODE) {
-+			/*
-+			 * If no node was specified, use __vmalloc which is
-+			 * always exported.
-+			 */
-+			ret = __vmalloc(size, flags | __GFP_HIGHMEM, PAGE_KERNEL);
-+		} else {
-+			/*
-+			 * Otherwise, we need to select a node but __vmalloc_node
-+			 * is not exported, use this fallback wrapper which uses
-+			 * kallsyms if available or falls back to kmalloc_node.
-+			 */
-+			ret = __lttng_vmalloc_node_fallback(size, 1,
-+					flags | __GFP_HIGHMEM, PAGE_KERNEL, node,
-+					__builtin_return_address(0));
-+		}
-+
-+		/*
-+		 * Make sure we don't trigger recursive page faults in the
-+		 * tracing fast path.
-+		 */
-+		wrapper_vmalloc_sync_all();
-+	}
-+	return ret;
-+}
-+
-+static inline
-+void *lttng_kvzalloc_node(unsigned long size, gfp_t flags, int node)
-+{
-+	return lttng_kvmalloc_node(size, flags | __GFP_ZERO, node);
-+}
-+
-+static inline
-+void *lttng_kvmalloc(unsigned long size, gfp_t flags)
-+{
-+	return lttng_kvmalloc_node(size, flags, NUMA_NO_NODE);
-+}
-+
-+static inline
-+void *lttng_kvzalloc(unsigned long size, gfp_t flags)
-+{
-+	return lttng_kvzalloc_node(size, flags, NUMA_NO_NODE);
-+}
-+
-+static inline
-+void lttng_kvfree(const void *addr)
-+{
-+	if (is_vmalloc_addr(addr)) {
-+		vfree(addr);
-+	} else {
-+		kfree(addr);
-+	}
-+}
-+#endif
-+
- #endif /* _LTTNG_WRAPPER_VMALLOC_H */
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch
deleted file mode 100644
index 1412db35d6..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ecda9325cd5ad6b69600fd4d88c46095d22f95e1 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 26 Sep 2017 13:46:30 -0400
-Subject: [PATCH 7/8] Fix: vmalloc wrapper on kernel >= 4.12
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- wrapper/vmalloc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wrapper/vmalloc.h b/wrapper/vmalloc.h
-index 2dd06cb..e117584 100644
---- a/wrapper/vmalloc.h
-+++ b/wrapper/vmalloc.h
-@@ -27,6 +27,7 @@
- 
- #include <linux/version.h>
- #include <linux/vmalloc.h>
-+#include <linux/mm.h>
- 
- #ifdef CONFIG_KALLSYMS
- 
-@@ -105,7 +106,6 @@ void lttng_kvfree(const void *addr)
- #else
- 
- #include <linux/slab.h>
--#include <linux/mm.h>
- 
- /*
-  * kallsyms wrapper of __vmalloc_node with a fallback to kmalloc_node.
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch b/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch
deleted file mode 100644
index e7a79c67f1..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a919317a3e3352038c8285a41055b370adc79478 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 26 Sep 2017 14:16:47 -0400
-Subject: [PATCH 8/8] Fix: vmalloc wrapper on kernel < 2.6.38
-Organization: O.S. Systems Software LTDA.
-
-Ensure that all probes end up including the vmalloc wrapper through the
-lttng-tracer.h header so the trace_*() static inlines are generated
-through inclusion of include/trace/events/kmem.h before we define
-CREATE_TRACE_POINTS.
-
-Upstream-Status: Backport [2.9.4]
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- lttng-tracer.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lttng-tracer.h b/lttng-tracer.h
-index 58a7a26..5da882b 100644
---- a/lttng-tracer.h
-+++ b/lttng-tracer.h
-@@ -36,6 +36,7 @@
- 
- #include <wrapper/trace-clock.h>
- #include <wrapper/compiler.h>
-+#include <wrapper/vmalloc.h>
- #include <lttng-tracer-core.h>
- #include <lttng-events.h>
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
similarity index 63%
rename from meta/recipes-kernel/lttng/lttng-modules_2.9.3.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
index f3c04886e1..61d97442d5 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.5.bb
@@ -13,17 +13,10 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-handle-missing-ftrace-header-on-v4.12.patch \
-           file://0002-Fix-sched-for-v4.11.5-rt1.patch \
-           file://0003-Fix-Sleeping-function-called-from-invalid-context.patch \
-           file://0004-Fix-update-ext4-instrumentation-for-kernel-4.13.patch \
-           file://0005-Fix-mmap-caches-aliased-on-virtual-addresses.patch \
-           file://0006-Add-kmalloc-failover-to-vmalloc.patch \
-           file://0007-Fix-vmalloc-wrapper-on-kernel-4.12.patch \
-           file://0008-Fix-vmalloc-wrapper-on-kernel-2.6.38.patch"
-
-SRC_URI[md5sum] = "9abf694dddcc197988189ef65b496f4c"
-SRC_URI[sha256sum] = "f911bca81b02a787474f3d100390dad7447f952525e6d041f50991940246bafe"
+"
+
+SRC_URI[md5sum] = "af97aaaf86133fd783bb9937dc3b4d59"
+SRC_URI[sha256sum] = "3f4e82ceb1c3c1875ec1fe89fba08294ed7feec2161339a5a71a066b27fc3e22"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.15.0


