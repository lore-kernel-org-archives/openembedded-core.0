Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTUPN-0005XN-2I
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 09:11:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Nov 2011 00:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79466793"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 00:05:14 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 00:05:07 -0800
Message-Id: <2f0f0678d5538da2ff34a9bdb82ed140fd0a8b54.1322120651.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
References: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1322120651.git.dvhart@linux.intel.com>
References: <cover.1322120651.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [RFC PATCH 2/5] bootimg: Refactor build_hddimg and build_iso routines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 08:11:49 -0000

Separate the construction of the ISO image from that of the hddimg.
This is part of the groundwork for creating a much more flexible
live image builder.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/bootimg.bbclass |   82 ++++++++++++++++++++++--------------------
 1 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 49ee85e..26d2fae 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -47,7 +47,47 @@ SYSLINUXMENU = "${HDDDIR}/menu"
 
 inherit syslinux
 		
-build_boot_bin() {
+build_iso() {
+	# Only create an ISO if we have an INITRD and NOISO was not set
+	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
+		bbnote "ISO image will not be created."
+		return
+	fi
+
+	install -d ${ISODIR}
+
+	# Install the kernel
+	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
+	        ${ISODIR}/vmlinuz
+
+	# Install the configuration files
+	cp ${HDDDIR}/syslinux.cfg ${ISODIR}/isolinux.cfg
+
+	if [ -f ${SYSLINUXMENU} ]; then
+		cp ${SYSLINUXMENU} ${ISODIR}
+	fi
+
+	install -m 0644 ${INITRD} ${ISODIR}/initrd
+
+	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then 
+		install -m 0644 ${ROOTFS} ${ISODIR}/rootfs.img
+	fi
+
+	# And install the syslinux stuff 
+	cp ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}
+
+	mkisofs -V ${BOOTIMG_VOLUME_ID} \
+	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+	-b isolinux/isolinux.bin -c isolinux/boot.cat -r \
+	-no-emul-boot -boot-load-size 4 -boot-info-table \
+	${S}/cd/
+
+	cd ${DEPLOY_DIR_IMAGE}
+	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
+	ln -s ${IMAGE_NAME}.iso ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
+}
+
+build_hddimg() {
 	install -d ${HDDDIR}
 	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
 	${HDDDIR}/vmlinuz
@@ -77,48 +117,12 @@ build_boot_bin() {
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 	ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 	
-	#Create an ISO if we have an INITRD
-	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ] && [ "${NOISO}" != "1" ] ; then
-		install -d ${ISODIR}
-
-		# Install the kernel
-
-		install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
-		        ${ISODIR}/vmlinuz
-
-		# Install the configuration files
-
-		cp ${HDDDIR}/syslinux.cfg ${ISODIR}/isolinux.cfg
-
-		if [ -f ${SYSLINUXMENU} ]; then
-			cp ${SYSLINUXMENU} ${ISODIR}
-		fi
-
-		install -m 0644 ${INITRD} ${ISODIR}/initrd
-
-		if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then 
-			install -m 0644 ${ROOTFS} ${ISODIR}/rootfs.img
-		fi
-
-		# And install the syslinux stuff 
-		cp ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}
-
-		mkisofs -V ${BOOTIMG_VOLUME_ID} \
-		-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-		-b isolinux/isolinux.bin -c isolinux/boot.cat -r \
-		-no-emul-boot -boot-load-size 4 -boot-info-table \
-		${S}/cd/
-
-		cd ${DEPLOY_DIR_IMAGE}
-		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
-		ln -s ${IMAGE_NAME}.iso ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
-
-	fi
 } 
 
 python do_bootimg() {
 	bb.build.exec_func('build_syslinux_cfg', d)
-	bb.build.exec_func('build_boot_bin', d)
+	bb.build.exec_func('build_hddimg', d)
+	bb.build.exec_func('build_iso', d)
 }
 
 addtask bootimg before do_build
-- 
1.7.6.4



