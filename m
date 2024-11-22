Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B65E6ADCB
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:18 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.35761.1732310831854128087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=karDr9Mx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-72467c35ddeso2776912b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310831; x=1732915631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnPhishKfvnqlQV51aDLwF4A2SLdVYRWstd0TnOPIGE=;
        b=karDr9MxlVExO2QeSLYVZkW5YX23oqKqv/Qu6JIN+sc+T7otdqDZtGMniHxJKTMxlA
         6y+FhHgOyKcRWNX8mAwHOvtKVrebAG1d6PSM416tWbhf9g1zVxj5nH1AGGTV+nKC1Erp
         hpe7hxBnuD5gInhIN5QkvXJ4Cu9vKxg2YxuUJGwmzv6k8c+BsYYOSioctxH5PUbUSbzF
         hU5Idhmm/8CPdPqr986MZgb4T+7uodwvlRdNuQHhzQMC0qnlS5cEkGYcX7MXKzvf8di+
         /ijdz2R/PX09HhIOpgNR62NHijr6NQZgeiyJdjXAKptFtSkW95nmi4ZR0t7aMwkeF8A8
         eqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310831; x=1732915631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnPhishKfvnqlQV51aDLwF4A2SLdVYRWstd0TnOPIGE=;
        b=A1NJZhDhDgsx1xM/I/G2EVuIbi4YaZR2Z6JTn/vlFExWhBjB2+L3GhWI4wyKMRbIpn
         d5zZreqonCqhLQuQVw+pQy12rZ8F8sns2+tzSBsPu4HRiGaMJUGqpUdMsMiaCQyAOxwt
         7rEp3FOOG2d1kqQwb5H0E4rgG/m77KoNWLU68j/Q1DF3ys91r59F7aq6Yzk1hUYd86AK
         K1orf3ELIsok2YNfFhQByqDe/A2ZQJVsxB+9sXrX6EQgfGt7i/YmPg0CrhN3Gr919Gv2
         mA3DVdRt4b4lGdpE5Mp+19E6bf4keE3ogHebgm/fKGLiTX8JZoKcNiVBbtQID4g5yWXv
         vzdw==
X-Gm-Message-State: AOJu0Yz5jcFsNdgE5nhhIrBdwgwYS429j0zEg10Fzxg05tdMJ3DqaHAy
	ITWTRx0E/sxN7prYX7ygsj7Ix29w32GLFn54KEHt8lnDNuwLTsGQDxJ1gDcOS4AUfQKMrL6nn//
	u
X-Gm-Gg: ASbGncvW+Q1uCi7eDU1iIlFcUmZ9YeVVR71YJmzp4Dv/z+mL7IJKhzfTWAaT7r13QNP
	t0OICmAWcgJU8IlSQmn4l3pSaBPyaLnlsRwRitVuzMqxJS8xsj2izodR06Wel5STu0TJj0RptTy
	yMrDcoekgPx4kTkednu6evnxNONd9WxfSHdorRBV+t8qg0u8IhyiQxQaPkRTckU1EJYsHVjFfrK
	j37SrRowjDfC57xHuZcGY+jurLIiycThPhYVhI=
X-Google-Smtp-Source: AGHT+IFyeD8WJTKI1oxIa7A9KK7N8y80Im8i+4ErvVIVvbnuptblIchHwAlYWv2dc5fJE72QGScU8Q==
X-Received: by 2002:a17:902:f693:b0:20c:7661:dc9a with SMTP id d9443c01a7336-2129fe097e6mr66873505ad.3.1732310831047;
        Fri, 22 Nov 2024 13:27:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/19] lttng-modules: fix build error after kernel update to 5.15.171
Date: Fri, 22 Nov 2024 13:26:34 -0800
Message-Id: <20010748cc532261d8477d03a740a2acb7f6df76.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207665

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

This patch fixes the following build error after kernel rebase.
lttng-modules-2.13.14/src/probes/../../include/lttng/define_trace.h:87,
lttng-modules-2.13.14/src/probes/../../include/instrumentation/events/kmem.h:576,
lttng-modules-2.13.14/src/probes/lttng-probe-kmem.c:35:
../../include/lttng/tracepoint-event-impl.h:133:6: error: conflicting types for 'trace_mm_page_alloc_zone_locked'; have 'void(struct page *, unsigned int,  int)'
133 | void trace_##_name(_proto);
    |      ^~~~~~
../../include/instrumentation/events/kmem.h:444:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
444 | LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_alloc_zone_locked,
    | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel-source/include/trace/events/kmem.h:9,
from lttng-modules-2.13.14/src/probes/lttng-probe-kmem.c:24:
kernel-source/include/linux/tracepoint.h:244:28: note: previous definition of 'trace_mm_page_alloc_zone_locked' with type 'void(struct page *, unsigned int,  int,  int)'
244 |         static inline void trace_##name(proto)                          \
    |                            ^~~~~~
kernel-source/include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
    |         ^~~~~~~~~~~~~~~
kernel-source/include/linux/tracepoint.h:539:9: note: in expansion of macro 'DECLARE_TRACE'
539 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
    |         ^~~~~~~~~~~~~
kernel-source/include/trace/events/kmem.h:259:1: note: in expansion of macro 'DEFINE_EVENT'
259 | DEFINE_EVENT(mm_page, mm_page_alloc_zone_locked,
    | ^~~~~~~~~~~~

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 61 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.14.bb            |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
new file mode 100644
index 0000000000..abcc519e81
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
@@ -0,0 +1,61 @@
+From 6479c4ae43e7a2096b97c800ece57defd0ba62b7 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 12 Nov 2024 11:19:23 -0500
+Subject: [PATCH] fix: mm/page_alloc: fix tracepoint
+ mm_page_alloc_zone_locked() (v5.15.171)
+
+See upstream backported commit:
+
+  commit 28e7a507196fefd119e7ca2286840f1a9aad5e8a
+  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
+  Date:   Thu May 19 14:08:54 2022 -0700
+
+    mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked()
+
+    [ Upstream commit 10e0f7530205799e7e971aba699a7cb3a47456de ]
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
+    Link: https://lkml.kernel.org/r/20220512025307.57924-1-vvghjk1234@gmail.com
+
+Change-Id: Ib76feb79d95e9f93c84c3aa1b946e57ac2e2666a
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://git.lttng.org/?p=lttng-modules.git;a=commit;h=6479c4ae43e7a2096b97c800ece57defd0ba62b7]
+
+Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
+---
+ include/instrumentation/events/kmem.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
+index 9a0f0bbf..96a5d9c2 100644
+--- a/include/instrumentation/events/kmem.h
++++ b/include/instrumentation/events/kmem.h
+@@ -381,6 +381,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_alloc, kmem_mm_page_alloc,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0) || \
++	LTTNG_KERNEL_RANGE(5,15,171, 5,16,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(5,14,0,163,0,0, 5,15,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index a3e29ab7b7..e8af0eca44 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -11,6 +11,7 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.34.1


