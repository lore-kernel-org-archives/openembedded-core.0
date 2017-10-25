Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ECDCD775DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:55:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q124so3452458wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y+NsIYptaAoF1wYwENAg1M/oxt6Xi7CPUQPPZhwUhPc=;
	b=B2+lHuyZpJKSqS1ENbIHapCENm5nuhBkLylTC/3edUKu88QoU2Ok3m3vsZc5EfLJJR
	uzbpNJFaCkzoCVAd38TNn6wl+gBLkqdOTtpNtZdD3hlkOEZ1oVVPb6Z7u2MLwI19gnZR
	SIcj7jmeWTErWlVicblnItzwQaGQUBTIMVDngOtF/9nyocyKnc4qmeq/NC8U55bOVJv9
	T9fn00LbthM6jPDEk45+Hl5ATokhbQU4FtwRGfNS8vNDHAjCHsjTKAb7FRa9Dhw4Y6qH
	gXvgoUtGEfZv1nGjaTMjpG/Y2iDiQD2KI4d0RdRaNge9NseRbHmchMitRXLv+fCXYHJl
	V1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Y+NsIYptaAoF1wYwENAg1M/oxt6Xi7CPUQPPZhwUhPc=;
	b=XJidqjiQolgharkx4ry+ZLYaDt83r30NmqxOcxORNKNOzJ1PvlRNFYZd/l/vLxxH4S
	TMHrQANgsQqM9Uk3A56I2XbsVNSXjCORLP2Z6w1Y8tHHhfwLlBQSN+e4EHScM0nUy4aS
	DBrBuMkRc5P0eN2QIGgDzKov4poi4IJWdD0PsP2E0f251KsVIyo+rmL0X5Qz9R/FZWC/
	b+DXq8MvcCF2q0Uxe4nt3ffUSq1lNRrDfiFCFIKEnl6M4gu7kio0kERbN75gtIg1BxaY
	oSm0uo33VLFeDqazNsFV7npKHfnnKgn3fuTHO/MCav3nW/JDYxVXH8UT2gv7+NoOUqee
	c+tQ==
X-Gm-Message-State: AMCzsaWlzUgKLfT92693teC3ZDFdLiuzJj8CNG0jOr5ZIS5uZBykQOGd
	VuG+MOoGeFNHdpP++7D2KABQGGaR
X-Google-Smtp-Source: ABhQp+StE2o5RS8hYjVQPGxsyhhWbC156B5hf0H9VtKk10kqPDH5X4YOsCgLxcpRo6xlW3swM7AiQg==
X-Received: by 10.28.185.196 with SMTP id j187mr2568616wmf.97.1508954123428;
	Wed, 25 Oct 2017 10:55:23 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id v5sm2634923wme.5.2017.10.25.10.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 10:55:22 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 19:55:08 +0200
Message-Id: <20171025175509.32310-3-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171025175509.32310-1-thomas.perrot@tupi.fr>
References: <20171025175509.32310-1-thomas.perrot@tupi.fr>
Subject: [meta][PATCH 3/4] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 17:55:23 -0000

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


