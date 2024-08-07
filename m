Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02332C52D71
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 14:58:30 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.35723.1723042706465587836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 07:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L2Ls2F89;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4503ccbc218so7942001cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723042705; x=1723647505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCLQB30N1gb3tXaOrevZ6Jc4Qs94DeJxjTMWdaHSeSI=;
        b=L2Ls2F89C346ae1vB6ZIPkcar92FM5eeBpSRy3yJK9PbLKXEgcacpexyn6EqrZVuUq
         g3lZ1I7gFj9tYF8GvXgM5+tJzepKbjgNJQDUhAv25eyv21q7XnVd5z+3nvBq19fAB4RN
         ZA1GiuX+Uv8JIpB0xk9t/O7GhJlPSYx2jGwY0ifzS/GHpWkIFyCQNcQcn3L0rcaFz0nL
         U/1EagVE5KFlUsiRIXuIydapHBG93ZQfKg6dtFZMtGeZEBuCQhhDfdiQ1VzC0Oxeemsp
         JtcT2V3c5WP6dfd/JzAmLv5zlEhqcqL07DIKKkJoistgwWOBpdcQV+dK9Am17jGbxRwg
         1tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042705; x=1723647505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCLQB30N1gb3tXaOrevZ6Jc4Qs94DeJxjTMWdaHSeSI=;
        b=tGIPY9AGCUui3ijbLD4LwU9g/TlmbBAdeFmcmkiZx5KvPY1/pSqXx8uxpFEkbOwM+X
         IRBu+pcemjVqnyVffOQ4+2y300/TtUzZNaRgLeTB5Fx4G4YixHqVaBWvdG8yHy6rntu5
         km7+XHjGufwEdcgQkl65JanvftQO77xdvWsV7Iv29d9NFXJ5P+kwt0uzIcDPs128JE34
         rBYLIWnmaIjqyHCD9VOa8TqUfN81b+rYOpquAptydYfYtHAWsb0GWaXR6NgPt2mhQHDc
         5K86EkBW/jsXqJWlieLwOz11/EB4FyqdOK7uclCyABw1uU8ztMfs3gZYkLEI+TyJE9T4
         NrAA==
X-Gm-Message-State: AOJu0YyH0QMLQlhJF4nNrgzlYwgXhwFpp/iFW1VK8ar4khI2sO1Qs0uk
	i8dKYw9uXcsrpo7OFXrisOoKSHu5qTUIcNtn4UYbByZE8cTZBr2onY2EmsS1
X-Google-Smtp-Source: AGHT+IEGmHhqVLVjHJaHaXt33owg6CuxVVskLWY6aMsnB4xFvPhDoxVVHfYMwUffPmWo6D/i5ox8Pg==
X-Received: by 2002:a05:622a:1e16:b0:44f:ed67:b536 with SMTP id d75a77b69052e-451c799ee06mr37943881cf.15.1723042705011;
        Wed, 07 Aug 2024 07:58:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c8715d59sm5492451cf.28.2024.08.07.07.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 07:58:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: backport patches for kernel v6.11
Date: Wed,  7 Aug 2024 10:58:22 -0400
Message-Id: <20240807145822.1455537-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 14:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203078

From: Bruce Ashfield <bruce.ashfield@gmail.com>

While we wait for a new lttng-release, we backport 6
patches to fix the build against the 6.11 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...01-Fix-kfree_skb-changed-in-6.11-rc1.patch |  65 ++++++
 ...da_reserve_space-changed-in-6.11-rc1.patch |  58 +++++
 ...emoved-from-btrfs_get_extent-in-6.11.patch |  67 ++++++
 ...moved-frmo-btrfs_get_extent-in-6.11-.patch |  47 ++++
 ...removed-from-btrfs_get_extent-in-6.1.patch |  54 +++++
 ...omic-write-support-added-in-6.11-rc1.patch | 203 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.13.bb            |   6 +
 7 files changed, 500 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
