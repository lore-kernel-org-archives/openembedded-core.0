Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3240CD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33643.1781132118369886933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d4Imbs3V;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso62082975e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132117; x=1781736917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJn85x3Iy3d21LowZLlfvlIJDXdPFRAYKkNgV1VnRk4=;
        b=d4Imbs3VKmhwfPF3lqSMvTNy9FO7HRkidy3LJ2HWSl6QzYsNEXXnK/Bj7Etd/aliks
         sRWTu8UaW2kl/6PmE+E12LuSF0SO/4jZcRSPf4t+suHFbXNWYdlS3CMf68EBbFs/4m8r
         LSDbEZXZmOz0M6iVJknaUsMS6x62cb7yvl/5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132117; x=1781736917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJn85x3Iy3d21LowZLlfvlIJDXdPFRAYKkNgV1VnRk4=;
        b=qpq+nas5EIno6e39ZZtuRCzQLALtT6gmh1WjQsW6YCrLgOKQ/SKl7lIYnZx0bDZgdl
         LPQbBMTIVexP1G/QYQWwfEH0mqhgQbFzizpq794OQ/fl5VN2kXIclKI4ImuKR/usqZ6H
         aM0zMXO2LBsvrfMetc9RH+n43wnzqaND8hom/cKfTv8Xkl0N9zLO8MQ8pMkgfa9Soq7T
         aM8Y8A+HlnTIbTDMlV0jMjCegDZMoep1JEfBirBFw7LFDe0xTa4fTp1rUKsqR/n+om/Q
         MUkRDBzB7axkurvzO3ZjhbjineNlYGsEiVG1U/p0vHX1Dd7oBmAOqMTzHz4WPjcsUSGd
         BOFw==
X-Gm-Message-State: AOJu0YwDwpXIkMNE4VFaR2B/ChYee7gHMmA+oPaqEc//ReO6+jocfKHG
	ukEFHH/bZRfXLn6+CbvBlSXCstZ4kUIQymDfbEFkPSd5RA9z7FvnjIYwdzqvGJobqF/18oflLK/
	PPK+C
X-Gm-Gg: Acq92OGPEsyqnhbi2MDM3d/mwI2qDVkBzc8PVmq6hY/HaZ12cPcVmIIgJiWAR/t9zxb
	7Vi/jCcE91HG30mdS4k9ig5HuLGSBQmJNqAmgwqcNGvPL8cMjyWryGafDLNtI+qZv6j6DvsG2XE
	pOV+OwxKCOf1ttneL+jF4jsxXKY43oHQsSGg5lKwZfaAUKbpzAmFiUwr3CcyGnhgBAjHnrNslhs
	jb7GESD3NGS4WHCFLz8HQCMtKRZ6b8W7DAcs29J3j2P47LW3KxNKTyvWxJhJ/eRb4q75Gr/5Gto
	UjQqQU8jXxSoP1NW4RlRruJmURqtiQkngUIu2SbdEAmV8CFzRB93zpePgQ0DqMQHJieCmmM8/ov
	MKS2l+c1N0ypTk8MEEn4e+vdegw62mO8DQib3QLhbDaWHAztyb+XAtM1EtyOFkyVkMR4lFcaff4
	ecB8Orj0weZRvdsHFltt+EtHBKyuO1YgYIVW0Xc4pLlWZKhthewRmXHY/fJH+NK5wOCqxWBPP4c
	ag8+JEijQRMupFjkkKqGLZdQ1gvPxiyavXSzwQ=
X-Received: by 2002:a05:600c:8208:b0:490:bb37:9d49 with SMTP id 5b1f17b1804b1-490c25b136amr436936055e9.11.1781132116711;
        Wed, 10 Jun 2026 15:55:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/21] lttng-modules: Fix trace_hrtimer_start build failure
Date: Thu, 11 Jun 2026 00:54:53 +0200
Message-ID: <e32cbc177daec09ae68fb3ebb72ffa965dceece4.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238398

From: He Zhe <zhe.he@windriver.com>

Fix the following build failure

probes/../../include/lttng/tracepoint-event-impl.h:133:6: error: conflicting
types for 'trace_hrtimer_start'; have 'void(struct hrtimer *, enum hrtimer_mode)'
  133 | void trace_##_name(_proto);
      |      ^~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
[YC: this is a partial backport of
commit 7dae5f40e394 ("lttng-modules: fix build against kernel 7.1+")]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ++++++++++++++++++
 .../lttng/lttng-modules_2.14.4.bb             |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
new file mode 100644
index 00000000000..a6fe47737ec
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
@@ -0,0 +1,103 @@
+From b77f94c7a7109e70a97bf936b72d66d611187d61 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 10:38:18 -0400
+Subject: [PATCH] fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)
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
+---
+ include/instrumentation/events/timer.h | 39 ++++++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
+index f69e069b..dfc295e0 100644
+--- a/include/instrumentation/events/timer.h
++++ b/include/instrumentation/events/timer.h
+@@ -220,12 +220,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
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
++		ctf_enum(hrtimer_mode, unsigned int, mode, mode)
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
+@@ -245,6 +276,10 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
index 722b1ac5ddd..b2c697d365d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                    file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
+                   file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch \
                 "
 SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
 

