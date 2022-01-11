Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9768CC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 14:33:15 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.8008.1641911590548367744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JY0MlOio;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641911590; x=1673447590;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZevxML+zW5JOVxpQQzVuu2QNW3SYT29e0sr8JuKQzgQ=;
  b=JY0MlOioI4L5/inK7Xn/BZjgOovGmRvdx+CewaK6dAi1wi/7dEo+Y6N/
   vS81SBCAjRBx+7A5niagn3bE6N2nF36Mc/Qiyxv72SGTV2ghC7QxVQj8h
   qeC8RifxIwaW9KkTzfOXhT+56Tm/k8orbjVIG1FX0aX3e+LfiLzlQURw9
   RFxbsEGNM78V+R3i5gz7pJcY/6ZcUyJYwROQroUclKthBNlC3SVq2NjHR
   hgLcpuUXhCNKQuDyAXDylXOjAoHEp8HQXGOa7aFDL1Iu+S/6hkGUQ7T5g
   iId+j1AB+g0Ve8I9qy3Sn3nWiG+QngSYXPBUs+NpvNchR/PZRvwc+16tQ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224192530"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="224192530"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="623086341"
Received: from wongkye-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.187])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 2/9] gcc: add aarch64 support for Arm's Neoverse N2
 CPU
Date: Tue, 11 Jan 2022 22:32:46 +0800
Message-Id: 
 <ae9b3b5a57682d9de93f3171cdb448a8f5cbc536.1641911316.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641911316.git.anuj.mittal@intel.com>
References: <cover.1641911316.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 14:33:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160404

From: pgowda <pgowda.cve@gmail.com>

The patch backports the AArch64 support for Arm's Neoverse N2 CPU
Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
 .../gcc/0039-arm64-neoverse-n2-support.patch  | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 5626bf20f0..89158258d7 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
+           file://0039-arm64-neoverse-n2-support.patch \
 "
 SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
new file mode 100644
index 0000000000..b3e0f396bd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
@@ -0,0 +1,60 @@
+From 9428e9267435a62f672e2ba42df46432c021a9cf Mon Sep 17 00:00:00 2001
+From: Alex Coplan <alex.coplan@arm.com>
+Date: Tue, 29 Sep 2020 17:09:09 +0100
+Subject: [PATCH] aarch64: Add support for Neoverse N2 CPU
+
+This patch backports the AArch64 support for Arm's Neoverse N2 CPU to
+GCC 10.
+
+gcc/ChangeLog:
+
+	* config/aarch64/aarch64-cores.def: Add Neoverse N2.
+	* config/aarch64/aarch64-tune.md: Regenerate.
+	* doc/invoke.texi: Document AArch64 support for Neoverse N2.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf]
+
+Signed-off-by: pgowda <pgowda.cve@gmail.com>
+---
+ gcc/config/aarch64/aarch64-cores.def | 3 +++
+ gcc/config/aarch64/aarch64-tune.md   | 2 +-
+ gcc/doc/invoke.texi                  | 4 ++--
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
+--- a/gcc/config/aarch64/aarch64-cores.def	2020-07-22 23:35:17.320384289 -0700
++++ b/gcc/config/aarch64/aarch64-cores.def	2021-12-21 01:08:45.518472342 -0800
+@@ -135,6 +135,9 @@ AARCH64_CORE("zeus", zeus, cortexa57, 8_
+ /* Qualcomm ('Q') cores. */
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -1)
+ 
++/* Armv8.5-A Architecture Processors.  */
++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen1, 0x41, 0xd49, -1)
++
+ /* ARMv8-A big.LITTLE implementations.  */
+ 
+ AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
+diff --git a/gcc/config/aarch64/aarch64-tune.md b/gcc/config/aarch64/aarch64-tune.md
+--- a/gcc/config/aarch64/aarch64-tune.md	2020-07-22 23:35:54.684795913 -0700
++++ b/gcc/config/aarch64/aarch64-tune.md	2021-12-21 01:09:56.829252050 -0800
+@@ -1,5 +1,5 @@
+ ;; -*- buffer-read-only: t -*-
+ ;; Generated automatically by gentune.sh from aarch64-cores.def
+ (define_attr "tune"
+-	"cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunderx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
++	"cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunderx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,neoversen2,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
+ 	(const (symbol_ref "((enum attr_tune) aarch64_tune)")))
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-21 00:50:18.345426447 -0800
++++ b/gcc/doc/invoke.texi	2021-12-21 01:11:18.547853686 -0800
+@@ -17010,8 +17010,8 @@ performance of the code.  Permissible va
+ @samp{cortex-a57}, @samp{cortex-a72}, @samp{cortex-a73}, @samp{cortex-a75},
+ @samp{cortex-a76}, @samp{cortex-a76ae}, @samp{cortex-a77},
+ @samp{cortex-a65}, @samp{cortex-a65ae}, @samp{cortex-a34},
+-@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
+-@samp{neoverse-e1},@samp{neoverse-n1},@samp{qdf24xx}, @samp{saphira},
++@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor}, @samp{neoverse-e1},
++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{qdf24xx}, @samp{saphira},
+ @samp{phecda}, @samp{xgene1}, @samp{vulcan}, @samp{octeontx},
+ @samp{octeontx81},  @samp{octeontx83},
+ @samp{octeontx2}, @samp{octeontx2t98}, @samp{octeontx2t96}
-- 
2.34.1


