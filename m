Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24D7371218
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cnYa007797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:49 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:20 -0400
Message-ID: <8b7472a97f6128bd2b428d5c7d718fd00775bdfc.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/18] linux-yocto/3.4: remove 3.4 name recipes
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:49 -0000
Content-Type: text/plain

Removing the 3.4 recipes, since support has not shifted to 3.10 and
3.14 for LTSI kernel versions, with 3.16+ as the development version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   | 30 ------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb | 25 ---------------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      | 37 -----------------------
 3 files changed, 92 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
deleted file mode 100644
index 6929dfaec198..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH ?= "standard/preempt-rt/base"
-KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
-
-LINUX_VERSION ?= "3.4.91"
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "5993b0a650d24f810edb22bab577287d0c6d4f4b"
-SRCREV_machine_qemuppc ?= "765d61e4883bb6db3be516722465f2e8d1fc73cd"
-SRCREV_meta ?= "a8742041c8b9f447d4ad4c3f478e022f1e4bfcfd"
-
-PR = "${INC_PR}.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-# Omit broken machines from COMPATIBLE_MACHINE
-#   qemuppc hangs at boot
-#   qemumips panics at boot
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
-
-# Functionality flags
-KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
deleted file mode 100644
index bad6b8f4eb9b..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-# We need lzma (as CONFIG_KERNEL_LZMA=y)
-DEPENDS += "xz-native"
-
-KBRANCH ?= "standard/tiny/base"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-LINUX_VERSION ?= "3.4.91"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "498189ccb98f833daa2092ceee72da8c878e0009"
-SRCREV_meta ?= "a8742041c8b9f447d4ad4c3f478e022f1e4bfcfd"
-
-PR = "${INC_PR}.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
deleted file mode 100644
index 3538afcf9809..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH = "standard/base"
-
-# board specific branches
-KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
-KBRANCH_qemumips ?= "standard/mti-malta32"
-KBRANCH_qemuppc  ?= "standard/qemuppc"
-KBRANCH_qemux86  ?= "standard/common-pc/base"
-KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "192b56b2f529af1be014ea85667c9f3fea0afd53"
-SRCREV_machine_qemumips  ?= "58fb8b8fb2f9911cac84cd840d63c8a58bada6ca"
-SRCREV_machine_qemuppc ?= "4fe50989bc8bcb3564ca37c2cffd42ac176b428d"
-SRCREV_machine_qemux86 ?= "498189ccb98f833daa2092ceee72da8c878e0009"
-SRCREV_machine_qemux86-64 ?= "498189ccb98f833daa2092ceee72da8c878e0009"
-SRCREV_machine ?= "498189ccb98f833daa2092ceee72da8c878e0009"
-SRCREV_meta ?= "a8742041c8b9f447d4ad4c3f478e022f1e4bfcfd"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-
-LINUX_VERSION ?= "3.4.91"
-
-PR = "${INC_PR}.5"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "meta"
-
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.8.1.2


