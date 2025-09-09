Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1EECAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:00:44 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.14100.1757426440976993006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 07:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WHX5DW8w;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-754f16d8feaso5291856d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757426440; x=1758031240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heU7c1ZeuskbMnc11Vjxpcry91fUNWh1yuHH8PcnGLU=;
        b=WHX5DW8wDYQKeXOh2YJwLAPFuH5x4UFVZcM0aALwikxine1RoG8vq9jGp8uMSZ/uTJ
         jqEZYJRoCfThXtouwk+yx6jXh5j43bQ8nSjQhqDc6WxfwbmrfrAjNbwnH+8zeG6PfD7B
         wqCFpkC68ppGZNKSBAezBLAkm3/DHcJ3UFhr5NuZNPvvbvzOUTkenR+FfU9j1i43IrLx
         kttcnx0ZKSjAmRpmDQ5TuAaVe7uDojCOKLdZuTZr+sWgZ0SJOLqr974DE4DhUJRd57+1
         BDCrEji5zfxcb0AlVhA1MjMZDQ+6Y0JqKlgBRDKQRieARzTbvgpjlGHccakqbGG65F7K
         kBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426440; x=1758031240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heU7c1ZeuskbMnc11Vjxpcry91fUNWh1yuHH8PcnGLU=;
        b=hRVRIfRqK1F+O5vdFbBfgDyJc7Vg/zSxTnvPgTrD+hUR3/jP/QuLmJjl7GO+hKbWZa
         EMsYiXwKVsFKVmTXOqgc4PEBDRmsOF0vNie31c7bWjVgaizgdld/UMyiEEvvpKEF8lBx
         kVA8ROQ0blwKPx487MxStKmC2NieKziGZPBKvrlJjz8MH5sm6vTL+JztH9HodAymAfk/
         g8hubZwvzlh/Tx2B2DcGFaAI4KKi2D5IhL90GYCoNXcpReaI2XkWAYCBSnfSkhFPxuIm
         NMEXRrXsydlnpEaX+bGRBiybJm2fRq5SrxqHXgUciVW5gOy5PwikqHNOIOSIrWTt5YxR
         7FRw==
X-Gm-Message-State: AOJu0YxApXd+meFUq4fG74smDVSIaYGseTGDlUb3u9zYBoyR3IBoDyjz
	oMU427Tr//z0WtSdGHViz1+HnxhRzQ/WZnzHPVPH9NYcW++gy+xn6lu7kFPlsetr
X-Gm-Gg: ASbGncswkN5elic1Rgv8R3QmGgjCM0jlz79kzf6dEHxWIF99qnzMQ/VnjBPSK4jPJty
	rlVPV+d+hRbaU8msAcORFP4Rl1ipcmN+57mPWMzaw4rW9XZTdEQFqg7mTwZRfA5Z/sKO8Jroka2
	CrQlG2Mbzzy6hhVkoztXT3TFBwYpPsd3rYb6TmzjVbtgCg9kuB1+h7uiuTOgkcN3sBQYpP+oEd6
	/XSE9foDgujIRF1Ad//5ggr+xCTj8ejR9YckgJMn5fNl2GQegtCUndBJgN907cQt0XlQRey0Pkn
	ls7MVNJUVBbI+n+q5eERsZUkUpv+f3n1nFT3jCbGsYZQLgAdrmfd0YQ7eTYl/g4S7FoZQ16eOFZ
	b/pXtufzOxvWPF6uiqLDKVD9flgGRsIDfiZQctjlWMuIFtGQJkQzr55b6dPQGhJi8wO1M9VuUDc
	T1xJn1sj9VC35giCC+ki6mfIIpH2gTeB87nlFBm9LBuQA9wuqqO9docxQ=
X-Google-Smtp-Source: AGHT+IHoyhFvLqZaoDiTepuoGNbsaq534qPSfDzg103ts7JCU5j/sURsoRdyleGG0vo8KAyT6QcHIQ==
X-Received: by 2002:a05:6214:1246:b0:70f:a5ac:2523 with SMTP id 6a1803df08f44-73921b3a533mr132642136d6.8.1757426438719;
        Tue, 09 Sep 2025 07:00:38 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-725d0f4775csm118422906d6.73.2025.09.09.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:00:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: update to v2.14.1
