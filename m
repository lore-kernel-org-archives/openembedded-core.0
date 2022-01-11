Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95420C4167E
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 14:33:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.7795.1641911594309733958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nhGPFC+Y;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641911598; x=1673447598;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hcvrI/IPIuV4hMgDJAg41K+zqTE1QGJqfIOrfDMToFQ=;
  b=nhGPFC+YSHRAs9DqNJD9sTVbG9g/wf1iMWD08DKmSjvXkB6ckdbIxKgQ
   JL7oNSi+6478fIHPhgWCa93Z9DL8W8OBRHF0lpnyqPVkJD9M8FFVQCUVR
   cWQfwOiIqWZvnhFxLC8/qn4hLyv3I82V0NqLQoBpZv59dLt0OCG+FrnoN
   VnwwHqDkVRjVPQqmXijlxf4VSZYuVW5eSRRVxgA/JjspEszP65whTGKiC
   KrpfCIl1FJdTQ69tHMsKzcsl0rJ7z+JKlG97aFpetj/UZRm+GDCq9J9E1
   zqrgkAF2mPQuo/MkSEls37bx9NZKsgGLWhO4nZlVzMuExBgF2LLNRgLEU
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="329839034"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="329839034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="623086463"
Received: from wongkye-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.187])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 8/9] gcc: add support for Neoverse N2 CPU
Date: Tue, 11 Jan 2022 22:32:52 +0800
Message-Id: 
 <2f5f021dc576b2fcf38c8203992ee86d25f53f30.1641911316.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641911316.git.anuj.mittal@intel.com>
References: <cover.1641911316.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 14:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160412

From: Pgowda <pgowda.cve@gmail.com>

This patch backports the AArch32 support for Arm's Neoverse N2 CPU.

Upstream-Status: Backport
[https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
 .../gcc/0038-arm-neoverse-n2-support.patch    | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 656c43258c..e7e3395c55 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
+           file://0038-arm-neoverse-n2-support.patch \
            file://0039-arm64-neoverse-n2-support.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
new file mode 100644
index 0000000000..3e42266b81
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
@@ -0,0 +1,88 @@
+From d7e8411f6a333d4054894ad3b23f23415a525230 Mon Sep 17 00:00:00 2001
+From: Alex Coplan <alex.coplan@arm.com>
+Date: Fri, 2 Oct 2020 16:06:15 +0100
+Subject: [PATCH] arm: Add support for Neoverse N2 CPU
+
+This patch backports the AArch32 support for Arm's Neoverse N2 CPU to
+GCC 10.
+
+gcc/ChangeLog:
+
+	* config/arm/arm-cpus.in (neoverse-n2): New.
+	* config/arm/arm-tables.opt: Regenerate.
+	* config/arm/arm-tune.md: Regenerate.
+	* doc/invoke.texi: Document support for Neoverse N2.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
+
+Signed-off-by: pgowda <pgowda.cve@gmail.com>
+---
+ gcc/config/arm/arm-cpus.in    | 12 ++++++++++++
+ gcc/config/arm/arm-tables.opt |  3 +++
+ gcc/config/arm/arm-tune.md    |  5 +++--
+ gcc/doc/invoke.texi           |  6 +++---
+ 4 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
+--- a/gcc/config/arm/arm-cpus.in	2021-12-20 20:24:59.912159845 -0800
++++ b/gcc/config/arm/arm-cpus.in	2021-12-20 21:00:04.417003845 -0800
+@@ -1481,6 +1481,18 @@ begin cpu cortex-a76.cortex-a55
+  costs cortex_a57
+ end cpu cortex-a76.cortex-a55
+ 
++# Armv8.5 A-profile Architecture Processors
++begin cpu neoverse-n2
++  cname neoversen2
++  tune for cortex-a57
++  tune flags LDSCHED
++  architecture armv8.5-a+fp16+bf16+i8mm
++  option crypto add FP_ARMv8 CRYPTO
++  costs cortex_a57
++  vendor 41
++  part 0xd49
++end cpu neoverse-n2
++
+ # V8 M-profile implementations.
+ begin cpu cortex-m23
+  cname cortexm23
+diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
+--- a/gcc/config/arm/arm-tables.opt	2020-07-22 23:35:54.688795958 -0700
++++ b/gcc/config/arm/arm-tables.opt	2021-12-20 21:00:04.421003776 -0800
+@@ -253,6 +253,9 @@ EnumValue
+ Enum(processor_type) String(cortex-m23) Value( TARGET_CPU_cortexm23)
+ 
+ EnumValue
++Enum(processor_type) String(neoverse-n2) Value( TARGET_CPU_neoversen2)
++
++EnumValue
+ Enum(processor_type) String(cortex-m33) Value( TARGET_CPU_cortexm33)
+ 
+ EnumValue
+diff --git a/gcc/config/arm/arm-tune.md b/gcc/config/arm/arm-tune.md
+--- a/gcc/config/arm/arm-tune.md	2020-07-22 23:35:54.684795913 -0700
++++ b/gcc/config/arm/arm-tune.md	2021-12-20 21:02:44.630260284 -0800
+@@ -46,6 +46,6 @@
+ 	cortexa73cortexa53,cortexa55,cortexa75,
+ 	cortexa76,cortexa76ae,cortexa77,
+ 	neoversen1,cortexa75cortexa55,cortexa76cortexa55,
+-	cortexm23,cortexm33,cortexm35p,
+-	cortexm55,cortexr52"
++	neoversen2,cortexm23,cortexm33,
++	cortexm35p,cortexm55,cortexr52"
+ 	(const (symbol_ref "((enum attr_tune) arm_tune)")))
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-20 20:24:59.916159782 -0800
++++ b/gcc/doc/invoke.texi	2021-12-20 21:03:41.337290704 -0800
+@@ -18857,9 +18857,9 @@ Permissible names are: @samp{arm7tdmi},
+ @samp{cortex-m35p}, @samp{cortex-m55},
+ @samp{cortex-m1.small-multiply}, @samp{cortex-m0.small-multiply},
+ @samp{cortex-m0plus.small-multiply}, @samp{exynos-m1}, @samp{marvell-pj4},
+-@samp{neoverse-n1}, @samp{xscale}, @samp{iwmmxt}, @samp{iwmmxt2},
+-@samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te}, @samp{fa626te},
+-@samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{xscale}, @samp{iwmmxt},
++@samp{iwmmxt2}, @samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te},
++@samp{fa626te}, @samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
+ 
+ Additionally, this option can specify that GCC should tune the performance
+ of the code for a big.LITTLE system.  Permissible names are:
-- 
2.34.1


