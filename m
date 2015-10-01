Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1AF0770B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:26:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t91IQBpn009678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Oct 2015 11:26:11 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 1 Oct 2015 11:26:10 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Oct 2015 13:26:08 -0500
Message-ID: <1443723968-43906-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
References: <1443723968-43906-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: david.reyna@windriver.com
Subject: [PATCH] lib/oe/image.py: Add image generation for companion debug filesystem
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
X-List-Received-Date: Thu, 01 Oct 2015 18:26:13 -0000
Content-Type: text/plain

The companion debug filesystem, enabled with IMAGE_GEN_DEBUGFS, was
creating the companion filesystem but was missing the code to actually
package it into a usable filesystem.

The code (and associated documentation) will allow the debugfs to generate a
companion tarball or other image.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/documentation.conf         |  2 ++
 meta/conf/local.conf.sample.extended |  9 +++++++++
 meta/lib/oe/image.py                 | 37 ++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

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
index f9e9bfd..688df9d 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -373,6 +373,43 @@ class Image(ImageDepGraph):
                 bb.note("Creating symlinks for %s image ..." % image_type)
                 self._create_symlinks(subimages)
 
+        # Process the debug filesystem...
+        if self.d.getVar('IMAGE_GEN_DEBUGFS', True) == "1":
+            bb.note("Processing debugfs image(s) ...")
+            orig_d = self.d
+            debugfs_d = bb.data.createCopy(self.d)
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
+            debugfs_image_cmd_groups = self._get_imagecmds()
+
+            for image_cmds in debugfs_image_cmd_groups:
+                # create the images in parallel
+                nproc = multiprocessing.cpu_count()
+                pool = bb.utils.multiprocessingpool(nproc)
+                results = list(pool.imap(generate_image, image_cmds))
+                pool.close()
+                pool.join()
+
+                for result in results:
+                    if result is not None:
+                        bb.fatal(result)
+
+                for image_type, subimages, script in image_cmds:
+                    bb.note("Creating debugfs symlinks for %s image ..." % image_type)
+                    self._create_symlinks(subimages)
+
+            self.d = orig_d
+
         execute_pre_post_process(self.d, post_process_cmds)
 
 
-- 
1.9.3


