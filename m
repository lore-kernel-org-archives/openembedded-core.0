Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tfr5CMw1fVFKZjRhluSEiTh9T5jSGn5QLQsybgjyodQhK8Gsmqdwjl/Y5G1ChvJ2HJRPnze0Jv
 tPlNFyzTeHNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236034"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236034"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:10 -0800
IronPort-SDR: 7ji8LtgfC4XykKyWZxEjswLI2jAbiiprKjDN1ofatpNGz8DRElLTVcCvuWNL35vpF39kqi7rRI
 scloOS3/ZpVw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027568"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/35] lttng-modules: fix build against v5.10+
Date: Wed, 23 Dec 2020 23:18:23 +0800
Message-Id: <6d1169d2c046d8fa6220ab04863672557aa42cf1.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

lttng-modules doesn't currently build against the lastest 5.10-rc
versions.

Upstream lttng does have fixes for the issues, but hasn't done a
release that contains them yet. There are other patches on the
2.12.x branch, but I've skipped them for now as they aren't
necessary for 5.10 builds, and can be picked up with the next
full update.

We also bump the dev-upstream hash to make them easier to pickup
for those building from git.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47201e98bb293d59c5d41986d066fd7614b914fa)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 ++++++++
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ++++++++++++++++
 ...ext4-fast-commit-recovery-path-v5.10.patch |  99 +++++++++
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 ++++++++
 ...int-Optimize-using-static_call-v5.10.patch | 196 ++++++++++++++++++
 ...defined-symbols-caused-by-incorrect-.patch |  55 +++++
 .../lttng/lttng-modules_2.12.3.bb             |  10 +-
 7 files changed, 707 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-ext4-fast-commit-recovery-path-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
