Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF36764AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 14:59:22 +0000 (UTC)
Received: by iodv127 with SMTP id v127so71396265iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=esHejM93gc99k76J7NjwoWpuYG3jV1V6m5GBiz0v8AU=;
	b=GVJeqj455a6D6qPWGzptVbgLtCZ1zxNlYxAoybCmZYAFXSSqUY02I3DRNuq/nnL+xa
	a0aMXZBk44998+9zhIxEozqPpoEfx/wgMd2ABoSDZ4Ym9qrXCKfqz+UIegYKVwfgkcsQ
	/LzMBgcFQTv5CRQHfu9moqFBOCt6GuHWvmwD2Kw4qDaEyY6IknjDhDD61niAhZ6cs5c9
	bOHQNnMpCbElpvi/YigFiGh6rsxK3hIlI4U/Hx5QgyKDRnO/SDWiQPMNmZjPtBMB0XRJ
	JnklLEdkEOKIHulzuk+8ThEkbtDiDecssTWWRo/BfaZw4xu/cYFYfjCD4KpwboIhbagh
	i/1g==
X-Gm-Message-State: ALoCoQmGfVDpwyCvdcenkMd+JeI4PfiDWY9G+aBlkzFXoxEeiOIcm843Mh+XwcfeowBs5YB84/fA
X-Received: by 10.107.12.84 with SMTP id w81mr17593575ioi.33.1439564362666;
	Fri, 14 Aug 2015 07:59:22 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D814.dip0.t-ipconnect.de.
	[93.232.216.20])
	by smtp.gmail.com with ESMTPSA id d3sm2701488igx.5.2015.08.14.07.59.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Aug 2015 07:59:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 16:59:04 +0200
Message-Id: <1e523b1b42ad0bdf6d22f0f1f4b9e4bf65ab4e69.1439564102.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439564102.git.patrick.ohly@intel.com>
References: <cover.1439564102.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1439564102.git.patrick.ohly@intel.com>
References: <cover.1439564102.git.patrick.ohly@intel.com>
Subject: [PATCH v2 2/2] image_types.bbclass: allow replacing tar command
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
X-List-Received-Date: Fri, 14 Aug 2015 14:59:22 -0000

Usually, the host's tar command is sufficient. However, special cases
like archiving xattrs depend on a modern GNU tar version. The new
IMAGE_CMD_TAR makes that possible, with xattrs given as example.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image_types.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index cc789fc..2f782dc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -71,7 +71,19 @@ IMAGE_CMD_btrfs () {
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
-IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
+
+# By default, tar from the host is used, which can be quite old. If
+# you need special parameters (like --xattrs) which are only supported
+# by GNU tar upstream >= 1.27, then override that default:
+# IMAGE_CMD_TAR = "tar --xattrs --xattrs-include=*"
+# IMAGE_DEPENDS_tar_append = " tar-replacement-native"
+# EXTRANATIVEPATH += "tar-native"
+#
+# The GNU documentation does not specify whether --xattrs-include is necessary.
+# In practice, it turned out to be not needed when creating archives and
+# required when extracting, but it seems prudent to use it in both cases.
+IMAGE_CMD_TAR ?= "tar"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
 do_rootfs[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.1.4


