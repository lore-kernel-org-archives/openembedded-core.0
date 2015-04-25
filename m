Return-Path: <psidhu@gateworks.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3732E735FA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Apr 2015 00:32:37 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so62236173pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 17:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rT9LgiglTKeyaDO29LM1dKpVZFyGjewB/VW3eky/Ecg=;
	b=IDIOhhk3wlwRkH/Og1ISxJ/etvuIccU2Hq0r1TMyFkASpoLrCcm7QvG+modRPApMrk
	6PbmSmpPd6+QErl7auTEpIb/jUi4snKN8yp2qbKAawidKiCo+j0xE3K2w/+91S0FMYU/
	SAdSq1yjMz/XVdzDhTXuOxzQUGIDENgDrk4jP68S10Ufe+TZQDXNfc5tV8F5ZVB84p4X
	r7DZr21Jz0oB0Y794C9kPbmYxB4SYB/VADUYYXZVtTP/pupo2h2JLIeVPQA8U4TvBNh9
	YjezPzwEiCFGcqyhVg2MYOCA4xqT8ctCtKJJi+LhQ5bDh4pZxG7tPRGQ35Kt74MVmkUV
	NTYQ==
X-Gm-Message-State: ALoCoQlWXlSoYUTUxiRGehqwi5s7P8Oc+NZNtHvH90zvGPFHbgBYVo8cEmziQqPaMTApWucXatw5
X-Received: by 10.70.63.39 with SMTP id d7mr1690070pds.106.1429921959545;
	Fri, 24 Apr 2015 17:32:39 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by mx.google.com with ESMTPSA id
	nq2sm12230525pdb.70.2015.04.24.17.32.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 17:32:38 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 17:32:22 -0700
Message-Id: <1429921942-19804-2-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429921942-19804-1-git-send-email-psidhu@gateworks.com>
References: <1429921942-19804-1-git-send-email-psidhu@gateworks.com>
Subject: [PATCH] image_types.bbclass: add support for multiple ubi sizes
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
X-List-Received-Date: Sat, 25 Apr 2015 00:32:40 -0000

Add new FSTYPE called 'multiubi'. This new type has the ability to
create multple ubi's, something that's extremely useful on boards that
can include varying flash sizes (e.g. 256MB vs 2GB).

Because we don't want to reuse code, I extracted the mkfs and ubinize
commands out to a new function that will handle the creation of both
multiple ubi's, as well as the 'ubi' FSTYPE (so as not to break current
boards).

Due to the single processes nature of the OE when doing it's
'create_image', this new multiubi_mkfs function also creates it's own
symlinks as well as cleans up it's own cfg file.

Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
---
 meta/classes/image_types.bbclass | 55 +++++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 72c7337..b250dbd 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -97,18 +97,48 @@ IMAGE_TYPEDEP_elf = "cpio.gz"
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
-IMAGE_CMD_ubi () {
-	echo \[ubifs\] > ubinize.cfg 
-	echo mode=ubi >> ubinize.cfg
-	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg 
-	echo vol_id=0 >> ubinize.cfg 
-	echo vol_type=dynamic >> ubinize.cfg 
-	echo vol_name=${UBI_VOLNAME} >> ubinize.cfg 
-	echo vol_flags=autoresize >> ubinize.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}
-	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
+multiubi_mkfs() {
+	local mkubifs_args="$1"
+	local ubinize_args="$2"
+	local vname="_$3"
+
+	echo \[ubifs\] > ubinize${vname}.cfg
+	echo mode=ubi >> ubinize${vname}.cfg
+	echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}.cfg
+	echo vol_id=0 >> ubinize${vname}.cfg
+	echo vol_type=dynamic >> ubinize${vname}.cfg
+	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}.cfg
+	echo vol_flags=autoresize >> ubinize${vname}.cfg
+	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs ${mkubifs_args}
+	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}.cfg
+
+	# Cleanup cfg file
+	mv ubinize${vname}.cfg ${DEPLOY_DIR_IMAGE}/
+
+	# Create own symlink
+	cd ${DEPLOY_DIR_IMAGE}
+	if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
+		ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
+		${IMAGE_LINK_NAME}${vname}.ubifs
+	fi
+	if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
+		ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
+		${IMAGE_LINK_NAME}${vname}.ubi
+	fi
+	cd -
+}
+
+IMAGE_CMD_multiubi () {
+	# Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
+	for name in ${MULTIUBI_BUILD}; do
+		eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
+		eval local ubinize_args=\"\$UBINIZE_ARGS_${name}\"
+
+		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
+	done
 }
-IMAGE_TYPEDEP_ubi = "ubifs"
+
+IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAME}""
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
@@ -139,6 +169,7 @@ IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
 IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
+IMAGE_DEPENDS_multiubi = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -151,7 +182,7 @@ IMAGE_TYPES = " \
     iso \
     hddimg \
     squashfs squashfs-xz squashfs-lzo \
-    ubi ubifs \
+    ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
     vmdk \
-- 
2.3.5


