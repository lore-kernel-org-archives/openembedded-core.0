Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4097E7DB58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 09:11:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3C9B4KD024177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Apr 2019 02:11:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 12 Apr 2019 02:11:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 12 Apr 2019 05:10:38 -0400
Message-ID: <1555060238-228257-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] image_types.bbclass: fix a race between the ubi and ubifs FSTYPES
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
X-List-Received-Date: Fri, 12 Apr 2019 09:11:05 -0000
Content-Type: text/plain

The ubi, ubifs and multiubi FSTYPES calls `mkfs.ubifs' to create UBIFS
images.

In do_image_ubi, $vname is empty, the name of UBIFS image conflicts with
the one in do_image_ubifs, and it's a race risk.
[do_image_ubi]
mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
[do_image_ubi]

[do_image_ubifs]
mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}
[do_image_ubifs]

In do_image_multiubi, $vname is not empty, the UBIFS image name does
not conflict with others.

So do not call mkfs.ubifs in do_image_ubi and depend on do_image_ubifs
to create UBIFS images.

The fix does not affect do_image_multiubi which still call mkfs.ubifs to
create multiple UBIFS images and symlinks.

[YOCTO #13272]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image_types.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f363c42ee5..95aa1674cf 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -170,7 +170,9 @@ multiubi_mkfs() {
 	echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
 	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
+	if [ -n "$vname" ]; then
+		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
+	fi
 	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
 
 	# Cleanup cfg file
@@ -204,6 +206,7 @@ IMAGE_CMD_multiubi () {
 IMAGE_CMD_ubi () {
 	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
 }
+IMAGE_TYPEDEP_ubi = "ubifs"
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
-- 
2.17.1


