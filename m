Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B40A16BBAB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s88Jth6G027426
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:24 -0400
Message-ID: <9004f2c195c4b71132ee10b122d6736efb0e51f1.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto: introduce v3.17
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:49 -0000
Content-Type: text/plain

With this commit, we introduce the v3.17-rcX kernels, which will be
released as part of the 1.7 yocto project.

All architectures have been compiled and booted with this revision
of the kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb | 21 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 37 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.17.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
new file mode 100644
index 000000000000..c1cb47ba9057
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -0,0 +1,21 @@
+KBRANCH ?= "standard/tiny/base"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "3.17-rc4"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
+SRCREV_meta ?= "7df849fc7eba54765368e26634341dbe6e2ad161"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
new file mode 100644
index 000000000000..7fe7fdaa4afb
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -0,0 +1,37 @@
+KBRANCH ?= "standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemumips ?= "standard/mti-malta32"
+KBRANCH_qemuppc  ?= "standard/qemuppc"
+KBRANCH_qemux86  ?= "standard/common-pc"
+KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
+KBRANCH_qemumips64 ?= "standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "4bacea69cf78bdf42bcf7619239294b8996c5dac"
+SRCREV_machine_qemumips ?= "69d4e97c23d4d031f55645cd0486064979e4db5c"
+SRCREV_machine_qemuppc ?= "4e5f8849093f71f8caebedd8af4660baace9bccb"
+SRCREV_machine_qemux86 ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
+SRCREV_machine_qemux86-64 ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
+SRCREV_machine_qemumips64 ?= "5e036fb17397a241fda2211a6caaa6e6f3121250"
+SRCREV_machine ?= "1a3939eb747a635b23b4234f785795c52dce72a8"
+SRCREV_meta ?= "7df849fc7eba54765368e26634341dbe6e2ad161"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+
+LINUX_VERSION ?= "3.17-rc4"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "meta"
+
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.8.1.2


