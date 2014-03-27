Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 998C16F943
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:25:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2RIPPiB015835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 11:25:25 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 11:25:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 27 Mar 2014 14:25:05 -0400
Message-ID: <a047b35664364fc8577f758f70cd781b9d675bb1.1395944068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395944068.git.bruce.ashfield@windriver.com>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 10/13] linux-yocto/3.14: introduce versioned recipes
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
X-List-Received-Date: Thu, 27 Mar 2014 18:25:26 -0000
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
index 000000000000..8faa9584acf0
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -0,0 +1,21 @@
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/tiny/base"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+LINUX_VERSION ?= "3.14-rc8"
+
+KMETA = "meta"
+
+SRCREV_machine ?= "fecc3fd7d31bd93766ff4f0431fecdbbfa4c3a7c"
+SRCREV_meta ?= "3689f99f4d2a051e8d3ff72345a67d4d04a88020"
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
index 000000000000..4ef9fb5780d1
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
+SRCREV_machine_qemuarm ?= "0654f2bd12d0297df0ee103192d218cb6ec7c6fe"
+SRCREV_machine_qemumips ?= "7c62bc81b74205c6e09cca4997d28888aadbd507"
+SRCREV_machine_qemuppc ?= "1e45bd09d77a7d98abb70a473184f176ee6130aa"
+SRCREV_machine_qemux86 ?= "fecc3fd7d31bd93766ff4f0431fecdbbfa4c3a7c"
+SRCREV_machine_qemux86-64 ?= "fecc3fd7d31bd93766ff4f0431fecdbbfa4c3a7c"
+SRCREV_machine_qemumips64 ?= "b7834de6840292871f930ef0bd9a057b1dd4f676"
+SRCREV_machine ?= "fecc3fd7d31bd93766ff4f0431fecdbbfa4c3a7c"
+SRCREV_meta ?= "3689f99f4d2a051e8d3ff72345a67d4d04a88020"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+
+LINUX_VERSION ?= "3.14-rc8"
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


