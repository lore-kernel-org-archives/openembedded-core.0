Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7000C76536
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 21:14:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2015 14:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,436,1437462000"; d="scan'208";a="793954657"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2015 14:14:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 6EEAE6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 14:13:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 00:14:23 +0300
Message-Id: <989b768736c5d92eda4f8beb230e02005811ff18.1440969020.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440969020.git.ed.bartosh@linux.intel.com>
References: <cover.1440969020.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440969020.git.ed.bartosh@linux.intel.com>
References: <cover.1440969020.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/5] image.py: write bitbake variables to .env file
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
X-List-Received-Date: Sun, 30 Aug 2015 21:14:33 -0000

Write set of bitbake variables used by wic into
build/tmp/sysroots/<machine>/imagedata/<image>.env

List of variables is defined in WICVARS variable in
meta/classes/image_types.bbclass.

This is needed for wic to be able to get bitbake variables without
running 'bitbake -e'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass |  4 ++++
 meta/lib/oe/image.py             | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 05c45f8..ecb066b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -248,3 +248,7 @@ IMAGE_EXTENSION_live = "hddimg iso"
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
+
+# The WICVARS variable is used to define list of bitbake variables used in wic code
+# variables from this list is written to <image>.env file
+WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index a2f94a1..95c62dc 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -326,6 +326,22 @@ class Image(ImageDepGraph):
 
         return image_cmd_groups
 
+    def _write_env(self):
+        """
+        Write environment variables used by wic
+        to tmp/sysroots/<machine>/imgdata/<image>.env
+        """
+        stdir = self.d.getVar('STAGING_DIR_TARGET', True)
+        outdir = os.path.join(stdir, 'imgdata')
+        if not os.path.exists(outdir):
+            os.makedirs(outdir)
+        basename = self.d.getVar('IMAGE_BASENAME', True)
+        with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
+            for var in self.d.getVar('WICVARS', True).split():
+                value = self.d.getVar(var, True)
+                if value:
+                    envf.write('%s="%s"\n' % (var, value.strip()))
+
     def create(self):
         bb.note("###### Generate images #######")
         pre_process_cmds = self.d.getVar("IMAGE_PREPROCESS_COMMAND", True)
@@ -337,6 +353,8 @@ class Image(ImageDepGraph):
 
         image_cmd_groups = self._get_imagecmds()
 
+        self._write_env()
+
         for image_cmds in image_cmd_groups:
             # create the images in parallel
             nproc = multiprocessing.cpu_count()
-- 
2.1.4


