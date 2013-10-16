Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCD86CCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:14:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2013 22:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,505,1378882800"; d="scan'208";a="411686317"
Received: from unknown (HELO localhost) ([10.255.15.157])
	by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2013 22:14:31 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 00:14:29 -0500
Message-Id: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1381898855.git.tom.zanussi@linux.intel.com>
References: <cover.1381898855.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/3] wic: check for build artifacts
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
X-List-Received-Date: Wed, 16 Oct 2013 05:14:30 -0000

wic needs to be given one form of build artifacts or another -
complain if the user doesn't do that.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/wic | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 06e72bb..aa2791a 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -75,6 +75,14 @@ def wic_create_subcommand(args, usage_str):
         parser.print_help()
         sys.exit(1)
 
+    if not options.image_name and not (options.rootfs_dir and
+                                       options.bootimg_dir and
+                                       options.kernel_dir and
+                                       options.native_sysroot):
+        print "Build artifacts not completely specified, exiting."
+        print "  (Use 'wic -e' or 'wic -r -b -k -n' to specify artifacts)"
+        sys.exit(1)
+
     if not options.image_name:
         options.build_check = False
 
-- 
1.7.11.4


