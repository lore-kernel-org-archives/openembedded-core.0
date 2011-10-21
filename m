Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5vU-0004t4-NG
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:37:44 +0200
Received: by ggnj1 with SMTP id j1so1939142ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=dYhYllkeq1CeJLwx6r7kYAIIoDvnjgkQhlV/TKRr/Ss=;
	b=Kd6tJvBpmBp2+QnqDdBtAXLl0pN2wJmqDGAEUX3WtClPj3qoiekx9RgqsCMJPIsgjN
	LNMgC1VOHqAfJ4NyRvH7j4gr4uCxv3RRrRXTIbRJbL8DDTIbECpCrBktCMPUFB4tYyV7
	wdtpL5sBu2rHzyeuoVayAEiLoCMFjtiDCIoBY=
Received: by 10.150.138.15 with SMTP id l15mr12197892ybd.21.1319167911704;
	Thu, 20 Oct 2011 20:31:51 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m3sm32008971ang.0.2011.10.20.20.31.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:31:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:31:39 +0000
Message-Id: <5980062f84b228fa8977cf3f14c064192ba91eee.1319167843.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
Subject: [PATCH 1/4] bootimg.bbclass: add support to disable HDD image building
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
X-List-Received-Date: Fri, 21 Oct 2011 03:37:44 -0000

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
1.7.2.5



