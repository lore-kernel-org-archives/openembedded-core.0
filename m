Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A653B6CCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:14:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Oct 2013 22:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,505,1378882800"; d="scan'208";a="393585914"
Received: from unknown (HELO localhost) ([10.255.15.157])
	by orsmga001.jf.intel.com with ESMTP; 15 Oct 2013 22:14:33 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 00:14:30 -0500
Message-Id: <6fe8e69ccc25d80959fa9ea2a66c45af2fd7fa54.1381898855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
References: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1381898855.git.tom.zanussi@linux.intel.com>
References: <cover.1381898855.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/3] wic: check passed-in build artifact directories
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
X-List-Received-Date: Wed, 16 Oct 2013 05:14:46 -0000

Make sure they exist - complain if they don't.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/wic | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index aa2791a..425b665 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -119,6 +119,18 @@ def wic_create_subcommand(args, usage_str):
         bootimg_dir = options.bootimg_dir
         kernel_dir = options.kernel_dir
         native_sysroot = options.native_sysroot
+        if not os.path.isdir(rootfs_dir):
+            print "--roofs-dir (-r) not found, exiting\n"
+            sys.exit(1)
+        if not os.path.isdir(bootimg_dir):
+            print "--bootimg-dir (-b) not found, exiting\n"
+            sys.exit(1)
+        if not os.path.isdir(kernel_dir):
+            print "--kernel-dir (-k) not found, exiting\n"
+            sys.exit(1)
+        if not os.path.isdir(native_sysroot):
+            print "--native-sysroot (-n) not found, exiting\n"
+            sys.exit(1)
 
     wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, hdddir, staging_data_dir, scripts_path,
-- 
1.7.11.4


