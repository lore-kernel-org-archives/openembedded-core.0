Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D307C54E5C
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:34:22 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.2602.1709840052308729158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTSIuDa3;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6908b540cdbso5606926d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709840051; x=1710444851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2idQSxyw0s4UrQZaPhmF+8n1+thbxR88JblW6DQxNok=;
        b=LTSIuDa3GqdE6e8JkIqYF+IdNenaobN+IejRnMyFNsorADzRUK7tToT4OeVfCXhk91
         Iclke4T3h5zXGJPwcXCxeT/rAeEY8rgAlULa270iJgQwmbRq90C8TnZGrlZFrBEXWo6z
         r5i78KRYIakOxEun6/n5VAzToh18ReAXD8r8k/b5zysl31XwBVPT7IgE/+qASru5MyFg
         2RoAg+bnVnL9ITm3mM3RkvYqe5MuuUhkbCEDGC/kPNNc4s4g6pNA+enr6SGT3Hr/vAab
         Qdpr+R+tmK7vVbRUZOMRaxpLqPBo6RC2xsfGC3V9tNKnN4KtzNcK8/jztDVzatZz7QXX
         WoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709840051; x=1710444851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2idQSxyw0s4UrQZaPhmF+8n1+thbxR88JblW6DQxNok=;
        b=irl46FJOuSHdr2aTLyl8rPRYINKEyg8sanB/WGhVgzftaaVa3U9q1dJB8QejCZAqfR
         skbTApNbceofsAluxGveZ2FvsKS+DANgh/+Gz55iAbjzz+0oUlZAmFQoECIpxryBv8Jp
         W6PjfLzgkmDwHmAi8OtDKIYo9AbAO7ANEhq1l+EqKpRkr5Dk7wBjySnNcbsSy5/GUv51
         5G34NA7SeK5ojk9CsPPsQ00G7nVPqO24bnmP/4w8Ro0Rj7do2ui3V9gBiT2irX2kwtL0
         1+qXUrsB/KbWysI4v1ICnljumCjyHkRFPZh8KHeYsjye346PAD2EByo6mMXKCkAVpjgb
         ljXw==
X-Gm-Message-State: AOJu0Yz3+ueZoYwWR33zO6TOqdlyhZJ4ZtPZSFcs8hPjp/CXdQTiLMe/
	rbaSuPwPJxRPCyMQkFqH9v2xzHsVlEt3hQvcBpd6vVbk6tsuNhfelmVRJGI+
X-Google-Smtp-Source: AGHT+IGcSiipPn1biZQrlmZYd00RebgosGewUi5itlYSER72JY/zoFp21WgcRKEMSqxCvlnA6KTtIg==
X-Received: by 2002:a05:6214:32f:b0:690:96a3:5da7 with SMTP id j15-20020a056214032f00b0069096a35da7mr5779354qvu.62.1709840051234;
        Thu, 07 Mar 2024 11:34:11 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id md18-20020a056214589200b0069054377816sm8055120qvb.124.2024.03.07.11.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:34:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
Date: Thu,  7 Mar 2024 14:34:07 -0500
Message-Id: <20240307193409.987235-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 19:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196820

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...partitions-if-GD_SUPPRESS_PART_SCAN-.patch | 43 +++++++++
 ...-support-partitions-without-scanning.patch | 87 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  4 +
 3 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-block-don-t-add-partitions-if-GD_SUPPRESS_PART_SCAN-.patch
 create mode 100644 meta/recipes-kernel/linux/files/0001-block-loop-support-partitions-without-scanning.patch

