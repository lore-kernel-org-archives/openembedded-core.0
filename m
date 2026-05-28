Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4080CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:37:24 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2754.1779935842031288697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i9NId2bY;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso206276596d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779935841; x=1780540641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67hYJAmGp9JFN2EtxJoAGqNWi0YgAfNzP2ki/9aGdMs=;
        b=i9NId2bYMv1bHreIF4XX3pTbKITqyz1eiqyL071Ok9860iErZAaAT6XjvH40/s0lXu
         9JOtGYWkAA5XDY0kZHZqJq9rM0U4MR4JAM/cnXLtsoHcrgBfNswSW7ivEqTJ/m6luJqa
         EAFJWiaeOutFtv8Dgj0wjvtmwXArhPxqRt4GBvE9bXnuVcnPt3g40c32Dg+LWhrEbLU9
         ffSKC5DkDwmtgEpVzC/RXWmecnf32HLgMmjQZqN8Z93k8OiGQcNR5zcBBMu/8VBdT2d3
         PfKfwoglVwP3oqEFPULWPOwkYvK6eK6/F0atg1uAq06y0bNMhb+YW0e2ldvtwUoBFkP3
         JxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935841; x=1780540641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67hYJAmGp9JFN2EtxJoAGqNWi0YgAfNzP2ki/9aGdMs=;
        b=P86Uq6WbETRbjNv+La2n0IeGQUU4OWw8dSPmx+ppKl+W7k4iJzfycq9r3HbCPRyAB5
         smXIOezsJBqyJoQIzcil3SDvQJRGh3q3wkhk/R37QwvKpPAGQS18MDnwBxwqWvWJgITM
         XhPFiLWcWGC6Tn383yVt77z4Cevxk0DJli7EeKte8z0d7tdnqVcj71j4oRI12U/mRTg+
         St4XuKDzZyXUBehO1n3C0buuF0AwcWvh9xrOtMGhIKE30uD3cpkbqO/zNlgKb0rRh9i5
         v9RIVfKeWvozDcPLjhYPyFMRPg/ekdLsbsXhX+yYGs3yUZU7C/ffVZgvj2Ej/oih1lFb
         j0lg==
X-Gm-Message-State: AOJu0Yw0jXFYV06TAGsTMmk016bZuym2SoMG6XJEXiP/Uvd2Jc++HHuL
	lDEVNo5i6+Laj+t7qeSiYWP1hBel4jYzF4gRAimaX049x0yVezWKazt1iHRT7l49
X-Gm-Gg: Acq92OExm+vcRBjGyjWGIyhRA8uJlgXunXtIJvIkJMXSq5VcGq1i8+mJHzs5Imn4pQM
	zn6hcJZf5nCw7dJ4rPDVcneANjkMjUmpMSoWXRVR/jbmRwD9/SEZP/Y7BYkYPgkFTpzOzgpOXYE
	rmkW53y9NKM6GmKEKACK6jidFkgmZ9kPeb09HMVO2/Au5VfqkvEytius+bQkrZ+ORdh+TxYIT6e
	YZMu2JMyLIcMoY+SjIEFEkMG8zjCUXKYBsuYvfz4SE51G9pLnAlh0w0vtfJ/t5NyFeUdKpzJf1B
	S9hJ5e8CZnYxkLNYL05ibJVU9mqaagI1/DF/WVe1e+bBXKnfQ3bZvzxv5ZKaGZNV/MRYITw6pG5
	Lwer+SD3KdtW4FRYFFAee3ZxEStQqV8pxmLS81foqRwNvR5UGvcTptlWxEUA5IxXVd631OWataZ
	w95RyQKM52GNv+Gucseic85Z7v2TuXJEL+SWvbD1nfUUlS32Qe4J+2crcnSqif3bfFQWal1FTqs
	Pt1o1EC3lJgMST9RmP50fDlY4WH5y1vOUhQ5rSVTE/X/iGnUAWyOyC80UOFuhgMvYiIOIQspnd0
	KGpTkDk8puOBRFSYWUu/ae6ZpInmW4s1Q/GazKqP7jIBVL50ESxf6Uk=
X-Received: by 2002:ad4:5de7:0:b0:89c:e2b4:4ee9 with SMTP id 6a1803df08f44-8cc7b6a7f2emr417628596d6.46.1779935840435;
        Wed, 27 May 2026 19:37:20 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcec8esm186146436d6.7.2026.05.27.19.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:37:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/07] lttng-modules: fix build against kernel 7.1+
Date: Wed, 27 May 2026 22:37:08 -0400
Message-ID: <20260528023714.4026613-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237685

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When updating linux-yocto-dev to v7.1 lttng-modules failed to build.

There are fixes pending for that version in the lttng gerrit. Grabbing
them here gets us a fully building and tested core-image-kernel-dev.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...ts-during-the-folios-writeback-v6.17.patch |   94 ++
 ...trace-event-i_ino-fields-to-u64-v7.1.patch | 1424 +++++++++++++++++
 ...p-unnecessary-pointer-indirection-in.patch |   75 +
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch |  103 ++
 ...onvert-pageout-to-take-a-folio-v5.18.patch |   54 +
 ...group-IDs-to-vmscan-tracepoints-v7.1.patch |  198 +++
 ...i_ino-from-unsigned-long-to-u64-v7.1.patch |   56 +
 ...trace-event-i_ino-fields-to-u64-v7.1.patch |  276 ++++
 .../lttng/lttng-modules_2.14.4.bb             |    8 +
 9 files changed, 2288 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch
