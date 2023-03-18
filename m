Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C68EC74A5B
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 15:32:15 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.8601.1679153526947113237
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 08:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YABPsm7U;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id h19so8728424qtn.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679153526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8lyMPEHpnPezLYxah9LHVdGaDos9MOHa3pmlxspuQY=;
        b=YABPsm7U7OETitBF2GD47cg0lW+TYvqIISGV+L6RqqNALEOOk1ScfURjeVvDeWohuH
         wvicWYx2V96DG5AEBQAY/acF8tXBd4cVgNS5DllUjomXQo3ZHHq3IBaOKtgTptoWIVUF
         29gPsVrPHlyRfesL4RJRK0YI56DGd55oroToQavtcpzrDlE0RriaRO3VDHyC7WYdSwKz
         QuRQhULx7bGlv/fHjN8LiEGrq0UMg9pdMhCOqu+lKjcMJt45qgy9oRJCTsj8rz8lxv1k
         dG2wqXyffyN1l5XV9aPkx0KEbSJlcG+kvkH3I5bvFpXNeRAPEJRaY2DtDX2OWj8DP2nn
         NJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679153526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8lyMPEHpnPezLYxah9LHVdGaDos9MOHa3pmlxspuQY=;
        b=zypej0fo8MRW+NtaLhpsz6YNGp72pLh3jtX7HO0V+YNabONjgGy6ocOBku9xUyvm0a
         cq7fWj2uq5m7lgrbtEYYfJViwCJPfdpdVOvfMI6HA1O6W0VarzhA5I0IvEjWcRsGNp6Z
         pmQh4cfJgpJYNM3HQYZJZlnXPp6Xe1BEeJF83MQdD1fr8JLC7TQAEdbVAw/uTTnWY2Yq
         HHNDHTkl/mbV5TiToNsFSV4hC7UKN9xXlHDurE2p7+gFXr7HQZlmzU7eGHQerawhYtYs
         VbiA7fzMTo+uRoyCBHJGayBFuruz6f1x/uOSNWWFWolxiXiexViMPVpHDtX/ekWyosIo
         cTEw==
X-Gm-Message-State: AO0yUKU0768meXGJLQ6OgHHOtWCcFiTDQLt2t2F8etBGEYxsbE/x+NkU
	WSyNLZ+PgAGw2U2jDAQDc4oeR/o3Sf4Weg==
X-Google-Smtp-Source: AK7set8GhUTOqu7wGhFEHJO1tKyUXtMFIeJPPMsRje51LRbnRDxyNZrDGFGgZo7g3lDox0uz9h14SA==
X-Received: by 2002:a05:622a:19a6:b0:3bf:ab9d:d322 with SMTP id u38-20020a05622a19a600b003bfab9dd322mr11388459qtc.10.1679153525937;
        Sat, 18 Mar 2023 08:32:05 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z12-20020ac875cc000000b003d2298d847bsm3108714qtq.67.2023.03.18.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 08:32:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-modules: fix for v6.3+ kernels
Date: Sat, 18 Mar 2023 11:32:02 -0400
Message-Id: <20230318153202.1697998-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230318153202.1697998-1-bruce.ashfield@gmail.com>
References: <20230318153202.1697998-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 15:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178790

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As part of updating linux-yocto-dev to v6.3, lttng-modules needs to
have four backported patches to adjust for the new kernel version.

These are safe for inclusion in the upcoming release, as they are
version protected and provide some future proofing for folks trying
to use newer kernels than our released 6.1.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-vma-vm_flags-wrapper-functions-v6.3.patch |  82 +++++++++++++
 ...e-guid_t-and-uuid_le-types-and-respe.patch |  60 +++++++++
 ...ind_free_extent_ctl-to-allocator-tra.patch | 116 ++++++++++++++++++
 ...d-location-to-trace_consume_skb-v6.3.patch |  62 ++++++++++
 .../lttng/lttng-modules_2.13.9.bb             |   4 +
 5 files changed, 324 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
