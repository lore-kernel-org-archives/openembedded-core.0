Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE466CE62
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 13:31:40 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i57so1808076yha.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=tjNDUs1vHFsIGgDh8VplSaXQNShsOjvyTPqs9SUD474=;
	b=fCAq7HCqkRl32I5yoQqsKrz5adw/I3sB8Svm8BULLAbsDL5g6v0F9wuLRtGEk4geed
	UTcwcMbHDtNA7WiNy7iNiVHCXIhK9avrjo3aeK5pyQNMu1hyyoN1ncKzugwBuAZXNCaE
	krjMUN1w+gR3z1CofpfFfzSJ52BNT7GnFHpRiXe4CnUjpJ5DPePMAJSdCfvvISXEFHBW
	DZvlJkBlc7lz1AwdxasAUIAuQythcRhqH03nPFFow/933OZ3Hpa/TKfpGNUm6+qjoin7
	3C50CRt+c4cdGSHo2JWsrtuMYhnCjvMhugYASMlvSSsqIrDKPPAarUlZVZnPPF+uF9E0
	nXNw==
X-Received: by 10.236.32.242 with SMTP id o78mr2128045yha.41.1383312702040;
	Fri, 01 Nov 2013 06:31:42 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id c44sm4416968yho.20.2013.11.01.06.31.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 06:31:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 0B0CC16F79283; Fri,  1 Nov 2013 11:31:38 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Nov 2013 11:31:36 -0200
Message-Id: <1383312696-421-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] lttng-modules: Backport fixes to allow use with 3.12 kernels
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
X-List-Received-Date: Fri, 01 Nov 2013 13:31:40 -0000

The 2.3 lttng-modules has support up to 3.11 kernels and the upcoming
3.12 had some API changes which need adjustments. This has been done
in the 2.4 development branch and this patch backports those.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...dump-impl-Use-generic-hard-irqs-for-Linux.patch | 115 +++++++++++++++++++++
 ...-kmem-instrumentation-3.12-kernel-support.patch |  83 +++++++++++++++
 ...date-vmscan-instrumentation-to-Linux-3.12.patch |  44 ++++++++
 ...date-btrfs-instrumentation-to-3.12-kernel.patch |  44 ++++++++
 ...-Update-RCU-instrumentation-to-Linux-3.12.patch |  32 ++++++
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |   7 ++
 6 files changed, 325 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-statedump-impl-Use-generic-hard-irqs-for-Linux.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-update-kmem-instrumentation-3.12-kernel-support.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Update-vmscan-instrumentation-to-Linux-3.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Update-btrfs-instrumentation-to-3.12-kernel.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Update-RCU-instrumentation-to-Linux-3.12.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-statedump-impl-Use-generic-hard-irqs-for-Linux.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-statedump-impl-Use-generic-hard-irqs-for-Linux.patch
