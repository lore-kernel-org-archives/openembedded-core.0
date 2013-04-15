Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1URhWn-0007lf-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:25:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7bcI003445; Mon, 15 Apr 2013 12:07:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u7bhDAIJL0Nb; Mon, 15 Apr 2013 12:07:37 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7YPb003428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Apr 2013 12:07:35 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1URhFf-0006UV-5K; Mon, 15 Apr 2013 12:07:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:01 +0100
Message-Id: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/7] kernel.bbclass: Ensure we have correct version information in deploy data
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000

Currently the names used for the kernel in deploy will contain "AUTOREV"
instead of the final incremental numbering. This fixes the problem by
ensuring data is obtained from the PR service and using the PKG* variables
instead of PE/PV/PR directly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8c8c95b..00e27ef 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -200,6 +200,7 @@ kernel_do_install() {
 		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
 	fi
 }
+do_install[prefuncs] += "package_get_auto_pr"
 
 sysroot_stage_all_append() {
 	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
@@ -333,11 +334,11 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
-MODULE_IMAGE_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 # Don't include the DATETIME variable in the sstate package signatures
@@ -386,6 +387,7 @@ kernel_do_deploy() {
 	cd -
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
+do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy before do_build after do_install
 
-- 
1.7.10.4



