Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVoNi-00065q-Mb
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:55:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Nov 2011 09:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="80734178"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2011 09:47:59 -0800
From: Darren Hart <darren@dvhart.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Josef Ahmad <josef.ahmad@intel.com>, Joshua Lock <josh@linux.intel.com,
	Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:47:55 -0800
Message-Id: <cbc89cf0cd94ffc2a47399832324475a7b187685.1322674459.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
References: <adc1fd7a25a8bbcb5b51899adc5685ead8b27c09.1322674459.git.darren@dvhart.com>
In-Reply-To: <cover.1322674459.git.darren@dvhart.com>
References: <cover.1322674459.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/5] bootimg: Pull syslinux specific bits into syslinux.bbclass
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
X-List-Received-Date: Wed, 30 Nov 2011 17:55:44 -0000

From: Darren Hart <dvhart@linux.intel.com>

Working towards a more generic bootimg.bbclass, pull out all
syslinux specific bits and let syslinux.bbclass manage them
directly. This introduces no functional changes to the images
constructed and the behavior remains unchanged.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/bootimg.bbclass  |   71 +++++++++-------------------------------
 meta/classes/syslinux.bbclass |   68 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 76 insertions(+), 63 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index dbaa677..0554ffa 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -17,36 +17,26 @@
 # in syslinux. Actions based on the label are then performed (e.g. installing to 
 # an hdd)
 
-# External variables
+# External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${NOISO}  - skip building the ISO image if set to 1
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
-# ${AUTO_SYSLINUXCFG} - set this to 1 to enable creating an automatic config
-# ${LABELS} - a list of targets for the automatic config
-# ${APPEND} - an override list of append strings for each label
-# ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited 
 
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
-                       syslinux:do_populate_sysroot \
-                       syslinux-native:do_populate_sysroot \
-		       mtools-native:do_populate_sysroot \
-		       cdrtools-native:do_populate_sysroot"
+                        mtools-native:do_populate_sysroot \
+                        cdrtools-native:do_populate_sysroot"
 
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
 
 HDDDIR = "${S}/hdd/boot"
-ISODIR = "${S}/cd/isolinux"
+ISODIR = "${S}/cd"
 
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
-# Get the build_syslinux_cfg() function from the syslinux class
-
-SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
-SYSLINUXMENU = "${HDDDIR}/menu"
-
 inherit syslinux
