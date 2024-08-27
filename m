Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C91DC5473D
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.71664.1724736242303071915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYJnF4x6;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86e5e9ff05so53029766b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736241; x=1725341041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMQT4Jp6lp0nGwJEjW1cfIep9YwMAhR3qW49FT2OqoU=;
        b=dYJnF4x6azOf/3AtWIq6B+ssFrfq3K5RuXI5Bz26bpINifc8I7bLEnzA8heODnIVPC
         oCNcBep5YJ/Z0Vu7+u8392tTSogktn1XyIRbUEEyNRpSlR/wQy+/dPURuMmuJoS8LA0z
         gyO8HoQmPo0z2gsT4KTnGdu7ZmGt7RgkaxWLjvCNXahVa805xavl4wAwSY34HQNrFuqh
         xmfA+BiZFQwTyERdP02e1N87GVAFvR9CiQwb+B96nbmGSsvtg3Iakvtm23HhWBWuAJu8
         e4JEXs+/HtfTezI25H0rS01A21KZ7VJ4m9wjh0sTdaThQJ7aeYcydm58T9jmGZMhk6eD
         D/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736241; x=1725341041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMQT4Jp6lp0nGwJEjW1cfIep9YwMAhR3qW49FT2OqoU=;
        b=xF/ZbHMAsVe8BLw98Bq7i4ag5pdOOTBHpZI29T8xGUq4MkzH2+fO1ETU2BMwYWVBB8
         kpUzUyyLOZenOG+fPXSu8i7sCSeWEjXouj4PI8USd9CfvrS2MwzU0opUDL6JIb2rj5Th
         Dy3Z1y1DMeZ57xOPgfVrrtxS+xbIuSWNHzoGump5vpjZEqQ5ZHqEToJ0XgWDqrj1/lGq
         dTFgbjXlhyIGN0PXntyQlxxUcQLwwMVcqhq+3fcTfTIJV1wq4oaMwpTKuUUusAwmjQsh
         l0wJjE40Z54Pt6rr9zmbyLfh0BK96o7E56Or5+ifgVuC3nY0ATUBEklbuIyJkfc2kKfo
         oYvg==
X-Gm-Message-State: AOJu0YxgeEtF3FJA2mqiGX+32uP7/24lTCH0XjWi04vZ4m40xVEjGazR
	MRJVudbh63o9PuJJDaEFrl8i9OBE4bAMTCVCar+EBShBWsI60NIQMsGb5w==
X-Google-Smtp-Source: AGHT+IE28OEx6KDXmZthyno61yvQeyiUNMVQ5Eh4VvybG/X6S81dflPiY2ktUaabORH9ZJhgugR2TA==
X-Received: by 2002:a17:906:f5a9:b0:a7a:97ca:3058 with SMTP id a640c23a62f3a-a86e397e68cmr129357766b.5.1724736240266;
        Mon, 26 Aug 2024 22:24:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:23:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/34] lttng-modules: update 2.13.13 -> 2.13.14
Date: Tue, 27 Aug 2024 07:23:25 +0200
Message-Id: <20240827052354.1319810-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203781

From: Alexander Kanavin <alex@linutronix.de>

Remove backports.

