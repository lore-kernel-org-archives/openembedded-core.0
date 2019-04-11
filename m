Return-Path: <prvs=997e349e1=Andreas.Obergschwandtner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 29F5E7D598
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1554985325; x=1586521325;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=OcT723XwTfjbaUP7koXjmyAQZFy+Q7YykPrkH9kSQ1Q=;
	b=VUQcVMg+CUbI2ppbTuVurrVCm0QVxDeXPvTDNLJAN+5mi+gO6chUlGkF
	gn44sh9zGJr7llyTh7KsWu/iveAES49RxelAmXLDUyOgKsZ29znQMW3nF
	gdyqKFKK9pWnm7nrvEEV6r/iVbbS1jongvnyUY8IB27ntbhwRvbrKpy60
	q/MWYvFd2PDxJ34JHNSe1O6zjAfHwhOyLYolHInUvLP+Sh9qVIiwrV5KU
	Xt6XTSZ6mLz19cX61Y6lqfx9rCpOpldyaDodec48YNZJJNSQoHE2EiTXY
	228BGAd0yLcu2Fb7a9Z9lxyhM1cJ5nxzQ+6piwNLg/7pD+jAHzK565Q30 w==;
IronPort-SDR: a1pP9tPIUhd+FJtd74a45gOMfDAoGh2YAlYJRJRuyVj6Wr3oN7fHp5t+25Jva7j30iewlTVieI
	B3+UEvHg2ZFtcf4+KAvw2O4hFzobAh6H30ow/KnJI0yobI2EDGn7OnnKVIUvkiV/jdMqj+eSU/
	b3srC6hcu6OcYkU3Y49TlPAQaVWVrgbGQ075PsZCw91yXMdbtDd3nP4j3n4sYNUOVOE40jDBjC
	EHTszfIFJZosOmpGuLaxLBdsIuOu2YeFk3/s/LNojkl7czy4iSJnO6qFRJiyvLXjjBFxGJvzTG
	UwQ=
X-IronPort-AV: E=Sophos;i="5.60,337,1549926000"; 
   d="scan'208";a="2085567"
From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2019 14:21:30 +0200
Message-ID: <20190411122130.8966-1-andreas.obergschwandtner@skidata.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.22]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex4srv.skidata.net (192.168.111.82)
Subject: [PATCH] uboot-sign: add support for different u-boot configurations
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
X-List-Received-Date: Thu, 11 Apr 2019 12:22:04 -0000
Content-Type: text/plain

This is done by concatenating the DTB with the kernels public key
to all built u-boot binaries. Furthermore the installation of all
the binaries is required.

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
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
2.17.1


