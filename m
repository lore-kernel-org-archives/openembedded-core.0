Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 355157887F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBLFnWd0012721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 07:49:32 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:31 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:20 -0500
Message-ID: <1ce378384cee638fe01733737af0a76c40ef2c2c.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.12: CQM and kmemleak fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2017 15:49:31 -0000
Content-Type: text/plain

Integrating the following commits for kmemleak fixes and CQM
backports:

   58fe84d691a mm: kmemleak: treat vm_struct as alternative reference to vmalloc'ed objects
   5babb9c8f695 mm: kmemleak: factor object reference updating out of scan_block()
   8c22ef5ee138 mm: kmemleak: slightly reduce the size of some structures on 64-bit architectures
   7ea6b560ef4c netfilter: conntrack: do not enable connection tracking unless needed
   4fdf0a5a0863 netfilter: nf_ct_dccp/sctp: fix memory leak after netns cleanup
   85385ffd1e9b netfilter: move table iteration out of netns exit paths
   c95b3f8e1cbc netfilter: conntrack: add nf_ct_iterate_destroy
   753c83b98a1e netfilter: conntrack: don't call iter for non-confirmed conntracks
   bcf21cba7fd5 netfilter: conntrack: rename nf_ct_iterate_cleanup
   f5c3a4c19075 perf/x86/intel/uncore: Fix missing marker for skx_uncore_cha_extra_regs
   c44ebea2f116 perf/x86/intel/uncore: Fix SKX CHA event extra regs
   1d70f7feb408 perf/x86/intel/uncore: Remove invalid Skylake server CHA filter field
   eb3059e9e0ea perf/x86/intel/uncore: Fix Skylake server CHA LLC_LOOKUP event umask
   3514c02c7bff perf/x86/intel/uncore: Fix Skylake server PCU PMU event format
   804530f02515 perf/x86/intel/uncore: Fix Skylake UPI PMU event masks

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 7fe078b17a40..25f3963c74d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8f6a2f93758166ef40e56f907a067801fee88d75"
+SRCREV_machine ?= "8dd0b4d434394e5293702c729164b424f2da6b57"
 SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 784efc07f42f..5f2118712d6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_machine ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
 SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 771c8b262c16..2911d14c1b64 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d293ce5ce9097c2a269cabed7ae6fcc66f92af09"
-SRCREV_machine_qemuarm64 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
-SRCREV_machine_qemumips ?= "3bac03d93aa8eda49cae6563ba13996460dffd4f"
-SRCREV_machine_qemuppc ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
-SRCREV_machine_qemux86 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
-SRCREV_machine_qemux86-64 ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
-SRCREV_machine_qemumips64 ?= "8c0a56e5a553ac3a985949ae8d0fc35d54779756"
-SRCREV_machine ?= "79394be8305b3c3ba2d6711ae48e08bf015fbae9"
+SRCREV_machine_qemuarm ?= "01295fb92f5b47c5ebdadd63497cc1f964a873ff"
+SRCREV_machine_qemuarm64 ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
+SRCREV_machine_qemumips ?= "674e17014797e9b085474eb6fef5bd6193a43218"
+SRCREV_machine_qemuppc ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
+SRCREV_machine_qemux86 ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
+SRCREV_machine_qemux86-64 ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
+SRCREV_machine_qemumips64 ?= "aea1b0ab4353dfdb326f40a913006261e37d2834"
+SRCREV_machine ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
 SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


