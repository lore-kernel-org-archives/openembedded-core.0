Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BBBD5778D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:09:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 06 Jul 2017 01:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="989328248"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Jul 2017 01:09:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3181D5801CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:09:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:44 +0300
Message-Id: <3efcbaf59507e0043825ea2ad3da6ab4eef12a02.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/8] wic: build wic-tools only if wic is run manually
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
X-List-Received-Date: Thu, 06 Jul 2017 08:09:30 -0000

When wic can't find native sysroot it tries to build wic-tools
However, it's not possible when wic is run from bitbake.
Moreover, it's not even feasible anymore as wic-tools should be
used only when wic is run manually.

Checked if wic is run manually before building wic-tools.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 881393a..0510447 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -166,15 +166,15 @@ def wic_create_subcommand(options, usage_str):
                            "(Use -e/--image-name to specify it)")
         native_sysroot = options.native_sysroot
 
-    if not native_sysroot or not os.path.isdir(native_sysroot):
+    if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
         logger.info("Building wic-tools...\n")
         if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
                         cookerdata.CookerConfiguration()):
             raise WicError("bitbake wic-tools failed")
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
-        if not native_sysroot:
-            raise WicError("Unable to find the location of the native "
-                           "tools sysroot to use")
+
+    if not native_sysroot:
+        raise WicError("Unable to find the location of the native tools sysroot")
 
     wks_file = options.wks_file
 
-- 
2.1.4


