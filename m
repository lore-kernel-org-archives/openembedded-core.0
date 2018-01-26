Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 088B278432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxTfg012491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:29 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:15 -0500
Message-ID: <dcbfa95d5dde7bcc35b80b8266b7c71c3120516c.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] linux-yocto/4.12: CQM and rdt backports
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:29 -0000
Content-Type: text/plain

Integrating the following fixes to CQM and rdt:

   6039d7e04ee9 x86/intel_rdt: Turn off most RDT features on Skylake
   bda0ec91ba67 x86/intel_rdt: Add command line options for resource director technology
   a3c30e14a0c6 x86/intel_rdt: Move special case code for Haswell to a quirk function
   8b85cfaa3e71 perf tests: Remove Intel CQM perf test
   c52eafb271db x86/intel_rdt: Remove redundant assignment
   59eded4485bd x86/intel_rdt/cqm: Make integer rmid_limbo_count static
   f353fcc5381a perf test: Add 'struct test *' to the test functions
   3ab7007dc138 perf tools: Remove warning()
   16373473698d tools: Adopt __printf from kernel sources
   1b6df81b0ec0 perf event-parse: Use pr_warning()
   49304e0a40bb tools: Adopt __noreturn from kernel sources
   404c63ba6ad9 x86/intel_rdt: Fix a silent failure when writing zero value schemata
   0ccb572e7d9a x86/intel_rdt: Initialize bitmask of shareable resource if CDP enabled
   9e35007e23ea x86/intel_rdt: Add diagnostics when making directories
   68cd327250f4 x86/intel_rdt: Add diagnostics when writing the cpus file
   d00dfe37ca54 x86/intel_rdt: Add diagnostics when writing the tasks file
   63536c68faa4 x86/intel_rdt: Add diagnostics when writing the schemata file
   b626cc5e2b2a x86/intel_rdt: Add framework for better RDT UI diagnostics
   cf0468526b24 x86/intel_rdt: Remove redundant ternary operator on return
   8bba47d15f54 x86/intel_rdt: Modify the intel_pqr_state for better performance
   dcddbbf53ff7 x86/intel_rdt/cqm: Clear the default RMID during hotcpu
   6d4f2689b04b x86/intel_rdt/cqm: Improve limbo list processing
   360834344240 x86/intel_rdt/mbm: Fix MBM overflow handler during CPU hotplug
   02a3de9b826d x86/intel_rdt: Show bitmask of shareable resource with other executing units
   cb73d2dea025 x86/intel_rdt/mbm: Handle counter overflow
   f8886547bdc5 x86/intel_rdt/mbm: Add mbm counter initialization
   77d89a70fbea x86/intel_rdt/mbm: Basic counting of MBM events (total and local)
   81825b49c811 x86/intel_rdt/cqm: Add CPU hotplug support
   e23cf266aac4 x86/intel_rdt/cqm: Add sched_in support
   b690bc426fdf x86/intel_rdt: Introduce rdt_enable_key for scheduling
   5a810cfc457c x86/intel_rdt/cqm: Add mount,umount support
   8ee1a2a746b7 x86/intel_rdt/cqm: Add rmdir support
   899eeb375632 x86/intel_rdt: Separate the ctrl bits from rmdir
   549388e78852 x86/intel_rdt/cqm: Add mon_data
   51d07512e645 x86/intel_rdt: Prepare for RDT monitor data support
   41b1dbc8e6d1 x86/intel_rdt/cqm: Add cpus file support
   6f2b9b502232 x86/intel_rdt: Prepare to add RDT monitor cpus file support
   1cf7f59b18bb x86/intel_rdt/cqm: Add tasks file support
   b84af6f5654d x86/intel_rdt: Change closid type from int to u32
   0ee69d488d44 x86/intel_rdt/cqm: Add mkdir support for RDT monitoring
   58da4f0768cf x86/intel_rdt: Prepare for RDT monitoring mkdir support
   ebc3f80d3cdd x86/intel_rdt/cqm: Add info files for RDT monitoring
   be500fe614a7 x86/intel_rdt: Simplify info and base file lists
   0a60b55c6fdd x86/intel_rdt/cqm: Add RMID (Resource monitoring ID) management
   14ddd52ae741 x86/intel_rdt/cqm: Add RDT monitoring initialization
   0d2a5b765e74 x86/intel_rdt: Make rdt_resources_all more readable
   5ecd779f63d9 x86/intel_rdt: Cleanup namespace to support RDT monitoring
   47715abe4ae3 x86/intel_rdt: Mark rdt_root and closid_alloc as static
   72c19e0f78e1 x86/intel_rdt: Change file names to accommodate RDT monitor code
   1d38ddcfa2b0 x86/intel_rdt: Introduce a common compile option for RDT
   7dd744520602 x86/intel_rdt/cqm: Documentation for resctrl based RDT Monitoring
   58d3bad357a9 x86/perf/cqm: Wipe out perf based cqm
   8f921be6408b perf/x86/intel/cqm: Use cpuhp_setup_state_cpuslocked()
   56b2f2883750 perf, bpf: Add BPF support to all perf_event types

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index a89c08d29d21..4c6921db516e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8dd0b4d434394e5293702c729164b424f2da6b57"
-SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
+SRCREV_machine ?= "b02d6a3f5b38dd38b5e0befb5961bd316a2daa97"
+SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 5f2118712d6f..5658e49d676e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
-SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
+SRCREV_machine ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 2911d14c1b64..7ffe0d50ff32 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "01295fb92f5b47c5ebdadd63497cc1f964a873ff"
-SRCREV_machine_qemuarm64 ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
-SRCREV_machine_qemumips ?= "674e17014797e9b085474eb6fef5bd6193a43218"
-SRCREV_machine_qemuppc ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
-SRCREV_machine_qemux86 ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
-SRCREV_machine_qemux86-64 ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
-SRCREV_machine_qemumips64 ?= "aea1b0ab4353dfdb326f40a913006261e37d2834"
-SRCREV_machine ?= "558fe84d691abbb8c8f5e149aa29ef4a478d0128"
-SRCREV_meta ?= "b66a4f9730339b3c0c4af1db03dd26da71e419d5"
+SRCREV_machine_qemuarm ?= "48ae2ebeea13e8d4c405a9a6930814ddfb2faf56"
+SRCREV_machine_qemuarm64 ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_machine_qemumips ?= "d8ffb4a5bf10ce1deeeb1a3b33a010e86bc4ec8b"
+SRCREV_machine_qemuppc ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_machine_qemux86 ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_machine_qemux86-64 ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_machine_qemumips64 ?= "96e53c9bac505c8783fa89edb5e047e99ab7784c"
+SRCREV_machine ?= "6039d7e04ee91c7fd40b1444fcca07be3fe0d5d9"
+SRCREV_meta ?= "358b2bb4d2bc8e790f69ea1778d7d16184b1ae34"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


