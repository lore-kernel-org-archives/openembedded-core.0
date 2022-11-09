Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0624C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.3760.1668003660667213650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=knL1ZlmR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso1963803pjg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQsUJmtC+QC/D/pkbwZpuQfLDLHlf83mJ+rsNXxaoXI=;
        b=knL1ZlmRUOLFLW3XRmGO/WVjhrvaKI1UK/XUPugxc3DjqzmWzaa+fi9P0EjnQHqCMK
         tJ1gv3nIwf4B/QaCpbpQ7RTa833EEegIk6LyVDf6VxWU0VThOCeWKqGpOIq7PmYtrlVV
         QctCeuq//gTFAThgEByz9l6zW0qVdQ+sFnoQJ/O7O61+bCryDWlRC/3dIafUWvj+1OXE
         S/ISL4p5I53nxntbVzAAj5RxablNmmQDZ7wa8/XzTDMVCQ+Ox/wPRUOd5WpxSRjyXESA
         6Ocvejs6znfrxWtXjsm0UeWusSvJ2XdeVLGtk0vf9NkIEY4S3ZK6FPjrk3cCCr9argD9
         FerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQsUJmtC+QC/D/pkbwZpuQfLDLHlf83mJ+rsNXxaoXI=;
        b=JKAB2h27R9tr0wbmaUrBG7W8No/jyqnYCvz7J1aCXj46FYw1aIzp0oS4Ce0dYbq7mD
         YRjgA4kJmVyc3SA7UNwMHO3GrvoM4f+omrwvIU7MW3MF5UuO93qSKVBAFmhaOyijX2bX
         SZDuaWyZ9NtppLlZd2xwOUzI5w0182TJr49wKy9Q1/D5CiEftuO3MV/5iBbF95gPAW1b
         pi7HMsX7ssUNgsDX09uu3q/hvv4RJ387WlMQGFHJ+E+FsLpb3GyqcUbgBt6G9lgp1qNx
         sbWsGw1TSqg57+YQta6aaUpufN3x2s25Q99U71sI/OVuEXqfmezZdL4MSMr75NHQSqOE
         VjPw==
X-Gm-Message-State: ACrzQf04uA/GNv4licrkfevkv+2XsS5rsqbhJBAX/I3qyU/xy5QMB/n8
	Fqg0tvunJnVZfeywfLIdPb8cQ2HfxjS23/qQ
X-Google-Smtp-Source: AMsMyM58xLJRWWjzfS1oTWT+0wLfV1EDIrIwbxd6jberTVZhDoLnsK6ZgKI3CvAT069giIj5bHNgjw==
X-Received: by 2002:a17:90a:304b:b0:213:d60f:7fc6 with SMTP id q11-20020a17090a304b00b00213d60f7fc6mr53213368pjl.92.1668003659258;
        Wed, 09 Nov 2022 06:20:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:20:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/10] lttng-modules: upgrade 2.13.4 -> 2.13.5
Date: Wed,  9 Nov 2022 04:20:35 -1000
Message-Id: <cbb85f35d342ffd1c8a0f147f139a8d1a3084aae.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173024

From: Alexander Kanavin <alex.kanavin@gmail.com>

