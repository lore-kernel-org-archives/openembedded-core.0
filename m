Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 715A97DEA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 13so8422711pfw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vRBzuzjendolE5CG1CiyxbGX0AoZVpyPLr/BIkCKai0=;
	b=LJlfiISsinFhBPgqa6+SIf5nqwp2dwBB2wxSknWYQQTaPJYdIx7h7zyvMdYrBPOgv4
	Zjf6+sjyE49PmoKaHqVXMbO+R5EMeI/XRa6P/qZKkWn8nXK8wBpMIdPhn6liyt1BN6pg
	V0VR+QoK+mdRR2EJmOAVsf+yBzEPD/e0R0JgIssOdNHyiUUGhTXQAq5XgKrEeGD3GEYT
	dcvSQxCycDhSaHvhzH3UGEznXw6an0dpgR/n6+cw/xbfq/bC2EwzpoWXJNuEEtRUC74K
	ok8GW165aALPt84yeKuZMJ/QcfGwZ2a7BP85LArKKyo290gXpWGbJP8TJPO2lgDp7MNo
	hxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vRBzuzjendolE5CG1CiyxbGX0AoZVpyPLr/BIkCKai0=;
	b=sDSMNvUFlRjQEUn4SW1FaGoBT3VF5DCb6zp9IoyJ5Wdhw2L9/iZEhVRjsbN8Onv1bu
	QQdCMh483ZTAEgU/CayJGo14fFkJrcSnoLolW/HL6Z5/EsITA6VfrpgopR0IbiMMY4pZ
	x72wwq9vTpv/vZXgR37PYhRI9rU+SnHBOW1JPGC+nVJTelRe50nvIFwf+yuwyokbQB07
	Eb+0dpIMOGIH5k40O5sE5cgMhCi1gcwQYXL6SIOPaN2jSXr//x0LLIvMJnWUXORa1eQA
	F7XZogETp02g5kgs7am5aK5tl4uZv+feTrY4Bz+FoIoTA0L+npPgTOtmOS2iBleIHoFr
	6zOw==
X-Gm-Message-State: APjAAAUhqpAHvziGSd0tbkBOm74w5U1jF08gBH/2fKsThI+8EtETiBxj
	Zpfbb+fsA9/3rBaf4VM4WR8LYcE4
X-Google-Smtp-Source: APXvYqy0q5/OYLKoixEsThsk4rLG9iSU6y8p5Ip1NAECIFeus4NW6w4xsbBsDdtzWutTzTavVc2Lnw==
X-Received: by 2002:a63:8dc9:: with SMTP id z192mr35432109pgd.6.1557809658631; 
	Mon, 13 May 2019 21:54:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:53 -0700
Message-Id: <da6806df8bb3994e80d8deb6edb406dba92249e0.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 11/23] uboot-sign: add support for different u-boot configurations
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
X-List-Received-Date: Tue, 14 May 2019 04:54:17 -0000

From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>

This is done by concatenating the DTB with the kernels public key
to all built u-boot binaries. Furthermore the installation of all
the binaries is required.

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 85 ++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 31 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 9e3d1d6..2da4365 100644
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
2.7.4


