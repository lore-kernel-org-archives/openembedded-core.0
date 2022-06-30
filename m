Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073D8C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:17:43 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.29695.1656616633853416694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JPMDH1+y;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id y14so628865qvs.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DxRpv6cxl3BvKOw0p4lOr/T0DZT4ytC6XsZSOQhWrpc=;
        b=JPMDH1+y7dOa+QQjG/XPmrK/FoxJ7GeyH2EwlMGDovcBt+Muh5G6avvaG6D7lGHHQx
         d/8OMTX59Xo58Ez3JX+ulZROswfXOziFx0dpqaIkHhujeQwQ56tjrb6N5BqVXQt+tDOn
         iLBflmfheUnnnXOD8kownVOZqTKOA6Pfh3AcHhJvGaFC6psTD79wBpmS516wVqgx5uPr
         Ev4uZeGrVcKYFXTTIvg7F5+FeY/emOm+Wfw6tvBZB63uIMIBIxPK7a205YdZ+rmfxvy0
         Gq3zKh8B1PMEQLwQ50b3TjGcJvPFhAkgjdO+uEWq+lYXD8PPc/KIgfbaZDCWR9bxv93E
         zMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DxRpv6cxl3BvKOw0p4lOr/T0DZT4ytC6XsZSOQhWrpc=;
        b=7FO7igXAtDbax/ZCNIWNVkkTruMXnJbU4lAUmFrktrjAjijOK833R6/lSdMGx191nb
         xziq5+mNbf+0bmeX/xdd/fUmhn63fRDFOSI0409WFHlrutlcRd/4ggH/OTw5fow6IsNu
         gGJEUOLM3GNW7n2RiolyCsKJjaQVeymB3YwshVAR+Viosui6iGXOsE8PyL2Safm621ra
         zxmbYMz5ZSMgI7Q9cg1TwfXYN/Oeg6RSa2cMrp1WZzpj+nahzceGWDLXGwUPyIsBN0R1
         jNaIFZMp1DI+P0O2g3nGzw475kT7U1daFmjxH3VQEW0m/rG0XHxuyyh2rstyyhuo5icy
         upWw==
X-Gm-Message-State: AJIora8VlWmkIZ3/pMWJZ8+Z7+xlEOR9ssSTG+lOMUaZrGcL3r7N4LtF
	gYRyfzvmZ4thnsZ2Yw/HFzNgtCm/4Wi/ig==
X-Google-Smtp-Source: 
 AGRyM1tKuD77c3lZZ9dbFAwfTjN5dx2ve++9TFBN8+v/JMafOfYpIqP8iQlq8hXTkAeoRz49VG7bcQ==
X-Received: by 2002:ad4:5bc7:0:b0:470:4d3b:2cea with SMTP id
 t7-20020ad45bc7000000b004704d3b2ceamr13106753qvt.38.1656616632690;
        Thu, 30 Jun 2022 12:17:12 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm15818291qkp.124.2022.06.30.12.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:17:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] lttng-modules: fix 5.19+ build
Date: Thu, 30 Jun 2022 15:16:55 -0400
Message-Id: 
 <a7871e7d8ae542812e890e59d6fa8a4d33209ee9.1656616115.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1656616115.git.bruce.ashfield@gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167441

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We need to backport three patches from the lttng upstream tree to
fix the build against 5.19+.

Obviously we'll drop these once the next lttng-modules release is
available.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 +++++++++++++++
 ...ags-parameter-from-aops-write_begin-.patch |  76 +++++++++++
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   3 +
 4 files changed, 309 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