new file mode 100644
index 0000000000..fde9398394
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
@@ -0,0 +1,88 @@
+From 37b9cb0e6cb92181b7a25583849a9d161a558982 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 26 Oct 2020 13:41:02 -0400
+Subject: [PATCH 07/19] fix: objtool: Rename frame.h -> objtool.h (v5.10)
+
+See upstream commit :
+
+  commit 00089c048eb4a8250325efb32a2724fd0da68cce
+  Author: Julien Thierry <jthierry@redhat.com>
+  Date:   Fri Sep 4 16:30:25 2020 +0100
+
+    objtool: Rename frame.h -> objtool.h
+
+    Header frame.h is getting more code annotations to help objtool analyze
+    object files.
+
+    Rename the file to objtool.h.
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ic2283161bebcbf1e33b72805eb4d2628f4ae3e89
+---
+ lttng-filter-interpreter.c     |  2 +-
+ wrapper/{frame.h => objtool.h} | 19 ++++++++++++-------
+ 2 files changed, 13 insertions(+), 8 deletions(-)
+ rename wrapper/{frame.h => objtool.h} (50%)
+
+diff --git a/lttng-filter-interpreter.c b/lttng-filter-interpreter.c
+index 21169f01..5d572437 100644
+--- a/lttng-filter-interpreter.c
++++ b/lttng-filter-interpreter.c
+@@ -8,7 +8,7 @@
+  */
+ 
+ #include <wrapper/uaccess.h>
+-#include <wrapper/frame.h>
++#include <wrapper/objtool.h>
+ #include <wrapper/types.h>
+ #include <linux/swab.h>
+ 
+diff --git a/wrapper/frame.h b/wrapper/objtool.h
+similarity index 50%
+rename from wrapper/frame.h
+rename to wrapper/objtool.h
+index 6e6dc811..3b997cae 100644
+--- a/wrapper/frame.h
++++ b/wrapper/objtool.h
+@@ -1,18 +1,23 @@
+-/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)
++/* SPDX-License-Identifier: (GPL-2.0-only or LGPL-2.1-only)
+  *
+- * wrapper/frame.h
++ * wrapper/objtool.h
+  *
+  * Copyright (C) 2016 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+  */
+ 
+-#ifndef _LTTNG_WRAPPER_FRAME_H
+-#define _LTTNG_WRAPPER_FRAME_H
++#ifndef _LTTNG_WRAPPER_OBJTOOL_H
++#define _LTTNG_WRAPPER_OBJTOOL_H
+ 
+ #include <linux/version.h>
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+-
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++#include <linux/objtool.h>
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+ #include <linux/frame.h>
++#endif
++
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+ 
+ #define LTTNG_STACK_FRAME_NON_STANDARD(func) \
+ 	STACK_FRAME_NON_STANDARD(func)
+@@ -23,4 +28,4 @@
+ 
+ #endif
+ 
+-#endif /* _LTTNG_WRAPPER_FRAME_H */
++#endif /* _LTTNG_WRAPPER_OBJTOOL_H */
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
new file mode 100644
index 0000000000..bc87c7174e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
@@ -0,0 +1,179 @@
+From ddad4e82bc2cc48c0eb56d2daf69409026e8b31a Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 27 Oct 2020 12:10:05 -0400
+Subject: [PATCH 09/19] fix: btrfs: make ordered extent tracepoint take
+ btrfs_inode (v5.10)
+
+See upstream commit :
+
+  commit acbf1dd0fcbd10c67826a19958f55a053b32f532
+  Author: Nikolay Borisov <nborisov@suse.com>
+  Date:   Mon Aug 31 14:42:40 2020 +0300
+
+    btrfs: make ordered extent tracepoint take btrfs_inode
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I096d0801ffe0ad826cfe414cdd1c0857cbd2b624
+---
+ instrumentation/events/lttng-module/btrfs.h | 120 +++++++++++++++-----
+ 1 file changed, 90 insertions(+), 30 deletions(-)
+
+diff --git a/instrumentation/events/lttng-module/btrfs.h b/instrumentation/events/lttng-module/btrfs.h
+index 52fcfd0d..d47f3280 100644
+--- a/instrumentation/events/lttng-module/btrfs.h
++++ b/instrumentation/events/lttng-module/btrfs.h
+@@ -346,7 +346,29 @@ LTTNG_TRACEPOINT_EVENT(btrfs_handle_em_exist,
+ )
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, inode->root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(ino_t, ino, btrfs_ino(inode))
++		ctf_integer(u64, file_offset, ordered->file_offset)
++		ctf_integer(u64, start, ordered->disk_bytenr)
++		ctf_integer(u64, len, ordered->num_bytes)
++		ctf_integer(u64, disk_len, ordered->disk_num_bytes)
++		ctf_integer(u64, bytes_left, ordered->bytes_left)
++		ctf_integer(unsigned long, flags, ordered->flags)
++		ctf_integer(int, compress_type, ordered->compress_type)
++		ctf_integer(int, refs, refcount_read(&ordered->refs))
++		ctf_integer(u64, root_objectid, inode->root->root_key.objectid)
++	)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
+ 
+ 	TP_PROTO(const struct inode *inode,
+@@ -458,7 +480,39 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__ordered_extent,
+ )
+ #endif
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
++
++	TP_PROTO(const struct btrfs_inode *inode,
++		 const struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
+@@ -494,7 +548,41 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
+ 
+ 	TP_ARGS(inode, ordered)
+ )
++#else
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
+ 
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
++
++	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
++
++	TP_ARGS(inode, ordered)
++)
++#endif
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,14,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
++	LTTNG_SLE_KERNEL_RANGE(4,4,103,6,0,0, 4,5,0,0,0,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__writepage,
+ 
+ 	TP_PROTO(const struct page *page, const struct inode *inode,
+@@ -563,34 +651,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_sync_file,
+ 	)
+ )
+ #else
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_add,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_remove,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_start,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__ordered_extent, btrfs_ordered_extent_put,
+-
+-	TP_PROTO(struct inode *inode, struct btrfs_ordered_extent *ordered),
+-
+-	TP_ARGS(inode, ordered)
+-)
+-
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__writepage,
+ 
+ 	TP_PROTO(struct page *page, struct inode *inode,
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0010-fix-ext4-fast-commit-recovery-path-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0010-fix-ext4-fast-commit-recovery-path-v5.10.patch
new file mode 100644
index 0000000000..fb00a44b31
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0010-fix-ext4-fast-commit-recovery-path-v5.10.patch
@@ -0,0 +1,99 @@
+From a28235f8ffa3c961640a835686dddb5ca600dfaf Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 26 Oct 2020 17:03:23 -0400
+Subject: [PATCH 10/19] fix: ext4: fast commit recovery path (v5.10)
+
+See upstream commit :
+
+  commit 8016e29f4362e285f0f7e38fadc61a5b7bdfdfa2
+  Author: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
+  Date:   Thu Oct 15 13:37:59 2020 -0700
+
+    ext4: fast commit recovery path
+
+    This patch adds fast commit recovery path support for Ext4 file
+    system. We add several helper functions that are similar in spirit to
+    e2fsprogs journal recovery path handlers. Example of such functions
+    include - a simple block allocator, idempotent block bitmap update
+    function etc. Using these routines and the fast commit log in the fast
+    commit area, the recovery path (ext4_fc_replay()) performs fast commit
+    log recovery.
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ia65cf44e108f2df0b458f0d335f33a8f18f50baa
+---
+ instrumentation/events/lttng-module/ext4.h | 41 ++++++++++++++++++++++
+ 1 file changed, 41 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/ext4.h b/instrumentation/events/lttng-module/ext4.h
+index b172c8d9..6e74abad 100644
+--- a/instrumentation/events/lttng-module/ext4.h
++++ b/instrumentation/events/lttng-module/ext4.h
+@@ -1274,6 +1274,18 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_load_extent,
+ 	)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
++	TP_PROTO(struct super_block *sb, unsigned long ino),
++
++	TP_ARGS(sb, ino),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(ino_t, ino, ino)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
+ 	TP_PROTO(struct inode *inode),
+ 
+@@ -1284,6 +1296,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
+ 		ctf_integer(ino_t, ino, inode->i_ino)
+ 	)
+ )
++#endif
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,5,0))
+ 
+@@ -1895,6 +1908,34 @@ LTTNG_TRACEPOINT_EVENT(ext4_es_shrink_exit,
+ 
+ #endif
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++LTTNG_TRACEPOINT_EVENT(ext4_fc_replay_scan,
++	TP_PROTO(struct super_block *sb, int error, int off),
++
++	TP_ARGS(sb, error, off),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(int, error, error)
++		ctf_integer(int, off, off)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_fc_replay,
++	TP_PROTO(struct super_block *sb, int tag, int ino, int priv1, int priv2),
++
++	TP_ARGS(sb, tag, ino, priv1, priv2),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(int, tag, tag)
++		ctf_integer(int, ino, ino)
++		ctf_integer(int, priv1, priv1)
++		ctf_integer(int, priv2, priv2)
++	)
++)
++#endif
++
+ #endif /* LTTNG_TRACE_EXT4_H */
+ 
+ /* This part must be outside protection */
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
new file mode 100644
index 0000000000..8651bded99
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
@@ -0,0 +1,82 @@
+From e30866f96b3ab02639f429e4bd34e59b3a336579 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 26 Oct 2020 14:28:35 -0400
+Subject: [PATCH 12/19] fix: kvm: x86/mmu: Add TDP MMU PF handler (v5.10)
+
+See upstream commit :
+
+  commit bb18842e21111a979e2e0e1c5d85c09646f18d51
+  Author: Ben Gardon <bgardon@google.com>
+  Date:   Wed Oct 14 11:26:50 2020 -0700
+
+    kvm: x86/mmu: Add TDP MMU PF handler
+
+    Add functions to handle page faults in the TDP MMU. These page faults
+    are currently handled in much the same way as the x86 shadow paging
+    based MMU, however the ordering of some operations is slightly
+    different. Future patches will add eager NX splitting, a fast page fault
+    handler, and parallel page faults.
+
+    Tested by running kvm-unit-tests and KVM selftests on an Intel Haswell
+    machine. This series introduced no new failures.
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ie56959cb6c77913d2f1188b0ca15da9114623a4e
+---
+ .../lttng-module/arch/x86/kvm/mmutrace.h      | 20 ++++++++++++++++++-
+ probes/lttng-probe-kvm-x86-mmu.c              |  5 +++++
+ 2 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
+index e5470400..86717835 100644
+--- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
++++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
+@@ -163,7 +163,25 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kvm_mmu_page_class, kvm_mmu_prepare_zap_page,
+ 	TP_ARGS(sp)
+ )
+ 
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++
++LTTNG_TRACEPOINT_EVENT_MAP(
++	mark_mmio_spte,
++
++	kvm_mmu_mark_mmio_spte,
++
++	TP_PROTO(u64 *sptep, gfn_t gfn, u64 spte),
++	TP_ARGS(sptep, gfn, spte),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, sptep, sptep)
++		ctf_integer(gfn_t, gfn, gfn)
++		ctf_integer(unsigned, access, spte & ACC_ALL)
++		ctf_integer(unsigned int, gen, get_mmio_spte_generation(spte))
++	)
++)
++
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_MAP(
+ 	mark_mmio_spte,
+diff --git a/probes/lttng-probe-kvm-x86-mmu.c b/probes/lttng-probe-kvm-x86-mmu.c
+index 8f981865..5043c776 100644
+--- a/probes/lttng-probe-kvm-x86-mmu.c
++++ b/probes/lttng-probe-kvm-x86-mmu.c
+@@ -31,6 +31,11 @@
+ #include <../../arch/x86/kvm/mmutrace.h>
+ #endif
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++#include <../arch/x86/kvm/mmu.h>
++#include <../arch/x86/kvm/mmu/spte.h>
++#endif
++
+ #undef TRACE_INCLUDE_PATH
+ #undef TRACE_INCLUDE_FILE
+ 
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch
new file mode 100644
index 0000000000..5892a408b3
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch
@@ -0,0 +1,196 @@
+From bb346792c2cb6995ffc08d2084121935c6384865 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 26 Oct 2020 17:09:05 -0400
+Subject: [PATCH 14/19] fix: tracepoint: Optimize using static_call() (v5.10)
+
+See upstream commit :
+
+  commit d25e37d89dd2f41d7acae0429039d2f0ae8b4a07
+  Author: Steven Rostedt (VMware) <rostedt@goodmis.org>
+  Date:   Tue Aug 18 15:57:52 2020 +0200
+
+    tracepoint: Optimize using static_call()
+
+    Currently the tracepoint site will iterate a vector and issue indirect
+    calls to however many handlers are registered (ie. the vector is
+    long).
+
+    Using static_call() it is possible to optimize this for the common
+    case of only having a single handler registered. In this case the
+    static_call() can directly call this handler. Otherwise, if the vector
+    is longer than 1, call a function that iterates the whole vector like
+    the current code.
+
+Upstream-Status: Backport
+
+Change-Id: I739dd84d62cc1a821b8bd8acff74fa29aa25d22f
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ lttng-statedump-impl.c    | 80 +++++++++++++++++++++++++++++++--------
+ probes/lttng.c            |  7 +++-
+ tests/probes/lttng-test.c |  7 +++-
+ wrapper/tracepoint.h      |  8 ++++
+ 4 files changed, 84 insertions(+), 18 deletions(-)
+
+diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
+index a6fa71a5..67ecd33c 100644
+--- a/lttng-statedump-impl.c
++++ b/lttng-statedump-impl.c
+@@ -55,26 +55,76 @@
+ #define LTTNG_INSTRUMENTATION
+ #include <instrumentation/events/lttng-module/lttng-statedump.h>
+ 
+-DEFINE_TRACE(lttng_statedump_block_device);
+-DEFINE_TRACE(lttng_statedump_end);
+-DEFINE_TRACE(lttng_statedump_interrupt);
+-DEFINE_TRACE(lttng_statedump_file_descriptor);
+-DEFINE_TRACE(lttng_statedump_start);
+-DEFINE_TRACE(lttng_statedump_process_state);
+-DEFINE_TRACE(lttng_statedump_process_pid_ns);
++LTTNG_DEFINE_TRACE(lttng_statedump_block_device,
++	TP_PROTO(struct lttng_session *session,
++		dev_t dev, const char *diskname),
++	TP_ARGS(session, dev, diskname));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_end,
++	TP_PROTO(struct lttng_session *session),
++	TP_ARGS(session));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_interrupt,
++	TP_PROTO(struct lttng_session *session,
++		unsigned int irq, const char *chip_name,
++		struct irqaction *action),
++	TP_ARGS(session, irq, chip_name, action));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_file_descriptor,
++	TP_PROTO(struct lttng_session *session,
++		struct files_struct *files,
++		int fd, const char *filename,
++		unsigned int flags, fmode_t fmode),
++	TP_ARGS(session, files, fd, filename, flags, fmode));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_start,
++	TP_PROTO(struct lttng_session *session),
++	TP_ARGS(session));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_state,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		int type, int mode, int submode, int status,
++		struct files_struct *files),
++	TP_ARGS(session, p, type, mode, submode, status, files));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_pid_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct pid_namespace *pid_ns),
++	TP_ARGS(session, p, pid_ns));
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0))
+-DEFINE_TRACE(lttng_statedump_process_cgroup_ns);
++LTTNG_DEFINE_TRACE(lttng_statedump_process_cgroup_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct cgroup_namespace *cgroup_ns),
++	TP_ARGS(session, p, cgroup_ns));
+ #endif
+-DEFINE_TRACE(lttng_statedump_process_ipc_ns);
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_ipc_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct ipc_namespace *ipc_ns),
++	TP_ARGS(session, p, ipc_ns));
++
+ #ifndef LTTNG_MNT_NS_MISSING_HEADER
+-DEFINE_TRACE(lttng_statedump_process_mnt_ns);
++LTTNG_DEFINE_TRACE(lttng_statedump_process_mnt_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct mnt_namespace *mnt_ns),
++	TP_ARGS(session, p, mnt_ns));
+ #endif
+-DEFINE_TRACE(lttng_statedump_process_net_ns);
+-DEFINE_TRACE(lttng_statedump_process_user_ns);
+-DEFINE_TRACE(lttng_statedump_process_uts_ns);
+-DEFINE_TRACE(lttng_statedump_network_interface);
++
++LTTNG_DEFINE_TRACE(lttng_statedump_network_interface,
++	TP_PROTO(struct lttng_session *session,
++		struct net_device *dev, struct in_ifaddr *ifa),
++	TP_ARGS(session, dev, ifa));
++
+ #ifdef LTTNG_HAVE_STATEDUMP_CPU_TOPOLOGY
+-DEFINE_TRACE(lttng_statedump_cpu_topology);
++LTTNG_DEFINE_TRACE(lttng_statedump_cpu_topology,
++	TP_PROTO(struct lttng_session *session, struct cpuinfo_x86 *c),
++	TP_ARGS(session, c));
+ #endif
+ 
+ struct lttng_fd_ctx {
+diff --git a/probes/lttng.c b/probes/lttng.c
+index 05bc1388..7ddaa69f 100644
+--- a/probes/lttng.c
++++ b/probes/lttng.c
+@@ -8,7 +8,7 @@
+  */
+ 
+ #include <linux/module.h>
+-#include <linux/tracepoint.h>
++#include <wrapper/tracepoint.h>
+ #include <linux/uaccess.h>
+ #include <linux/gfp.h>
+ #include <linux/fs.h>
+@@ -32,7 +32,10 @@
+ #define LTTNG_LOGGER_COUNT_MAX	1024
+ #define LTTNG_LOGGER_FILE	"lttng-logger"
+ 
+-DEFINE_TRACE(lttng_logger);
++LTTNG_DEFINE_TRACE(lttng_logger,
++	PARAMS(const char __user *text, size_t len),
++	PARAMS(text, len)
++);
+ 
+ static struct proc_dir_entry *lttng_logger_dentry;
+ 
+diff --git a/tests/probes/lttng-test.c b/tests/probes/lttng-test.c
+index b450e7d7..a4fa0645 100644
+--- a/tests/probes/lttng-test.c
++++ b/tests/probes/lttng-test.c
+@@ -25,7 +25,12 @@
+ #define LTTNG_INSTRUMENTATION
+ #include <instrumentation/events/lttng-module/lttng-test.h>
+ 
+-DEFINE_TRACE(lttng_test_filter_event);
++LTTNG_DEFINE_TRACE(lttng_test_filter_event,
++	PARAMS(int anint, int netint, long *values,
++		char *text, size_t textlen,
++		char *etext, uint32_t * net_values),
++	PARAMS(anint, netint, values, text, textlen, etext, net_values)
++);
+ 
+ #define LTTNG_TEST_FILTER_EVENT_FILE	"lttng-test-filter-event"
+ 
+diff --git a/wrapper/tracepoint.h b/wrapper/tracepoint.h
+index c4ba0123..bc19d8c1 100644
+--- a/wrapper/tracepoint.h
++++ b/wrapper/tracepoint.h
+@@ -14,6 +14,14 @@
+ #include <linux/tracepoint.h>
+ #include <linux/module.h>
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,10,0))
++#define LTTNG_DEFINE_TRACE(name, proto, args)		\
++	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
++#else
++#define LTTNG_DEFINE_TRACE(name, proto, args)		\
++	DEFINE_TRACE(name)
++#endif
++
+ #ifndef HAVE_KABI_2635_TRACEPOINT
+ 
+ #define kabi_2635_tracepoint_probe_register tracepoint_probe_register
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch b/meta/recipes-kernel/lttng/lttng-modules/0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch
new file mode 100644
index 0000000000..e848e16f59
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch
@@ -0,0 +1,55 @@
+From 31f8bf794172102e9758928b481856c4a8800a7f Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Mon, 23 Nov 2020 18:14:25 +0800
+Subject: [PATCH 16/19] fix: statedump: undefined symbols caused by incorrect
+ patch backport
+
+bb346792c2cb ("fix: tracepoint: Optimize using static_call() (v5.10)")
+misses three definitions and causes the following build failures.
+
+ERROR: "__tracepoint_lttng_statedump_process_net_ns" [lttng-statedump.ko] undefined!
+ERROR: "__tracepoint_lttng_statedump_process_user_ns" [lttng-statedump.ko] undefined!
+ERROR: "__tracepoint_lttng_statedump_process_uts_ns" [lttng-statedump.ko] undefined!
+
+Fixes: #1290
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ lttng-statedump-impl.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/lttng-statedump-impl.c b/lttng-statedump-impl.c
+index 67ecd33c..cf803a73 100644
+--- a/lttng-statedump-impl.c
++++ b/lttng-statedump-impl.c
+@@ -116,6 +116,24 @@ LTTNG_DEFINE_TRACE(lttng_statedump_process_mnt_ns,
+ 	TP_ARGS(session, p, mnt_ns));
+ #endif
+ 
++LTTNG_DEFINE_TRACE(lttng_statedump_process_net_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct net *net_ns),
++	TP_ARGS(session, p, net_ns));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_user_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct user_namespace *user_ns),
++	TP_ARGS(session, p, user_ns));
++
++LTTNG_DEFINE_TRACE(lttng_statedump_process_uts_ns,
++	TP_PROTO(struct lttng_session *session,
++		struct task_struct *p,
++		struct uts_namespace *uts_ns),
++	TP_ARGS(session, p, uts_ns));
++
+ LTTNG_DEFINE_TRACE(lttng_statedump_network_interface,
+ 	TP_PROTO(struct lttng_session *session,
+ 		struct net_device *dev, struct in_ifaddr *ifa),
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
index ca79e27df6..3515e4f51e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.3.bb
@@ -12,6 +12,12 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            file://0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch \
+           file://0007-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch \
+           file://0009-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch \
+           file://0010-fix-ext4-fast-commit-recovery-path-v5.10.patch \
+           file://0012-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch \
+           file://0014-fix-tracepoint-Optimize-using-static_call-v5.10.patch \
+           file://0016-fix-statedump-undefined-symbols-caused-by-incorrect-.patch \
            "
 
 SRC_URI[sha256sum] = "673ef85c9f03e9b8fed10795e09d4e68add39404b70068d08b10f7b85754d7f0"
@@ -37,7 +43,7 @@ SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.1
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "ad594e3a953db1b0c3c059fde45b5a5494f6be78"
-PV_class-devupstream = "2.12.2+git${SRCPV}"
+SRCREV_class-devupstream = "be71b60a327d7ad2588abc5cad2861177119972b"
+PV_class-devupstream = "2.12.3+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.29.2

