Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9A7607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 23:48:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2016 16:48:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,347,1470726000"; d="scan'208";a="10124390"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 16 Sep 2016 16:48:29 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 16:48:24 -0700
Message-Id: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Cc: bruce.ashfield@windriver.com
Subject: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Fri, 16 Sep 2016 23:48:29 -0000

The kernel being built should match what the recipe claims it is
building. This function ensures that happens by comparing the version
information in the kernel's Makefile to the PV the recipe is using.

v2 changes:
* Match against PV instead of LINUX_VERSION
* Match against EXTRAVERSION as well (e.g., -rc4)
* Cleaned up version string building

Fixes [YOCTO #6767].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/kernel.bbclass               | 30 ++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc |  1 +
 2 files changed, 31 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a6112e8..f894795 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -327,6 +327,36 @@ kernel_do_install() {
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
+# Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
+do_kernel_version_sanity_check() {
+	# The Makefile determines the kernel version shown at runtime
+	# Don't use KERNEL_VERSION because the headers it grabs the version from aren't generated until do_compile
+	VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
+	PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
+	SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
+	EXTRAVERSION=$(grep "^EXTRAVERSION =" ${S}/Makefile | sed s/.*=\ *//)
+
+	# Build a string for regex and a plain version string
+	reg="^${VERSION}\.${PATCHLEVEL}"
+	vers="${VERSION}.${PATCHLEVEL}"
+	if [ -n "${SUBLEVEL}" ]; then
+		# Ignoring a SUBLEVEL of zero is fine
+		if [ "${SUBLEVEL}" = "0" ]; then
+			reg="${reg}(\.${SUBLEVEL})?"
+		else
+			reg="${reg}\.${SUBLEVEL}"
+			vers="${vers}.${SUBLEVEL}"
+		fi
+	fi
+	vers="${vers}${EXTRAVERSION}"
+	reg="${reg}${EXTRAVERSION}"
+
+	if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
+		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source."
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