2022-08-19 (National Potato Day) LTTng modules 2.13.5
	* Fix: incorrect stub prototypes when CONFIG_HAVE_SYSCALL_TRACEPOINTS=n
	* fix: mm/tracing: add 'accounted' entry into output of allocation tracepoints (v6.0)
	* fix: block: remove bdevname (v6.0)
	* fix: fs/jbd2: Fix the documentation of the jbd2_write_superblock() callers (v6.0)
	* fix: tie compaction probe build to CONFIG_COMPACTION
	* fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
	* fix: workqueue: Fix type of cpu in trace event (v5.19)
	* fix: fs: Remove flags parameter from aops->write_begin (v5.19)
	* fix: mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked() (v5.19)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 335c60e76b341014bd69eaac0a4b281036a94916)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng-modules/0001-fix-compaction.patch   |  68 ----------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 ---------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 --------
 ...ags-parameter-from-aops-write_begin-.patch |  76 -----------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ------------------
 ...ules_2.13.4.bb => lttng-modules_2.13.5.bb} |   7 +-
 6 files changed, 1 insertion(+), 433 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.5.bb} (76%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
deleted file mode 100644
index 21e27ffc5e..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 8e42c4821fb5f5cb816b6ddf73d9a13ba3298a63 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 10 Aug 2022 11:07:14 -0400
-Subject: [PATCH] fix: tie compaction probe build to CONFIG_COMPACTION
-
-The definition of 'struct compact_control' in 'mm/internal.h' depends on
-CONFIG_COMPACTION being defined. Only build the compaction probe when
-this configuration option is enabled.
-
-Thanks to Bruce Ashfield <bruce.ashfield@gmail.com> for reporting this
-issue.
-
-Upstream-Status: Backport [https://review.lttng.org/c/lttng-modules/+/8660]
-
-Change-Id: I81e77aa9c1bf10452c152d432fe5224df0db42c9
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
----
- src/probes/Kbuild | 34 ++++++++++++++++++----------------
- 1 file changed, 18 insertions(+), 16 deletions(-)
-
-diff --git a/src/probes/Kbuild b/src/probes/Kbuild
-index 2908cf75..3e556b8e 100644
---- a/src/probes/Kbuild
-+++ b/src/probes/Kbuild
-@@ -167,22 +167,24 @@ ifneq ($(CONFIG_BTRFS_FS),)
-   endif # $(wildcard $(btrfs_dep))
- endif # CONFIG_BTRFS_FS
- 
--# A dependency on internal header 'mm/internal.h' was introduced in v5.18
--compaction_dep = $(srctree)/mm/internal.h
--compaction_dep_wildcard = $(wildcard $(compaction_dep))
--compaction_dep_check = $(shell \
--if [ \( $(VERSION) -ge 6 \
--   -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
--   -z "$(compaction_dep_wildcard)" ] ; then \
--  echo "warn" ; \
--else \
--  echo "ok" ; \
--fi ;)
--ifeq ($(compaction_dep_check),ok)
--  obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
--else
--  $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
--endif # $(wildcard $(compaction_dep))
-+ifneq ($(CONFIG_COMPACTION),)
-+  # A dependency on internal header 'mm/internal.h' was introduced in v5.18
-+  compaction_dep = $(srctree)/mm/internal.h
-+  compaction_dep_wildcard = $(wildcard $(compaction_dep))
-+  compaction_dep_check = $(shell \
-+  if [ \( $(VERSION) -ge 6 \
-+     -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) -a \
-+     -z "$(compaction_dep_wildcard)" ] ; then \
-+    echo "warn" ; \
-+  else \
-+    echo "ok" ; \
-+  fi ;)
-+  ifeq ($(compaction_dep_check),ok)
-+    obj-$(CONFIG_LTTNG) += lttng-probe-compaction.o
-+  else
-+    $(warning Files $(compaction_dep) not found. Probe "compaction" is disabled. Use full kernel source tree to enable it.)
-+  endif # $(wildcard $(compaction_dep))
-+endif # CONFIG_COMPACTION
- 
- ifneq ($(CONFIG_EXT4_FS),)
-   ext4_dep = $(srctree)/fs/ext4/*.h
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
deleted file mode 100644
index 62376806c8..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 8d5da4d2a3d7d9173208f4e8dc7a709f0bfc9820 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 8 Jun 2022 12:56:36 -0400
-Subject: [PATCH 1/3] fix: mm/page_alloc: fix tracepoint
- mm_page_alloc_zone_locked() (v5.19)
-
-See upstream commit :
-
-  commit 10e0f7530205799e7e971aba699a7cb3a47456de
-  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
-  Date:   Thu May 19 14:08:54 2022 -0700
-
-    mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked()
-
-    Currently, trace point mm_page_alloc_zone_locked() doesn't show correct
-    information.
-
-    First, when alloc_flag has ALLOC_HARDER/ALLOC_CMA, page can be allocated
-    from MIGRATE_HIGHATOMIC/MIGRATE_CMA.  Nevertheless, tracepoint use
-    requested migration type not MIGRATE_HIGHATOMIC and MIGRATE_CMA.
-
-    Second, after commit 44042b4498728 ("mm/page_alloc: allow high-order pages
-    to be stored on the per-cpu lists") percpu-list can store high order
-    pages.  But trace point determine whether it is a refiil of percpu-list by
-    comparing requested order and 0.
-
-    To handle these problems, make mm_page_alloc_zone_locked() only be called
-    by __rmqueue_smallest with correct migration type.  With a new argument
-    called percpu_refill, it can show roughly whether it is a refill of
-    percpu-list.
-
-Upstream-Status: Backport
-
-Change-Id: I2e4a57393757f12b9c5a4566c4d1102ee2474a09
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/kmem.h | 45 +++++++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
-index 29c0fb7f..8c19e962 100644
---- a/include/instrumentation/events/kmem.h
-+++ b/include/instrumentation/events/kmem.h
-@@ -218,6 +218,50 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_alloc, kmem_mm_page_alloc,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
-+
-+	TP_PROTO(struct page *page, unsigned int order, int migratetype,
-+			int percpu_refill),
-+
-+	TP_ARGS(page, order, migratetype, percpu_refill),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(struct page *, page, page)
-+		ctf_integer(unsigned long, pfn,
-+			page ? page_to_pfn(page) : -1UL)
-+		ctf_integer(unsigned int, order, order)
-+		ctf_integer(int, migratetype, migratetype)
-+		ctf_integer(int, percpu_refill, percpu_refill)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_alloc_zone_locked,
-+
-+	kmem_mm_page_alloc_zone_locked,
-+
-+	TP_PROTO(struct page *page, unsigned int order, int migratetype,
-+			int percpu_refill),
-+
-+	TP_ARGS(page, order, migratetype, percpu_refill)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_MAP(mm_page_pcpu_drain,
-+
-+	kmem_mm_page_pcpu_drain,
-+
-+	TP_PROTO(struct page *page, unsigned int order, int migratetype),
-+
-+	TP_ARGS(page, order, migratetype),
-+
-+	TP_FIELDS(
-+		ctf_integer(unsigned long, pfn,
-+			page ? page_to_pfn(page) : -1UL)
-+		ctf_integer(unsigned int, order, order)
-+		ctf_integer(int, migratetype, migratetype)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
- 
- 	TP_PROTO(struct page *page, unsigned int order, int migratetype),
-@@ -250,6 +294,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_pcpu_drain,
- 
- 	TP_ARGS(page, order, migratetype)
- )
-+#endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,19,2)	\
- 	|| LTTNG_KERNEL_RANGE(3,14,36, 3,15,0)		\
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
deleted file mode 100644
index ca6abea9c0..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d8254360c7f2ff9b3f945e9668d89c0b56b9bd91 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Fri, 29 Jul 2022 15:37:43 -0400
-Subject: [PATCH] fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
-
-See upstream commit :
-
-  commit c504e5c2f9648a1e5c2be01e8c3f59d394192bd3
-  Author: Menglong Dong <imagedong@tencent.com>
-  Date:   Sun Jan 9 14:36:26 2022 +0800
-
-    net: skb: introduce kfree_skb_reason()
-
-    Introduce the interface kfree_skb_reason(), which is able to pass
-    the reason why the skb is dropped to 'kfree_skb' tracepoint.
-
-    Add the 'reason' field to 'trace_kfree_skb', therefor user can get
-    more detail information about abnormal skb with 'drop_monitor' or
-    eBPF.
-
-    All drop reasons are defined in the enum 'skb_drop_reason', and
-    they will be print as string in 'kfree_skb' tracepoint in format
-    of 'reason: XXX'.
-
-    ( Maybe the reasons should be defined in a uapi header file, so that
-    user space can use them? )
-
-Upstream-Status: Backport
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ib3c039207739dad10f097cf76474e0822e351273
----
- include/instrumentation/events/skb.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
-index 237e54ad..186732ea 100644
---- a/include/instrumentation/events/skb.h
-+++ b/include/instrumentation/events/skb.h
-@@ -13,7 +13,9 @@
- /*
-  * Tracepoint for free an sk_buff:
-  */
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0) \
-+	|| LTTNG_KERNEL_RANGE(5,15,58, 5,16,0))
-+
- LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
- 	TP_ENUM_VALUES(
- 		ctf_enum_value("NOT_SPECIFIED",	SKB_DROP_REASON_NOT_SPECIFIED)
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
deleted file mode 100644
index 84c97d5f90..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From b5d1c38665cd69d7d1c94231fe0609da5c8afbc3 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 8 Jun 2022 13:07:59 -0400
-Subject: [PATCH 2/3] fix: fs: Remove flags parameter from aops->write_begin
- (v5.19)
-
-See upstream commit :
-
-  commit 9d6b0cd7579844761ed68926eb3073bab1dca87b
-  Author: Matthew Wilcox (Oracle) <willy@infradead.org>
-  Date:   Tue Feb 22 14:31:43 2022 -0500
-
-    fs: Remove flags parameter from aops->write_begin
-
-    There are no more aop flags left, so remove the parameter.
-
-Upstream-Status: Backport
-
-Change-Id: I82725b93e13d749f52a631b2ac60df81a5e839f8
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/ext4.h | 30 +++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
-
-diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
-index 513762c0..222416ec 100644
---- a/include/instrumentation/events/ext4.h
-+++ b/include/instrumentation/events/ext4.h
-@@ -122,6 +122,35 @@ LTTNG_TRACEPOINT_EVENT(ext4_begin_ordered_truncate,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
-+
-+	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
-+
-+	TP_ARGS(inode, pos, len),
-+
-+	TP_FIELDS(
-+		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
-+		ctf_integer(ino_t, ino, inode->i_ino)
-+		ctf_integer(loff_t, pos, pos)
-+		ctf_integer(unsigned int, len, len)
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_write_begin,
-+
-+	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
-+
-+	TP_ARGS(inode, pos, len)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
-+
-+	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
-+
-+	TP_ARGS(inode, pos, len)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
- 
- 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
-@@ -153,6 +182,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
- 
- 	TP_ARGS(inode, pos, len, flags)
- )
-+#endif
- 
- LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_end,
- 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
deleted file mode 100644
index 63f9c40d92..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 526f13c844cd29f89bd3e924867d9ddfe3c40ade Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 15 Jun 2022 12:07:16 -0400
-Subject: [PATCH 3/3] fix: workqueue: Fix type of cpu in trace event (v5.19)
-
-See upstream commit :
-
-  commit 873a400938b31a1e443c4d94b560b78300787540
-  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
-  Date:   Wed May 4 11:32:03 2022 +0900
-
-    workqueue: Fix type of cpu in trace event
-
-    The trace event "workqueue_queue_work" use unsigned int type for
-    req_cpu, cpu. This casue confusing cpu number like below log.
-
-    $ cat /sys/kernel/debug/tracing/trace
-    cat-317  [001] ...: workqueue_queue_work: ... req_cpu=8192 cpu=4294967295
-
-    So, change unsigned type to signed type in the trace event. After
-    applying this patch, cpu number will be printed as -1 instead of
-    4294967295 as folllows.
-
-    $ cat /sys/kernel/debug/tracing/trace
-    cat-1338  [002] ...: workqueue_queue_work: ... req_cpu=8192 cpu=-1
-
-Upstream-Status: Backport
-
-Change-Id: I478083c350b6ec314d87e9159dc5b342b96daed7
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/workqueue.h | 49 ++++++++++++++++++++--
- 1 file changed, 46 insertions(+), 3 deletions(-)
-
-diff --git a/include/instrumentation/events/workqueue.h b/include/instrumentation/events/workqueue.h
-index 023b65a8..5693cf89 100644
---- a/include/instrumentation/events/workqueue.h
-+++ b/include/instrumentation/events/workqueue.h
-@@ -28,10 +28,35 @@ LTTNG_TRACEPOINT_EVENT_CLASS(workqueue_work,
- 	)
- )
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
- /**
-  * workqueue_queue_work - called when a work gets queued
-  * @req_cpu:	the requested cpu
-- * @cwq:	pointer to struct cpu_workqueue_struct
-+ * @pwq:	pointer to struct pool_workqueue
-+ * @work:	pointer to struct work_struct
-+ *
-+ * This event occurs when a work is queued immediately or once a
-+ * delayed work is actually queued on a workqueue (ie: once the delay
-+ * has been reached).
-+ */
-+LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
-+
-+	TP_PROTO(int req_cpu, struct pool_workqueue *pwq,
-+		 struct work_struct *work),
-+
-+	TP_ARGS(req_cpu, pwq, work),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, work, work)
-+		ctf_integer_hex(void *, function, work->func)
-+		ctf_integer(int, req_cpu, req_cpu)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
-+/**
-+ * workqueue_queue_work - called when a work gets queued
-+ * @req_cpu:	the requested cpu
-+ * @pwq:	pointer to struct pool_workqueue
-  * @work:	pointer to struct work_struct
-  *
-  * This event occurs when a work is queued immediately or once a
-@@ -40,17 +65,34 @@ LTTNG_TRACEPOINT_EVENT_CLASS(workqueue_work,
-  */
- LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
- 
--#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
- 	TP_PROTO(unsigned int req_cpu, struct pool_workqueue *pwq,
- 		 struct work_struct *work),
- 
- 	TP_ARGS(req_cpu, pwq, work),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(void *, work, work)
-+		ctf_integer_hex(void *, function, work->func)
-+		ctf_integer(unsigned int, req_cpu, req_cpu)
-+	)
-+)
- #else
-+/**
-+ * workqueue_queue_work - called when a work gets queued
-+ * @req_cpu:	the requested cpu
-+ * @cwq:	pointer to struct cpu_workqueue_struct
-+ * @work:	pointer to struct work_struct
-+ *
-+ * This event occurs when a work is queued immediately or once a
-+ * delayed work is actually queued on a workqueue (ie: once the delay
-+ * has been reached).
-+ */
-+LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
-+
- 	TP_PROTO(unsigned int req_cpu, struct cpu_workqueue_struct *cwq,
- 		 struct work_struct *work),
- 
- 	TP_ARGS(req_cpu, cwq, work),
--#endif
- 
- 	TP_FIELDS(
- 		ctf_integer_hex(void *, work, work)
-@@ -58,6 +100,7 @@ LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
- 		ctf_integer(unsigned int, req_cpu, req_cpu)
- 	)
- )
-+#endif
- 
- /**
-  * workqueue_activate_work - called when a work gets activated
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
similarity index 76%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
index f60ab3b5f5..00095d6ab7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
@@ -11,17 +11,12 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
-           file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
-           file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
-           file://0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch \
-           file://0001-fix-compaction.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "6159d00e4e1d59546eec8d4a67e1aa39c1084ceb5e5afeb666eab4b8a5b5a9ee"
+SRC_URI[sha256sum] = "eceb3428d80e85a9f008425beb9526195c9f7f02b302f28add56df53aef3e708"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


