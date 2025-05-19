Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BC9C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:58:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web10.49384.1747655921667381527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fOMdqs0B;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747655922; x=1779191922;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pc6wBKzeskGVTP/htTus8vBp5/9ArSOec/jHoQsV62I=;
  b=fOMdqs0BO/Lmhwr8zyM+/sBpIGIgnu80UMw+UTL/PuJZ8uw6C9HhhkMq
   pyaJb/IzH9nMNqEVMTlBNwXLhP6E3hSGr45a+hGV3QvoHGGEPDoNzOl2R
   pi8Bs3PwTSqXY5n0Ghk+y5pw6HbuGxRcTmRGI69jRCMPilIG2l6Q6Upis
   k/6H5ubqtGiVuEjxBAj2BUPhg/YMVJFlSSQZCpKkdDUJKsxOyS2LueVfw
   15MUBkWL4Rb4R/af3ImWpQEmtpe9FJfiAeFRo1ozS79qfpoFjaysucxo5
   oNFV5B6d8/xnhMqCLztm11CN91Yo3ondonZOv/bC4Uk2kbJXMcO4PYG6q
   g==;
X-CSE-ConnectionGUID: Sy0eIxsDTsW9L7MvI8qSuw==
X-CSE-MsgGUID: 2E5C/+qDRzKjX7I5yB+hgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49454634"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49454634"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:58:41 -0700
X-CSE-ConnectionGUID: X72uw+PSSD+lQfqOOBEWCQ==
X-CSE-MsgGUID: OUsHKiHDTIW+hYVZX+BbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="162639788"
Received: from andromeda02.png.intel.com (HELO andromeda02..) ([10.107.232.49])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:58:40 -0700
From: yogesh.tyagi@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp : backport patch to fix compilation error for Skylake -march=x86-64-v3
Date: Mon, 19 May 2025 19:08:17 +0800
Message-Id: <20250519110817.3781583-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216856

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

When the input compiler enables AVX, stack realignment requirements
causes gcc to fail to omit %rbp use, due to which the test fails to
clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
that the test continues working.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20250130.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
new file mode 100644
index 0000000000..c6fae88eb9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-cve-2015-3290-Disable-AVX-for-x86_64.patch
@@ -0,0 +1,42 @@
+From 28d823a63ee29f5d72c2aba781a06a7e2651cadc Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@gotplt.org>
+Date: Mon, 7 Apr 2025 06:24:47 -0400
+Subject: [PATCH] cve-2015-3290: Disable AVX for x86_64
+
+When the input compiler enables AVX, stack realignment requirements
+causes gcc to fail to omit %rbp use, due to which the test fails to
+clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
+that the test continues working.
+
+Link: https://lore.kernel.org/ltp/20250407102448.2605506-2-siddhesh@gotplt.org/
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/28d823a63ee29f5d72c2aba781a06a7e2651cadc]
+
+Reviewed-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
+
+---
+ testcases/cve/Makefile | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
+index 01b9b9ccb..98c38e908 100644
+--- a/testcases/cve/Makefile
++++ b/testcases/cve/Makefile
+@@ -22,6 +22,12 @@ ifneq (,$(filter $(HOST_CPU),x86 x86_64))
+ meltdown: CFLAGS += -msse2
+ endif
+ 
++# The test needs to clobber %rbp, which requires frame pointer omission.  Also
++# for x86_64, disable AVX since that could sometimes require a stack
++# realignment, which gets in the way of frame pointer omission.
+ cve-2015-3290:	CFLAGS += -pthread -fomit-frame-pointer
++ifeq ($(HOST_CPU),x86_64)
++cve-2015-3290: CFLAGS += -mno-avx
++endif
+ 
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+-- 
+2.37.3
+
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
index 690224e6d7..f9521acbc6 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-kernel-kvm-don-t-hardcode-objcopy.patch \
+           file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.3