License-update: changed file paths.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Fix-kfree_skb-changed-in-6.11-rc1.patch |  11 +-
 ...mplify-delayed-ref-tracepoints-v6.10.patch | 142 ------------------
 ...c-pass-files_struct-instead-of-fdtab.patch |  79 ----------
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch |  12 +-
 ...da_reserve_space-changed-in-6.11-rc1.patch |  11 +-
 ...arent-and-ref_root-into-btrfs_delaye.patch |  58 -------
 ...emoved-from-btrfs_get_extent-in-6.11.patch |  11 +-
 ...IP-port-data-to-the-tracepoint-udp-u.patch |  79 ----------
 ...moved-frmo-btrfs_get_extent-in-6.11-.patch |  11 +-
 ...removed-from-btrfs_get_extent-in-6.1.patch |  12 +-
 ...omic-write-support-added-in-6.11-rc1.patch |  11 +-
 ...es_2.13.13.bb => lttng-modules_2.13.14.bb} |  10 +-
 12 files changed, 33 insertions(+), 414 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.13.bb => lttng-modules_2.13.14.bb} (78%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
index 83b753994ef..36bf697c516 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-kfree_skb-changed-in-6.11-rc1.patch
@@ -1,7 +1,7 @@
-From 9706d0431c9cc4178db4cf630fee6f5f85f2543e Mon Sep 17 00:00:00 2001
+From a06c63b0360cbe1a7c8073461b9cf088234875f7 Mon Sep 17 00:00:00 2001
 From: Kienan Stewart <kstewart@efficios.com>
 Date: Mon, 29 Jul 2024 14:01:18 +0000
-Subject: [PATCH 1/6] Fix: kfree_skb changed in 6.11-rc1
+Subject: [PATCH] Fix: kfree_skb changed in 6.11-rc1
 
 See upstream commit:
 
@@ -30,10 +30,10 @@ Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  1 file changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index edfda7ff..0b5a95dc 100644
+index 9f1047c..5556ab6 100644
 --- a/include/instrumentation/events/skb.h
 +++ b/include/instrumentation/events/skb.h
-@@ -43,7 +43,25 @@ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
+@@ -40,7 +40,25 @@ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
  )
  #endif
  
