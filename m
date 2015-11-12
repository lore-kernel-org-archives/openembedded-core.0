Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4846077280
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:40:50 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79715549pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+phVBt6LgmIFnG9QOpG7YZ3EdCV0RhWEkSKj4eoWTu4=;
	b=WDdCfRzduoTGnFfidGG2T+v1sIfFAyjvhEY5Vm3I3A0GaI1Kmlei1JjHgnGpxtVuQM
	TyJhHqLKsrbRee9yUdwjkJMI6KYrgH2qs3dS5vPxaU52SbvuSQB7MHEC+vCNPee0RSSU
	l3xbbGJvUKdX9swU2bi6mhesjaHLCw7NbzBOinXo7/J12IBkN1S+GAk59NsANXFfrVOt
	sO1ZWA+Y/BScoS/F1fUgPbf8Mb5wZtw3UDIRwZMg3rfeEiWiJUJgqCfN6zgfD1R3x/R4
	Rbfq0rtAUkFVt+hqq0l31F9apAO0MxKQYB7GtVXpMZ1WIvHF3+QwwsCboeMHDi/Vq52+
	nYZQ==
X-Received: by 10.68.231.7 with SMTP id tc7mr27659570pbc.108.1447371651117;
	Thu, 12 Nov 2015 15:40:51 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:40:48 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:32 -0700
Message-Id: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/7] image_types: improve wks path specification
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
X-List-Received-Date: Thu, 12 Nov 2015 23:40:51 -0000

From: Christopher Larson <chris_larson@mentor.com>

Hardcoding a full input path with zero flexibility goes against everything the
Yocto Project is about. Rework it to let the user specify the wks base
filename with WKS_FILE and it'll search the layers for the wks file and use
it.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5036919..431df3a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -170,15 +170,23 @@ IMAGE_CMD_ubi () {
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
+WKS_FILE ?= "${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks"
+WKS_FULL_PATH = "${@bb.utils.which('${WKS_SEARCH_PATH}', '${WKS_FILE}') if not os.path.isabs('${WKS_FILE}') else '${WKS_FILE}'}"
+WKS_FULL_PATH[vardepvalue] = "${WKS_FULL_PATH}"
+WKS_SEARCH_PATH ?= "${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBLAYERS}'.split())}"
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
+	if [ ! -e "$wks" ]; then
+		bbfatal "Kickstart file $wks doesn't exist"
+	fi
+
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
+	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out.rootfs.wic"
+	rm -rf "$out/"
 }
+IMAGE_CMD_wic[file-checksums] += "${WKS_FULLPATH}"
 
 EXTRA_IMAGECMD = ""
 
-- 
2.2.1


