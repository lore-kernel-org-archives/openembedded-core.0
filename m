Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVoMm-0005xJ-Dh
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:54:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2011 09:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="90664335"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2011 09:47:58 -0800
From: Darren Hart <darren@dvhart.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>, Joshua Lock <josh@linux.intel.com,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:47:54 -0800
Message-Id: <c9ab787b4f430a0c7e12f057d15e7941787e48be.1322674459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
References: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
In-Reply-To: <cover.1322674459.git.darren@dvhart.com>
References: <cover.1322674459.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/5] bootimg: Refactor build_hddimg and build_iso routines
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
X-List-Received-Date: Wed, 30 Nov 2011 17:54:44 -0000

From: Darren Hart <dvhart@linux.intel.com>

Separate the construction of the ISO image from that of the hddimg.
This is part of the groundwork for creating a much more flexible
live image builder.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/bootimg.bbclass |   85 +++++++++++++++++++++---------------------
 1 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 3914311..dbaa677 100644
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
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
 		install -d ${HDDDIR}
@@ -78,51 +118,12 @@ build_boot_bin() {
 		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 		ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 	fi
-	
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
-		isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
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



