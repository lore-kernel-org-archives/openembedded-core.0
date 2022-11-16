Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B27C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:50 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.1229.1668559123720665513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G98Nhao2;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id x13so10941753qvn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0vAK0tyVC36KlH1cTs3PVysCFHmGCELX4jqEczJg8E=;
        b=G98Nhao2gcuNFohliR/rXqXMjmGVVyVKp8twDLBr8T6sx4ZhueojT4RXf/qJoDhaht
         Q4XWJt3pFWbsY/sOhqHEb9sfkj6pLc6hvgSstL86NKlVI4+AfIGhtj4KAixgqz5Kr+/A
         Vavo0yRw0qBG1UGhPgI1+d3WW1h/dNrUuXSbquvnc+kKvpCLpHdV7aH5qMmZoMp85F1A
         5FCJzJYqWs47Kw7rFPaespUahiwOpeHuCgSRoxvpwLZ1szyMkkhJHHhIqcGQE5H87Ggm
         CumWdpg/kg/OaKeNwTfSqJ3tPHh0fSzX7baqCJ+G1P+7LUx7BDbtwGLaBrrfaBg5BYMg
         Vshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0vAK0tyVC36KlH1cTs3PVysCFHmGCELX4jqEczJg8E=;
        b=XJDquL/2VZYt3yxPy2EjrYWXYuLKzcL7yaOu3h0b0sjYMZDYH+7/ccWJUvB4KK6S0k
         HGigE1uoXoIpO0WSdJgRQT4Il9Hux5uSm8xBvMFy6MA78N6d4aUF9Ro0Y+14sNjipAR5
         x/1AFJcyMNRPos9/jBNzuhgKoTV8eloB9g3QvXH0wZoEcaiRUe6P4036Gvj4IVqqR6pw
         8g14OPb+mLFTLInNOVv9WScZb2p3fBE9TMtbRfKY74ge5FwG2kVMjoTqCb9ApnF6VaOa
         m91lot5/D9xox7+PNO3iw6D/3lGPiB0UTFocUIy+0V/0/NMfo9pxxwFq9JpYmcxYZ8q3
         oiKQ==
X-Gm-Message-State: ANoB5pnvDzjITKOoZstrq7FrKjyxQVFN0X8un0aZAyGD6n8MVx21xgRd
	Yd26ydAfVQOt+059wAnaaDoIFv0cC5zCgw==
X-Google-Smtp-Source: AA0mqf6cbpmataNTSDrinb1KAxnYSD12Jt4wIA7Trc+PwHLjz1clRMB0EfLNhK3GaMyqWvd3To0VLg==
X-Received: by 2002:a05:6214:1744:b0:4bb:ee1f:ca57 with SMTP id dc4-20020a056214174400b004bbee1fca57mr19043105qvb.98.1668559122752;
        Tue, 15 Nov 2022 16:38:42 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] lttng-modules: fix build for v6.1+
Date: Tue, 15 Nov 2022 19:38:28 -0500
Message-Id: <f6cbf9be9c2661c2654264b7fa67e12c0bc4083a.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173373

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Backporting a patch from the lttng git repository to address
a build failure when the 6.1-dev kernel is used.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...on-drop-kmem_alloc-avoid-dereferenci.patch | 278 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.7.bb             |   1 +
 2 files changed, 279 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
