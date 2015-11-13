Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 279BF77356
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 23:10:50 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so6613512pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 15:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6pgeqOUNjNRyADhTNPUUZHlBWnqo+ccFJiVK147P1Lo=;
	b=k7aXxx431eqUqbGys9Qi3z7/fuvO4GSLKu0Ff2DUhXZtfDfPxDZDc+TbS+4zPeOy2P
	PrvHjLFEZEwFLH26enlW2s59I5yE3Wb2zLtATizJ/amsliZ7wAeM0JzJnaDvQjhVI8f3
	JV6d7lrYO8NzVfDMtH5BCO0gCp1ymviBkburXCj8zWK0H3Nb+h5BzQpWMApDVcbr6Ql4
	zuWhGV0N6vc2jDGA6gZwSBzEeXZtN3I+DvyS6hn1K/Desjj8f6y7eiaKtVTVmkWTHs88
	sSNMFIFpFQOUwsYpMokbtE8Br84cYT0TA6in1vy5CqMyLKcUk84hGbQFTl/c8boWA27u
	DyqA==
X-Received: by 10.68.65.8 with SMTP id t8mr32478707pbs.99.1447456251017;
	Fri, 13 Nov 2015 15:10:51 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pq1sm22366902pbb.91.2015.11.13.15.10.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 15:10:48 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 16:10:39 -0700
Message-Id: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1447455202.git.chris_larson@mentor.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/6] image_types: improve wks path specification
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
X-List-Received-Date: Fri, 13 Nov 2015 23:10:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

Hardcoding a full input path with zero flexibility goes against everything the
Yocto Project is about. Rework it to let the user specify the wks base
filename with WKS_FILE and it'll search the layers for the wks file and use
it.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5036919..afe8d0c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -170,15 +170,37 @@ IMAGE_CMD_ubi () {
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
+WKS_FILE ?= "${IMAGE_BASENAME}.${MACHINE}.wks"
+WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
+WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or ''}"
+
+def wks_search(files, search_path):
+    for f in files:
+        if os.path.isabs(f):
+            if os.path.exists(f):
+                return f
+        else:
+            searched = bb.utils.which(search_path, f)
+            if searched:
+                return searched
+
 IMAGE_CMD_wic () {
-	out=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}
-	wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks
-	[ -e $wks ] || wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.wks
-	[ -e $wks ] || bbfatal "Kiskstart file $wks doesn't exist"
-	BUILDDIR=${TOPDIR} wic create $wks --vars ${STAGING_DIR_TARGET}/imgdata/ -e ${IMAGE_BASENAME} -o $out/
-	mv $out/build/${IMAGE_BASENAME}*.direct $out.rootfs.wic
-	rm -rf $out/
+	out="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}"
+	wks="${WKS_FULL_PATH}"
+	if [ -z "$wks" ]; then
+		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
+	fi
+
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
+	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out.rootfs.wic"
+	rm -rf "$out/"
 }
+IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
+
+# Rebuild when the wks file changes
+USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
+do_rootfs[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 
 EXTRA_IMAGECMD = ""
 
-- 
2.2.1


