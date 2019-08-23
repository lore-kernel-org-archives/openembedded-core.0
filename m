Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id ECD927F311
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:01:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u16so7503846wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZKAtJMenX/fVJ7eXCX4MhpnHQ3Sm4Q70+Sv5Qd1LTGQ=;
	b=Q4q62DQel1G+96yjjYtE0o7bRqPMlGfwwNu5bzcIsk0QOJdKWoYwKAhlxScL2EwNfG
	JgVX3WLf06SdFSP5BNRnNIxzuXLWraN1c634SQIIzu1Bk5SAZn7yvJKAEq+XvgDVSAZX
	yu7+FCikO6AaTmnTilWM/nHwxPr7IcoSqVsvXsr6tmuxdHkBa/PLPZglUa8BmK8ykTeH
	b74nQgO7PfJIH8YWNVeYFCm2w4/L/To55bVKlwyaepQIDDx/8KNIICXwD2elXHx5yJ+V
	yxPacI56qI2BUPjJaRqRNfafqVOO8vimovs+CHsDCXucRrpPyk7WhW2tIjW5YL7TIPaQ
	nQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZKAtJMenX/fVJ7eXCX4MhpnHQ3Sm4Q70+Sv5Qd1LTGQ=;
	b=dAAK0u0eDDkI9N5d0Te4ihi4EoDvTTvwyFSK8yk0u1SUOdshdT+R9keWF88WXRB+Az
	0UydAg8ck5vLQo73yajB3Evfs7tE4qxdpLJA7e/K2Uv6ChwM2dlf6zLV43TaLl9CVesT
	Da+kLVgc9DCa6NZQquq+5iZA6n9EPCAtCVHdUDrxhRfCBh0EMpuKGrxKlve0zKwYMHWO
	7cdzgJ6nEVv1bln3VdxI5RDT+xE2Azq5ToWkWCwZ9l/BG4RCW52RJeXEXOwSGqCCG28x
	44GggpwI636CN3c7THd0iGSiTXSljGgZGDCZ+DyEK53ai139k/PtyzUegJQSVIDVjdPu
	sN+A==
X-Gm-Message-State: APjAAAXYaxRpKVqNmLJHd/fE5K4fO89LAoBkysQFI4Sorp4D7xI63x3K
	VPBdtNjHIOXTCpodpJKWXNfj/BOs6ds=
X-Google-Smtp-Source: APXvYqw9pLSjtNmssvhQgmpEwsXZ1RSP/xrBZ9NMZNPnDC4eknM8y5ZPrstmJ3TVPBUeba/mg3jZcQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr2863827wrp.38.1566540101159; 
	Thu, 22 Aug 2019 23:01:41 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	w14sm1749617wrl.21.2019.08.22.23.01.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Aug 2019 23:01:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 06:01:31 +0000
Message-Id: <272d1f623e0248a37629de8394d4dea1c20d4f11.1566540028.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in the _LINK_NAME variables and change it to hard link
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
X-List-Received-Date: Fri, 23 Aug 2019 06:01:41 -0000

* just RFC, the part for images isn't finished yet and there is
  still some issue with DATETIME when kernel artifacts are used
  from sstate, this is just to validate the idea behind
  [YOCTO #12937] before finishing the implementation (it's already
  finished and used by various LGE builds, but having simpler
  way of doing it directly in oe-core mighe be useful for others).

* move IMAGE_VERSION_SUFFIX from _NAME variables to _LINK_NAME
  that way e.g. kernel.do_deploy can be reused from sstate to
  provide "version-less" artifacts and then very fast
  do_deploy_links task just adds links with consistent suffixes
  (by default the version from the recipe but could be easily set
  to e.g. some release name when building some products).
* create hard links instead of symlinks, so that whatever version
  the filename says is really there
* some IMAGE_FSTYPES might need the "version-less" IMAGE_NAME file
  to be removed first or they might either append or update the
  content of the image instead of creating new image file from
  scratch - I have seen this only with one proprietary format we
  generate with our own tool, so hopefully this isn't very common
* this is basically the mechanism are using in webOS with
  WEBOS_IMAGE_NAME_SUFFIX which is for official builds set from
  jenkins job and then all artifacts (images as well as corresponding
  kernel files) have the same version string)