new file mode 100644
index 0000000000..a8403fbb3f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch
@@ -0,0 +1,94 @@
+From 329ef88b9ae02228387f55a61ca1cef87a5cf3f4 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 16:22:42 -0400
+Subject: [PATCH 7/8] fix: ext4: enhance tracepoints during the folios
+ writeback (v6.17)
+
+See upstream commits:
+
+  commit 6b132759b0fe78e518abafb62190c294100db6d6
+  Author: Zhang Yi <yi.zhang@huawei.com>
+  Date:   Mon Jul 7 22:08:09 2025 +0800
+
+    ext4: enhance tracepoints during the folios writeback
+
+    After mpage_map_and_submit_extent() supports restarting handle if
+    credits are insufficient during allocating blocks, it is more likely to
+    exit the current mapping iteration and continue to process the current
+    processing partially mapped folio again. The existing tracepoints are
+    not sufficient to track this situation, so enhance the tracepoints to
+    track the writeback position and the return value before and after
+    submitting the folios.
+
+  commit 1bfe6354e0975fe89c3d25e81b6546d205556a4b
+  Author: Zhang Yi <yi.zhang@huawei.com>
+  Date:   Mon Jul 7 22:08:04 2025 +0800
+
+    ext4: process folios writeback in bytes
+
+    Since ext4 supports large folios, processing writebacks in pages is no
+    longer appropriate, it can be modified to process writebacks in bytes.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17907]
+
+Change-Id: I15b849b9ebcf18b75b658b8f76cfa91e205f6cf6
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/ext4.h | 34 +++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
+index 75f92b31..fa5de84d 100644
+--- a/include/instrumentation/events/ext4.h
++++ b/include/instrumentation/events/ext4.h
+@@ -242,6 +242,39 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_writepages,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,17,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_write_folios_start,
++	TP_PROTO(struct inode *inode, loff_t start_pos, loff_t next_pos,
++		 struct writeback_control *wbc),
++
++	TP_ARGS(inode, start_pos, next_pos, wbc),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(loff_t, start_pos, start_pos)
++		ctf_integer(loff_t, next_pos, next_pos)
++		ctf_integer(long, nr_to_write, wbc->nr_to_write)
++		ctf_integer(int, sync_mode, wbc->sync_mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_da_write_folios_end,
++	TP_PROTO(struct inode *inode, loff_t start_pos, loff_t next_pos,
++		 struct writeback_control *wbc, int ret),
++
++	TP_ARGS(inode, start_pos, next_pos, wbc, ret),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(loff_t, start_pos, start_pos)
++		ctf_integer(loff_t, next_pos, next_pos)
++		ctf_integer(long, nr_to_write, wbc->nr_to_write)
++		ctf_integer(int, ret, ret)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages,
+ 	TP_PROTO(struct inode *inode, pgoff_t first_page,
+ 		 struct writeback_control *wbc),
+@@ -256,6 +289,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages,
+ 		ctf_integer(int, sync_mode, wbc->sync_mode)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages_extent,
+ 	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map),
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
new file mode 100644
index 0000000000..5031ac5d42
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
@@ -0,0 +1,1424 @@
+From e80f709c4665a333da82b27605c26a3afccb299f Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 16:01:09 -0400
+Subject: [PATCH 8/8] fix: ext4: widen trace event i_ino fields to u64 (v7.1)
+
+See upstream commit:
+
+  commit d352871478616ac63d0edf90e78194ec0a19b988
+  Author: Jeff Layton <jlayton@kernel.org>
+  Date:   Wed Mar 4 10:32:39 2026 -0500
+
+    ext4: widen trace event i_ino fields to u64
+
+    In trace events, change __field(ino_t, ...) to __field(u64, ...)
+    and update TP_printk format strings to %llu/%llx to match the
+    widened field type.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17909]
+
+Change-Id: I5e266aea1a128987061a6074e2cd202b29d2e2f5
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/ext4.h | 1123 +++++++++++++++++++++++--
+ 1 file changed, 1048 insertions(+), 75 deletions(-)
+
+diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
+index fa5de84d..43b93cde 100644
+--- a/include/instrumentation/events/ext4.h
++++ b/include/instrumentation/events/ext4.h
+@@ -26,6 +26,95 @@ struct ext4_extent;
+ #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_inode))
+ #define TP_MODE_T	__u16
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_free_inode,
++	TP_PROTO(struct inode *inode),
++
++	TP_ARGS(inode),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, blocks, inode->i_blocks)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(uid_t, uid, i_uid_read(inode))
++		ctf_integer(gid_t, gid, i_gid_read(inode))
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_request_inode,
++	TP_PROTO(struct inode *dir, int mode),
++
++	TP_ARGS(dir, mode),
++
++	TP_FIELDS(
++		ctf_integer(u64, dir, dir->i_ino)
++		ctf_integer(dev_t, dev, dir->i_sb->s_dev)
++		ctf_integer(TP_MODE_T, mode, mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_allocate_inode,
++	TP_PROTO(struct inode *inode, struct inode *dir, int mode),
++
++	TP_ARGS(inode, dir, mode),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(u64, dir, dir->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(TP_MODE_T, mode, mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_evict_inode,
++	TP_PROTO(struct inode *inode),
++
++	TP_ARGS(inode),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, nlink, inode->i_nlink)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_drop_inode,
++	TP_PROTO(struct inode *inode, int drop),
++
++	TP_ARGS(inode, drop),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, drop, drop)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_mark_inode_dirty,
++	TP_PROTO(struct inode *inode, unsigned long IP),
++
++	TP_ARGS(inode, IP),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer_hex(unsigned long, ip, IP)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_begin_ordered_truncate,
++	TP_PROTO(struct inode *inode, loff_t new_size),
++
++	TP_ARGS(inode, new_size),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, new_size, new_size)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_free_inode,
+ 	TP_PROTO(struct inode *inode),
+ 
+@@ -113,8 +202,37 @@ LTTNG_TRACEPOINT_EVENT(ext4_begin_ordered_truncate,
+ 		ctf_integer(loff_t, new_size, new_size)
+ 	)
+ )
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
++
++	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
++
++	TP_ARGS(inode, pos, len),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, pos)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(unsigned int, len, len)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_write_begin,
++
++	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
++
++	TP_ARGS(inode, pos, len)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
++
++	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
++	TP_ARGS(inode, pos, len)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
+ 
+ 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
+@@ -176,6 +294,22 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
+ )
+ #endif /* (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0)) */
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_end,
++	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
++			unsigned int copied),
++
++	TP_ARGS(inode, pos, len, copied),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, pos)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(unsigned int, len, len)
++		ctf_integer(unsigned int, copied, copied)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_end,
+ 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
+ 			unsigned int copied),
+@@ -190,6 +324,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_end,
+ 		ctf_integer(unsigned int, copied, copied)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_end, ext4_ordered_write_end,
+ 
+@@ -223,7 +358,27 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_end, ext4_da_write_end,
+ 	TP_ARGS(inode, pos, len, copied)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT(ext4_da_writepages,
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_writepages,
++	TP_PROTO(struct inode *inode, struct writeback_control *wbc),
++
++	TP_ARGS(inode, wbc),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, range_start, wbc->range_start)
++		ctf_integer(loff_t, range_end, wbc->range_end)
++		ctf_integer(long, nr_to_write, wbc->nr_to_write)
++		ctf_integer(long, pages_skipped, wbc->pages_skipped)
++		ctf_integer(pgoff_t, writeback_index, inode->i_mapping->writeback_index)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, sync_mode, wbc->sync_mode)
++		ctf_integer(char, for_kupdate, wbc->for_kupdate)
++		ctf_integer(char, range_cyclic, wbc->range_cyclic)
++	)
++)
++#else
++LTTNG_TRACEPOINT_EVENT(ext4_writepages,
+ 	TP_PROTO(struct inode *inode, struct writeback_control *wbc),
+ 
+ 	TP_ARGS(inode, wbc),
+@@ -241,8 +396,41 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_writepages,
+ 		ctf_integer(char, range_cyclic, wbc->range_cyclic)
+ 	)
+ )
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_write_folios_start,
++	TP_PROTO(struct inode *inode, loff_t start_pos, loff_t next_pos,
++		 struct writeback_control *wbc),
++
++	TP_ARGS(inode, start_pos, next_pos, wbc),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, start_pos, start_pos)
++		ctf_integer(loff_t, next_pos, next_pos)
++		ctf_integer(long, nr_to_write, wbc->nr_to_write)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, sync_mode, wbc->sync_mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_da_write_folios_end,
++	TP_PROTO(struct inode *inode, loff_t start_pos, loff_t next_pos,
++		 struct writeback_control *wbc, int ret),
++
++	TP_ARGS(inode, start_pos, next_pos, wbc, ret),
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,17,0))
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, start_pos, start_pos)
++		ctf_integer(loff_t, next_pos, next_pos)
++		ctf_integer(long, nr_to_write, wbc->nr_to_write)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, ret, ret)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,17,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_da_write_folios_start,
+ 	TP_PROTO(struct inode *inode, loff_t start_pos, loff_t next_pos,
+ 		 struct writeback_control *wbc),
+@@ -291,6 +479,38 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages,
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages_extent,
++	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map),
++
++	TP_ARGS(inode, map),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, lblk, map->m_lblk)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(__u32, len, map->m_len)
++		ctf_integer(__u32, flags, map->m_flags)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_writepages_result,
++	TP_PROTO(struct inode *inode, struct writeback_control *wbc,
++			int ret, int pages_written),
++
++	TP_ARGS(inode, wbc, ret, pages_written),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(long, pages_skipped, wbc->pages_skipped)
++		ctf_integer(pgoff_t, writeback_index, inode->i_mapping->writeback_index)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, ret, ret)
++		ctf_integer(int, pages_written, pages_written)
++		ctf_integer(int, sync_mode, wbc->sync_mode)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages_extent,
+ 	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map),
+ 
+@@ -305,7 +525,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_write_pages_extent,
+ 	)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT(ext4_da_writepages_result,
++LTTNG_TRACEPOINT_EVENT(ext4_writepages_result,
+ 	TP_PROTO(struct inode *inode, struct writeback_control *wbc,
+ 			int ret, int pages_written),
+ 
+@@ -321,8 +541,36 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_writepages_result,
+ 		ctf_integer(int, sync_mode, wbc->sync_mode)
+ 	)
+ )
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__folio_op,
++	TP_PROTO(struct inode *inode, struct folio *folio),
++
++	TP_ARGS(inode, folio),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(pgoff_t, index, folio->index)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__folio_op, ext4_read_folio,
++
++	TP_PROTO(struct inode *inode, struct folio *folio),
++
++	TP_ARGS(inode, folio)
++)
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,5,0))
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__folio_op, ext4_release_folio,
++
++	TP_PROTO(struct inode *inode, struct folio *folio),
++
++	TP_ARGS(inode, folio)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,5,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__folio_op,
+ 	TP_PROTO(struct inode *inode, struct folio *folio),
+ 
+@@ -391,6 +639,33 @@ LTTNG_TRACEPOINT_EVENT_CLASS(ext4_invalidate_folio_op,
+ 
+ 	TP_ARGS(folio, offset, length),
+ 
++	TP_FIELDS(
++		ctf_integer(u64, ino, folio->mapping->host->i_ino)
++		ctf_integer(pgoff_t, index, folio->index)
++		ctf_integer(size_t, offset, offset)
++		ctf_integer(size_t, length, length)
++		ctf_integer(dev_t, dev, folio->mapping->host->i_sb->s_dev)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4_invalidate_folio_op, ext4_invalidate_folio,
++	TP_PROTO(struct folio *folio, size_t offset, size_t length),
++
++	TP_ARGS(folio, offset, length)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4_invalidate_folio_op, ext4_journalled_invalidate_folio,
++	TP_PROTO(struct folio *folio, size_t offset, size_t length),
++
++	TP_ARGS(folio, offset, length)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4_invalidate_folio_op,
++	TP_PROTO(struct folio *folio, size_t offset, size_t length),
++
++	TP_ARGS(folio, offset, length),
++
+ 	TP_FIELDS(
+ 		ctf_integer(dev_t, dev, folio->mapping->host->i_sb->s_dev)
+ 		ctf_integer(ino_t, ino, folio->mapping->host->i_ino)
+@@ -454,6 +729,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_discard_blocks,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__mb_new_pa,
+ 	TP_PROTO(struct ext4_allocation_context *ac,
+ 		 struct ext4_prealloc_space *pa),
+@@ -461,10 +737,10 @@ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__mb_new_pa,
+ 	TP_ARGS(ac, pa),
+ 
+ 	TP_FIELDS(
+-		ctf_integer(dev_t, dev, ac->ac_sb->s_dev)
+-		ctf_integer(ino_t, ino, ac->ac_inode->i_ino)
++		ctf_integer(u64, ino, ac->ac_inode->i_ino)
+ 		ctf_integer(__u64, pa_pstart, pa->pa_pstart)
+ 		ctf_integer(__u64, pa_lstart, pa->pa_lstart)
++		ctf_integer(dev_t, dev, ac->ac_sb->s_dev)
+ 		ctf_integer(__u32, pa_len, pa->pa_len)
+ 	)
+ )
+@@ -493,15 +769,62 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release_inode_pa,
+ 	TP_ARGS(pa, block, count),
+ 
+ 	TP_FIELDS(
+-		ctf_integer(dev_t, dev, pa->pa_inode->i_sb->s_dev)
+-		ctf_integer(ino_t, ino, pa->pa_inode->i_ino)
++		ctf_integer(u64, ino, pa->pa_inode->i_ino)
+ 		ctf_integer(__u64, block, block)
++		ctf_integer(dev_t, dev, pa->pa_inode->i_sb->s_dev)
+ 		ctf_integer(__u32, count, count)
+ 	)
+ )
++#else
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__mb_new_pa,
++	TP_PROTO(struct ext4_allocation_context *ac,
++		 struct ext4_prealloc_space *pa),
++
++	TP_ARGS(ac, pa),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, ac->ac_sb->s_dev)
++		ctf_integer(ino_t, ino, ac->ac_inode->i_ino)
++		ctf_integer(__u64, pa_pstart, pa->pa_pstart)
++		ctf_integer(__u64, pa_lstart, pa->pa_lstart)
++		ctf_integer(__u32, pa_len, pa->pa_len)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__mb_new_pa, ext4_mb_new_inode_pa,
++
++	TP_PROTO(struct ext4_allocation_context *ac,
++		 struct ext4_prealloc_space *pa),
++
++	TP_ARGS(ac, pa)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__mb_new_pa, ext4_mb_new_group_pa,
++
++	TP_PROTO(struct ext4_allocation_context *ac,
++		 struct ext4_prealloc_space *pa),
++
++	TP_ARGS(ac, pa)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_mb_release_inode_pa,
++	TP_PROTO(
++		 struct ext4_prealloc_space *pa,
++		 unsigned long long block, unsigned int count),
++
++	TP_ARGS(pa, block, count),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, pa->pa_inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, pa->pa_inode->i_ino)
++		ctf_integer(__u64, block, block)
++		ctf_integer(__u32, count, count)
++	)
++)
++#endif
++
++LTTNG_TRACEPOINT_EVENT(ext4_mb_release_group_pa,
+ 
+-LTTNG_TRACEPOINT_EVENT(ext4_mb_release_group_pa,
+-
+ 	TP_PROTO(struct super_block *sb, struct ext4_prealloc_space *pa),
+ 
+ 	TP_ARGS(sb, pa),
+@@ -513,7 +836,19 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release_group_pa,
+ 	)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
++	TP_PROTO(struct inode *inode, unsigned int len),
++
++	TP_ARGS(inode, len),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(unsigned int, len, len)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
+ 	TP_PROTO(struct inode *inode, unsigned int len),
+ 
+@@ -563,6 +898,87 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_discard_preallocations,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_request_blocks,
++	TP_PROTO(struct ext4_allocation_request *ar),
++
++	TP_ARGS(ar),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, ar->inode->i_ino)
++		ctf_integer(__u64, goal, ar->goal)
++		ctf_integer(__u64, pleft, ar->pleft)
++		ctf_integer(__u64, pright, ar->pright)
++		ctf_integer(dev_t, dev, ar->inode->i_sb->s_dev)
++		ctf_integer(unsigned int, len, ar->len)
++		ctf_integer(__u32, logical, ar->logical)
++		ctf_integer(__u32, lleft, ar->lleft)
++		ctf_integer(__u32, lright, ar->lright)
++		ctf_integer(unsigned int, flags, ar->flags)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_allocate_blocks,
++	TP_PROTO(struct ext4_allocation_request *ar, unsigned long long block),
++
++	TP_ARGS(ar, block),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, ar->inode->i_ino)
++		ctf_integer(__u64, block, block)
++		ctf_integer(__u64, goal, ar->goal)
++		ctf_integer(__u64, pleft, ar->pleft)
++		ctf_integer(__u64, pright, ar->pright)
++		ctf_integer(dev_t, dev, ar->inode->i_sb->s_dev)
++		ctf_integer(unsigned int, len, ar->len)
++		ctf_integer(__u32, logical, ar->logical)
++		ctf_integer(__u32, lleft, ar->lleft)
++		ctf_integer(__u32, lright, ar->lright)
++		ctf_integer(unsigned int, flags, ar->flags)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_free_blocks,
++	TP_PROTO(struct inode *inode, __u64 block, unsigned long count,
++		 int flags),
++
++	TP_ARGS(inode, block, count, flags),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, block, block)
++		ctf_integer(unsigned long, count, count)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, flags, flags)
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_sync_file_enter,
++	TP_PROTO(struct file *file, int datasync),
++
++	TP_ARGS(file, datasync),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, file->f_path.dentry->d_inode->i_ino)
++		ctf_integer(u64, parent, file->f_path.dentry->d_parent->d_inode->i_ino)
++		ctf_integer(dev_t, dev, file->f_path.dentry->d_inode->i_sb->s_dev)
++		ctf_integer(int, datasync, datasync)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_sync_file_exit,
++	TP_PROTO(struct inode *inode, int ret),
++
++	TP_ARGS(inode, ret),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, ret, ret)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_request_blocks,
+ 	TP_PROTO(struct ext4_allocation_request *ar),
+ 
+@@ -642,6 +1058,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_sync_file_exit,
+ 		ctf_integer(int, ret, ret)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_sync_fs,
+ 	TP_PROTO(struct super_block *sb, int wait),
+@@ -655,7 +1072,19 @@ LTTNG_TRACEPOINT_EVENT(ext4_sync_fs,
+ 	)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_alloc_da_blocks,
++	TP_PROTO(struct inode *inode),
++
++	TP_ARGS(inode),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(unsigned int, data_blocks, EXT4_I(inode)->i_reserved_data_blocks)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_alloc_da_blocks,
+ 	TP_PROTO(struct inode *inode),
+ 
+@@ -682,6 +1111,109 @@ LTTNG_TRACEPOINT_EVENT(ext4_alloc_da_blocks,
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_mballoc_alloc,
++	TP_PROTO(struct ext4_allocation_context *ac),
++
++	TP_ARGS(ac),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, ac->ac_inode->i_ino)
++		ctf_integer(dev_t, dev, ac->ac_inode->i_sb->s_dev)
++		ctf_integer(__u32, orig_logical, ac->ac_o_ex.fe_logical)
++		ctf_integer(int, orig_start, ac->ac_o_ex.fe_start)
++		ctf_integer(__u32, orig_group, ac->ac_o_ex.fe_group)
++		ctf_integer(int, orig_len, ac->ac_o_ex.fe_len)
++		ctf_integer(__u32, goal_logical, ac->ac_g_ex.fe_logical)
++		ctf_integer(int, goal_start, ac->ac_g_ex.fe_start)
++		ctf_integer(__u32, goal_group, ac->ac_g_ex.fe_group)
++		ctf_integer(int, goal_len, ac->ac_g_ex.fe_len)
++		ctf_integer(__u32, result_logical, ac->ac_f_ex.fe_logical)
++		ctf_integer(int, result_start, ac->ac_f_ex.fe_start)
++		ctf_integer(__u32, result_group, ac->ac_f_ex.fe_group)
++		ctf_integer(int, result_len, ac->ac_f_ex.fe_len)
++		ctf_integer(__u16, found, ac->ac_found)
++		ctf_integer(__u16, groups, ac->ac_groups_scanned)
++		ctf_integer(__u16, buddy, ac->ac_buddy)
++		ctf_integer(__u16, flags, ac->ac_flags)
++		ctf_integer(__u16, tail, ac->ac_tail)
++		ctf_integer(__u8, cr, ac->ac_criteria)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_mballoc_prealloc,
++	TP_PROTO(struct ext4_allocation_context *ac),
++
++	TP_ARGS(ac),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, ac->ac_inode->i_ino)
++		ctf_integer(dev_t, dev, ac->ac_inode->i_sb->s_dev)
++		ctf_integer(__u32, orig_logical, ac->ac_o_ex.fe_logical)
++		ctf_integer(int, orig_start, ac->ac_o_ex.fe_start)
++		ctf_integer(__u32, orig_group, ac->ac_o_ex.fe_group)
++		ctf_integer(int, orig_len, ac->ac_o_ex.fe_len)
++		ctf_integer(__u32, result_logical, ac->ac_b_ex.fe_logical)
++		ctf_integer(int, result_start, ac->ac_b_ex.fe_start)
++		ctf_integer(__u32, result_group, ac->ac_b_ex.fe_group)
++		ctf_integer(int, result_len, ac->ac_b_ex.fe_len)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__mballoc,
++	TP_PROTO(struct super_block *sb,
++		 struct inode *inode,
++		 ext4_group_t group,
++		 ext4_grpblk_t start,
++		 ext4_grpblk_t len),
++
++	TP_ARGS(sb, inode, group, start, len),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode ? inode->i_ino : 0)
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(int, result_start, start)
++		ctf_integer(__u32, result_group, group)
++		ctf_integer(int, result_len, len)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__mballoc, ext4_mballoc_discard,
++
++	TP_PROTO(struct super_block *sb,
++		 struct inode *inode,
++		 ext4_group_t group,
++		 ext4_grpblk_t start,
++		 ext4_grpblk_t len),
++
++	TP_ARGS(sb, inode, group, start, len)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__mballoc, ext4_mballoc_free,
++
++	TP_PROTO(struct super_block *sb,
++		 struct inode *inode,
++		 ext4_group_t group,
++		 ext4_grpblk_t start,
++		 ext4_grpblk_t len),
++
++	TP_ARGS(sb, inode, group, start, len)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_forget,
++	TP_PROTO(struct inode *inode, int is_metadata, __u64 block),
++
++	TP_ARGS(inode, is_metadata, block),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, block, block)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, is_metadata, is_metadata)
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_mballoc_alloc,
+ 	TP_PROTO(struct ext4_allocation_context *ac),
+ 
+@@ -783,8 +1315,26 @@ LTTNG_TRACEPOINT_EVENT(ext4_forget,
+ 		ctf_integer(TP_MODE_T, mode, inode->i_mode)
+ 	)
+ )
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
++	TP_PROTO(struct inode *inode, int used_blocks, int quota_claim),
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
++	TP_ARGS(inode, used_blocks, quota_claim),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, i_blocks, inode->i_blocks)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, used_blocks, used_blocks)
++		ctf_integer(int, reserved_data_blocks,
++				EXT4_I(inode)->i_reserved_data_blocks)
++		ctf_integer(int, quota_claim, quota_claim)
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
+ 	TP_PROTO(struct inode *inode, int used_blocks, int quota_claim),
+ 
+@@ -824,7 +1374,23 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
++	TP_PROTO(struct inode *inode, int nr_resv),
++
++	TP_ARGS(inode, nr_resv),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, i_blocks, inode->i_blocks)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, reserve_blocks, nr_resv)
++		ctf_integer(int, reserved_data_blocks,
++				EXT4_I(inode)->i_reserved_data_blocks)
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
+ 	TP_PROTO(struct inode *inode, int nr_resv),
+ 
+@@ -874,7 +1440,23 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_release_space,
++	TP_PROTO(struct inode *inode, int freed_blocks),
++
++	TP_ARGS(inode, freed_blocks),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, i_blocks, inode->i_blocks)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, freed_blocks, freed_blocks)
++		ctf_integer(int, reserved_data_blocks,
++				EXT4_I(inode)->i_reserved_data_blocks)
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_da_release_space,
+ 	TP_PROTO(struct inode *inode, int freed_blocks),
+ 
+@@ -910,91 +1492,309 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_release_space,
+ 		ctf_integer(TP_MODE_T, mode, inode->i_mode)
+ 	)
+ )
+-#endif
++#endif
++
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__bitmap_load,
++	TP_PROTO(struct super_block *sb, unsigned long group),
++
++	TP_ARGS(sb, group),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(__u32, group, group)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_mb_bitmap_load,
++
++	TP_PROTO(struct super_block *sb, unsigned long group),
++
++	TP_ARGS(sb, group)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_mb_buddy_bitmap_load,
++
++	TP_PROTO(struct super_block *sb, unsigned long group),
++
++	TP_ARGS(sb, group)
++)
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0))
++LTTNG_TRACEPOINT_EVENT(ext4_read_block_bitmap_load,
++	TP_PROTO(struct super_block *sb, unsigned long group, bool prefetch),
++
++	TP_ARGS(sb, group, prefetch),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, sb->s_dev)
++		ctf_integer(__u32, group, group)
++		ctf_integer(bool, prefetch, prefetch)
++	)
++)
++#else
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_read_block_bitmap_load,
++
++	TP_PROTO(struct super_block *sb, unsigned long group),
++
++	TP_ARGS(sb, group)
++)
++#endif
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_load_inode_bitmap,
++
++	TP_PROTO(struct super_block *sb, unsigned long group),
++
++	TP_ARGS(sb, group)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_direct_IO_enter,
++	TP_PROTO(struct inode *inode, loff_t offset, unsigned long len, int rw),
++
++	TP_ARGS(inode, offset, len, rw),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, offset)
++		ctf_integer(unsigned long, len, len)
++		ctf_integer(int, rw, rw)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_direct_IO_exit,
++	TP_PROTO(struct inode *inode, loff_t offset, unsigned long len,
++		 int rw, int ret),
++
++	TP_ARGS(inode, offset, len, rw, ret),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, offset)
++		ctf_integer(unsigned long, len, len)
++		ctf_integer(int, rw, rw)
++		ctf_integer(int, ret, ret)
++	)
++)
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_fallocate_exit,
++	TP_PROTO(struct inode *inode, loff_t offset,
++		 unsigned int max_blocks, int ret),
++
++	TP_ARGS(inode, offset, max_blocks, ret),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, offset)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(unsigned int, blocks, max_blocks)
++		ctf_integer(int, ret, ret)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__fallocate_mode,
++	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int mode),
++
++	TP_ARGS(inode, offset, len, mode),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, offset)
++		ctf_integer(loff_t, len, len)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, mode, mode)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__fallocate_mode, ext4_fallocate_enter,
++
++	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int mode),
++
++	TP_ARGS(inode, offset, len, mode)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__fallocate_mode, ext4_punch_hole,
++
++	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int mode),
++
++	TP_ARGS(inode, offset, len, mode)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__fallocate_mode, ext4_zero_range,
++
++	TP_PROTO(struct inode *inode, loff_t offset, loff_t len, int mode),
++
++	TP_ARGS(inode, offset, len, mode)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_unlink_enter,
++	TP_PROTO(struct inode *parent, struct dentry *dentry),
++
++	TP_ARGS(parent, dentry),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, dentry->d_inode->i_ino)
++		ctf_integer(u64, parent, parent->i_ino)
++		ctf_integer(loff_t, size, dentry->d_inode->i_size)
++		ctf_integer(dev_t, dev, dentry->d_inode->i_sb->s_dev)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_unlink_exit,
++	TP_PROTO(struct dentry *dentry, int ret),
++
++	TP_ARGS(dentry, ret),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, dentry->d_inode->i_ino)
++		ctf_integer(dev_t, dev, dentry->d_inode->i_sb->s_dev)
++		ctf_integer(int, ret, ret)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__truncate,
++	TP_PROTO(struct inode *inode),
++
++	TP_ARGS(inode),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(__u64, blocks, inode->i_blocks)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__truncate, ext4_truncate_enter,
++
++	TP_PROTO(struct inode *inode),
++
++	TP_ARGS(inode)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__truncate, ext4_truncate_exit,
++
++	TP_PROTO(struct inode *inode),
++
++	TP_ARGS(inode)
++)
++
++/* 'ux' is the uninitialized extent. */
++LTTNG_TRACEPOINT_EVENT(ext4_ext_convert_to_initialized_enter,
++	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map,
++		 struct ext4_extent *ux),
++
++	TP_ARGS(inode, map, ux),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, u_pblk, ext4_ext_pblock(ux))
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, m_lblk, map->m_lblk)
++		ctf_integer(unsigned, m_len, map->m_len)
++		ctf_integer(ext4_lblk_t, u_lblk, le32_to_cpu(ux->ee_block))
++		ctf_integer(unsigned, u_len, ext4_ext_get_actual_len(ux))
++	)
++)
++
++/*
++ * 'ux' is the uninitialized extent.
++ * 'ix' is the initialized extent to which blocks are transferred.
++ */
++LTTNG_TRACEPOINT_EVENT(ext4_ext_convert_to_initialized_fastpath,
++	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map,
++		 struct ext4_extent *ux, struct ext4_extent *ix),
++
++	TP_ARGS(inode, map, ux, ix),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, u_pblk, ext4_ext_pblock(ux))
++		ctf_integer(ext4_fsblk_t, i_pblk, ext4_ext_pblock(ix))
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, m_lblk, map->m_lblk)
++		ctf_integer(unsigned, m_len, map->m_len)
++		ctf_integer(ext4_lblk_t, u_lblk, le32_to_cpu(ux->ee_block))
++		ctf_integer(unsigned, u_len, ext4_ext_get_actual_len(ux))
++		ctf_integer(ext4_lblk_t, i_lblk, le32_to_cpu(ix->ee_block))
++		ctf_integer(unsigned, i_len, ext4_ext_get_actual_len(ix))
++	)
++)
+ 
+-LTTNG_TRACEPOINT_EVENT_CLASS(ext4__bitmap_load,
+-	TP_PROTO(struct super_block *sb, unsigned long group),
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__map_blocks_enter,
++	TP_PROTO(struct inode *inode, ext4_lblk_t lblk,
++		 unsigned int len, unsigned int flags),
+ 
+-	TP_ARGS(sb, group),
++	TP_ARGS(inode, lblk, len, flags),
+ 
+ 	TP_FIELDS(
+-		ctf_integer(dev_t, dev, sb->s_dev)
+-		ctf_integer(__u32, group, group)
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, lblk, lblk)
++		ctf_integer(unsigned int, len, len)
++		ctf_integer(unsigned int, flags, flags)
+ 	)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_mb_bitmap_load,
+-
+-	TP_PROTO(struct super_block *sb, unsigned long group),
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__map_blocks_enter, ext4_ext_map_blocks_enter,
++	TP_PROTO(struct inode *inode, ext4_lblk_t lblk,
++		 unsigned len, unsigned flags),
+ 
+-	TP_ARGS(sb, group)
++	TP_ARGS(inode, lblk, len, flags)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_mb_buddy_bitmap_load,
+-
+-	TP_PROTO(struct super_block *sb, unsigned long group),
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__map_blocks_enter, ext4_ind_map_blocks_enter,
++	TP_PROTO(struct inode *inode, ext4_lblk_t lblk,
++		 unsigned len, unsigned flags),
+ 
+-	TP_ARGS(sb, group)
++	TP_ARGS(inode, lblk, len, flags)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0))
+-LTTNG_TRACEPOINT_EVENT(ext4_read_block_bitmap_load,
+-	TP_PROTO(struct super_block *sb, unsigned long group, bool prefetch),
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__map_blocks_exit,
++	TP_PROTO(struct inode *inode, unsigned flags, struct ext4_map_blocks *map,
++		 int ret),
+ 
+-	TP_ARGS(sb, group, prefetch),
++	TP_ARGS(inode, flags, map, ret),
+ 
+ 	TP_FIELDS(
+-		ctf_integer(dev_t, dev, sb->s_dev)
+-		ctf_integer(__u32, group, group)
+-		ctf_integer(bool, prefetch, prefetch)
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, pblk, map->m_pblk)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(unsigned int, flags, flags)
++		ctf_integer(ext4_lblk_t, lblk, map->m_lblk)
++		ctf_integer(unsigned int, len, map->m_len)
++		ctf_integer(unsigned int, mflags, map->m_flags)
++		ctf_integer(int, ret, ret)
+ 	)
+ )
+-#else
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_read_block_bitmap_load,
+-
+-	TP_PROTO(struct super_block *sb, unsigned long group),
+-
+-	TP_ARGS(sb, group)
+-)
+-#endif
+-
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_load_inode_bitmap,
+ 
+-	TP_PROTO(struct super_block *sb, unsigned long group),
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__map_blocks_exit, ext4_ext_map_blocks_exit,
++	TP_PROTO(struct inode *inode, unsigned flags,
++		 struct ext4_map_blocks *map, int ret),
+ 
+-	TP_ARGS(sb, group)
++	TP_ARGS(inode, flags, map, ret)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT(ext4_direct_IO_enter,
+-	TP_PROTO(struct inode *inode, loff_t offset, unsigned long len, int rw),
+-
+-	TP_ARGS(inode, offset, len, rw),
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__map_blocks_exit, ext4_ind_map_blocks_exit,
++	TP_PROTO(struct inode *inode, unsigned flags,
++		 struct ext4_map_blocks *map, int ret),
+ 
+-	TP_FIELDS(
+-		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
+-		ctf_integer(ino_t, ino, inode->i_ino)
+-		ctf_integer(loff_t, pos, offset)
+-		ctf_integer(unsigned long, len, len)
+-		ctf_integer(int, rw, rw)
+-	)
++	TP_ARGS(inode, flags, map, ret)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT(ext4_direct_IO_exit,
+-	TP_PROTO(struct inode *inode, loff_t offset, unsigned long len,
+-		 int rw, int ret),
++LTTNG_TRACEPOINT_EVENT(ext4_ext_load_extent,
++	TP_PROTO(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk),
+ 
+-	TP_ARGS(inode, offset, len, rw, ret),
++	TP_ARGS(inode, lblk, pblk),
+ 
+ 	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, pblk, pblk)
+ 		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
+-		ctf_integer(ino_t, ino, inode->i_ino)
+-		ctf_integer(loff_t, pos, offset)
+-		ctf_integer(unsigned long, len, len)
+-		ctf_integer(int, rw, rw)
+-		ctf_integer(int, ret, ret)
++		ctf_integer(ext4_lblk_t, lblk, lblk)
+ 	)
+ )
+-
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_fallocate_exit,
+ 	TP_PROTO(struct inode *inode, loff_t offset,
+ 		 unsigned int max_blocks, int ret),
+@@ -1211,8 +2011,20 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_load_extent,
+ 		ctf_integer(ext4_lblk_t, lblk, lblk)
+ 	)
+ )
++#endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
++	TP_PROTO(struct super_block *sb, unsigned long ino),
++
++	TP_ARGS(sb, ino),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, ino)
++		ctf_integer(dev_t, dev, sb->s_dev)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_load_inode,
+ 	TP_PROTO(struct super_block *sb, unsigned long ino),
+ 
+@@ -1295,7 +2107,26 @@ LTTNG_TRACEPOINT_EVENT(ext4_journal_start_reserved,
+ )
+ #endif
+ 
+-LTTNG_TRACEPOINT_EVENT(ext4_ext_handle_uninitialized_extents,
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_ext_handle_unwritten_extents,
++	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map, int flags,
++		 unsigned int allocated, ext4_fsblk_t newblock),
++
++	TP_ARGS(inode, map, flags, allocated, newblock),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, pblk, map->m_pblk)
++		ctf_integer(ext4_fsblk_t, newblk, newblock)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(int, flags, flags)
++		ctf_integer(ext4_lblk_t, lblk, map->m_lblk)
++		ctf_integer(unsigned int, len, map->m_len)
++		ctf_integer(unsigned int, allocated, allocated)
++	)
++)
++#else
++LTTNG_TRACEPOINT_EVENT(ext4_ext_handle_unwritten_extents,
+ 	TP_PROTO(struct inode *inode, struct ext4_map_blocks *map, int flags,
+ 		 unsigned int allocated, ext4_fsblk_t newblock),
+ 
+@@ -1312,6 +2143,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_handle_uninitialized_extents,
+ 		ctf_integer(ext4_fsblk_t, newblk, newblock)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_get_implied_cluster_alloc_exit,
+ 	TP_PROTO(struct super_block *sb, struct ext4_map_blocks *map, int ret),
+@@ -1386,6 +2218,22 @@ LTTNG_TRACEPOINT_EVENT(ext4_get_reserved_cluster_alloc,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_ext_show_extent,
++	TP_PROTO(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
++		 unsigned short len),
++
++	TP_ARGS(inode, lblk, pblk, len),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, pblk, pblk)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, lblk, lblk)
++		ctf_integer(unsigned short, len, len)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_ext_show_extent,
+ 	TP_PROTO(struct inode *inode, ext4_lblk_t lblk, ext4_fsblk_t pblk,
+ 		 unsigned short len),
+@@ -1400,8 +2248,32 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_show_extent,
+ 		ctf_integer(unsigned short, len, len)
+ 	)
+ )
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++
++LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
++	TP_PROTO(struct inode *inode, struct ext4_extent *ex,
++		 ext4_lblk_t from, ext4_fsblk_t to,
++		 struct partial_cluster *pc),
++
++	TP_ARGS(inode, ex, from, to, pc),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, ee_pblk, ext4_ext_pblock(ex))
++		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, from, from)
++		ctf_integer(ext4_lblk_t, to, to)
++		ctf_integer(ext4_lblk_t, ee_lblk, le32_to_cpu(ex->ee_block))
++		ctf_integer(unsigned short, ee_len, ext4_ext_get_actual_len(ex))
++		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
++		ctf_integer(int, pc_state, pc->state)
++	)
++)
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,20,0) || \
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,20,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(4,18,0,147,0,0, 4,19,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
+@@ -1448,7 +2320,28 @@ LTTNG_TRACEPOINT_EVENT(ext4_remove_blocks,
+ 
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,20,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
++	TP_PROTO(struct inode *inode, ext4_lblk_t start,
++		 struct ext4_extent *ex,
++		 struct partial_cluster *pc),
++
++	TP_ARGS(inode, start, ex, pc),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, ee_pblk, ext4_ext_pblock(ex))
++		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, start, start)
++		ctf_integer(ext4_lblk_t, ee_lblk, le32_to_cpu(ex->ee_block))
++		ctf_integer(short, ee_len, ext4_ext_get_actual_len(ex))
++		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
++		ctf_integer(int, pc_state, pc->state)
++	)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,20,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(4,18,0,147,0,0, 4,19,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
+@@ -1493,6 +2386,34 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_leaf,
+ 
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_idx,
++	TP_PROTO(struct inode *inode, ext4_fsblk_t pblk),
++
++	TP_ARGS(inode, pblk),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, pblk, pblk)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space,
++	TP_PROTO(struct inode *inode, ext4_lblk_t start,
++		 ext4_lblk_t end, int depth),
++
++	TP_ARGS(inode, start, end, depth),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, start, start)
++		ctf_integer(ext4_lblk_t, end, end)
++		ctf_integer(int, depth, depth)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(ext4_ext_rm_idx,
+ 	TP_PROTO(struct inode *inode, ext4_fsblk_t pblk),
+ 
+@@ -1519,8 +2440,30 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space,
+ 		ctf_integer(int, depth, depth)
+ 	)
+ )
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++
++LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
++	TP_PROTO(struct inode *inode, ext4_lblk_t start, ext4_lblk_t end,
++		 int depth, struct partial_cluster *pc, __le16 eh_entries),
++
++	TP_ARGS(inode, start, end, depth, pc, eh_entries),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(ext4_fsblk_t, pc_pclu, pc->pclu)
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, start, start)
++		ctf_integer(ext4_lblk_t, end, end)
++		ctf_integer(int, depth, depth)
++		ctf_integer(ext4_lblk_t, pc_lblk, pc->lblk)
++		ctf_integer(int, pc_state, pc->state)
++		ctf_integer(unsigned short, eh_entries, le16_to_cpu(eh_entries))
++	)
++)
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,20,0) || \
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,20,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(4,18,0,147,0,0, 4,19,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
+@@ -1563,6 +2506,35 @@ LTTNG_TRACEPOINT_EVENT(ext4_ext_remove_space_done,
+ 
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__es_extent,
++	TP_PROTO(struct inode *inode, struct extent_status *es),
++
++	TP_ARGS(inode, es),
++
++	TP_FIELDS(
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(u64, seq, EXT4_I(inode)->i_es_seq)
++		ctf_integer(ext4_fsblk_t, pblk, ext4_es_show_pblock(es))
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ext4_lblk_t, lblk, es->es_lblk)
++		ctf_integer(ext4_lblk_t, len, es->es_len)
++		ctf_integer(char, status, ext4_es_status(es))
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__es_extent, ext4_es_insert_extent,
++	TP_PROTO(struct inode *inode, struct extent_status *es),
++
++	TP_ARGS(inode, es)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__es_extent, ext4_es_cache_extent,
++	TP_PROTO(struct inode *inode, struct extent_status *es),
++
++	TP_ARGS(inode, es)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__es_extent,
+ 	TP_PROTO(struct inode *inode, struct extent_status *es),
+ 
+@@ -1589,6 +2561,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__es_extent, ext4_es_cache_extent,
+ 
+ 	TP_ARGS(inode, es)
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_fc_replay_scan,
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch
new file mode 100644
index 0000000000..8bf20a2047
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch
@@ -0,0 +1,75 @@
+From a74f94be254e5a9856655c982dbca44b86437897 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 10:54:27 -0400
+Subject: [PATCH 2/8] fix: hrtimer: Drop unnecessary pointer indirection in
+ hrtimer_expire_entry event (v7.1)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+See upstream commit:
+
+  commit bd803783dfa7ddd5e1d44a6abfeee26fdc3a2db7
+  Author: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
+  Date:   Wed Mar 11 11:15:18 2026 +0100
+
+    hrtimer: Drop unnecessary pointer indirection in hrtimer_expire_entry event
+
+    This pointer indirection is a remnant from when ktime_t was a struct,
+    today it is pointless.
+
+    Drop the pointer indirection.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17888]
+
+Change-Id: I58187dd1396dbdbda4ba0a00aa533deb415605d1
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/timer.h | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
+index dfc295e0..c4a94605 100644
+--- a/include/instrumentation/events/timer.h
++++ b/include/instrumentation/events/timer.h
+@@ -299,6 +299,29 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++/**
++ * htimmer_expire_entry - called immediately before the hrtimer callback
++ * @timer:	pointer to struct hrtimer
++ * @now:	variable which contains current time of the timers base.
++ *
++ * Allows to determine the timer latency.
++ */
++LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_expire_entry,
++
++	timer_hrtimer_expire_entry,
++
++	TP_PROTO(struct hrtimer *hrtimer, ktime_t now),
++
++	TP_ARGS(hrtimer, now),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, hrtimer, hrtimer)
++		ctf_integer(s64, now, lttng_ktime_get_tv64(now))
++		ctf_integer_hex(void *, function, hrtimer->function)
++	)
++)
++#else
+ /**
+  * htimmer_expire_entry - called immediately before the hrtimer callback
+  * @timer:	pointer to struct hrtimer
+@@ -321,6 +344,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_expire_entry,
+ 		ctf_integer_hex(void *, function, hrtimer->function)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(timer_hrtimer_class,
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
new file mode 100644
index 0000000000..de5e08c346
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
@@ -0,0 +1,103 @@
+From 531c6e02c5a231f153d12ff628ecb677b7c2f7b9 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 10:38:18 -0400
+Subject: [PATCH 1/8] fix: hrtimer: Reduce trace noise in hrtimer_start()
+ (v7.1)
+
+See upstream commit:
+
+  commit f2e388a019e4cf83a15883a3d1f1384298e9a6aa
+  Author: Thomas Gleixner <tglx@kernel.org>
+  Date:   Tue Feb 24 17:36:59 2026 +0100
+
+    hrtimer: Reduce trace noise in hrtimer_start()
+
+    hrtimer_start() when invoked with an already armed timer traces like:
+
+     <comm>-..   [032] d.h2. 5.002263: hrtimer_cancel: hrtimer= ....
+     <comm>-..   [032] d.h1. 5.002263: hrtimer_start: hrtimer= ....
+
+    Which is incorrect as the timer doesn't get canceled. Just the expiry time
+    changes. The internal dequeue operation which is required for that is not
+    really interesting for trace analysis. But it makes it tedious to keep real
+    cancellations and the above case apart.
+
+    Remove the cancel tracing in hrtimer_start() and add a 'was_armed'
+    indicator to the hrtimer start tracepoint, which clearly indicates what the
+    state of the hrtimer is when hrtimer_start() is invoked:
+
+    <comm>-..   [032] d.h1. 6.200103: hrtimer_start: hrtimer= .... was_armed=0
+     <comm>-..   [032] d.h1. 6.200558: hrtimer_start: hrtimer= .... was_armed=1
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17887]
+
+Change-Id: I37ee0ae0af665a51fd4f92adffb6b1dcb2ecd9d2
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/timer.h | 39 ++++++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
+index f69e069b..dfc295e0 100644
+--- a/include/instrumentation/events/timer.h
++++ b/include/instrumentation/events/timer.h
+@@ -220,12 +220,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0) || \
++	LTTNG_KERNEL_RANGE(7,0,10, 7,1,0) || \
++	LTTNG_KERNEL_RANGE(6,18,33, 6,19,0) || \
++	LTTNG_KERNEL_RANGE(6,12,91, 6,13,0) || \
++	LTTNG_KERNEL_RANGE(6,6,141, 6,7,0))
+ /**
+  * hrtimer_start - called when the hrtimer is started
+- * @timer: pointer to struct hrtimer
++ * @hrtimer:	pointer to struct hrtimer
++ * @mode:	the hrtimers mode
++ * @was_armed:	Was armed when hrtimer_start*() was invoked
+  */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
++LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
++
++	timer_hrtimer_start,
++
++	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed),
++
++	TP_ARGS(hrtimer, mode, was_armed),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, hrtimer, hrtimer)
++		ctf_integer_hex(void *, function, hrtimer->function)
++		ctf_integer(s64, expires,
++			lttng_ktime_get_tv64(hrtimer_get_expires(hrtimer)))
++		ctf_integer(s64, softexpires,
++			lttng_ktime_get_tv64(hrtimer_get_softexpires(hrtimer)))
++		ctf_enum(hrtimer_mode, unsigned int, mode, mode)
++		ctf_integer(bool, was_armed, was_armed)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
+ 	LTTNG_RT_KERNEL_RANGE(4,14,0,0, 4,15,0,0))
++/**
++ * hrtimer_start - called when the hrtimer is started
++ * @hrtimer:	pointer to struct hrtimer
++ * @mode:	the hrtimers mode
++ */
+ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 
+ 	timer_hrtimer_start,
+@@ -245,6 +276,10 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 	)
+ )
+ #else
++/**
++ * hrtimer_start - called when the hrtimer is started
++ * @hrtimer: pointer to struct hrtimer
++ */
+ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 
+ 	timer_hrtimer_start,
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch
new file mode 100644
index 0000000000..de498fa448
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch
@@ -0,0 +1,54 @@
+From b9d853f90111cf657762c3e23110ab9f7a66e1aa Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 11:36:32 -0400
+Subject: [PATCH 3/8] fix: mm/vmscan: Convert pageout() to take a folio (v5.18)
+
+See upstream commit:
+
+  commit e0cd5e7ffa549487cf1a85452f371274cbf0a8f1
+  Author: Matthew Wilcox (Oracle) <willy@infradead.org>
+  Date:   Mon Jan 17 23:35:57 2022 -0500
+
+    mm/vmscan: Convert pageout() to take a folio
+
+    We always write out an entire folio at once.  This conversion removes
+    a few calls to compound_head() and gets the NR_VMSCAN_WRITE statistic
+    right when writing out a large folio.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17890]
+
+Change-Id: I43ce035aecbfb3f640d2af32224be71067762711
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/mm_vmscan.h | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/mm_vmscan.h b/include/instrumentation/events/mm_vmscan.h
+index 15d56b38..f33bcbd2 100644
+--- a/include/instrumentation/events/mm_vmscan.h
++++ b/include/instrumentation/events/mm_vmscan.h
+@@ -510,7 +510,20 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_lru_isolate_template, mm_vmscan_memcg_
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,7,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0))
++LTTNG_TRACEPOINT_EVENT(mm_vmscan_write_folio,
++
++	TP_PROTO(struct folio *folio),
++
++	TP_ARGS(folio),
++
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, pfn, folio_pfn(folio))
++		ctf_integer(int, reclaim_flags, trace_reclaim_flags(
++				folio_is_file_lru(folio)))
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,7,0))
+ LTTNG_TRACEPOINT_EVENT(mm_vmscan_writepage,
+ 
+ 	TP_PROTO(struct page *page),
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch
new file mode 100644
index 0000000000..c1113468bd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch
@@ -0,0 +1,198 @@
+From 0d2ee7c9cb79a880c440153beeacd736d1b61a31 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 11:30:54 -0400
+Subject: [PATCH 4/8] fix: mm: vmscan: add cgroup IDs to vmscan tracepoints
+ (v7.1)
+
+See upstream commit:
+
+  commit 874a0a566ede40f3d6062cae8fe1022e616edd1a
+  Author: Thomas Ballasi <tballasi@linux.microsoft.com>
+  Date:   Mon Mar 16 09:09:07 2026 -0700
+
+    mm: vmscan: add cgroup IDs to vmscan tracepoints
+
+    Memory reclaim events are currently difficult to attribute to specific
+    cgroups, making debugging memory pressure issues challenging.  This patch
+    adds memory cgroup ID (memcg_id) to key vmscan tracepoints to enable
+    better correlation and analysis.
+
+    For operations not associated with a specific cgroup, the field is
+    defaulted to 0.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17889]
+
+Change-Id: Ib1663810300b08e599f9c144930ae156e1efbaf9
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/mm_vmscan.h | 125 ++++++++++++++++++++-
+ 1 file changed, 123 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/mm_vmscan.h b/include/instrumentation/events/mm_vmscan.h
+index f33bcbd2..cce06198 100644
+--- a/include/instrumentation/events/mm_vmscan.h
++++ b/include/instrumentation/events/mm_vmscan.h
+@@ -121,7 +121,43 @@ LTTNG_TRACEPOINT_EVENT(mm_vmscan_wakeup_kswapd,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++
++LTTNG_TRACEPOINT_EVENT_CLASS(mm_vmscan_direct_reclaim_begin_template,
++
++	TP_PROTO(gfp_t gfp_flags, int order, struct mem_cgroup *memcg),
++
++	TP_ARGS(gfp_flags, order, memcg),
++
++	TP_FIELDS(
++		ctf_integer(gfp_t, gfp_flags, gfp_flags)
++		ctf_integer(int, order, order)
++		ctf_integer(u64, memcg_id, mem_cgroup_id(memcg))
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmscan_direct_reclaim_begin,
++
++	TP_PROTO(gfp_t gfp_flags, int order, struct mem_cgroup *memcg),
++
++	TP_ARGS(gfp_flags, order, memcg)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmscan_memcg_reclaim_begin,
++
++	TP_PROTO(gfp_t gfp_flags, int order, struct mem_cgroup *memcg),
++
++	TP_ARGS(gfp_flags, order, memcg)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmscan_memcg_softlimit_reclaim_begin,
++
++	TP_PROTO(gfp_t gfp_flags, int order, struct mem_cgroup *memcg),
++
++	TP_ARGS(gfp_flags, order, memcg)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(4,18,0,305,0,0, 4,19,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(mm_vmscan_direct_reclaim_begin_template,
+@@ -232,6 +268,40 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_begin_template, mm_vmsc
+ 
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(mm_vmscan_direct_reclaim_end_template,
++
++	TP_PROTO(unsigned long nr_reclaimed, struct mem_cgroup *memcg),
++
++	TP_ARGS(nr_reclaimed, memcg),
++
++	TP_FIELDS(
++		ctf_integer(unsigned long, nr_reclaimed, nr_reclaimed)
++		ctf_integer(u64, memcg_id, mem_cgroup_id(memcg))
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_end_template, mm_vmscan_direct_reclaim_end,
++
++	TP_PROTO(unsigned long nr_reclaimed, struct mem_cgroup *memcg),
++
++	TP_ARGS(nr_reclaimed, memcg)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_end_template, mm_vmscan_memcg_reclaim_end,
++
++	TP_PROTO(unsigned long nr_reclaimed, struct mem_cgroup *memcg),
++
++	TP_ARGS(nr_reclaimed, memcg)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_end_template, mm_vmscan_memcg_softlimit_reclaim_end,
++
++	TP_PROTO(unsigned long nr_reclaimed, struct mem_cgroup *memcg),
++
++	TP_ARGS(nr_reclaimed, memcg)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(mm_vmscan_direct_reclaim_end_template,
+ 
+ 	TP_PROTO(unsigned long nr_reclaimed),
+@@ -263,8 +333,35 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(mm_vmscan_direct_reclaim_end_template, mm_vmscan
+ 
+ 	TP_ARGS(nr_reclaimed)
+ )
++#endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_slab_start,
++
++	mm_vmscan_shrink_slab_start,
++
++	TP_PROTO(struct shrinker *shr, struct shrink_control *sc,
++		long nr_objects_to_shrink, unsigned long cache_items,
++		unsigned long long delta, unsigned long total_scan,
++		int priority, struct mem_cgroup *memcg),
++
++	TP_ARGS(shr, sc, nr_objects_to_shrink, cache_items, delta, total_scan,
++		priority, memcg),
++
++	TP_FIELDS(
++		ctf_integer_hex(struct shrinker *, shr, shr)
++		ctf_integer_hex(void *, shrink, shr->scan_objects)
++		ctf_integer(int, nid, sc->nid)
++		ctf_integer(long, nr_objects_to_shrink, nr_objects_to_shrink)
++		ctf_integer(gfp_t, gfp_flags, sc->gfp_mask)
++		ctf_integer(unsigned long, cache_items, cache_items)
++		ctf_integer(unsigned long long, delta, delta)
++		ctf_integer(unsigned long, total_scan, total_scan)
++		ctf_integer(int, priority, priority)
++		ctf_integer(u64, memcg_id, mem_cgroup_id(memcg))
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_slab_start,
+ 
+ 	mm_vmscan_shrink_slab_start,
+@@ -316,6 +413,29 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_slab_start,
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_slab_end,
++
++	mm_vmscan_shrink_slab_end,
++
++	TP_PROTO(struct shrinker *shr, int nid, int shrinker_retval,
++		long unused_scan_cnt, long new_scan_cnt, long total_scan, struct mem_cgroup *memcg),
++
++	TP_ARGS(shr, nid, shrinker_retval, unused_scan_cnt, new_scan_cnt,
++		total_scan, memcg),
++
++	TP_FIELDS(
++		ctf_integer_hex(struct shrinker *, shr, shr)
++		ctf_integer(int, nid, nid)
++		ctf_integer_hex(void *, shrink, shr->scan_objects)
++		ctf_integer(long, unused_scan, unused_scan_cnt)
++		ctf_integer(long, new_scan, new_scan_cnt)
++		ctf_integer(int, retval, shrinker_retval)
++		ctf_integer(long, total_scan, total_scan)
++		ctf_integer(u64, memcg_id, mem_cgroup_id(memcg))
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_slab_end,
+ 
+ 	mm_vmscan_shrink_slab_end,
+@@ -336,6 +456,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_slab_end,
+ 		ctf_integer(long, total_scan, total_scan)
+ 	)
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,7,0) || \
+      LTTNG_RHEL_KERNEL_RANGE(5,14,0,427,16,1, 5,15,0,0,0,0))
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch
new file mode 100644
index 0000000000..c7b4c1a7f1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch
@@ -0,0 +1,56 @@
+From 0ae8e932cc2c431bafe390a43feb29b0c6a98ab5 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 14:52:02 -0400
+Subject: [PATCH 6/8] fix: treewide: change inode->i_ino from unsigned long to
+ u64 (v7.1)
+
+See upstream commit:
+
+  commit 0b2600f81cefcdfcda58d50df7be8fd48ada8ce2
+  Author: Jeff Layton <jlayton@kernel.org>
+  Date:   Wed Mar 4 10:32:42 2026 -0500
+
+    treewide: change inode->i_ino from unsigned long to u64
+
+    On 32-bit architectures, unsigned long is only 32 bits wide, which
+    causes 64-bit inode numbers to be silently truncated. Several
+    filesystems (NFS, XFS, BTRFS, etc.) can generate inode numbers that
+    exceed 32 bits, and this truncation can lead to inode number collisions
+    and other subtle bugs on 32-bit systems.
+
+    Change the type of inode->i_ino from unsigned long to u64 to ensure that
+    inode numbers are always represented as 64-bit values regardless of
+    architecture. Update all format specifiers treewide from %lu/%lx to
+    %llu/%llx to match the new type, along with corresponding local variable
+    types.
+
+    This is the bulk treewide conversion. Earlier patches in this series
+    handled trace events separately to allow trace field reordering for
+    better struct packing on 32-bit.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17905]
+
+Change-Id: I027477ced731f74999ae40bc9b66bf9d2f295cbb
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ src/lttng-uprobes.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lttng-uprobes.c b/src/lttng-uprobes.c
+index 39c09b8f..84edbd33 100644
+--- a/src/lttng-uprobes.c
++++ b/src/lttng-uprobes.c
+@@ -256,8 +256,8 @@ int lttng_uprobes_add_callsite(struct lttng_uprobe *uprobe,
+ 		      uprobe_handler->offset, &uprobe_handler->up_consumer);
+ #endif
+ 	if (ret) {
+-		printk(KERN_WARNING "LTTng: Error registering probe on inode %lu "
+-		       "and offset 0x%llx\n", uprobe->inode->i_ino,
++		printk(KERN_WARNING "LTTng: Error registering probe on inode %llu "
++		       "and offset 0x%llx\n", (u64) uprobe->inode->i_ino,
+ 		       uprobe_handler->offset);
+ 		ret = -1;
+ 		goto register_error;
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
new file mode 100644
index 0000000000..c16e6e932e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch
@@ -0,0 +1,276 @@
+From 95d19f6ff3d0591afce0e5666d3d17b9192789f6 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 11:37:51 -0400
+Subject: [PATCH 5/8] fix: vfs: widen trace event i_ino fields to u64 (v7.1)
+
+See upstream commit:
+
+  commit 5a3d5928b1a4196affc5f504fdf95f67f169bc57
+  Author: Jeff Layton <jlayton@kernel.org>
+  Date:   Wed Mar 4 10:32:34 2026 -0500
+
+    vfs: widen trace event i_ino fields to u64
+
+    Update VFS-layer trace event definitions to use u64 instead of
+    ino_t/unsigned long for inode number fields. Update TP_printk format
+    strings to use %llu/%llx to match the widened field type. Remove
+    now-unnecessary (unsigned long) casts since __entry->ino is already
+    u64.
+
+Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/17891]
+
+Change-Id: Id48ff7ffe40528f839c84eaa060ab5cd67ea1436
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+---
+ include/instrumentation/events/writeback.h | 179 ++++++++++++++++++++-
+ 1 file changed, 174 insertions(+), 5 deletions(-)
+
+diff --git a/include/instrumentation/events/writeback.h b/include/instrumentation/events/writeback.h
+index f53d9d3c..cbf9a426 100644
+--- a/include/instrumentation/events/writeback.h
++++ b/include/instrumentation/events/writeback.h
+@@ -35,6 +35,31 @@ static inline const char *lttng_bdi_dev_name(struct backing_dev_info *bdi)
+ 	return dev_name(bdi->dev);
+ }
+ #endif
++
++#ifdef CONFIG_CGROUP_WRITEBACK
++static inline u64 lttng_wb_assign_cgroup(struct bdi_writeback *wb)
++{
++	return cgroup_ino(wb->memcg_css->cgroup);
++}
++
++static inline u64 lttng_wbc_assign_cgroup(struct writeback_control *wbc)
++{
++	if (wbc->wb)
++		return lttng_wb_assign_cgroup(wbc->wb);
++	else
++		return 1;
++}
++#else   /* CONFIG_CGROUP_WRITEBACK */
++static inline u64 lttng_wb_assign_cgroup(struct bdi_writeback *wb)
++{
++	return 1;
++}
++
++static inline u64 lttng_wbc_assign_cgroup(struct writeback_control *wbc)
++{
++	return 1;
++}
++#endif  /* CONFIG_CGROUP_WRITEBACK */
+ #endif
+ 
+ /*
+@@ -101,7 +126,36 @@ static inline const char *lttng_bdi_dev_name(struct backing_dev_info *bdi)
+ 	)
+ #endif /* #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0)) */
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,16,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(writeback_folio_template,
++
++	TP_PROTO(struct folio *folio, struct address_space *mapping),
++
++	TP_ARGS(folio, mapping),
++
++	TP_FIELDS(
++		ctf_string(name, lttng_bdi_dev_name(mapping ? inode_to_bdi(mapping->host) : NULL))
++		ctf_integer(u64, ino, (mapping && mapping->host) ? mapping->host->i_ino : 0)
++		ctf_integer(pgoff_t, index, folio->index)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_folio_template, writeback_dirty_folio,
++
++	TP_PROTO(struct folio *folio, struct address_space *mapping),
++
++	TP_ARGS(folio, mapping)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(writeback_folio_template, folio_wait_writeback,
++
++	writeback_folio_wait,
++
++	TP_PROTO(struct folio *folio, struct address_space *mapping),
++
++	TP_ARGS(folio, mapping)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,16,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_folio_template,
+ 
+ 	TP_PROTO(struct folio *folio, struct address_space *mapping),
+@@ -168,7 +222,19 @@ LTTNG_TRACEPOINT_EVENT(writeback_dirty_page,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(writeback_dirty_inode_template,
++	TP_PROTO(struct inode *inode, int flags),
++	TP_ARGS(inode, flags),
++	TP_FIELDS(
++		/* may be called for files on pseudo FSes w/ unregistered bdi */
++		ctf_string(name, lttng_bdi_dev_name(inode_to_bdi(inode)))
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(unsigned long, state, inode_state_read_once(inode))
++		ctf_integer(unsigned long, flags, flags)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_dirty_inode_template,
+ 	TP_PROTO(struct inode *inode, int flags),
+ 	TP_ARGS(inode, flags),
+@@ -202,6 +268,18 @@ LTTNG_TRACEPOINT_EVENT_WRITEBACK_DIRTY_INODE_TEMPLATE(writeback_dirty_inode_star
+ LTTNG_TRACEPOINT_EVENT_WRITEBACK_DIRTY_INODE_TEMPLATE(writeback_dirty_inode)
+ LTTNG_TRACEPOINT_EVENT_WRITEBACK_DIRTY_INODE_TEMPLATE(writeback_mark_inode_dirty)
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(writeback_write_inode_template,
++	TP_PROTO(struct inode *inode, struct writeback_control *wbc),
++	TP_ARGS(inode, wbc),
++	TP_FIELDS(
++		ctf_string(name, lttng_bdi_dev_name(inode_to_bdi(inode)))
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(u64, cgroup_ino, lttng_wbc_assign_cgroup(wbc))
++		ctf_integer(int, sync_mode, wbc->sync_mode)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_write_inode_template,
+ 	TP_PROTO(struct inode *inode, struct writeback_control *wbc),
+ 	TP_ARGS(inode, wbc),
+@@ -211,6 +289,7 @@ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_write_inode_template,
+ 		ctf_integer(int, sync_mode, wbc->sync_mode)
+ 	)
+ )
++#endif
+ 
+ #define LTTNG_TRACEPOINT_EVENT_WRITEBACK_WRITE_INODE(name) \
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_write_inode_template, name, \
+@@ -457,7 +536,53 @@ LTTNG_TRACEPOINT_EVENT_MAP(bdi_dirty_ratelimit,
+ 	)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,15,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_MAP(balance_dirty_pages,
++
++	writeback_balance_dirty_pages,
++
++	TP_PROTO(struct bdi_writeback *wb,
++		 struct dirty_throttle_control *dtc,
++		 unsigned long dirty_ratelimit,
++		 unsigned long task_ratelimit,
++		 unsigned long dirtied,
++		 unsigned long period,
++		 long pause,
++		 unsigned long start_time),
++
++	TP_ARGS(wb, dtc, dirty_ratelimit, task_ratelimit,
++		dirtied, period, pause, start_time
++	),
++
++	TP_FIELDS(
++		ctf_string(bdi, lttng_bdi_dev_name(wb->bdi))
++		ctf_integer(u64, cgroup_ino, lttng_wb_assign_cgroup(wb))
++		ctf_integer(unsigned long, limit, dtc->limit)
++		ctf_integer(unsigned long, setpoint,
++                    (dtc->limit + (dtc->thresh + dtc->bg_thresh)) / 2)
++		ctf_integer(unsigned long, dirty, dtc->dirty)
++		ctf_integer(unsigned long, wb_setpoint,
++                    ((dtc->limit + (dtc->thresh + dtc->bg_thresh)) / 2)
++                    * (dtc->wb_thresh / (dtc->thresh + 1)))
++		ctf_integer(unsigned long, wb_dirty, dtc->wb_dirty)
++		ctf_integer(unsigned long, dirty_ratelimit,
++			KBps(dirty_ratelimit))
++		ctf_integer(unsigned long, task_ratelimit,
++			KBps(task_ratelimit))
++		ctf_integer(unsigned long, paused,
++			(jiffies - start_time) * 1000 / HZ)
++		ctf_integer(long, pause, pause * 1000 / HZ)
++		ctf_integer(unsigned long, period,
++			period * 1000 / HZ)
++		ctf_integer(long, think,
++			current->dirty_paused_when == 0 ? 0 :
++				(long)(jiffies - current->dirty_paused_when) * 1000/HZ)
++		ctf_integer(unsigned int, dirtied, dirtied)
++		ctf_integer(unsigned int, dirtied_pause,
++			current->nr_dirtied_pause)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,15,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(balance_dirty_pages,
+ 
+ 	writeback_balance_dirty_pages,
+@@ -604,7 +729,21 @@ LTTNG_TRACEPOINT_EVENT_MAP(balance_dirty_pages,
+ )
+ #endif /* else (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,14,2)) */
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT(writeback_sb_inodes_requeue,
++
++	TP_PROTO(struct inode *inode),
++	TP_ARGS(inode),
++
++	TP_FIELDS(
++		ctf_string(name, lttng_bdi_dev_name(inode_to_bdi(inode)))
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(u64, cgroup_ino, lttng_wb_assign_cgroup(inode_to_wb(inode)))
++		ctf_integer(unsigned long, state, inode_state_read_once(inode))
++		ctf_integer(unsigned long, dirtied_when, inode->dirtied_when)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
+ LTTNG_TRACEPOINT_EVENT(writeback_sb_inodes_requeue,
+ 
+ 	TP_PROTO(struct inode *inode),
+@@ -658,7 +797,30 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_congest_waited_template, writeback_wai
+ 	TP_ARGS(usec_timeout, usec_delayed)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(writeback_single_inode_template,
++
++	TP_PROTO(struct inode *inode,
++		 struct writeback_control *wbc,
++		 unsigned long nr_to_write
++	),
++
++	TP_ARGS(inode, wbc, nr_to_write),
++
++	TP_FIELDS(
++		ctf_string(name, lttng_bdi_dev_name(inode_to_bdi(inode)))
++		ctf_integer(u64, ino, inode->i_ino)
++		ctf_integer(u64, cgroup_ino, lttng_wbc_assign_cgroup(wbc))
++		ctf_integer(unsigned long, state, inode_state_read_once(inode))
++		ctf_integer(unsigned long, dirtied_when, inode->dirtied_when)
++		ctf_integer(unsigned long, writeback_index,
++			inode->i_mapping->writeback_index)
++		ctf_integer(unsigned long, wrote,
++			nr_to_write - wbc->nr_to_write)
++		ctf_integer(long, nr_to_write, nr_to_write)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,19,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_single_inode_template,
+ 
+ 	TP_PROTO(struct inode *inode,
+@@ -704,6 +866,13 @@ LTTNG_TRACEPOINT_EVENT_CLASS(writeback_single_inode_template,
+ )
+ #endif
+ 
++LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_single_inode_template, writeback_single_inode_start,
++	TP_PROTO(struct inode *inode,
++		 struct writeback_control *wbc,
++		 unsigned long nr_to_write),
++	TP_ARGS(inode, wbc, nr_to_write)
++)
++
+ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_single_inode_template, writeback_single_inode,
+ 	TP_PROTO(struct inode *inode,
+ 		 struct writeback_control *wbc,
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
index 722b1ac5dd..6e0cc811b4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
@@ -15,6 +15,14 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                    file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
+                   file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch \
+                   file://0001-fix-hrtimer-Drop-unnecessary-pointer-indirection-in.patch \
+                   file://0001-fix-mm-vmscan-Convert-pageout-to-take-a-folio-v5.18.patch \
+                   file://0001-fix-mm-vmscan-add-cgroup-IDs-to-vmscan-tracepoints-v7.1.patch \
+                   file://0001-fix-vfs-widen-trace-event-i_ino-fields-to-u64-v7.1.patch \
+                   file://0001-fix-treewide-change-inode-i_ino-from-unsigned-long-to-u64-v7.1.patch \
+                   file://0001-fix-ext4-enhance-tracepoints-during-the-folios-writeback-v6.17.patch \
+                   file://0001-fix-ext4-widen-trace-event-i_ino-fields-to-u64-v7.1.patch \
                 "
 SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
 
-- 
2.43.0


