Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43093E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:36:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.57976.1734359809698406885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 06:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbOFpLHT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434e3953b65so28977305e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734359808; x=1734964608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iasyjv4XiIYzD90jyf4CTz4fj7Nhqqtg7OOnGNVghM=;
        b=AbOFpLHTUXICJXxx3YHJ37Ayopq+GkQ2IrpHUlunI7kemE7MNc+CkXnF97kdtjx48c
         P0B0VedMuaXIuPI3Eo8G+OW1mMO7qfDL7zCiPgM/6ocdHqlp/5LXPDvTGw77P2MgOsaX
         5WfEess/L1tEct1GC8OLtWy7MDlAw1VwYbEKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359808; x=1734964608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iasyjv4XiIYzD90jyf4CTz4fj7Nhqqtg7OOnGNVghM=;
        b=dkGdq2Ukly9UIa8I0p5yuGRNngryasW8nvA5Qxlw21NjYktel/xD7N3ZfT9h7idTMy
         lNvDGgV5IJFn6F7tfDtciWVpnhgfH+j1FrF8vLpMOaX7vHGoyxsVczpDZXavdzh7TXJT
         5iuLTXKXzTbze2LN5t0uUKUXweyqmeHo9IPL7MX49cHaWSgGJyhBEquGRaPjgqfoCS/p
         9ViJsTnjxyuI1bLrWbIKUOs1J8PHOAYR+yH+5JdHriKUJQMEDiKXihx5fhj9dRg0c9DM
         pPA+9ktNBa92E2db+p8FPIJ3s/gxnw83epd5f1pP0pLWudoZuHzxS+LsiOTbAWBlEiGU
         t/SA==
X-Gm-Message-State: AOJu0YwT88Ly0B4gowFr1y4CqESPTtdcuD4UuyVznv4784fHj2SNJVCs
	LiJvtujOiBxhElcvjEHbfxeq76sZIpIXT1Hufvi4xF2IniUOnedt5VIYXAN6RSG9Y7BA10ezM7v
	Z
X-Gm-Gg: ASbGncsUdHUcm3LqxrjChd+hRpi0rxorlb1FZsS3xW1hOZ8879Hkq0enx4HxiM861ub
	fakt5mBZnKCstmm3los2JxUXwLCWVZR+vBlu9bxBsavodCoRo4iEse2cDY5S8iB1HQNrC2mJlhp
	HFhWiTTKxI1lWF7EgMC1LjbF5PZYEwAVwGLnuDQ9E8SyHUU4CypIrsXtdbZMshXeVtSQgp7NFvp
	yseBT2S1U4e4gQHAcfWtLZrvy8C7NtVPJhSKvy65Qi7beD0bEIX0hUbQAOOfKYVPJaG/spiLj6K
	eXAuH1m32Q==
X-Google-Smtp-Source: AGHT+IGTJ0Z9lLOrThYR3f8mLvNd7JPZqlpCsQ/nrp7shxiCERFlRsFXnvPkT/r5HSuNkEbclXeAOg==
X-Received: by 2002:a05:600c:1c12:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-4362aa3d8bbmr127386575e9.16.1734359807597;
        Mon, 16 Dec 2024 06:36:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ad8:ac77:3170:84a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80163b8sm8191107f8f.35.2024.12.16.06.36.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:36:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] lttng-modules: Upgrade 2.13.15 -> 2.13.16
Date: Mon, 16 Dec 2024 14:36:41 +0000
Message-ID: <20241216143643.1485197-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216143643.1485197-1-richard.purdie@linuxfoundation.org>
References: <20241216143643.1485197-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208769

Drop two patches merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-uprobe_register-return-struct-uprob.patch | 160 ------------------
 ...fine-the-show_inode_state-macro-defi.patch |  68 --------
 ...es_2.13.15.bb => lttng-modules_2.13.16.bb} |   4 +-
 3 files changed, 1 insertion(+), 231 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.15.bb => lttng-modules_2.13.16.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
