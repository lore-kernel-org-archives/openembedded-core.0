Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AC9EB8FAC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:41:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.292.1693968057863853420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lQ+RA3cA;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693968058; x=1725504058;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pebxAhYaa5vq0pERbL6DTdKnt30FAJDInoH/EJl2Pcw=;
  b=lQ+RA3cAwQCXRCftLDGOl13CGLk0TB8cndLv9PT13/0KoB7HAImoZp/j
   lJzXAP6ZQ9DE92jMeXb8eJsxSbnkaU4/gh+Fhuhn1k7OQM5CFYah0Z+kE
   5qMwOHAJDgf1XmWCESuHLb3+Y1b6l2FU8qqVc0IHWK3VrovNOGC3hNKQc
   8GZWZW9SBriCcNPO1QRySNL9oQcAtx99yw/cPBz/LXs2K8GQzOpFdQtN/
   0rdUf5B/u66cn5IoDuMs9aKpPKCSJCpcAj403otPj/BRsKqq+FvNIY7UZ
   Fubgq00Vq+AMrFxsiMqHBEa+E1Cb0gvOvn/a911uBI3MWE84veGNKzt2p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407953262"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407953262"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776408652"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776408652"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 19:40:57 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 3/5] qemu: fix CVE-2020-24165
Date: Wed,  6 Sep 2023 10:21:16 +0800
Message-Id: <20230906022118.1593547-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230906022118.1593547-1-chee.yang.lee@intel.com>
References: <20230906022118.1593547-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 02:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187270

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 .../qemu/qemu/CVE-2020-24165.patch            | 94 +++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24165.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2871818cb1..2dd3549a59 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -139,7 +139,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
            file://CVE-2023-0330.patch \
            file://CVE-2023-3354.patch \
-           "
+           file://CVE-2020-24165.patch \
+	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "278eeb294e4b497e79af7a57e660cb9a"
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


