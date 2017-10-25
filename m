Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 165B577EFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:03:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 196so16660415wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y+NsIYptaAoF1wYwENAg1M/oxt6Xi7CPUQPPZhwUhPc=;
	b=jJKkfU5Y372PAj/ijjW5dVFKi5QWIWOUekxvfac5Sf+AwpMTmFevJPXkrL7i3J8Glu
	oxnIxbdOMB8haHySs3fvwYk6OCxxry6f+GVRAUiP2eDtsSyFs4bXldJm/IfB1vO+TEXV
	PICbhkPdaTR1OmSiJJv+wUIL6lBWUfmbZ4cj6vUCPGmKJkkQvUUZMI9pCVIKjMUprqm3
	hO+LAirI+H9VyFklPiGM5fZ4zp3+6cMjdIt1jheoM+6wr4pNMexNZ35I39AMZGX/LbMG
	8yjvcKS+mW0LcXqtY6Ix2ilbXi9E2EoPfNVu+bXEfjHvfcnRKDOPUSUjz3nEh6K7G9al
	3CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Y+NsIYptaAoF1wYwENAg1M/oxt6Xi7CPUQPPZhwUhPc=;
	b=VNNmAk4fFjQUVUXJ1He8DAW7YaBdLZIDJ5yr+k7MkGBSRsCQkEAR13/hU/09Qon7OX
	ZMwBxvYJk4WQOqXC0KTGd5qgN4tdQXaeYaq//Kkw9QcNKQNnLYzAKrsjFJjAgR5+CbJz
	W4AX++6mBcniAS/r6Z2oxlSlNjx5B6NGTTgQL3Zo/xpjhPiFvJP0FD0iyDNWr9sOps5i
	czH4jIuzu3oetOZakjuBALjP+7MwEUSWK1nU5eQevVPmrkNuFW/+wfFpVU3j5bLQWSFT
	02c1ET/8aUqpMPT9vR3i0SOpPjKm3A6mLa7DSXy+a6Nf9lUGEI+gXkCz6IDzn40Uajr9
	3yIg==
X-Gm-Message-State: AMCzsaWqlBUZOaxaYikBIwELYPkOKEQbq1s2Q8PEHSR1qZmVNuMDLtws
	xZC/whjZH7pn53RYiqGqpxOlXFj+
X-Google-Smtp-Source: ABhQp+SsfSlmrgMS2QHDMrdTOqEPckBaNyry/Uov76QY7BdLptSCl5643Ebge3e4F+PVESQ0RHcF2A==
X-Received: by 10.28.230.77 with SMTP id d74mr2459676wmh.75.1508954600857;
	Wed, 25 Oct 2017 11:03:20 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	b190sm3243487wma.22.2017.10.25.11.03.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 11:03:20 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 20:03:12 +0200
Message-Id: <20171025180312.10308-3-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171025180312.10308-1-thomas.perrot@tupi.fr>
References: <20171025180312.10308-1-thomas.perrot@tupi.fr>
Subject: [meta][PATCH 3/3] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 18:03:20 -0000

Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
when UBOOT_SIGN_ENABLE is active:

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
index 9baf399f2e..2779ce5226 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -33,7 +33,7 @@ python __anonymous () {
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


