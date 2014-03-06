Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E405C6F5AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:09:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 09:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487325532"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 09:09:40 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:09:29 -0600
Message-Id: <a0c82119ec77c1ad5c8b6a7dc941a96eaeba3fe7.1394124934.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394124934.git.tom.zanussi@linux.intel.com>
References: <cover.1394124934.git.tom.zanussi@linux.intel.com>
Subject: [PATCH 4/6] lttng-modules: Exclude arm
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
X-List-Received-Date: Thu, 06 Mar 2014 17:09:52 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

lttng-modules and gcc-4.8 don't mix, according to the lttng ML
'current_thread_info() not respecting program order with gcc 4.8.x',
so remove it from arm builds.

Without lttng-modules, lttng-tools etc don't make sense either so
exclude them as well.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 4 ++++
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb                   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 4a97c24..8771dbe 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -52,15 +52,19 @@ SYSTEMTAP_aarch64 = ""
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-uclibc = ""
 LTTNGUST_aarch64 = ""
+LTTNGUST_arm = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_aarch64 = ""
+LTTNGTOOLS_arm = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_aarch64 = ""
+LTTNGMODULES_arm = ""
 
 BABELTRACE = "babeltrace"
 BABELTRACE_aarch64 = ""
+BABELTRACE_arm = ""
 
 # valgrind does not work on mips
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
index 0b7d5e8..79d9382 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
@@ -13,6 +13,9 @@ inherit module
 SRCREV = "fb2c37799306d16fb590aebee6fad8be431264b7"
 PV = "2.4.0"
 
+# lttng currently blacklists arm with gcc-4.8
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
+
 SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.4 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
@@ -20,6 +23,7 @@ export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
 
 
+
 S = "${WORKDIR}/git"
 
 do_install_append() {
-- 
1.8.3.1


