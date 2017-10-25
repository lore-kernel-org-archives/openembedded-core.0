Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B9EED71C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 07:32:54 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p96so9053111wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xIWcv72wSQ1XvTWmQCLkfXbWPouzleC9YeL3bsI/Ng0=;
	b=TDTXT7kaAjPGpzwvOIvcc603fq5FnZ5Ukqtt6B8iwcWHdjD4Qr4WOxBZLfpXNsoamo
	pdXjW85lxPLvoWjaxET9OomYSqSnHB0iMHslWhVbTeM6gx1ubEebkI+1GvubzQfQLOEn
	4bbDpJZprevGbSWAR/lBvTYl/MCOiSQu+EvIOOeSf1LIW4YKUZfGXmFuEcLYUmv2T0Qc
	lDk3s6f42c9GMw4ZL9sTOD8dl7X4srRsfc330iA2Zfh/rZN5FrfVI4FoFOwwDZSFgDjZ
	W2JOK+z5mtr77J9VCsCUvrFy8foLNXGzpljLiVK7tWo+CHctc+P0zg28K7GGL684RJTV
	jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=xIWcv72wSQ1XvTWmQCLkfXbWPouzleC9YeL3bsI/Ng0=;
	b=J5p0rS/+u5qKF+dia8UP5DrYVPxO/1rXFwaWJntamz3KAmw9n3at20HjEkWHb41PtC
	YgsC25RXOB55+6ZzK/pYO6SrfePEA2bYYQifKFCSB41RnDbufMcGxE8uKV6Byd9S+kbW
	tg0zIt8iQXq6lFuC3e58nvKLlM/+0sf67R4KAJyIPl85vF0LAY2g3DKN9VrLfEmwqniJ
	D0T8uNPXm4XDUnowIsd3QNq3yEyd+VPgx2iste34LA+vyYgRI/fITcY2PUbV2gwRvAMI
	RjsdTlCC6VABTQXufeQiU7YWUv7yAIY/SF6iWGQK2w+rkLLfa7dfhPv6tbv5ejCD2ooo
	ANlQ==
X-Gm-Message-State: AMCzsaWHRwbvYJzjuu/EbRBw+mJqWPGMj1QJ4qaVod4cFkh26FyskdR3
	yuV+RfzvFm+k4sB0vS2bERgOWTpA
X-Google-Smtp-Source: ABhQp+RWeofbycVGshBnF0xT4JVHx1IHJade6dcuWTOm4rGrrwjOkLIRlpD02SrkwFFBmWulATfBJQ==
X-Received: by 10.223.132.163 with SMTP id 32mr1046139wrg.218.1508916775238;
	Wed, 25 Oct 2017 00:32:55 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id h5sm1440519wrb.89.2017.10.25.00.32.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 00:32:54 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:32:48 +0200
Message-Id: <20171025073248.24161-2-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171025073248.24161-1-thomas.perrot@tupi.fr>
References: <20171025073248.24161-1-thomas.perrot@tupi.fr>
Subject: [meta][PATCH 2/2] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Wed, 25 Oct 2017 07:32:55 -0000

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
index 0789ba611f..13d61a2298 100644
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


