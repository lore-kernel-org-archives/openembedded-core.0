Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4817E6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 00:38:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p52-v6so12778423eda.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 17:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=K6jQ89gDL5bjkfnmBJB3ZSJnqASCUFzO+PfcZnllk+k=;
	b=ZW8FfR+8H9bOBOLeKnrbBmp084Vq1+jfaVWAVc/O/AmF6Jnp7SPYfd2dxRDZmLrLsz
	Hpls1GvUb75qfd0KhgNb1+mWcxdA2nGd/qoYXCYPVcvzClMjgQZ+BVJZc6scvIHRKReO
	f6i2sp6X6dybJBYxt0YNzsggBGEx2seEowEt1CFSMKsKQ7Ewo60iR8Todz1pSTcT8Ctp
	oA7DALux1L5M8XBCRMtB+JzA3RQQz78mOZBWT47g6+EnOeH+89cNh0cI16FOy5tzzyU7
	ccUOX1+JsN/MzozR3t883cy1+fYE3sHk01flo94VReo5rup+P5O/wjOGIH4NYMofpG78
	hWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K6jQ89gDL5bjkfnmBJB3ZSJnqASCUFzO+PfcZnllk+k=;
	b=MDj4kJ7ZZUs4yMWCiSI6keX8jeGvC2xDPUVOo+QLxgeIRbPvG9wiO0gsAcmYObXP+y
	wC62O9/d42x/Vt3dWuM7UpkynzeK9JMYewhA7zr0jghlh6IG/G703jYLoYRxI/LztIj5
	iS/cToWNckoIjBD5ea+AQEO0ZPPb7mapqBuI7HgS0J1aXNL+tW5roCeC+EX149ovt6A5
	BrPOZW15tuozSEjKIQIwLDOAZGjbymG/nyXAE2jEv9C2RTb+RnAthykj9pADspuOcyy1
	ke83MIbRAK+CEOmphOLllq7GjeI6T2cwhZavm4ZdUkeBwEcK9jJJDKSzi33zJ1mfsfdR
	7PrA==
X-Gm-Message-State: APzg51Ddbz8Tt/HArsWAZuBiBOqsISAWuuhimaYzfBqhpZlxHPvA/MXA
	QXZhPzqPQMp06YYblL6jiwW5Bqx9eEoTEg==
X-Google-Smtp-Source: ANB0VdYsgIXYUUhLkNZlv3M3rH4jIkRtHPQx2TR+QKvHnIYdWTdsZ/G7IyFHdhPjUHnXKoC8QmefSA==
X-Received: by 2002:a50:d619:: with SMTP id
	x25-v6mr29894392edi.178.1535935098703; 
	Sun, 02 Sep 2018 17:38:18 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	h3-v6sm9072410ede.42.2018.09.02.17.38.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 17:38:18 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2018 02:38:13 +0200
Message-Id: <1535935093-30793-1-git-send-email-leon@sidebranch.com>
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
X-List-Received-Date: Mon, 03 Sep 2018 00:38:18 -0000

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
 meta/classes/kernel.bbclass | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b341733..fd43ecd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -675,8 +675,10 @@ kernel_do_deploy() {
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
+		if [ "$type" != "fitImage" ]; then
+			base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
+		fi
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -685,21 +687,25 @@ kernel_do_deploy() {
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
-		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${type}
+		if [ "$type" != "fitImage" ]; then
+			base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+			symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
+			ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
+			ln -sf ${base_name}.bin $deployDir/${type}
+		fi
 	done
 
 	cd ${B}
 	# Update deploy directory
 	for type in ${KERNEL_IMAGETYPES} ; do
-		if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
-			echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
-			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${type}-initramfs-${MACHINE}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+		if [ "$type" != "fitImage" ]; then
+			if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+				echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
+				initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
+				initramfs_symlink_name=${type}-initramfs-${MACHINE}
+				install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
+				ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			fi
 		fi
 	done
 }
-- 
2.7.4


