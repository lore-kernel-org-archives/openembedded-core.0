Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9396E446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:56:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2VHufR1017297
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 10:56:41 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 31 Mar 2014 10:56:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 13:56:29 -0400
Message-ID: <22ec9615b07180f5dbf66109b9e1da5ac2cff8a0.1396288310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396288310.git.bruce.ashfield@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/3.14: introduce versioned recipes
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
X-List-Received-Date: Mon, 31 Mar 2014 17:56:42 -0000
Content-Type: text/plain

The release kernel for Yocto 1.5 is the 3.14 kernel, so we introduce
the versioned recipes here.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 21 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 37 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
new file mode 100644
index 000000000000..2e142bfd9029
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -0,0 +1,21 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/tiny/base"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+LINUX_VERSION ?= "3.14"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
+SRCREV_meta ?= "fc8c30398dbc3cdea787a1042242d4aab689d0ae"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+
+COMPATIBLE_MACHINE = "(qemux86)"
+
+# Functionality flags
+KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
new file mode 100644
index 000000000000..d5202cd4391a
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -0,0 +1,37 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/base"
+
+# board specific branches
+KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
+KBRANCH_qemumips = "standard/mti-malta32"
+KBRANCH_qemuppc  = "standard/qemuppc"
+KBRANCH_qemux86  = "standard/common-pc/base"
+KBRANCH_qemux86-64  = "standard/common-pc-64/base"
+KBRANCH_qemumips64 = "standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "c966987f88a0ee5753c3dee87e7a962d0cad5376"
+SRCREV_machine_qemumips ?= "61811c215c601ee96ccbf79333bbc73482b0f017"
+SRCREV_machine_qemuppc ?= "0d5cf5e938f4e6d3c6a398e98c8ece3ce05539f7"
+SRCREV_machine_qemux86 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
+SRCREV_machine_qemux86-64 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
+SRCREV_machine_qemumips64 ?= "ccb2a788551a7951563ac44a27175c6f28501008"
+SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
+SRCREV_meta ?= "fc8c30398dbc3cdea787a1042242d4aab689d0ae"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+
+LINUX_VERSION ?= "3.14"
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
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.8.1.2


