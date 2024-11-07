Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A3ED5AE40
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:40 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.63129.1730946578536013582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxOYWNix;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cbf340fccaso4319226d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946577; x=1731551377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2lbAIXfh7smwK+nynMRbt+3vo/yVhtHtyhaswdWPCw=;
        b=CxOYWNixPUblCRBrnfA78pvHwE/yDAKaG5YR25t9DVLyS26wCFgSynsi9LvUxlCFzO
         CYSct9PFBiaebFyXZWm1iCAzTenLZL+6Hjz5PHrwX1yOI4d5T/+6e5N2T0HH4xaf8cwd
         W5xVBpk8Jz6WarnjT+BP/g8+nS00YToED4Eo346Jc7LxUGMCj8RnPl4e8kP8vxORt3am
         3YFMilbJMjATZf1DYmQxBFDTAIps0rtR6bsLUJUyVQGgf2MLSG9FYE+MTCvbCUooDDuA
         +FITtsNV3M//kOeocw2ogLWcNB+DiIeEqsue0xsd2wdFU1IS/6Ku8HYLb1wlouheEdNN
         KmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946577; x=1731551377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2lbAIXfh7smwK+nynMRbt+3vo/yVhtHtyhaswdWPCw=;
        b=naSIDEcuxddoGYIMMktqC425n0/CfwvrQu75re2v6SAvF2oOWtu3jJ6oBjOh7w5FnA
         rfgPcbEZwz3ELtl3xMHBmWYqqpIy6Z54cF/b0lLaGjEmlfmub7wVWQ9448KLst7LYfQh
         idwkjVMWVsmQW9M4A2X0PJU4F6yUR0v6PCDumHYOqvk2N6EWNtaMsDzFnn699ZAhWTsY
         5TUmxaR6QbvUOE6AWqqA3Kt3SA9iZA4lsNuURvwpq3GK4afO9QtiOhl8xORRjGODI6i8
         K82deT4Lk5WRTeXg1807pXxLFd3YozgNvkNot3qOS9dD1Nf2aMpFviigfYeh1mTQYAN1
         Y72w==
X-Gm-Message-State: AOJu0YwXfABi1ssekaVajarwiRpvdj+gY440p0x4HUuDYIWP8yHqvnKD
	hWQGX/NtCvDu1Bd3QT5W4bZSlyb6rtiQEh1YHMpZHGr/hKXLSwqfaOEzkO6e
X-Google-Smtp-Source: AGHT+IEjhHv472tFRQKl0ZM0xA3CNBPOUoNPOr2l2MASA9xHAMXokPSo5fZrCve/0ZmXeQB7OxeLww==
X-Received: by 2002:a05:6214:250b:b0:6cc:1d39:377 with SMTP id 6a1803df08f44-6d393c25c0emr22881176d6.13.1730946577414;
        Wed, 06 Nov 2024 18:29:37 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] lttng-modules: fix build for 6.12+
Date: Wed,  6 Nov 2024 21:29:16 -0500
Message-Id: <ac12252f5a7d14eda8a14728cf178b93068c99cb.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206815

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We backport two fixes from the -stable 2.13 lttng branch
to fix the build against kernels 6.12+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-uprobe_register-return-struct-uprob.patch | 160 ++++++++++++++++++
 ...fine-the-show_inode_state-macro-defi.patch |  68 ++++++++
 .../lttng/lttng-modules_2.13.15.bb            |   2 +
 3 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
