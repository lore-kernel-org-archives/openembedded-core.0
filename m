Return-Path: <prvs=0225f2d71=Richard.Leitner@skidata.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 May 2019 07:53:30 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id DF5576B436
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1557129234; x=1588665234;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=6HB24vSSKHaT0Ogb3xhooMfXqagDyuh4zf6cGQzV+ek=;
	b=tyd3FgGRasjh23Lwe9nnveu6IbUFIlHMIZxMnAfyG6/Fn3qiGRt5F6wy
	C+EZ8RcIMk8eilATwbd1hh1wSdQ6oQsTTPoAqWNuYaaQ4xmjv2rW0/der
	07BXaQpuEuLu4Pemb1rjt+g40ojqKt3LBnIaPfqGUAegwnM12pwfB9RbH
	Mwe5OzLpM3WPpdpMQ9IC5n/VQ/G18rP6TuEsaOtEeA0MO9FarOMw3mCay
	Y0b+hsndNmXHT6IXczBwsXLNn9WfzdZNO8wpXmpyoapuuxJxLtvSjx8yn
	mZ0+ODNbkRpW4vTftHyt4+MC4uY3dn3GHii3l+J0/JBfkE90tXqJzlpbB g==;
IronPort-SDR: cFL97e4wc17WNX42k6fLRzOELdvA/+3c+NJhQsRc0nr4XFTY3JeRQd/+VXrBsARkphJ9vdCEtA
	TZQ6+WBY+oXgpXaq7eYGVEyhcqxSRmCIX/kns3VD+P5B1qqO6yR8s6IOU8SyOW63Ga4NAQJ8Xo
	estsbXBYancO05UV6fWhRUEdTTvscyCULzMgUiwkMVP21y/1AsRqhAjyRxTLv9aD5YfrEAevjW
	21xxtvkq9c9Wa2ip/+d482oTOvH6sAO4enP2fHR3NmonF78CI0uBBHuXRoxmY3Acp+lY7V48Hl
	u7c=
X-IronPort-AV: E=Sophos;i="5.60,437,1549926000"; 
   d="scan'208";a="2122889"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 May 2019 09:45:31 +0200
Message-ID: <20190506074531.13459-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [warrior][PATCH] uboot-sign: add support for different u-boot configurations
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
X-List-Received-Date: Mon, 06 May 2019 07:53:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>

This is done by concatenating the DTB with the kernels public key
to all built u-boot binaries. Furthermore the installation of all
the binaries is required.

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/classes/uboot-sign.bbclass | 85 +++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 31 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 9e3d1d6fc1..2da43655aa 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -45,49 +45,72 @@ UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 # Functions in this bbclass is for u-boot only
 UBOOT_PN = "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
 
+concat_dtb_helper() {
+	if [ -e ${UBOOT_DTB_BINARY} ]; then
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
+	fi
+
+	if [ -f ${UBOOT_NODTB_BINARY} ]; then
+		install ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+	fi
+
+	# Concatenate U-Boot w/o DTB & DTB with public key
+	# (cf. kernel-fitimage.bbclass for more details)
+	deployed_uboot_dtb_binary='${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
+	if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+		[ -e "$deployed_uboot_dtb_binary" ]; then
+		oe_runmake EXT_DTB=$deployed_uboot_dtb_binary
+		install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
+		cd ${DEPLOYDIR}
+		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${UBOOT_BINARY} > ${UBOOT_IMAGE}
+	elif [ -n "${UBOOT_DTB_BINARY}" ]; then
+		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+	fi
+}
+
 concat_dtb() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" ]; then
 		mkdir -p ${DEPLOYDIR}
-		if [ -e ${B}/${UBOOT_DTB_BINARY} ]; then
-			ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
-			ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
-		fi
-
-		if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
-            install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-            ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
-            ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
-		fi
-
-		# Concatenate U-Boot w/o DTB & DTB with public key
-		# (cf. kernel-fitimage.bbclass for more details)
-		deployed_uboot_dtb_binary='${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
-			[ -e "$deployed_uboot_dtb_binary" ]; then
+		if [ -n "${UBOOT_CONFIG}" ]; then
+			for config in ${UBOOT_MACHINE}; do
+				cd ${B}/${config}
+				concat_dtb_helper
+			done
+		else
 			cd ${B}
-			oe_runmake EXT_DTB=$deployed_uboot_dtb_binary
-			install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
-			cd ${DEPLOYDIR}
-			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
-		elif [ -n "${UBOOT_DTB_BINARY}" ]; then
-			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+			concat_dtb_helper
 		fi
 	fi
 }
 
 # Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
 # signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
+install_helper() {
+	if [ -f ${UBOOT_DTB_BINARY} ]; then
+		install -d ${D}${datadir}
+		# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
+		# need both of them.
+		install ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
+		ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
+	elif [ -n "${UBOOT_DTB_BINARY}" ]; then
+		bbwarn "${UBOOT_DTB_BINARY} not found"
+	fi
+}
+
 do_install_append() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" ]; then
-		if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
-			install -d ${D}${datadir}
-			# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
-			# need both of them.
-			install ${B}/${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
-			ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
-		elif [ -n "${UBOOT_DTB_BINARY}" ]; then
-			bbwarn "${B}/${UBOOT_DTB_BINARY} not found"
+		if [ -n "${UBOOT_CONFIG}" ]; then
+			for config in ${UBOOT_MACHINE}; do
+				cd ${B}/${config}
+				install_helper
+			done
+		else
+			cd ${B}
+			install_helper
 		fi
 	fi
 }
-- 
2.20.1


