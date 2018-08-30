Return-Path: <Lu.Jiang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1F1793D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:03:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UA3QGk022618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:03:26 -0700 (PDT)
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 03:03:25 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 18:01:19 +0800
Message-ID: <1535623282-13919-5-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
References: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] wic:allow wic run outof bb enviroment.
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
X-List-Received-Date: Thu, 30 Aug 2018 10:03:25 -0000
Content-Type: text/plain

1.Export copyhardlinktree() into misc.py
2.Skip enviroment checkding when there is no bitbake.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 meta/recipes-support/wic/files/wic.py              | 34 ++++++++++++------
 meta/recipes-support/wic/files/wic/engine.py       |  3 ++
 meta/recipes-support/wic/files/wic/misc.py         | 42 ++++++++++++++++++++++
 .../wic/files/wic/plugins/imager/direct.py         |  2 +-
 .../wic/files/wic/plugins/source/rootfs.py         |  2 +-
 5 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/wic/files/wic.py b/meta/recipes-support/wic/files/wic.py
index 7392bc4..3fff3ba 100755
--- a/meta/recipes-support/wic/files/wic.py
+++ b/meta/recipes-support/wic/files/wic.py
@@ -43,8 +43,11 @@ from distutils import spawn
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path.insert(0, lib_path)
-import scriptpath
-scriptpath.add_oe_lib_path()
+try:
+	import scriptpath
+	scriptpath.add_oe_lib_path()
+except:
+	pass
 
 # Check whether wic is running within eSDK environment
 sdkroot = scripts_path
@@ -61,12 +64,14 @@ if os.environ.get('SDKTARGETSYSROOT'):
         sdkroot = os.path.dirname(sdkroot)
 
 bitbake_exe = spawn.find_executable('bitbake')
+"""
 if bitbake_exe:
     bitbake_path = scriptpath.add_bitbake_lib_path()
     from bb import cookerdata
     from bb.main import bitbake_main, BitBakeConfigParameters
 else:
     bitbake_main = None
+"""
 
 from wic import WicError
 from wic.misc import get_bitbake_var, BB_VARS
@@ -124,10 +129,10 @@ def wic_create_subcommand(options, usage_str):
     Command-line handling for image creation.  The real work is done
     by image.engine.wic_create()
     """
-    if options.build_rootfs and not bitbake_main:
+    if options.build_rootfs and not bitbake_exe:
         raise WicError("Can't build rootfs as bitbake is not in the $PATH")
 
-    if not options.image_name:
+    if bitbake_exe and not options.image_name:
         missed = []
         for val, opt in [(options.rootfs_dir, 'rootfs-dir'),
                          (options.bootimg_dir, 'bootimg-dir'),
@@ -147,7 +152,7 @@ def wic_create_subcommand(options, usage_str):
     if options.vars_dir:
         BB_VARS.vars_dir = options.vars_dir
 
-    if options.build_check and not engine.verify_build_env():
+    if bitbake_exe and options.build_check and not engine.verify_build_env():
         raise WicError("Couldn't verify build environment, exiting")
 
     if options.debug:
@@ -158,12 +163,12 @@ def wic_create_subcommand(options, usage_str):
             argv = ["bitbake", options.image_name]
             if options.debug:
                 argv.append("--debug")
-
+            """
             logger.info("Building rootfs...\n")
             if bitbake_main(BitBakeConfigParameters(argv),
                             cookerdata.CookerConfiguration()):
                 raise WicError("bitbake exited with error")
-
+            """
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
         bootimg_dir = get_bitbake_var("STAGING_DATADIR", options.image_name)
@@ -177,14 +182,16 @@ def wic_create_subcommand(options, usage_str):
                            "(Use -e/--image-name to specify it)")
         native_sysroot = options.native_sysroot
 
-    if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
+    if bitbake_exe and not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
+        """
         logger.info("Building wic-tools...\n")
         if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
                         cookerdata.CookerConfiguration()):
             raise WicError("bitbake wic-tools failed")
