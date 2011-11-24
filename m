Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTUPO-0005XW-Nq
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 09:11:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Nov 2011 00:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,563,1315206000"; d="scan'208";a="94905086"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2011 00:05:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 00:05:10 -0800
Message-Id: <705ac370731c81be23968e718838ad6a743e5828.1322120651.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
References: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1322120651.git.dvhart@linux.intel.com>
References: <cover.1322120651.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [RFC PATCH 5/5] bootimg: Allow for EFI-only boot images
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
X-List-Received-Date: Thu, 24 Nov 2011 08:11:53 -0000

Condition building PCBIOS legacy images on MACHINE_FEATURES containing "pcbios"
or not containing "efi". This ensures existing BSPs will continue to get the
old PCBIOS legacy-only images. New BSPs can add "efi", "pcbios", or both. The
images created likewise support one or the other or both.

EFI-only ISO images are untested.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/bootimg.bbclass |   49 ++++++++++++++++++++++++++++++++++-------
 1 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 44bb61e..d2088fe 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -38,7 +38,24 @@ BOOTIMG_EXTRA_SPACE ?= "512"
 EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
 EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
 
-inherit syslinux
+# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
+# contain "efi". This way legacy is supported by default if neither is
+# specified, maintaining the original behavior.
+def pcbios(d):
+	pcbios = base_contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
+	if pcbios == "0":
+		pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
+	return pcbios
+
+def pcbios_class(d):
+	if d.getVar("PCBIOS", True) == "1":
+		return "syslinux"
+	return "dummy"
+
+PCBIOS = ${@pcbios(d)}
+PCBIOS_CLASS = ${@pcbios_class(d)}
+
+inherit ${PCBIOS_CLASS}
 inherit ${EFI_CLASS}
 
 
@@ -51,15 +68,24 @@ build_iso() {
 
 	install -d ${ISODIR}
 
-	syslinux_iso_populate
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_iso_populate
+	fi
 	if [ "${EFI}" = "1" ]; then
 		grubefi_iso_populate
 	fi
 
-	mkisofs -V ${BOOTIMG_VOLUME_ID} \
-	        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-		-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
-		${MKISOFS_OPTIONS} ${ISODIR}
+	if [ "${PCBIOS}" = "1" ]; then
+		mkisofs -V ${BOOTIMG_VOLUME_ID} \
+		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
+			${MKISOFS_OPTIONS} ${ISODIR}
+	else
+		bbnote "EFI-only ISO images are untested, please provide feedback."
+		mkisofs -V ${BOOTIMG_VOLUME_ID} \
+		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+			-r ${ISODIR}
+	fi
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
@@ -69,7 +95,9 @@ build_iso() {
 build_hddimg() {
 	install -d ${HDDDIR}
 
-	syslinux_hddimg_populate
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hddimg_populate
+	fi
 	if [ "${EFI}" = "1" ]; then
 		grubefi_hddimg_populate
 	fi
@@ -81,7 +109,9 @@ build_hddimg() {
 	mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
 	        -C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE 
 
-	syslinux_hddimg_install
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hddimg_install
+	fi
 
 	chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 
@@ -91,7 +121,8 @@ build_hddimg() {
 }
 
 python do_bootimg() {
-	bb.build.exec_func('build_syslinux_cfg', d)
+	if d.getVar("PCBIOS", True) == "1":
+		bb.build.exec_func('build_syslinux_cfg', d)
 	if d.getVar("EFI", True) == "1":
 		bb.build.exec_func('build_grub_cfg', d)
 	bb.build.exec_func('build_hddimg', d)
-- 
1.7.6.4



