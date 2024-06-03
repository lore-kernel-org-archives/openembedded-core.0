Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D13C27C4F
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 04:03:04 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.75205.1717387382642388695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 21:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GwbR/+Bq;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a0c011d53so39193897b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717387382; x=1717992182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUqC90Bal/MW9KvKxP8p8Bv0qV8N7x3ZkZuOoFEpLFM=;
        b=GwbR/+Bqr8yKV1cOIfNfKTs/xS7fEgozwecAczcRklCF9O/M+lKrc/frsztEjocT2U
         B8Dv9Z/72Nb/7Q5EiXmiYNtiZwKEe610XuH3uApYNADgkKdl8ltKcIhw9qShrp8qfq7n
         nzgRHEsTq44kO7QpDmi8qIx9YFNqQlDHPhlSWbeMYxVOodBrx/vAbr/YdhIOY/70tlxi
         bxoIEWvW5Lp0cC4YzlqPZRWEL6W7+E1l5/oPVlQsn2qLC2u6gIWwcXEpgaJnPE8BCqkL
         HYK/aey0Y32OZHOnc/pQ6jy44r6VF3B6aTSp/r82ZHvH0QJlduKzAGY6KwdHItGdnqLb
         yDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717387382; x=1717992182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUqC90Bal/MW9KvKxP8p8Bv0qV8N7x3ZkZuOoFEpLFM=;
        b=KKuX2PdqnECGF6quprKcaBEETqi6RU5x7MIG3YY0/pCS00fQJcYiJrZfX8kw0ANuUK
         s3rN7NKbyYVBQ2o8t6Gp9dHrS4nbkbt9QgIa56uMFZU3xvG0IAPyuMZ1jWE27ePQKh1R
         InIHGVyF4Lr6iulb/yrz/N10SinyCEz8Hw8u4D69V4S/4jOpSIwxRgmpEAu+hJ2/sFt8
         nvqpPrCcgkIrtCorwVBoItuuj2jxIpLSNHIwX4OkejGvX//Jq9i6Zb3MxcKNHW89VMhl
         ITvvzuw4BueIgn8DjDmhTIYnGxLU/3cka185Mq5BdRtX7RlTCFje+u4DwuFHW3z4dmWR
         pO6w==
X-Gm-Message-State: AOJu0YziBmNUika40+Jrf1Y/YSis0yDsPFHcL9zzo3/P8unpkmoZmDCo
	DDV14YCjv+mAtXf0c04O8cIz1w+Uifn46RgyFGPnvBCOwm3r/rz7mHk2og==
X-Google-Smtp-Source: AGHT+IFqvdzYvA9/Qcxoj+eiTecqDHDmcRB7UXO+civgGDNrxKWBylSEaYKJn3H6kBR1qVEwQEWXGg==
X-Received: by 2002:a81:a181:0:b0:618:9353:1023 with SMTP id 00721157ae682-62c8185bb7fmr66583957b3.17.1717387380660;
        Sun, 02 Jun 2024 21:03:00 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f3017d2asm245528685a.55.2024.06.02.21.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:02:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-modules: update to 2.13.13 and fix for 6.10+
Date: Mon,  3 Jun 2024 00:02:55 -0400
Message-Id: <20240603040255.1520919-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603040255.1520919-1-bruce.ashfield@gmail.com>
References: <20240603040255.1520919-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 04:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200230

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping lttng-modules to 2.13.13, which allows us to drop some
upstream patches.