@@ -60,6 +60,3 @@ index edfda7ff..0b5a95dc 100644
  	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0) \
  	|| LTTNG_RHEL_KERNEL_RANGE(5,14,0,70,0,0, 5,15,0,0,0,0) \
  	|| LTTNG_RHEL_KERNEL_RANGE(4,18,0,477,10,1, 4,19,0,0,0,0))
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch
deleted file mode 100644
index c1e11f2bfb6..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From db0f940136afd43ce5fcf87c4d4e9ca558db1d4f Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 27 May 2024 13:04:42 -0400
-Subject: [PATCH 1/3] fix: btrfs: simplify delayed ref tracepoints (v6.10)
-
-See upstream commit:
-
-  commit 1bff6d4f873790cfc675afce9860208576508c5a
-  Author: Josef Bacik <josef@toxicpanda.com>
-  Date:   Fri Apr 12 20:27:00 2024 -0400
-
-    btrfs: simplify delayed ref tracepoints
-
-    Now that all of the delayed ref information is in the delayed ref node,
-    drastically simplify the delayed ref tracepoints by simply passing in
-    the btrfs_delayed_ref_node and populating the tracepoints with the
-    values from the structure itself.
-
-Upstream-Status: Backport [commit db0f9401 fix: btrfs: simplify delayed ref tracepoints (v6.10)]
-
-Change-Id: Ic90bc23d6aa558baec33adc33b4d21e052e83375
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 94 +++++++++++++++++++++++++-
- 1 file changed, 92 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index ffb1b646..d73c1ce5 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -899,7 +899,51 @@ LTTNG_TRACEPOINT_EVENT(btrfs_add_block_group,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_tree_ref,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info,
-+		 const struct btrfs_delayed_ref_node *ref),
-+
-+	TP_ARGS(fs_info, ref),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, bytenr, ref->bytenr)
-+		ctf_integer(u64, num_bytes, ref->num_bytes)
-+		ctf_integer(int, action, ref->action)
-+		ctf_integer(u64, parent, ref->tree_ref.parent)
-+		ctf_integer(u64, ref_root, ref->tree_ref.root)
-+		ctf_integer(int, level, ref->tree_ref.level)
-+		ctf_integer(int, type, ref->type)
-+		ctf_integer(u64, seq, ref->seq)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_tree_ref,
-+
-+	add_delayed_tree_ref,
-+
-+	btrfs_add_delayed_tree_ref,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info,
-+		 const struct btrfs_delayed_ref_node *ref),
-+
-+	TP_ARGS(fs_info, ref)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_tree_ref,
-+
-+	run_delayed_tree_ref,
-+
-+	btrfs_run_delayed_tree_ref,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info,
-+		 const struct btrfs_delayed_ref_node *ref),
-+
-+	TP_ARGS(fs_info, ref)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
-@@ -1139,7 +1183,53 @@ LTTNG_TRACEPOINT_EVENT(btrfs_delayed_tree_ref,
- )
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_data_ref,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info,
-+		 const struct btrfs_delayed_ref_node *ref),
-+
-+	TP_ARGS(fs_info, ref),
-+
-+	TP_FIELDS(
-+		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
-+		ctf_integer(u64, bytenr, ref->bytenr)
-+		ctf_integer(u64, num_bytes, ref->num_bytes)
-+		ctf_integer(int, action, ref->action)
-+		ctf_integer(u64, parent, ref->data_ref.parent)
-+		ctf_integer(u64, ref_root, ref->data_ref.root)
-+		ctf_integer(u64, owner, ref->data_ref.objectid)
-+		ctf_integer(u64, offset, ref->data_ref.offset)
-+		ctf_integer(int, type, ref->type)
-+		ctf_integer(u64, seq, ref->seq)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_data_ref,
-+
-+	add_delayed_data_ref,
-+
-+	btrfs_add_delayed_data_ref,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info,
-+		 const struct btrfs_delayed_ref_node *ref),
-+
-+	TP_ARGS(fs_info, ref)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_data_ref,
-+
-+	run_delayed_data_ref,
-+
-+	btrfs_run_delayed_data_ref,
-+
-+	TP_PROTO(const struct btrfs_fs_info *fs_info,
-+		 const struct btrfs_delayed_ref_node *ref),
-+
-+	TP_ARGS(fs_info, ref)
-+)
-+
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
- 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch
deleted file mode 100644
index bb659d5563a..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c8adc20d19d853527a29411a03e114efdeff5f59 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 27 May 2024 10:49:45 -0400
-Subject: [PATCH] fix: close_on_exec(): pass files_struct instead of fdtable
- (v6.10)
-
-See upstream commit:
-
-  commit f60d374d2cc88034385265d193a38e3f4a4b430c
-  Author: Al Viro <viro@zeniv.linux.org.uk>
-  Date:   Thu Jan 4 21:35:38 2024 -0500
-
-    close_on_exec(): pass files_struct instead of fdtable
-
-    both callers are happier that way...
-
-Upstream-Status: Backport [c8adc20d fix: close_on_exec(): pass files_struct instead of fdtable (v6.10)]
-
-Change-Id: I8cdabb073c2090842b27b74954d86cb486c43b3e
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/wrapper/fdtable.h  | 14 ++++++++++++++
- src/lttng-statedump-impl.c |  3 +--
- 2 files changed, 15 insertions(+), 2 deletions(-)
-
-Index: lttng-modules-2.13.13/include/wrapper/fdtable.h
-===================================================================
---- lttng-modules-2.13.13.orig/include/wrapper/fdtable.h
-+++ lttng-modules-2.13.13/include/wrapper/fdtable.h
-@@ -69,20 +69,18 @@ int lttng_iterate_fd(struct files_struct
- 
- #endif
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,4,0))
--
--static inline bool lttng_close_on_exec(int fd, const struct fdtable *fdt)
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
-+static inline
-+bool lttng_close_on_exec(unsigned int fd, const struct files_struct *files)
- {
--	return close_on_exec(fd, fdt);
-+	return close_on_exec(fd, files);
- }
--
- #else
--
--static inline bool lttng_close_on_exec(int fd, const struct fdtable *fdt)
-+static inline
-+bool lttng_close_on_exec(unsigned int fd, const struct files_struct *files)
- {
--	return FD_ISSET(fd, fdt->close_on_exec);
-+	return close_on_exec(fd, files_fdtable(files));
- }
--
- #endif
- 
- #endif /* _LTTNG_WRAPPER_FDTABLE_H */
-Index: lttng-modules-2.13.13/src/lttng-statedump-impl.c
-===================================================================
---- lttng-modules-2.13.13.orig/src/lttng-statedump-impl.c
-+++ lttng-modules-2.13.13/src/lttng-statedump-impl.c
-@@ -44,7 +44,6 @@
- #include <wrapper/tracepoint.h>
- #include <wrapper/genhd.h>
- #include <wrapper/file.h>
--#include <wrapper/fdtable.h>
- #include <wrapper/sched.h>
- 
- #ifdef CONFIG_LTTNG_HAS_LIST_IRQ
-@@ -451,7 +450,7 @@ int lttng_dump_one_fd(const void *p, str
- 	 * the lock is taken, but we are not aware whether this is
- 	 * guaranteed or not, so play safe.
- 	 */
--	if (fd < fdt->max_fds && lttng_close_on_exec(fd, fdt))
-+	if (fd < fdt->max_fds && lttng_close_on_exec(fd, ctx->files))
- 		flags |= O_CLOEXEC;
- 	if (IS_ERR(s)) {
- 		struct dentry *dentry = file->f_path.dentry;
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 120528bf9ce..4911982461f 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 878f89b6136ff7b870a19e04901cc6f316bbe10a Mon Sep 17 00:00:00 2001
+From 60d423945bd4f4c4b7bfc6f29da9231152d05690 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
@@ -19,10 +19,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  src/Kbuild | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-Index: lttng-modules-2.13.10/src/Kbuild
-===================================================================
---- lttng-modules-2.13.10.orig/src/Kbuild
-+++ lttng-modules-2.13.10/src/Kbuild
+diff --git a/src/Kbuild b/src/Kbuild
+index 7137874..04eb5c9 100644
+--- a/src/Kbuild
++++ b/src/Kbuild
 @@ -2,10 +2,13 @@
  
  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
@@ -38,7 +38,7 @@ Index: lttng-modules-2.13.10/src/Kbuild
  TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
  lttng_check_linux_version = $(shell pwd)/include/linux/version.h
-@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-
+@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-impl.o
  obj-$(CONFIG_LTTNG) += probes/
  obj-$(CONFIG_LTTNG) += lib/
  obj-$(CONFIG_LTTNG) += tests/
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
index 94582cd47bd..e62717baeb4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch
@@ -1,7 +1,7 @@
-From 7f0f61083a9e88abb289c7575586178739e94955 Mon Sep 17 00:00:00 2001
+From bfb177d2745d19cb56a27c438f4925d6397fbf0b Mon Sep 17 00:00:00 2001
 From: Kienan Stewart <kstewart@efficios.com>
 Date: Mon, 29 Jul 2024 14:08:32 +0000
-Subject: [PATCH 2/6] Fix: ext4_da_reserve_space changed in 6.11-rc1
+Subject: [PATCH] Fix: ext4_da_reserve_space changed in 6.11-rc1
 
 See upstream commit:
 
@@ -25,10 +25,10 @@ Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index 462b11bf..addf2246 100644
+index 4131803..9f1d4b1 100644
 --- a/include/instrumentation/events/ext4.h
 +++ b/include/instrumentation/events/ext4.h
-@@ -730,7 +730,23 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
+@@ -821,7 +821,23 @@ LTTNG_TRACEPOINT_EVENT(ext4_da_update_reserve_space,
  )
  #endif
  
@@ -53,6 +53,3 @@ index 462b11bf..addf2246 100644
  LTTNG_TRACEPOINT_EVENT(ext4_da_reserve_space,
  	TP_PROTO(struct inode *inode),
  
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch
deleted file mode 100644
index 5d0d1fb314f..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 9bb17e292631f54fb5af4be4fae32ccd3d3d15c7 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 27 May 2024 13:13:15 -0400
-Subject: [PATCH 2/3] fix: btrfs: move ->parent and ->ref_root into
- btrfs_delayed_ref_node (v6.10)
-
-See upstream commit:
-
-  commit cf4f04325b2b27efa5697ba0ea4c1abdee0035b4
-  Author: Josef Bacik <josef@toxicpanda.com>
-  Date:   Fri Apr 12 22:57:13 2024 -0400
-
-    btrfs: move ->parent and ->ref_root into btrfs_delayed_ref_node
-
-    These two members are shared by both the tree refs and data refs, so
-    move them into btrfs_delayed_ref_node proper.  This allows us to greatly
-    simplify the comparison code, as the shared refs always only sort on
-    parent, and the non shared refs always sort first on ref_root, and then
-    only data refs sort on their specific fields.
-
-Upstream-Status: Backport [9bb17e29 fix: btrfs: move ->parent and ->ref_root into btrfs_delayed_ref_node (v6.10)]
-
-Change-Id: Ib7c92cc4bb8d674ac66ccfa25c03476f7adaaf90
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/btrfs.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index d73c1ce5..c0c746e2 100644
---- a/include/instrumentation/events/btrfs.h
-+++ b/include/instrumentation/events/btrfs.h
-@@ -912,8 +912,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_tree_ref,
- 		ctf_integer(u64, bytenr, ref->bytenr)
- 		ctf_integer(u64, num_bytes, ref->num_bytes)
- 		ctf_integer(int, action, ref->action)
--		ctf_integer(u64, parent, ref->tree_ref.parent)
--		ctf_integer(u64, ref_root, ref->tree_ref.root)
-+		ctf_integer(u64, parent, ref->parent)
-+		ctf_integer(u64, ref_root, ref->ref_root)
- 		ctf_integer(int, level, ref->tree_ref.level)
- 		ctf_integer(int, type, ref->type)
- 		ctf_integer(u64, seq, ref->seq)
-@@ -1196,8 +1196,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_data_ref,
- 		ctf_integer(u64, bytenr, ref->bytenr)
- 		ctf_integer(u64, num_bytes, ref->num_bytes)
- 		ctf_integer(int, action, ref->action)
--		ctf_integer(u64, parent, ref->data_ref.parent)
--		ctf_integer(u64, ref_root, ref->data_ref.root)
-+		ctf_integer(u64, parent, ref->parent)
-+		ctf_integer(u64, ref_root, ref->ref_root)
- 		ctf_integer(u64, owner, ref->data_ref.objectid)
- 		ctf_integer(u64, offset, ref->data_ref.offset)
- 		ctf_integer(int, type, ref->type)
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
index 5273efe53ed..4d06ec76e78 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch
@@ -1,7 +1,7 @@
-From aef97cb8d8ce45a9ea02eaedd20c28e4b69f4acf Mon Sep 17 00:00:00 2001
+From 1e4cc8d271117af9262e28a5dd19790a0917818c Mon Sep 17 00:00:00 2001
 From: Kienan Stewart <kstewart@efficios.com>
 Date: Mon, 29 Jul 2024 14:11:36 +0000
-Subject: [PATCH 3/6] Fix: orig_start removed from btrfs_get_extent in 6.11-rc1
+Subject: [PATCH] Fix: orig_start removed from btrfs_get_extent in 6.11-rc1
 
 See upstream commit:
 
@@ -28,10 +28,10 @@ Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  1 file changed, 23 insertions(+), 1 deletion(-)
 
 diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index f1b82db4..40139dee 100644
+index c0c746e..dfad19c 100644
 --- a/include/instrumentation/events/btrfs.h
 +++ b/include/instrumentation/events/btrfs.h
-@@ -176,7 +176,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
+@@ -177,7 +177,29 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
  )
  #endif
  
@@ -62,6 +62,3 @@ index f1b82db4..40139dee 100644
  
  LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
  
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch
deleted file mode 100644
index ab28f870c5b..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 4ae0d960e149d1205d0cc167e44c120148c7f4f0 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 27 May 2024 11:11:21 -0400
-Subject: [PATCH 3/3] fix: net: udp: add IP/port data to the tracepoint
- udp/udp_fail_queue_rcv_skb (v6.10)
-
-See upstream commit:
-
-  commit e9669a00bba79442dd4862c57761333d6a020c24
-  Author: Balazs Scheidler <bazsi77@gmail.com>
-  Date:   Tue Mar 26 19:05:47 2024 +0100
-
-    net: udp: add IP/port data to the tracepoint udp/udp_fail_queue_rcv_skb
-
-    The udp_fail_queue_rcv_skb() tracepoint lacks any details on the source
-    and destination IP/port whereas this information can be critical in case
-    of UDP/syslog.
-
-Upstream-Status: Backport [4ae0d960 fix: net: udp: add IP/port data to the tracepoint udp/udp_fail_queue_rcv_skb (v6.10)]
-
-Change-Id: I0c337c5817b0a120298cbf5088d60671d9625b0d
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/udp.h | 30 ++++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
-
-diff --git a/include/instrumentation/events/udp.h b/include/instrumentation/events/udp.h
-index b63a1bb5..0a94b466 100644
---- a/include/instrumentation/events/udp.h
-+++ b/include/instrumentation/events/udp.h
-@@ -7,7 +7,36 @@
- 
- #include <lttng/tracepoint-event.h>
- #include <linux/udp.h>
-+#include <lttng/kernel-version.h>
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
-+LTTNG_TRACEPOINT_ENUM(lttng_sk_family,
-+	TP_ENUM_VALUES(
-+		ctf_enum_value("AF_INET", AF_INET)
-+		ctf_enum_value("AF_INET6", AF_INET6)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT(udp_fail_queue_rcv_skb,
-+
-+	TP_PROTO(int rc, struct sock *sk, struct sk_buff *skb),
-+
-+	TP_ARGS(rc, sk, skb),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, rc, rc)
-+		ctf_integer(__u16, sport, ntohs(udp_hdr(skb)->source))
-+		ctf_integer(__u16, dport, ntohs(udp_hdr(skb)->dest))
-+		ctf_enum(lttng_sk_family, __u16, family, sk->sk_family)
-+		/*
-+		 * The 'saddr' and 'daddr' fields from the upstream tracepoint
-+		 * are currently not extracted. It is recommended to use a
-+		 * tracepoint from the 'net' probe instead which includes all
-+		 * fields from the IP header.
-+		 */
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT(udp_fail_queue_rcv_skb,
- 
- 	TP_PROTO(int rc, struct sock *sk),
-@@ -19,6 +48,7 @@ LTTNG_TRACEPOINT_EVENT(udp_fail_queue_rcv_skb,
- 		ctf_integer(__u16, lport, inet_sk(sk)->inet_num)
- 	)
- )
-+#endif
- 
- #endif /* LTTNG_TRACE_UDP_H */
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
index 8dab9cac476..c9f48e2f2b2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch
@@ -1,7 +1,7 @@
-From d44bc12d138513eb3d1dae4e66a4d76d7c567212 Mon Sep 17 00:00:00 2001
+From 974125ab11a7f0b4df5658cdac26dc5cf9fdbc87 Mon Sep 17 00:00:00 2001
 From: Kienan Stewart <kstewart@efficios.com>
 Date: Mon, 29 Jul 2024 14:12:47 +0000
-Subject: [PATCH 4/6] Fix: block_len removed frmo btrfs_get_extent in 6.11-rc1
+Subject: [PATCH] Fix: block_len removed frmo btrfs_get_extent in 6.11-rc1
 
 See upstream commit:
 
@@ -31,10 +31,10 @@ Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index 40139dee..a764fb3b 100644
+index dfad19c..28320d8 100644
 --- a/include/instrumentation/events/btrfs.h
 +++ b/include/instrumentation/events/btrfs.h
-@@ -191,7 +191,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
+@@ -192,7 +192,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
  		ctf_integer(u64, start, map->start)
  		ctf_integer(u64, len, map->len)
  		ctf_integer(u64, block_start, map->block_start)
@@ -42,6 +42,3 @@ index 40139dee..a764fb3b 100644
  		ctf_integer(unsigned int, flags, map->flags)
  		ctf_integer(int, refs, refcount_read(&map->refs))
  		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
index da933d2f726..86c72cc6502 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch
@@ -1,8 +1,7 @@
-From f2762247871d9340f3cbe7e40f25ceb6dbdb81f1 Mon Sep 17 00:00:00 2001
+From b845e79532c9c28c0108bf556171093236460251 Mon Sep 17 00:00:00 2001
 From: Kienan Stewart <kstewart@efficios.com>
 Date: Mon, 29 Jul 2024 14:14:24 +0000
-Subject: [PATCH 5/6] Fix: block_start removed from btrfs_get_extent in
- 6.11-rc1
+Subject: [PATCH] Fix: block_start removed from btrfs_get_extent in 6.11-rc1
 
 See upstream commit:
 
@@ -38,10 +37,10 @@ Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
-index a764fb3b..4ceb8e02 100644
+index 28320d8..8fb6866 100644
 --- a/include/instrumentation/events/btrfs.h
 +++ b/include/instrumentation/events/btrfs.h
-@@ -190,7 +190,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
+@@ -191,7 +191,6 @@ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
  		ctf_integer(u64, ino, btrfs_ino(inode))
  		ctf_integer(u64, start, map->start)
  		ctf_integer(u64, len, map->len)
@@ -49,6 +48,3 @@ index a764fb3b..4ceb8e02 100644
  		ctf_integer(unsigned int, flags, map->flags)
  		ctf_integer(int, refs, refcount_read(&map->refs))
  		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
index 778c7e3b862..2745e6444aa 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch
@@ -1,7 +1,7 @@
-From 166a05ce64a05218f51563d201644ab3bfddaacc Mon Sep 17 00:00:00 2001
+From d0797fe4bce357d419d2f1f8a3cfe2f8e71ebfdb Mon Sep 17 00:00:00 2001
 From: Kienan Stewart <kstewart@efficios.com>
 Date: Mon, 29 Jul 2024 14:23:02 +0000
-Subject: [PATCH 6/6] Fix: scsi: sd: Atomic write support added in 6.11-rc1
+Subject: [PATCH] Fix: scsi: sd: Atomic write support added in 6.11-rc1
 
 See upstream commit:
 
@@ -90,10 +90,10 @@ Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  1 file changed, 97 insertions(+), 1 deletion(-)
 
 diff --git a/include/instrumentation/events/scsi.h b/include/instrumentation/events/scsi.h
-index de2a1998..175ab003 100644
+index 52c0ebd..54ba3ee 100644
 --- a/include/instrumentation/events/scsi.h
 +++ b/include/instrumentation/events/scsi.h
-@@ -19,7 +19,103 @@
+@@ -16,7 +16,103 @@
  
  #define scsi_opcode_name(opcode)	{ opcode, #opcode }
  
@@ -198,6 +198,3 @@ index de2a1998..175ab003 100644
  	|| LTTNG_SLE_KERNEL_RANGE(4,4,9,36,0,0, 4,5,0,0,0,0))
  
  #define show_opcode_name(val)					\
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
similarity index 78%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index 0363e8be70e..5b1e61f3be1 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -3,29 +3,25 @@ SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d0d9f08888046474772a5d745d89d6a"
 
 inherit module
 
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch \
-           file://0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch \
-           file://0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch \
-           file://0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch \
            file://0001-Fix-kfree_skb-changed-in-6.11-rc1.patch \
            file://0002-Fix-ext4_da_reserve_space-changed-in-6.11-rc1.patch \
            file://0003-Fix-orig_start-removed-from-btrfs_get_extent-in-6.11.patch \
            file://0004-Fix-block_len-removed-frmo-btrfs_get_extent-in-6.11-.patch \
            file://0005-Fix-block_start-removed-from-btrfs_get_extent-in-6.1.patch \
            file://0006-Fix-scsi-sd-Atomic-write-support-added-in-6.11-rc1.patch \
-        "
+           "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "7d26c07a5e80b66aa7bdcfdaaf4857f00fc9a5cdde79226b2528676700d50228"
+SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.39.2


