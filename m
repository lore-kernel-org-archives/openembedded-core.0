Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B15706D24E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:45:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 17 Oct 2013 21:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,519,1378882800"; d="scan'208";a="413012770"
Received: from unknown (HELO localhost) ([10.255.15.248])
	by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2013 21:45:39 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 23:45:37 -0500
Message-Id: <4a1a0d1872eef858826437e1e49bd1acfe9b6d87.1382071241.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1382071241.git.tom.zanussi@linux.intel.com>
References: <cover.1382071241.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/2] wic: Check for the existence/correctness of build artifacts
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
X-List-Received-Date: Fri, 18 Oct 2013 04:45:39 -0000

If a user uses the -e option and specifies a machine that hasn't been
built or uses the wrong .wks script for the build artifacts pointed to
by the current machine, we should point that out for obvious cases.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/wic | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index a7221c3..08473d3 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -143,6 +143,26 @@ def wic_create_subcommand(args, usage_str):
         if not os.path.isdir(native_sysroot):
             print "--native-sysroot (-n) not found, exiting\n"
             sys.exit(1)
+    else:
+        not_found = not_found_dir = ""
+        if not os.path.isdir(rootfs_dir):
+            (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
+        elif not os.path.isdir(hdddir) and not os.path.isdir(staging_data_dir):
+            (not_found, not_found_dir) = ("bootimg-dir", bootimg_dir)
+        elif not os.path.isdir(kernel_dir):
+            (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
+        elif not os.path.isdir(native_sysroot):
+            (not_found, not_found_dir) = ("native-sysroot", native_sysroot)
+        if not_found:
+            if not not_found_dir:
+                not_found_dir = "Completely missing artifact - wrong image (.wks) used?"
+            print "Build artifacts not found, exiting."
+            print "  (Please check that the build artifacts for the machine"
+            print "   selected in local.conf actually exist and that they"
+            print "   are the correct artifacts for the image (.wks file)).\n"
+            print "The artifact that couldn't be found was %s:\n  %s" % \
+                (not_found, not_found_dir)
+            sys.exit(1)
 
     wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, hdddir, staging_data_dir, scripts_path,
-- 
1.7.11.4


