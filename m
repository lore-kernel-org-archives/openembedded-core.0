Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A600C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web10.262.1750734529582836957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 20:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lzyqihuj;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750734530; x=1782270530;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JyroI3xiHGzbk0f05JB0orhS6cxZMRsQzcZOa9sQ9QA=;
  b=lzyqihujBjO98fH+HmbmSn7mJPbNEl/9XqU56HKAHxrfJwn0oG8ubtEB
   KE8s5gOufEh05zTEATPARnNlhRTUcBX0E4VJUypMjQdSvLtkOEMtM/Gv4
   DxCfNq/t++i9Ckr/CIST+Y87bB8NcQcVdg4s3JTnhBCG8dbxKnEcStc0G
   rgMFOKGtjYBaj58T+lbrqzw/MZWp98HZwS7eu325EDPYeWzfZBhl7MdYc
   OJEUg0llvmeuxr3Sss221hoy4wQV0lvIeTqqjT/1hvfOHQCL6nu7gT4y5
   bTK6woNE3p+9vI/U7JeupK2coZLtLGtgYQgSfN+7qguFa7UCC/kruhYnD
   w==;
X-CSE-ConnectionGUID: SDGFmdovSKOKEu4zAmYjOw==
X-CSE-MsgGUID: ojmjRzb6R2Wu2GSXb61i+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="78376145"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="78376145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:08:49 -0700
X-CSE-ConnectionGUID: PBmodDUZTqizIv5qAT4wbw==
X-CSE-MsgGUID: l2PCmG4RRf6mIf+hr89mLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="156353939"
Received: from ubuntu-22174.iind.intel.com ([10.49.1.8])
  by orviesa004.jf.intel.com with ESMTP; 23 Jun 2025 20:08:48 -0700
From: preeti.sachan@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] ltp: backport patch to fix compilation error for x86_64
Date: Tue, 24 Jun 2025 08:39:23 +0530
Message-Id: <20250624030923.2779799-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219259

From: Preeti Sachan <preeti.sachan@intel.com>

When the input compiler enables AVX, stack realignment requirements
causes gcc to fail to omit %rbp use, due to which the test fails to
clobber %rbp in inline asm.  Disable AVX to build the test on x86_64 so
that the test continues working.

Fix compilation with gcc v13.4+. Cherry picked from oe-core, master branch.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 ...cve-2015-3290-Disable-AVX-for-x86_64.patch | 42 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
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
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index f8e6d3987e..18c6439283 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-scenario_groups-default-remove-connectors.patch \
            file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
+           file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


