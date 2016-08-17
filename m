Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0414E75EE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:27:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2016 19:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="1015661361"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2016 19:27:59 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 22:25:01 -0700
Message-Id: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH RFC 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Wed, 17 Aug 2016 02:27:59 -0000

The kernel being built should match what the recipe claims it is
building. This function ensures that happens for anyone using
LINUX_VERSION as they should. As it will likely break outside kernels
not using LINUX_VERSION, only enable the function for linux-yocto for
now.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
I'm not absolutely sure this is the correct path to solve the issue.
This patch relies on LINUX_VERSION being set which isn't a guarantee.
There is probably a more general solution that I'm not thinking of.

 meta/classes/kernel.bbclass               | 21 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc |  1 +
 2 files changed, 22 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index db42744..ac2611f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -330,6 +330,27 @@ kernel_do_install() {
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
+# Must be ran some time after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
+do_kernel_version_sanity_check() {
+	# The Makefile determines the kernel version shown at runtime
+	# Don't use KERNEL_VERSION because the headers it grabs the version from aren't generated until do_compile
+	VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ //)
+	PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ //)
+	SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ //)
+
+	# If SUBLEVEL is zero or doesn't exist we ignore it as VERSION.PATCHLEVEL is normal
+	if [ -n "${SUBLEVEL}" ] && [ "${SUBLEVEL}" != "0" ]; then
+		if [ "${VERSION}.${PATCHLEVEL}.${SUBLEVEL}" != "${LINUX_VERSION}" ]; then
+			bbfatal "LINUX_VERSION (${LINUX_VERSION}) does not match kernel being built (${VERSION}.${PATCHLEVEL}.${SUBLEVEL}).\nTo fix this correct the LINUX_VERSION variable in your kernel recipe."
+		fi
+	else
+		if [ "${VERSION}.${PATCHLEVEL}" != "${LINUX_VERSION}" ]; then
+			bbfatal "LINUX_VERSION (${LINUX_VERSION}) does not match kernel being built (${VERSION}.${PATCHLEVEL}).\nTo fix this correct the LINUX_VERSION variable in your kernel recipe."
+		fi
+	fi
+	exit 0
+}
+
 addtask shared_workdir after do_compile before do_compile_kernelmodules
 addtask shared_workdir_setscene
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 98a48ec..d979662 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -55,6 +55,7 @@ do_install_append(){
 }
 
 # extra tasks
+addtask kernel_version_sanity_check after do_kernel_checkout before do_compile
 addtask kernel_link_images after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
2.5.5


