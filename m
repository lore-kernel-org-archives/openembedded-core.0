Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B8B1E71C7E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 20:52:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 13:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="1126169046"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2017 13:52:59 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 13:52:57 -0700
Message-Id: <1493844777-25545-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493844777-25545-1-git-send-email-juro.bystricky@intel.com>
References: <1493844777-25545-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/2] image_types.bbclass: improve cpio image reproducibility
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
X-List-Received-Date: Wed, 03 May 2017 20:52:59 -0000

This patch helps to build cpio images that are binary reproducible.
The changes are as follows:

1. By default, cpio from the host is used, which can be quite old.
   Hence we need to implement a way to use/call cpio-native, which supports
   new features needed for binary reproducibility, notably the arguments
   such as "--reproducible" and "--ignore-devno".
   This can be achieved by specifying the following (in local.conf):

   IMAGE_DEPENDS_cpio_append = " cpio-replacement-native"
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
index 7749b00..dd6fb97 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -110,9 +110,17 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 IMAGE_CMD_TAR ?= "tar"
 IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} ."
 
+# By default, cpio from the host is used, which can be quite old. If
+# you need special parameters (like --ignore-devno --reproducible) which are only
+# supported by GNU cpio upstream >= 2.12, then override that default:
+# IMAGE_CMD_CPIO = "cpio --ignore-devno"
+# IMAGE_DEPENDS_cpio_append = " cpio-replacement-native"
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
@@ -122,10 +130,12 @@ IMAGE_CMD_cpio () {
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


