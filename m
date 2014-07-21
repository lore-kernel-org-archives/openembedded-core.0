Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BB8C67057A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 09:15:12 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Jul 2014 02:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,699,1400050800"; d="scan'208";a="459416658"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2014 02:14:55 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 12:15:16 +0300
Message-Id: <61331e6faf62f21104b612d0296e2ba0acc94e26.1405934076.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1405934076.git.roxana.ciobanu@intel.com>
References: <cover.1405934076.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1405934076.git.roxana.ciobanu@intel.com>
References: <cover.1405934076.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] image.bbclass/rootfs.py: add variables to rootfs[vardeps]
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
X-List-Received-Date: Mon, 21 Jul 2014 09:15:13 -0000

Added base variables and package backend specific variables to
rootfs[vardeps] in order for rootfs to rebuild when changes are made.

Set some variables as [func] to inform bitbake that they are shell
scripts, so that it invokes its shell dependency parsing. Without
marking them as functions, changes in the actual function body would
not trigger rootfs rebuilds.

[YOCTO #6502]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/classes/image.bbclass | 21 ++++++++++++++++++++-
 meta/lib/oe/rootfs.py      | 21 +++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 772c3ed..577aa6a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -72,10 +72,29 @@ LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
 LDCONFIGDEPEND_libc-uclibc = ""
 LDCONFIGDEPEND_libc-musl = ""
 
+python () {
+    variables = ['ROOTFS_POSTPROCESS_COMMAND', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'IMAGE_POSTPROCESS_COMMAND', 'IMAGE_PREPROCESS_COMMAND', 'POPULATE_SDK_POST_HOST_COMMAND', 'POPULATE_SDK_POST_TARGET_COMMAND', 'SDK_POSTPROCESS_COMMAND']
+    for var in variables:
+        d.appendVarFlag(var, 'func', '1')
+}
+
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
-do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
+
+def rootfs_variables(d):
+    from oe.rootfs import variable_depends
+    variables = ['IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPEDEP_','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE'
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_PREPROCESS_COMMAND','IMAGE_POSTPROCESS_COMMAND'
+                 'IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS','SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_POSTPROCESS_COMMAND','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY'
+                 'POPULATE_SDK_POST_TARGET_COMMAND','POPULATE_SDK_POST_HOST_COMMAND','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS',
+                 'MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','ROOTFS_POSTINSTALL_COMMAND','ROOTFS_PREPROCESS_COMMAND','ROOTFS_POSTPROCESS_COMMAND',
+                 'BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT',
+                 'FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS','STAGING_KERNEL_DIR','COMPRESSIONTYPES']
+    variables.extend(variable_depends(d))
+    return " ".join(variables)
+
+do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 
 do_build[depends] += "virtual/kernel:do_deploy"
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b34856c..d145d5d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -327,6 +327,10 @@ class RpmRootfs(Rootfs):
 
         self.pm.rpm_setup_smart_target_config()
 
+    @staticmethod
+    def _depends_list():
+        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS', 'RPM_POSTPROCESS_COMMANDS']
+
     def _get_delayed_postinsts(self):
         postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
         if os.path.isdir(postinst_dir):
@@ -418,6 +422,10 @@ class DpkgRootfs(Rootfs):
 
         self.pm.run_pre_post_installs()
 
+    @staticmethod
+    def _depends_list():
+        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMAND']
+
     def _get_delayed_postinsts(self):
         pkg_list = []
         with open(self.image_rootfs + "/var/lib/dpkg/status") as status:
@@ -680,6 +688,10 @@ class OpkgRootfs(Rootfs):
         if self.inc_opkg_image_gen == "1":
             self.pm.backup_packaging_data()
 
+    @staticmethod
+    def _depends_list():
+        return ['IPKGCONF_SDK', 'IPK_FEED_URIS', 'DEPLOY_DIR_IPK', 'IPKGCONF_TARGET', 'INC_IPK_IMAGE_GEN', 'OPKG_ARGS', 'OPKGLIBDIR', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'OPKGLIBDIR']
+
     def _get_delayed_postinsts(self):
         pkg_list = []
         status_file = os.path.join(self.image_rootfs,
@@ -723,6 +735,15 @@ class OpkgRootfs(Rootfs):
     def _cleanup(self):
         pass
 
+def get_class_for_type(imgtype):
+    return {"rpm": RpmRootfs,
+            "ipk": OpkgRootfs,
+            "deb": DpkgRootfs}[imgtype]
+
+def variable_depends(d, manifest_dir=None):
+    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    cls = get_class_for_type(img_type)
+    return cls._depends_list()
 
 def create_rootfs(d, manifest_dir=None):
     env_bkp = os.environ.copy()
-- 
1.9.1


