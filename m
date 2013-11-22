Return-Path: <mcrowe@brightsign.biz>
Received: from elite.brightsigndigital.co.uk
	(cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net [86.30.57.232])
	by mail.openembedded.org (Postfix) with ESMTP id 866536C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:04:41 +0000 (UTC)
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1VjrLc-0006UP-OF; Fri, 22 Nov 2013 14:04:40 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1VjrLc-0000GJ-N6; Fri, 22 Nov 2013 14:04:40 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 14:04:19 +0000
Message-Id: <1385129059-941-3-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385129059-941-1-git-send-email-mac@mcrowe.com>
References: <1385129059-941-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mcrowe@brightsign.biz>, Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and fix race
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
X-List-Received-Date: Fri, 22 Nov 2013 14:04:41 -0000

The new do_bundle_initramfs task defeats using the sstate cache. The kernel
is resurrected from the sstate cache but ends up being built again since
do_bundle_initramfs depends on do_compile. The do_bundle_initramfs task is
also marked nostamp which means it will always run.

The plan is to run do_bundle_initramfs before do_deploy and then move the
code to update the deploy directory to do_deploy but make it write to
${DEPLOYDIR} rather then ${DEPLOY_DIR_IMAGE}.

do_bundle_initramfs can also race against do_install since both call into
the kernel build system. This is fixed by making do_bundle_initramfs run
after do_install (and this therefore also fixes the problem that
3baa63b4d588c3262254528b406ede265dd117bf was addressing.)

Signed-off-by: Mike Crowe <mcrowe@brightsign.biz>
---
 meta/classes/kernel.bbclass |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ba13e67..4974507 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -134,25 +134,14 @@ do_bundle_initramfs () {
 		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
 		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
 		echo "${B}/${KERNEL_OUTPUT}.initramfs"
-		cd ${B}
-		# Update deploy directory
-		if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
-			echo "Copying deploy kernel-initramfs image and setting up links..."
-			initramfs_base_name=${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
-			install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
-			cd ${DEPLOY_DIR_IMAGE}
-			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
-		fi
 	fi
 }
-do_bundle_initramfs[nostamp] = "1"
 
 python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_compile before do_build
+addtask bundle_initramfs after do_install before do_deploy
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -479,6 +468,17 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+
+	cd ${B}
+	# Update deploy directory
+	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
+		echo "Copying deploy kernel-initramfs image and setting up links..."
+		initramfs_base_name=${INITRAMFS_BASE_NAME}
+		initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
+		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
+		cd ${DEPLOYDIR}
+		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
+	fi
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
-- 
1.7.10.4