* without this, you can still easily set the variables to contain
  the version from jenkins job (excluded from sstate signature like
  DATETIME currently is to prevent rebuilding it everytime even when
  the content didn't change) but then when kernel is reused from sstate
  you can have version 1.0 used on kernel artifacts and 2.0 on image
  artifacts.

* if you don't exclude the version string with vardepsexclude, then
  you get the right version in the filenames but for cost of
  re-executing do_deploy every single time, which with rm_work will
  cause all kernel tasks to be re-executed (together with everything
  which depends on it like external modules etc).

* the implementation "from outside" is a bit tricky as shown in webOS
  OSE, because first you need to reverse the meaning of IMAGE_NAME
  and IMAGE_LINK_NAME like here, but also replace all symlinks with
  hardlinks and then adjust all recipes/bbclasses to depend on our
  do_deploy_fixup task instead of the original do_deploy
  see the variable modifications:
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/conf/distro/include/webos.inc#L65
  and then various bbclasses to hook do_webos_deploy_fixup task creating
  the hardlinks for possible artifacts:
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/webos_deploy.bbclass
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/kernel.bbclass
  https://github.com/webosose/meta-webosose/blob/a35e81622aae1066591e44a132d01297ff478248/meta-webos/classes/image.bbclass
  so hopefully with all these changes in oe-core other project can
  achieve the same just by setting one variable IMAGE_VERSION_SUFFIX

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

kernel
---
 meta/classes/cve-check.bbclass             |  4 +-
 meta/classes/image-artifact-names.bbclass  |  4 +-
 meta/classes/image.bbclass                 | 10 ++---
 meta/classes/kernel-artifact-names.bbclass |  4 +-
 meta/classes/kernel-devicetree.bbclass     | 21 +++++++++--
 meta/classes/kernel.bbclass                | 43 ++++++++++++++++------
 meta/classes/qemuboot.bbclass              |  2 +-
 meta/classes/rootfs-postcommands.bbclass   |  4 +-
 8 files changed, 63 insertions(+), 29 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d2910be..19ef51eb05 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -100,10 +100,10 @@ python cve_check_write_rootfs_manifest () {
 
         if manifest_name and os.path.exists(manifest_name):
             manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
-            # If we already have another manifest, update symlinks
+            # If we already have another manifest, update hardlinks
             if os.path.exists(os.path.realpath(manifest_link)):
                 os.remove(manifest_link)
-            os.symlink(os.path.basename(manifest_name), manifest_link)
+            os.link(manifest_name, manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
 }
 
diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
index 5ab8f1b7aa..d5ba035f5a 100644
--- a/meta/classes/image-artifact-names.bbclass
+++ b/meta/classes/image-artifact-names.bbclass
@@ -5,8 +5,8 @@
 IMAGE_BASENAME = "${PN}"
 IMAGE_VERSION_SUFFIX = "-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+IMAGE_LINK_NAME = "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
 
 # IMAGE_NAME is the base name for everything produced when building images.
 # The actual image that contains the rootfs has an additional suffix (.rootfs
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7fa4ff20bd..41a987798b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -589,14 +589,14 @@ python create_symlinks() {
         return
     for type in subimages:
         dst = os.path.join(deploy_dir, link_name + "." + type)
-        src = img_name + imgsuffix + type
-        if os.path.exists(os.path.join(deploy_dir, src)):
-            bb.note("Creating symlink: %s -> %s" % (dst, src))
+        src = os.path.join(deploy_dir, img_name + imgsuffix + type)
+        if os.path.exists(src):
+            bb.note("Creating hardlink: %s -> %s" % (dst, src))
             if os.path.islink(dst):
                 os.remove(dst)
-            os.symlink(src, dst)
+            os.link(src, dst)
         else:
-            bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
+            bb.note("Skipping hardlink, source does not exist: %s -> %s" % (dst, src))
 }
 
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index a65cdddb3e..529e0c565e 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -6,8 +6,8 @@
 
 inherit image-artifact-names
 
-KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
+KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}"
+KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"
 
 KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 867b776aa7..a45a0ce3c8 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -74,19 +74,32 @@ do_deploy_append() {
 		install -d ${DEPLOYDIR}
 		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
 		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${D}/${KERNEL_IMAGEDEST}/$type \
 					${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
 					> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
-				ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
-					${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
 						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
 						>  ${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
-					ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+				fi
+			fi
+		done
+	done
+}
+do_deploy_links_append() {
+	for dtbf in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "$dtbf"`
+		dtb_ext=${dtb##*.}
+		dtb_base_name=`basename $dtb .$dtb_ext`
+		ln -vf ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+				ln -vf ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+					${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
+				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+					ln -vf ${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
 						${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
 				fi
 			fi
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bf3674238f..bd7f7131a4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -681,17 +681,13 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=${imageType}-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
-		symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
-		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${imageType}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin
+		ln -sf ${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}${root_prefix}/lib
 		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
-		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
@@ -699,10 +695,7 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-${INITRAMFS_NAME}.bin
 		done
 	fi
 }
@@ -712,7 +705,35 @@ do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
 
-EXPORT_FUNCTIONS do_deploy
+kernel_do_deploy_links() {
+	deployDir="${DEPLOY_DIR_IMAGE}"
+	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
+		deployDir="${DEPLOY_DIR_IMAGE}/${KERNEL_DEPLOYSUBDIR}"
+		mkdir "$deployDir"
+	fi
+
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		ln -vf $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-${KERNEL_IMAGE_LINK_NAME}.bin
+	done
+
+	if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
+		ln -vf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
+	fi
+
+	if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		for imageType in ${KERNEL_IMAGETYPES} ; do
+			if [ "$imageType" = "fitImage" ] ; then
+				continue
+			fi
+			ln -vf $deployDir/${imageType}-${INITRAMFS_NAME}.bin $deployDir/${imageType}-${INITRAMFS_LINK_NAME}.bin
+		done
+	fi
+}
+do_deploy_links[prefuncs] += "package_get_auto_pr"
+
+addtask deploy_links after do_deploy before do_build
+
+EXPORT_FUNCTIONS do_deploy do_deploy_links
 
 # Add using Device Tree support
 inherit kernel-devicetree
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 694798ad2b..fbcd1f8098 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -122,5 +122,5 @@ python do_write_qemuboot_conf() {
     if qemuboot_link != qemuboot:
         if os.path.lexists(qemuboot_link):
            os.remove(qemuboot_link)
-        os.symlink(os.path.basename(qemuboot), qemuboot_link)
+        os.link(qemuboot, qemuboot_link)
 }
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 91c824a535..90cb2a4d6c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -266,7 +266,7 @@ python write_image_manifest () {
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
         if os.path.lexists(manifest_link):
             os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
+        os.link(manifest_name, manifest_link)
 }
 
 # Can be used to create /etc/timestamp during image construction to give a reasonably
@@ -334,7 +334,7 @@ python write_image_test_data() {
         testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
         if os.path.lexists(testdata_link):
             os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata_name), testdata_link)
+        os.link(testdata_name, testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.17.1