new file mode 100644
index 0000000000..976eecc3ab
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch
@@ -0,0 +1,82 @@
+From 939200ef160c95c8a9d71fd80c99f42a1de0a9f0 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 7 Mar 2023 11:41:14 -0500
+Subject: [PATCH 1/4] fix: mm: introduce vma->vm_flags wrapper functions (v6.3)
+
+See upstream commit :
+
+  commit bc292ab00f6c7a661a8a605c714e8a148f629ef6
+  Author: Suren Baghdasaryan <surenb@google.com>
+  Date:   Thu Jan 26 11:37:47 2023 -0800
+
+    mm: introduce vma->vm_flags wrapper functions
+
+    vm_flags are among VMA attributes which affect decisions like VMA merging
+    and splitting.  Therefore all vm_flags modifications are performed after
+    taking exclusive mmap_lock to prevent vm_flags updates racing with such
+    operations.  Introduce modifier functions for vm_flags to be used whenever
+    flags are updated.  This way we can better check and control correct
+    locking behavior during these updates.
+
+Upstream-Status: Backport
+
+Change-Id: I2cf662420d9d7748e5e310d3ea4bac98ba7d7f94
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/mm.h                  | 16 ++++++++++++++++
+ src/lib/ringbuffer/ring_buffer_mmap.c |  4 +++-
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/include/wrapper/mm.h b/include/wrapper/mm.h
+index d3bdda66..61ac8127 100644
+--- a/include/wrapper/mm.h
++++ b/include/wrapper/mm.h
+@@ -13,6 +13,22 @@
+ 
+ #include <lttng/kernel-version.h>
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
++static inline
++void wrapper_vm_flags_set(struct vm_area_struct *vma,
++		vm_flags_t flags)
++{
++	vm_flags_set(vma, flags);
++}
++#else
++static inline
++void wrapper_vm_flags_set(struct vm_area_struct *vma,
++		vm_flags_t flags)
++{
++	vma->vm_flags |= flags;
++}
++#endif
++
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,6,0) \
+ 		|| LTTNG_UBUNTU_KERNEL_RANGE(4,4,25,44, 4,5,0,0))
+ 
+diff --git a/src/lib/ringbuffer/ring_buffer_mmap.c b/src/lib/ringbuffer/ring_buffer_mmap.c
+index 25e2d8d5..d24b76a3 100644
+--- a/src/lib/ringbuffer/ring_buffer_mmap.c
++++ b/src/lib/ringbuffer/ring_buffer_mmap.c
+@@ -17,6 +17,8 @@
+ #include <ringbuffer/frontend.h>
+ #include <ringbuffer/vfs.h>
+ 
++#include <wrapper/mm.h>
++
+ /*
+  * fault() vm_op implementation for ring buffer file mapping.
+  */
+@@ -113,7 +115,7 @@ static int lib_ring_buffer_mmap_buf(struct lttng_kernel_ring_buffer *buf,
+ 		return -EINVAL;
+ 
+ 	vma->vm_ops = &lib_ring_buffer_mmap_ops;
+-	vma->vm_flags |= VM_DONTEXPAND;
++	wrapper_vm_flags_set(vma, VM_DONTEXPAND);
+ 	vma->vm_private_data = buf;
+ 
+ 	return 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
new file mode 100644
index 0000000000..00aa34ed9f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch
@@ -0,0 +1,60 @@
+From b3756eaa49a3de2f388bc269b2928a0233358fea Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 7 Mar 2023 12:05:00 -0500
+Subject: [PATCH 2/4] fix: uuid: Decouple guid_t and uuid_le types and
+ respective macros (v6.3)
+
+See upstream commit :
+
+  commit 5e6a51787fef20b849682d8c49ec9c2beed5c373
+  Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+  Date:   Tue Jan 24 15:38:38 2023 +0200
+
+    uuid: Decouple guid_t and uuid_le types and respective macros
+
+    The guid_t type and respective macros are being used internally only.
+    The uuid_le has its user outside the kernel. Decouple these types and
+    macros, and make guid_t completely internal type to the kernel.
+
+Upstream-Status: Backport
+
+Change-Id: I8644fd139b0630e9cf18886b84e33bffab1e5abd
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/lttng/events-internal.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/include/lttng/events-internal.h b/include/lttng/events-internal.h
+index e31e6abb..a91a659e 100644
+--- a/include/lttng/events-internal.h
++++ b/include/lttng/events-internal.h
+@@ -9,6 +9,7 @@
+ #define _LTTNG_EVENTS_INTERNAL_H
+ 
+ #include <wrapper/compiler_attributes.h>
++#include <wrapper/uuid.h>
+ 
+ #include <lttng/events.h>
+ 
+@@ -289,7 +290,7 @@ struct lttng_metadata_cache {
+ 	atomic_t producing;		/* Metadata being produced (incomplete) */
+ 	struct kref refcount;		/* Metadata cache usage */
+ 	struct list_head metadata_stream;	/* Metadata stream list */
+-	uuid_le uuid;			/* Trace session unique ID (copy) */
++	guid_t uuid;			/* Trace session unique ID (copy) */
+ 	struct mutex lock;		/* Produce/consume lock */
+ 	uint64_t version;		/* Current version of the metadata */
+ };
+@@ -463,7 +464,7 @@ struct lttng_kernel_session_private {
+ 	struct list_head events;		/* Event list head */
+ 	struct list_head list;			/* Session list */
+ 	unsigned int free_chan_id;		/* Next chan ID to allocate */
+-	uuid_le uuid;				/* Trace session unique ID */
++	guid_t uuid;				/* Trace session unique ID */
+ 	struct lttng_metadata_cache *metadata_cache;
+ 	unsigned int metadata_dumped:1,
+ 		tstate:1;			/* Transient enable state */
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
new file mode 100644
index 0000000000..8ecdccf609
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch
@@ -0,0 +1,116 @@
+From d0eeda3f84ba1643831561a2488ca2e99e9472b1 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 7 Mar 2023 11:26:25 -0500
+Subject: [PATCH 3/4] fix: btrfs: pass find_free_extent_ctl to allocator
+ tracepoints (v6.3)
+
+See upstream commit :
+
+  commit cfc2de0fce015d4249c674ef9f5e0b4817ba5c53
+  Author: Boris Burkov <boris@bur.io>
+  Date:   Thu Dec 15 16:06:31 2022 -0800
+
+    btrfs: pass find_free_extent_ctl to allocator tracepoints
+
+    The allocator tracepoints currently have a pile of values from ffe_ctl.
+    In modifying the allocator and adding more tracepoints, I found myself
+    adding to the already long argument list of the tracepoints. It makes it
+    a lot simpler to just send in the ffe_ctl itself.
+
+Upstream-Status: Backport
+
+Change-Id: Iab4132a9d3df3a6369591a50fb75374b1e399fa4
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 60 +++++++++++++++++++++++++-
+ 1 file changed, 58 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index 01157107..7c7b9b0c 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -13,6 +13,10 @@
+ #include <../fs/btrfs/accessors.h>
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
++#include <../fs/btrfs/extent-tree.h>
++#endif
++
+ #ifndef _TRACE_BTRFS_DEF_
+ #define _TRACE_BTRFS_DEF_
+ struct btrfs_root;
+@@ -1963,7 +1967,26 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserved_extent,  btrfs_reserved_extent_f
+ 
+ #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,10,0)) */
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
++LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
++
++	btrfs_find_free_extent,
++
++	TP_PROTO(const struct btrfs_root *root,
++		const struct find_free_extent_ctl *ffe_ctl),
++
++	TP_ARGS(root, ffe_ctl),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, root->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, num_bytes, ffe_ctl->num_bytes)
++		ctf_integer(u64, empty_size, ffe_ctl->empty_size)
++		ctf_integer(u64, flags, ffe_ctl->flags)
++	)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,10,0) || \
+ 	LTTNG_KERNEL_RANGE(5,9,5, 5,10,0) || \
+ 	LTTNG_KERNEL_RANGE(5,4,78, 5,5,0) || \
+ 	LTTNG_UBUNTU_KERNEL_RANGE(5,8,18,44, 5,9,0,0))
+@@ -2102,7 +2125,40 @@ LTTNG_TRACEPOINT_EVENT_MAP(find_free_extent,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,5,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
++
++	TP_PROTO(const struct btrfs_block_group *block_group,
++		const struct find_free_extent_ctl *ffe_ctl),
++
++	TP_ARGS(block_group, ffe_ctl),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, block_group->lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, bg_objectid, block_group->start)
++		ctf_integer(u64, flags, block_group->flags)
++		ctf_integer(u64, start, ffe_ctl->search_start)
++		ctf_integer(u64, len, ffe_ctl->num_bytes)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent,
++
++	TP_PROTO(const struct btrfs_block_group *block_group,
++		const struct find_free_extent_ctl *ffe_ctl),
++
++	TP_ARGS(block_group, ffe_ctl)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__reserve_extent, btrfs_reserve_extent_cluster,
++
++	TP_PROTO(const struct btrfs_block_group *block_group,
++		const struct find_free_extent_ctl *ffe_ctl),
++
++	TP_ARGS(block_group, ffe_ctl)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,5,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__reserve_extent,
+ 
+ 	TP_PROTO(const struct btrfs_block_group *block_group, u64 start,
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch
new file mode 100644
index 0000000000..59d96dc22d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch
@@ -0,0 +1,62 @@
+From 12f43cab7daceff0c73c78276b5a5b9cc1d5056f Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 7 Mar 2023 11:10:26 -0500
+Subject: [PATCH 4/4] fix: net: add location to trace_consume_skb() (v6.3)
+
+See upstream commit :
+
+  commit dd1b527831a3ed659afa01b672d8e1f7e6ca95a5
+  Author: Eric Dumazet <edumazet@google.com>
+  Date:   Thu Feb 16 15:47:18 2023 +0000
+
+    net: add location to trace_consume_skb()
+
+    kfree_skb() includes the location, it makes sense
+    to add it to consume_skb() as well.
+
+Upstream-Status: Backport
+
+Change-Id: I8d871187d90e7fe113a63e209b00aebe0df475f3
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/skb.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
+index 186732ea..3c43f32d 100644
+--- a/include/instrumentation/events/skb.h
++++ b/include/instrumentation/events/skb.h
+@@ -61,6 +61,21 @@ LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,3,0))
++LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
++
++	skb_consume,
++
++	TP_PROTO(struct sk_buff *skb, void *location),
++
++	TP_ARGS(skb, location),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, skbaddr, skb)
++		ctf_integer_hex(void *, location, location)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
+ 
+ 	skb_consume,
+@@ -73,6 +88,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(consume_skb,
+ 		ctf_integer_hex(void *, skbaddr, skb)
+ 	)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT(skb_copy_datagram_iovec,
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
index a08386b053..5197bf578f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
@@ -11,6 +11,10 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0001-fix-mm-introduce-vma-vm_flags-wrapper-functions-v6.3.patch \
+           file://0002-fix-uuid-Decouple-guid_t-and-uuid_le-types-and-respe.patch \
+           file://0003-fix-btrfs-pass-find_free_extent_ctl-to-allocator-tra.patch \
+           file://0004-fix-net-add-location-to-trace_consume_skb-v6.3.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.34.1