deleted file mode 100644
index 052220e7ffd..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 9b96303d2382c767eb1f507d934bcc3fe225d74c Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Thu, 17 Oct 2024 11:56:02 -0400
-Subject: [PATCH] Fix: uprobes: make uprobe_register() return struct uprobe *
- (v6.12)
-
-See upstream commits :
-
-  commit 3c83a9ad0295eb63bdeb81d821b8c3b9417fbcac
-  Author: Oleg Nesterov <oleg@redhat.com>
-  Date:   Thu Aug 1 15:27:34 2024 +0200
-
-    uprobes: make uprobe_register() return struct uprobe *
-
-    This way uprobe_unregister() and uprobe_apply() can use "struct uprobe *"
-    rather than inode + offset. This simplifies the code and allows to avoid
-    the unnecessary find_uprobe() + put_uprobe() in these functions.
-
-    TODO: uprobe_unregister() still needs get_uprobe/put_uprobe to ensure that
-    this uprobe can't be freed before up_write(&uprobe->register_rwsem).
-
-  commit 04b01625da130c7521b768996cd5e48052198b97
-  Author: Peter Zijlstra <peterz@infradead.org>
-  Date:   Tue Sep 3 10:46:00 2024 -0700
-
-    perf/uprobe: split uprobe_unregister()
-
-    With uprobe_unregister() having grown a synchronize_srcu(), it becomes
-    fairly slow to call. Esp. since both users of this API call it in a
-    loop.
-
-    Peel off the sync_srcu() and do it once, after the loop.
-
-    We also need to add uprobe_unregister_sync() into uprobe_register()'s
-    error handling path, as we need to be careful about returning to the
-    caller before we have a guarantee that partially attached consumer won't
-    be called anymore. This is an unlikely slow path and this should be
-    totally fine to be slow in the case of a failed attach.
-
-  commit e04332ebc8ac128fa551e83f1161ab1c094d13a9
-  Author: Oleg Nesterov <oleg@redhat.com>
-  Date:   Thu Aug 1 15:27:28 2024 +0200
-
-    uprobes: kill uprobe_register_refctr()
-
-    It doesn't make any sense to have 2 versions of _register(). Note that
-    trace_uprobe_enable(), the only user of uprobe_register(), doesn't need
-    to check tu->ref_ctr_offset to decide which one should be used, it could
-    safely pass ref_ctr_offset == 0 to uprobe_register_refctr().
-
-    Add this argument to uprobe_register(), update the callers, and kill
-    uprobe_register_refctr().
-
-Upstream-Status: Backport [commit 9b96303d]
-
-Change-Id: I8d1f9a5db1f19c2bc2029709ae36f82e86f6fe58
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/lttng/events-internal.h |  1 +
- include/wrapper/uprobes.h       |  7 ++++++-
- src/probes/lttng-uprobes.c      | 32 ++++++++++++++++++++++++++++++++
- 3 files changed, 39 insertions(+), 1 deletion(-)
-
-diff --git a/include/lttng/events-internal.h b/include/lttng/events-internal.h
-index a91a659e..8633608d 100644
---- a/include/lttng/events-internal.h
-+++ b/include/lttng/events-internal.h
-@@ -42,6 +42,7 @@ struct lttng_krp;				/* Kretprobe handling */
- struct lttng_uprobe_handler {
- 	struct lttng_kernel_event_common *event;
- 	loff_t offset;
-+	struct uprobe *uprobe;
- 	struct uprobe_consumer up_consumer;
- 	struct list_head node;
- };
-diff --git a/include/wrapper/uprobes.h b/include/wrapper/uprobes.h
-index 9cbbe3b2..52b72d53 100644
---- a/include/wrapper/uprobes.h
-+++ b/include/wrapper/uprobes.h
-@@ -18,9 +18,14 @@
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,5,0))
- #include <linux/uprobes.h>
-+/*
-+ * No wrappers for >= 6.12, the API has changed too much, the version checks
-+ * are inlined in 'src/probes/lttng-uprobes.c'.
-+ */
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
- 
- /* Use kallsym lookup for version before 3.9. */
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
- 
- static inline
- int wrapper_uprobe_register(struct inode *inode, loff_t offset, struct uprobe_consumer *uc)
-diff --git a/src/probes/lttng-uprobes.c b/src/probes/lttng-uprobes.c
-index f70218be..5be83cdb 100644
---- a/src/probes/lttng-uprobes.c
-+++ b/src/probes/lttng-uprobes.c
-@@ -233,8 +233,16 @@ int lttng_uprobes_add_callsite(struct lttng_uprobe *uprobe,
- 		goto register_error;
- 	}
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
-+	ret = 0;
-+	uprobe_handler->uprobe = uprobe_register(uprobe->inode,
-+		      uprobe_handler->offset, 0, &uprobe_handler->up_consumer);
-+	if (IS_ERR(uprobe_handler->uprobe))
-+		ret = -1;
-+#else
- 	ret = wrapper_uprobe_register(uprobe->inode,
- 		      uprobe_handler->offset, &uprobe_handler->up_consumer);
-+#endif
- 	if (ret) {
- 		printk(KERN_WARNING "LTTng: Error registering probe on inode %lu "
- 		       "and offset 0x%llx\n", uprobe->inode->i_ino,
-@@ -330,15 +338,39 @@ void lttng_uprobes_unregister(struct inode *inode, struct list_head *head)
- {
- 	struct lttng_uprobe_handler *iter, *tmp;
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
-+	/*
-+	 * Iterate over the list of handler, unregister each uprobe.
-+	 */
-+	list_for_each_entry(iter, head, node) {
-+		uprobe_unregister_nosync(iter->uprobe, &iter->up_consumer);
-+		iter->uprobe = NULL;
-+	}
-+
-+	/*
-+	 * Call synchronize_srcu() on uprobes_srcu.
-+	 */
-+	uprobe_unregister_sync();
-+
- 	/*
- 	 * Iterate over the list of handler, remove each handler from the list
- 	 * and free the struct.
- 	 */
-+	list_for_each_entry_safe(iter, tmp, head, node) {
-+		list_del(&iter->node);
-+		kfree(iter);
-+	}
-+#else
-+	/*
-+	 * Iterate over the list of handler, unregister each uprobe, remove
-+	 * each handler from the list and free the struct.
-+	 */
- 	list_for_each_entry_safe(iter, tmp, head, node) {
- 		wrapper_uprobe_unregister(inode, iter->offset, &iter->up_consumer);
- 		list_del(&iter->node);
- 		kfree(iter);
- 	}
-+#endif
- }
- 
- void lttng_uprobes_unregister_event(struct lttng_kernel_event_recorder *event_recorder)
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch
deleted file mode 100644
index 39b68eeeb2a..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 4610de285daf887262a58683d8597668de62e676 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Thu, 17 Oct 2024 16:59:07 -0400
-Subject: [PATCH] fix: writeback: Refine the show_inode_state() macro
- definition (v6.12)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-See upstream commit :
-
-  commit 459ca85ae1feff78d1518344df88bb79a092780c
-  Author: Julian Sun <sunjunchao2870@gmail.com>
-  Date:   Wed Aug 28 16:13:59 2024 +0800
-
-    writeback: Refine the show_inode_state() macro definition
-
-    Currently, the show_inode_state() macro only prints
-    part of the state of inode->i_state. Let’s improve it
-    to display more of its state.
-
-Upstream-Status: Backport [commit 4610de285daf887262a58]
-
-Change-Id: Idaebd56f5775205f8a5c76e117c5ab65f7f1754b
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/writeback.h | 24 +++++++++++++++++++++-
- 1 file changed, 23 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/writeback.h b/include/instrumentation/events/writeback.h
-index c4510b44..cad01994 100644
---- a/include/instrumentation/events/writeback.h
-+++ b/include/instrumentation/events/writeback.h
-@@ -71,7 +71,29 @@ static inline struct backing_dev_info *lttng_inode_to_bdi(struct inode *inode)
-  * changed by an upstream kernel, the fact that we have a redefinition here
-  * will generate a compiler warning.
-  */
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
-+#define show_inode_state(state)					\
-+	__print_flags(state, "|",				\
-+		{I_DIRTY_SYNC,		"I_DIRTY_SYNC"},	\
-+		{I_DIRTY_DATASYNC,	"I_DIRTY_DATASYNC"},	\
-+		{I_DIRTY_PAGES,		"I_DIRTY_PAGES"},	\
-+		{I_NEW,			"I_NEW"},		\
-+		{I_WILL_FREE,		"I_WILL_FREE"},		\
-+		{I_FREEING,		"I_FREEING"},		\
-+		{I_CLEAR,		"I_CLEAR"},		\
-+		{I_SYNC,		"I_SYNC"},		\
-+		{I_DIRTY_TIME,		"I_DIRTY_TIME"},	\
-+		{I_REFERENCED,		"I_REFERENCED"},	\
-+		{I_LINKABLE,		"I_LINKABLE"},		\
-+		{I_WB_SWITCH,		"I_WB_SWITCH"},		\
-+		{I_OVL_INUSE,		"I_OVL_INUSE"},		\
-+		{I_CREATING,		"I_CREATING"},		\
-+		{I_DONTCACHE,		"I_DONTCACHE"},		\
-+		{I_SYNC_QUEUED,		"I_SYNC_QUEUED"},	\
-+		{I_PINNING_NETFS_WB,	"I_PINNING_NETFS_WB"},	\
-+		{I_LRU_ISOLATING,	"I_LRU_ISOLATING"}	\
-+	)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
- 	LTTNG_KERNEL_RANGE(4,14,218, 4,15,0) ||			\
- 	LTTNG_KERNEL_RANGE(4,19,172, 4,20,0) ||			\
- 	LTTNG_KERNEL_RANGE(5,4,94, 5,5,0) ||			\
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
index e05a2c9572e..feba35fd2d7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
@@ -10,14 +10,12 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch \
-           file://0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "6692554eca50e9d22e71b7c2ee6c7db89d393268d404261212af37c5247c0729"
+SRC_URI[sha256sum] = "6694414a3701fcd6e05b3cb20cfecae3b46b3dfb9e5361b344851c1f8052e854"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 

