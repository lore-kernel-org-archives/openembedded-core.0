Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B2E5973130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 22:32:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 14:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,198,1484035200"; d="scan'208";a="52031066"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2017 14:32:10 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 14:32:04 -0800
Message-Id: <1487889124-8585-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
Cc: saul.wold@intel.com
Subject: [PATCH v2 1/1] kernel.bbclass: Make sanity check opt-out and provide easy opt-out
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
X-List-Received-Date: Thu, 23 Feb 2017 22:32:10 -0000

Having no opt-out method and adding the task to linux-yocto.inc was
causing issues. For example, linux-yocto-dev would often fail because
it uses AUTOREV with no way to dynamically change the PV.

Add a variable to turn off the sanity check to easily opt out.
Add the task to the kernel build by default so that it is not both
opt-in and opt out.
Set the opt-out variable in linux-yocto-dev, fixing the issue with
AUTOREV.

Note that this change *will* impact non linux-yocto kernel recipes, and
will require recipes using kernel.bbclass to either set the correct PV
or opt-out of the check.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
The only change from V1 to V2 is the updated commit message, changing
AUTOINC to AUTOREV and adding the blurb about impacting outside recipes.

I also agree with Richard in that this is a significant functionality change
and should not be backported.

 meta/classes/kernel.bbclass                  | 8 +++++++-
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto.inc    | 1 -
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 97cba92..731776e 100644
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
index a4e02db..d5579b2 100644
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


