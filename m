Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC70D2FFE6
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 10:01:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.18593.1729245704637264113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 03:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QCEbptLa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eac969aso8697735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729245703; x=1729850503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR5F5vy35INapbmyKaaf7mohlftRaJ7KOSoeYdjPDkA=;
        b=QCEbptLax2Vv1faWIwqJQ7p3FTkATFvqAZO75uwDWlXbBljLaH9/eVeBTfAKMJe2jf
         4cr7lNocKgleMn1ssbzFIZO+utcy6mwoxjZ6tRzhXLVSBFik/EYMkhdwoE2wQQ5vnDse
         kh/ZOFb0xPCQmrmVUX6RZhgPEzxq2mK4ZVuzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245703; x=1729850503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR5F5vy35INapbmyKaaf7mohlftRaJ7KOSoeYdjPDkA=;
        b=CQr1x82tFIYYu1KIPr+IEdp6ZsIybXuN6T0mzPf6tIL7iIjMvGFsWVDqw/v9b0fZf4
         fFdAy9LIVYN/ngeA50PAj/zqMIkKEgEGsGRRa4ZDYpbJSPDM5PLn/HX2/v+7dMQpXbzM
         3+QX5RHt/bbuqIG1bCW2GwKuuzxA0gX0V+YnGZTXjqWnwNlTdHvXu+QQjTOsoTp8V3SQ
         AT+WNLWD+pmbs9ShbkRYkgQV/PRFJhCsxMbs4esy6A9DYyy3cBXMFrLLGx0DlMBxOThJ
         GakyeE/qEa4xZCAaQOaJOuEJ0/7KLdmqWmvaXeuIbiV0G5IC8x2iFH1IakuAMifJNvG9
         vJXA==
X-Gm-Message-State: AOJu0YxKoqDxh6R2ToasYSBsGKTrnE1++0esKFE4e9jlKp67kzB0MaZO
	+BMfWhMShdh5iacEo35+wQH5Fhqm5gMVYK5fIr+Asbc2Y+Q0tm6ECJ+97c6RUJI1GEjfAC4v4iG
	O
X-Google-Smtp-Source: AGHT+IGUi+1mu3nS1dCrrQYe04QvQEl/0r7RJo69eWfWzo3N/ajVqY3696kQxIeXATPeGin4+tv3Xg==
X-Received: by 2002:a05:600c:4fd2:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-43158760531mr41312865e9.16.1729245702212;
        Fri, 18 Oct 2024 03:01:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b6b8:7e19:2b4e:cb76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5e9sm1491533f8f.76.2024.10.18.03.01.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] lttng: Upgrade 2.13.14 -> 2.13.15
Date: Fri, 18 Oct 2024 11:01:37 +0100
Message-ID: <20241018100138.2341819-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
References: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206050

