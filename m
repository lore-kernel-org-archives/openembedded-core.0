Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15C2C35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.31736.1742141584299109178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LPnR4G+x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43948021a45so13859205e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141582; x=1742746382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfNxe6Lm1p7ffMJ6lcgj2MInK8qsNIrlfCsbtdXh5lU=;
        b=LPnR4G+xdPrmGNgM676HNUsQ5w1fNzQY3v3j2FR/RBNUVsy+bqqSTiRzyuHYVhXtWJ
         AitQjr70jPzh5FBPCdenm3dsNjfSq8S/uM9MH9mykjW/F1Qf+TCRAnyRIp5BLLAE0kOv
         3o//1KMhW9/yu3hZohDlDGXXLWY6om7YiZqoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141582; x=1742746382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfNxe6Lm1p7ffMJ6lcgj2MInK8qsNIrlfCsbtdXh5lU=;
        b=LqEyVsBZ06oQhzEPPXLJatS0S5q27Ogi/3poNc2+Hqf9jUTysLUncadw8/KCKxoe+Y
         erbpvRSHGROxQeXUvw1R/c2VxfbnWu+SJEVd03RPFPqQ7Beovv5IYjt0xaNrfuFgxSqP
         o7UjUdtkmTO95acf7aOHGXie7zi1qAZZnRi8zQ0aPdqtRExpeQ8FwKEJeZ2pfwoS3Jh/
         sOleXuUIZur4ZnDLLOmX8vOY5wHs2JQbey4EBxC2io3L3hDKfYH+z3CqkB3xFnc+ycUC
         Bb3p842INfHkqxDMqwugHk5dVFPyNNnrZGVEn+kN6AJAIVik7EgIO9Tx7yWA0QSHIfQF
         s+JA==
X-Gm-Message-State: AOJu0Yys/WKkrWsbmNbgYtJxoXsC36MwMF7EUw+TyXWqLBZLON40SbgG
	o79Vu6hyWNVLq08/EI7bF4D1WqZ45kZ2C19yLivDPBijTJRjC4YAocXe5DA8IdkEziyWjxQuE0I
	p
X-Gm-Gg: ASbGnctQJkT+VdQihHCU54V7OGjcgEwCkOCoFzdqqsbQWt2C/LrVR/4FaIaDi3H7dhB
	0K2q+oTerCT210d+wyoYO9PTZSP4VdSAIPNeB8Ajw8brcp7g7ZEn0e1IseQDpL3h9UWjJg7dy6R
	cmQKZ3dPn3HnOCgpZagEaWfBLZMkzPpky6nEM5YVG9zRSCuX+wxQUihBLkJogi2nFdqI9xKAZ0W
	EVzLpomikkreHAgx1ihxp2KuxqAQV0a4hzNpeQuEd/Id8VOVQdRtvDm+gedecNu37juEyupcdtc
	3UJdZM3OpRU12cmWIEh7829JlqiFWLpMlrVEZfwxjw6e3U+87apvC+RGgDwkB+Ybkdr4r7HfGQ=
	=
X-Google-Smtp-Source: AGHT+IEp8m0zGwO6Far4jMSvybGBUPK04HfYYL02TckyH69BaM3sjpyxdjG691HE9s80+gImTpLyRw==
X-Received: by 2002:a05:600c:358c:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43d1ecc31admr97609105e9.20.1742141582187;
        Sun, 16 Mar 2025 09:13:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/43] lttng-modules: Upgrade 2.13.16 -> 2.13.17
Date: Sun, 16 Mar 2025 16:12:01 +0000
Message-ID: <20250316161209.3629986-35-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213038

Drop patch now applied in the new release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...stat_runtime-changed-in-Linux-6.6.66.patch | 51 -------------------
 ...es_2.13.16.bb => lttng-modules_2.13.17.bb} |  3 +-
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.16.bb => lttng-modules_2.13.17.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
deleted file mode 100644
index bb40ff72433..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 74cdd186fdd540b98ecded94d506b812d7d2bae5 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Sun, 22 Dec 2024 17:39:35 +0800
-Subject: [PATCH] Fix: sched_stat_runtime changed in Linux 6.6.66
-
-The following commit has been backported into the 6.6.y branch.
-
-See upstream commit:
-
-    commit 5fe6ec8f6ab549b6422e41551abb51802bd48bc7
-    Author: Peter Zijlstra <peterz@infradead.org>
-    Date:   Mon Nov 6 13:41:43 2023 +0100
-
-        sched: Remove vruntime from trace_sched_stat_runtime()
-
-        Tracing the runtime delta makes sense, observer can sum over time.
-        Tracing the absolute vruntime makes less sense, inconsistent:
-        absolute-vs-delta, but also vruntime delta can be computed from
-        runtime delta.
-
-        Removing the vruntime thing also makes the two tracepoint sites
-        identical, allowing to unify the code in a later patch.
-
-Change-Id: I74acf0b8340c371e8411116e07e5c97b10f9c756
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-
-Upstream-Status: Pending [https://review.lttng.org/c/lttng-modules/+/13813]
-
-[Xiangyu: BP to fix compile error on linux 6.6.66, Minor conflict resolution]
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- include/instrumentation/events/sched.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
-index 32d18133..0c62f2e6 100644
---- a/include/instrumentation/events/sched.h
-+++ b/include/instrumentation/events/sched.h
-@@ -647,7 +647,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
- #endif
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0) || \
--	LTTNG_RHEL_KERNEL_RANGE(5,14,0,452,0,0, 5,15,0,0,0,0))
-+	LTTNG_RHEL_KERNEL_RANGE(5,14,0,452,0,0, 5,15,0,0,0,0) || \
-+	LTTNG_KERNEL_RANGE(6,6,66, 6,7,0))
- /*
-  * Tracepoint for accounting runtime (time the task is executing
-  * on a CPU).
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.17.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.17.bb
index c9d5ccdab1c..0657112c14a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.17.bb
@@ -14,10 +14,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
-                   file://0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch \
                 "
 
-SRC_URI[sha256sum] = "6694414a3701fcd6e05b3cb20cfecae3b46b3dfb9e5361b344851c1f8052e854"
+SRC_URI[sha256sum] = "b0b23504150ae5c1fc6ee14e28d029518f61fe2ec5f17bb61c7941aa52bb6e65"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 

