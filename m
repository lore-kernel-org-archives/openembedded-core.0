Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A53C63680
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 12:09:28 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12185.1771762159113067335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 04:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=PfAVvfld;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202602221209167428cbf72500020761-ukwvhq@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202602221209167428cbf72500020761
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Feb 2026 13:09:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=i/6lElXTq9p7Yyg+Hm7fVCk3QHcDUkaLjmD0eEhxoes=;
 b=PfAVvfldo04yihcFRdulMdsnAFEEMwCHTklKNKdD91i8ZS9erykhqb0hYaaVI9/GI09w8A
 Lz5i45Nkint6j2FIwjFHqSoKFS2o9DOoG80feNaJ8G2uGw6HY3jKAEzdftR77gGKoSJVt6/g
 hylaFIKzT0FaHliRmy6n4bKEi+4qxfigmM9b6uc1TyOiXVO3NI9UzOJElMc4Fg+spFtP5RyG
 9M9Q0zBeVqa3p+Etx5tDkW7JT8/LbV8f/hFgdDkuBjUIf1ZX/EZnEszZRV0OWE3giIsfKvwq
 qTQdVCmadEMUpWRnGRR9Cj5RuvO+Xqe83pyPvIuE8HlNQRNhS/3vQSUg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/2] kernel.bbclass: remove dependency on initramfs when not bundled
Date: Sun, 22 Feb 2026 13:07:36 +0100
Message-ID: <20260222120910.318167-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260222120910.318167-1-adrian.freihofer@siemens.com>
References: <20260222120910.318167-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 12:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231630

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Previously, the kernel recipe depended on the initramfs image even when
INITRAMFS_IMAGE_BUNDLE was not enabled. This caused the kernel to be
rebuilt whenever the initramfs image changed, regardless of whether the
kernel actually included the initramfs.

The problematic chain was:
  linux:do_deploy ->
  linux:do_bundle_initramfs ->
  image-initramfs:do_image_complete

The original intent (acc. to the comment) was to ensure the initramfs
image was available for tools like wic. However, apart from bundling the
initramfs in the kernel, there is probably no reason why the kernel
should depend on the initramfs. And it is therefore simply wrong if it
does so anyway. Thus, use cases that may be broken by these change are
based on a bug, not a feature. This needs to be fixed by adding a
dependency on the initramfs in the right place, not in the kernel where
this destroys the kernel's sstate-caching.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel.bbclass | 77 ++++++++++++++----------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..7a5ccb585a 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -149,16 +149,13 @@ set -e
 """ % (type, type, type))
 
 
-    image = d.getVar('INITRAMFS_IMAGE')
-    # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
-    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is built
-    # standalone for use by wic and other tools.
-    if image:
+    if d.getVar('INITRAMFS_IMAGE') and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
         if d.getVar('INITRAMFS_MULTICONFIG'):
             d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc:${BB_CURRENT_MC}:${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
         else:
             d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+
+        bb.build.addtask('do_bundle_initramfs', 'do_deploy', 'do_install', d)
         bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
@@ -305,39 +302,37 @@ copy_initramfs() {
 }
 
 do_bundle_initramfs () {
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		echo "Creating a kernel image with a bundled initramfs..."
-		copy_initramfs
-		# Backing up kernel image relies on its type(regular file or symbolic link)
-		tmp_path=""
-		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
-				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
-				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
-				mv -f $realpath $realpath.bak
-				tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
-			elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
-				tmp_path=$tmp_path" "$imageType"##"
-			fi
-		done
-		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
-		kernel_do_compile
-		# Restoring kernel image
-		for tp in $tmp_path ; do
-			imageType=`echo $tp|cut -d "#" -f 1`
-			linkpath=`echo $tp|cut -d "#" -f 2`
-			realpath=`echo $tp|cut -d "#" -f 3`
-			if [ -n "$realpath" ]; then
-				mv -f $realpath $realpath.initramfs
-				mv -f $realpath.bak $realpath
-				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
-			else
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
-				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
-			fi
-		done
-	fi
+	echo "Creating a kernel image with a bundled initramfs..."
+	copy_initramfs
+	# Backing up kernel image relies on its type(regular file or symbolic link)
+	tmp_path=""
+	for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+		if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
+			linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
+			realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
+			mv -f $realpath $realpath.bak
+			tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
+		elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
+			mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
+			tmp_path=$tmp_path" "$imageType"##"
+		fi
+	done
+	use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
+	kernel_do_compile
+	# Restoring kernel image
+	for tp in $tmp_path ; do
+		imageType=`echo $tp|cut -d "#" -f 1`
+		linkpath=`echo $tp|cut -d "#" -f 2`
+		realpath=`echo $tp|cut -d "#" -f 3`
+		if [ -n "$realpath" ]; then
+			mv -f $realpath $realpath.initramfs
+			mv -f $realpath.bak $realpath
+			ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
+		else
+			mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
+			mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
+		fi
+	done
 }
 do_bundle_initramfs[dirs] = "${B}"
 
@@ -357,8 +352,6 @@ python do_devshell:prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_install before do_deploy
-
 KERNEL_DEBUG_TIMESTAMPS ??= "0"
 
 kernel_do_compile() {
@@ -860,7 +853,7 @@ kernel_do_deploy() {
 # ensure we get the right values for both
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
-addtask deploy after do_populate_sysroot do_packagedata
+addtask deploy after do_install do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
 
-- 
2.52.0


