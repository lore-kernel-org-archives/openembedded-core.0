Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EEED06093B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 23:55:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 09 Feb 2017 15:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,138,1484035200"; d="scan'208";a="932152010"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 09 Feb 2017 15:55:41 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 15:55:37 -0800
Message-Id: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] kernel.bbclass: Make sanity check opt-out and provide easy opt-out
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
X-List-Received-Date: Thu, 09 Feb 2017 23:55:42 -0000

Having no opt-out method and adding the task to linux-yocto.inc was
causing issues. For example, linux-yocto-dev would often fail because
it uses AUTOINC with no way to dynamically change the PV.

Add a variable to turn off the sanity check to easily opt out.
Add the task to the kernel build by default so that it is not both
opt-in and opt out.
Set the opt-out variable in linux-yocto-dev, fixing the issue with
AUTOINC.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/kernel.bbclass                  | 8 +++++++-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto.inc    | 1 -
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f462b2f..3968d8b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -325,6 +325,10 @@ do_install[prefuncs] += "package_get_auto_pr"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
+	if [ "x${KERNEL_VERSION_SANITY_SKIP}" = "x1" ]; then
+		exit 0
+	fi
+
 	# The Makefile determines the kernel version shown at runtime
 	# Don't use KERNEL_VERSION because the headers it grabs the version from aren't generated until do_compile
 	VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
@@ -348,11 +352,13 @@ do_kernel_version_sanity_check() {
 	reg="${reg}${EXTRAVERSION}"
 
 	if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
-		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source."
+		bbfatal "Package Version (${PV}) does not match of kernel being built (${vers}). Please update the PV variable to match the kernel source or set KERNEL_VERSION_SANITY_SKIP=\"1\" in your recipe."
 	fi
 	exit 0
 }
 
+addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
+
 addtask shared_workdir after do_compile before do_compile_kernelmodules
 addtask shared_workdir_setscene
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 0cda553..1410954 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -43,3 +43,4 @@ KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
 
+KERNEL_VERSION_SANITY_SKIP = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 556546f..3ea3e40 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -64,7 +64,6 @@ do_install_append(){
 }
 
 # extra tasks
-addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
 addtask kernel_link_images after do_compile before do_strip
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
-- 
2.5.5


