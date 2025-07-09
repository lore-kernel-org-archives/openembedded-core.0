Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CEDC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:07:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web10.2414.1752080847884193328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nlp9A4/N;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752080848; x=1783616848;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MCw0JD8g4TpIPX9psIsIlV77YJnxt0ynJ/r2NO44VhE=;
  b=nlp9A4/NBjyntfKg4gVzcdma+OP14V7lrC7R6E0Lyl7cdkwcYbELoOTq
   6aunMd2ffXDNbvpTliKCaSIHYBnJkJoNsMm9vGAP3AT3svG8AIzOIqItr
   FVIXds+E6aD1gzgNlw0h0idoVPVEz++qsfzr5Pw9ou8w+p1DO8hyp5g3i
   RCXFmSZaGCSqhd7Eb6TVVVyhPkgYTWpYzv3gvQVqWY6I9fLQrJVRIdUTP
   VDY5QOWZT7q5LfAKzr5tvFZtWwVHeSZ6yo6vtle4HXqhlwCwfkCHzFxCh
   NVbOHENZt+q/KDYR9KmTFCCIhT7IWKvJvGPUmha3I4fhbCePdZAc8YwA+
   Q==;
X-CSE-ConnectionGUID: YtXKfouHRciK1q+hk2SztQ==
X-CSE-MsgGUID: Hhl/N1gmTmqKaUiau7KTow==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54321097"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54321097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 10:07:27 -0700
X-CSE-ConnectionGUID: O/QVoLivTxiqvIkhlayzUQ==
X-CSE-MsgGUID: lPQm2jvIR1mbp7qNKlEr6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="159855815"
Received: from andromeda02.png.intel.com (HELO andromeda02..) ([10.107.232.49])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 10:07:26 -0700
From: yogesh.tyagi@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] ltp: backport patch to fix compilation error for Skylake -march=x86-64-v3
Date: Thu, 10 Jul 2025 00:16:59 +0800
Message-Id: <20250709161659.383741-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 17:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220105

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

When the input compiler enables AVX, stack realignment requirements
causes gcc to fail to omit %rbp use, due to which the test fails to
clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
that the test continues working.

(From OE-Core rev: bbd3e7886e2ec5ab3578d618b28d007a80d917aa)

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


