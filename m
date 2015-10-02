Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4B0770A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 15:25:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t92FPO5P009156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Oct 2015 08:25:24 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 2 Oct 2015 08:25:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Oct 2015 10:25:21 -0500
Message-ID: <1443799521-198903-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1443799521-198903-1-git-send-email-mark.hatle@windriver.com>
References: <1443799521-198903-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: david.reyna@windriver.com
Subject: [PATCH v3] lib/oe/image.py: Add image generation for companion debug filesystem
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
X-List-Received-Date: Fri, 02 Oct 2015 15:25:28 -0000
Content-Type: text/plain

The companion debug filesystem, enabled with IMAGE_GEN_DEBUGFS, was
creating the companion filesystem but was missing the code to actually
package it into a usable filesystem.

The code (and associated documentation) will allow the debugfs to generate a
companion tarball or other image.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/documentation.conf         |  2 ++
 meta/conf/local.conf.sample.extended |  9 +++++++
 meta/lib/oe/image.py                 | 46 +++++++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 075ab6a..845559a 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -212,6 +212,8 @@ IMAGE_BOOT_FILES[doc] = "Whitespace separated list of files from ${DEPLOY_DIR_IM
 IMAGE_CLASSES[doc] = "A list of classes that all images should inherit."
 IMAGE_FEATURES[doc] = "The primary list of features to include in an image. Configure this variable in an image recipe."
 IMAGE_FSTYPES[doc] = "Formats of root filesystem images that you want to have created."
+IMAGE_FSTYPES_DEBUGFS[doc] = "Formats of the debug root filesystem images that you want to have created."
+IMAGE_GEN_DEBUGFS[doc] = "When set to '1', generate a companion debug object/source filesystem image."
 IMAGE_INSTALL[doc] = "Specifies the packages to install into an image. Image recipes set IMAGE_INSTALL to specify the packages to install into an image through image.bbclass."
 IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image during the root filesystem construction process."
 IMAGE_NAME[doc] = "The name of the output image files minus the extension."
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index ccdd326..bc765a1 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -165,6 +165,15 @@
 # currently an example class is image_types_uboot
 # IMAGE_CLASSES = " image_types_uboot"
 
+# The following options will build a companion 'debug filesystem' in addition
+# to the normal deployable filesystem.  This companion system allows a
+# debugger to know the symbols and related sources.  It can be used to
+# debug a remote 'production' system without having to add the debug symbols
+# and sources to remote system.  If IMAGE_FSTYPES_DEBUGFS is not defined, it
+# defaults to IMAGE_FSTYPES.
+#IMAGE_GEN_DEBUGFS = "1"
+#IMAGE_FSTYPES_DEBUGFS = "tar.gz"
+
 # Incremental rpm image generation, the rootfs would be totally removed
 # and re-created in the second generation by default, but with
 # INC_RPM_IMAGE_GEN = "1", the rpm based rootfs would be kept, and will
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index f9e9bfd..b0d81a6 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -5,7 +5,7 @@ import multiprocessing
 
 
 def generate_image(arg):
-    (type, subimages, create_img_cmd) = arg
+    (type, subimages, create_img_cmd, sprefix) = arg
 
     bb.note("Running image creation script for %s: %s ..." %
             (type, create_img_cmd))
@@ -264,9 +264,9 @@ class Image(ImageDepGraph):
 
         return (alltypes, filtered_groups, cimages)
 
-    def _write_script(self, type, cmds):
+    def _write_script(self, type, cmds, sprefix=""):
         tempdir = self.d.getVar('T', True)
-        script_name = os.path.join(tempdir, "create_image." + type)
+        script_name = os.path.join(tempdir, sprefix + "create_image." + type)
         rootfs_size = self._get_rootfs_size()
 
         self.d.setVar('img_creation_func', '\n'.join(cmds))
@@ -284,7 +284,7 @@ class Image(ImageDepGraph):
 
         return script_name
 
-    def _get_imagecmds(self):
+    def _get_imagecmds(self, sprefix=""):
         old_overrides = self.d.getVar('OVERRIDES', 0)
 
         alltypes, fstype_groups, cimages = self._get_image_types()
@@ -320,9 +320,9 @@ class Image(ImageDepGraph):
                 else:
                     subimages.append(type)
 
-                script_name = self._write_script(type, cmds)
+                script_name = self._write_script(type, cmds, sprefix)
 
-                image_cmds.append((type, subimages, script_name))
+                image_cmds.append((type, subimages, script_name, sprefix))
 
             image_cmd_groups.append(image_cmds)
 
@@ -355,6 +355,27 @@ class Image(ImageDepGraph):
 
         image_cmd_groups = self._get_imagecmds()
 
+        # Process the debug filesystem...
+        debugfs_d = bb.data.createCopy(self.d)
+        if self.d.getVar('IMAGE_GEN_DEBUGFS', True) == "1":
+            bb.note("Processing debugfs image(s) ...")
+            orig_d = self.d
+            self.d = debugfs_d
+
+            self.d.setVar('IMAGE_ROOTFS', orig_d.getVar('IMAGE_ROOTFS', True) + '-dbg')
+            self.d.setVar('IMAGE_NAME', orig_d.getVar('IMAGE_NAME', True) + '-dbg')
+            self.d.setVar('IMAGE_LINK_NAME', orig_d.getVar('IMAGE_LINK_NAME', True) + '-dbg')
+
+            debugfs_image_fstypes = orig_d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
+            if debugfs_image_fstypes:
+                self.d.setVar('IMAGE_FSTYPES', orig_d.getVar('IMAGE_FSTYPES_DEBUGFS', True))
+
+            self._remove_old_symlinks()
+
+            image_cmd_groups += self._get_imagecmds("debugfs.")
+
+            self.d = orig_d
+
         self._write_wic_env()
 
         for image_cmds in image_cmd_groups:
@@ -369,9 +390,16 @@ class Image(ImageDepGraph):
                 if result is not None:
                     bb.fatal(result)
 
-            for image_type, subimages, script in image_cmds:
-                bb.note("Creating symlinks for %s image ..." % image_type)
-                self._create_symlinks(subimages)
+            for image_type, subimages, script, sprefix in image_cmds:
+                if sprefix == 'debugfs.':
+                    bb.note("Creating symlinks for %s debugfs image ..." % image_type)
+                    orig_d = self.d
+                    self.d = debugfs_d
+                    self._create_symlinks(subimages)
+                    self.d = orig_d
+                else:
+                    bb.note("Creating symlinks for %s image ..." % image_type)
+                    self._create_symlinks(subimages)
 
         execute_pre_post_process(self.d, post_process_cmds)
 
-- 
1.9.3


