Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC2C6FC54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id CD4D331626D9;
	Mon, 22 Sep 2014 13:36:18 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:16 +0200
Message-Id: <1411385721-22264-5-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 4/9] wic: set bootimg_dir when using image-name artifacts
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:19 -0000

Running wic with -e to use artifacts from a named image, bootimg_dir was
always passed as empty string to partition source plugins. The patch
sets bootimg_dir to current value of DEPLOY_DIR_IMAGE, as bootloader
artifacts end up in that location as well.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/image/engine.py | 9 +++++++--
 scripts/wic                 | 7 ++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index f1df8b4..3813fec 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -67,7 +67,8 @@ def find_artifacts(image_name):
     """
     bitbake_env_lines = get_bitbake_env_lines()
 
-    rootfs_dir = kernel_dir = hdddir = staging_data_dir = native_sysroot = ""
+    rootfs_dir = kernel_dir = bootimg_dir = ""
+    hdddir = staging_data_dir = native_sysroot = ""
 
     for line in bitbake_env_lines.split('\n'):
         if (get_line_val(line, "IMAGE_ROOTFS")):
@@ -85,8 +86,12 @@ def find_artifacts(image_name):
         if (get_line_val(line, "STAGING_DIR_NATIVE")):
             native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
             continue
+        if (get_line_val(line, "DEPLOY_DIR_IMAGE")):
+            bootimg_dir = get_line_val(line, "DEPLOY_DIR_IMAGE")
+            continue
 
-    return (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot)
+    return (rootfs_dir, kernel_dir, bootimg_dir, hdddir, staging_data_dir, \
+            native_sysroot)
 
 
 CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
diff --git a/scripts/wic b/scripts/wic
index 15cc9b3..7314810 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -134,8 +134,8 @@ def wic_create_subcommand(args, usage_str):
     bootimg_dir = staging_data_dir = hdddir = ""
 
     if options.image_name:
-        (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot) = \
-            find_artifacts(options.image_name)
+        (rootfs_dir, kernel_dir, bootimg_dir, hdddir, \
+         staging_data_dir, native_sysroot) = find_artifacts(options.image_name)
 
     wks_file = args[0]
 
@@ -172,7 +172,8 @@ def wic_create_subcommand(args, usage_str):
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
             (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
-        elif not os.path.isdir(hdddir) and not os.path.isdir(staging_data_dir):
+        elif not os.path.isdir(bootimg_dir) and not os.path.isdir(hdddir) \
+             and not os.path.isdir(staging_data_dir):
             (not_found, not_found_dir) = ("bootimg-dir", bootimg_dir)
         elif not os.path.isdir(kernel_dir):
             (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
-- 
1.9.0


