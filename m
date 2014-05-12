Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f176.google.com (unknown [209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7283E6608D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:48 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id p9so7399712lbv.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nYUoG5aHxDXsZA8mCYmED9ebqLR2mJN/rqIwmPQ5vr4=;
	b=C8hm9xPHiuQXh4Ac2g9ZBUueF+Tz2i27bncBLG8WBYO7GC4QyRLC87PyRpDXrQgYRO
	8urNmNSBshHOvqwMtaO4n7VYKR4Lm93EriZjbHLhf7dFlCnTNzqD8AUT0zeAolKthVpC
	VohPqsujFcb1LaCP98GNWbLcFjT0d63JOAuLg+LD9BZvZi/ks7TrBZn77LzwL7xAsvKs
	caLXJINR0r0lkF5UO7aIKtVE5sN4hIF6nkonmsatdsjSV1IRomfRft7XV8RSkAWj7HAY
	DUszBSGRdFAs4vcOJJ4UE9b0/Mh5jt5/3r5dmGNzns48M7171QqQiLzyXLp3ncw7OAH0
	HswQ==
X-Received: by 10.152.10.2 with SMTP id e2mr6348lab.76.1399894488687;
	Mon, 12 May 2014 04:34:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k2sm13570361lbm.23.2014.05.12.04.34.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:48 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:54 +0200
Message-Id: <74c36af3ac7c4bfc0e4573a3b3106dabc4df1d31.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 05/10] lttng-modules-2.3.3: Fix build on ARM
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
X-List-Received-Date: Mon, 12 May 2014 11:34:50 -0000

From: Khem Raj <raj.khem@gmail.com>

Update the structure to work with immutable bio_vecs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lttng/lttng-modules/fixup_block_driver.patch   | 122 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   4 +-
 2 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
new file mode 100644
index 0000000..3644a47
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
@@ -0,0 +1,122 @@
+Fix errors like
+
+block.h:344:24: error: 'struct bio' has no member named 'bi_sector'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: git/instrumentation/events/lttng-module/block.h
+===================================================================
+--- git.orig/instrumentation/events/lttng-module/block.h	2014-05-02 22:20:01.814125429 -0700
++++ git/instrumentation/events/lttng-module/block.h	2014-05-02 22:28:48.927455709 -0700
+@@ -341,9 +341,9 @@
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev ?
+ 					  bio->bi_bdev->bd_dev : 0)
+-		tp_assign(sector, bio->bi_sector)
+-		tp_assign(nr_sector, bio->bi_size >> 9)
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -385,14 +385,14 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
+-		tp_assign(sector, bio->bi_sector)
+-		tp_assign(nr_sector, bio->bi_size >> 9)
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38))
+ 		tp_assign(error, error)
+ #else
+ 		tp_assign(error, 0)
+ #endif
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 	),
+ 
+ 	TP_printk("%d,%d %s %llu + %u [%d]",
+@@ -419,9 +419,9 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
+-		tp_assign(sector, bio->bi_sector)
+-		tp_assign(nr_sector, bio->bi_size >> 9)
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -485,9 +485,9 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
+-		tp_assign(sector, bio->bi_sector)
+-		tp_assign(nr_sector, bio->bi_size >> 9)
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -513,9 +513,9 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
+-		tp_assign(sector, bio->bi_sector)
+-		tp_assign(nr_sector, bio->bi_size >> 9)
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -587,10 +587,10 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
+-		tp_assign(sector, bio ? bio->bi_sector : 0)
+-		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
++		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
++		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
+ 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
+-			      bio ? bio->bi_size >> 9 : 0)
++			      bio ? bio->bi_iter.bi_size >> 9 : 0)
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+         ),
+ 
+@@ -759,9 +759,9 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
+-		tp_assign(sector, bio->bi_sector)
++		tp_assign(sector, bio->bi_iter.bi_sector)
+ 		tp_assign(new_sector, new_sector)
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
+ 	),
+ 
+@@ -805,11 +805,11 @@
+ 
+ 	TP_fast_assign(
+ 		tp_assign(dev, bio->bi_bdev->bd_dev)
+-		tp_assign(sector, bio->bi_sector)
+-		tp_assign(nr_sector, bio->bi_size >> 9)
++		tp_assign(sector, bio->bi_iter.bi_sector)
++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
+ 		tp_assign(old_dev, dev)
+ 		tp_assign(old_sector, from)
+-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
+ 	),
+ 
+ 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
index dd06546..94e18b2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
@@ -14,7 +14,9 @@ SRCREV = "eef112db0e63feff6cbf0a98cda9af607cefb377"
 PV = "2.3.3"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.3 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
+           file://fixup_block_driver.patch \
+          "
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
-- 
1.9.2


