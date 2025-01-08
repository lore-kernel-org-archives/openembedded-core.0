Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADF9E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:54 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.32458.1736371067440879211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AbFNCA2x;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216401de828so2796235ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371067; x=1736975867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGVmvR4HUnKLpEe3BhE7ka++jHl2GdfcsVYa/33Z82Q=;
        b=AbFNCA2xvk3fIUSKlJyPoCBlaE2NuLD7Icf4frDq/HiC4+3bz+H4Ah8zP30/H+W78Y
         T7kjSkDy+vcTtNMtBbFaXvJBnXNMZKEP4cIAbQJ7MTSgohoqattnoSoSjNUNQNQrl7in
         D2kwCqOJuLqYE7QrF0VaUSV8DxLa7fFelBb9XKiaQ3BETCzunZdH5NL0tz0Hjwt11IYN
         jCgy1iZRPTToeYWPkp7BediRds3k+DCp8ElPeVLFgd++Yyfx0mVT7qTI80+JM8tdpptx
         OF14z84Mv8e7XJ+hAcMrpuvmbeoMXVMQM9EUDpN2n0iHrPV/kN3OZlNu9EjsZK/44ZFV
         4Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371067; x=1736975867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGVmvR4HUnKLpEe3BhE7ka++jHl2GdfcsVYa/33Z82Q=;
        b=iuBfq9brSVUhjUsIhkG+a6t6YSzaoz3zTkBiCf0abE/8HsMn9bxBb+aP2+PPeChPxw
         aBIK61YNZRp2bA+shH3mt3lYe7mQDI76VS4uwOg1VPwNlQteto09i2A1K5E5zAdsvEyZ
         lIWCB4e28mSj4+jeb4Vs2r47gFTT6HfyhYroBgK/iBVIC1Rh/o5dRiUl2VRJJttvEsdL
         uPj5o42MFBwNK1jEDv4fAi89ZPNTZJtGu6bj/RZ9vCx0u27DpGswtri7zIxOnTnjHG7n
         vRWeA+htrrM/gt7m1zc7ImIws4fc0jNPD3Ks/Qlk3Bdjj51bCU+OPEnNHR1VWWpLQijp
         oA2w==
X-Gm-Message-State: AOJu0YzPGa7hjKPDC5ueHdq5OScA8S0+4gv2rvQINZT8GRoxdJz/F/tE
	Vn9Bw+SsV+tX7U5zMIBmZ+F4NdYsKWfX+fNnzAHs3S/ZDoK9VvO7rgH065I3Mtnymz6GrE9hdSJ
	MyTQ=
X-Gm-Gg: ASbGncvx5DJWYnWVtxml9uf3nR6oys/CBtydMnlKUG2P1VgTqevjojobPy6EYygHDxo
	hRkLaYjqiwa90JQznJepCRwKYUEZ7BXf5Wi0A0aPdgF3uLrSno00VOQcHhTfmePw8YFioiuwBG0
	erstKo4r4p3KlqREihRa3BXdeosL4m/hB8qIY6+bf/5v8dCjvdvusGwgjXo6vBqyjET4K0+bbmr
	ukVIB83BzQmwNbh6L8iYUSMW7uiKh6zQ+wPh/xeoq6t5A==
X-Google-Smtp-Source: AGHT+IHZfh2KBoroP4R//EECN6dFKoFdEmWRF+oqn8PuPI7XVzTzLc6zzm1Q7h1jz0x1FtFJKh4c2g==
X-Received: by 2002:a17:902:f54d:b0:216:1543:1962 with SMTP id d9443c01a7336-21a83f5fbd5mr54462985ad.23.1736371066609;
        Wed, 08 Jan 2025 13:17:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 18/18] lttng-modules: fix sched_stat_runtime changed in Linux 6.6.66
Date: Wed,  8 Jan 2025 13:17:08 -0800
Message-ID: <1ba1dfeb8f47722551a62255e7f0575bc29f37f0.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209608

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b973be9a7fbb2694d162ac06b76513525f3deed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...stat_runtime-changed-in-Linux-6.6.66.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.14.bb            |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
new file mode 100644
index 0000000000..bb40ff7243
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
@@ -0,0 +1,51 @@
+From 74cdd186fdd540b98ecded94d506b812d7d2bae5 Mon Sep 17 00:00:00 2001
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
+index 32d18133..0c62f2e6 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -647,7 +647,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
+ #endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0) || \
+-	LTTNG_RHEL_KERNEL_RANGE(5,14,0,452,0,0, 5,15,0,0,0,0))
++	LTTNG_RHEL_KERNEL_RANGE(5,14,0,452,0,0, 5,15,0,0,0,0) || \
++	LTTNG_KERNEL_RANGE(6,6,66, 6,7,0))
+ /*
+  * Tracepoint for accounting runtime (time the task is executing
+  * on a CPU).
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index 5b1e61f3be..f6e86c4430 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -19,7 +19,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
+SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
+                   file://0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch \
+                "
 
 SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
 
-- 
2.43.0


