Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE8172154
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 02:42:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ2gE2I004266
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Nov 2014 18:42:15 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 18:42:14 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 20:42:13 -0600
Message-ID: <1416364933-214069-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Cc: clarson@kergoth.com
Subject: [PATCH] image.bbclass: Add a method for creating a companion debug filesystem
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
X-List-Received-Date: Wed, 19 Nov 2014 02:42:15 -0000
Content-Type: text/plain

The companion debug filesystem contains only the package database and the
complementary *-dbg packages for the main filesystem component.  This is
useful in a production environment to produce a companion filesystem capable
of remote system debugging, without requiring corresponding debug symbols or
source code on the device.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

If dbg pkgs have already been installed to the rootfs image,
the installation to companion debug filesystem will fail,
because both of image creation make use of the same pm
database.

In this situation, try to copy installed dbg files from rootfs
image to companion debug filesystem.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass |  5 +++-
 meta/lib/oe/image.py       | 63 +++++++++++++++++++++++++++++++---------------
 meta/lib/oe/rootfs.py      | 56 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 21 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 940bdb6..6ca76f2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -24,6 +24,9 @@ IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
 IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
 
+# Generate companion debugfs?
+IMAGE_GEN_DEBUGFS ?= "0"
+
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
 
@@ -95,7 +98,7 @@ def rootfs_variables(d):
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
                  'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
-                 'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
+                 'STAGING_KERNEL_DIR','COMPRESSIONTYPES','IMAGE_GEN_DEBUGFS']
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 354a676..22e5cf3 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -5,7 +5,7 @@ import multiprocessing
 
 
 def generate_image(arg):
-    (type, subimages, create_img_cmd) = arg
+    (type, subimages, create_img_cmd, image_name, image_link_name) = arg
 
     bb.note("Running image creation script for %s: %s ..." %
             (type, create_img_cmd))
@@ -168,28 +168,29 @@ class Image(ImageDepGraph):
 
         return base_size
 
-    def _create_symlinks(self, subimages):
+    def _create_symlinks(self, subimages, image_name, image_link_name):
         """create symlinks to the newly created image"""
         deploy_dir = self.d.getVar('DEPLOY_DIR_IMAGE', True)
-        img_name = self.d.getVar('IMAGE_NAME', True)
-        link_name = self.d.getVar('IMAGE_LINK_NAME', True)
         manifest_name = self.d.getVar('IMAGE_MANIFEST', True)
 
         os.chdir(deploy_dir)
 
-        if link_name is not None:
+        if image_link_name is not None:
             for type in subimages:
-                if os.path.exists(img_name + ".rootfs." + type):
-                    dst = link_name + "." + type
-                    src = img_name + ".rootfs." + type
+                if os.path.exists(image_name + ".rootfs." + type):
+                    dst = image_link_name + "." + type
+                    src = image_name + ".rootfs." + type
                     bb.note("Creating symlink: %s -> %s" % (dst, src))
                     os.symlink(src, dst)
 
-            if manifest_name is not None and \
+            # If ${IMAGE_NAME} != image_name, we processing a debugfs.
+            # A debugfs does not have a manifest file.
+            if self.d.getVar('IMAGE_NAME', True) == image_name and \
+                    manifest_name is not None and \
                     os.path.exists(manifest_name) and \
-                    not os.path.exists(link_name + ".manifest"):
+                    not os.path.exists(image_link_name + ".manifest"):
                 os.symlink(os.path.basename(manifest_name),
-                           link_name + ".manifest")
+                           image_link_name + ".manifest")
 
     def _remove_old_symlinks(self):
         """remove the symlinks to old binaries"""
@@ -236,10 +237,12 @@ class Image(ImageDepGraph):
 
         return (filtered_groups, cimages)
 
-    def _get_image_types(self):
+    def _get_image_types(self, data=None):
         """returns a (types, cimages) tuple"""
+        if not data:
+            data = self.d
 
-        alltypes, fstype_groups = self.group_fstypes(self.d.getVar('IMAGE_FSTYPES', True).split())
+        alltypes, fstype_groups = self.group_fstypes(data.getVar('IMAGE_FSTYPES', True).split())
 
         filtered_groups, cimages = self._filter_out_commpressed(fstype_groups)
 
@@ -263,8 +266,11 @@ class Image(ImageDepGraph):
 
         return script_name
 
-    def _get_imagecmds(self):
-        old_overrides = self.d.getVar('OVERRIDES', 0)
+    def _get_imagecmds(self, data=None, suffix=""):
+        if not data:
+            data = self.d
+
+        old_overrides = data.getVar('OVERRIDES', 0)
 
         alltypes, fstype_groups, cimages = self._get_image_types()
 
@@ -277,11 +283,14 @@ class Image(ImageDepGraph):
                 cmds = []
                 subimages = []
 
-                localdata = bb.data.createCopy(self.d)
+                localdata = bb.data.createCopy(data)
                 localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
                 bb.data.update_data(localdata)
                 localdata.setVar('type', type)
 