new file mode 100644
index 0000000..0bfa9d9
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-statedump-impl-Use-generic-hard-irqs-for-Linux.patch
@@ -0,0 +1,115 @@
+From 1eba72d2cdc5ba4aeea271540b66ed5e1ccc8f65 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Mon, 28 Oct 2013 12:11:00 +0000
+Subject: [PATCH 1/5] lttng-statedump-impl: Use generic hard irqs for Linux >=
+ 3.12
+Organization: O.S. Systems Software LTDA.
+
+Quoting the original patch changelog from Otavio Salvador:
+
+> The Linux kernel 3.12 uses the generic hard irqs system for all
+> architectures and dropped the GENERIC_HARDIRQ option, as can be seen
+> at the commit quoted below:
+>
+> ,----
+> | commit 0244ad004a54e39308d495fee0a2e637f8b5c317
+> | Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
+> | Date:   Fri Aug 30 09:39:53 2013 +0200
+> |
+> |     Remove GENERIC_HARDIRQ config option
+> |
+> |     After the last architecture switched to generic hard irqs the config
+> |     options HAVE_GENERIC_HARDIRQS & GENERIC_HARDIRQS and the related code
+> |     for !CONFIG_GENERIC_HARDIRQS can be removed.
+> |
+> |     Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+> `----
+
+Introduce wrapper/irq.h to move the feature availability testing logic
+into a specific wrapper header. It now tests if the kernel version is
+>= 3.12 or if CONFIG_GENERIC_HARDIRQS is defined (for older kernels).
+Introduce the lttng-specific CONFIG_LTTNG_HAS_LIST_IRQ to track
+availability of this feature within LTTng.
+
+Upstream-Status: Backport [2.4]
+
+Reported-by: Philippe Mangaud <r49081@freescale.com>
+Reported-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ lttng-statedump-impl.c |  5 +++--
+ wrapper/irq.h          | 38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 2 deletions(-)
+ create mode 100644 wrapper/irq.h
+
+diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
+index b8f9d35..1269a3e 100755
+--- a/lttng-statedump-impl.c
++++ b/lttng-statedump-impl.c
+@@ -51,8 +51,9 @@
+ #include "wrapper/spinlock.h"
+ #include "wrapper/fdtable.h"
+ #include "wrapper/nsproxy.h"
++#include "wrapper/irq.h"
+ 
+-#ifdef CONFIG_GENERIC_HARDIRQS
++#ifdef CONFIG_LTTNG_HAS_LIST_IRQ
+ #include <linux/irq.h>
+ #endif
+ 
+@@ -244,7 +245,7 @@ int lttng_enumerate_vm_maps(struct lttng_session *session)
+ }
+ #endif
+ 
+-#ifdef CONFIG_GENERIC_HARDIRQS
++#ifdef CONFIG_LTTNG_HAS_LIST_IRQ
+ 
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,39))
+ #define irq_desc_get_chip(desc) get_irq_desc_chip(desc)
+diff --git a/wrapper/irq.h b/wrapper/irq.h
+new file mode 100644
+index 0000000..b6feb0c
+--- /dev/null
++++ b/wrapper/irq.h
+@@ -0,0 +1,38 @@
++#ifndef _LTTNG_WRAPPER_IRQ_H
++#define _LTTNG_WRAPPER_IRQ_H
++
++/*
++ * wrapper/irq.h
++ *
++ * wrapper around linux/irq.h.
++ *
++ * Copyright (C) 2013 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; only
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
++ */
++
++#include <linux/version.h>
++
++/*
++ * Starting from the 3.12 Linux kernel, all architectures use the
++ * generic hard irqs system. More details can be seen at commit
++ * 0244ad004a54e39308d495fee0a2e637f8b5c317 in the Linux kernel GIT.
++ */
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0) \
++	|| defined(CONFIG_GENERIC_HARDIRQS))
++# define CONFIG_LTTNG_HAS_LIST_IRQ
++#endif
++
++#endif /* _LTTNG_WRAPPER_IRQ_H */
+-- 
+1.8.4.rc3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-update-kmem-instrumentation-3.12-kernel-support.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-update-kmem-instrumentation-3.12-kernel-support.patch
new file mode 100644
index 0000000..2cb863f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-update-kmem-instrumentation-3.12-kernel-support.patch
@@ -0,0 +1,83 @@
+From 5d857b0808aace9ffb3e18d6e4920f2a8f697b84 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 31 Oct 2013 10:14:32 -0400
+Subject: [PATCH 2/5] update: kmem instrumentation 3.12 kernel support
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Backport [2.4]
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/kmem.h | 49 ++++++++++++++++++++++++++++++
+ 1 file changed, 49 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/kmem.h b/instrumentation/events/lttng-module/kmem.h
+index 7607fc0..2bc70a8 100644
+--- a/instrumentation/events/lttng-module/kmem.h
++++ b/instrumentation/events/lttng-module/kmem.h
+@@ -286,6 +286,52 @@ DEFINE_EVENT_PRINT(mm_page, mm_page_pcpu_drain,
+ 		__entry->order, __entry->migratetype)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++
++TRACE_EVENT(mm_page_alloc_extfrag,
++
++	TP_PROTO(struct page *page,
++			int alloc_order, int fallback_order,
++			int alloc_migratetype, int fallback_migratetype,
++			int change_ownership),
++
++	TP_ARGS(page,
++		alloc_order, fallback_order,
++		alloc_migratetype, fallback_migratetype,
++		change_ownership),
++
++	TP_STRUCT__entry(
++		__field_hex(	struct page *,	page			)
++		__field(	int,		alloc_order		)
++		__field(	int,		fallback_order		)
++		__field(	int,		alloc_migratetype	)
++		__field(	int,		fallback_migratetype	)
++		__field(	int,		change_ownership	)
++	),
++
++	TP_fast_assign(
++		tp_assign(page, page)
++		tp_assign(alloc_order, alloc_order)
++		tp_assign(fallback_order, fallback_order)
++		tp_assign(alloc_migratetype, alloc_migratetype)
++		tp_assign(fallback_migratetype, fallback_migratetype)
++		tp_assign(change_ownership, change_ownership)
++	),
++
++	TP_printk("page=%p pfn=%lu alloc_order=%d fallback_order=%d pageblock_order=%d alloc_migratetype=%d fallback_migratetype=%d fragmenting=%d change_ownership=%d",
++		__entry->page,
++		page_to_pfn(__entry->page),
++		__entry->alloc_order,
++		__entry->fallback_order,
++		pageblock_order,
++		__entry->alloc_migratetype,
++		__entry->fallback_migratetype,
++		__entry->fallback_order < pageblock_order,
++		__entry->change_ownership)
++)
++
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
++
+ TRACE_EVENT(mm_page_alloc_extfrag,
+ 
+ 	TP_PROTO(struct page *page,
+@@ -323,6 +369,9 @@ TRACE_EVENT(mm_page_alloc_extfrag,
+ 		__entry->fallback_order < pageblock_order,
+ 		__entry->alloc_migratetype == __entry->fallback_migratetype)
+ )
++
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
++
+ #endif
+ 
+ #endif /* _TRACE_KMEM_H */
+-- 
+1.8.4.rc3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Update-vmscan-instrumentation-to-Linux-3.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Update-vmscan-instrumentation-to-Linux-3.12.patch
new file mode 100644
index 0000000..34534ab
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Update-vmscan-instrumentation-to-Linux-3.12.patch
@@ -0,0 +1,44 @@
+From b18e22ea88cef38a0adfe66503fd3ed16fc87c7f Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 31 Oct 2013 10:20:52 -0400
+Subject: [PATCH 3/5] Update vmscan instrumentation to Linux 3.12
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Backport [2.4]
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/vmscan.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/vmscan.h b/instrumentation/events/lttng-module/vmscan.h
+index 75a6685..1fd50ba 100644
+--- a/instrumentation/events/lttng-module/vmscan.h
++++ b/instrumentation/events/lttng-module/vmscan.h
+@@ -212,7 +212,11 @@ TRACE_EVENT(mm_shrink_slab_start,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(shr,shr)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++		tp_assign(shrink, shr->scan_objects)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
+ 		tp_assign(shrink, shr->shrink)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
+ 		tp_assign(nr_objects_to_shrink, nr_objects_to_shrink)
+ 		tp_assign(gfp_flags, sc->gfp_mask)
+ 		tp_assign(pgs_scanned, pgs_scanned)
+@@ -251,7 +255,11 @@ TRACE_EVENT(mm_shrink_slab_end,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(shr, shr)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++		tp_assign(shrink, shr->scan_objects)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
+ 		tp_assign(shrink, shr->shrink)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
+ 		tp_assign(unused_scan, unused_scan_cnt)
+ 		tp_assign(new_scan, new_scan_cnt)
+ 		tp_assign(retval, shrinker_retval)
+-- 
+1.8.4.rc3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Update-btrfs-instrumentation-to-3.12-kernel.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Update-btrfs-instrumentation-to-3.12-kernel.patch
new file mode 100644
index 0000000..0e9aafa
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Update-btrfs-instrumentation-to-3.12-kernel.patch
@@ -0,0 +1,44 @@
+From 77a0cc12342293349812fcf6206db31b86ca42a0 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 31 Oct 2013 10:22:22 -0400
+Subject: [PATCH 4/5] Update btrfs instrumentation to 3.12 kernel
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Backport [2.4]
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/btrfs.h | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index d3afe33..8a8fa66 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -40,7 +40,22 @@ struct extent_state;
+ 		{ BTRFS_SHARED_DATA_REF_KEY, 	"SHARED_DATA_REF" })
+ 
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++#define __show_root_type(obj)						\
++	__print_symbolic_u64(obj,					\
++		{ BTRFS_ROOT_TREE_OBJECTID, 	"ROOT_TREE"	},	\
++		{ BTRFS_EXTENT_TREE_OBJECTID, 	"EXTENT_TREE"	},	\
++		{ BTRFS_CHUNK_TREE_OBJECTID, 	"CHUNK_TREE"	},	\
++		{ BTRFS_DEV_TREE_OBJECTID, 	"DEV_TREE"	},	\
++		{ BTRFS_FS_TREE_OBJECTID, 	"FS_TREE"	},	\
++		{ BTRFS_ROOT_TREE_DIR_OBJECTID, "ROOT_TREE_DIR"	},	\
++		{ BTRFS_CSUM_TREE_OBJECTID, 	"CSUM_TREE"	},	\
++		{ BTRFS_TREE_LOG_OBJECTID,	"TREE_LOG"	},	\
++		{ BTRFS_QUOTA_TREE_OBJECTID,	"QUOTA_TREE"	},	\
++		{ BTRFS_TREE_RELOC_OBJECTID,	"TREE_RELOC"	},	\
++		{ BTRFS_UUID_TREE_OBJECTID,	"UUID_RELOC"	},	\
++		{ BTRFS_DATA_RELOC_TREE_OBJECTID, "DATA_RELOC_TREE" })
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
+ #define __show_root_type(obj)						\
+ 	__print_symbolic_u64(obj,					\
+ 		{ BTRFS_ROOT_TREE_OBJECTID, 	"ROOT_TREE"	},	\
+-- 
+1.8.4.rc3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Update-RCU-instrumentation-to-Linux-3.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Update-RCU-instrumentation-to-Linux-3.12.patch
new file mode 100644
index 0000000..cf86b8e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Update-RCU-instrumentation-to-Linux-3.12.patch
@@ -0,0 +1,32 @@
+From 5eb8705d39abd3d2668d3b118584039f70e39e5d Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Thu, 31 Oct 2013 10:25:01 -0400
+Subject: [PATCH 5/5] Update RCU instrumentation to Linux 3.12
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Backport [2.4]
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ instrumentation/events/lttng-module/rcu.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/rcu.h b/instrumentation/events/lttng-module/rcu.h
+index ec541ba..1220fb7 100644
+--- a/instrumentation/events/lttng-module/rcu.h
++++ b/instrumentation/events/lttng-module/rcu.h
+@@ -20,7 +20,11 @@
+  */
+ TRACE_EVENT(rcu_utilization,
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0))
++	TP_PROTO(const char *s),
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
+ 	TP_PROTO(char *s),
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,12,0)) */
+ 
+ 	TP_ARGS(s),
+ 
+-- 
+1.8.4.rc3
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index e887a86..b21d426 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -16,6 +16,13 @@ PV = "2.3.2+git${SRCPV}"
 SRC_URI = "git://git.lttng.org/lttng-modules.git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
+# Backport from 2.4 development branch
+SRC_URI += "file://0001-lttng-statedump-impl-Use-generic-hard-irqs-for-Linux.patch \
+            file://0002-update-kmem-instrumentation-3.12-kernel-support.patch \
+            file://0003-Update-vmscan-instrumentation-to-Linux-3.12.patch \
+            file://0004-Update-btrfs-instrumentation-to-3.12-kernel.patch \
+            file://0005-Update-RCU-instrumentation-to-Linux-3.12.patch"
+
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
 
-- 
1.8.4.rc3


