Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40E0373167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 04:34:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u284Y2b0007346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Mar 2016 20:34:02 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 20:34:02 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Mar 2016 23:33:57 -0500
Message-ID: <68c13fe3a4a7f4331e4b8efc889ff726d04ea22d.1457411284.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457411284.git.bruce.ashfield@windriver.com>
References: <cover.1457411284.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/kernel-meta: ktype refactoring: move DEBUG_KERNEL, EXPERT and EMBEDDED
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
X-List-Received-Date: Tue, 08 Mar 2016 04:34:03 -0000
Content-Type: text/plain

Integrating the folliwing patch series from Cal:

  This patch series refactors the ktypes so that base and standard ktypes
  do not enable EMBEDDED, EXPERT, or DEBUG_KERNEL. The reason this
  decision was made is because production platforms likely do not want
  DEBUG_KERNEL enabled, and EMBEDDED selects EXPERT which selects
  DEBUG_KERNEL.

  A new ktype called "developer" was also created. This ktype
  enables the options now missing from standard and base, making it easy
  to maintain the functionality of a BSP through simply swapping the ktype
  from standard to developer. The preempt-rt ktype is now based off of
  developer in order to maintain its functionality.

  The new standard ktype does not include EMBEDDED, EXPERT, or
  DEBUG_KERNEL. Without DEBUG_KERNEL it loses a number of debug features
  that are selected by default. Without EXPERT it gains RFKILL_INPUT and
  DEBUG_MEMORY_INIT, while losing VMSPLIT_3G. These are only available to
  configure with CONFIG_EXPERT=y and default to EXPERT or !EXPERT. Not
  selecting EMBEDDED has no apparent impacts.

  Some coordination is required for this change, as existing BSPs WILL be
  affected, and will either need to accept the changes in the standard
  ktype or move to the developer ktype.

  California Sullivan (12):
    features/debug: add debug-kernel feature
    ktypes: add developer ktype
    ktypes/base: Disable EMBEDDED and DEBUG_KERNEL
    CONFIG_PROCESSOR_SELECT: do not enable
    intel-common-drivers.scc: move profiling and latencytop to a new file
    romley.scc remove profiling and latencytop features
    bsp/intel-common: add intel-core* developer BSPs
    preempt-rt.scc: include developer ktype instead of standard
    intel-common: add intel-developer-drivers.scc to preempt-rt BSPs
    CONFIG_I2C_I801: set option to yes in intel-core* BSPs
    bsp: add developer common-pc BSPs
    bsp: remove profiling and latencytop from non-developer common-pc BSPs

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 7251c07fce81..41619d7296a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "853991833cc5140ca25450e81bf6b822d537a6ac"
-SRCREV_meta ?= "8b6a7d80344837fd64163008521a31a6f891313e"
+SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 0d35bc3ce8b0..5a0884a48706 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
-SRCREV_meta ?= "8b6a7d80344837fd64163008521a31a6f891313e"
+SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index c5f160d78691..9c3fe7f1dedb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
 SRCREV_machine_qemux86-64 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
 SRCREV_machine_qemumips64 ?= "8bbcb369cf605d1ada384f4b950da2abc5d1f4cc"
 SRCREV_machine ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
-SRCREV_meta ?= "8b6a7d80344837fd64163008521a31a6f891313e"
+SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


