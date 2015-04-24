Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF8D73D87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sNlb008512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:23 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:16 -0700
Message-ID: <f9d94074f008342f6f0988037817d62bee2539dc.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] lttng-modules: remove bio-bvec-iter.patch
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:24 -0000
Content-Type: text/plain

It is aready in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../lttng/lttng-modules/bio-bvec-iter.patch        |  156 --------------------
 1 file changed, 156 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch

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
-- 
1.7.9.5