-		
+
 build_iso() {
 	# Only create an ISO if we have an INITRD and NOISO was not set
 	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
@@ -56,31 +46,12 @@ build_iso() {
 
 	install -d ${ISODIR}
 
-	# Install the kernel
-	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
-	        ${ISODIR}/vmlinuz
-
-	# Install the configuration files
-	cp ${HDDDIR}/syslinux.cfg ${ISODIR}/isolinux.cfg
-
-	if [ -f ${SYSLINUXMENU} ]; then
-		cp ${SYSLINUXMENU} ${ISODIR}
-	fi
-
-	install -m 0644 ${INITRD} ${ISODIR}/initrd
-
-	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then 
-		install -m 0644 ${ROOTFS} ${ISODIR}/rootfs.img
-	fi
-
-	# And install the syslinux stuff 
-	cp ${STAGING_LIBDIR}/syslinux/isolinux.bin ${ISODIR}
+	syslinux_iso_populate
 
 	mkisofs -V ${BOOTIMG_VOLUME_ID} \
-	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
-	-b isolinux/isolinux.bin -c isolinux/boot.cat -r \
-	-no-emul-boot -boot-load-size 4 -boot-info-table \
-	${S}/cd/
+	        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
+		-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
+		${MKISOFS_OPTIONS} ${ISODIR}
 
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
@@ -91,34 +62,24 @@ build_hddimg() {
 	# Create an HDD image
 	if [ "${NOHDD}" != "1" ] ; then
 		install -d ${HDDDIR}
-		install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
-		${HDDDIR}/vmlinuz
-
-		if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
-				install -m 0644 ${INITRD} ${HDDDIR}/initrd
-		fi
-
-		if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
-				install -m 0644 ${ROOTFS} ${HDDDIR}/rootfs.img
-		fi
+		syslinux_hddimg_populate
 
-		install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
-
-		# Do a little math, bash style
+		# Determine the block count for the final image
 		BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
 		SIZE=`expr $BLOCKS + ${BOOTIMG_EXTRA_SPACE}`
 
 		mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
-		-C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
+		        -C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
+
+		syslinux_hddimg_install
 
-		syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 
 		cd ${DEPLOY_DIR_IMAGE}
 		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 		ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 	fi
-} 
+}
 
 python do_bootimg() {
 	bb.build.exec_func('build_syslinux_cfg', d)
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 0cc6b85..6eb804b 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -2,7 +2,63 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-# This creates a configuration file suitable for use with syslinux.  
+# Provide syslinux specific functions for building bootable images.
+
+# External variables
+# ${INITRD} - indicates a filesystem image to use as an initrd (optional)
+# ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
+# ${AUTO_SYSLINUXMENU} - set this to 1 to enable creating an automatic menu
+# ${LABELS} - a list of targets for the automatic config
+# ${APPEND} - an override list of append strings for each label
+# ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited
+
+do_bootimg[depends] += "syslinux:do_populate_sysroot \
+                        syslinux-native:do_populate_sysroot"
+
+SYSLINUXCFG  = "syslinux.cfg"
+SYSLINUXMENU = "menu"
+
+SYSLINUX_ISODIR = "${ISODIR}/isolinux"
+SYSLINUX_HDDDIR = "${HDDDIR}"
+ISO_BOOTIMG = "isolinux/isolinux.bin"
+ISO_BOOTCAT = "isolinux/boot.cat"
+MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
+
+syslinux_populate() {
+	DEST=$1
+	CFGNAME=$2
+
+	install -d ${DEST}
+
+	# Install the kernel, initrd, and rootfs
+	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
+	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
+		install -m 0644 ${INITRD} ${DEST}/initrd
+	fi
+	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
+		install -m 0644 ${ROOTFS} ${DEST}/rootfs.img
+	fi
+
+	# Install the config files
+	install -m 0644 ${SYSLINUXCFG} ${DEST}/${CFGNAME}
+	if [ -f ${SYSLINUXMENU} ]; then
+		install -m 0644 ${SYSLINUXMENU} ${DEST}
+	fi
+}
+
+syslinux_iso_populate() {
+	syslinux_populate ${SYSLINUX_ISODIR} isolinux.cfg
+	install -m 0644 ${STAGING_LIBDIR}/syslinux/isolinux.bin ${SYSLINUX_ISODIR}
+}
+
+syslinux_hddimg_populate() {
+	syslinux_populate ${SYSLINUX_HDDDIR} syslinux.cfg
+	install -m 0444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${SYSLINUX_HDDDIR}/ldlinux.sys
+}
+
+syslinux_hddimg_install() {
+	syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+}
 
 python build_syslinux_menu () {
 	import copy
@@ -26,10 +82,8 @@ python build_syslinux_menu () {
 	if not cfile:
 		raise bb.build.FuncFailed('Unable to read SYSLINUXMENU')
 
-	bb.mkdirhier(os.path.dirname(cfile))
-
 	try:
- 		cfgfile = file(cfile, 'w')
+		cfgfile = file(cfile, 'w')
 	except OSError:
 		raise bb.build.funcFailed('Unable to open %s' % (cfile))
 
@@ -85,10 +139,8 @@ python build_syslinux_cfg () {
 	if not cfile:
 		raise bb.build.FuncFailed('Unable to read SYSLINUXCFG')
 
-	bb.mkdirhier(os.path.dirname(cfile))
-
 	try:
- 		cfgfile = file(cfile, 'w')
+		cfgfile = file(cfile, 'w')
 	except OSError:
 		raise bb.build.funcFailed('Unable to open %s' % (cfile))
 
@@ -103,7 +155,7 @@ python build_syslinux_cfg () {
 	if opts:
 		for opt in opts.split(';'):
 			cfgfile.write('%s\n' % opt)
-		
+
 	cfgfile.write('ALLOWOPTIONS 1\n');
 	cfgfile.write('DEFAULT %s\n' % (labels.split()[0]))
 
-- 
1.7.6.4



