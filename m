Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CDCEC6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:37:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jan 2016 14:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,314,1449561600"; d="scan'208";a="863308247"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga001.jf.intel.com with ESMTP; 18 Jan 2016 14:37:06 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:33:06 +0000
Message-Id: <60a39b7525d46d411f089251c57f8cb9b472bbf3.1453127396.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453127396.git.mariano.lopez@linux.intel.com>
References: <cover.1453127396.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1453127396.git.mariano.lopez@linux.intel.com>
References: <cover.1453127396.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 3/4] lib/oe/rootfs: Use list_pkgs() instead of list()
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
X-List-Received-Date: Mon, 18 Jan 2016 22:37:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch changes the use list_pkgs() instead of list()
from class RpmPkgsList. The change is in two functions,
image_list_installed_packages from rootfs.py and
sdk_list_installed_packages from sdk.py.

With this change the functions calling the functions
listed above, must format the output as they required.
The formatting can be done using format_pkg_list() from
oe.utils.

The classes calling the afected functions are changed too
with this patch, to keep the same functionality using the
new data structure.

[YOCTO #7427]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/buildhistory.bbclass        | 11 +++++++----
 meta/classes/license.bbclass             |  8 ++++++--
 meta/classes/populate_sdk_base.bbclass   |  8 ++++++--
 meta/classes/rootfs-postcommands.bbclass |  4 +++-
 meta/lib/oe/package_manager.py           | 18 ++++++++++--------
 meta/lib/oe/rootfs.py                    | 10 +++++-----
 meta/lib/oe/sdk.py                       |  8 ++++----
 7 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2c144ab..9f17442 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -337,18 +337,21 @@ def write_pkghistory(pkginfo, d):
 def buildhistory_list_installed(d, rootfs_type="image"):
     from oe.rootfs import image_list_installed_packages
     from oe.sdk import sdk_list_installed_packages
+    from oe.utils import format_pkg_list
 
     process_list = [('file', 'bh_installed_pkgs.txt'),\
                     ('deps', 'bh_installed_pkgs_deps.txt')]
 
+    if rootfs_type == "image":
+        pkgs = image_list_installed_packages(d)
+    else:
+        pkgs = sdk_list_installed_packages(d, rootfs_type == "sdk_target")
+
     for output_type, output_file in process_list:
         output_file_full = os.path.join(d.getVar('WORKDIR', True), output_file)
 
         with open(output_file_full, 'w') as output:
-            if rootfs_type == "image":
-                output.write(image_list_installed_packages(d, output_type))
-            else:
-                output.write(sdk_list_installed_packages(d, rootfs_type == "sdk_target", output_type))
+            output.write(format_pkg_list(pkgs, output_type))
 
 python buildhistory_list_installed_image() {
     buildhistory_list_installed(d)
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 8a42874..301216d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -21,8 +21,12 @@ python write_package_manifest() {
     license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
     bb.utils.mkdirhier(license_image_dir)
     from oe.rootfs import image_list_installed_packages
+    from oe.utils import format_pkg_list
+
+    pkgs = image_list_installed_packages(d)
+    output = format_pkg_list(pkgs)
     open(os.path.join(license_image_dir, 'package.manifest'),
-        'w+').write(image_list_installed_packages(d))
+        'w+').write(output)
 }
 
 python write_deploy_manifest() {
@@ -38,7 +42,7 @@ python license_create_manifest() {
         return 0
 
     pkg_dic = {}
-    for pkg in image_list_installed_packages(d).splitlines():
+    for pkg in sorted(image_list_installed_packages(d)):
         pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
                                 'runtime-reverse', pkg)
         pkg_name = os.path.basename(os.readlink(pkg_info))
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 7ca1df6..99b64f7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -62,20 +62,24 @@ SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
+    from oe.utils import format_pkg_list
     sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST", True))
+    pkgs = sdk_list_installed_packages(d, True)
     if not os.path.exists(sdkmanifestdir):
         bb.utils.mkdirhier(sdkmanifestdir)
     with open(d.getVar('SDK_TARGET_MANIFEST', True), 'w') as output:
-        output.write(sdk_list_installed_packages(d, True, 'ver'))
+        output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 python write_host_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
+    from oe.utils import format_pkg_list
     sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST", True))
+    pkgs = sdk_list_installed_packages(d, False)
     if not os.path.exists(sdkmanifestdir):
         bb.utils.mkdirhier(sdkmanifestdir)
     with open(d.getVar('SDK_HOST_MANIFEST', True), 'w') as output:
-        output.write(sdk_list_installed_packages(d, False, 'ver'))
+        output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 96d3051..b78ce6d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -207,13 +207,15 @@ insert_feed_uris () {
 
 python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
+    from oe.utils import format_pkg_list
 
     deploy_dir = d.getVar('DEPLOY_DIR_IMAGE', True)
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
 
+    pkgs = image_list_installed_packages(d)
     with open(manifest_name, 'w+') as image_manifest:
-        image_manifest.write(image_list_installed_packages(d, 'ver'))
+        image_manifest.write(format_pkg_list(pkgs, "ver"))
         image_manifest.write("\n")
 
     if manifest_name is not None and os.path.exists(manifest_name):
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 79cadda..6d02630 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -708,7 +708,7 @@ class PackageManager(object):
         pass
 
     @abstractmethod
-    def list_installed(self, format=None):
+    def list_installed(self):
         pass
 
     @abstractmethod
@@ -728,7 +728,9 @@ class PackageManager(object):
         installed_pkgs_file = os.path.join(self.d.getVar('WORKDIR', True),
                                            "installed_pkgs.txt")
         with open(installed_pkgs_file, "w+") as installed_pkgs:
-            installed_pkgs.write(self.list_installed("arch"))
+            pkgs = self.list_installed()
+            output = oe.utils.format_pkg_list(pkgs, "arch")
+            installed_pkgs.write(output)
 
         if globs is None:
             globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY', True)
@@ -1432,8 +1434,8 @@ class RpmPM(PackageManager):
                             self.image_rpmlib,
                             symlinks=True)
 
-    def list_installed(self, format=None):
-        return self.pkgs_list.list(format)
+    def list_installed(self):
+        return self.pkgs_list.list_pkgs()
 
     '''
     If incremental install, we need to determine what we've got,
@@ -1797,8 +1799,8 @@ class OpkgPM(PackageManager):
         # create the directory back, it's needed by PM lock
         bb.utils.mkdirhier(self.opkg_dir)
 
-    def list_installed(self, format=None):
-        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list(format)
+    def list_installed(self):
+        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
 
     def handle_bad_recommendations(self):
         bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True) or ""
@@ -2186,8 +2188,8 @@ class DpkgPM(PackageManager):
             bb.fatal("Cannot fix broken dependencies. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
 
-    def list_installed(self, format=None):
-        return DpkgPkgsList(self.d, self.target_rootfs).list()
+    def list_installed(self):
+        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
 
 
 def generate_index_files(d):
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f677d03..0e901c2 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -252,7 +252,7 @@ class Rootfs(object):
             # Remove components that we don't need if it's a read-only rootfs
             pkgs_installed = image_list_installed_packages(self.d)
             pkgs_to_remove = list()
-            for pkg in pkgs_installed.split():
+            for pkg in pkgs_installed:
                 if pkg in ["update-rc.d",
                         "base-passwd",
                         "shadow",
@@ -976,17 +976,17 @@ def create_rootfs(d, manifest_dir=None):
     os.environ.update(env_bkp)
 
 
-def image_list_installed_packages(d, format=None, rootfs_dir=None):
+def image_list_installed_packages(d, rootfs_dir=None):
     if not rootfs_dir:
         rootfs_dir = d.getVar('IMAGE_ROOTFS', True)
 
     img_type = d.getVar('IMAGE_PKGTYPE', True)
     if img_type == "rpm":
-        return RpmPkgsList(d, rootfs_dir).list(format)
+        return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
-        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET", True)).list(format)
+        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET", True)).list_pkgs()
     elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list(format)
+        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
 
 if __name__ == "__main__":
     """
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 6affa40..b308aea 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -345,7 +345,7 @@ class DpkgSdk(Sdk):
 
 
 
-def sdk_list_installed_packages(d, target, format=None, rootfs_dir=None):
+def sdk_list_installed_packages(d, target, rootfs_dir=None):
     if rootfs_dir is None:
         sdk_output = d.getVar('SDK_OUTPUT', True)
         target_path = d.getVar('SDKTARGETSYSROOT', True).strip('/')
@@ -356,12 +356,12 @@ def sdk_list_installed_packages(d, target, format=None, rootfs_dir=None):
     if img_type == "rpm":
         arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
         os_var = ["SDK_OS", None][target is True]
-        return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list(format)
+        return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list_pkgs()
     elif img_type == "ipk":
         conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
-        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var, True)).list(format)
+        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var, True)).list_pkgs()
     elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list(format)
+        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
 
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
-- 
1.8.4.5