new file mode 100644
index 0000000000..052220e7ff
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch
@@ -0,0 +1,160 @@
+From 9b96303d2382c767eb1f507d934bcc3fe225d74c Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 17 Oct 2024 11:56:02 -0400
+Subject: [PATCH] Fix: uprobes: make uprobe_register() return struct uprobe *
+ (v6.12)
+
+See upstream commits :
+
+  commit 3c83a9ad0295eb63bdeb81d821b8c3b9417fbcac
+  Author: Oleg Nesterov <oleg@redhat.com>
+  Date:   Thu Aug 1 15:27:34 2024 +0200
+
+    uprobes: make uprobe_register() return struct uprobe *
+
+    This way uprobe_unregister() and uprobe_apply() can use "struct uprobe *"
+    rather than inode + offset. This simplifies the code and allows to avoid
+    the unnecessary find_uprobe() + put_uprobe() in these functions.
+
+    TODO: uprobe_unregister() still needs get_uprobe/put_uprobe to ensure that
+    this uprobe can't be freed before up_write(&uprobe->register_rwsem).
+
+  commit 04b01625da130c7521b768996cd5e48052198b97
+  Author: Peter Zijlstra <peterz@infradead.org>
+  Date:   Tue Sep 3 10:46:00 2024 -0700
+
+    perf/uprobe: split uprobe_unregister()
+
+    With uprobe_unregister() having grown a synchronize_srcu(), it becomes
+    fairly slow to call. Esp. since both users of this API call it in a
+    loop.
+
+    Peel off the sync_srcu() and do it once, after the loop.
+
+    We also need to add uprobe_unregister_sync() into uprobe_register()'s
+    error handling path, as we need to be careful about returning to the
+    caller before we have a guarantee that partially attached consumer won't
+    be called anymore. This is an unlikely slow path and this should be
+    totally fine to be slow in the case of a failed attach.
+
+  commit e04332ebc8ac128fa551e83f1161ab1c094d13a9
+  Author: Oleg Nesterov <oleg@redhat.com>
+  Date:   Thu Aug 1 15:27:28 2024 +0200
+
+    uprobes: kill uprobe_register_refctr()
+
+    It doesn't make any sense to have 2 versions of _register(). Note that
+    trace_uprobe_enable(), the only user of uprobe_register(), doesn't need
+    to check tu->ref_ctr_offset to decide which one should be used, it could
+    safely pass ref_ctr_offset == 0 to uprobe_register_refctr().
+
+    Add this argument to uprobe_register(), update the callers, and kill
+    uprobe_register_refctr().
+
+Upstream-Status: Backport [commit 9b96303d]
+
+Change-Id: I8d1f9a5db1f19c2bc2029709ae36f82e86f6fe58
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/lttng/events-internal.h |  1 +
+ include/wrapper/uprobes.h       |  7 ++++++-
+ src/probes/lttng-uprobes.c      | 32 ++++++++++++++++++++++++++++++++
+ 3 files changed, 39 insertions(+), 1 deletion(-)
+
+diff --git a/include/lttng/events-internal.h b/include/lttng/events-internal.h
+index a91a659e..8633608d 100644
+--- a/include/lttng/events-internal.h
++++ b/include/lttng/events-internal.h
+@@ -42,6 +42,7 @@ struct lttng_krp;				/* Kretprobe handling */
+ struct lttng_uprobe_handler {
+ 	struct lttng_kernel_event_common *event;
+ 	loff_t offset;
++	struct uprobe *uprobe;
+ 	struct uprobe_consumer up_consumer;
+ 	struct list_head node;
+ };
+diff --git a/include/wrapper/uprobes.h b/include/wrapper/uprobes.h
+index 9cbbe3b2..52b72d53 100644
+--- a/include/wrapper/uprobes.h
++++ b/include/wrapper/uprobes.h
+@@ -18,9 +18,14 @@
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,5,0))
+ #include <linux/uprobes.h>
++/*
++ * No wrappers for >= 6.12, the API has changed too much, the version checks
++ * are inlined in 'src/probes/lttng-uprobes.c'.
++ */
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
+ 
+ /* Use kallsym lookup for version before 3.9. */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
+ 
+ static inline
+ int wrapper_uprobe_register(struct inode *inode, loff_t offset, struct uprobe_consumer *uc)
+diff --git a/src/probes/lttng-uprobes.c b/src/probes/lttng-uprobes.c
+index f70218be..5be83cdb 100644
+--- a/src/probes/lttng-uprobes.c
++++ b/src/probes/lttng-uprobes.c
+@@ -233,8 +233,16 @@ int lttng_uprobes_add_callsite(struct lttng_uprobe *uprobe,
+ 		goto register_error;
+ 	}
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
++	ret = 0;
++	uprobe_handler->uprobe = uprobe_register(uprobe->inode,
++		      uprobe_handler->offset, 0, &uprobe_handler->up_consumer);
++	if (IS_ERR(uprobe_handler->uprobe))
++		ret = -1;
++#else
+ 	ret = wrapper_uprobe_register(uprobe->inode,
+ 		      uprobe_handler->offset, &uprobe_handler->up_consumer);
++#endif
+ 	if (ret) {
+ 		printk(KERN_WARNING "LTTng: Error registering probe on inode %lu "
+ 		       "and offset 0x%llx\n", uprobe->inode->i_ino,
+@@ -330,15 +338,39 @@ void lttng_uprobes_unregister(struct inode *inode, struct list_head *head)
+ {
+ 	struct lttng_uprobe_handler *iter, *tmp;
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
++	/*
++	 * Iterate over the list of handler, unregister each uprobe.
++	 */
++	list_for_each_entry(iter, head, node) {
++		uprobe_unregister_nosync(iter->uprobe, &iter->up_consumer);
++		iter->uprobe = NULL;
++	}
++
++	/*
++	 * Call synchronize_srcu() on uprobes_srcu.
++	 */
++	uprobe_unregister_sync();
++
+ 	/*
+ 	 * Iterate over the list of handler, remove each handler from the list
+ 	 * and free the struct.
+ 	 */
++	list_for_each_entry_safe(iter, tmp, head, node) {
++		list_del(&iter->node);
++		kfree(iter);
++	}
++#else
++	/*
++	 * Iterate over the list of handler, unregister each uprobe, remove
++	 * each handler from the list and free the struct.
++	 */
+ 	list_for_each_entry_safe(iter, tmp, head, node) {
+ 		wrapper_uprobe_unregister(inode, iter->offset, &iter->up_consumer);
+ 		list_del(&iter->node);
+ 		kfree(iter);
+ 	}
++#endif
+ }
+ 
+ void lttng_uprobes_unregister_event(struct lttng_kernel_event_recorder *event_recorder)
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch
new file mode 100644
index 0000000000..39b68eeeb2
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch
@@ -0,0 +1,68 @@
+From 4610de285daf887262a58683d8597668de62e676 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 17 Oct 2024 16:59:07 -0400
+Subject: [PATCH] fix: writeback: Refine the show_inode_state() macro
+ definition (v6.12)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+See upstream commit :
+
+  commit 459ca85ae1feff78d1518344df88bb79a092780c
+  Author: Julian Sun <sunjunchao2870@gmail.com>
+  Date:   Wed Aug 28 16:13:59 2024 +0800
+
+    writeback: Refine the show_inode_state() macro definition
+
+    Currently, the show_inode_state() macro only prints
+    part of the state of inode->i_state. Let’s improve it
+    to display more of its state.
+
+Upstream-Status: Backport [commit 4610de285daf887262a58]
+
+Change-Id: Idaebd56f5775205f8a5c76e117c5ab65f7f1754b
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/writeback.h | 24 +++++++++++++++++++++-
+ 1 file changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/writeback.h b/include/instrumentation/events/writeback.h
+index c4510b44..cad01994 100644
+--- a/include/instrumentation/events/writeback.h
++++ b/include/instrumentation/events/writeback.h
+@@ -71,7 +71,29 @@ static inline struct backing_dev_info *lttng_inode_to_bdi(struct inode *inode)
+  * changed by an upstream kernel, the fact that we have a redefinition here
+  * will generate a compiler warning.
+  */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,12,0))
++#define show_inode_state(state)					\
++	__print_flags(state, "|",				\
++		{I_DIRTY_SYNC,		"I_DIRTY_SYNC"},	\
++		{I_DIRTY_DATASYNC,	"I_DIRTY_DATASYNC"},	\
++		{I_DIRTY_PAGES,		"I_DIRTY_PAGES"},	\
++		{I_NEW,			"I_NEW"},		\
++		{I_WILL_FREE,		"I_WILL_FREE"},		\
++		{I_FREEING,		"I_FREEING"},		\
++		{I_CLEAR,		"I_CLEAR"},		\
++		{I_SYNC,		"I_SYNC"},		\
++		{I_DIRTY_TIME,		"I_DIRTY_TIME"},	\
++		{I_REFERENCED,		"I_REFERENCED"},	\
++		{I_LINKABLE,		"I_LINKABLE"},		\
++		{I_WB_SWITCH,		"I_WB_SWITCH"},		\
++		{I_OVL_INUSE,		"I_OVL_INUSE"},		\
++		{I_CREATING,		"I_CREATING"},		\
++		{I_DONTCACHE,		"I_DONTCACHE"},		\
++		{I_SYNC_QUEUED,		"I_SYNC_QUEUED"},	\
++		{I_PINNING_NETFS_WB,	"I_PINNING_NETFS_WB"},	\
++		{I_LRU_ISOLATING,	"I_LRU_ISOLATING"}	\
++	)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
+ 	LTTNG_KERNEL_RANGE(4,14,218, 4,15,0) ||			\
+ 	LTTNG_KERNEL_RANGE(4,19,172, 4,20,0) ||			\
+ 	LTTNG_KERNEL_RANGE(5,4,94, 5,5,0) ||			\
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
index 66b3729ce5..e05a2c9572 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.15.bb
@@ -10,6 +10,8 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-fix-writeback-Refine-the-show_inode_state-macro-defi.patch \
+           file://0001-Fix-uprobes-make-uprobe_register-return-struct-uprob.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.39.2


