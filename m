Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1UFVot-0000F3-48
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:29:15 +0100
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJK00II0DGGCPB0@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 15:12:17 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3EC512008D; Tue,
	12 Mar 2013 16:12:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 16:11:54 -0400
Message-id: <1363119114-5177-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH][for-danny] kernel.bbclass: Add missing modules.order and modules.builtins
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
X-List-Received-Date: Tue, 12 Mar 2013 20:29:25 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When running depmod, from kmod, warnings about missing modules.order
and modules.builtins occur.  Looking back it is not clear why these
files were being ignored, other then nobody knew what to do with them.

Add the files into the kernel-base package, if they exist, ensuring
they will always get installed if at least one module is installed.

[ YOCTO #3963 ]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 88ce561..fd46711 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -108,8 +108,6 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
-		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
-		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
 	else
@@ -259,6 +257,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
 FILES = ""
+FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
-- 
1.8.1.5



