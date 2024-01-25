Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881B5C46CD2
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 01:17:21 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.5767.1706145433940203163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 17:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=erT1aNYZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-783137d7fb4so414821885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706145433; x=1706750233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyY7dzgux+JV4lwR7tDgpTVAki3SPYF5V39Pnv2ECRU=;
        b=erT1aNYZeA+4i7A7AkDl8BYaBVf+RQA3rrxgPFAx0xgoId6ZZW4zCIUDZ7n3tQGd00
         gVwJ5tY12DbMEBYyzQBabwzDKA9YBjPsfRPwcWAbHoIMyn5QOmSpe9w2JY9cTHcjrXWZ
         7ww2fjfUBM8mhBGn8FZje2PSwl2dJiJxPuTFiVuRAyRB+CZiYj8UVhJaEB2YiM6bdyGL
         DICo4p5/6+ZbjCumjdb1QgP2LuTV3Z0cslWsXs2McTv+duvbJJ3SnWDjG2gw2V9ETzFN
         PTkzn0C4jJz5tgJJVjY7yRcKXLVUlKSeoolXCTjPtRigDjBtNgKsOCPeBL9L64+JMRVk
         2WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706145433; x=1706750233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyY7dzgux+JV4lwR7tDgpTVAki3SPYF5V39Pnv2ECRU=;
        b=iadTxAilYZQLibOpAYWgd6Sw2tTPsGA2HlfBVz+5Gjve98k+lqZFWjs8kqBbp38Y8F
         /2Pv3FDT+gboioGneePuKSl+IOWHfqTRlQxHznSGqxWygqEWH8uBuuB3v0ccvhfv5MLv
         ZFXjp2CXxpJTad/7GtUoQENhlLZSNsdS+pGepcusEaQ0X2//U8qWsvq13jmaQ69uSZgO
         Ejzct0H1QpJej5Ds/A3BIhLZm8RGqedKJsAHeAc+sKNJ3vZ7LahgR8zEQ5H89hkcYSTi
         zOJFP/rAzcvHvW1mlwNb00DOuRIPSTac1N2w9CW6rXIc2jtfp5s48eqXX100jfI2H+cH
         nqEQ==
X-Gm-Message-State: AOJu0YxzF78NwGT4oAsmmxFt7vcZP9qivAfr2y4aF5K8fVFpJ4/av83/
	z/ofN9E+PhrUsCOWsqUb/vbWfpfvjIVm+jRZdqqDK6+p8QEt8RoXZd7v/8qtlSy/yw==
X-Google-Smtp-Source: AGHT+IHGaiZL8e4gIGkfrQ2BXSFVTTjssKFdt60ufSVXAIVBArsz36eB1e0v0ewuOSHI0o2opoZzxg==
X-Received: by 2002:a05:620a:1a94:b0:77f:b027:8aba with SMTP id bl20-20020a05620a1a9400b0077fb0278abamr329233qkb.145.1706145432679;
        Wed, 24 Jan 2024 17:17:12 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id u1-20020a05620a084100b007834318c7absm4581049qku.79.2024.01.24.17.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:17:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-modules: fix v6.8+ build
Date: Wed, 24 Jan 2024 20:17:09 -0500
Message-Id: <20240125011710.1724977-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194303

From: Bruce Ashfield <bruce.ashfield@gmail.com>

linux-yocto-dev is updating to 6.8 and lttng-modules needs to be updated
to account for upsream kernel fixes.

These patches are all grabbed from the lttng review gerrit and
backported to lttng-modules 2.13.0.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...t_runtime-changed-in-linux-6.8.0-rc1.patch |  70 ++++++++++
 ...mer_start-changed-in-linux-6.8.0-rc1.patch | 100 ++++++++++++++
 ...-strlcopy-removed-in-linux-6.8.0-rc1.patch |  46 +++++++
 ...tracepoints-changed-in-linux-6.8.0-r.patch | 124 ++++++++++++++++++
 ...tent-flags-and-compress_type-changed.patch |  88 +++++++++++++
 .../lttng/lttng-modules_2.13.10.bb            |   7 +-
 6 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch
