Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 993FA60653
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:28:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4V3SsHA023012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 20:28:54 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 20:28:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 May 2013 23:28:45 -0400
Message-ID: <cc387443766296b405150da0693bba6b394b5875.1369970703.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369970703.git.bruce.ashfield@windriver.com>
References: <cover.1369970703.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto: remove 3.2 kernel recipes
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
X-List-Received-Date: Fri, 31 May 2013 03:28:54 -0000
Content-Type: text/plain

Moving forward we plan to support two kernels plus the development
kernel. That leaves 3.2 as the next kernel to be dropped. Support
for this version will be carried in the sustained/old releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |   29 ------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |   26 ----------------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   33 ---------------------
 3 files changed, 88 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
deleted file mode 100644
index 1f1b8de..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH = "standard/preempt-rt/base"
-KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
-
-LINUX_VERSION ?= "3.2.32"
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "d8f7347b67d909a999391c4b6f64447b0ccdc86a"
-SRCREV_machine_qemuppc ?= "65c57e1a8656830260aa56a25bc8512dcb68258a"
-SRCREV_meta ?= "e7f2fdc48f8808887175f0328274a2668084738c"
-
-PR = "${INC_PR}.0"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-# Omit broken machines from COMPATIBLE_MACHINE
-#   qemuppc hangs at boot
-#   qemumips panics at boot
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
-
-# Functionality flags
-KERNEL_FEATURES_append = "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
deleted file mode 100644
index 00f706b..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-# We need lzma (as CONFIG_KERNEL_LZMA=y)
-DEPENDS += "xz-native"
-
-KBRANCH_DEFAULT = "standard/tiny"
-KBRANCH = "${KBRANCH_DEFAULT}"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-LINUX_VERSION ?= "3.2.32"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "c07ec7159c3ede723953b0d603a7bb55d8614b44"
-SRCREV_meta ?= "e7f2fdc48f8808887175f0328274a2668084738c"
-
-PR = "${INC_PR}.0"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
deleted file mode 100644
index d080a69..0000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH = "standard/default/base"
-KBRANCH_qemux86  = "standard/default/common-pc/base"
-KBRANCH_qemux86-64  = "standard/default/common-pc-64/base"
-KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
-KBRANCH_qemumips = "standard/default/mti-malta32-be"
-KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
-
-LINUX_VERSION ?= "3.2.32"
-
-SRCREV_machine_qemuarm ?= "ec68698f59bed87be4e13954d5d2b9dc1f314b45"
-SRCREV_machine_qemumips  ?= "ce21a2ab86277e410fd2229a10c45be6c9d0aa17"
-SRCREV_machine_qemuppc ?= "edd27681039f2077d83eb02d7c1c44afb7b6224f"
-SRCREV_machine_qemux86 ?= "2223d2fb00365c168ec380bdcbef05ef89751c85"
-SRCREV_machine_qemux86-64 ?= "2d7956d7e3d15f69c923315c175847813f353d39"
-SRCREV_machine ?= "6970a8f4f7caa2633aa1ae0b51732b246eb581ef"
-SRCREV_meta ?= "e7f2fdc48f8808887175f0328274a2668084738c"
-
-PR = "${INC_PR}.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "meta"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES_append=" features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append=" features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-- 
1.7.10.4


