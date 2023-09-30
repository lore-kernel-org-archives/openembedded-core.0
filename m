Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87C0EED612
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:34 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.47633.1696102830406153318
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SxGIziKJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.53, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1dc6195bf93so8180432fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102829; x=1696707629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/++aj6IvMMHcs+meX0387HcMe3MnHIE5m+DpwoLOOXc=;
        b=SxGIziKJm+AB1Cnp/LMJFf6TnXCsniUuDnIaayVLmUXLsV+UKFUhCwNG70r3oEWwYl
         /T3+bmOVCL13I7Pt1EZ7PVrT9cAqRwXmwW7GITgXftoYAcp0B5j6/FWV0upmdQd/Sh4k
         zuTVrBLtA7DEAUroJC4BYdq/ug4W87xdC9oixWQDiW1dHeWataPK1vUekRB1yfUH+jaP
         +uC+aME9XxlkJ9VqVn1sfm20FqTzvzWXj0Ukbdmf6eQ4Ocy41O3A1RT3xlhyqSG4aYOF
         d9Jt5VYwVNGXfh73R2Wo6TU0uu27BWp9Mzj/df4I4bEBwOl5iv5Js3sdSAWo3MlMezze
         LW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102829; x=1696707629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/++aj6IvMMHcs+meX0387HcMe3MnHIE5m+DpwoLOOXc=;
        b=dUE8/XzFkMgP235W1lKtsFIotxAGlRBit1mSPbKg5tqe8DwEr4l1ZgEpyzOydylcc4
         wWc30RlLlinRTZDiSRikJuY9u4zjyEXwDDJFuw25zutmqNRL5JYwWH1dmrP2WAk6VqzZ
         Lu5/jZAZRUZiQqpph5D/5pHw3XAjYaub4t/vjg5Cr9vj6k06dtrBdXq1vgAzbF1D03W3
         q97orRNz0qZ2Lx+OwvCfL6DSOPQMRqY2dFs35HS+3PljV2796GmXHthaVtOxVTcGV0kk
         L3yOf3R58pGcwiJHUyT+IFM+KFt0b9akcXBXIcDC1GhB26qkGFpGE1ThV0Tv5RmOeik8
         jJzw==
X-Gm-Message-State: AOJu0YwMBvgaFBxHiNnWybG3v9vjvAvrqr57O7QSbnscQ4CscEzqlIfD
	RHq8i5NSHi+rp9sdReN/r8gXqUscCRkp/nW0AEE=
X-Google-Smtp-Source: AGHT+IFChAxR5yDAPvoluJDXXFMZ2QwqgBWzOHyQEeMgV0jT6H1qGa6BsbM3r2A57THuO+GcrsECfg==
X-Received: by 2002:a05:6870:2306:b0:1dd:7f3a:b8c1 with SMTP id w6-20020a056870230600b001dd7f3ab8c1mr8818755oao.9.1696102829345;
        Sat, 30 Sep 2023 12:40:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/13] qemu: fix CVE-2020-24165
Date: Sat, 30 Sep 2023 09:40:03 -1000
Message-Id: <93efa56fb87217035275dcb04c4a19b79b95ccaf.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188471

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-24165.patch            | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24165.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2669ba4ec8..e6b26aba88 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -141,6 +141,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-0330_2.patch \
            file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
+           file://CVE-2020-24165.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-24165.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-24165.patch
new file mode 100644
index 0000000000..e0a27331a8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-24165.patch
@@ -0,0 +1,94 @@
+CVE:  CVE-2020-24165
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/886cc68943ebe8cf7e5f970be33459f95068a441 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 886cc68943ebe8cf7e5f970be33459f95068a441 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
+Date: Fri, 14 Feb 2020 14:49:52 +0000
+Subject: [PATCH] accel/tcg: fix race in cpu_exec_step_atomic (bug 1863025)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The bug describes a race whereby cpu_exec_step_atomic can acquire a TB
+which is invalidated by a tb_flush before we execute it. This doesn't
+affect the other cpu_exec modes as a tb_flush by it's nature can only
+occur on a quiescent system. The race was described as:
+
+  B2. tcg_cpu_exec => cpu_exec => tb_find => tb_gen_code
+  B3. tcg_tb_alloc obtains a new TB
+
+      C3. TB obtained with tb_lookup__cpu_state or tb_gen_code
+          (same TB as B2)
+
+          A3. start_exclusive critical section entered
+          A4. do_tb_flush is called, TB memory freed/re-allocated
+          A5. end_exclusive exits critical section
+
+  B2. tcg_cpu_exec => cpu_exec => tb_find => tb_gen_code
+  B3. tcg_tb_alloc reallocates TB from B2
+
+      C4. start_exclusive critical section entered
+      C5. cpu_tb_exec executes the TB code that was free in A4
+
+The simplest fix is to widen the exclusive period to include the TB
+lookup. As a result we can drop the complication of checking we are in
+the exclusive region before we end it.
+
+Cc: Yifan <me@yifanlu.com>
+Buglink: https://bugs.launchpad.net/qemu/+bug/1863025
+Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
+Message-Id: <20200214144952.15502-1-alex.bennee@linaro.org>
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+---
+ accel/tcg/cpu-exec.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
+index 2560c90eec79..d95c4848a47b 100644
+--- a/accel/tcg/cpu-exec.c
++++ b/accel/tcg/cpu-exec.c
+@@ -240,6 +240,8 @@ void cpu_exec_step_atomic(CPUState *cpu)
+     uint32_t cf_mask = cflags & CF_HASH_MASK;
+ 
+     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
++        start_exclusive();
++
+         tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
+         if (tb == NULL) {
+             mmap_lock();
+@@ -247,8 +249,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
+             mmap_unlock();
+         }
+ 
+-        start_exclusive();
+-
+         /* Since we got here, we know that parallel_cpus must be true.  */
+         parallel_cpus = false;
+         cc->cpu_exec_enter(cpu);
+@@ -271,14 +271,15 @@ void cpu_exec_step_atomic(CPUState *cpu)
+         qemu_plugin_disable_mem_helpers(cpu);
+     }
+ 
+-    if (cpu_in_exclusive_context(cpu)) {
+-        /* We might longjump out of either the codegen or the
+-         * execution, so must make sure we only end the exclusive
+-         * region if we started it.
+-         */
+-        parallel_cpus = true;
+-        end_exclusive();
+-    }
++
++    /*
++     * As we start the exclusive region before codegen we must still
++     * be in the region if we longjump out of either the codegen or
++     * the execution.
++     */
++    g_assert(cpu_in_exclusive_context(cpu));
++    parallel_cpus = true;
++    end_exclusive();
+ }
+ 
+ struct tb_desc {
-- 
2.34.1


