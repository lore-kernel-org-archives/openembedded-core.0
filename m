Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5908A7F986
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 16:10:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9SG9wdO003610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Oct 2019 09:09:58 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 28 Oct 2019 09:09:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 29 Oct 2019 00:09:56 +0800
Message-ID: <1572278996-14306-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] classes/image_types_wic.bbclass: fix racing risk on rootfs
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
X-List-Received-Date: Mon, 28 Oct 2019 16:10:02 -0000
Content-Type: text/plain

Since wic image creation will temporarily update rootfs/etc/fstab
(*temporarily* means the fstab will be recovered after wic image creation),
there is still racing risk during the temporarily time for other image
creation (such as tar, ext)

Make a copy of rootfs(as rootfs_wic), and create wic image based on the copy.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index f350dc2..2a93143 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -26,15 +26,20 @@ def wks_search(files, search_path):
 WIC_CREATE_EXTRA_ARGS ?= ""
 
 IMAGE_CMD_wic () {
+	[ -d "${IMAGE_ROOTFS}_wic" ] && rm -rf "${IMAGE_ROOTFS}_wic"
+	# Refer oe.path.copytree(src, dst): ${WORKDIR}/rootfs -> ${WORKDIR}/rootfs_wic
+	mkdir -p "${IMAGE_ROOTFS}_wic"
+	tar --xattrs --xattrs-include="*" -cf - -S -C "${IMAGE_ROOTFS}" -p . | tar --xattrs --xattrs-include="*" -xf - -C "${IMAGE_ROOTFS}_wic"
+
 	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
 	wks="${WKS_FULL_PATH}"
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
 
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -r "${IMAGE_ROOTFS}_wic" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
-	rm -rf "$out/"
+	rm -rf "$out/" "${IMAGE_ROOTFS}_wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
 
-- 
2.7.4


