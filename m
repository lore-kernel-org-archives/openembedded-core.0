Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0752CE743DB
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 03:07:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.10152.1695956820179832468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 20:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NlFCH6gW;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695956821; x=1727492821;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v54Zxc0H52yWThAELV5/Bp8SpmRzW0nSHIrk18QKoI8=;
  b=NlFCH6gWVnX5HuAWbY/nT88tsqG54lmQDTMC8mDQuqCh/CDek1CQdCzL
   YalR1FRIWl2alQEP6spo0+K8RDgKkdJcqeZT/Y7i9dcr1BsiFEoPbybsJ
   VS1u1vNgJCWd8PAfq1vkomNL14suNEPHaZRMXqeKG/XH1JgL+OE1+i4/4
   GLYJlGSMTeftVt37hst36Z8xzMnrVBAd21rXglfTsXN410JdcrYwFSbgj
   Q0R8a60yagAC/vze25O4a9Hwkn4kUdbBpO/nezPiGbeGCMjP2ipDlgiSW
   cwETcW4zkTu+5sY5VKavRv5FmjvUmFpoCo8pv/QHAp3LRretYd5SwNvrV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="829865"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="829865"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 20:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="996790930"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="996790930"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2023 20:06:53 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH v2] qemu: fix CVE-2020-24165
Date: Fri, 29 Sep 2023 10:47:15 +0800
Message-Id: <20230929024715.373157-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 03:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188390

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
v2: update qemu.inc, rebase on latest HEAD
(926eb08fe325e2ea13098f99d920840b9354ceb9)

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
2.37.3


