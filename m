Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVoNh-00065q-Dt
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:55:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Nov 2011 09:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="80734193"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2011 09:48:00 -0800
From: Darren Hart <darren@dvhart.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>, Joshua Lock <josh@linux.intel.com,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:47:57 -0800
Message-Id: <272df4048f5357907e03e6353f77348d9fcb4232.1322674459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
References: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
In-Reply-To: <cover.1322674459.git.darren@dvhart.com>
References: <cover.1322674459.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 5/5] bootimg: Allow for EFI-only boot images
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
X-List-Received-Date: Wed, 30 Nov 2011 17:55:42 -0000

From: Darren Hart <dvhart@linux.intel.com>

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
index ce95801..0d06351 100644
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
@@ -70,7 +96,9 @@ build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
 		install -d ${HDDDIR}
-		syslinux_hddimg_populate
+		if [ "${PCBIOS}" = "1" ]; then
+			syslinux_hddimg_populate
+		fi
 		if [ "${EFI}" = "1" ]; then
 			grubefi_hddimg_populate
 		fi
@@ -82,7 +110,9 @@ build_hddimg() {
 		mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
 		        -C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
 
-		syslinux_hddimg_install
+		if [ "${PCBIOS}" = "1" ]; then
+			syslinux_hddimg_install
+		fi
 
 		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 
@@ -93,7 +123,8 @@ build_hddimg() {
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



