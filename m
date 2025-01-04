Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11DCE77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:46 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.18142.1735998155896884101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1ie8rZHx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166360285dso184809545ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998155; x=1736602955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtUI/FNKC+l5hSUwhEu6Bv+GHTyBQzxNwManfOfRMPU=;
        b=1ie8rZHxKZabQjoJUyHsfHm5ZzfJSDsKKPl9QNJvfOvVaobbHlnEFh4qSmx93u+9Fx
         iMjrDB4FBSWc5YSft5fDyJ1hoEliPNFo5X08D7EkPxAgBbNy+dZ5A1CG7IW0y9e3aUoG
         TUXRdqPtz1qnCd2D7GExH81petbJzUF5kPwmc9uCbW9fRlEwhHTS5zF8jRk0DAzOML+C
         kTTNYNa7L/6i0HvoBMMgE+CnAvRMAL5GpD+rQPIjFu2S5+XSs8lL48nCqQq3y1Xl075Q
         6BlKTLbSMD9lMdCgI2XhEsfLjSe9xsLxIYczj2WOGjOh01JIE8Q3LaywpBXrX+hqDKX9
         F+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998155; x=1736602955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtUI/FNKC+l5hSUwhEu6Bv+GHTyBQzxNwManfOfRMPU=;
        b=jBmX0VV6ECY7P5sGBw98yXANL4Njm1lDK7PW/rwH84JmjYfKhLHWhGZfUWUbIozY41
         a9ENm8sSYkad7SlpFSFJF3ZUTTX0kwPH/yLsXZwqdFpDD693bLegoR1IbOmKkMnLfvV3
         R3EiNWDGmb+EjFIdfnObIeP25I87xw6K9xYSBfJAigCkYve42/Y/9ya+yo7KCmzepXcr
         BlIZQzNPipRY2o2dbfRvEvRfJvI81ocDX/2fsk+G4w0NIbvRHj7uvOVxjDnW6mbnR+wB
         GFY4Ed8HnXosCpuB8+9nG89X3Y7ottZTurqjvgdRPfZuAfZAwZtwavwYPs1HeEIu5U3V
         jYww==
X-Gm-Message-State: AOJu0Yx7xBeO9jtnRJ5fhyc5ZuJE8Eis7WvMECyxDlrYiINqlRVtnBbj
	P7IiYhVmRuT7iMOgcQUYEurGASO20nkWVvkn7TRuAT/NBS+R5x/3UKSRCnHww1hIGA8XHbQi6Fu
	Q
X-Gm-Gg: ASbGncu9FmgYX+QczoX+LsK7MK7/HVS/Y5THCfyejj95lzJp9gJPT+LW+vo05T7hD+1
	qzVVxRMy0sa4l/udCuzpzLnxquqKQdY3pYIbPHcG9OZ2sSsLHVBkeHPKzTLsmdwjMHIlmuFHLe3
	lux0AZx2JpIhFE4NNtXnmdoN2gbbqz37hpc3Bx6yUZg+WEu2AlI2/UAZ6xUi9B6/GjA9n2V3eOj
	Un82tE6mYcYhjvBKXU46KiOPRIYEjzAgsggaK0UXchVNg==
X-Google-Smtp-Source: AGHT+IHjzT4TrHtbHj18QE+hX7wIAWYFh1TACX0FM1AP9vJLQ4iFLlBkbUHP4vhsEpJ2dnE3urRr7Q==
X-Received: by 2002:a05:6a21:3991:b0:1db:ed8a:a607 with SMTP id adf61e73a8af0-1e5e047b457mr85365721637.11.1735998155107;
        Sat, 04 Jan 2025 05:42:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/25] lttng-modules: fix sched_stat_runtime changed in Linux 6.6.66
Date: Sat,  4 Jan 2025 05:41:47 -0800
Message-ID: <598b2f27d74e08eb6089eadad68f80b2f1ef71de.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209392

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The following commit has been backported into the 6.6.y branch.

See upstream commit:

    commit 5fe6ec8f6ab549b6422e41551abb51802bd48bc7
    Author: Peter Zijlstra <peterz@infradead.org>
    Date:   Mon Nov 6 13:41:43 2023 +0100

        sched: Remove vruntime from trace_sched_stat_runtime()

That caused building the lttng-modules report compile error:

       tracepoint-event-impl.h:133:6: error: conflicting types for
       'trace_sched_stat_runtime';

The fix is still pending on lttng review board, backport it to oe-core to
de-block the build issue.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...stat_runtime-changed-in-Linux-6.6.66.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.12.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
new file mode 100644
index 0000000000..3c7731ae8f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
@@ -0,0 +1,51 @@
+From a04234d63999f91405574928c80ded870dca157a Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Sun, 22 Dec 2024 17:39:35 +0800
+Subject: [PATCH] Fix: sched_stat_runtime changed in Linux 6.6.66
+
+The following commit has been backported into the 6.6.y branch.
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
+Change-Id: I74acf0b8340c371e8411116e07e5c97b10f9c756
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+
+Upstream-Status: Pending [https://review.lttng.org/c/lttng-modules/+/13813]
+
+[Xiangyu: BP to fix compile error on linux 6.6.66, Minor conflict resolution]
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ include/instrumentation/events/sched.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
+index 24cf37c8..637a1e3a 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -646,7 +646,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
+ 	     TP_ARGS(tsk, delay))
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0) || \
++	LTTNG_KERNEL_RANGE(6,6,66, 6,7,0))
+ /*
+  * Tracepoint for accounting runtime (time the task is executing
+  * on a CPU).
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
index 95d5e2d615..34aff1ba8d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch \
            file://0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch \
            file://0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch \
+           file://0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch \
         "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.43.0


