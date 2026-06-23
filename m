Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F91CCDE007
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33422.1782253642038033608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ck7Z+Ycz;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso2390395e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253640; x=1782858440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ao5YRHPjhdh+HOnpPuJI2tm0Wc4UzTBH1NhUZYCjfbE=;
        b=Ck7Z+YczVj0BX0d8tIeFjvnottYHEu0rOp8gT1o+hev6+A5ovLSxfGCug0YYnhMLrw
         208Y3YGVwe+CZp+V6rKNBRwNIvICJikVG+it/T9y6ijE4NKSl2DTa+W6q9l390+JXoNs
         Hq2VjKvaWrdxjy74csoc7eXXEI0ENwP8XfA1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253640; x=1782858440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ao5YRHPjhdh+HOnpPuJI2tm0Wc4UzTBH1NhUZYCjfbE=;
        b=aKu7ne/4EHEu5xafYr6QRWNHe03aaGKmnXDNkojcvi/ZdEN1nf1TNb4Z1aI6bmTlb3
         EfWSj8AT5oCTVmNF505VAQyIk6qSMMo/aeCGthrAfLPMQKBiJPgSk//Tv/nbB3SUzeCR
         vr91gfGwF8JnelSs4aq7K8GpkCKmtqxmu0d8xfIBvq+SEqvg2+GQURQDj8uMgi6mT443
         EGzri59bdjfPDRLSLOPJUxt/MqL+qztwSSwT53WYxolPwbfTBbTD3CQPC58/2UccVTCc
         hERND6I9McB/C6QqJw4mud9Yrs1EoEKCF0/WYcY3TMG2QfKS1A+EyqKcrphIEyyYEXuF
         f1XQ==
X-Gm-Message-State: AOJu0YxL34G9bROWqaR31RooE6ZJd/RT086WKH0O4qD33mIMmjlPrHW7
	aZ2pEw1zfya7pR0DvyCZ/uTiEZMCkA6tMfNxgTRMicnSfK+0en14JkPS3HM2tWJG5tdzmDn8bpG
	+c+u9
X-Gm-Gg: AfdE7cmgzwJFQy2E8VPgsHWdjor+Y3xgLl1A7UttMMZRHsx6M+UyehKRvnaWAN3SxXI
	bJljprLdWSb1GulfloAP9pmFR6LIZpFnJ7PWsk8gT28bjdRP3mcSmVmnxx9bHspIC7ACYH1QKQ1
	5f7OEIEThQafQYZ2tJ0TfD9gOMa01eLyu+vxpb1cBOCFthPzmLp9qLR4sbqnd3SHbX185TTjdPU
	tUk1rr5fmTYHzoUBcJUJxqrZ1iNsm7DIJ1VkaPkcmxjJRna6pKvn06JnMroD1Z5XF4Ll4gi6INh
	DMuwFsxwSNQvB+e9i1OqUqcljX4u7yOR195H7FqwHfp6Uh9T2aHRkpyHvBiBuTawRNDao12qWiI
	y5pEMPOUtZstZY5XbLOr4VvsEJixP5MZhbYI3Sfp1woIgcAoDQKSgVs47vnLzwH8PBwj1HI47e2
	ViyaIcE9F/H2sLvXupW/I3GrEs/MHz0+e2UiOT4rV0PU4EHcya0Ox1VS/spClG4lKRivQGZv3Sw
	khDLQv30tfIr5SkfCRXo55k52Q=
X-Received: by 2002:a05:600c:3148:b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-492608784cbmr5692135e9.27.1782253640171;
        Tue, 23 Jun 2026 15:27:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 39/41] lttng-modules: Fix trace_hrtimer_start build failure
Date: Wed, 24 Jun 2026 00:26:38 +0200
Message-ID: <e0598e2bbf9513ad71dea185a540de16996c4114.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239461

From: He Zhe <zhe.he@windriver.com>

Fix the following build failure

probes/../../include/lttng/tracepoint-event-impl.h:133:6: error: conflicting
types for 'trace_hrtimer_start'; have 'void(struct hrtimer *, enum hrtimer_mode)'
  133 | void trace_##_name(_proto);
      |      ^~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
