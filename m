Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99DF86BA1C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 05:16:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7P5GtK4008258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 24 Aug 2013 22:16:55 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 24 Aug 2013 22:16:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 25 Aug 2013 01:16:39 -0400
Message-ID: <2a6e1a99b776f536e12c0de196eaa5d2f0a1025d.1377405083.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377405083.git.bruce.ashfield@windriver.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto: remove 3.8 recipes
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
X-List-Received-Date: Sun, 25 Aug 2013 05:16:56 -0000
Content-Type: text/plain

With the introduction of the 3.10 linux-yocto tree, 3.4 being the previous
LTSI kernel, and no reference BSPs using 3.8 as their reference BSP it
3.8 is no longer supported or required.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |   30 --------------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |   26 -----------------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   31 ---------------------
 3 files changed, 87 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
deleted file mode 100644
index 647ace6..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH = "standard/preempt-rt/base"
-KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
-
-LINUX_VERSION ?= "3.8.13"
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
-SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
-SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
-
-PR = "${INC_PR}.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-# Omit broken machines from COMPATIBLE_MACHINE
-#   qemuppc hangs at boot
-#   qemumips panics at boot
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
deleted file mode 100644
index 06d6b12..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-# We need lzma (as CONFIG_KERNEL_LZMA=y)
-DEPENDS += "xz-native"
-
-KBRANCH_DEFAULT = "standard/tiny/base"
-KBRANCH = "${KBRANCH_DEFAULT}"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-LINUX_VERSION ?= "3.8.13"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
-
-PR = "${INC_PR}.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
deleted file mode 100644
index 790e3e3..0000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH_DEFAULT = "standard/base"
-KBRANCH = "${KBRANCH_DEFAULT}"
-
-SRCREV_machine_qemuarm ?= "aa76cc28408376814752bd36fb0dcf0e25aa5ba3"
-SRCREV_machine_qemumips  ?= "aa0affda03c955678b26b2fb586f1d9505127871"
-SRCREV_machine_qemumips64 ?= "077bff22c9951db6b35470ba17b1df2f2a91fefb"
-SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
-SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
-SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-
-LINUX_VERSION ?= "3.8.13"
-
-PR = "${INC_PR}.2"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "meta"
-
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4


