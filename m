Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E51B4745AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 21:06:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id h33-v6so9983327edb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=q3Lp1+Dn28LOB0zfa0mr29svRxTR9lZCNA9q9d/qaJ0=;
	b=I8cl+tK3yy/aSopRjkW/tI2IFEQB7ClNn0iKucBOUBQxJB0Ppd29L7fVyj2B7b9huz
	/VWYEDfxTOovXhl7d25L9EZkbRs90drvQxT3CXLJ3MoKN0M5XRytWIyEYh636qzRqQbw
	tbq/w/yn1SLw+vbMBLlShYbF/eQcUzTxGnX1vdMnnE6yiyn44O2A0sWIKCdylcBWzQtF
	IlJ7jcYOWvqTJY12M/z4G366KN8qqAqfOx/rkXN8oy//mRreyjWD77HLBTeGomLeTNtQ
	SwL4K3E12oR+dPFvV0yiA2ACWE8wFa16uG7pYr5sr+ZpsTFcIpJO1O82cDYq6S3jnUwD
	RdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q3Lp1+Dn28LOB0zfa0mr29svRxTR9lZCNA9q9d/qaJ0=;
	b=gUB/I4/VVesjguIRzJfUZBdU8ZJJ6tNaqywklalB2SFVex9cd32eal98OQDa7jnr+d
	Id+UL8oxCXE0Tk03AWua2V9QVzpGL1UNRnqJN+62/74uRRyrNBPx7iWd25oBBKXi50ah
	g2BA/tCDS3E7yJCBg+IVE9P/fzTHNZOMvfcDY4mmRZ3S4H1slmDDMoH4YK0w0FXAz4GC
	qoI656pm5VyD1ruOfJt9SFv9JRig88tbdKZIaGdi8P9iNwecDBf9qeiuAvuFCyK0jZkn
	B4f6C4Y9bsxhB/qsAR+JTZCCy+xxIqhIKZ/8VLybSuJg3J81rsg/TVts1zwYzHrR2ymH
	ViRQ==
X-Gm-Message-State: APzg51D+tFqA0ttccjQ1s5dmI11aEAReFiP0HLbSZLokxzuM8i0HZb+/
	AJtuoIoZsYJwYRSFHPaDpU6W1AKYIOi6uA==
X-Google-Smtp-Source: ANB0VdZS2axjCqYgmbSuUQDmslwExKEOOAKvGDa8QjRhL4VXNI+lsyYrjty9DsA7ZtO6ZNmnlxuj1Q==
X-Received: by 2002:a50:8345:: with SMTP id 63-v6mr5405348edh.5.1536267970359; 
	Thu, 06 Sep 2018 14:06:10 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	g38-v6sm3188862edc.40.2018.09.06.14.06.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 14:06:09 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 23:06:02 +0200
Message-Id: <1536267962-5562-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Subject: [openembedded-core][PATCH] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Thu, 06 Sep 2018 21:06:10 -0000

kernel-fitimage.bbclass replaces an occurance of "fitImage" in
KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
architecture (such as zImage). The kernel-fitimage.bbclass packs that
image as sub-image in a flattened image tree image (fitImage) and
deploys this fitImage along with the image tree source file (.its).

kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
also contains "fitImage", which kernel.bbclass will also deploy
redundantly with different naming.

The result is a dual deployment with slightly different naming,
each with a set of symlinks.

The solution chosen is to have fitImage deployment be handled by
kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
types during deployment.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel.bbclass | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b57832c..5d168e8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -669,8 +669,11 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=${imageType}-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		if [ "$imageType" != "fitImage" ]; then
+			base_name=${imageType}-${KERNEL_IMAGE_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
+		fi
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -686,12 +689,14 @@ kernel_do_deploy() {
 	done
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
-			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
-		done
+		if [ "$imageType" != "fitImage" ]; then
+			for imageType in ${KERNEL_IMAGETYPES} ; do
+				initramfs_base_name=${imageType}-${INITRAMFS_NAME}
+				initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
+				install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
+				ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			done
+		fi
 	fi
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
-- 
2.7.4


