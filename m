Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D728ECD98F8
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10407.1781682348635419710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yssrmN7T;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2867649f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682347; x=1782287147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ao5YRHPjhdh+HOnpPuJI2tm0Wc4UzTBH1NhUZYCjfbE=;
        b=yssrmN7TLBQ1RyHd0hREA7c+fTVE2J6FcuSgDlXFp9feKLHGFeeV+wCDJjkpwOSyy3
         apILVdItBZrEY5j10wB4T7qtsb4VaLJlyZLN7yzVvBENbOv/yhVrBNlMULEW5CicMMK7
         TPPHXVhNiySU2VlC/e4pivwKnJETERSTQUZqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682347; x=1782287147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ao5YRHPjhdh+HOnpPuJI2tm0Wc4UzTBH1NhUZYCjfbE=;
        b=hI6oTvk4JWXH4gwm8xL2GOqy4HWKYYmnK3X4TbtQ4AwInOKkOB9VfQEu2E+TCFHi1j
         /YGKRLIv3gDE8D4rSYYGgZ0MHFqmX+hkd6bDyckr5kdSWlzWc1dDn4l31Ov+Q+oMUlGH
         MbdMefRrbptTHaOL7uPy6+cSo6TXRR6d/We1EAPvncHvayxQ3tGJXVUVovZE9QvxT6SE
         2ihoYAao/a7Csu6Tx/fyymTTyd7AhsYoz22DVszYxb/H5RcYTRzmf8mxJloFbBWQqRS9
         abiHeOFqIniSY0mJMIhFLeR5Ol4/ws8YaP+qHSS06xXwCWskrZB4AFBN3WQ7HRfhaqL1
         Wslw==
X-Gm-Message-State: AOJu0YwrFfdneR5CR+oiPRx4sMchPj6140ns/qxocPylLHBgFvuNPR1Y
	CCT75njrQREenyXMJN+ZiFEBHmSqHNmwMgFfagi/IuU/JcziuRHde64JBsDqExHfZPs51vT4Q/+
	4llr2
X-Gm-Gg: AfdE7cmOVmxbktwFHwOzY8TjV66lOUq6f5/svZyaDpHphyiDiwQKvZdAMsJTMlIzbNg
	tOwIooMZ7WLagQJHCnRCX4g9Kxxi74MTWjns34WZaV2mfRSgFXg44o9KrdwY1E3ox10G5UisjGX
	bI9ZTZZtSm+T7Q65MOnEy1SzVKYXTgpKe1tXviI5AcJjvfvkZLqO6092G1SpXBvQDkuHGF0bnUN
	JV6ckrHTW9JYFlqj4qGVR+m+w0zWQc39bxJN4s8xdy+d2Z5RO622mTpizGVjRLq4oNixH3J0ES3
	h5PCIdhVDCqureMKlaTmJ3ddwo3s2Pjj835gLXV3/dz0sLwyCqrCyB/ZNMCrqkMJnrk+3dUf3zO
	jimYkZApI2bW4QiP1Hm/QaQ595a/xTv2lQn2CBUwkh1adZayhxw7kNBLt0gRjAiAo9Rk1xou5IU
	L2ZZP0+y7ZENl6ugunQLwXUFg+4r1AjhtC+9AxKA7IMEP9TkfavZPj9uqFu6RrCtt7A4xfMN4tf
	gtrem0hanPerUPRzg==
X-Received: by 2002:adf:ee82:0:b0:460:1e5a:2267 with SMTP id ffacd0b85a97d-46236462370mr3663779f8f.17.1781682346786;
        Wed, 17 Jun 2026 00:45:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/30] lttng-modules: Fix trace_hrtimer_start build failure
Date: Wed, 17 Jun 2026 09:45:05 +0200
Message-ID: <7d74e588802d87a07b14c1541651ad5ce8860a8f.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239013

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
 

