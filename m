Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 858AB60191
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 16:23:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u40so12108996wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=OeuULg4aunBBiLoe7sF7oKcOzguPVRLVco/xiDONXvM=;
	b=Pqr6MokGOBBfNusSg+TsixEeJ3pZgkg6YY+9u0UyDPhdgWic74gr5/C8c5kwQJ2nG/
	GQ8dH7nqyET8r4anaKUQ0tu3Mns4qEE78vTdvaECIelMFh9zaE4+Ap9sKqnb1mxn3VO+
	f9g6TFiU/h0TE1jI1tNF4hCQh4x48k53ZqX7wM1jFc0Jxu0IVCAvlL+zSF9oEWroxaJo
	fXgkDdMAb71pF5XQ5MvPXWBD92yYFL9AmMMsRlr567aLhnlYa2pez9PKvUSBUDkh1Ik4
	hc1JYLZvA3xsWPE8GPIwTvIXu7l6IN46//pAcFpGmMTV9vhbqIa/yYnviLOsiqCxc/qV
	l6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=OeuULg4aunBBiLoe7sF7oKcOzguPVRLVco/xiDONXvM=;
	b=Pv5vrtkCskETeLYm1iIntv9ANPhh6UxHGt0KYGN4OY0aqf3QwVtZ7lreOUOg8nKybX
	ytgmmSHVbCAzJovyhjn4z31tdeIkV5H7GVlgiF8yVZbPOVP1rMKV5Elw5WAjquHMCvda
	HaPNJSc8CSeeZ+LkiQ9YtyS92gLRYABEjCsiHpqC2U4f0B3sCXifeeD2ho/0VaV7jbMI
	mQI7mPVy8K+/69fIUawtbXksWMGw1KNfYSpIZX9lwZ4sMzknHljLI+rERs6kqLmhVVVr
	dPHTh4lMBJWksMPl4gXe7jbxQs24luIi3ozuuhnW8CED4jGUK+nwRG774p+GVaARpZJ1
	B2Jg==
X-Gm-Message-State: AMCzsaVLqIgavPJCugTzs8yfq0IvgH5s4uVS4xGjc74+20LfXoCxICVO
	o03hBoPNiqwv8njYhmGDwOO+bdYr
X-Google-Smtp-Source: ABhQp+SCQPHzeWPsg+OpZ+U9MzYZJeap9vsuMYZ9mCmF5qHnbMebfwNS9R2mOkvQ1KbyotaiWyWbQw==
X-Received: by 10.223.160.161 with SMTP id m30mr6169093wrm.27.1508775808874;
	Mon, 23 Oct 2017 09:23:28 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	t131sm3414034wmd.12.2017.10.23.09.23.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 09:23:28 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Oct 2017 18:23:25 +0200
Message-Id: <20171023162325.10686-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][pyro][PATCHv2] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Mon, 23 Oct 2017 16:23:28 -0000

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