Drop backported patches now not needed in the new version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...01-Fix-kfree_skb-changed-in-6.11-rc1.patch |  62 ------
 ...da_reserve_space-changed-in-6.11-rc1.patch |  55 -----
 ...emoved-from-btrfs_get_extent-in-6.11.patch |  64 ------
 ...moved-frmo-btrfs_get_extent-in-6.11-.patch |  44 ----
 ...removed-from-btrfs_get_extent-in-6.1.patch |  50 -----
 ...omic-write-support-added-in-6.11-rc1.patch | 200 ------------------
 ...es_2.13.14.bb => lttng-modules_2.13.15.bb} |   8 +-
 7 files changed, 1 insertion(+), 482 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.14.bb => lttng-modules_2.13.15.bb} (72%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
deleted file mode 100644
index 36bf697c516..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From a06c63b0360cbe1a7c8073461b9cf088234875f7 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 29 Jul 2024 14:01:18 +0000
-Subject: [PATCH] Fix: kfree_skb changed in 6.11-rc1
-
-See upstream commit:
-
-    commit c53795d48ee8f385c6a9e394651e7ee914baaeba
-    Author: Yan Zhai <yan@cloudflare.com>
-    Date:   Mon Jun 17 11:09:04 2024 -0700
-
-        net: add rx_sk to trace_kfree_skb
-
-        skb does not include enough information to find out receiving
-        sockets/services and netns/containers on packet drops. In theory
-        skb->dev tells about netns, but it can get cleared/reused, e.g. by TCP
-        stack for OOO packet lookup. Similarly, skb->sk often identifies a local
-        sender, and tells nothing about a receiver.
-
-        Allow passing an extra receiving socket to the tracepoint to improve
-        the visibility on receiving drops.
-
-Upstream-Status: Backport
-
-Change-Id: I33c8ce1a48006456f198ab1592f733b55be01016
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/skb.h | 20 +++++++++++++++++++-
- 1 file changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index 9f1047c..5556ab6 100644
---- a/include/instrumentation/events/skb.h
-+++ b/include/instrumentation/events/skb.h
-@@ -40,7 +40,25 @@ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
-+
-+	skb_kfree,
-+
-+	TP_PROTO(struct sk_buff *skb, void *location,
-+		enum skb_drop_reason reason, struct sock *rx_sk),
-+
-+	TP_ARGS(skb, location, reason, rx_sk),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, skbaddr, skb)
-+		ctf_integer_hex(void *, location, location)
-+		ctf_integer_network(unsigned short, protocol, skb->protocol)
-+		ctf_enum(skb_drop_reason, uint8_t, reason, reason)
-+		ctf_integer_hex(void *, rx_skaddr, rx_sk)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
- 	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0) \
- 	|| LTTNG_RHEL_KERNEL_RANGE(5,14,0,70,0,0, 5,15,0,0,0,0) \
- 	|| LTTNG_RHEL_KERNEL_RANGE(4,18,0,477,10,1, 4,19,0,0,0,0))
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
deleted file mode 100644
index e62717baeb4..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From bfb177d2745d19cb56a27c438f4925d6397fbf0b Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 29 Jul 2024 14:08:32 +0000
-Subject: [PATCH] Fix: ext4_da_reserve_space changed in 6.11-rc1
-
-See upstream commit:
-
-    commit 0d66b23d79c750276f791411d81a524549a64852
-    Author: Zhang Yi <yi.zhang@huawei.com>
-    Date:   Fri May 17 20:40:02 2024 +0800
-
-        ext4: make ext4_da_reserve_space() reserve multi-clusters
-
-        Add 'nr_resv' parameter to ext4_da_reserve_space(), which indicates the
-        number of clusters wants to reserve, make it reserve multiple clusters
-        at a time.
-
-Upstream-Status: Backport
-
-Change-Id: Ib1ce8c3023d53a6d22ec444a435fdb3c871f64c5
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/ext4.h | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index 4131803..9f1d4b1 100644
---- a/include/instrumentation/events/ext4.h
-+++ b/include/instrumentation/events/ext4.h
-@@ -821,7 +821,23 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
-+LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
-+	TP_PROTO(struct inode *inode, int nr_resv),
-+
-+	TP_ARGS(inode, nr_resv),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(__u64, i_blocks, inode->i_blocks)
-+		ctf_integer(__u64, nr_resv, nr_resv)
-+		ctf_integer(int, reserved_data_blocks,
-+				EXT4_I(inode)->i_reserved_data_blocks)
-+		ctf_integer(TP_MODE_T, mode, inode->i_mode)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,13,0))
- LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
- 	TP_PROTO(struct inode *inode),
- 
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
deleted file mode 100644
index 4d06ec76e78..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 1e4cc8d271117af9262e28a5dd19790a0917818c Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 29 Jul 2024 14:11:36 +0000
-Subject: [PATCH] Fix: orig_start removed from btrfs_get_extent in 6.11-rc1
-
-See upstream commit:
-
-    commit 4aa7b5d1784f510c0f42afc1d74efb41947221d7
-    Author: Qu Wenruo <wqu@suse.com>
-    Date:   Tue Apr 30 07:53:04 2024 +0930
-
-        btrfs: remove extent_map::orig_start member
-
-        Since we have extent_map::offset, the old extent_map::orig_start is just
-        extent_map::start - extent_map::offset for non-hole/inline extents.
-
-        And since the new extent_map::offset is already verified by
-        validate_extent_map() while the old orig_start is not, let's just remove
-        the old member from all call sites.
-
-Upstream-Status: Backport
-
-Change-Id: I025a30d49b3e3ddc37d7846acc191ebbdf2ff19e
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 24 +++++++++++++++++++++++-
- 1 file changed, 23 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index c0c746e..dfad19c 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -177,7 +177,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
-+
-+LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
-+
-+	TP_PROTO(const struct btrfs_root *root, const struct btrfs_inode *inode,
-+		const struct extent_map *map),
-+
-+	TP_ARGS(root, inode, map),
-+
-+	TP_FIELDS(
-+		ctf_integer(u64, root_objectid, root->root_key.objectid)
-+		ctf_integer(u64, ino, btrfs_ino(inode))
-+		ctf_integer(u64, start, map->start)
-+		ctf_integer(u64, len, map->len)
-+		ctf_integer(u64, block_start, map->block_start)
-+		ctf_integer(u64, block_len, map->block_len)
-+		ctf_integer(unsigned int, flags, map->flags)
-+		ctf_integer(int, refs, refcount_read(&map->refs))
-+		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
-+	)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
- 
- LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
- 
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
deleted file mode 100644
index c9f48e2f2b2..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 974125ab11a7f0b4df5658cdac26dc5cf9fdbc87 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 29 Jul 2024 14:12:47 +0000
-Subject: [PATCH] Fix: block_len removed frmo btrfs_get_extent in 6.11-rc1
-
-See upstream commit:
-
-    commit e28b851ed9b232c3b84cb8d0fedbdfa8ca881386
-    Author: Qu Wenruo <wqu@suse.com>
-    Date:   Tue Apr 30 07:53:05 2024 +0930
-
-        btrfs: remove extent_map::block_len member
-
-        The extent_map::block_len is either extent_map::len (non-compressed
-        extent) or extent_map::disk_num_bytes (compressed extent).
-
-        Since we already have sanity checks to do the cross-checks between the
-        new and old members, we can drop the old extent_map::block_len now.
-
-        For most call sites, they can manually select extent_map::len or
-        extent_map::disk_num_bytes, since most if not all of them have checked
-        if the extent is compressed.
-
-Upstream-Status: Backport
-
-Change-Id: Ib03fc685b4e876bf4e53afdd28ca9826342a0e4e
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index dfad19c..28320d8 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -192,7 +192,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
- 		ctf_integer(u64, start, map->start)
- 		ctf_integer(u64, len, map->len)
- 		ctf_integer(u64, block_start, map->block_start)
--		ctf_integer(u64, block_len, map->block_len)
- 		ctf_integer(unsigned int, flags, map->flags)
- 		ctf_integer(int, refs, refcount_read(&map->refs))
- 		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
deleted file mode 100644
index 86c72cc6502..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From b845e79532c9c28c0108bf556171093236460251 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 29 Jul 2024 14:14:24 +0000
-Subject: [PATCH] Fix: block_start removed from btrfs_get_extent in 6.11-rc1
-
-See upstream commit:
-
-    commit c77a8c61002e91d859e118008fd495efbe1d9373
-    Author: Qu Wenruo <wqu@suse.com>
-    Date:   Tue Apr 30 07:53:06 2024 +0930
-
-        btrfs: remove extent_map::block_start member
-
-        The member extent_map::block_start can be calculated from
-        extent_map::disk_bytenr + extent_map::offset for regular extents.
-        And otherwise just extent_map::disk_bytenr.
-
-        And this is already validated by the validate_extent_map().  Now we can
-        remove the member.
-
-        However there is a special case in btrfs_create_dio_extent() where we
-        for NOCOW/PREALLOC ordered extents cannot directly use the resulting
-        btrfs_file_extent, as btrfs_split_ordered_extent() cannot handle them
-        yet.
-
-        So for that call site, we pass file_extent->disk_bytenr +
-        file_extent->num_bytes as disk_bytenr for the ordered extent, and 0 for
-        offset.
-
-Upstream-Status: Backport
-
-Change-Id: I2e3245bb0d1f5263e902659aa05848d5e231909b
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 28320d8..8fb6866 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -191,7 +191,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
- 		ctf_integer(u64, ino, btrfs_ino(inode))
- 		ctf_integer(u64, start, map->start)
- 		ctf_integer(u64, len, map->len)
--		ctf_integer(u64, block_start, map->block_start)
- 		ctf_integer(unsigned int, flags, map->flags)
- 		ctf_integer(int, refs, refcount_read(&map->refs))
- 		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
deleted file mode 100644
index 2745e6444aa..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From d0797fe4bce357d419d2f1f8a3cfe2f8e71ebfdb Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 29 Jul 2024 14:23:02 +0000
-Subject: [PATCH] Fix: scsi: sd: Atomic write support added in 6.11-rc1
-
-See upstream commit:
-
-    commit bf4ae8f2e6407a779c0368eb0f3e047a8333be17
-    Author: John Garry <john.g.garry@oracle.com>
-    Date:   Thu Jun 20 12:53:57 2024 +0000
-
-        scsi: sd: Atomic write support
-
-        Support is divided into two main areas:
-        - reading VPD pages and setting sdev request_queue limits
-        - support WRITE ATOMIC (16) command and tracing
-
-        The relevant block limits VPD page need to be read to allow the block layer
-        request_queue atomic write limits to be set. These VPD page limits are
-        described in sbc4r22 section 6.6.4 - Block limits VPD page.
-
-        There are five limits of interest:
-        - MAXIMUM ATOMIC TRANSFER LENGTH
-        - ATOMIC ALIGNMENT
-        - ATOMIC TRANSFER LENGTH GRANULARITY
-        - MAXIMUM ATOMIC TRANSFER LENGTH WITH BOUNDARY
-        - MAXIMUM ATOMIC BOUNDARY SIZE
-
-        MAXIMUM ATOMIC TRANSFER LENGTH is the maximum length for a WRITE ATOMIC
-        (16) command. It will not be greater than the device MAXIMUM TRANSFER
-        LENGTH.
-
-        ATOMIC ALIGNMENT and ATOMIC TRANSFER LENGTH GRANULARITY are the minimum
-        alignment and length values for an atomic write in terms of logical blocks.
-
-        Unlike NVMe, SCSI does not specify an LBA space boundary, but does specify
-        a per-IO boundary granularity. The maximum boundary size is specified in
-        MAXIMUM ATOMIC BOUNDARY SIZE. When used, this boundary value is set in the
-        WRITE ATOMIC (16) ATOMIC BOUNDARY field - layout for the WRITE_ATOMIC_16
-        command can be found in sbc4r22 section 5.48. This boundary value is the
-        granularity size at which the device may atomically write the data. A value
-        of zero in WRITE ATOMIC (16) ATOMIC BOUNDARY field means that all data must
-        be atomically written together.
-
-        MAXIMUM ATOMIC TRANSFER LENGTH WITH BOUNDARY is the maximum atomic write
-        length if a non-zero boundary value is set.
-
-        For atomic write support, the WRITE ATOMIC (16) boundary is not of much
-        interest, as the block layer expects each request submitted to be executed
-        be atomically written together.
-
-        MAXIMUM ATOMIC TRANSFER LENGTH WITH BOUNDARY is the maximum atomic write
-        length if a non-zero boundary value is set.
-
-        For atomic write support, the WRITE ATOMIC (16) boundary is not of much
-        interest, as the block layer expects each request submitted to be executed
-        atomically. However, the SCSI spec does leave itself open to a quirky
-        scenario where MAXIMUM ATOMIC TRANSFER LENGTH is zero, yet MAXIMUM ATOMIC
-        TRANSFER LENGTH WITH BOUNDARY and MAXIMUM ATOMIC BOUNDARY SIZE are both
-        non-zero. This case will be supported.
-
-        To set the block layer request_queue atomic write capabilities, sanitize
-        the VPD page limits and set limits as follows:
-        - atomic_write_unit_min is derived from granularity and alignment values.
-          If no granularity value is not set, use physical block size
-        - atomic_write_unit_max is derived from MAXIMUM ATOMIC TRANSFER LENGTH. In
-          the scenario where MAXIMUM ATOMIC TRANSFER LENGTH is zero and boundary
-          limits are non-zero, use MAXIMUM ATOMIC BOUNDARY SIZE for
-          atomic_write_unit_max. New flag scsi_disk.use_atomic_write_boundary is
-          set for this scenario.
-        - atomic_write_boundary_bytes is set to zero always
-
-        SCSI also supports a WRITE ATOMIC (32) command, which is for type 2
-        protection enabled. This is not going to be supported now, so check for
-        T10_PI_TYPE2_PROTECTION when setting any request_queue limits.
-
-        To handle an atomic write request, add support for WRITE ATOMIC (16)
-        command in handler sd_setup_atomic_cmnd(). Flag use_atomic_write_boundary
-        is checked here for encoding ATOMIC BOUNDARY field.
-
-        Trace info is also added for WRITE_ATOMIC_16 command.
-
-Upstream-Status: Backport
-
-Change-Id: Ie072002fe2184615c72531ac081a324ef18cfb03
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/scsi.h | 98 ++++++++++++++++++++++++++-
- 1 file changed, 97 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/scsi.h b/include/instrumentation/events/scsi.h
-index 52c0ebd..54ba3ee 100644
---- a/include/instrumentation/events/scsi.h
-+++ b/include/instrumentation/events/scsi.h
-@@ -16,7 +16,103 @@
- 
- #define scsi_opcode_name(opcode)	{ opcode, #opcode }
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,7,0) \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0))
-+
-+#define show_opcode_name(val)					\
-+	__print_symbolic(val,					\
-+		scsi_opcode_name(TEST_UNIT_READY),		\
-+		scsi_opcode_name(REZERO_UNIT),			\
-+		scsi_opcode_name(REQUEST_SENSE),		\
-+		scsi_opcode_name(FORMAT_UNIT),			\
-+		scsi_opcode_name(READ_BLOCK_LIMITS),		\
-+		scsi_opcode_name(REASSIGN_BLOCKS),		\
-+		scsi_opcode_name(INITIALIZE_ELEMENT_STATUS),	\
-+		scsi_opcode_name(READ_6),			\
-+		scsi_opcode_name(WRITE_6),			\
-+		scsi_opcode_name(SEEK_6),			\
-+		scsi_opcode_name(READ_REVERSE),			\
-+		scsi_opcode_name(WRITE_FILEMARKS),		\
-+		scsi_opcode_name(SPACE),			\
-+		scsi_opcode_name(INQUIRY),			\
-+		scsi_opcode_name(RECOVER_BUFFERED_DATA),	\
-+		scsi_opcode_name(MODE_SELECT),			\
-+		scsi_opcode_name(RESERVE),			\
-+		scsi_opcode_name(RELEASE),			\
-+		scsi_opcode_name(COPY),				\
-+		scsi_opcode_name(ERASE),			\
-+		scsi_opcode_name(MODE_SENSE),			\
-+		scsi_opcode_name(START_STOP),			\
-+		scsi_opcode_name(RECEIVE_DIAGNOSTIC),		\
-+		scsi_opcode_name(SEND_DIAGNOSTIC),		\
-+		scsi_opcode_name(ALLOW_MEDIUM_REMOVAL),		\
-+		scsi_opcode_name(SET_WINDOW),			\
-+		scsi_opcode_name(READ_CAPACITY),		\
-+		scsi_opcode_name(READ_10),			\
-+		scsi_opcode_name(WRITE_10),			\
-+		scsi_opcode_name(SEEK_10),			\
-+		scsi_opcode_name(POSITION_TO_ELEMENT),		\
-+		scsi_opcode_name(WRITE_VERIFY),			\
-+		scsi_opcode_name(VERIFY),			\
-+		scsi_opcode_name(SEARCH_HIGH),			\
-+		scsi_opcode_name(SEARCH_EQUAL),			\
-+		scsi_opcode_name(SEARCH_LOW),			\
-+		scsi_opcode_name(SET_LIMITS),			\
-+		scsi_opcode_name(PRE_FETCH),			\
-+		scsi_opcode_name(READ_POSITION),		\
-+		scsi_opcode_name(SYNCHRONIZE_CACHE),		\
-+		scsi_opcode_name(LOCK_UNLOCK_CACHE),		\
-+		scsi_opcode_name(READ_DEFECT_DATA),		\
-+		scsi_opcode_name(MEDIUM_SCAN),			\
-+		scsi_opcode_name(COMPARE),			\
-+		scsi_opcode_name(COPY_VERIFY),			\
-+		scsi_opcode_name(WRITE_BUFFER),			\
-+		scsi_opcode_name(READ_BUFFER),			\
-+		scsi_opcode_name(UPDATE_BLOCK),			\
-+		scsi_opcode_name(READ_LONG),			\
-+		scsi_opcode_name(WRITE_LONG),			\
-+		scsi_opcode_name(CHANGE_DEFINITION),		\
-+		scsi_opcode_name(WRITE_SAME),			\
-+		scsi_opcode_name(UNMAP),			\
-+		scsi_opcode_name(READ_TOC),			\
-+		scsi_opcode_name(LOG_SELECT),			\
-+		scsi_opcode_name(LOG_SENSE),			\
-+		scsi_opcode_name(XDWRITEREAD_10),		\
-+		scsi_opcode_name(MODE_SELECT_10),		\
-+		scsi_opcode_name(RESERVE_10),			\
-+		scsi_opcode_name(RELEASE_10),			\
-+		scsi_opcode_name(MODE_SENSE_10),		\
-+		scsi_opcode_name(PERSISTENT_RESERVE_IN),	\
-+		scsi_opcode_name(PERSISTENT_RESERVE_OUT),	\
-+		scsi_opcode_name(VARIABLE_LENGTH_CMD),		\
-+		scsi_opcode_name(REPORT_LUNS),			\
-+		scsi_opcode_name(MAINTENANCE_IN),		\
-+		scsi_opcode_name(MAINTENANCE_OUT),		\
-+		scsi_opcode_name(MOVE_MEDIUM),			\
-+		scsi_opcode_name(EXCHANGE_MEDIUM),		\
-+		scsi_opcode_name(READ_12),			\
-+		scsi_opcode_name(WRITE_12),			\
-+		scsi_opcode_name(WRITE_VERIFY_12),		\
-+		scsi_opcode_name(SEARCH_HIGH_12),		\
-+		scsi_opcode_name(SEARCH_EQUAL_12),		\
-+		scsi_opcode_name(SEARCH_LOW_12),		\
-+		scsi_opcode_name(READ_ELEMENT_STATUS),		\
-+		scsi_opcode_name(SEND_VOLUME_TAG),		\
-+		scsi_opcode_name(WRITE_LONG_2),			\
-+		scsi_opcode_name(READ_16),			\
-+		scsi_opcode_name(WRITE_16),			\
-+		scsi_opcode_name(VERIFY_16),			\
-+		scsi_opcode_name(WRITE_SAME_16),		\
-+		scsi_opcode_name(ZBC_OUT),			\
-+		scsi_opcode_name(ZBC_IN),			\
-+		scsi_opcode_name(SERVICE_ACTION_IN_16),		\
-+		scsi_opcode_name(READ_32),			\
-+		scsi_opcode_name(WRITE_32),			\
-+		scsi_opcode_name(WRITE_SAME_32),		\
-+		scsi_opcode_name(ATA_16),			\
-+		scsi_opcode_name(WRITE_ATOMIC_16),		\
-+		scsi_opcode_name(ATA_12))
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,7,0)  \
- 	|| LTTNG_SLE_KERNEL_RANGE(4,4,9,36,0,0, 4,5,0,0,0,0))
- 
- #define show_opcode_name(val)					\
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
similarity index 72%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
index 5b1e61f3be1..66b3729ce52 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
@@ -10,18 +10,12 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Fix-kfree_skb-changed-in-6.11-rc1.patch \
-           file://0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch \
-           file://0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch \
-           file://0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch \
-           file://0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch \
-           file://0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
+SRC_URI[sha256sum] = "6692554eca50e9d22e71b7c2ee6c7db89d393268d404261212af37c5247c0729"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 

