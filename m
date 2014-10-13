Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 130536ACEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 02:08:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 12 Oct 2014 19:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,707,1406617200"; d="scan'208";a="587747014"
Received: from rebeccas-ilbpg2.png.intel.com ([10.88.227.41])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2014 19:08:49 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Oct 2014 10:08:43 +0800
Message-Id: <1413166123-2719-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1413166123-2719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1413166123-2719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [daisy] [PATCHv2 1/1] lttng-modules: Update to version 2.4.2
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
X-List-Received-Date: Mon, 13 Oct 2014 02:08:51 -0000

lttng-modules breaks when building with kernel 3.10.43.
This updates lttng-modules for 2.4.2 and it will also
fixes the build failure with kernel 3.10.43.

The patch (bio-bvec-iter.patch) was removed since its
fix was available in version 2.4.2.

Fixes for [YOCTO #6788]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../lttng/lttng-modules/bio-bvec-iter.patch        |  156 --------------------
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |   38 -----
 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb   |   38 +++++
 3 files changed, 38 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb

diff --git a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch b/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
deleted file mode 100644
index d6c66e4..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-Upstream-Status: Pending
-
-In 3.14, bi_sector and bi_size were moved into an iterator, thus
-breaking any tracepoints that still expect them in the bio.  Fix up
-the lttng-module tracepoints to use the new scheme when the kernel
-version is >= 3.14.
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-diff --git a/instrumentation/events/lttng-module/block.h b/instrumentation/events/lttng-module/block.h
-index f3b8bff..0a61543 100644
---- a/instrumentation/events/lttng-module/block.h
-+++ b/instrumentation/events/lttng-module/block.h
-@@ -341,9 +341,15 @@ TRACE_EVENT(block_bio_bounce,
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ?
- 					  bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -385,14 +391,24 @@ TRACE_EVENT(block_bio_complete,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
-+
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38))
- 		tp_assign(error, error)
- #else
- 		tp_assign(error, 0)
- #endif
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 	),
- 
- 	TP_printk("%d,%d %s %llu + %u [%d]",
-@@ -419,9 +435,15 @@ DECLARE_EVENT_CLASS(block_bio_merge,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -485,9 +507,15 @@ TRACE_EVENT(block_bio_queue,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -513,9 +541,15 @@ DECLARE_EVENT_CLASS(block_bio,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -587,10 +621,17 @@ DECLARE_EVENT_CLASS(block_get_rq,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
-+		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
-+		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
-+			      bio ? bio->bi_iter.bi_size >> 9 : 0)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio ? bio->bi_sector : 0)
- 		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
- 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
- 			      bio ? bio->bi_size >> 9 : 0)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
-         ),
- 
-@@ -759,9 +800,15 @@ TRACE_EVENT(block_split,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(new_sector, new_sector)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(new_sector, new_sector)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -805,11 +852,19 @@ TRACE_EVENT(block_remap,
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0))
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		tp_assign(old_dev, dev)
-+		tp_assign(old_sector, from)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
-+#else /* #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 		tp_assign(sector, bio->bi_sector)
- 		tp_assign(nr_sector, bio->bi_size >> 9)
- 		tp_assign(old_dev, dev)
- 		tp_assign(old_sector, from)
- 		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+#endif /* #else #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,14,0)) */
- 	),
- 
- 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
deleted file mode 100644
index aa01a8d..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
-DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
-                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
-                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
-
-DEPENDS = "virtual/kernel"
-
-inherit module
-
-SRCREV = "fb2c37799306d16fb590aebee6fad8be431264b7"
-PV = "2.4.0"
-
-# lttng currently blacklists arm with gcc-4.8
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
-
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://bio-bvec-iter.patch"
-
-export INSTALL_MOD_DIR="kernel/lttng-modules"
-export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-
-
-S = "${WORKDIR}/git"
-
-do_install_append() {
-	# Delete empty directories to avoid QA failures if no modules were built
-	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-}
-
-python do_package_prepend() {
-    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
-        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
-}
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
new file mode 100644
index 0000000..1967631
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.2.bb
@@ -0,0 +1,38 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = "virtual/kernel"
+
+inherit module
+
+SRCREV = "85016adfb21268836df48dfb5cda106391e72fd1"
+PV = "2.4.2"
+
+# lttng currently blacklists arm with gcc-4.8
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           "
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+export KERNEL_SRC="${STAGING_KERNEL_DIR}"
+
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
+}
+
-- 
1.7.9.5