new file mode 100644
index 0000000000..a0d932c7b7
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch
@@ -0,0 +1,70 @@
+From 9e59c2f6387aeb832ae3af3095f987529722e08f Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 22 Jan 2024 11:10:37 -0500
+Subject: [PATCH 1/5] Fix: sched_stat_runtime changed in linux 6.8.0-rc1
+
+See upstream commit:
+
+    commit 5fe6ec8f6ab549b6422e41551abb51802bd48bc7
+    Author: Peter Zijlstra <peterz@infradead.org>
+    Date:   Mon Nov 6 13:41:43 2023 +0100
+
+        sched: Remove vruntime from trace_sched_stat_runtime()
+
+        Tracing the runtime delta makes sense, observer can sum over time.
+        Tracing the absolute vruntime makes less sense, inconsistent:
+        absolute-vs-delta, but also vruntime delta can be computed from
+        runtime delta.
+
+        Removing the vruntime thing also makes the two tracepoint sites
+        identical, allowing to unify the code in a later patch.
+
+Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
+
+Change-Id: I24ebb4e06dbb646a1af75ac62b74f3821ff197de
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/instrumentation/events/sched.h | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
+index 066a0f8..24cf37c 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -646,6 +646,24 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
+ 	     TP_ARGS(tsk, delay))
+ #endif
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++/*
++ * Tracepoint for accounting runtime (time the task is executing
++ * on a CPU).
++ */
++LTTNG_TRACEPOINT_EVENT(sched_stat_runtime,
++
++	TP_PROTO(struct task_struct *tsk, u64 runtime),
++
++	TP_ARGS(tsk, runtime),
++
++	TP_FIELDS(
++		ctf_array_text(char, comm, tsk->comm, TASK_COMM_LEN)
++		ctf_integer(pid_t, tid, tsk->pid)
++		ctf_integer(u64, runtime, runtime)
++	)
++)
++#else
+ /*
+  * Tracepoint for accounting runtime (time the task is executing
+  * on a CPU).
+@@ -663,6 +681,7 @@ LTTNG_TRACEPOINT_EVENT(sched_stat_runtime,
+ 		ctf_integer(u64, vruntime, vruntime)
+ 	)
+ )
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,12,0) || \
+ 	LTTNG_RT_KERNEL_RANGE(4,9,27,18, 4,10,0,0) || \
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch
new file mode 100644
index 0000000000..5a4294db02
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch
@@ -0,0 +1,100 @@
+From d52ab4b9a71a4bef535dadb8e7062112ac5c0c88 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 22 Jan 2024 11:33:39 -0500
+Subject: [PATCH 2/5] Fix: timer_start changed in linux 6.8.0-rc1
+
+See upstream commit
+
+    commit dbcdcb62b59db2cf6a24113873b90da15c6f0b19
+    Author: Anna-Maria Behnsen <anna-maria@linutronix.de>
+    Date:   Fri Dec 1 10:26:26 2023 +0100
+
+        tracing/timers: Enhance timer_start tracepoint
+
+        For starting a timer, the timer is enqueued into a bucket of the timer
+        wheel. The bucket expiry is the defacto expiry of the timer but it is not
+        equal the timer expiry because of increasing granularity when bucket is in
+        a higher level of the wheel. To be able to figure out in a trace whether a
+        timer expired in time or not, the bucket expiry time is required as well.
+
+        Add bucket expiry time to the timer_start tracepoint and thereby simplify
+        the arguments.
+
+Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
+
+Change-Id: I4868092765745b1efd0c48f13c0b837f2007dcb6
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/instrumentation/events/timer.h | 24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
+index 91a2cd9..ce571f5 100644
+--- a/include/instrumentation/events/timer.h
++++ b/include/instrumentation/events/timer.h
+@@ -45,8 +45,7 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(timer_class, timer_init,
+ 	TP_ARGS(timer)
+ )
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,2,0) || \
+-	LTTNG_RHEL_KERNEL_RANGE(3,10,0,957,0,0, 3,11,0,0,0,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
+ /**
+  * timer_start - called when the timer is started
+  * @timer:	pointer to struct timer_list
+@@ -55,39 +54,42 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(timer_class, timer_init,
+  */
+ LTTNG_TRACEPOINT_EVENT(timer_start,
+ 
+-	TP_PROTO(struct timer_list *timer, unsigned long expires,
+-		unsigned int flags),
++	TP_PROTO(struct timer_list *timer, unsigned long bucket_expiry),
+ 
+-	TP_ARGS(timer, expires, flags),
++	TP_ARGS(timer, bucket_expiry),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer_hex(void *, timer, timer)
+ 		ctf_integer_hex(void *, function, timer->function)
+-		ctf_integer(unsigned long, expires, expires)
++		ctf_integer(unsigned long, expires, timer->expires)
++		ctf_integer(unsigned long, bucket_expiry, bucket_expiry)
+ 		ctf_integer(unsigned long, now, jiffies)
+-		ctf_integer(unsigned int, flags, flags)
++		ctf_integer(unsigned int, flags, timer->flags)
+ 	)
+ )
+-#else /* #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,2,0)) */
++#else
+ /**
+  * timer_start - called when the timer is started
+  * @timer:	pointer to struct timer_list
+  * @expires:	the timers expiry time
++ * @flags:	the timers expiry time
+  */
+ LTTNG_TRACEPOINT_EVENT(timer_start,
+ 
+-	TP_PROTO(struct timer_list *timer, unsigned long expires),
++	TP_PROTO(struct timer_list *timer, unsigned long expires,
++		unsigned int flags),
+ 
+-	TP_ARGS(timer, expires),
++	TP_ARGS(timer, expires, flags),
+ 
+ 	TP_FIELDS(
+ 		ctf_integer_hex(void *, timer, timer)
+ 		ctf_integer_hex(void *, function, timer->function)
+ 		ctf_integer(unsigned long, expires, expires)
+ 		ctf_integer(unsigned long, now, jiffies)
++		ctf_integer(unsigned int, flags, flags)
+ 	)
+ )
+-#endif /* #else #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,2,0)) */
++#endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(4,18,0,193,0,0, 4,19,0,0,0,0))
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch
new file mode 100644
index 0000000000..4ad9adc5c2
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch
@@ -0,0 +1,46 @@
+From 7432f583674294b676577b6505b89fc74dc5c7ab Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 22 Jan 2024 11:47:40 -0500
+Subject: [PATCH 3/5] Fix: strlcopy removed in linux 6.8.0-rc1
+
+See upstream commit:
+
+    commit d26270061ae66b915138af7cd73ca6f8b85e6b44
+    Author: Kees Cook <keescook@chromium.org>
+    Date:   Thu Jan 18 12:31:55 2024 -0800
+
+        string: Remove strlcpy()
+
+        With all the users of strlcpy() removed[1] from the kernel, remove the
+        API, self-tests, and other references. Leave mentions in Documentation
+        (about its deprecation), and in checkpatch.pl (to help migrate host-only
+        tools/ usage). Long live strscpy().
+
+Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
+
+Change-Id: I27cdff70a504b25340cc59150ed8e959d9629e43
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ src/lib/ringbuffer/ring_buffer_backend.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/lib/ringbuffer/ring_buffer_backend.c b/src/lib/ringbuffer/ring_buffer_backend.c
+index 9a339be..2181145 100644
+--- a/src/lib/ringbuffer/ring_buffer_backend.c
++++ b/src/lib/ringbuffer/ring_buffer_backend.c
+@@ -405,7 +405,11 @@ int channel_backend_init(struct channel_backend *chanb,
+ 	chanb->extra_reader_sb =
+ 			(config->mode == RING_BUFFER_OVERWRITE) ? 1 : 0;
+ 	chanb->num_subbuf = num_subbuf;
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++	strscpy(chanb->name, name, NAME_MAX);
++#else
+ 	strlcpy(chanb->name, name, NAME_MAX);
++#endif
+ 	memcpy(&chanb->config, config, sizeof(chanb->config));
+ 
+ 	if (config->alloc == RING_BUFFER_ALLOC_PER_CPU) {
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch
new file mode 100644
index 0000000000..c9b1af37c8
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch
@@ -0,0 +1,124 @@
+From c8198382fe1cede3e16aae9978642a113a217e4c Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 22 Jan 2024 12:17:33 -0500
+Subject: [PATCH 4/5] Fix: btrfs_chunk tracepoints changed in linux 6.8.0-rc1
+
+See upstream commit:
+
+    commit 7dc66abb5a47778d7db327783a0ba172b8cff0b5
+    Author: Filipe Manana <fdmanana@suse.com>
+    Date:   Tue Nov 21 13:38:38 2023 +0000
+
+        btrfs: use a dedicated data structure for chunk maps
+
+        Currently we abuse the extent_map structure for two purposes:
+
+        1) To actually represent extents for inodes;
+        2) To represent chunk mappings.
+
+        This is odd and has several disadvantages:
+
+        1) To create a chunk map, we need to do two memory allocations: one for
+           an extent_map structure and another one for a map_lookup structure, so
+           more potential for an allocation failure and more complicated code to
+           manage and link two structures;
+
+        2) For a chunk map we actually only use 3 fields (24 bytes) of the
+           respective extent map structure: the 'start' field to have the logical
+           start address of the chunk, the 'len' field to have the chunk's size,
+           and the 'orig_block_len' field to contain the chunk's stripe size.
+
+           Besides wasting a memory, it's also odd and not intuitive at all to
+           have the stripe size in a field named 'orig_block_len'.
+
+           We are also using 'block_len' of the extent_map structure to contain
+           the chunk size, so we have 2 fields for the same value, 'len' and
+           'block_len', which is pointless;
+
+        3) When an extent map is associated to a chunk mapping, we set the bit
+           EXTENT_FLAG_FS_MAPPING on its flags and then make its member named
+           'map_lookup' point to the associated map_lookup structure. This means
+           that for an extent map associated to an inode extent, we are not using
+           this 'map_lookup' pointer, so wasting 8 bytes (on a 64 bits platform);
+
+        4) Extent maps associated to a chunk mapping are never merged or split so
+           it's pointless to use the existing extent map infrastructure.
+
+        So add a dedicated data structure named 'btrfs_chunk_map' to represent
+        chunk mappings, this is basically the existing map_lookup structure with
+        some extra fields:
+
+        1) 'start' to contain the chunk logical address;
+        2) 'chunk_len' to contain the chunk's length;
+        3) 'stripe_size' for the stripe size;
+        4) 'rb_node' for insertion into a rb tree;
+        5) 'refs' for reference counting.
+
+        This way we do a single memory allocation for chunk mappings and we don't
+        waste memory for them with unused/unnecessary fields from an extent_map.
+
+        We also save 8 bytes from the extent_map structure by removing the
+        'map_lookup' pointer, so the size of struct extent_map is reduced from
+        144 bytes down to 136 bytes, and we can now have 30 extents map per 4K
+        page instead of 28.
+
+Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
+
+Change-Id: Ie52b5ac83df4bc6abeb84d958c4f5d24ae0d8c75
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/instrumentation/events/btrfs.h | 37 +++++++++++++++++++++++++-
+ 1 file changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index 7c7b9b0..a2a412b 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -1609,7 +1609,42 @@ LTTNG_TRACEPOINT_EVENT(btrfs_delayed_ref_head,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++
++LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct btrfs_chunk_map *map,
++		 u64 offset, u64 size),
++
++	TP_ARGS(fs_info, map, offset, size),
++
++	TP_FIELDS(
++		ctf_integer(int, num_stripes, map->num_stripes)
++		ctf_integer(u64, type, map->type)
++		ctf_integer(int, sub_stripes, map->sub_stripes)
++		ctf_integer(u64, offset, offset)
++		ctf_integer(u64, size, size)
++		ctf_integer(u64, root_objectid, fs_info->chunk_root->root_key.objectid)
++	)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_alloc,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct btrfs_chunk_map *map,
++		 u64 offset, u64 size),
++
++	TP_ARGS(fs_info, map, offset, size)
++)
++
++LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__chunk,  btrfs_chunk_free,
++
++	TP_PROTO(const struct btrfs_fs_info *fs_info, const struct btrfs_chunk_map *map,
++		 u64 offset, u64 size),
++
++	TP_ARGS(fs_info, map, offset, size)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(btrfs__chunk,
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch
new file mode 100644
index 0000000000..65c33dafef
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch
@@ -0,0 +1,88 @@
+From 86db094386b43bb5c6b47552f9a4826ca8ba917d Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 22 Jan 2024 13:13:36 -0500
+Subject: [PATCH 5/5] Fix: btrfs_get_extent flags and compress_type changed in
+ linux 6.8.0-rc1
+
+See upstream commit:
+
+    commit f86f7a75e2fb5fd7d31d00eab8a392f97ba42ce9
+    Author: Filipe Manana <fdmanana@suse.com>
+    Date:   Mon Dec 4 16:20:33 2023 +0000
+
+        btrfs: use the flags of an extent map to identify the compression type
+
+        Currently, in struct extent_map, we use an unsigned int (32 bits) to
+        identify the compression type of an extent and an unsigned long (64 bits
+        on a 64 bits platform, 32 bits otherwise) for flags. We are only using
+        6 different flags, so an unsigned long is excessive and we can use flags
+        to identify the compression type instead of using a dedicated 32 bits
+        field.
+
+        We can easily have tens or hundreds of thousands (or more) of extent maps
+        on busy and large filesystems, specially with compression enabled or many
+        or large files with tons of small extents. So it's convenient to have the
+        extent_map structure as small as possible in order to use less memory.
+
+        So remove the compression type field from struct extent_map, use flags
+        to identify the compression type and shorten the flags field from an
+        unsigned long to a u32. This saves 8 bytes (on 64 bits platforms) and
+        reduces the size of the structure from 136 bytes down to 128 bytes, using
+        now only two cache lines, and increases the number of extent maps we can
+        have per 4K page from 30 to 32. By using a u32 for the flags instead of
+        an unsigned long, we no longer use test_bit(), set_bit() and clear_bit(),
+        but that level of atomicity is not needed as most flags are never cleared
+        once set (before adding an extent map to the tree), and the ones that can
+        be cleared or set after an extent map is added to the tree, are always
+        performed while holding the write lock on the extent map tree, while the
+        reader holds a lock on the tree or tests for a flag that never changes
+        once the extent map is in the tree (such as compression flags).
+
+Upstream-Status: Backport [Uhttps://review.lttng.org/c/lttng-modules/+/11700]
+
+Change-Id: I95402d43f064c016b423b48652e4968d3db9b8a9
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/instrumentation/events/btrfs.h | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index a2a412b..ffb1b64 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -177,7 +177,30 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(btrfs__inode, btrfs_inode_evict,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++
++LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
++
++	TP_PROTO(const struct btrfs_root *root, const struct btrfs_inode *inode,
++		const struct extent_map *map),
++
++	TP_ARGS(root, inode, map),
++
++	TP_FIELDS(
++		ctf_integer(u64, root_objectid, root->root_key.objectid)
++		ctf_integer(u64, ino, btrfs_ino(inode))
++		ctf_integer(u64, start, map->start)
++		ctf_integer(u64, len, map->len)
++		ctf_integer(u64, orig_start, map->orig_start)
++		ctf_integer(u64, block_start, map->block_start)
++		ctf_integer(u64, block_len, map->block_len)
++		ctf_integer(unsigned int, flags, map->flags)
++		ctf_integer(int, refs, refcount_read(&map->refs))
++		ctf_integer(unsigned int, compress_type, extent_map_compression(map))
++	)
++)
++
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,14,0))
+ 
+ LTTNG_TRACEPOINT_EVENT(btrfs_get_extent,
+ 
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
index a7e3096c6a..3dddbf4ffd 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
@@ -13,7 +13,12 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch \
            file://0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patch \
            file://0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch \
-           "
+           file://0001-Fix-sched_stat_runtime-changed-in-linux-6.8.0-rc1.patch \
+           file://0002-Fix-timer_start-changed-in-linux-6.8.0-rc1.patch \
+           file://0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch \
+           file://0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch \
+           file://0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch \
+        "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
-- 
2.39.2


