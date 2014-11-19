Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B81D65DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 02:41:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ2f35O027860
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 18:41:03 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 18:41:03 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 20:41:02 -0600
Message-ID: <1416364862-213839-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] Add the output of depmod into kernel module .tgz file
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
X-List-Received-Date: Wed, 19 Nov 2014 02:41:08 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>


[ Sent for Yocto Project compliance, not believed to be generally applicable ]


do_rootfs() runs depmod on the final rootfs, so the depmod files are
in the rootfs image. But the kernel module .tgz doesn't have the files.
If you un-tar the new version of the kernel module .tgz on the board,
it will need to re-run depmod. The avoid this we are running depmod in
kernel_do_deploy() before generating the kernel .tgz.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/kernel.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e0c3a2e..f0e2a28 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -489,9 +489,15 @@ addtask uboot_mkimage before do_install after do_compile
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		# Generate modules.* files in order to adding the modules.* into kernel module tar ball
+		# after making the tar ball, remove the modules.* files to avoid unnecessary QA warnings.
 		mkdir -p ${D}/lib
-		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
+		cp -r ${D}/lib ${DEPLOYDIR}
+		(cd ${D}; cp --parent boot/System.map-${KERNEL_VERSION} ${DEPLOYDIR})
+		depmodwrapper -a -b ${DEPLOYDIR} ${KERNEL_VERSION}
+		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${DEPLOYDIR} lib boot/System.map-${KERNEL_VERSION}
 		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
+		rm -rf ${DEPLOYDIR}/lib ${DEPLOYDIR}/boot
 	fi
 
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
-- 
1.9.3


