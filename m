Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 30FFF70EE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:04:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 29 Oct 2014 15:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="408120268"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2014 14:56:35 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:22 -0500
Message-Id: <c9335465d825a7938aa1a7e7c512e78029fb923d.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
References: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/6] Revert "wic: set bootimg_dir when using image-name artifacts"
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
X-List-Received-Date: Wed, 29 Oct 2014 22:04:57 -0000

This reverts commit 7ce1dc13f91df70e8a2f420e7c3eba51cbc4bd48.

This patch broke the assumption that a non-null boot_dir means a
user-assigned (-b command-line param) value.

Reverting doesn't break anything, since the case it was added for
doesn't use the boot_dir for anything except debugging anyhow.

Fixes [YOCTO #6290]
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


