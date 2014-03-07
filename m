Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 358106F5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 04:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 20:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,605,1389772800"; d="scan'208";a="468174224"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 20:26:29 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 22:26:20 -0600
Message-Id: <559c29b94ee401c6fb179fbc4b763cdf0c57e614.1394165774.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394165774.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394165774.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394165774.git.tom.zanussi@linux.intel.com>
References: <cover.1394165774.git.tom.zanussi@linux.intel.com>
Subject: [PATCH 5/7] lttng-modules: Fix 3.14 bio tracepoints
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
X-List-Received-Date: Fri, 07 Mar 2014 04:26:29 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The mainline 3.14 commit 'block: Astract out bvec iterator' broke the
lttng-modules tracepoints.  Fix them here.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |   3 +-
 2 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch b/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
new file mode 100644
index 0000000..d6c66e4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
@@ -0,0 +1,156 @@
+Upstream-Status: Pending
+
+In 3.14, bi_sector and bi_size were moved into an iterator, thus
+breaking any tracepoints that still expect them in the bio.  Fix up
+the lttng-module tracepoints to use the new scheme when the kernel
+version is >= 3.14.
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+
+diff --git a/instrumentation/events/lttng-module/block.h b/instrumentation/events/lttng-module/block.h
+index f3b8bff..0a61543 100644
+--- a/instrumentation/events/lttng-module/block.h
++++ b/instrumentation/events/lttng-module/block.h
+@@ -341,9 +341,15 @@ TRACE_EVENT(block_bio_bounce,
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev ?
+ 					  bio->bi_bdev->bd_dev : 0)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(nr_sector, bio->bi_size >> 9)
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -385,14 +391,24 @@ TRACE_EVENT(block_bio_complete,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(nr_sector, bio->bi_size >> 9)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38))
+ 		tp_assign(error, error)
+ #else
+ 		tp_assign(error, 0)
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 	),
+ 
+ 	TP_printk("%d,%d %s %llu + %u [%d]",
+@@ -419,9 +435,15 @@ DECLARE_EVENT_CLASS(block_bio_merge,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(nr_sector, bio->bi_size >> 9)
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -485,9 +507,15 @@ TRACE_EVENT(block_bio_queue,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(nr_sector, bio->bi_size >> 9)
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -513,9 +541,15 @@ DECLARE_EVENT_CLASS(block_bio,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(nr_sector, bio->bi_size >> 9)
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -587,10 +621,17 @@ DECLARE_EVENT_CLASS(block_get_rq,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
++		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
++		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
++			      bio ? bio->bi_iter.bi_size >> 9 : 0)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio ? bio->bi_sector : 0)
+ 		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
+ 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
+ 			      bio ? bio->bi_size >> 9 : 0)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+         ),
+ 
+@@ -759,9 +800,15 @@ TRACE_EVENT(block_split,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(new_sector, new_sector)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(new_sector, new_sector)
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -805,11 +852,19 @@ TRACE_EVENT(block_remap,
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		tp_assign(old_dev, dev)
++		tp_assign(old_sector, from)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
++#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 		tp_assign(sector, bio->bi_sector)
+ 		tp_assign(nr_sector, bio->bi_size >> 9)
+ 		tp_assign(old_dev, dev)
+ 		tp_assign(old_sector, from)
+ 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
+ 	),
+ 
+ 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
index 797ed4e..aa01a8d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
@@ -17,7 +17,8 @@ PV = "2.4.0"
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           file://bio-bvec-iter.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-- 
1.8.3.1