[YC: backported from wrynose commit e32cbc177dae ("lttng-modules: Fix
trace_hrtimer_start build failure").
This is a partial backport of commit 7dae5f40e394 ("lttng-modules:
fix build against kernel 7.1+")]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.12.bb            |   6 +-
 2 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
new file mode 100644
index 00000000000..e9124b4f87a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
@@ -0,0 +1,103 @@
+From c370026b0a077ba9491b07c559b343fde6353074 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 10:38:18 -0400
+Subject: [PATCH] fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)
+
+
+See upstream commit:
+
+  commit f2e388a019e4cf83a15883a3d1f1384298e9a6aa
+  Author: Thomas Gleixner <tglx@kernel.org>
+  Date:   Tue Feb 24 17:36:59 2026 +0100
+
+    hrtimer: Reduce trace noise in hrtimer_start()
+
+    hrtimer_start() when invoked with an already armed timer traces like:
+
+     <comm>-..   [032] d.h2. 5.002263: hrtimer_cancel: hrtimer= ....
+     <comm>-..   [032] d.h1. 5.002263: hrtimer_start: hrtimer= ....
+
+    Which is incorrect as the timer doesn't get canceled. Just the expiry time
+    changes. The internal dequeue operation which is required for that is not
+    really interesting for trace analysis. But it makes it tedious to keep real
+    cancellations and the above case apart.
+
+    Remove the cancel tracing in hrtimer_start() and add a 'was_armed'
+    indicator to the hrtimer start tracepoint, which clearly indicates what the
+    state of the hrtimer is when hrtimer_start() is invoked:
+
+    <comm>-..   [032] d.h1. 6.200103: hrtimer_start: hrtimer= .... was_armed=0
+     <comm>-..   [032] d.h1. 6.200558: hrtimer_start: hrtimer= .... was_armed=1
+
+Change-Id: I37ee0ae0af665a51fd4f92adffb6b1dcb2ecd9d2
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/b77f94c7a7109e70a97bf936b72d66d611187d61]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+[YC: Backport: revert usage of non-defined-yet ctf_enum]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ include/instrumentation/events/timer.h | 39 ++++++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
+index bd21c03..9d4476a 100644
+--- a/include/instrumentation/events/timer.h
++++ b/include/instrumentation/events/timer.h
+@@ -203,12 +203,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0) || \
++	LTTNG_KERNEL_RANGE(7,0,10, 7,1,0) || \
++	LTTNG_KERNEL_RANGE(6,18,33, 6,19,0) || \
++	LTTNG_KERNEL_RANGE(6,12,91, 6,13,0) || \
++	LTTNG_KERNEL_RANGE(6,6,141, 6,7,0))
+ /**
+  * hrtimer_start - called when the hrtimer is started
+- * @timer: pointer to struct hrtimer
++ * @hrtimer:	pointer to struct hrtimer
++ * @mode:	the hrtimers mode
++ * @was_armed:	Was armed when hrtimer_start*() was invoked
+  */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
++LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
++
++	timer_hrtimer_start,
++
++	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed),
++
++	TP_ARGS(hrtimer, mode, was_armed),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, hrtimer, hrtimer)
++		ctf_integer_hex(void *, function, hrtimer->function)
++		ctf_integer(s64, expires,
++			lttng_ktime_get_tv64(hrtimer_get_expires(hrtimer)))
++		ctf_integer(s64, softexpires,
++			lttng_ktime_get_tv64(hrtimer_get_softexpires(hrtimer)))
++		ctf_integer(enum hrtimer_mode, mode, mode)
++		ctf_integer(bool, was_armed, was_armed)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
+ 	LTTNG_RT_KERNEL_RANGE(4,14,0,0, 4,15,0,0))
++/**
++ * hrtimer_start - called when the hrtimer is started
++ * @hrtimer:	pointer to struct hrtimer
++ * @mode:	the hrtimers mode
++ */
+ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 
+ 	timer_hrtimer_start,
+@@ -228,6 +259,10 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 	)
+ )
+ #else
++/**
++ * hrtimer_start - called when the hrtimer is started
++ * @hrtimer: pointer to struct hrtimer
++ */
+ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 
+ 	timer_hrtimer_start,
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
index 34aff1ba8df..b29d73aa89e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
@@ -15,10 +15,12 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch \
            file://0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch \
            file://0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch \
-        "
+           "
 
 # Use :append here so that the patch is applied also when using devupstream
-SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
+SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
+                   file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch \
+                 "
 
 SRC_URI[sha256sum] = "d85fcb66c7bd31003ab8735e8c77700e5e4f417b4c22fe1f20112cf435abad79"
 

