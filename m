Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7usSQpJLI/hNFZmja1zsopeNU8wacm4xuiF4vwC4tyD0MV9C73Ux2vdPJ2ZY3RZ3Y9HudkgyaC
 roeQZvK9Uacw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917807"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917807"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:13 -0700
IronPort-SDR: /f6wwwfO4G35ZpBNkRcv7Z/x7AR7Jq+dTyzL32TwRLi3/E/IRe5qXyYTXCyU0TKNtj5jrvxLI0
 3X6ysAlQzZ1w==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645768"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:11 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/15] lttng-modules: backport patches to fix build against 5.12+ kernel
Date: Wed, 12 May 2021 16:35:40 +0800
Message-Id: <86bcab9e9f4ee5e06f7db8c75d4b983fd2be59d2.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vinícius Ossanes Aquino <vinicius.aquino@ossystems.com.br>

Add the following patches from stable-2.12 branch of lttng repository
to fix errors when building lttng-modules against 5.12+ kernel
since they are not present on the release 2.12.5:

- 17cd2dc9 fix: block: add a disk_uevent helper (v5.12)
- 127135b6 fix backport: block: add a disk_uevent helper (v5.12)
- 853d5903 fix: mm, tracing: kfree event name mismatching with
provider kmem (v5.12)

Signed-off-by: Vinicius Aquino <vinicius.aquino@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2538ba2b3490e3599d9ccd637aa8486ea428f1b0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...block-add-a-disk_uevent-helper-v5.12.patch | 305 ++++++++++++++++++
 ...block-add-a-disk_uevent-helper-v5.12.patch |  48 +++
 ...free-event-name-mismatching-with-pro.patch |  71 ++++
 .../lttng/lttng-modules_2.12.5.bb             |   3 +
 4 files changed, 427 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
