Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A394B721D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:09:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2014 08:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="611866863"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.176])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2014 08:08:01 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:07:50 -0600
Message-Id: <2b108b6b79a2d55602074f000795697fedf85ed9.1416585198.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
References: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1416585198.git.tom.zanussi@linux.intel.com>
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/6][dizzy] Revert "wic: set bootimg_dir when using image-name artifacts"
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
X-List-Received-Date: Fri, 21 Nov 2014 16:09:19 -0000

This reverts commit 7ce1dc13f91df70e8a2f420e7c3eba51cbc4bd48.

This patch broke the assumption that a non-null boot_dir means a
user-assigned (-b command-line param) value.

Reverting doesn't break anything, since the case it was added for
doesn't use the boot_dir for anything except debugging anyhow.

Fixes [YOCTO #6290]

(From OE-Core rev: db90f10bf31dec8d7d7bb2d3680d50e133662850)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/image/engine.py | 9 ++-------
 scripts/wic                 | 7 +++----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 3813fec..f1df8b4 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -67,8 +67,7 @@ def find_artifacts(image_name):
     """
     bitbake_env_lines = get_bitbake_env_lines()
 
-    rootfs_dir = kernel_dir = bootimg_dir = ""
-    hdddir = staging_data_dir = native_sysroot = ""
+    rootfs_dir = kernel_dir = hdddir = staging_data_dir = native_sysroot = ""
 
     for line in bitbake_env_lines.split('\n'):
         if (get_line_val(line, "IMAGE_ROOTFS")):
@@ -86,12 +85,8 @@ def find_artifacts(image_name):
         if (get_line_val(line, "STAGING_DIR_NATIVE")):
             native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
             continue
-        if (get_line_val(line, "DEPLOY_DIR_IMAGE")):
-            bootimg_dir = get_line_val(line, "DEPLOY_DIR_IMAGE")
-            continue
 
-    return (rootfs_dir, kernel_dir, bootimg_dir, hdddir, staging_data_dir, \
-            native_sysroot)
+    return (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot)
 
 
 CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
diff --git a/scripts/wic b/scripts/wic
index 7314810..15cc9b3 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -134,8 +134,8 @@ def wic_create_subcommand(args, usage_str):
     bootimg_dir = staging_data_dir = hdddir = ""
 
     if options.image_name:
-        (rootfs_dir, kernel_dir, bootimg_dir, hdddir, \
-         staging_data_dir, native_sysroot) = find_artifacts(options.image_name)
+        (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot) = \
+            find_artifacts(options.image_name)
 
     wks_file = args[0]
 
@@ -172,8 +172,7 @@ def wic_create_subcommand(args, usage_str):
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
             (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
-        elif not os.path.isdir(bootimg_dir) and not os.path.isdir(hdddir) \
-             and not os.path.isdir(staging_data_dir):
+        elif not os.path.isdir(hdddir) and not os.path.isdir(staging_data_dir):
             (not_found, not_found_dir) = ("bootimg-dir", bootimg_dir)
         elif not os.path.isdir(kernel_dir):
             (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
-- 
1.9.3


