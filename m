Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 440B7605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 13:19:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 17 Apr 2015 06:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,594,1422950400"; d="scan'208";a="710836153"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2015 06:19:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B21B86A4091;
	Fri, 17 Apr 2015 06:18:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:19:01 +0300
Message-Id: <1429276741-28039-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Ed Bartosh <eduard.bartosh@intel.com>
Subject: [wic][PATCH] wic: try to find bitbake using find_executable API
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
X-List-Received-Date: Fri, 17 Apr 2015 13:19:11 -0000

From: Ed Bartosh <eduard.bartosh@intel.com>

Current wic code was assuming that bitbake directory is on the
same level as scripts, which is not the case for oe classic.

Using find_executable bitbake location should be determined better
as this API uss $PATH to search for executables.

Fixes [YOCTO #7621]

Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 5bedd90..7d388c9 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -36,19 +36,25 @@ import os
 import sys
 import optparse
 import logging
+from distutils import spawn
 
 # External modules
 scripts_path = os.path.abspath(os.path.dirname(__file__))
 lib_path = scripts_path + '/lib'
-bitbake_path = os.path.join(scripts_path, '../bitbake/lib')
-sys.path = sys.path + [lib_path, bitbake_path]
+sys.path.append(lib_path)
+
+bitbake_exe = spawn.find_executable('bitbake')
+if bitbake_exe:
+    bitbake_path = os.path.join(os.path.dirname(bitbake_exe), '../lib')
+    sys.path.append(bitbake_path)
+    from bb import cookerdata
+    from bb.main import bitbake_main, BitBakeConfigParameters
+else:
+    bitbake_main = None
 
 from image.help import *
 from image.engine import *
 
-from bb import cookerdata
-from bb.main import bitbake_main, BitBakeConfigParameters
-
 def rootfs_dir_to_args(krootfs_dir):
     """
     Get a rootfs_dir dict and serialize to string
@@ -109,6 +115,10 @@ def wic_create_subcommand(args, usage_str):
         parser.print_help()
         sys.exit(1)
 
+    if options.build_rootfs and not bitbake_main:
+        logging.error("Can't build roofs as bitbake is not in the $PATH")
+        sys.exit(1)
+
     if not options.image_name and not (options.rootfs_dir and
                                        options.bootimg_dir and
                                        options.kernel_dir and
-- 
2.1.4


