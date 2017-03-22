Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5066077AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190244; x=1521726244;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IrMmJn1a8ZcOeiag5Np6smPtJuWuPpuVWNxEWLylNbc=;
	b=GNYGdrwlPXB/zgWhDGy3jNNunZa55x3qnoXRD7PnxzDdhaHLvTKS+8bA
	qQQfD1MJBGqOcmCuRpaAHqWrgWnvtg==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="1145597629"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2017 06:44:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6B69B2C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:43:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:27 +0200
Message-Id: <837b02e8d3a77ea2aea0b92bfe743fc92aa8ce57.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/10] wic: use kernel_dir instead of bootimg_dir
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:02 -0000

bootimg_dir is usually set to the value of STAGING_DATADIR and
kernel_dir - to the value of DEPLOY_DIR_IMAGE, so usage of
kernel_dir is more logical in bootimg-efi, bootimg-partition and
rawcopy plugins.

Replaced usage of bootimg_dir to kernel_dir in 3 above mentioned
plugins that use DEPLOY_DIR_IMAGE as a default artifact location.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py       | 14 +++++++-------
 scripts/lib/wic/plugins/source/bootimg-partition.py | 12 ++++++------
 scripts/lib/wic/plugins/source/rawcopy.py           | 10 +++++-----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2d1c4d4..ff76c2f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -185,9 +185,9 @@ class BootimgEFIPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for an EFI (grub) boot partition.
         """
-        if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
         staging_kernel_dir = kernel_dir
@@ -203,14 +203,14 @@ class BootimgEFIPlugin(SourcePlugin):
             if source_params['loader'] == 'grub-efi':
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                                 "%s/grub.cfg" % cr_workdir)
-                for mod in [x for x in os.listdir(bootimg_dir) if x.startswith("grub-efi-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (bootimg_dir, mod, hdddir, mod[9:])
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
                     exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
             elif source_params['loader'] == 'systemd-boot':
                 for mod in [x for x in os.listdir(bootimg_dir) if x.startswith("systemd-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (bootimg_dir, mod, hdddir, mod[8:])
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
@@ -218,7 +218,7 @@ class BootimgEFIPlugin(SourcePlugin):
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-        startup = os.path.join(bootimg_dir, "startup.nsh")
+        startup = os.path.join(kernel_dir, "startup.nsh")
         if os.path.exists(startup):
             cp_cmd = "cp %s %s/" % (startup, hdddir)
             exec_cmd(cp_cmd, True)
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 373e8d8..4afc8a2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -78,12 +78,12 @@ class BootimgPartitionPlugin(SourcePlugin):
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
-        if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        logger.debug('Bootimg dir: %s', bootimg_dir)
+        logger.debug('Kernel dir: %s', bootimg_dir)
 
         boot_files = get_bitbake_var("IMAGE_BOOT_FILES")
 
@@ -118,7 +118,7 @@ class BootimgPartitionPlugin(SourcePlugin):
                                     os.path.join(dst,
                                                  os.path.basename(name))
 
-                srcs = glob(os.path.join(bootimg_dir, src))
+                srcs = glob(os.path.join(kernel_dir, src))
 
                 logger.debug('Globbed sources: %s', ', '.join(srcs))
                 for entry in srcs:
@@ -127,7 +127,7 @@ class BootimgPartitionPlugin(SourcePlugin):
                                          os.path.join(hdddir,
                                                       entry_dst_name)))
             else:
-                install_task = [(os.path.join(bootimg_dir, src),
+                install_task = [(os.path.join(kernel_dir, src),
                                  os.path.join(hdddir, dst))]
 
             for task in install_task:
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index bc71cf6f..431afce 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -59,17 +59,17 @@ class RawCopyPlugin(SourcePlugin):
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
         """
-        if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        logger.debug('Bootimg dir: %s', bootimg_dir)
+        logger.debug('Kernel dir: %s', kernel_dir)
 
         if 'file' not in source_params:
             raise WicError("No file specified")
 
-        src = os.path.join(bootimg_dir, source_params['file'])
+        src = os.path.join(kernel_dir, source_params['file'])
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
         if 'skip' in source_params:
-- 
2.1.4


