Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rG-0005ws-48
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250223"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:44 -0700
Message-Id: <8e17da7b7e0feade807001f037319397e1c57d91.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/27] bootimg.bbclass: add support to disable HDD image building
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:19 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

If an image sets NOHDD = "1" the HDD image won't be build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/bootimg.bbclass |   44 +++++++++++++++++++++--------------------
 1 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index a5ba3cf..eecc2bf 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -48,34 +48,36 @@ SYSLINUXMENU = "${HDDDIR}/menu"
 inherit syslinux
 		
 build_boot_bin() {
-	install -d ${HDDDIR}
-	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
-	${HDDDIR}/vmlinuz
+	# Create an HDD image
+	if [ "${NOHDD}" != "1" ] ; then
+		install -d ${HDDDIR}
+		install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage \
+		${HDDDIR}/vmlinuz
 
-	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then 
-    		install -m 0644 ${INITRD} ${HDDDIR}/initrd
-	fi
+		if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
+				install -m 0644 ${INITRD} ${HDDDIR}/initrd
+		fi
 
-	if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then 
-    		install -m 0644 ${ROOTFS} ${HDDDIR}/rootfs.img
-	fi
+		if [ -n "${ROOTFS}" ] && [ -s "${ROOTFS}" ]; then
+				install -m 0644 ${ROOTFS} ${HDDDIR}/rootfs.img
+		fi
 
-	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
+		install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
 
-	# Do a little math, bash style
-	#BLOCKS=`du -s ${HDDDIR} | cut -f 1`
-	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
-	SIZE=`expr $BLOCKS + ${BOOTIMG_EXTRA_SPACE}`	
+		# Do a little math, bash style
+		BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
+		SIZE=`expr $BLOCKS + ${BOOTIMG_EXTRA_SPACE}`
 
-	mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
-	-C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE 
+		mkdosfs -n ${BOOTIMG_VOLUME_ID} -d ${HDDDIR} \
+		-C ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg $SIZE
 
-	syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-	chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
 
-	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
-	ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
+		cd ${DEPLOY_DIR_IMAGE}
+		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
+		ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
+	fi
 	
 	#Create an ISO if we have an INITRD
 	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ] && [ "${NOISO}" != "1" ] ; then
-- 
1.7.6.4



