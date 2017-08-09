Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 821BE77D74
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 10:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337509"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:29 -0700
Message-Id: <1502300913-40295-8-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 07/11] image_types.bbclass: improve cpio image reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:03 -0000

This patch helps to build cpio images that are binary reproducible.
The changes are as follows:

1. By default, cpio from the host is used, which can be quite old.
   Hence we need to implement a way to use/call cpio-native, which supports
   new features needed for binary reproducibility, notably the arguments
   such as "--reproducible" and "--ignore-devno".
   This can be achieved by specifying the following (in local.conf):

   do_image_cpio[depends] += "cpio-replacement-native:do_populate_sysroot"
   EXTRANATIVEPATH += "cpio-native"

2. Provide a way to pass custom arguments to cpio. This is done via
   a new variable IMAGE_CMD_CPIO. For binary reproducible cpio archives
   one needs to set (in local.conf)

   IMAGE_CMD_CPIO = "cpio --ignore-devno --reproducible "

3. A symlink is created as part of the image. Here we make sure it gets the
   timestamps (mtime) based on the timestamp of the symlink target, rather than
   the timestamp corresponding to the build time.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image_types.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index e0368c7..50d0c07 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -122,9 +122,17 @@ IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
 IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
+# By default, cpio from the host is used, which can be quite old. If
+# you need special parameters (like --ignore-devno --reproducible) which are only
+# supported by GNU cpio upstream >= 2.12, then override that default:
+# IMAGE_CMD_CPIO = "cpio --ignore-devno"
+# do_image_cpio[depends] += "cpio-replacement-native:do_populate_sysroot"
+# EXTRANATIVEPATH += "cpio-native"
+
+IMAGE_CMD_CPIO ?= "cpio"
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+	(cd ${IMAGE_ROOTFS} && find . | ${IMAGE_CMD_CPIO} -o -H newc -v >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 	# We only need the /init symlink if we're building the real
 	# image. The -dbg image doesn't need it! By being clever
 	# about this we also avoid 'touch' below failing, as it
@@ -134,10 +142,12 @@ IMAGE_CMD_cpio () {
 		if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e ${IMAGE_ROOTFS}/init ]; then
 			if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e ${IMAGE_ROOTFS}/sbin/init ]; then
 				ln -sf /sbin/init ${WORKDIR}/cpio_append/init
+				# improve reproducibility: set the link mtime to be the same as the target
+				touch -h -r ${IMAGE_ROOTFS}/sbin/init ${WORKDIR}/cpio_append/init
 			else
 				touch ${WORKDIR}/cpio_append/init
 			fi
-			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+			(cd  ${WORKDIR}/cpio_append && echo ./init | ${IMAGE_CMD_CPIO} -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 		fi
 	fi
 }
-- 
2.7.4