+                image_name = localdata.getVar("IMAGE_NAME", True)
+                image_link_name = localdata.getVar("IMAGE_LINK_NAME", True)
+
                 cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
                 cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
 
@@ -295,9 +304,9 @@ class Image(ImageDepGraph):
                 else:
                     subimages.append(type)
 
-                script_name = self._write_script(type, cmds)
+                script_name = self._write_script(type + suffix, cmds)
 
-                image_cmds.append((type, subimages, script_name))
+                image_cmds.append((type, subimages, script_name, image_name, image_link_name))
 
             image_cmd_groups.append(image_cmds)
 
@@ -314,6 +323,20 @@ class Image(ImageDepGraph):
 
         image_cmd_groups = self._get_imagecmds()
 
+        if self.d.getVar('IMAGE_GEN_DEBUGFS', True) == "1":
+            image_rootfs = self.d.getVar('IMAGE_ROOTFS', True) + '-dbg'
+            image_fstypes = self.d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
+            image_name = self.d.getVar('IMAGE_NAME', True) + '-dbg'
+            image_link_name = self.d.getVar('IMAGE_LINK_NAME', True) + '-dbg'
+
+            data_debugfs = bb.data.createCopy(self.d)
+            data_debugfs.setVar('IMAGE_ROOTFS', image_rootfs)
+            if image_fstypes:
+                data_debugfs.setVar('IMAGE_FSTYPES', image_fstypes)
+            data_debugfs.setVar('IMAGE_NAME', image_name)
+            data_debugfs.setVar('IMAGE_LINK_NAME', image_link_name)
+            image_cmd_groups += self._get_imagecmds(data_debugfs, "-dbg")
+
         for image_cmds in image_cmd_groups:
             # create the images in parallel
             nproc = multiprocessing.cpu_count()
@@ -326,9 +349,9 @@ class Image(ImageDepGraph):
                 if result is not None:
                     bb.fatal(result)
 
-            for image_type, subimages, script in image_cmds:
+            for image_type, subimages, script, image_name, image_link_name in image_cmds:
                 bb.note("Creating symlinks for %s image ..." % image_type)
-                self._create_symlinks(subimages)
+                self._create_symlinks(subimages, image_name, image_link_name)
 
         execute_pre_post_process(self.d, post_process_cmds)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 325c049..7e68a00 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -58,6 +58,57 @@ class Rootfs(object):
     def _cleanup(self):
         pass
 
+    def _setup_dbg_rootfs(self, dirs):
+        gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS', True) or '0'
+        if gen_debugfs != '1':
+           return
+
+        bb.note("  Renaming the original rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-orig')
+        except:
+            pass
+        os.rename(self.image_rootfs, self.image_rootfs + '-orig')
+
+        bb.note("  Creating debug rootfs...")
+        bb.utils.mkdirhier(self.image_rootfs)
+
+        bb.note("  Copying back package database...")
+        for dir in dirs:
+            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
+            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir)
+
+        cpath = oe.cachedpath.CachedPath()
+        # Copy files located in /usr/lib/debug or /usr/src/debug
+        for dir in ["/usr/lib/debug", "/usr/src/debug"]:
+            src = self.image_rootfs + '-orig' + dir
+            if cpath.exists(src):
+                dst = self.image_rootfs + dir
+                bb.utils.mkdirhier(os.path.dirname(dst))
+                shutil.copytree(src, dst)
+
+        # Copy files with suffix '.debug' or located in '.debug' dir.
+        for root, dirs, files in cpath.walk(self.image_rootfs + '-orig'):
+            relative_dir = root[len(self.image_rootfs + '-orig'):]
+            for f in files:
+                if f.endswith('.debug') or '/.debug' in relative_dir:
+                    bb.utils.mkdirhier(self.image_rootfs + relative_dir)
+                    shutil.copy(os.path.join(root, f),
+                                self.image_rootfs + relative_dir)
+
+        bb.note("  Install complementary '*-dbg' packages...")
+        self.pm.install_complementary('*-dbg')
+
+        bb.note("  Rename debug rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-dbg')
+        except:
+            pass
+        os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
+
+        bb.note("  Restoreing original rootfs...")
+        os.rename(self.image_rootfs + '-orig', self.image_rootfs)
+
     def _exec_shell_cmd(self, cmd):
         fakerootcmd = self.d.getVar('FAKEROOT', True)
         if fakerootcmd is not None:
@@ -324,6 +375,7 @@ class RpmRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
         self._log_check()
@@ -445,6 +497,8 @@ class DpkgRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        self._setup_dbg_rootfs(['/var/lib/dpkg'])
+
         self.pm.fix_broken_dependencies()
 
         self.pm.mark_packages("installed")
@@ -713,6 +767,8 @@ class OpkgRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        self._setup_dbg_rootfs(['/var/lib/opkg'])
+
         execute_pre_post_process(self.d, opkg_post_process_cmds)
         execute_pre_post_process(self.d, rootfs_post_install_cmds)
 
-- 
1.9.3