+        """
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
-    if not native_sysroot:
+    if bitbake_exe and not native_sysroot:
         raise WicError("Unable to find the location of the native tools sysroot")
 
     wks_file = options.wks_file
@@ -196,7 +203,7 @@ def wic_create_subcommand(options, usage_str):
                            "to list available images, or specify a fully-qualified OE "
                            "kickstart (.wks) filename)" % options.wks_file)
 
-    if not options.image_name:
+    if bitbake_exe and not options.image_name:
         rootfs_dir = ''
         if 'ROOTFS_DIR' in options.rootfs_dir:
             rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
@@ -211,7 +218,7 @@ def wic_create_subcommand(options, usage_str):
             raise WicError("--kernel-dir (-k) not found, exiting")
         if not os.path.isdir(native_sysroot):
             raise WicError("--native-sysroot (-n) not found, exiting")
-    else:
+    elif bitbake_exe:
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
             (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
@@ -227,6 +234,11 @@ def wic_create_subcommand(options, usage_str):
             logger.info("   selected in local.conf actually exist and that they")
             logger.info("   are the correct artifacts for the image (.wks file)).\n")
             raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
+    else:
+         kernel_dir = options.kernel_dir
+         rootfs_dir = "/"
+         native_sysroot = "/"
+         bootimg_dir = "/"
 
     krootfs_dir = options.rootfs_dir
     if krootfs_dir is None:
diff --git a/meta/recipes-support/wic/files/wic/engine.py b/meta/recipes-support/wic/files/wic/engine.py
index 850cec3..83babd0 100644
--- a/meta/recipes-support/wic/files/wic/engine.py
+++ b/meta/recipes-support/wic/files/wic/engine.py
@@ -186,7 +186,10 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     try:
         oe_builddir = os.environ["BUILDDIR"]
     except KeyError:
+        '''
         raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
+        '''
+        oe_builddir = ""
 
     if not os.path.exists(options.outdir):
         os.makedirs(options.outdir)
diff --git a/meta/recipes-support/wic/files/wic/misc.py b/meta/recipes-support/wic/files/wic/misc.py
index ee888b4..470eaee 100644
--- a/meta/recipes-support/wic/files/wic/misc.py
+++ b/meta/recipes-support/wic/files/wic/misc.py
@@ -256,8 +256,50 @@ class BitbakeVars(defaultdict):
 BB_VARS = BitbakeVars()
 
 def get_bitbake_var(var, image=None, cache=True):
+    bitbake_exe = spawn.find_executable('bitbake')
+    if not bitbake_exe:
+        return ""
     """
     Provide old get_bitbake_var API by wrapping
     get_var method of BB_VARS singleton.
     """
     return BB_VARS.get_var(var, image, cache)
+
+import glob
+def copytree(src, dst):
+    # We could use something like shutil.copytree here but it turns out to
+    # to be slow. It takes twice as long copying to an empty directory.
+    # If dst already has contents performance can be 15 time slower
+    # This way we also preserve hardlinks between files in the tree.
+    if not os.path.isdir(dst):
+        os.makedirs(dst)
+    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
+    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+
+
+def copyhardlinktree(src, dst):
+    """ Make the hard link when possible, otherwise copy. """
+    if not os.path.isdir(src):
+        return
+    os.makedirs(dst)
+    if os.path.isdir(src) and not len(os.listdir(src)):
+        return
+
+    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
+        # Need to copy directories only with tar first since cp will error if two
+        # writers try and create a directory at the same time
+        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+        source = ''
+        if os.path.isdir(src):
+            if len(glob.glob('%s/.??*' % src)) > 0:
+                source = './.??* '
+            source += './*'
+            s_dir = src
+        else:
+            source = src
+            s_dir = os.getcwd()
+        cmd = 'cp -afl --preserve=xattr %s %s' % (source, os.path.realpath(dst))
+        subprocess.check_output(cmd, shell=True, cwd=s_dir, stderr=subprocess.STDOUT)
+    else:
+        copytree(src, dst)
diff --git a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
index 81583e9..f648db4 100644
--- a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
+++ b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
@@ -33,7 +33,7 @@ import uuid
 
 from time import strftime
 
-from oe.path import copyhardlinktree
+from wic.misc import copyhardlinktree
 
 from wic import WicError
 from wic.filemap import sparse_copy
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py b/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
index aec720f..a2aca81 100644
--- a/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
+++ b/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
@@ -30,7 +30,7 @@ import os
 import shutil
 import sys
 
-from oe.path import copyhardlinktree
+from wic.misc import copyhardlinktree
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
-- 
2.7.4


