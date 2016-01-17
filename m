Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BF6436E666
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBGmoL020545 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:16:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z3IWPNRyE3gU
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:16:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HBGjac020542
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:16:46 GMT
Message-ID: <1453029405.27999.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 11:16:45 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] bootimg/image: Enhance bootimg to respect RM_OLD_IMAGE
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
X-List-Received-Date: Sun, 17 Jan 2016 11:16:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, iso and hddimg links don't respect RM_OLD_IMAGE. This
updates them to use the common symlinks code so that they behave
like the rest of the system.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index ec9d0b7..ed9afb9 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -172,10 +172,6 @@ build_iso() {
 	fi
 
 	isohybrid $isohybrid_args ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
-
-	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
-	ln -s ${IMAGE_NAME}.iso ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
 }
 
 build_fat_img() {
@@ -280,10 +276,6 @@ build_hddimg() {
 		fi
 
 		chmod 644 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-
-		cd ${DEPLOY_DIR_IMAGE}
-		rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
-		ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hddimg
 	fi
 }
 
@@ -294,7 +286,10 @@ python do_bootimg() {
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
     bb.build.exec_func('build_iso', d)
+    bb.build.exec_func('create_symlinks', d)
 }
+do_bootimg[subimages] = "hddimg iso"
+do_bootimg[imgsuffix] = "."
 
 IMAGE_TYPEDEP_iso = "ext4"
 IMAGE_TYPEDEP_hddimg = "ext4"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fb923d9..782d555 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -397,7 +397,7 @@ python () {
         d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
         d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
         d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
-        d.setVarFlag('do_image_%s' % t, 'subimages', subimages)
+        d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
         d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
 
@@ -460,15 +460,16 @@ python create_symlinks() {
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
     taskname = d.getVar("BB_CURRENTTASK", True)
-    subimages = d.getVarFlag("do_" + taskname, 'subimages', False)
+    subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
+    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix', True) or ".rootfs."
     os.chdir(deploy_dir)
 
     if not link_name:
         return
     for type in subimages:
-        if os.path.exists(img_name + ".rootfs." + type):
+        if os.path.exists(img_name + imgsuffix + type):
             dst = deploy_dir + "/" + link_name + "." + type
-            src = img_name + ".rootfs." + type
+            src = img_name + imgsuffix + type
             bb.note("Creating symlink: %s -> %s" % (dst, src))
             if os.path.islink(dst):
                 if d.getVar('RM_OLD_IMAGE', True) == "1" and \



