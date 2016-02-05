Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 786F577136
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:56:23 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aRkcJ-00065I-IJ from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Feb 2016 09:56:23 -0800
Received: from sb-ubuntu-1404-64bit.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 5 Feb 2016 09:56:22 -0800
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Feb 2016 10:56:20 -0700
Message-ID: <1454694980-19739-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Subject: [PATCH] image_types.bbclass: Embed IMAGE_NAME in ubinize config file
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
X-List-Received-Date: Fri, 05 Feb 2016 17:56:24 -0000
Content-Type: text/plain

When using the FSTYPE multiubi, make sure that each image build
has a unique config file.  Without this there is a race condition
when building multiple images in a single bitbake command which
results in errors similar to:

    ERROR: Error: The image creation script
    'blah/tmp/work/blah/core-image-base/1.0-r0/temp/create_image.multiubi' returned 1:
    iniparser: cannot open ubinize_normal.cfg
    ubinize: error!: cannot load the input ini file "ubinize_normal.cfg"
    mv: cannot stat 'ubinize_normal.cfg': No such file or directory
    WARNING: blah/tmp/work/blah/core-image-base/1.0-r0/temp/create_image.multiubi:1 exit 1 from
      mv ubinize${vname}.cfg blahtmp/deploy/images/blah/

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/classes/image_types.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5036919..0f7fc24 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -126,18 +126,18 @@ multiubi_mkfs() {
 		local vname="_$3"
 	fi
 
-	echo \[ubifs\] > ubinize${vname}.cfg
-	echo mode=ubi >> ubinize${vname}.cfg
-	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}.cfg
-	echo vol_id=0 >> ubinize${vname}.cfg
-	echo vol_type=dynamic >> ubinize${vname}.cfg
-	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}.cfg
-	echo vol_flags=autoresize >> ubinize${vname}.cfg
+	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
+	echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
+	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
 	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs ${mkubifs_args}
-	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}.cfg
+	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
 
 	# Cleanup cfg file
-	mv ubinize${vname}.cfg ${DEPLOY_DIR_IMAGE}/
+	mv ubinize${vname}-${IMAGE_NAME}.cfg ${DEPLOY_DIR_IMAGE}/
 
 	# Create own symlinks for 'named' volumes
 	if [ -n "$vname" ]; then
-- 
2.7.0


