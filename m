Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2CEA60939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 08:57:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 01:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,374,1496127600"; d="scan'208";a="993796398"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 17 Jul 2017 01:57:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7E19F5803B9;
	Mon, 17 Jul 2017 01:57:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 11:35:00 +0300
Message-Id: <1500280500-26146-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image_types: use initrd from pre-sstate directory
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
X-List-Received-Date: Mon, 17 Jul 2017 08:57:15 -0000

mkelfImage was failing trying to use initrd from ${DEPLOY_DIR_IMAGE}:
DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_image_elf
| Cannot open `tmp/deploy/images/qemux86/core-image-minimal-qemux86.cpio.gz':
No such file or directory

As the images have only one deploy point it's not possible to reference
something the images themselves are deploying. They need to reference it
in the "pre-sstate" directory ${IMGDEPLOYDIR}, not the post sstate one
${DEPLOY_DIR_IMAGE}.

Fixed by using ${IMGDEPLOYDIR} instead of ${DEPLOY_DIR_IMAGE} in
mkelfImage command line.

[YOCTO #11767]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index df34c7c..f97870b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -146,7 +146,7 @@ ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
 	test -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf && rm -f ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf
-	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.gz --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
+	mkelfImage --kernel=${ELF_KERNEL} --initrd=${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.cpio.gz --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
 }
 
 IMAGE_TYPEDEP_elf = "cpio.gz"
-- 
2.1.4


