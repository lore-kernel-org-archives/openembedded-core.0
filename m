Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63880719DD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:59:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="1122912395"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.85.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2017 12:59:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  6 Feb 2017 12:59:09 -0800
Message-Id: <1486414751-24947-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
References: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH] linux-intel: Add the linux-intel kernel recipe
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
X-List-Received-Date: Mon, 06 Feb 2017 20:59:14 -0000

This introduces the linux-intel kernel recipe for 4.9, this
kernel tree is a prodcution tree that contains enabling backports
for Intel CPU and Hardware that may be up-streamed in a newer
kernel version.

Additional information can be found in this associated wiki page:
https://github.com/01org/linux-intel-4.9/wiki

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 common/recipes-kernel/linux/linux-intel_4.9.bb | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 common/recipes-kernel/linux/linux-intel_4.9.bb

diff --git a/common/recipes-kernel/linux/linux-intel_4.9.bb b/common/recipes-kernel/linux/linux-intel_4.9.bb
new file mode 100644
index 0000000..7cc377a
--- /dev/null
+++ b/common/recipes-kernel/linux/linux-intel_4.9.bb
@@ -0,0 +1,46 @@
+
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH ?= "master"
+SRCREV_machine ?= "09f886dc5a6945679ed35e6acfbc746f472f0f34"
+SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
+
+SRC_URI = "git://github.com/01org/linux-intel-4.9.git;protocol=https;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "4.9.6"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+KERNEL_FEATURES_INTEL_COMMON = ""
+
+COMPATIBLE_MACHINE_core2-32-intel-common = "${MACHINE}"
+KMACHINE_core2-32-intel-common = "intel-core2-32"
+KERNEL_FEATURES_append_core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+
+COMPATIBLE_MACHINE_corei7-64-intel-common = "${MACHINE}"
+KMACHINE_corei7-64-intel-common = "intel-corei7-64"
+KERNEL_FEATURES_append_corei7-64-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+
+COMPATIBLE_MACHINE_i586-nlp-32-intel-common = "${MACHINE}"
+KMACHINE_i586-nlp-32-intel-common = "intel-quark"
+KERNEL_FEATURES_append_i586-nlp-32-intel-common = ""
+
+# For Crystalforest and Romley
+KERNEL_MODULE_AUTOLOAD_append_core2-32-intel-common = " uio"
+KERNEL_MODULE_AUTOLOAD_append_corei7-64-intel-common = " uio"
+
+# For FRI2, NUC
+KERNEL_MODULE_AUTOLOAD_append_core2-32-intel-common = " iwlwifi"
+KERNEL_MODULE_AUTOLOAD_append_corei7-64-intel-common = " iwlwifi"
+
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+
+
-- 
2.7.4