new file mode 100644
index 0000000000..3a2280ccdc
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
@@ -0,0 +1,305 @@
+From 17cd2dc91cb82ed342b0da699f2b1a70c1bf6a03 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 15 Mar 2021 14:54:02 -0400
+Subject: [PATCH 2/4] fix: block: add a disk_uevent helper (v5.12)
+
+See upstream commit:
+
+  commit bc359d03c7ec1bf3b86d03bafaf6bbb21e6414fd
+  Author: Christoph Hellwig <hch@lst.de>
+  Date:   Sun Jan 24 11:02:39 2021 +0100
+
+    block: add a disk_uevent helper
+
+    Add a helper to call kobject_uevent for the disk and all partitions, and
+    unexport the disk_part_iter_* helpers that are now only used in the core
+    block code.
+
+Upstream-status: Backport [2.12.6]
+
+Change-Id: If6e8797049642ab382d5699660ee1dd734e92c90
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ Makefile               |   1 +
+ lttng-statedump-impl.c |  34 +++++++++----
+ src/wrapper/genhd.c    | 111 +++++++++++++++++++++++++++++++++++++++++
+ wrapper/genhd.h        |  62 +++++++++++++++++++++++
+ 4 files changed, 198 insertions(+), 10 deletions(-)
+ create mode 100644 src/wrapper/genhd.c
+
+diff --git a/Makefile b/Makefile
+index a9aff3f1..34043cfb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -80,6 +80,7 @@ ifneq ($(KERNELRELEASE),)
+                         wrapper/kallsyms.o \
+                         wrapper/irqdesc.o \
+                         wrapper/fdtable.o \
++                        wrapper/genhd.o \
+                         lttng-wrapper-impl.o
+ 
+   ifneq ($(CONFIG_HAVE_SYSCALL_TRACEPOINTS),)
+diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
+index 60b937c9..5511c7e8 100644
+--- a/lttng-statedump-impl.c
++++ b/lttng-statedump-impl.c
+@@ -250,13 +250,17 @@ int lttng_enumerate_block_devices(struct lttng_session *session)
+ 	struct device_type *ptr_disk_type;
+ 	struct class_dev_iter iter;
+ 	struct device *dev;
++	int ret = 0;
+ 
+ 	ptr_block_class = wrapper_get_block_class();
+-	if (!ptr_block_class)
+-		return -ENOSYS;
++	if (!ptr_block_class) {
++		ret = -ENOSYS;
++		goto end;
++	}
+ 	ptr_disk_type = wrapper_get_disk_type();
+ 	if (!ptr_disk_type) {
+-		return -ENOSYS;
++		ret = -ENOSYS;
++		goto end;
+ 	}
+ 	class_dev_iter_init(&iter, ptr_block_class, NULL, ptr_disk_type);
+ 	while ((dev = class_dev_iter_next(&iter))) {
+@@ -272,22 +276,32 @@ int lttng_enumerate_block_devices(struct lttng_session *session)
+ 		    (disk->flags & GENHD_FL_SUPPRESS_PARTITION_INFO))
+ 			continue;
+ 
+-		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
+-		while ((part = disk_part_iter_next(&piter))) {
++		/*
++		 * The original 'disk_part_iter_init' returns void, but our
++		 * wrapper can fail to lookup the original symbol.
++		 */
++		if (wrapper_disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0) < 0) {
++			ret = -ENOSYS;
++			goto iter_exit;
++		}
++
++		while ((part = wrapper_disk_part_iter_next(&piter))) {
+ 			char name_buf[BDEVNAME_SIZE];
+ 
+ 			if (lttng_get_part_name(disk, part, name_buf) == -ENOSYS) {
+-				disk_part_iter_exit(&piter);
+-				class_dev_iter_exit(&iter);
+-				return -ENOSYS;
++				wrapper_disk_part_iter_exit(&piter);
++				ret = -ENOSYS;
++				goto iter_exit;
+ 			}
+ 			trace_lttng_statedump_block_device(session,
+ 					lttng_get_part_devt(part), name_buf);
+ 		}
+-		disk_part_iter_exit(&piter);
++		wrapper_disk_part_iter_exit(&piter);
+ 	}
++iter_exit:
+ 	class_dev_iter_exit(&iter);
+-	return 0;
++end:
++	return ret;
+ }
+ 
+ #ifdef CONFIG_INET
+diff --git a/src/wrapper/genhd.c b/src/wrapper/genhd.c
+new file mode 100644
+index 00000000..a5a6c410
+--- /dev/null
++++ b/src/wrapper/genhd.c
+@@ -0,0 +1,111 @@
++/* SPDX-License-Identifier: (GPL-2.0-only OR LGPL-2.1-only)
++ *
++ * wrapper/genhd.c
++ *
++ * Wrapper around disk_part_iter_(init|next|exit). Using KALLSYMS to get the
++ * addresses when available, else we need to have a kernel that exports this
++ * function to GPL modules. This export was removed in 5.12.
++ *
++ * Copyright (C) 2021 Michael Jeanson <mjeanson@efficios.com>
++ */
++
++#include <lttng/kernel-version.h>
++#include <linux/module.h>
++#include <wrapper/genhd.h>
++
++#if (defined(CONFIG_KALLSYMS) && \
++	(LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0)))
++
++#include <wrapper/kallsyms.h>
++
++static
++void (*disk_part_iter_init_sym)(struct disk_part_iter *piter, struct gendisk *disk,
++			unsigned int flags);
++
++static
++LTTNG_DISK_PART_TYPE *(*disk_part_iter_next_sym)(struct disk_part_iter *piter);
++
++static
++void (*disk_part_iter_exit_sym)(struct disk_part_iter *piter);
++
++/*
++ * This wrapper has an 'int' return type instead of the original 'void', to be
++ * able to report the symbol lookup failure to the caller.
++ *
++ * Return 0 on success, -1 on error.
++ */
++int wrapper_disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
++                          unsigned int flags)
++{
++	if (!disk_part_iter_init_sym)
++		disk_part_iter_init_sym = (void *) kallsyms_lookup_funcptr("disk_part_iter_init");
++
++	if (disk_part_iter_init_sym) {
++		disk_part_iter_init_sym(piter, disk, flags);
++	} else {
++		printk_once(KERN_WARNING "LTTng: disk_part_iter_init symbol lookup failed.\n");
++		return -1;
++	}
++	return 0;
++}
++EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_init);
++
++LTTNG_DISK_PART_TYPE *wrapper_disk_part_iter_next(struct disk_part_iter *piter)
++{
++	if (!disk_part_iter_next_sym)
++		disk_part_iter_next_sym = (void *) kallsyms_lookup_funcptr("disk_part_iter_next");
++
++	if (disk_part_iter_next_sym) {
++		return disk_part_iter_next_sym(piter);
++	} else {
++		printk_once(KERN_WARNING "LTTng: disk_part_iter_next symbol lookup failed.\n");
++		return NULL;
++	}
++}
++EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_next);
++
++/*
++ * We don't return an error on symbol lookup failure here because there is
++ * nothing the caller can do to cleanup the iterator.
++ */
++void wrapper_disk_part_iter_exit(struct disk_part_iter *piter)
++{
++	if (!disk_part_iter_exit_sym)
++		disk_part_iter_exit_sym = (void *) kallsyms_lookup_funcptr("disk_part_iter_exit");
++
++	if (disk_part_iter_exit_sym) {
++		disk_part_iter_exit_sym(piter);
++	} else {
++		printk_once(KERN_WARNING "LTTng: disk_part_iter_exit symbol lookup failed.\n");
++	}
++}
++EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_exit);
++
++#else
++
++/*
++ * This wrapper has an 'int' return type instead of the original 'void', so the
++ * kallsyms variant can report the symbol lookup failure to the caller.
++ *
++ * This variant always succeeds and returns 0.
++ */
++int wrapper_disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
++                          unsigned int flags)
++{
++	disk_part_iter_init(piter, disk, flags);
++	return 0;
++}
++EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_init);
++
++LTTNG_DISK_PART_TYPE *wrapper_disk_part_iter_next(struct disk_part_iter *piter)
++{
++	return disk_part_iter_next(piter);
++}
++EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_next);
++
++void wrapper_disk_part_iter_exit(struct disk_part_iter *piter)
++{
++	disk_part_iter_exit(piter);
++}
++EXPORT_SYMBOL_GPL(wrapper_disk_part_iter_exit);
++#endif
+diff --git a/wrapper/genhd.h b/wrapper/genhd.h
+index 98feb57b..6bae239d 100644
+--- a/wrapper/genhd.h
++++ b/wrapper/genhd.h
+@@ -13,6 +13,13 @@
+ #define _LTTNG_WRAPPER_GENHD_H
+ 
+ #include <linux/genhd.h>
++#include <lttng/kernel-version.h>
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
++#define LTTNG_DISK_PART_TYPE struct block_device
++#else
++#define LTTNG_DISK_PART_TYPE struct hd_struct
++#endif
+ 
+ #ifdef CONFIG_KALLSYMS_ALL
+ 
+@@ -94,4 +101,59 @@ struct device_type *wrapper_get_disk_type(void)
+ 
+ #endif
+ 
++/*
++ * This wrapper has an 'int' return type instead of the original 'void', to be
++ * able to report the symbol lookup failure to the caller.
++ *
++ * Return 0 on success, -1 on error.
++ */
++int wrapper_disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
++                          unsigned int flags);
++LTTNG_DISK_PART_TYPE *wrapper_disk_part_iter_next(struct disk_part_iter *piter);
++void wrapper_disk_part_iter_exit(struct disk_part_iter *piter);
++
++/*
++ * Canary function to check for 'disk_part_iter_init()' at compile time.
++ *
++ * From 'include/linux/genhd.h':
++ *
++ *   extern void disk_part_iter_init(struct disk_part_iter *piter,
++ *                                   struct gendisk *disk, unsigned int flags);
++ *
++ */
++static inline
++void __canary__disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
++		unsigned int flags)
++{
++	disk_part_iter_init(piter, disk, flags);
++}
++
++/*
++ * Canary function to check for 'disk_part_iter_next()' at compile time.
++ *
++ * From 'include/linux/genhd.h':
++ *
++ *   struct block_device *disk_part_iter_next(struct disk_part_iter *piter);
++ *
++ */
++static inline
++LTTNG_DISK_PART_TYPE *__canary__disk_part_iter_next(struct disk_part_iter *piter)
++{
++	return disk_part_iter_next(piter);
++}
++
++/*
++ * Canary function to check for 'disk_part_iter_exit()' at compile time.
++ *
++ * From 'include/linux/genhd.h':
++ *
++ *   extern void disk_part_iter_exit(struct disk_part_iter *piter);
++ *
++ */
++static inline
++void __canary__disk_part_iter_exit(struct disk_part_iter *piter)
++{
++	return disk_part_iter_exit(piter);
++}
++
+ #endif /* _LTTNG_WRAPPER_GENHD_H */
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
new file mode 100644
index 0000000000..e32b3e7a2e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
@@ -0,0 +1,48 @@
+From 127135b6a45d5fca828815c62308f72de97e5739 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 15 Apr 2021 13:56:24 -0400
+Subject: [PATCH 3/4] fix backport: block: add a disk_uevent helper (v5.12)
+
+Upstream-Status: Backport [2.12.6]
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I717162069990577abe78e5e7fed28816f32b2c84
+---
+ {src/wrapper => wrapper}/genhd.c | 2 +-
+ wrapper/genhd.h                  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+ rename {src/wrapper => wrapper}/genhd.c (98%)
+
+diff --git a/src/wrapper/genhd.c b/wrapper/genhd.c
+similarity index 98%
+rename from src/wrapper/genhd.c
+rename to wrapper/genhd.c
+index a5a6c410..cbec06f7 100644
+--- a/src/wrapper/genhd.c
++++ b/wrapper/genhd.c
+@@ -9,7 +9,7 @@
+  * Copyright (C) 2021 Michael Jeanson <mjeanson@efficios.com>
+  */
+ 
+-#include <lttng/kernel-version.h>
++#include <lttng-kernel-version.h>
+ #include <linux/module.h>
+ #include <wrapper/genhd.h>
+ 
+diff --git a/wrapper/genhd.h b/wrapper/genhd.h
+index 6bae239d..1b4a4201 100644
+--- a/wrapper/genhd.h
++++ b/wrapper/genhd.h
+@@ -13,7 +13,7 @@
+ #define _LTTNG_WRAPPER_GENHD_H
+ 
+ #include <linux/genhd.h>
+-#include <lttng/kernel-version.h>
++#include <lttng-kernel-version.h>
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,11,0))
+ #define LTTNG_DISK_PART_TYPE struct block_device
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch
new file mode 100644
index 0000000000..dfc9427dca
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch
@@ -0,0 +1,71 @@
+From 853d5903a200d8a15b3f38780ddaea5c92fa1a03 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Mon, 19 Apr 2021 09:09:28 +0000
+Subject: [PATCH 4/4] fix: mm, tracing: kfree event name mismatching with
+ provider kmem (v5.12)
+
+a8bc8ae5c932 ("fix: mm, tracing: record slab name for kmem_cache_free() (v5.12)")
+introduces the following call trace for kfree. This is caused by mismatch
+between kfree event and its provider kmem.
+
+This patch maps kfree to kmem_kfree.
+
+WARNING: CPU: 2 PID: 42294 at src/lttng-probes.c:81 fixup_lazy_probes+0xb0/0x1b0 [lttng_tracer]
+CPU: 2 PID: 42294 Comm: modprobe Tainted: G           O      5.12.0-rc6-yoctodev-standard #1
+Hardware name: Intel Corporation JACOBSVILLE/JACOBSVILLE, BIOS JBVLCRB2.86B.0014.P20.2004020248 04/02/2020
+RIP: 0010:fixup_lazy_probes+0xb0/0x1b0 [lttng_tracer]
+Code: 75 28 83 c3 01 3b 5d c4 74 22 48 8b 4d d0 48 63
+      c3 4c 89 e2 4c 89 f6 48 8b 04 c1 4c 8b 38 4c 89
+      ff e8 64 9f 4b de 85 c0 74 c3 <0f> 0b 48 8b 05 bf
+      f2 1e 00 48 8d 50 e8 48 3d f0 a0 98 c0 75 18 eb
+RSP: 0018:ffffb976807bfbe0 EFLAGS: 00010286
+RAX: 00000000ffffffff RBX: 0000000000000004 RCX: 0000000000000004
+RDX: 0000000000000066 RSI: ffffffffc03c10a7 RDI: ffffffffc03c11a1
+RBP: ffffb976807bfc28 R08: 0000000000000000 R09: 0000000000000001
+R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000004
+R13: ffffffffc03c2000 R14: ffffffffc03c10a7 R15: ffffffffc03c11a1
+FS:  00007f0ef9533740(0000) GS:ffffa100faa00000(0000) knlGS:0000000000000000
+CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+CR2: 0000561e8f0aa000 CR3: 000000015b318000 CR4: 0000000000350ee0
+Call Trace:
+ lttng_probe_register+0x38/0xe0 [lttng_tracer]
+ ? __event_probe__module_load+0x520/0x520 [lttng_probe_module]
+ __lttng_events_init__module+0x15/0x20 [lttng_probe_module]
+ do_one_initcall+0x68/0x310
+ ? kmem_cache_alloc_trace+0x2ad/0x4c0
+ ? do_init_module+0x28/0x280
+ do_init_module+0x62/0x280
+ load_module+0x26e4/0x2920
+ ? kernel_read_file+0x22e/0x290
+ __do_sys_finit_module+0xb1/0xf0
+ __x64_sys_finit_module+0x1a/0x20
+ do_syscall_64+0x38/0x50
+ entry_SYSCALL_64_after_hwframe+0x44/0xae
+
+Upstream-Status: Backport [2.12.6]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I00e8ee2b8c35f6f8602c88295f5113fbbd139709
+---
+ instrumentation/events/lttng-module/kmem.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/kmem.h b/instrumentation/events/lttng-module/kmem.h
+index d787ea54..c9edee61 100644
+--- a/instrumentation/events/lttng-module/kmem.h
++++ b/instrumentation/events/lttng-module/kmem.h
+@@ -88,7 +88,9 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0))
+-LTTNG_TRACEPOINT_EVENT(kfree,
++LTTNG_TRACEPOINT_EVENT_MAP(kfree,
++
++	kmem_kfree,
+ 
+ 	TP_PROTO(unsigned long call_site, const void *ptr),
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
index 5b05c644a6..1a01cb0c01 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
@@ -15,6 +15,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch  \
            file://0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch \
            file://0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch \
+           file://0005-fix-block-add-a-disk_uevent-helper-v5.12.patch \
+           file://0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch \
+           file://0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch \
            "
 
 SRC_URI[sha256sum] = "c4d1a1b42c728e37b6b7947ae16563a011c4b297311aa04d56f9a1791fb5a30a"
-- 
2.31.1

