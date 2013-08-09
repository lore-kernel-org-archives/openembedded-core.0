Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A36DB6B589
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 17:54:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Aug 2013 10:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,847,1367996400"; d="scan'208";a="360325760"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2013 10:54:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:58:42 -0700
Message-Id: <1041db89535287764361b8902eb380b4541e985d.1376071122.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] kernel.bbclass: Correct post(inst|rm) package association
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
X-List-Received-Date: Fri, 09 Aug 2013 17:55:00 -0000

Fixes [YOCTO #4991]

The kernel image is installed as part of the kernel-image package, but
the symlink creation/removal via alternatives is being done in
pkg_post(inst|rm)_kernel-base.

Move the postinst alternatives logic into the kernel-image functions.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/kernel.bbclass |   29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ca49aec..e039dfc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -237,14 +237,6 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-pkg_postinst_kernel-base () {
-	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
-}
-
-pkg_postrm_kernel-base () {
-	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
-}
-
 inherit cml1
 
 EXPORT_FUNCTIONS do_compile do_install do_configure
@@ -272,14 +264,19 @@ ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
 pkg_postinst_kernel-image () {
-if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
-	mkdir -p $D/lib/modules/${KERNEL_VERSION}
-fi
-if [ -n "$D" ]; then
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
-else
-	depmod -a ${KERNEL_VERSION}
-fi
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
+		mkdir -p $D/lib/modules/${KERNEL_VERSION}
+	fi
+	if [ -n "$D" ]; then
+		depmodwrapper -a -b $D ${KERNEL_VERSION}
+	else
+		depmod -a ${KERNEL_VERSION}
+	fi
+}
+
+pkg_postrm_kernel-image () {
+	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
-- 
1.7.9.5