Date: Tue,  9 Sep 2025 10:00:36 -0400
Message-Id: <20250909140036.3994152-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 14:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223112

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping lttng-modules to the next -stable release as this fixes the
build against the latest 6.16-stable kernels.

We drop two patches that were previously backported, but are now
part of the release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...mentation-Add-missing-provider-name-.patch |  45 --
 ...pose-__percpu-tag-as-a-named-address.patch | 438 ------------------
 ...ules_2.14.0.bb => lttng-modules_2.14.1.bb} |   4 +-
 3 files changed, 1 insertion(+), 486 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-writeback-instrumentation-Add-missing-provider-name-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-percpu-repurpose-__percpu-tag-as-a-named-address.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.0.bb => lttng-modules_2.14.1.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-writeback-instrumentation-Add-missing-provider-name-.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-writeback-instrumentation-Add-missing-provider-name-.patch
deleted file mode 100644
index 2afad7084b..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-writeback-instrumentation-Add-missing-provider-name-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 039dbff4ba95eca58f8ebbcf1640a46b482c24e0 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Fri, 4 Jul 2025 11:34:45 -0400
-Subject: [PATCH 1/2] writeback instrumentation: Add missing provider name
- prefix
-
-The events folio_wait_writeback and wait_on_page_writeback do not have
-the writeback event name prefix mandated by the sanity check in
-lttng_kernel_probe_register, which trigger a console warning.
-
-Change those event names to provide the relevant provider name prefix.
-
-Upstream-Status: Backport [commit 039dbff4]
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ia069e2dac4a373170e059792a947cffb6c956cb2
----
- include/instrumentation/events/writeback.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/instrumentation/events/writeback.h b/include/instrumentation/events/writeback.h
-index d694e323..b9e26b5b 100644
---- a/include/instrumentation/events/writeback.h
-+++ b/include/instrumentation/events/writeback.h
-@@ -122,7 +122,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_folio_template, writeback_dirty_folio,
- 	TP_ARGS(folio, mapping)
- )
- 
--LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_folio_template, folio_wait_writeback,
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_folio_template, writeback_folio_wait,
- 
- 	TP_PROTO(struct folio *folio, struct address_space *mapping),
- 
-@@ -150,7 +150,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_page_template, writeback_dirty_page,
- 	TP_ARGS(page, mapping)
- )
- 
--LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_page_template, wait_on_page_writeback,
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(writeback_page_template, writeback_wait_on_page,
- 
- 	TP_PROTO(struct page *page, struct address_space *mapping),
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-percpu-repurpose-__percpu-tag-as-a-named-address.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-percpu-repurpose-__percpu-tag-as-a-named-address.patch
deleted file mode 100644
index 26d16c2cb8..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-percpu-repurpose-__percpu-tag-as-a-named-address.patch
+++ /dev/null
@@ -1,438 +0,0 @@
-From 243dbd5c83fd647144b4e6f4e6e01e9e59fe910f Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Tue, 29 Jul 2025 15:34:23 -0400
-Subject: [PATCH 2/2] fix: percpu: repurpose __percpu tag as a named address
- space qualifier (v6.15)
-
-The '__percpu' annotation was repurposed as a named address space
-qualifier, with compilers supporting 'typeof_unqual' like GCC 14 and
-Clang 19 this is now enforced at build time.
-
-See upstream commits:
-
-  commit 6cea5ae714ba47ea4807d15903baca9857a450e6
-  Author: Uros Bizjak <ubizjak@gmail.com>
-  Date:   Mon Jan 27 17:05:09 2025 +0100
-
-    percpu: repurpose __percpu tag as a named address space qualifier
-
-    The patch introduces __percpu_qual define and repurposes __percpu tag as a
-    named address space qualifier using the new define.
-
-    Arches can now conditionally define __percpu_qual as their named address
-    space qualifier for percpu variables.
-
-  commit 6a367577153acd9b432a5340fb10891eeb7e10f1
-  Author: Uros Bizjak <ubizjak@gmail.com>
-  Date:   Mon Jan 27 17:05:10 2025 +0100
-
-    percpu/x86: enable strict percpu checks via named AS qualifiers
-
-    This patch declares percpu variables in __seg_gs/__seg_fs named AS and
-    keeps them named AS qualified until they are dereferenced with percpu
-    accessor.  This approach enables various compiler check for
-    cross-namespace variable assignments.
-
-Upstream-Status: Backport [commit 243dbd5c]
-
-Change-Id: Ib212cb4ef077da994867f0541921529dd4a799a0
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/ringbuffer/backend_types.h            |  5 ++-
- include/ringbuffer/frontend_api.h             |  4 +-
- src/lib/ringbuffer/ring_buffer_backend.c      | 30 +++++++-------
- src/lib/ringbuffer/ring_buffer_frontend.c     | 40 +++++++++----------
- src/lib/ringbuffer/ring_buffer_iterator.c     |  8 ++--
- src/lttng-context-callstack.c                 |  2 +-
- src/lttng-ring-buffer-event-notifier-client.h |  2 +-
- src/lttng-ring-buffer-metadata-client.h       |  2 +-
- 8 files changed, 48 insertions(+), 45 deletions(-)
-
-diff --git a/include/ringbuffer/backend_types.h b/include/ringbuffer/backend_types.h
-index c23889ea..caafe4da 100644
---- a/include/ringbuffer/backend_types.h
-+++ b/include/ringbuffer/backend_types.h
-@@ -79,7 +79,10 @@ struct channel_backend {
- 					 */
- 	unsigned int buf_size_order;	/* Order of buffer size */
- 	unsigned int extra_reader_sb:1;	/* has extra reader subbuffer ? */
--	struct lttng_kernel_ring_buffer *buf;	/* Channel per-cpu buffers */
-+	union {
-+		struct lttng_kernel_ring_buffer *global_buf;	/* Channel global buffer */
-+		struct lttng_kernel_ring_buffer __percpu *percpu_buf;	/* Channel per-cpu buffers */
-+	};
- 
- 	unsigned long num_subbuf;	/* Number of sub-buffers for writer */
- 	u64 start_timestamp;		/* Channel creation timestamp value */
-diff --git a/include/ringbuffer/frontend_api.h b/include/ringbuffer/frontend_api.h
-index e8d77d95..a0319c98 100644
---- a/include/ringbuffer/frontend_api.h
-+++ b/include/ringbuffer/frontend_api.h
-@@ -153,9 +153,9 @@ int lib_ring_buffer_reserve(const struct lttng_kernel_ring_buffer_config *config
- 		return -EAGAIN;
- 
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU)
--		buf = per_cpu_ptr(chan->backend.buf, ctx->priv.reserve_cpu);
-+		buf = per_cpu_ptr(chan->backend.percpu_buf, ctx->priv.reserve_cpu);
- 	else
--		buf = chan->backend.buf;
-+		buf = chan->backend.global_buf;
- 	if (unlikely(atomic_read(&buf->record_disabled)))
- 		return -EAGAIN;
- 	ctx->priv.buf = buf;
-diff --git a/src/lib/ringbuffer/ring_buffer_backend.c b/src/lib/ringbuffer/ring_buffer_backend.c
-index 3eaa1b96..b5ecde4d 100644
---- a/src/lib/ringbuffer/ring_buffer_backend.c
-+++ b/src/lib/ringbuffer/ring_buffer_backend.c
-@@ -279,7 +279,7 @@ int lttng_cpuhp_rb_backend_prepare(unsigned int cpu,
- 
- 	CHAN_WARN_ON(chanb, config->alloc == RING_BUFFER_ALLOC_PER_CHANNEL);
- 
--	buf = per_cpu_ptr(chanb->buf, cpu);
-+	buf = per_cpu_ptr(chanb->percpu_buf, cpu);
- 	ret = lib_ring_buffer_create(buf, chanb, cpu);
- 	if (ret) {
- 		printk(KERN_ERR
-@@ -320,7 +320,7 @@ int lib_ring_buffer_cpu_hp_callback(struct notifier_block *nb,
- 	switch (action) {
- 	case CPU_UP_PREPARE:
- 	case CPU_UP_PREPARE_FROZEN:
--		buf = per_cpu_ptr(chanb->buf, cpu);
-+		buf = per_cpu_ptr(chanb->percpu_buf, cpu);
- 		ret = lib_ring_buffer_create(buf, chanb, cpu);
- 		if (ret) {
- 			printk(KERN_ERR
-@@ -415,8 +415,8 @@ int channel_backend_init(struct channel_backend *chanb,
- 
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU) {
- 		/* Allocating the buffer per-cpu structures */
--		chanb->buf = alloc_percpu(struct lttng_kernel_ring_buffer);
--		if (!chanb->buf)
-+		chanb->percpu_buf = alloc_percpu(struct lttng_kernel_ring_buffer);
-+		if (!chanb->percpu_buf)
- 			goto free_cpumask;
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,10,0))
-@@ -447,7 +447,7 @@ int channel_backend_init(struct channel_backend *chanb,
- 
- 			lttng_cpus_read_lock();
- 			for_each_online_cpu(i) {
--				ret = lib_ring_buffer_create(per_cpu_ptr(chanb->buf, i),
-+				ret = lib_ring_buffer_create(per_cpu_ptr(chanb->percpu_buf, i),
- 							 chanb, i);
- 				if (ret)
- 					goto free_bufs;	/* cpu hotplug locked */
-@@ -455,7 +455,7 @@ int channel_backend_init(struct channel_backend *chanb,
- 			lttng_cpus_read_unlock();
- #else
- 			for_each_possible_cpu(i) {
--				ret = lib_ring_buffer_create(per_cpu_ptr(chanb->buf, i),
-+				ret = lib_ring_buffer_create(per_cpu_ptr(chanb->percpu_buf, i),
- 							 chanb, i);
- 				if (ret)
- 					goto free_bufs;
-@@ -464,10 +464,10 @@ int channel_backend_init(struct channel_backend *chanb,
- 		}
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,10,0)) */
- 	} else {
--		chanb->buf = kzalloc(sizeof(struct lttng_kernel_ring_buffer), GFP_KERNEL);
--		if (!chanb->buf)
-+		chanb->global_buf = kzalloc(sizeof(struct lttng_kernel_ring_buffer), GFP_KERNEL);
-+		if (!chanb->global_buf)
- 			goto free_cpumask;
--		ret = lib_ring_buffer_create(chanb->buf, chanb, -1);
-+		ret = lib_ring_buffer_create(chanb->global_buf, chanb, -1);
- 		if (ret)
- 			goto free_bufs;
- 	}
-@@ -491,15 +491,15 @@ free_bufs:
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,10,0)) */
- 		for_each_possible_cpu(i) {
- 			struct lttng_kernel_ring_buffer *buf =
--				per_cpu_ptr(chanb->buf, i);
-+				per_cpu_ptr(chanb->percpu_buf, i);
- 
- 			if (!buf->backend.allocated)
- 				continue;
- 			lib_ring_buffer_free(buf);
- 		}
--		free_percpu(chanb->buf);
-+		free_percpu(chanb->percpu_buf);
- 	} else
--		kfree(chanb->buf);
-+		kfree(chanb->global_buf);
- free_cpumask:
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU)
- 		free_cpumask_var(chanb->cpumask);
-@@ -542,16 +542,16 @@ void channel_backend_free(struct channel_backend *chanb)
- 
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU) {
- 		for_each_possible_cpu(i) {
--			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chanb->buf, i);
-+			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chanb->percpu_buf, i);
- 
- 			if (!buf->backend.allocated)
- 				continue;
- 			lib_ring_buffer_free(buf);
- 		}
- 		free_cpumask_var(chanb->cpumask);
--		free_percpu(chanb->buf);
-+		free_percpu(chanb->percpu_buf);
- 	} else {
--		struct lttng_kernel_ring_buffer *buf = chanb->buf;
-+		struct lttng_kernel_ring_buffer *buf = chanb->global_buf;
- 
- 		CHAN_WARN_ON(chanb, !buf->backend.allocated);
- 		lib_ring_buffer_free(buf);
-diff --git a/src/lib/ringbuffer/ring_buffer_frontend.c b/src/lib/ringbuffer/ring_buffer_frontend.c
-index 1ed9dc47..f9def043 100644
---- a/src/lib/ringbuffer/ring_buffer_frontend.c
-+++ b/src/lib/ringbuffer/ring_buffer_frontend.c
-@@ -505,7 +505,7 @@ int lttng_cpuhp_rb_frontend_dead(unsigned int cpu,
- {
- 	struct lttng_kernel_ring_buffer_channel *chan = container_of(node, struct lttng_kernel_ring_buffer_channel,
- 					    cpuhp_prepare);
--	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf, cpu);
-+	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	CHAN_WARN_ON(chan, config->alloc == RING_BUFFER_ALLOC_PER_CHANNEL);
-@@ -526,7 +526,7 @@ int lttng_cpuhp_rb_frontend_online(unsigned int cpu,
- {
- 	struct lttng_kernel_ring_buffer_channel *chan = container_of(node, struct lttng_kernel_ring_buffer_channel,
- 					    cpuhp_online);
--	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf, cpu);
-+	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	CHAN_WARN_ON(chan, config->alloc == RING_BUFFER_ALLOC_PER_CHANNEL);
-@@ -543,7 +543,7 @@ int lttng_cpuhp_rb_frontend_offline(unsigned int cpu,
- {
- 	struct lttng_kernel_ring_buffer_channel *chan = container_of(node, struct lttng_kernel_ring_buffer_channel,
- 					    cpuhp_online);
--	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf, cpu);
-+	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	CHAN_WARN_ON(chan, config->alloc == RING_BUFFER_ALLOC_PER_CHANNEL);
-@@ -574,7 +574,7 @@ int lib_ring_buffer_cpu_hp_callback(struct notifier_block *nb,
- 	unsigned int cpu = (unsigned long)hcpu;
- 	struct lttng_kernel_ring_buffer_channel *chan = container_of(nb, struct lttng_kernel_ring_buffer_channel,
- 					    cpu_hp_notifier);
--	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf, cpu);
-+	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	if (!chan->cpu_hp_enable)
-@@ -741,7 +741,7 @@ static void channel_unregister_notifiers(struct lttng_kernel_ring_buffer_channel
- 			lttng_cpus_read_lock();
- 			chan->cpu_hp_enable = 0;
- 			for_each_online_cpu(cpu) {
--				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 								      cpu);
- 				lib_ring_buffer_stop_switch_timer(buf);
- 				lib_ring_buffer_stop_read_timer(buf);
-@@ -750,7 +750,7 @@ static void channel_unregister_notifiers(struct lttng_kernel_ring_buffer_channel
- 			unregister_cpu_notifier(&chan->cpu_hp_notifier);
- #else
- 			for_each_possible_cpu(cpu) {
--				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 								      cpu);
- 				lib_ring_buffer_stop_switch_timer(buf);
- 				lib_ring_buffer_stop_read_timer(buf);
-@@ -759,7 +759,7 @@ static void channel_unregister_notifiers(struct lttng_kernel_ring_buffer_channel
- 		}
- #endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,10,0)) */
- 	} else {
--		struct lttng_kernel_ring_buffer *buf = chan->backend.buf;
-+		struct lttng_kernel_ring_buffer *buf = chan->backend.global_buf;
- 
- 		lib_ring_buffer_stop_switch_timer(buf);
- 		lib_ring_buffer_stop_read_timer(buf);
-@@ -788,14 +788,14 @@ void lib_ring_buffer_set_quiescent_channel(struct lttng_kernel_ring_buffer_chann
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU) {
- 		lttng_cpus_read_lock();
- 		for_each_channel_cpu(cpu, chan) {
--			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 							      cpu);
- 
- 			lib_ring_buffer_set_quiescent(buf);
- 		}
- 		lttng_cpus_read_unlock();
- 	} else {
--		struct lttng_kernel_ring_buffer *buf = chan->backend.buf;
-+		struct lttng_kernel_ring_buffer *buf = chan->backend.global_buf;
- 
- 		lib_ring_buffer_set_quiescent(buf);
- 	}
-@@ -810,14 +810,14 @@ void lib_ring_buffer_clear_quiescent_channel(struct lttng_kernel_ring_buffer_cha
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU) {
- 		lttng_cpus_read_lock();
- 		for_each_channel_cpu(cpu, chan) {
--			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 							      cpu);
- 
- 			lib_ring_buffer_clear_quiescent(buf);
- 		}
- 		lttng_cpus_read_unlock();
- 	} else {
--		struct lttng_kernel_ring_buffer *buf = chan->backend.buf;
-+		struct lttng_kernel_ring_buffer *buf = chan->backend.global_buf;
- 
- 		lib_ring_buffer_clear_quiescent(buf);
- 	}
-@@ -915,7 +915,7 @@ struct lttng_kernel_ring_buffer_channel *channel_create(const struct lttng_kerne
- 
- 			lttng_cpus_read_lock();
- 			for_each_online_cpu(cpu) {
--				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 								       cpu);
- 				spin_lock(&per_cpu(ring_buffer_nohz_lock, cpu));
- 				lib_ring_buffer_start_switch_timer(buf);
-@@ -926,7 +926,7 @@ struct lttng_kernel_ring_buffer_channel *channel_create(const struct lttng_kerne
- 			lttng_cpus_read_unlock();
- #else
- 			for_each_possible_cpu(cpu) {
--				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+				struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 								      cpu);
- 				spin_lock(&per_cpu(ring_buffer_nohz_lock, cpu));
- 				lib_ring_buffer_start_switch_timer(buf);
-@@ -947,7 +947,7 @@ struct lttng_kernel_ring_buffer_channel *channel_create(const struct lttng_kerne
- #endif /* defined(CONFIG_NO_HZ) && defined(CONFIG_LIB_RING_BUFFER) */
- 
- 	} else {
--		struct lttng_kernel_ring_buffer *buf = chan->backend.buf;
-+		struct lttng_kernel_ring_buffer *buf = chan->backend.global_buf;
- 
- 		lib_ring_buffer_start_switch_timer(buf);
- 		lib_ring_buffer_start_read_timer(buf);
-@@ -1004,7 +1004,7 @@ void *channel_destroy(struct lttng_kernel_ring_buffer_channel *chan)
- 		 * unregistered.
- 		 */
- 		for_each_channel_cpu(cpu, chan) {
--			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf,
-+			struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf,
- 							      cpu);
- 
- 			if (config->cb.buffer_finalize)
-@@ -1019,7 +1019,7 @@ void *channel_destroy(struct lttng_kernel_ring_buffer_channel *chan)
- 			wake_up_interruptible(&buf->read_wait);
- 		}
- 	} else {
--		struct lttng_kernel_ring_buffer *buf = chan->backend.buf;
-+		struct lttng_kernel_ring_buffer *buf = chan->backend.global_buf;
- 
- 		if (config->cb.buffer_finalize)
- 			config->cb.buffer_finalize(buf, chan->backend.priv, -1);
-@@ -1044,9 +1044,9 @@ struct lttng_kernel_ring_buffer *channel_get_ring_buffer(
- 					struct lttng_kernel_ring_buffer_channel *chan, int cpu)
- {
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CHANNEL)
--		return chan->backend.buf;
-+		return chan->backend.global_buf;
- 	else
--		return per_cpu_ptr(chan->backend.buf, cpu);
-+		return per_cpu_ptr(chan->backend.percpu_buf, cpu);
- }
- EXPORT_SYMBOL_GPL(channel_get_ring_buffer);
- 
-@@ -2271,9 +2271,9 @@ static struct lttng_kernel_ring_buffer *get_current_buf(struct lttng_kernel_ring
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU)
--		return per_cpu_ptr(chan->backend.buf, cpu);
-+		return per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	else
--		return chan->backend.buf;
-+		return chan->backend.global_buf;
- }
- 
- void lib_ring_buffer_lost_event_too_big(struct lttng_kernel_ring_buffer_channel *chan)
-diff --git a/src/lib/ringbuffer/ring_buffer_iterator.c b/src/lib/ringbuffer/ring_buffer_iterator.c
-index 88d79412..1a1db5e2 100644
---- a/src/lib/ringbuffer/ring_buffer_iterator.c
-+++ b/src/lib/ringbuffer/ring_buffer_iterator.c
-@@ -361,7 +361,7 @@ int lttng_cpuhp_rb_iter_online(unsigned int cpu,
- {
- 	struct lttng_kernel_ring_buffer_channel *chan = container_of(node, struct lttng_kernel_ring_buffer_channel,
- 					    cpuhp_iter_online);
--	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf, cpu);
-+	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	CHAN_WARN_ON(chan, config->alloc == RING_BUFFER_ALLOC_PER_CHANNEL);
-@@ -382,7 +382,7 @@ int channel_iterator_cpu_hotplug(struct notifier_block *nb,
- 	unsigned int cpu = (unsigned long)hcpu;
- 	struct lttng_kernel_ring_buffer_channel *chan = container_of(nb, struct lttng_kernel_ring_buffer_channel,
- 					    hp_iter_notifier);
--	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.buf, cpu);
-+	struct lttng_kernel_ring_buffer *buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 	const struct lttng_kernel_ring_buffer_config *config = &chan->backend.config;
- 
- 	if (!chan->hp_iter_enable)
-@@ -443,14 +443,14 @@ int channel_iterator_init(struct lttng_kernel_ring_buffer_channel *chan)
- 
- 			lttng_cpus_read_lock();
- 			for_each_online_cpu(cpu) {
--				buf = per_cpu_ptr(chan->backend.buf, cpu);
-+				buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 				lib_ring_buffer_iterator_init(chan, buf);
- 			}
- 			chan->hp_iter_enable = 1;
- 			lttng_cpus_read_unlock();
- #else
- 			for_each_possible_cpu(cpu) {
--				buf = per_cpu_ptr(chan->backend.buf, cpu);
-+				buf = per_cpu_ptr(chan->backend.percpu_buf, cpu);
- 				lib_ring_buffer_iterator_init(chan, buf);
- 			}
- #endif
-diff --git a/src/lttng-context-callstack.c b/src/lttng-context-callstack.c
-index 4385472e..c5910718 100644
---- a/src/lttng-context-callstack.c
-+++ b/src/lttng-context-callstack.c
-@@ -69,7 +69,7 @@ void field_data_free(struct field_data *fdata)
- }
- 
- static
--struct field_data __percpu *field_data_create(enum lttng_cs_ctx_modes mode)
-+struct field_data *field_data_create(enum lttng_cs_ctx_modes mode)
- {
- 	struct lttng_cs __percpu *cs_set;
- 	struct field_data *fdata;
-diff --git a/src/lttng-ring-buffer-event-notifier-client.h b/src/lttng-ring-buffer-event-notifier-client.h
-index 95deab46..b4145914 100644
---- a/src/lttng-ring-buffer-event-notifier-client.h
-+++ b/src/lttng-ring-buffer-event-notifier-client.h
-@@ -363,7 +363,7 @@ size_t lttng_packet_avail_size(struct lttng_kernel_ring_buffer_channel *chan)
- 	unsigned long o_begin;
- 	struct lttng_kernel_ring_buffer *buf;
- 
--	buf = chan->backend.buf;	/* Only for global buffer ! */
-+	buf = chan->backend.global_buf;	/* Only for global buffer ! */
- 	o_begin = v_read(&client_config, &buf->offset);
- 	if (subbuf_offset(o_begin, chan) != 0) {
- 		return chan->backend.subbuf_size - subbuf_offset(o_begin, chan);
-diff --git a/src/lttng-ring-buffer-metadata-client.h b/src/lttng-ring-buffer-metadata-client.h
-index 99158451..9ef73266 100644
---- a/src/lttng-ring-buffer-metadata-client.h
-+++ b/src/lttng-ring-buffer-metadata-client.h
-@@ -368,7 +368,7 @@ size_t lttng_packet_avail_size(struct lttng_kernel_ring_buffer_channel *chan)
- 	unsigned long o_begin;
- 	struct lttng_kernel_ring_buffer *buf;
- 
--	buf = chan->backend.buf;	/* Only for global buffer ! */
-+	buf = chan->backend.global_buf;	/* Only for global buffer ! */
- 	o_begin = v_read(&client_config, &buf->offset);
- 	if (subbuf_offset(o_begin, chan) != 0) {
- 		return chan->backend.subbuf_size - subbuf_offset(o_begin, chan);
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
index 6bbe1c5a19..3af6db5a83 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
@@ -10,14 +10,12 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-writeback-instrumentation-Add-missing-provider-name-.patch \
-           file://0002-fix-percpu-repurpose-__percpu-tag-as-a-named-address.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "f2261e738b1dd1027640e5ba3040dee292241b847d5745766b3ba640e168c94a"
+SRC_URI[sha256sum] = "a87684b8a58f426e9574c4aa7591d6e49d54469872f9641652df2b4a938f9a40"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.39.2


