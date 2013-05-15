Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <drew_moseley@mentor.com>) id 1UcQTs-0007OP-Uc
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 03:26:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UcQ3I-0001FD-Uz from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 17:58:44 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 14 May 2013 17:58:44 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 14 May 2013 17:58:44 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 17:59:05 -0700
Message-Id: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 15 May 2013 00:58:44.0744 (UTC)
	FILETIME=[596FC080:01CE5107]
Subject: [PATCH] kernel: Package additional modules files needed for systemtap
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
X-List-Received-Date: Wed, 15 May 2013 01:26:23 -0000

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/classes/kernel.bbclass |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6ba31bd..f23818e 100644
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
@@ -259,7 +257,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
 FILES = ""
-FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
+FILES_kernel-image = " \
+	/boot/${KERNEL_IMAGETYPE}* \
+	${base_libdir}/modules/${KERNEL_VERSION}/modules.order \
+	${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin \
+"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 RDEPENDS_kernel = "kernel-base"
-- 
1.7.9.5



