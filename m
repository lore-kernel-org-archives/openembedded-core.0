Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f181.google.com (unknown [209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1641E65FFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 12:08:41 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id ld13so4153066vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=K1ShDJ1k2LGFqrmupwiMKu0WDO1crgHvXLEDSXBDKWk=;
	b=uwnE+xW0p8qLgUnRsm43zyyYByN0TUPjnGtgKYjEfJz1j+VbImUEe+GgZcH0xWCeTo
	RgKIKNj4VPu+nBdBDS1fHY/KzAZyMWabF6pQBAwMWMCBr6zt4ADY422o0ONDtr10SiKb
	GSjC+bvqNKExY/0aioQuUU9yG82AoS6vu4nbzxMCw/uE+nK2HjiXhR+U/Jeuhr2JtbMk
	IKWoMkpHaNI5VWfdSDezPQxq7cve19OI91OEwYu771CYLSH+9kUuskkMI7MgR4/Nc3Ab
	Hi/YFcwnnxRVpZNfcnikX0oOXNwGFexTnbsk/qroq+lFsCk0NeWVrVevkzzBTg42/Uz1
	K40w==
X-Received: by 10.52.228.134 with SMTP id si6mr6952900vdc.5.1400155722246;
	Thu, 15 May 2014 05:08:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	sy5sm3359569vdb.26.2014.05.15.05.08.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 05:08:41 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2014 14:09:08 +0200
Message-Id: <1400155748-26271-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] lttng-modules: Fix build with older kernels
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
X-List-Received-Date: Thu, 15 May 2014 12:08:42 -0000

* forward port this patch from daisy:
  commit c11b29ff4f24af0445c3c6a694b8dc2037dcd7e4
  Author: Tom Zanussi <tom.zanussi@intel.com>
  Date:   Thu Mar 6 22:26:20 2014 -0600

    lttng-modules: Fix 3.14 bio tracepoints

* how is it possible that it's in daisy but not in master?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 +++++++++++++++++++++
 .../lttng/lttng-modules/fixup_block_driver.patch   | 122 ----------------
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   2 +-
 3 files changed, 157 insertions(+), 123 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch

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
diff --git a/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
deleted file mode 100644
index 3644a47..0000000
--- a/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-Fix errors like
-
-block.h:344:24: error: 'struct bio' has no member named 'bi_sector'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: git/instrumentation/events/lttng-module/block.h
-===================================================================
---- git.orig/instrumentation/events/lttng-module/block.h	2014-05-02 22:20:01.814125429 -0700
-+++ git/instrumentation/events/lttng-module/block.h	2014-05-02 22:28:48.927455709 -0700
-@@ -341,9 +341,9 @@
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ?
- 					  bio->bi_bdev->bd_dev : 0)
--		tp_assign(sector, bio->bi_sector)
--		tp_assign(nr_sector, bio->bi_size >> 9)
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -385,14 +385,14 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
--		tp_assign(sector, bio->bi_sector)
--		tp_assign(nr_sector, bio->bi_size >> 9)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38))
- 		tp_assign(error, error)
- #else
- 		tp_assign(error, 0)
- #endif
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 	),
- 
- 	TP_printk("%d,%d %s %llu + %u [%d]",
-@@ -419,9 +419,9 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
--		tp_assign(sector, bio->bi_sector)
--		tp_assign(nr_sector, bio->bi_size >> 9)
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -485,9 +485,9 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
--		tp_assign(sector, bio->bi_sector)
--		tp_assign(nr_sector, bio->bi_size >> 9)
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -513,9 +513,9 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
--		tp_assign(sector, bio->bi_sector)
--		tp_assign(nr_sector, bio->bi_size >> 9)
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -587,10 +587,10 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
--		tp_assign(sector, bio ? bio->bi_sector : 0)
--		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
-+		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
-+		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
- 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
--			      bio ? bio->bi_size >> 9 : 0)
-+			      bio ? bio->bi_iter.bi_size >> 9 : 0)
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
-         ),
- 
-@@ -759,9 +759,9 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
--		tp_assign(sector, bio->bi_sector)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
- 		tp_assign(new_sector, new_sector)
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
- 	),
- 
-@@ -805,11 +805,11 @@
- 
- 	TP_fast_assign(
- 		tp_assign(dev, bio->bi_bdev->bd_dev)
--		tp_assign(sector, bio->bi_sector)
--		tp_assign(nr_sector, bio->bi_size >> 9)
-+		tp_assign(sector, bio->bi_iter.bi_sector)
-+		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
- 		tp_assign(old_dev, dev)
- 		tp_assign(old_sector, from)
--		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
-+		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
- 	),
- 
- 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
index 94e18b2..81a3983 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
@@ -15,7 +15,7 @@ PV = "2.3.3"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.3 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://fixup_block_driver.patch \
+           file://bio-bvec-iter.patch \
           "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-- 
1.9.3


