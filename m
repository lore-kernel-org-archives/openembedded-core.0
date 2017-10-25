Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF75360762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 07:18:36 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 15so9079402wrb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QdeJquZa97GWjzlzbsUXoIFddxrLeyFpJqXq2fxrDn4=;
	b=GnJjHmTt0tLxH0azt0GuwTZnY1nmzOCHfsOXH3GOLXsy6SjiFFkSMm1HigW3NnfZPZ
	OOGGD9TLkW+ou5S59B3PbaJyIj1zpZ/tlDXk1SCBoaQ2w3bKLnzRL7N3J3jdaTwwpmSE
	kXP+wIHZhEybxOFr98UYlqNngzoykLkudV+JKbQwb/QjmQwQDRhp4leztiSkUCCNwuYd
	qL7KNSc8k8gbpGxV6DVegUrjwrircftJ9/wOdG+aGkxIV5NXS/2595Yy7aS1sFIE0ZR7
	AwMLJwfmOrVA2v2ZD/pkDvej5UD9iz2GrOcnVQCSkYzAUJIOQGkcdpqV/qToGNZljz41
	ih3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=QdeJquZa97GWjzlzbsUXoIFddxrLeyFpJqXq2fxrDn4=;
	b=reC25aSPC6kQ7CXPaImf2KGJy3gCIgwMGCJh154PGZzt/WqswPEBEQcewVfqm4yzhM
	ffyv/bSqbXumLc/k16j+vYkYVPsdSqbkUufclqCodD7v0SElNdA04jOsBpZWHf1svyNC
	g3o60lu+a4iuzz4jXn68e3W7tGPCPwgVBjpPslxqFP3IeAXgKI0zi0daDiT+gssWLWnf
	6Ed9XDZYjnevePyqd3epzjg9EHYNidJaITjVARno8Z0G1wgTXTgkrHvK0G2PzipODu1N
	LtM1rLmI92W6BfgbAEUUb2tPfpe2FfVrX0GTFHiGgaZPDR4mT5lqcQI5q5fEbq07aBmY
	cHqw==
X-Gm-Message-State: AMCzsaWkHFyKcl9mj1fQL8xUStRlalvhHgg1He7/tA2IycHUpzYs5/Bu
	gHKpWWcI4KAaFhvd9wPRW/kyX0dj
X-Google-Smtp-Source: ABhQp+RLp5JodoxS1lzMDefwFI/5IWMeN109ixzLHYSfq3NRKyDHe1u7XfwimLgUUvH99u1hS4y05w==
X-Received: by 10.223.184.15 with SMTP id h15mr997474wrf.11.1508915917336;
	Wed, 25 Oct 2017 00:18:37 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id 29sm2238659wrz.77.2017.10.25.00.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 00:18:36 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:18:32 +0200
Message-Id: <20171025071832.5802-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][pyro][PATCHv3] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Wed, 25 Oct 2017 07:18:38 -0000

When UBOOT_SIGN_ENABLE is active:

Dependency loop #1 found:
  do_concat_dtb (dependent Tasks ['linux-yocto_4.10.bb:do_assemble_fitimage'])
  do_install (dependent Tasks ['pseudo_1.8.2.bb:do_populate_sysroot', 'u-boot_2017.01.bb:do_compile', 'u-boot_2017.01.bb:do_concat_dtb'])
  do_deploy (dependent Tasks ['u-boot_2017.01.bb:do_deploy_dtb', 'u-boot_2017.01.bb:do_install'])
  do_assemble_fitimage (dependent Tasks ['linux-yocto_4.10.bb:do_compile', 'u-boot_2017.01.bb:do_deploy'])

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass |  2 +-
 meta/classes/uboot-sign.bbclass      | 21 +++++++++------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index abbc309b09..5ad439e82d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -31,7 +31,7 @@ python __anonymous () {
         # the fitImage:
         if d.getVar('UBOOT_SIGN_ENABLE') == "1":
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy_dtb' % uboot_pn)
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8ee904e7df..2f616bf2a9 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -47,16 +47,14 @@ do_deploy_dtb () {
 	cd ${DEPLOYDIR}
 
 	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
-		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
-		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
+		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
+		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_SYMLINK}
+		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}
 	fi
 	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
-		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
+		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_SYMLINK}
+		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_BINARY}
 	fi
 }
 
@@ -70,11 +68,10 @@ do_concat_dtb () {
 			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
 			install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 			install ${B}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
-			cd ${DEPLOYDIR}
-			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		elif [ -e "${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}" ]; then
+			cat ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE} ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 		else
-			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+			bbfatal "Failure while adding public key to u-boot binary. Verified boot won't be available."
 		fi
 	fi
 }
-- 
2.13.6


