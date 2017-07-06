Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFF47772F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:09:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 01:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="1168733828"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2017 01:09:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1587E580571
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:09:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:42 +0300
Message-Id: <f7a1f4393068f63088e3f4df2809f99c2de8bff9.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/8] wic: get rid of using wic-tools
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
X-List-Received-Date: Thu, 06 Jul 2017 08:09:18 -0000

At the moment, when building images with IMAGE_FSTYPES=wic one ends up
depending on wic-tools and thus syslinux and grub-efi even when not
using those at all. Ideally, building an image with wic should only
build the tools and components really needed.

The problem is that "wic-tools" is needed also for the manual
invocations of wic, in which case everything that might be needed has to
be built in advance.

Replaced dependency on wic-tools with dependency to a much shorter set
of tools that wic uses almost for any image: 'parted', 'gptfdisk',
'dosfstools' and 'mtools'.

Used wic-tools sysroot as a native sysroot only in manual mode.
This should help to avoid building a lot of unnecessary tools for every
wic image.

[YOCTO #11552]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass                 | 2 +-
 scripts/lib/wic/misc.py                              | 9 +++------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     | 5 ++---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 ++--
 scripts/wic                                          | 8 ++++++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index cf88853..05ee68d 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -39,7 +39,7 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "wic-tools:do_populate_sysroot"
+do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 WKS_FILE_DEPENDS ??= ''
 DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else '' }"
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 3ebae0a..4e07cd6 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -139,14 +139,11 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
 
-    wtools_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
+                   (native_sysroot, native_sysroot, native_sysroot)
 
-    native_paths = \
-            "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/sbin:%s/usr/sbin:%s/usr/bin" % \
-            (wtools_sysroot, wtools_sysroot, wtools_sysroot,
-             native_sysroot, native_sysroot, native_sysroot)
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
-                           (native_paths, cmd_and_args)
+                   (native_paths, cmd_and_args)
     logger.debug("exec_native_cmd: %s", native_cmd_and_args)
 
     # If the command isn't in the native sysroot say we failed.
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index e3518d2..56da468 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -45,10 +45,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
     @classmethod
     def _get_bootimg_dir(cls, bootimg_dir, dirname):
         """
-        Check if dirname exists in default bootimg_dir or
-        in wic-tools STAGING_DIR.
+        Check if dirname exists in default bootimg_dir or in STAGING_DIR.
         """
-        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR", "wic-tools")):
+        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR")):
             if os.path.exists("%s/%s" % (result, dirname)):
                 return result
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index db77113..85f35f7 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -342,7 +342,7 @@ class IsoImagePlugin(SourcePlugin):
 
                 if not os.path.isfile("%s/EFI/BOOT/%s" \
                                 % (bootimg_dir, grub_image)):
-                    grub_path = get_bitbake_var("STAGING_LIBDIR", "wic-tools")
+                    grub_path = get_bitbake_var("STAGING_LIBDIR")
                     if not grub_path:
                         raise WicError("Couldn't find STAGING_LIBDIR, exiting.")
 
@@ -411,7 +411,7 @@ class IsoImagePlugin(SourcePlugin):
             exec_cmd(chmod_cmd)
 
         # Prepare files for legacy boot
-        syslinux_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
+        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
         if not syslinux_dir:
             raise WicError("Couldn't find STAGING_DATADIR, exiting.")
 
diff --git a/scripts/wic b/scripts/wic
index 81fc85d..881393a 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -154,8 +154,12 @@ def wic_create_subcommand(options, usage_str):
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
         bootimg_dir = get_bitbake_var("STAGING_DATADIR", options.image_name)
-        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE",
-                                         options.image_name) #, cache=False)
+
+        if options.vars_dir:
+            # use image recipe sysroot if wic is called from bitbake
+            native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", options.image_name)
+        else:
+            native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
     else:
         if options.build_rootfs:
             raise WicError("Image name is not specified, exiting. "
-- 
2.1.4


