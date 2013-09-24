Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 74C146C994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 17:15:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OHFeZH005602;
	Tue, 24 Sep 2013 12:15:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OHFeGX009627;
	Tue, 24 Sep 2013 12:15:40 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 24 Sep 2013 12:15:40 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OHFanO021373;
	Tue, 24 Sep 2013 12:15:38 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Sep 2013 12:58:20 -0500
Message-ID: <1380045500-10798-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [for dylan][PATCH] kernel.bbclass: Correct post(inst|rm) package association
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
X-List-Received-Date: Tue, 24 Sep 2013 17:15:44 -0000
Content-Type: text/plain

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO #4991]

The kernel image is installed as part of the kernel-image package, but
the symlink creation/removal via alternatives is being done in
pkg_post(inst|rm)_kernel-base.

Move the postinst alternatives logic into the kernel-image functions.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel.bbclass |   29 +++++++++++++----------------
 1 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3320747..c417038 100644
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
1.7.0.4