diff --git a/meta/recipes-kernel/linux/files/0001-block-don-t-add-partitions-if-GD_SUPPRESS_PART_SCAN-.patch b/meta/recipes-kernel/linux/files/0001-block-don-t-add-partitions-if-GD_SUPPRESS_PART_SCAN-.patch
new file mode 100644
index 0000000000..cde4f317e9
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-block-don-t-add-partitions-if-GD_SUPPRESS_PART_SCAN-.patch
@@ -0,0 +1,43 @@
+From 748008e1da926a814cc0a054c81ca614408b1b0c Mon Sep 17 00:00:00 2001
+From: Ming Lei <ming.lei@redhat.com>
+Date: Tue, 23 Aug 2022 18:38:19 +0800
+Subject: [PATCH] block: don't add partitions if GD_SUPPRESS_PART_SCAN is set
+
+Commit b9684a71fca7 ("block, loop: support partitions without scanning")
+adds GD_SUPPRESS_PART_SCAN for replacing part function of
+GENHD_FL_NO_PART. But looks blk_add_partitions() is missed, since
+loop doesn't want to add partitions if GENHD_FL_NO_PART was set.
+And it causes regression on libblockdev (as called from udisks) which
+operates with the LO_FLAGS_PARTSCAN.
+
+Fixes the issue by not adding partitions if GD_SUPPRESS_PART_SCAN is
+set.
+
+Upstream-Status: Backport [748008e1da926a814cc0a054c81ca614408b1b0c]
+
+Fixes: b9684a71fca7 ("block, loop: support partitions without scanning")
+Signed-off-by: Ming Lei <ming.lei@redhat.com>
+Reviewed-by: Christoph Hellwig <hch@lst.de>
+Link: https://lore.kernel.org/r/20220823103819.395776-1-ming.lei@redhat.com
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+---
+ block/partitions/core.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/block/partitions/core.c b/block/partitions/core.c
+index fc1d70384825..b8112f52d388 100644
+--- a/block/partitions/core.c
++++ b/block/partitions/core.c
+@@ -596,6 +596,9 @@ static int blk_add_partitions(struct gendisk *disk)
+ 	if (disk->flags & GENHD_FL_NO_PART)
+ 		return 0;
+ 
++	if (test_bit(GD_SUPPRESS_PART_SCAN, &disk->state))
++		return 0;
++
+ 	state = check_partition(disk);
+ 	if (!state)
+ 		return 0;
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/linux/files/0001-block-loop-support-partitions-without-scanning.patch b/meta/recipes-kernel/linux/files/0001-block-loop-support-partitions-without-scanning.patch
new file mode 100644
index 0000000000..9522c2d2cc
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-block-loop-support-partitions-without-scanning.patch
@@ -0,0 +1,87 @@
+From ea6bf87558eb534ded532cfa622b575c1f39e3d6 Mon Sep 17 00:00:00 2001
+From: Christoph Hellwig <hch@lst.de>
+Date: Fri, 27 May 2022 07:58:06 +0200
+Subject: [PATCH] block, loop: support partitions without scanning
+
+Historically we did distinguish between a flag that surpressed partition
+scanning, and a combinations of the minors variable and another flag if
+any partitions were supported.  This was generally confusing and doesn't
+make much sense, but some corner case uses of the loop driver actually
+do want to support manually added partitions on a device that does not
+actively scan for partitions.  To make things worsee the loop driver
+also wants to dynamically toggle the scanning for partitions on a live
+gendisk, which makes the disk->flags updates non-atomic.
+
+Introduce a new GD_SUPPRESS_PART_SCAN bit in disk->state that disables
+just scanning for partitions, and toggle that instead of GENHD_FL_NO_PART
+in the loop driver.
+
+Upstream-Status: Backport [b9684a71fca793213378dd410cd11675d973eaa1]
+
+Fixes: 1ebe2e5f9d68 ("block: remove GENHD_FL_EXT_DEVT")
+Reported-by: Ming Lei <ming.lei@redhat.com>
+Signed-off-by: Christoph Hellwig <hch@lst.de>
+Reviewed-by: Ming Lei <ming.lei@redhat.com>
+Link: https://lore.kernel.org/r/20220527055806.1972352-1-hch@lst.de
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ drivers/block/loop.c   | 8 ++++----
+ include/linux/blkdev.h | 1 +
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/block/loop.c b/drivers/block/loop.c
+index 4769caab9ff9..a76302450c46 100644
+--- a/drivers/block/loop.c
++++ b/drivers/block/loop.c
+@@ -1332,7 +1332,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
+ 		lo->lo_flags |= LO_FLAGS_PARTSCAN;
+ 	partscan = lo->lo_flags & LO_FLAGS_PARTSCAN;
+ 	if (partscan)
+-		lo->lo_disk->flags &= ~GENHD_FL_NO_PART;
++		clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
+ 
+ 	/* enable and uncork uevent now that we are done */
+ 	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
+@@ -1481,7 +1481,7 @@ static int __loop_clr_fd(struct loop_device *lo, bool release)
+ 	mutex_lock(&lo->lo_mutex);
+ 	lo->lo_flags = 0;
+ 	if (!part_shift)
+-		lo->lo_disk->flags |= GENHD_FL_NO_PART;
++		set_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
+ 	lo->lo_state = Lo_unbound;
+ 	mutex_unlock(&lo->lo_mutex);
+ 
+@@ -1598,7 +1598,7 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
+ 
+ 	if (!err && (lo->lo_flags & LO_FLAGS_PARTSCAN) &&
+ 	     !(prev_lo_flags & LO_FLAGS_PARTSCAN)) {
+-		lo->lo_disk->flags &= ~GENHD_FL_NO_PART;
++		clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
+ 		partscan = true;
+ 	}
+ out_unlock:
+@@ -2428,7 +2428,7 @@ static int loop_add(int i)
+ 	 * userspace tools. Parameters like this in general should be avoided.
+ 	 */
+ 	if (!part_shift)
+-		disk->flags |= GENHD_FL_NO_PART;
++		set_bit(GD_SUPPRESS_PART_SCAN, &disk->state);
+ 	disk->flags |= GENHD_FL_EXT_DEVT;
+ 	atomic_set(&lo->lo_refcnt, 0);
+ 	mutex_init(&lo->lo_mutex);
+diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
+index 905844172cfd..15815f1ced9e 100644
+--- a/include/linux/blkdev.h
++++ b/include/linux/blkdev.h
+@@ -813,6 +813,7 @@ static inline unsigned int blk_queue_depth(struct request_queue *q)
+  */
+ #define BLK_DEFAULT_SG_TIMEOUT	(60 * HZ)
+ #define BLK_MIN_SG_TIMEOUT	(7 * HZ)
++#define GD_SUPPRESS_PART_SCAN		5
+ 
+ struct rq_map_data {
+ 	struct page **pages;
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1c6b3d1112..17d36524f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -38,6 +38,10 @@ KBRANCH:class-devupstream = "v5.15/base"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
+SRC_URI += "file://0001-block-don-t-add-partitions-if-GD_SUPPRESS_PART_SCAN-.patch"
+SRC_URI += "file://0001-block-loop-support-partitions-without-scanning.patch"
+
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.15.149"
 
-- 
2.39.2


