Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 258D46D6E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1pWGxRfPKgF4yfy9Kg0nTIaa8BWtsFx2YsN1elwiR/k=;
	b=bZmVaHo5HvGX575CTPtgTo9i0X
	X2lp51vgbS2+Q0l8278Jf09StG4RzdhL9Ib/Slw6A+VFv3fr8ch503yL7CUDl1nFYtDAYSvAINhAs
	68HAydK4aiGAN8+SfoM6W9D8aBBZH6rW+Sf2Vo+OChdunbX1eRKGOiRUzN/WyRIJKzVVW/I43hKHO
	wNJYOfVNtBOzd5HV38GJlaiC66zfjsHJ17TIys5km8wnz0XjKUXWYvAK/1RLtdaTjTJkOcpJtwaUY
	SxSfT9jmlzDro17e/NKPjQrVQSm+n2IXj/f76tUTDObPrZMUeYG4klEM58A5xA7XbdD7XXowL7b2/
	ckaIT1Lg==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1gSLKS-0004Lk-IF; Thu, 29 Nov 2018 14:22:00 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1gSLKS-0005Zz-Fb; Thu, 29 Nov 2018 14:22:00 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:21:33 +0200
Message-Id: <1543494097-19534-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: Michael.Ho@bmw.de
Subject: [PATCH 1/5] RFC image_types.bbclass: add image size limit for tar image type
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
X-List-Received-Date: Thu, 29 Nov 2018 13:00:45 -0000

If IMAGE_ROOTFS_SIZE_LIMIT is defined in image configuration, then
build will fail if for tar image type the uncompressed tar ball size
exceeds the value, as reported by 'du -ks'.

This check could be extended to other image types as well.

There already exists a check with IMAGE_ROOTFS_SIZE variable
but I could not figure out how to actually use it. It does
some quite complex overhead calculations which did not seem
to work for me on sumo.

When the image size is exceeded, build fails like this:

ERROR: image-1.0-r0 do_image_tar: Image size 170712 of /home/builder/src/base/build/tmp/work/linux/image/1.0-r0/deploy-image-complete/image.rootfs.tar reported by 'du -ks' is larger than limit IMAGE_ROOTFS_SIZE_LIMIT 170000

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/image.bbclass       |  2 +-
 meta/classes/image_types.bbclass | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 276d0d3..34a567f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -127,7 +127,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS', 'IMAGE_ROOTFS_SIZE_LIMIT']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5c40648..0481703 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -125,7 +125,16 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar() {
+	set -ex
+	"${IMAGE_CMD_TAR}" --numeric-owner -cf "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar" -C "${IMAGE_ROOTFS}" . || [ $? -eq 1 ]
+	# fail build if IMAGE_ROOTFS_SIZE_LIMIT is exceeded
+	if [ -n "${IMAGE_ROOTFS_SIZE_LIMIT}" ]; then
+		imagesize=$( du -ks "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar" | awk '{ print $1 }' )
+		[ "${imagesize}" -gt "${IMAGE_ROOTFS_SIZE_LIMIT}" ] && \
+		bberror "Image size ${imagesize} of ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar reported by 'du -ks' is larger than limit IMAGE_ROOTFS_SIZE_LIMIT ${IMAGE_ROOTFS_SIZE_LIMIT}"
+	fi
+}
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
1.9.1