We also import 4 patches that are required to build against 6.10.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...x-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch |  93 ------------
 ...mplify-delayed-ref-tracepoints-v6.10.patch | 142 ++++++++++++++++++
 ...c-pass-files_struct-instead-of-fdtab.patch |  79 ++++++++++
 ...ponent-to-set_bias_level-events-in-l.patch | 132 ----------------
 ...arent-and-ref_root-into-btrfs_delaye.patch |  58 +++++++
 ...n_migratepages-changed-in-linux-6.9-.patch |  81 ----------
 ...IP-port-data-to-the-tracepoint-udp-u.patch |  79 ++++++++++
 ...v_base_lock-removed-in-linux-6.9-rc1.patch |  57 -------
 ...es_2.13.12.bb => lttng-modules_2.13.13.bb} |  10 +-
 9 files changed, 363 insertions(+), 368 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.12.bb => lttng-modules_2.13.13.bb} (77%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
deleted file mode 100644
index 9d5fd0de60..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From fec007d9630e010062cf5699a08460f71f46b527 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 08:54:42 -0400
-Subject: [PATCH 1/4] Fix: ASoC snd_doc_dapm on linux 6.9-rc1
-
-See upstream commit:
-
-    commit 7df3eb4cdb6bbfa482f51548b9fd47c2723c68ba
-    Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
-    Date:   Wed Mar 6 10:30:01 2024 +0100
-
-        ASoC: trace: add event to snd_soc_dapm trace events
-
-        Add the event value to the snd_soc_dapm_start and snd_soc_dapm_done trace
-        events to make them more informative.
-
-        Trace before:
-
-                   aplay-229   [000]   250.140309: snd_soc_dapm_start:   card=vscn-2046
-                   aplay-229   [000]   250.167531: snd_soc_dapm_done:    card=vscn-2046
-                   aplay-229   [000]   251.169588: snd_soc_dapm_start:   card=vscn-2046
-                   aplay-229   [000]   251.195245: snd_soc_dapm_done:    card=vscn-2046
-
-        Trace after:
-
-                   aplay-214   [000]   693.290612: snd_soc_dapm_start:   card=vscn-2046 event=1
-                   aplay-214   [000]   693.315508: snd_soc_dapm_done:    card=vscn-2046 event=1
-                   aplay-214   [000]   694.537349: snd_soc_dapm_start:   card=vscn-2046 event=2
-                   aplay-214   [000]   694.563241: snd_soc_dapm_done:    card=vscn-2046 event=2
-
-Upstream-Status: Backport [88c4e0fe Fix: ASoC snd_doc_dapm on linux 6.9-rc1]
-
-Change-Id: If0d33544b8dd1dfb3d12ca9390892190fc0444b0
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/asoc.h | 33 +++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
-
-diff --git a/include/instrumentation/events/asoc.h b/include/instrumentation/events/asoc.h
-index 21d13a0f..5126d4c1 100644
---- a/include/instrumentation/events/asoc.h
-+++ b/include/instrumentation/events/asoc.h
-@@ -51,6 +51,38 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_card, snd_soc_bias_level_done,
- 
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
-+
-+	TP_PROTO(struct snd_soc_card *card, int event),
-+
-+	TP_ARGS(card, event),
-+
-+	TP_FIELDS(
-+		ctf_string(name, card->name)
-+		ctf_integer(int, event, event)
-+	)
-+)
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_start,
-+
-+	asoc_snd_soc_dapm_start,
-+
-+	TP_PROTO(struct snd_soc_card *card, int event),
-+
-+	TP_ARGS(card, event)
-+
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_done,
-+
-+	asoc_snd_soc_dapm_done,
-+
-+	TP_PROTO(struct snd_soc_card *card, int event),
-+
-+	TP_ARGS(card, event)
-+
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
- 
- 	TP_PROTO(struct snd_soc_card *card),
-@@ -81,6 +113,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_basic, snd_soc_dapm_done,
- 	TP_ARGS(card)
- 
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_widget,
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch
new file mode 100644
index 0000000000..c1e11f2bfb
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch
@@ -0,0 +1,142 @@
+From db0f940136afd43ce5fcf87c4d4e9ca558db1d4f Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 27 May 2024 13:04:42 -0400
+Subject: [PATCH 1/3] fix: btrfs: simplify delayed ref tracepoints (v6.10)
+
+See upstream commit:
+
+  commit 1bff6d4f873790cfc675afce9860208576508c5a
+  Author: Josef Bacik <josef@toxicpanda.com>
+  Date:   Fri Apr 12 20:27:00 2024 -0400
+
+    btrfs: simplify delayed ref tracepoints
+
+    Now that all of the delayed ref information is in the delayed ref node,
+    drastically simplify the delayed ref tracepoints by simply passing in
+    the btrfs_delayed_ref_node and populating the tracepoints with the
+    values from the structure itself.
+
+Upstream-Status: Backport [commit db0f9401 fix: btrfs: simplify delayed ref tracepoints (v6.10)]
+
+Change-Id: Ic90bc23d6aa558baec33adc33b4d21e052e83375
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 94 +++++++++++++++++++++++++-
+ 1 file changed, 92 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index ffb1b646..d73c1ce5 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -899,7 +899,51 @@ LTTNG_TRACEPOINT_EVENT(btrfs_add_block_group,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_tree_ref,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
++		 const struct btrfs_delayed_ref_node *ref),
++
++	TP_ARGS(fs_info, ref),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, bytenr, ref->bytenr)
++		ctf_integer(u64, num_bytes, ref->num_bytes)
++		ctf_integer(int, action, ref->action)
++		ctf_integer(u64, parent, ref->tree_ref.parent)
++		ctf_integer(u64, ref_root, ref->tree_ref.root)
++		ctf_integer(int, level, ref->tree_ref.level)
++		ctf_integer(int, type, ref->type)
++		ctf_integer(u64, seq, ref->seq)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_tree_ref,
++
++	add_delayed_tree_ref,
++
++	btrfs_add_delayed_tree_ref,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
++		 const struct btrfs_delayed_ref_node *ref),
++
++	TP_ARGS(fs_info, ref)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_tree_ref,
++
++	run_delayed_tree_ref,
++
++	btrfs_run_delayed_tree_ref,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
++		 const struct btrfs_delayed_ref_node *ref),
++
++	TP_ARGS(fs_info, ref)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
+@@ -1139,7 +1183,53 @@ LTTNG_TRACEPOINT_EVENT(btrfs_delayed_tree_ref,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_data_ref,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
++		 const struct btrfs_delayed_ref_node *ref),
++
++	TP_ARGS(fs_info, ref),
++
++	TP_FIELDS(
++		ctf_array(u8, fsid, lttng_fs_info_fsid, BTRFS_UUID_SIZE)
++		ctf_integer(u64, bytenr, ref->bytenr)
++		ctf_integer(u64, num_bytes, ref->num_bytes)
++		ctf_integer(int, action, ref->action)
++		ctf_integer(u64, parent, ref->data_ref.parent)
++		ctf_integer(u64, ref_root, ref->data_ref.root)
++		ctf_integer(u64, owner, ref->data_ref.objectid)
++		ctf_integer(u64, offset, ref->data_ref.offset)
++		ctf_integer(int, type, ref->type)
++		ctf_integer(u64, seq, ref->seq)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_data_ref,
++
++	add_delayed_data_ref,
++
++	btrfs_add_delayed_data_ref,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
++		 const struct btrfs_delayed_ref_node *ref),
++
++	TP_ARGS(fs_info, ref)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(btrfs_delayed_data_ref,
++
++	run_delayed_data_ref,
++
++	btrfs_run_delayed_data_ref,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info,
++		 const struct btrfs_delayed_ref_node *ref),
++
++	TP_ARGS(fs_info, ref)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,73,5,0,0, 4,4,73,6,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,82,6,0,0, 4,4,82,7,0,0) || \
+ 	LTTNG_SLE_KERNEL_RANGE(4,4,92,6,0,0, 4,4,92,7,0,0) || \
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch
new file mode 100644
index 0000000000..bb659d5563
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch
@@ -0,0 +1,79 @@
+From c8adc20d19d853527a29411a03e114efdeff5f59 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 27 May 2024 10:49:45 -0400
+Subject: [PATCH] fix: close_on_exec(): pass files_struct instead of fdtable
+ (v6.10)
+
+See upstream commit:
+
+  commit f60d374d2cc88034385265d193a38e3f4a4b430c
+  Author: Al Viro <viro@zeniv.linux.org.uk>
+  Date:   Thu Jan 4 21:35:38 2024 -0500
+
+    close_on_exec(): pass files_struct instead of fdtable
+
+    both callers are happier that way...
+
+Upstream-Status: Backport [c8adc20d fix: close_on_exec(): pass files_struct instead of fdtable (v6.10)]
+
+Change-Id: I8cdabb073c2090842b27b74954d86cb486c43b3e
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/fdtable.h  | 14 ++++++++++++++
+ src/lttng-statedump-impl.c |  3 +--
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+Index: lttng-modules-2.13.13/include/wrapper/fdtable.h
+===================================================================
+--- lttng-modules-2.13.13.orig/include/wrapper/fdtable.h
++++ lttng-modules-2.13.13/include/wrapper/fdtable.h
+@@ -69,20 +69,18 @@ int lttng_iterate_fd(struct files_struct
+ 
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,4,0))
+-
+-static inline bool lttng_close_on_exec(int fd, const struct fdtable *fdt)
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
++static inline
++bool lttng_close_on_exec(unsigned int fd, const struct files_struct *files)
+ {
+-	return close_on_exec(fd, fdt);
++	return close_on_exec(fd, files);
+ }
+-
+ #else
+-
+-static inline bool lttng_close_on_exec(int fd, const struct fdtable *fdt)
++static inline
++bool lttng_close_on_exec(unsigned int fd, const struct files_struct *files)
+ {
+-	return FD_ISSET(fd, fdt->close_on_exec);
++	return close_on_exec(fd, files_fdtable(files));
+ }
+-
+ #endif
+ 
+ #endif /* _LTTNG_WRAPPER_FDTABLE_H */
+Index: lttng-modules-2.13.13/src/lttng-statedump-impl.c
+===================================================================
+--- lttng-modules-2.13.13.orig/src/lttng-statedump-impl.c
++++ lttng-modules-2.13.13/src/lttng-statedump-impl.c
+@@ -44,7 +44,6 @@
+ #include <wrapper/tracepoint.h>
+ #include <wrapper/genhd.h>
+ #include <wrapper/file.h>
+-#include <wrapper/fdtable.h>
+ #include <wrapper/sched.h>
+ 
+ #ifdef CONFIG_LTTNG_HAS_LIST_IRQ
+@@ -451,7 +450,7 @@ int lttng_dump_one_fd(const void *p, str
+ 	 * the lock is taken, but we are not aware whether this is
+ 	 * guaranteed or not, so play safe.
+ 	 */
+-	if (fd < fdt->max_fds && lttng_close_on_exec(fd, fdt))
++	if (fd < fdt->max_fds && lttng_close_on_exec(fd, ctx->files))
+ 		flags |= O_CLOEXEC;
+ 	if (IS_ERR(s)) {
+ 		struct dentry *dentry = file->f_path.dentry;
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
deleted file mode 100644
index 6ea10ffc91..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From d8379ec6365a925db33cae94fb6783cdbdb6a922 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 09:40:29 -0400
-Subject: [PATCH 2/4] Fix: ASoC add component to set_bias_level events in linux
- 6.9-rc1
-
-See upstream commit:
-
-    commit 6ef46a69ec32fe1cf56de67742fcd01af4bf48af
-    Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
-    Date:   Wed Mar 6 10:30:00 2024 +0100
-
-        ASoC: trace: add component to set_bias_level trace events
-
-        The snd_soc_bias_level_start and snd_soc_bias_level_done trace events
-        currently look like:
-
-                   aplay-229   [000]  1250.140778: snd_soc_bias_level_start: card=vscn-2046 val=1
-                   aplay-229   [000]  1250.140784: snd_soc_bias_level_done: card=vscn-2046 val=1
-                   aplay-229   [000]  1250.140786: snd_soc_bias_level_start: card=vscn-2046 val=2
-                   aplay-229   [000]  1250.140788: snd_soc_bias_level_done: card=vscn-2046 val=2
-            kworker/u8:1-21    [000]  1250.140871: snd_soc_bias_level_start: card=vscn-2046 val=1
-            kworker/u8:0-11    [000]  1250.140951: snd_soc_bias_level_start: card=vscn-2046 val=1
-            kworker/u8:0-11    [000]  1250.140956: snd_soc_bias_level_done: card=vscn-2046 val=1
-            kworker/u8:0-11    [000]  1250.140959: snd_soc_bias_level_start: card=vscn-2046 val=2
-            kworker/u8:0-11    [000]  1250.140961: snd_soc_bias_level_done: card=vscn-2046 val=2
-            kworker/u8:1-21    [000]  1250.167219: snd_soc_bias_level_done: card=vscn-2046 val=1
-            kworker/u8:1-21    [000]  1250.167222: snd_soc_bias_level_start: card=vscn-2046 val=2
-            kworker/u8:1-21    [000]  1250.167232: snd_soc_bias_level_done: card=vscn-2046 val=2
-            kworker/u8:0-11    [000]  1250.167440: snd_soc_bias_level_start: card=vscn-2046 val=3
-            kworker/u8:0-11    [000]  1250.167444: snd_soc_bias_level_done: card=vscn-2046 val=3
-            kworker/u8:1-21    [000]  1250.167497: snd_soc_bias_level_start: card=vscn-2046 val=3
-            kworker/u8:1-21    [000]  1250.167506: snd_soc_bias_level_done: card=vscn-2046 val=3
-
-        There are clearly multiple calls, one per component, but they cannot be
-        discriminated from each other.
-
-        Change the ftrace events to also print the component name, to make it clear
-        which part of the code is involved. This requires changing the passed value
-        from a struct snd_soc_card, where the DAPM context is not kwown, to a
-        struct snd_soc_dapm_context where it is obviously known but the a card
-        pointer is also available.
-
-        With this change, the resulting trace becomes:
-
-                   aplay-247   [000]  1436.357332: snd_soc_bias_level_start: card=vscn-2046 component=(none) val=1
-                   aplay-247   [000]  1436.357338: snd_soc_bias_level_done: card=vscn-2046 component=(none) val=1
-                   aplay-247   [000]  1436.357340: snd_soc_bias_level_start: card=vscn-2046 component=(none) val=2
-                   aplay-247   [000]  1436.357343: snd_soc_bias_level_done: card=vscn-2046 component=(none) val=2
-            kworker/u8:4-215   [000]  1436.357437: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=1
-            kworker/u8:5-231   [000]  1436.357518: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=1
-            kworker/u8:5-231   [000]  1436.357523: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=1
-            kworker/u8:5-231   [000]  1436.357526: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=2
-            kworker/u8:5-231   [000]  1436.357528: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=2
-            kworker/u8:4-215   [000]  1436.383217: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=1
-            kworker/u8:4-215   [000]  1436.383221: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=2
-            kworker/u8:4-215   [000]  1436.383231: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=2
-            kworker/u8:5-231   [000]  1436.383468: snd_soc_bias_level_start: card=vscn-2046 component=ff320000.i2s val=3
-            kworker/u8:5-231   [000]  1436.383472: snd_soc_bias_level_done: card=vscn-2046 component=ff320000.i2s val=3
-            kworker/u8:4-215   [000]  1436.383503: snd_soc_bias_level_start: card=vscn-2046 component=ff560000.codec val=3
-            kworker/u8:4-215   [000]  1436.383513: snd_soc_bias_level_done: card=vscn-2046 component=ff560000.codec val=3
-
-Upstream-Status: Backport [303434ab Fix: ASoC add component to set_bias_level events in linux 6.9-rc1]
-
-Change-Id: I959f1680c002acdf29828b968d3975247f5433d8
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/asoc.h | 36 +++++++++++++++++++++++++++
- 1 file changed, 36 insertions(+)
-
-Index: lttng-modules-2.13.12/include/instrumentation/events/asoc.h
-===================================================================
---- lttng-modules-2.13.12.orig/include/instrumentation/events/asoc.h
-+++ lttng-modules-2.13.12/include/instrumentation/events/asoc.h
-@@ -10,6 +10,7 @@
- #include <lttng/kernel-version.h>
- 
- #define DAPM_DIRECT "(direct)"
-+#define DAPM_COMPONENT_NONE "(none)"
- 
- #ifndef _TRACE_ASOC_DEF
- #define _TRACE_ASOC_DEF
-@@ -119,6 +120,40 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc
- )
- #endif
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_context,
-+
-+	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
-+
-+	TP_ARGS(dapm, val),
-+
-+	TP_FIELDS(
-+		ctf_string(name, dapm->card->name)
-+		ctf_string(component, dapm->component ? dapm->component->name : DAPM_COMPONENT_NONE)
-+		ctf_integer(int, val, val)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_context, snd_soc_bias_level_start,
-+
-+	asoc_snd_soc_bias_level_start,
-+
-+	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
-+
-+	TP_ARGS(dapm, val)
-+
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc_snd_soc_dapm_context, snd_soc_bias_level_done,
-+
-+	asoc_snd_soc_bias_level_done,
-+
-+	TP_PROTO(struct snd_soc_dapm_context *dapm, int val),
-+
-+	TP_ARGS(dapm, val)
-+
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_card,
- 
- 	TP_PROTO(struct snd_soc_card *card, int val),
-@@ -150,6 +185,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(asoc
- 	TP_ARGS(card, val)
- 
- )
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(asoc_snd_soc_dapm_basic,
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch
new file mode 100644
index 0000000000..5d0d1fb314
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch
@@ -0,0 +1,58 @@
+From 9bb17e292631f54fb5af4be4fae32ccd3d3d15c7 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 27 May 2024 13:13:15 -0400
+Subject: [PATCH 2/3] fix: btrfs: move ->parent and ->ref_root into
+ btrfs_delayed_ref_node (v6.10)
+
+See upstream commit:
+
+  commit cf4f04325b2b27efa5697ba0ea4c1abdee0035b4
+  Author: Josef Bacik <josef@toxicpanda.com>
+  Date:   Fri Apr 12 22:57:13 2024 -0400
+
+    btrfs: move ->parent and ->ref_root into btrfs_delayed_ref_node
+
+    These two members are shared by both the tree refs and data refs, so
+    move them into btrfs_delayed_ref_node proper.  This allows us to greatly
+    simplify the comparison code, as the shared refs always only sort on
+    parent, and the non shared refs always sort first on ref_root, and then
+    only data refs sort on their specific fields.
+
+Upstream-Status: Backport [9bb17e29 fix: btrfs: move ->parent and ->ref_root into btrfs_delayed_ref_node (v6.10)]
+
+Change-Id: Ib7c92cc4bb8d674ac66ccfa25c03476f7adaaf90
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index d73c1ce5..c0c746e2 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -912,8 +912,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_tree_ref,
+ 		ctf_integer(u64, bytenr, ref->bytenr)
+ 		ctf_integer(u64, num_bytes, ref->num_bytes)
+ 		ctf_integer(int, action, ref->action)
+-		ctf_integer(u64, parent, ref->tree_ref.parent)
+-		ctf_integer(u64, ref_root, ref->tree_ref.root)
++		ctf_integer(u64, parent, ref->parent)
++		ctf_integer(u64, ref_root, ref->ref_root)
+ 		ctf_integer(int, level, ref->tree_ref.level)
+ 		ctf_integer(int, type, ref->type)
+ 		ctf_integer(u64, seq, ref->seq)
+@@ -1196,8 +1196,8 @@ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs_delayed_data_ref,
+ 		ctf_integer(u64, bytenr, ref->bytenr)
+ 		ctf_integer(u64, num_bytes, ref->num_bytes)
+ 		ctf_integer(int, action, ref->action)
+-		ctf_integer(u64, parent, ref->data_ref.parent)
+-		ctf_integer(u64, ref_root, ref->data_ref.root)
++		ctf_integer(u64, parent, ref->parent)
++		ctf_integer(u64, ref_root, ref->ref_root)
+ 		ctf_integer(u64, owner, ref->data_ref.objectid)
+ 		ctf_integer(u64, offset, ref->data_ref.offset)
+ 		ctf_integer(int, type, ref->type)
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
deleted file mode 100644
index 66c48ebe8f..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From f4a6415f8d5fa447868d1fdc7119e0a328966379 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 10:30:32 -0400
-Subject: [PATCH 3/4] Fix: mm_compaction_migratepages changed in linux 6.9-rc1
-
-See upstream commit:
-
-    commit ab755bf4249b992fc2140d615ab0a686d50765b4
-    Author: Baolin Wang <baolin.wang@linux.alibaba.com>
-    Date:   Tue Feb 20 14:16:31 2024 +0800
-
-        mm: compaction: update the cc->nr_migratepages when allocating or freeing the freepages
-
-        Currently we will use 'cc->nr_freepages >= cc->nr_migratepages' comparison
-        to ensure that enough freepages are isolated in isolate_freepages(),
-        however it just decreases the cc->nr_freepages without updating
-        cc->nr_migratepages in compaction_alloc(), which will waste more CPU
-        cycles and cause too many freepages to be isolated.
-
-        So we should also update the cc->nr_migratepages when allocating or
-        freeing the freepages to avoid isolating excess freepages.  And I can see
-        fewer free pages are scanned and isolated when running thpcompact on my
-        Arm64 server:
-
-                                               k6.7         k6.7_patched
-        Ops Compaction pages isolated      120692036.00   118160797.00
-        Ops Compaction migrate scanned     131210329.00   154093268.00
-        Ops Compaction free scanned       1090587971.00  1080632536.00
-        Ops Compact scan efficiency               12.03          14.26
-
-        Moreover, I did not see an obvious latency improvements, this is likely
-        because isolating freepages is not the bottleneck in the thpcompact test
-        case.
-
-                                      k6.7                  k6.7_patched
-        Amean     fault-both-1      1089.76 (   0.00%)     1080.16 *   0.88%*
-        Amean     fault-both-3      1616.48 (   0.00%)     1636.65 *  -1.25%*
-        Amean     fault-both-5      2266.66 (   0.00%)     2219.20 *   2.09%*
-        Amean     fault-both-7      2909.84 (   0.00%)     2801.90 *   3.71%*
-        Amean     fault-both-12     4861.26 (   0.00%)     4733.25 *   2.63%*
-        Amean     fault-both-18     7351.11 (   0.00%)     6950.51 *   5.45%*
-        Amean     fault-both-24     9059.30 (   0.00%)     9159.99 *  -1.11%*
-        Amean     fault-both-30    10685.68 (   0.00%)    11399.02 *  -6.68%*
-
-Upstream-Status: Backport [175fe77c Fix: mm_compaction_migratepages changed in linux 6.9-rc1]
-
-Change-Id: I103a43fd1b549360b3fc978fd409b7c17ef3e192
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/compaction.h | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-Index: lttng-modules-2.13.12/include/instrumentation/events/compaction.h
-===================================================================
---- lttng-modules-2.13.12.orig/include/instrumentation/events/compaction.h
-+++ lttng-modules-2.13.12/include/instrumentation/events/compaction.h
-@@ -97,7 +97,22 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(comp
- 
- #endif /* #else #if LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,0,0) */
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
-+
-+	compaction_migratepages,
-+
-+	TP_PROTO(unsigned int nr_migratepages,
-+		unsigned int nr_succeeded),
-+
-+	TP_ARGS(nr_migratepages, nr_succeeded),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned long, nr_migrated, nr_succeeded)
-+		ctf_integer(unsigned long, nr_failed, nr_migratepages - nr_succeeded)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,18,0) || \
-     LTTNG_RHEL_KERNEL_RANGE(5,14,0,163,0,0, 5,15,0,0,0,0))
- LTTNG_TRACEPOINT_EVENT_MAP(mm_compaction_migratepages,
- 
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch
new file mode 100644
index 0000000000..ab28f870c5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch
@@ -0,0 +1,79 @@
+From 4ae0d960e149d1205d0cc167e44c120148c7f4f0 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 27 May 2024 11:11:21 -0400
+Subject: [PATCH 3/3] fix: net: udp: add IP/port data to the tracepoint
+ udp/udp_fail_queue_rcv_skb (v6.10)
+
+See upstream commit:
+
+  commit e9669a00bba79442dd4862c57761333d6a020c24
+  Author: Balazs Scheidler <bazsi77@gmail.com>
+  Date:   Tue Mar 26 19:05:47 2024 +0100
+
+    net: udp: add IP/port data to the tracepoint udp/udp_fail_queue_rcv_skb
+
+    The udp_fail_queue_rcv_skb() tracepoint lacks any details on the source
+    and destination IP/port whereas this information can be critical in case
+    of UDP/syslog.
+
+Upstream-Status: Backport [4ae0d960 fix: net: udp: add IP/port data to the tracepoint udp/udp_fail_queue_rcv_skb (v6.10)]
+
+Change-Id: I0c337c5817b0a120298cbf5088d60671d9625b0d
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/udp.h | 30 ++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/include/instrumentation/events/udp.h b/include/instrumentation/events/udp.h
+index b63a1bb5..0a94b466 100644
+--- a/include/instrumentation/events/udp.h
++++ b/include/instrumentation/events/udp.h
+@@ -7,7 +7,36 @@
+ 
+ #include <lttng/tracepoint-event.h>
+ #include <linux/udp.h>
++#include <lttng/kernel-version.h>
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,10,0))
++LTTNG_TRACEPOINT_ENUM(lttng_sk_family,
++	TP_ENUM_VALUES(
++		ctf_enum_value("AF_INET", AF_INET)
++		ctf_enum_value("AF_INET6", AF_INET6)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(udp_fail_queue_rcv_skb,
++
++	TP_PROTO(int rc, struct sock *sk, struct sk_buff *skb),
++
++	TP_ARGS(rc, sk, skb),
++
++	TP_FIELDS(
++		ctf_integer(int, rc, rc)
++		ctf_integer(__u16, sport, ntohs(udp_hdr(skb)->source))
++		ctf_integer(__u16, dport, ntohs(udp_hdr(skb)->dest))
++		ctf_enum(lttng_sk_family, __u16, family, sk->sk_family)
++		/*
++		 * The 'saddr' and 'daddr' fields from the upstream tracepoint
++		 * are currently not extracted. It is recommended to use a
++		 * tracepoint from the 'net' probe instead which includes all
++		 * fields from the IP header.
++		 */
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(udp_fail_queue_rcv_skb,
+ 
+ 	TP_PROTO(int rc, struct sock *sk),
+@@ -19,6 +48,7 @@ LTTNG_TRACEPOINT_EVENT(udp_fail_queue_rcv_skb,
+ 		ctf_integer(__u16, lport, inet_sk(sk)->inet_num)
+ 	)
+ )
++#endif
+ 
+ #endif /* LTTNG_TRACE_UDP_H */
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
deleted file mode 100644
index 59ef4f9313..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 217bc2e4685050dddce9bdd2557b64f6b8c16622 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 25 Mar 2024 10:53:46 -0400
-Subject: [PATCH 4/4] Fix: dev_base_lock removed in linux 6.9-rc1
-
-See upstream commit:
-
-    commit 1b3ef46cb7f2618cc0b507393220a69810f6da12
-    Author: Eric Dumazet <edumazet@google.com>
-    Date:   Tue Feb 13 06:32:45 2024 +0000
-
-        net: remove dev_base_lock
-
-        dev_base_lock is not needed anymore, all remaining users also hold RTNL.
-
-Upstream-Status: Backport [52eb2ee9 Fix: dev_base_lock removed in linux 6.9-rc1]
-
-Change-Id: I6b07e6eed07fd398302ca14d23162ed24d74df15
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- src/lttng-statedump-impl.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-Index: lttng-modules-2.13.12/src/lttng-statedump-impl.c
-===================================================================
---- lttng-modules-2.13.12.orig/src/lttng-statedump-impl.c
-+++ lttng-modules-2.13.12/src/lttng-statedump-impl.c
-@@ -392,6 +392,20 @@ void lttng_enumerate_device(struct lttng
- 	}
- }
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0))
-+static
-+int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
-+{
-+	struct net_device *dev;
-+
-+	rtnl_lock();
-+	for_each_netdev(&init_net, dev)
-+		lttng_enumerate_device(session, dev);
-+	rtnl_unlock();
-+
-+	return 0;
-+}
-+#else
- static
- int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
- {
-@@ -404,6 +418,7 @@ int lttng_enumerate_network_ip_interface
- 
- 	return 0;
- }
-+#endif /* (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,9,0)) */
- #else /* CONFIG_INET */
- static inline
- int lttng_enumerate_network_ip_interface(struct lttng_kernel_session *session)
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
similarity index 77%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
index 95d5e2d615..75b144757a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.13.bb
@@ -10,16 +10,16 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Fix-ASoC-snd_doc_dapm-on-linux-6.9-rc1.patch \
-           file://0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch \
-           file://0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch \
-           file://0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch \
+           file://0001-fix-btrfs-simplify-delayed-ref-tracepoints-v6.10.patch \
+           file://0002-fix-btrfs-move-parent-and-ref_root-into-btrfs_delaye.patch \
+           file://0003-fix-net-udp-add-IP-port-data-to-the-tracepoint-udp-u.patch \
+           file://0001-fix-close_on_exec-pass-files_struct-instead-of-fdtab.patch \
         "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "d85fcb66c7bd31003ab8735e8c77700e5e4f417b4c22fe1f20112cf435abad79"
+SRC_URI[sha256sum] = "7d26c07a5e80b66aa7bdcfdaaf4857f00fc9a5cdde79226b2528676700d50228"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.39.2