new file mode 100644
index 0000000000..99402ea5e9
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
@@ -0,0 +1,278 @@
+From b977f96d0a414e76d4c544f65791919dde1bc57e Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 17 Oct 2022 13:49:51 -0400
+Subject: [PATCH] fix: mm/slab_common: drop kmem_alloc & avoid dereferencing
+ fields when not using (v6.1)
+
+See uptream commit:
+
+  commit 2c1d697fb8ba6d2d44f914d4268ae1ccdf025f1b
+  Author: Hyeonggon Yoo <42.hyeyoo@gmail.com>
+  Date:   Wed Aug 17 19:18:24 2022 +0900
+
+    mm/slab_common: drop kmem_alloc & avoid dereferencing fields when not using
+
+    Drop kmem_alloc event class, and define kmalloc and kmem_cache_alloc
+    using TRACE_EVENT() macro.
+
+    And then this patch does:
+       - Do not pass pointer to struct kmem_cache to trace_kmalloc.
+         gfp flag is enough to know if it's accounted or not.
+       - Avoid dereferencing s->object_size and s->size when not using kmem_cache_alloc event.
+       - Avoid dereferencing s->name in when not using kmem_cache_free event.
+       - Adjust s->size to SLOB_UNITS(s->size) * SLOB_UNIT in SLOB
+
+Upstream-Status: Backport [commit b977f96d0a414e76d4c544f]
+
+Change-Id: Icd7925731ed4a737699c3746cb7bb7760a4e8009
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/kmem.h | 156 ++++++++++++++++++--------
+ 1 file changed, 111 insertions(+), 45 deletions(-)
+
+diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
+index 219533a1..0f5bd8e6 100644
+--- a/include/instrumentation/events/kmem.h
++++ b/include/instrumentation/events/kmem.h
+@@ -10,9 +10,58 @@
+ #include <lttng/kernel-version.h>
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,0,0))
+-
+ #include <../../mm/slab.h>
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,1,0))
++LTTNG_TRACEPOINT_EVENT_MAP(kmalloc,
++
++	kmem_kmalloc,
++
++	TP_PROTO(unsigned long call_site,
++		 const void *ptr,
++		 size_t bytes_req,
++		 size_t bytes_alloc,
++		 gfp_t gfp_flags,
++		 int node),
++
++	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags, node),
++
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, call_site, call_site)
++		ctf_integer_hex(const void *, ptr, ptr)
++		ctf_integer(size_t, bytes_req, bytes_req)
++		ctf_integer(size_t, bytes_alloc, bytes_alloc)
++		ctf_integer(gfp_t, gfp_flags, gfp_flags)
++		ctf_integer(int, node, node)
++		ctf_integer(bool, accounted, (IS_ENABLED(CONFIG_MEMCG_KMEM) &&
++			(gfp_flags & __GFP_ACCOUNT) ? true : false))
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT(kmem_cache_alloc,
++
++	TP_PROTO(unsigned long call_site,
++		 const void *ptr,
++		 struct kmem_cache *s,
++		 gfp_t gfp_flags,
++		 int node),
++
++	TP_ARGS(call_site, ptr, s, gfp_flags, node),
+ 
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, call_site, call_site)
++		ctf_integer_hex(const void *, ptr, ptr)
++		ctf_integer(size_t, bytes_req, s->object_size)
++		ctf_integer(size_t, bytes_alloc, s->size)
++		ctf_integer(gfp_t, gfp_flags, gfp_flags)
++		ctf_integer(int, node, node)
++		ctf_integer(bool, accounted, IS_ENABLED(CONFIG_MEMCG_KMEM) ?
++			((gfp_flags & __GFP_ACCOUNT) ||
++			(s->flags & SLAB_ACCOUNT)) : false)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,0,0))
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
+ 
+ 	TP_PROTO(unsigned long call_site,
+@@ -53,18 +102,16 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc, kmem_cache_alloc,
+ 
+ 	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags)
+ )
+-
+-LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
++#else
++LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
+ 
+ 	TP_PROTO(unsigned long call_site,
+ 		 const void *ptr,
+-		 struct kmem_cache *s,
+ 		 size_t bytes_req,
+ 		 size_t bytes_alloc,
+-		 gfp_t gfp_flags,
+-		 int node),
++		 gfp_t gfp_flags),
+ 
+-	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node),
++	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer_hex(unsigned long, call_site, call_site)
+@@ -72,42 +119,40 @@ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
+ 		ctf_integer(size_t, bytes_req, bytes_req)
+ 		ctf_integer(size_t, bytes_alloc, bytes_alloc)
+ 		ctf_integer(gfp_t, gfp_flags, gfp_flags)
+-		ctf_integer(int, node, node)
+-		ctf_integer(bool, accounted, IS_ENABLED(CONFIG_MEMCG_KMEM) ?
+-			((gfp_flags & __GFP_ACCOUNT) ||
+-			(s && s->flags & SLAB_ACCOUNT)) : false)
+ 	)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc_node, kmalloc_node,
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc, kmalloc,
+ 
+-	kmem_kmalloc_node,
++	kmem_kmalloc,
+ 
+ 	TP_PROTO(unsigned long call_site, const void *ptr,
+-		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
+-		 gfp_t gfp_flags, int node),
++		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
+ 
+-	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
++	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
++LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc, kmem_cache_alloc,
+ 
+ 	TP_PROTO(unsigned long call_site, const void *ptr,
+-		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
+-		 gfp_t gfp_flags, int node),
++		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
+ 
+-	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
++	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
+ )
+-#else
+-LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
++#endif
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,0,0))
++LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
+ 
+ 	TP_PROTO(unsigned long call_site,
+ 		 const void *ptr,
++		 struct kmem_cache *s,
+ 		 size_t bytes_req,
+ 		 size_t bytes_alloc,
+-		 gfp_t gfp_flags),
++		 gfp_t gfp_flags,
++		 int node),
+ 
+-	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags),
++	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer_hex(unsigned long, call_site, call_site)
+@@ -115,27 +160,33 @@ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
+ 		ctf_integer(size_t, bytes_req, bytes_req)
+ 		ctf_integer(size_t, bytes_alloc, bytes_alloc)
+ 		ctf_integer(gfp_t, gfp_flags, gfp_flags)
++		ctf_integer(int, node, node)
++		ctf_integer(bool, accounted, IS_ENABLED(CONFIG_MEMCG_KMEM) ?
++			((gfp_flags & __GFP_ACCOUNT) ||
++			(s && s->flags & SLAB_ACCOUNT)) : false)
+ 	)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc, kmalloc,
++LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc_node, kmalloc_node,
+ 
+-	kmem_kmalloc,
++	kmem_kmalloc_node,
+ 
+ 	TP_PROTO(unsigned long call_site, const void *ptr,
+-		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
++		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
++		 gfp_t gfp_flags, int node),
+ 
+-	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
++	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
+ )
+ 
+-LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc, kmem_cache_alloc,
++LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
+ 
+ 	TP_PROTO(unsigned long call_site, const void *ptr,
+-		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
++		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
++		 gfp_t gfp_flags, int node),
+ 
+-	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
++	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
+ )
+-
++#else
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
+ 
+ 	TP_PROTO(unsigned long call_site,
+@@ -192,19 +243,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(kfree,
+ 		ctf_integer_hex(const void *, ptr, ptr)
+ 	)
+ )
+-
+-LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
+-
+-	TP_PROTO(unsigned long call_site, const void *ptr, const char *name),
+-
+-	TP_ARGS(call_site, ptr, name),
+-
+-	TP_FIELDS(
+-		ctf_integer_hex(unsigned long, call_site, call_site)
+-		ctf_integer_hex(const void *, ptr, ptr)
+-		ctf_string(name, name)
+-	)
+-)
+ #else
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_free,
+ 
+@@ -235,6 +273,34 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_free, kmem_cache_free,
+ )
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,1,0))
++LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
++
++	TP_PROTO(unsigned long call_site, const void *ptr, const struct kmem_cache *s),
++
++	TP_ARGS(call_site, ptr, s),
++
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, call_site, call_site)
++		ctf_integer_hex(const void *, ptr, ptr)
++		ctf_string(name, s->name)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0))
++LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
++
++	TP_PROTO(unsigned long call_site, const void *ptr, const char *name),
++
++	TP_ARGS(call_site, ptr, name),
++
++	TP_FIELDS(
++		ctf_integer_hex(unsigned long, call_site, call_site)
++		ctf_integer_hex(const void *, ptr, ptr)
++		ctf_string(name, name)
++	)
++)
++#endif
++
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,3,0))
+ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_free, kmem_mm_page_free,
+ #else
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
index 49c584dff4..d444f9ab0c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
@@ -11,6 +11,7 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch \ 
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.19.1