new file mode 100644
index 0000000000..83b753994e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
@@ -0,0 +1,65 @@
+From 9706d0431c9cc4178db4cf630fee6f5f85f2543e Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 29 Jul 2024 14:01:18 +0000
+Subject: [PATCH 1/6] Fix: kfree_skb changed in 6.11-rc1
+
+See upstream commit:
+
+    commit c53795d48ee8f385c6a9e394651e7ee914baaeba
+    Author: Yan Zhai <yan@cloudflare.com>
+    Date:   Mon Jun 17 11:09:04 2024 -0700
+
+        net: add rx_sk to trace_kfree_skb
+
+        skb does not include enough information to find out receiving
+        sockets/services and netns/containers on packet drops. In theory
+        skb->dev tells about netns, but it can get cleared/reused, e.g. by TCP
+        stack for OOO packet lookup. Similarly, skb->sk often identifies a local
+        sender, and tells nothing about a receiver.
+
+        Allow passing an extra receiving socket to the tracepoint to improve
+        the visibility on receiving drops.
+
+Upstream-Status: Backport
+
+Change-Id: I33c8ce1a48006456f198ab1592f733b55be01016
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/skb.h | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
+index edfda7ff..0b5a95dc 100644
+--- a/include/instrumentation/events/skb.h
++++ b/include/instrumentation/events/skb.h
+@@ -43,7 +43,25 @@ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
++LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
++
++	skb_kfree,
++
++	TP_PROTO(struct sk_buff *skb, void *location,
++		enum skb_drop_reason reason, struct sock *rx_sk),
++
++	TP_ARGS(skb, location, reason, rx_sk),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, skbaddr, skb)
++		ctf_integer_hex(void *, location, location)
++		ctf_integer_network(unsigned short, protocol, skb->protocol)
++		ctf_enum(skb_drop_reason, uint8_t, reason, reason)
++		ctf_integer_hex(void *, rx_skaddr, rx_sk)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
+ 	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0) \
+ 	|| LTTNG_RHEL_KERNEL_RANGE(5,14,0,70,0,0, 5,15,0,0,0,0) \
+ 	|| LTTNG_RHEL_KERNEL_RANGE(4,18,0,477,10,1, 4,19,0,0,0,0))
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
new file mode 100644
index 0000000000..94582cd47b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
@@ -0,0 +1,58 @@
+From 7f0f61083a9e88abb289c7575586178739e94955 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 29 Jul 2024 14:08:32 +0000
+Subject: [PATCH 2/6] Fix: ext4_da_reserve_space changed in 6.11-rc1
+
+See upstream commit:
+
+    commit 0d66b23d79c750276f791411d81a524549a64852
+    Author: Zhang Yi <yi.zhang@huawei.com>
+    Date:   Fri May 17 20:40:02 2024 +0800
+
+        ext4: make ext4_da_reserve_space() reserve multi-clusters
+
+        Add 'nr_resv' parameter to ext4_da_reserve_space(), which indicates the
+        number of clusters wants to reserve, make it reserve multiple clusters
+        at a time.
+
+Upstream-Status: Backport
+
+Change-Id: Ib1ce8c3023d53a6d22ec444a435fdb3c871f64c5
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/ext4.h | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
+index 462b11bf..addf2246 100644
+--- a/include/instrumentation/events/ext4.h
++++ b/include/instrumentation/events/ext4.h
+@@ -730,7 +730,23 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
++LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
++	TP_PROTO(struct inode *inode, int nr_resv),
++
++	TP_ARGS(inode, nr_resv),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(__u64, i_blocks, inode->i_blocks)
++		ctf_integer(__u64, nr_resv, nr_resv)
++		ctf_integer(int, reserved_data_blocks,
++				EXT4_I(inode)->i_reserved_data_blocks)
++		ctf_integer(TP_MODE_T, mode, inode->i_mode)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
+ 	TP_PROTO(struct inode *inode),
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
new file mode 100644
index 0000000000..5273efe53e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
@@ -0,0 +1,67 @@
+From aef97cb8d8ce45a9ea02eaedd20c28e4b69f4acf Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 29 Jul 2024 14:11:36 +0000
+Subject: [PATCH 3/6] Fix: orig_start removed from btrfs_get_extent in 6.11-rc1
+
+See upstream commit:
+
+    commit 4aa7b5d1784f510c0f42afc1d74efb41947221d7
+    Author: Qu Wenruo <wqu@suse.com>
+    Date:   Tue Apr 30 07:53:04 2024 +0930
+
+        btrfs: remove extent_map::orig_start member
+
+        Since we have extent_map::offset, the old extent_map::orig_start is just
+        extent_map::start - extent_map::offset for non-hole/inline extents.
+
+        And since the new extent_map::offset is already verified by
+        validate_extent_map() while the old orig_start is not, let's just remove
+        the old member from all call sites.
+
+Upstream-Status: Backport
+
+Change-Id: I025a30d49b3e3ddc37d7846acc191ebbdf2ff19e
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 24 +++++++++++++++++++++++-
+ 1 file changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index f1b82db4..40139dee 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -176,7 +176,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
++
++LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
++
++	TP_PROTO(const struct btrfs_root *root, const struct btrfs_inode *inode,
++		const struct extent_map *map),
++
++	TP_ARGS(root, inode, map),
++
++	TP_FIELDS(
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, ino, btrfs_ino(inode))
++		ctf_integer(u64, start, map->start)
++		ctf_integer(u64, len, map->len)
++		ctf_integer(u64, block_start, map->block_start)
++		ctf_integer(u64, block_len, map->block_len)
++		ctf_integer(unsigned int, flags, map->flags)
++		ctf_integer(int, refs, refcount_read(&map->refs))
++		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
++	)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
new file mode 100644
index 0000000000..8dab9cac47
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
@@ -0,0 +1,47 @@
+From d44bc12d138513eb3d1dae4e66a4d76d7c567212 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 29 Jul 2024 14:12:47 +0000
+Subject: [PATCH 4/6] Fix: block_len removed frmo btrfs_get_extent in 6.11-rc1
+
+See upstream commit:
+
+    commit e28b851ed9b232c3b84cb8d0fedbdfa8ca881386
+    Author: Qu Wenruo <wqu@suse.com>
+    Date:   Tue Apr 30 07:53:05 2024 +0930
+
+        btrfs: remove extent_map::block_len member
+
+        The extent_map::block_len is either extent_map::len (non-compressed
+        extent) or extent_map::disk_num_bytes (compressed extent).
+
+        Since we already have sanity checks to do the cross-checks between the
+        new and old members, we can drop the old extent_map::block_len now.
+
+        For most call sites, they can manually select extent_map::len or
+        extent_map::disk_num_bytes, since most if not all of them have checked
+        if the extent is compressed.
+
+Upstream-Status: Backport
+
+Change-Id: Ib03fc685b4e876bf4e53afdd28ca9826342a0e4e
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index 40139dee..a764fb3b 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -191,7 +191,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
+ 		ctf_integer(u64, start, map->start)
+ 		ctf_integer(u64, len, map->len)
+ 		ctf_integer(u64, block_start, map->block_start)
+-		ctf_integer(u64, block_len, map->block_len)
+ 		ctf_integer(unsigned int, flags, map->flags)
+ 		ctf_integer(int, refs, refcount_read(&map->refs))
+ 		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
new file mode 100644
index 0000000000..da933d2f72
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
@@ -0,0 +1,54 @@
+From f2762247871d9340f3cbe7e40f25ceb6dbdb81f1 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 29 Jul 2024 14:14:24 +0000
+Subject: [PATCH 5/6] Fix: block_start removed from btrfs_get_extent in
+ 6.11-rc1
+
+See upstream commit:
+
+    commit c77a8c61002e91d859e118008fd495efbe1d9373
+    Author: Qu Wenruo <wqu@suse.com>
+    Date:   Tue Apr 30 07:53:06 2024 +0930
+
+        btrfs: remove extent_map::block_start member
+
+        The member extent_map::block_start can be calculated from
+        extent_map::disk_bytenr + extent_map::offset for regular extents.
+        And otherwise just extent_map::disk_bytenr.
+
+        And this is already validated by the validate_extent_map().  Now we can
+        remove the member.
+
+        However there is a special case in btrfs_create_dio_extent() where we
+        for NOCOW/PREALLOC ordered extents cannot directly use the resulting
+        btrfs_file_extent, as btrfs_split_ordered_extent() cannot handle them
+        yet.
+
+        So for that call site, we pass file_extent->disk_bytenr +
+        file_extent->num_bytes as disk_bytenr for the ordered extent, and 0 for
+        offset.
+
+Upstream-Status: Backport
+
+Change-Id: I2e3245bb0d1f5263e902659aa05848d5e231909b
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index a764fb3b..4ceb8e02 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -190,7 +190,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
+ 		ctf_integer(u64, ino, btrfs_ino(inode))
+ 		ctf_integer(u64, start, map->start)
+ 		ctf_integer(u64, len, map->len)
+-		ctf_integer(u64, block_start, map->block_start)
+ 		ctf_integer(unsigned int, flags, map->flags)
+ 		ctf_integer(int, refs, refcount_read(&map->refs))
+ 		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
new file mode 100644
index 0000000000..778c7e3b86
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
@@ -0,0 +1,203 @@
+From 166a05ce64a05218f51563d201644ab3bfddaacc Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 29 Jul 2024 14:23:02 +0000
+Subject: [PATCH 6/6] Fix: scsi: sd: Atomic write support added in 6.11-rc1
+
+See upstream commit:
+
+    commit bf4ae8f2e6407a779c0368eb0f3e047a8333be17
+    Author: John Garry <john.g.garry@oracle.com>
+    Date:   Thu Jun 20 12:53:57 2024 +0000
+
+        scsi: sd: Atomic write support
+
+        Support is divided into two main areas:
+        - reading VPD pages and setting sdev request_queue limits
+        - support WRITE ATOMIC (16) command and tracing
+
+        The relevant block limits VPD page need to be read to allow the block layer
+        request_queue atomic write limits to be set. These VPD page limits are
+        described in sbc4r22 section 6.6.4 - Block limits VPD page.
+
+        There are five limits of interest:
+        - MAXIMUM ATOMIC TRANSFER LENGTH
+        - ATOMIC ALIGNMENT
+        - ATOMIC TRANSFER LENGTH GRANULARITY
+        - MAXIMUM ATOMIC TRANSFER LENGTH WITH BOUNDARY
+        - MAXIMUM ATOMIC BOUNDARY SIZE
+
+        MAXIMUM ATOMIC TRANSFER LENGTH is the maximum length for a WRITE ATOMIC
+        (16) command. It will not be greater than the device MAXIMUM TRANSFER
+        LENGTH.
+
+        ATOMIC ALIGNMENT and ATOMIC TRANSFER LENGTH GRANULARITY are the minimum
+        alignment and length values for an atomic write in terms of logical blocks.
+
+        Unlike NVMe, SCSI does not specify an LBA space boundary, but does specify
+        a per-IO boundary granularity. The maximum boundary size is specified in
+        MAXIMUM ATOMIC BOUNDARY SIZE. When used, this boundary value is set in the
+        WRITE ATOMIC (16) ATOMIC BOUNDARY field - layout for the WRITE_ATOMIC_16
+        command can be found in sbc4r22 section 5.48. This boundary value is the
+        granularity size at which the device may atomically write the data. A value
+        of zero in WRITE ATOMIC (16) ATOMIC BOUNDARY field means that all data must
+        be atomically written together.
+
+        MAXIMUM ATOMIC TRANSFER LENGTH WITH BOUNDARY is the maximum atomic write
+        length if a non-zero boundary value is set.
+
+        For atomic write support, the WRITE ATOMIC (16) boundary is not of much
+        interest, as the block layer expects each request submitted to be executed
+        be atomically written together.
+
+        MAXIMUM ATOMIC TRANSFER LENGTH WITH BOUNDARY is the maximum atomic write
+        length if a non-zero boundary value is set.
+
+        For atomic write support, the WRITE ATOMIC (16) boundary is not of much
+        interest, as the block layer expects each request submitted to be executed
+        atomically. However, the SCSI spec does leave itself open to a quirky
+        scenario where MAXIMUM ATOMIC TRANSFER LENGTH is zero, yet MAXIMUM ATOMIC
+        TRANSFER LENGTH WITH BOUNDARY and MAXIMUM ATOMIC BOUNDARY SIZE are both
+        non-zero. This case will be supported.
+
+        To set the block layer request_queue atomic write capabilities, sanitize
+        the VPD page limits and set limits as follows:
+        - atomic_write_unit_min is derived from granularity and alignment values.
+          If no granularity value is not set, use physical block size
+        - atomic_write_unit_max is derived from MAXIMUM ATOMIC TRANSFER LENGTH. In
+          the scenario where MAXIMUM ATOMIC TRANSFER LENGTH is zero and boundary
+          limits are non-zero, use MAXIMUM ATOMIC BOUNDARY SIZE for
+          atomic_write_unit_max. New flag scsi_disk.use_atomic_write_boundary is
+          set for this scenario.
+        - atomic_write_boundary_bytes is set to zero always
+
+        SCSI also supports a WRITE ATOMIC (32) command, which is for type 2
+        protection enabled. This is not going to be supported now, so check for
+        T10_PI_TYPE2_PROTECTION when setting any request_queue limits.
+
+        To handle an atomic write request, add support for WRITE ATOMIC (16)
+        command in handler sd_setup_atomic_cmnd(). Flag use_atomic_write_boundary
+        is checked here for encoding ATOMIC BOUNDARY field.
+
+        Trace info is also added for WRITE_ATOMIC_16 command.
+
+Upstream-Status: Backport
+
+Change-Id: Ie072002fe2184615c72531ac081a324ef18cfb03
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/scsi.h | 98 ++++++++++++++++++++++++++-
+ 1 file changed, 97 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/scsi.h b/include/instrumentation/events/scsi.h
+index de2a1998..175ab003 100644
+--- a/include/instrumentation/events/scsi.h
++++ b/include/instrumentation/events/scsi.h
+@@ -19,7 +19,103 @@
+ 
+ #define scsi_opcode_name(opcode)	{ opcode, #opcode }
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,7,0) \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
++
++#define show_opcode_name(val)					\
++	__print_symbolic(val,					\
++		scsi_opcode_name(TEST_UNIT_READY),		\
++		scsi_opcode_name(REZERO_UNIT),			\
++		scsi_opcode_name(REQUEST_SENSE),		\
++		scsi_opcode_name(FORMAT_UNIT),			\
++		scsi_opcode_name(READ_BLOCK_LIMITS),		\
++		scsi_opcode_name(REASSIGN_BLOCKS),		\
++		scsi_opcode_name(INITIALIZE_ELEMENT_STATUS),	\
++		scsi_opcode_name(READ_6),			\
++		scsi_opcode_name(WRITE_6),			\
++		scsi_opcode_name(SEEK_6),			\
++		scsi_opcode_name(READ_REVERSE),			\
++		scsi_opcode_name(WRITE_FILEMARKS),		\
++		scsi_opcode_name(SPACE),			\
++		scsi_opcode_name(INQUIRY),			\
++		scsi_opcode_name(RECOVER_BUFFERED_DATA),	\
++		scsi_opcode_name(MODE_SELECT),			\
++		scsi_opcode_name(RESERVE),			\
++		scsi_opcode_name(RELEASE),			\
++		scsi_opcode_name(COPY),				\
++		scsi_opcode_name(ERASE),			\
++		scsi_opcode_name(MODE_SENSE),			\
++		scsi_opcode_name(START_STOP),			\
++		scsi_opcode_name(RECEIVE_DIAGNOSTIC),		\
++		scsi_opcode_name(SEND_DIAGNOSTIC),		\
++		scsi_opcode_name(ALLOW_MEDIUM_REMOVAL),		\
++		scsi_opcode_name(SET_WINDOW),			\
++		scsi_opcode_name(READ_CAPACITY),		\
++		scsi_opcode_name(READ_10),			\
++		scsi_opcode_name(WRITE_10),			\
++		scsi_opcode_name(SEEK_10),			\
++		scsi_opcode_name(POSITION_TO_ELEMENT),		\
++		scsi_opcode_name(WRITE_VERIFY),			\
++		scsi_opcode_name(VERIFY),			\
++		scsi_opcode_name(SEARCH_HIGH),			\
++		scsi_opcode_name(SEARCH_EQUAL),			\
++		scsi_opcode_name(SEARCH_LOW),			\
++		scsi_opcode_name(SET_LIMITS),			\
++		scsi_opcode_name(PRE_FETCH),			\
++		scsi_opcode_name(READ_POSITION),		\
++		scsi_opcode_name(SYNCHRONIZE_CACHE),		\
++		scsi_opcode_name(LOCK_UNLOCK_CACHE),		\
++		scsi_opcode_name(READ_DEFECT_DATA),		\
++		scsi_opcode_name(MEDIUM_SCAN),			\
++		scsi_opcode_name(COMPARE),			\
++		scsi_opcode_name(COPY_VERIFY),			\
++		scsi_opcode_name(WRITE_BUFFER),			\
++		scsi_opcode_name(READ_BUFFER),			\
++		scsi_opcode_name(UPDATE_BLOCK),			\
++		scsi_opcode_name(READ_LONG),			\
++		scsi_opcode_name(WRITE_LONG),			\
++		scsi_opcode_name(CHANGE_DEFINITION),		\
++		scsi_opcode_name(WRITE_SAME),			\
++		scsi_opcode_name(UNMAP),			\
++		scsi_opcode_name(READ_TOC),			\
++		scsi_opcode_name(LOG_SELECT),			\
++		scsi_opcode_name(LOG_SENSE),			\
++		scsi_opcode_name(XDWRITEREAD_10),		\
++		scsi_opcode_name(MODE_SELECT_10),		\
++		scsi_opcode_name(RESERVE_10),			\
++		scsi_opcode_name(RELEASE_10),			\
++		scsi_opcode_name(MODE_SENSE_10),		\
++		scsi_opcode_name(PERSISTENT_RESERVE_IN),	\
++		scsi_opcode_name(PERSISTENT_RESERVE_OUT),	\
++		scsi_opcode_name(VARIABLE_LENGTH_CMD),		\
++		scsi_opcode_name(REPORT_LUNS),			\
++		scsi_opcode_name(MAINTENANCE_IN),		\
++		scsi_opcode_name(MAINTENANCE_OUT),		\
++		scsi_opcode_name(MOVE_MEDIUM),			\
++		scsi_opcode_name(EXCHANGE_MEDIUM),		\
++		scsi_opcode_name(READ_12),			\
++		scsi_opcode_name(WRITE_12),			\
++		scsi_opcode_name(WRITE_VERIFY_12),		\
++		scsi_opcode_name(SEARCH_HIGH_12),		\
++		scsi_opcode_name(SEARCH_EQUAL_12),		\
++		scsi_opcode_name(SEARCH_LOW_12),		\
++		scsi_opcode_name(READ_ELEMENT_STATUS),		\
++		scsi_opcode_name(SEND_VOLUME_TAG),		\
++		scsi_opcode_name(WRITE_LONG_2),			\
++		scsi_opcode_name(READ_16),			\
++		scsi_opcode_name(WRITE_16),			\
++		scsi_opcode_name(VERIFY_16),			\
++		scsi_opcode_name(WRITE_SAME_16),		\
++		scsi_opcode_name(ZBC_OUT),			\
++		scsi_opcode_name(ZBC_IN),			\
++		scsi_opcode_name(SERVICE_ACTION_IN_16),		\
++		scsi_opcode_name(READ_32),			\
++		scsi_opcode_name(WRITE_32),			\
++		scsi_opcode_name(WRITE_SAME_32),		\
++		scsi_opcode_name(ATA_16),			\
++		scsi_opcode_name(WRITE_ATOMIC_16),		\
++		scsi_opcode_name(ATA_12))
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,7,0)  \
+ 	|| LTTNG_SLE_KERNEL_RANGE(4,4,9,36,0,0, 4,5,0,0,0,0))
+ 
+ #define show_opcode_name(val)					\
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
index 75b144757a..0363e8be70 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
@@ -14,6 +14,12 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch \
            file://0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch \
            file://0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch \
+           file://0001-Fix-kfree_skb-changed-in-6.11-rc1.patch \
+           file://0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch \
+           file://0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch \
+           file://0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch \
+           file://0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch \
+           file://0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch \
         "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.39.2