new file mode 100644
index 0000000000..62376806c8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
@@ -0,0 +1,106 @@
+From 8d5da4d2a3d7d9173208f4e8dc7a709f0bfc9820 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 8 Jun 2022 12:56:36 -0400
+Subject: [PATCH 1/3] fix: mm/page_alloc: fix tracepoint
+ mm_page_alloc_zone_locked() (v5.19)
+
+See upstream commit :
+
+  commit 10e0f7530205799e7e971aba699a7cb3a47456de
+  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
+  Date:   Thu May 19 14:08:54 2022 -0700
+
+    mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked()
+
+    Currently, trace point mm_page_alloc_zone_locked() doesn't show correct
+    information.
+
+    First, when alloc_flag has ALLOC_HARDER/ALLOC_CMA, page can be allocated
+    from MIGRATE_HIGHATOMIC/MIGRATE_CMA.  Nevertheless, tracepoint use
+    requested migration type not MIGRATE_HIGHATOMIC and MIGRATE_CMA.
+
+    Second, after commit 44042b4498728 ("mm/page_alloc: allow high-order pages
+    to be stored on the per-cpu lists") percpu-list can store high order
+    pages.  But trace point determine whether it is a refiil of percpu-list by
+    comparing requested order and 0.
+
+    To handle these problems, make mm_page_alloc_zone_locked() only be called
+    by __rmqueue_smallest with correct migration type.  With a new argument
+    called percpu_refill, it can show roughly whether it is a refill of
+    percpu-list.
+
+Upstream-Status: Backport
+
+Change-Id: I2e4a57393757f12b9c5a4566c4d1102ee2474a09
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/kmem.h | 45 +++++++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
+index 29c0fb7f..8c19e962 100644
+--- a/include/instrumentation/events/kmem.h
++++ b/include/instrumentation/events/kmem.h
+@@ -218,6 +218,50 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_alloc, kmem_mm_page_alloc,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
++
++	TP_PROTO(struct page *page, unsigned int order, int migratetype,
++			int percpu_refill),
++
++	TP_ARGS(page, order, migratetype, percpu_refill),
++
++	TP_FIELDS(
++		ctf_integer_hex(struct page *, page, page)
++		ctf_integer(unsigned long, pfn,
++			page ? page_to_pfn(page) : -1UL)
++		ctf_integer(unsigned int, order, order)
++		ctf_integer(int, migratetype, migratetype)
++		ctf_integer(int, percpu_refill, percpu_refill)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_alloc_zone_locked,
++
++	kmem_mm_page_alloc_zone_locked,
++
++	TP_PROTO(struct page *page, unsigned int order, int migratetype,
++			int percpu_refill),
++
++	TP_ARGS(page, order, migratetype, percpu_refill)
++)
++
++LTTNG_TRACEPOINT_EVENT_MAP(mm_page_pcpu_drain,
++
++	kmem_mm_page_pcpu_drain,
++
++	TP_PROTO(struct page *page, unsigned int order, int migratetype),
++
++	TP_ARGS(page, order, migratetype),
++
++	TP_FIELDS(
++		ctf_integer(unsigned long, pfn,
++			page ? page_to_pfn(page) : -1UL)
++		ctf_integer(unsigned int, order, order)
++		ctf_integer(int, migratetype, migratetype)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
+ 
+ 	TP_PROTO(struct page *page, unsigned int order, int migratetype),
+@@ -250,6 +294,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_pcpu_drain,
+ 
+ 	TP_ARGS(page, order, migratetype)
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,19,2)	\
+ 	|| LTTNG_KERNEL_RANGE(3,14,36, 3,15,0)		\
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
new file mode 100644
index 0000000000..84c97d5f90
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
@@ -0,0 +1,76 @@
+From b5d1c38665cd69d7d1c94231fe0609da5c8afbc3 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 8 Jun 2022 13:07:59 -0400
+Subject: [PATCH 2/3] fix: fs: Remove flags parameter from aops->write_begin
+ (v5.19)
+
+See upstream commit :
+
+  commit 9d6b0cd7579844761ed68926eb3073bab1dca87b
+  Author: Matthew Wilcox (Oracle) <willy@infradead.org>
+  Date:   Tue Feb 22 14:31:43 2022 -0500
+
+    fs: Remove flags parameter from aops->write_begin
+
+    There are no more aop flags left, so remove the parameter.
+
+Upstream-Status: Backport
+
+Change-Id: I82725b93e13d749f52a631b2ac60df81a5e839f8
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/ext4.h | 30 +++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
+index 513762c0..222416ec 100644
+--- a/include/instrumentation/events/ext4.h
++++ b/include/instrumentation/events/ext4.h
+@@ -122,6 +122,35 @@ LTTNG_TRACEPOINT_EVENT(ext4_begin_ordered_truncate,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
++
++	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len),
++
++	TP_ARGS(inode, pos, len),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(loff_t, pos, pos)
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
++
++	TP_ARGS(inode, pos, len)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_begin,
+ 
+ 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
+@@ -153,6 +182,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__write_begin, ext4_da_write_begin,
+ 
+ 	TP_ARGS(inode, pos, len, flags)
+ )
++#endif
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(ext4__write_end,
+ 	TP_PROTO(struct inode *inode, loff_t pos, unsigned int len,
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
new file mode 100644
index 0000000000..63f9c40d92
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
@@ -0,0 +1,124 @@
+From 526f13c844cd29f89bd3e924867d9ddfe3c40ade Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 15 Jun 2022 12:07:16 -0400
+Subject: [PATCH 3/3] fix: workqueue: Fix type of cpu in trace event (v5.19)
+
+See upstream commit :
+
+  commit 873a400938b31a1e443c4d94b560b78300787540
+  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
+  Date:   Wed May 4 11:32:03 2022 +0900
+
+    workqueue: Fix type of cpu in trace event
+
+    The trace event "workqueue_queue_work" use unsigned int type for
+    req_cpu, cpu. This casue confusing cpu number like below log.
+
+    $ cat /sys/kernel/debug/tracing/trace
+    cat-317  [001] ...: workqueue_queue_work: ... req_cpu=8192 cpu=4294967295
+
+    So, change unsigned type to signed type in the trace event. After
+    applying this patch, cpu number will be printed as -1 instead of
+    4294967295 as folllows.
+
+    $ cat /sys/kernel/debug/tracing/trace
+    cat-1338  [002] ...: workqueue_queue_work: ... req_cpu=8192 cpu=-1
+
+Upstream-Status: Backport
+
+Change-Id: I478083c350b6ec314d87e9159dc5b342b96daed7
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/workqueue.h | 49 ++++++++++++++++++++--
+ 1 file changed, 46 insertions(+), 3 deletions(-)
+
+diff --git a/include/instrumentation/events/workqueue.h b/include/instrumentation/events/workqueue.h
+index 023b65a8..5693cf89 100644
+--- a/include/instrumentation/events/workqueue.h
++++ b/include/instrumentation/events/workqueue.h
+@@ -28,10 +28,35 @@ LTTNG_TRACEPOINT_EVENT_CLASS(workqueue_work,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0))
+ /**
+  * workqueue_queue_work - called when a work gets queued
+  * @req_cpu:	the requested cpu
+- * @cwq:	pointer to struct cpu_workqueue_struct
++ * @pwq:	pointer to struct pool_workqueue
++ * @work:	pointer to struct work_struct
++ *
++ * This event occurs when a work is queued immediately or once a
++ * delayed work is actually queued on a workqueue (ie: once the delay
++ * has been reached).
++ */
++LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
++
++	TP_PROTO(int req_cpu, struct pool_workqueue *pwq,
++		 struct work_struct *work),
++
++	TP_ARGS(req_cpu, pwq, work),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, work, work)
++		ctf_integer_hex(void *, function, work->func)
++		ctf_integer(int, req_cpu, req_cpu)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
++/**
++ * workqueue_queue_work - called when a work gets queued
++ * @req_cpu:	the requested cpu
++ * @pwq:	pointer to struct pool_workqueue
+  * @work:	pointer to struct work_struct
+  *
+  * This event occurs when a work is queued immediately or once a
+@@ -40,17 +65,34 @@ LTTNG_TRACEPOINT_EVENT_CLASS(workqueue_work,
+  */
+ LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,9,0))
+ 	TP_PROTO(unsigned int req_cpu, struct pool_workqueue *pwq,
+ 		 struct work_struct *work),
+ 
+ 	TP_ARGS(req_cpu, pwq, work),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, work, work)
++		ctf_integer_hex(void *, function, work->func)
++		ctf_integer(unsigned int, req_cpu, req_cpu)
++	)
++)
+ #else
++/**
++ * workqueue_queue_work - called when a work gets queued
++ * @req_cpu:	the requested cpu
++ * @cwq:	pointer to struct cpu_workqueue_struct
++ * @work:	pointer to struct work_struct
++ *
++ * This event occurs when a work is queued immediately or once a
++ * delayed work is actually queued on a workqueue (ie: once the delay
++ * has been reached).
++ */
++LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
++
+ 	TP_PROTO(unsigned int req_cpu, struct cpu_workqueue_struct *cwq,
+ 		 struct work_struct *work),
+ 
+ 	TP_ARGS(req_cpu, cwq, work),
+-#endif
+ 
+ 	TP_FIELDS(
+ 		ctf_integer_hex(void *, work, work)
+@@ -58,6 +100,7 @@ LTTNG_TRACEPOINT_EVENT(workqueue_queue_work,
+ 		ctf_integer(unsigned int, req_cpu, req_cpu)
+ 	)
+ )
++#endif
+ 
+ /**
+  * workqueue_activate_work - called when a work gets activated
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
index 90d48e5867..ea2ec3c380 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.4.bb
@@ -11,6 +11,9 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
+           file://0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch \
+           file://0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.19.1


