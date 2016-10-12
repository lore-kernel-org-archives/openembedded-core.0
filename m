Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C545D60762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 20:46:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2016 13:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,485,1473145200"; d="scan'208";a="1043871427"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.109])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2016 13:46:49 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 21:46:41 +0100
Message-Id: <1476305202-10926-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] Remove RM_OLD_IMAGE, it's no longer useful
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
X-List-Received-Date: Wed, 12 Oct 2016 20:46:49 -0000

Since the move to put image deployment under sstate control in
d54339d4b1a7e884de636f6325ca60409ebd95ff old images are automatically
removed before a new image is deployed (the default behaviour of the
sstate logic).

RM_OLD_IMAGE is therefore no longer required to provide this
behaviour, remove the variable and its users.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb |  1 -
 meta/classes/cve-check.bbclass                         |  2 --
 meta/classes/image-vm.bbclass                          |  8 --------
 meta/classes/image.bbclass                             |  5 +----
 meta/classes/qemuboot.bbclass                          |  3 ---
 meta/classes/rootfs-postcommands.bbclass               |  3 ---
 meta/conf/documentation.conf                           |  1 -
 meta/lib/oeqa/selftest/buildoptions.py                 | 16 ----------------
 8 files changed, 1 insertion(+), 38 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 58bf5a5..9e93b8e 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -5,7 +5,6 @@ SRC_URI = "file://${FILE_DIRNAME}/${BPN}.wks"
 IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 
 IMAGE_FSTYPES = "wic"
-RM_OLD_IMAGE = "1"
 
 DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native"
 
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 8251ca7..1425a40 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -92,8 +92,6 @@ python cve_check_write_rootfs_manifest () {
             manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
             # If we already have another manifest, update symlinks
             if os.path.exists(os.path.realpath(manifest_link)):
-                if d.getVar('RM_OLD_IMAGE', True) == "1":
-                    os.remove(os.path.realpath(manifest_link))
                 os.remove(manifest_link)
             os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 32c6550..2f35d6b 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -106,10 +106,6 @@ build_boot_dd() {
 
 	cd ${IMGDEPLOYDIR}
 
-	if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ]; then
-		rm -f $(readlink -f ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect)
-	fi
-
 	ln -sf ${IMAGE_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect
 } 
 
@@ -147,10 +143,6 @@ run_qemu_img (){
     type="$1"
     qemu-img convert -O $type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.hdddirect ${IMGDEPLOYDIR}/${IMAGE_NAME}.$type
 
-    if [ "${RM_OLD_IMAGE}" = "1" ] && [ -L ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.$type ]; then
-        rm -f $(readlink -f ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.$type)
-    fi
-
     ln -sf ${IMAGE_NAME}.$type ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.$type
 }
 create_vmdk_image () {
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 915500a..6111f6d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -117,7 +117,7 @@ python () {
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
     variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
-                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY']
@@ -588,9 +588,6 @@ python create_symlinks() {
         if os.path.exists(os.path.join(deploy_dir, src)):
             bb.note("Creating symlink: %s -> %s" % (dst, src))
             if os.path.islink(dst):
-                if d.getVar('RM_OLD_IMAGE', True) == "1" and \
-                        os.path.exists(os.path.realpath(dst)):
-                    os.remove(os.path.realpath(dst))
                 os.remove(dst)
             os.symlink(src, dst)
         else:
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index ef9a128..b5cc93d 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -76,9 +76,6 @@ python write_qemuboot_conf() {
     with open(qemuboot, 'w') as f:
         cf.write(f)
 
-    if d.getVar('RM_OLD_IMAGE', True) == "1" and os.path.exists(qemuboot_link):
-       os.remove(os.path.realpath(qemuboot_link))
-
     if os.path.lexists(qemuboot_link):
        os.remove(qemuboot_link)
     os.symlink(os.path.basename(qemuboot), qemuboot_link)
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 07e265c..0c7ceea 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -232,9 +232,6 @@ python write_image_manifest () {
     if os.path.exists(manifest_name):
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
         if os.path.lexists(manifest_link):
-            if d.getVar('RM_OLD_IMAGE', True) == "1" and \
-                    os.path.exists(os.path.realpath(manifest_link)):
-                os.remove(os.path.realpath(manifest_link))
             os.remove(manifest_link)
         os.symlink(os.path.basename(manifest_name), manifest_link)
 }
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 51c4116..06527cb 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -349,7 +349,6 @@ QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for u
 RCONFLICTS[doc] = "The list of packages that conflict with another package. Note that the package will not be installed if the conflicting packages are not first removed."
 RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) that must be installed for the package to be built. They must be the names of other packages as listed in the PACKAGES variable, not recipe names (PN)."
 REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the distro_features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
-RM_OLD_IMAGE[doc] = "Reclaims disk space by removing previously built versions of the same image from the images directory pointed to by the DEPLOY_DIR variable."
 RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
 ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
 ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 86e4836..9487898 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -30,22 +30,6 @@ class ImageOptionsTests(oeSelfTest):
         incremental_removed = re.search("NOTE: load old install solution for incremental install\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: incremental removed:.*openssh-sshd-.*", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
-    @testcase(925)
-    def test_rm_old_image(self):
-        bitbake("core-image-minimal")
-        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
-        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
-        deploydir_files = os.listdir(deploydir)
-        track_original_files = []
-        for image_file in deploydir_files:
-            if imagename in image_file and os.path.islink(os.path.join(deploydir, image_file)):
-                track_original_files.append(os.path.realpath(os.path.join(deploydir, image_file)))
-        self.write_config("RM_OLD_IMAGE = \"1\"")
-        bitbake("-C rootfs core-image-minimal")
-        deploydir_files = os.listdir(deploydir)
-        remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
-        self.assertFalse(remaining_not_expected, msg="\nThe following image files were not removed: %s" % ', '.join(map(str, remaining_not_expected)))
-
     @testcase(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
-- 
2.7.4


