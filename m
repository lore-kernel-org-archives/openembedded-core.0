Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D79476E88
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 17:47:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 10:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="635017201"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Aug 2015 10:47:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DA3496A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:46:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 20:47:03 +0300
Message-Id: <4266780ef0ea03c32a864ebaaa2cde5d2ccd4a78.1440956535.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440956535.git.ed.bartosh@linux.intel.com>
References: <cover.1440956535.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/12] wic: set default image
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
X-List-Received-Date: Sun, 30 Aug 2015 17:47:41 -0000

Set BitbakeVars.default_image when wic is called with -e option.
This makes get_bitbake_var API to use provided image as a default
source of variables.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 5aa2393..5818e2d 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -52,7 +52,7 @@ if bitbake_exe:
 else:
     bitbake_main = None
 
-from wic.utils.oe.misc import get_bitbake_var
+from wic.utils.oe.misc import get_bitbake_var, BB_VARS
 from wic.utils.errors import WicError
 from image import engine
 from image import help as hlp
@@ -141,7 +141,9 @@ def wic_create_subcommand(args, usage_str):
             print "  " + ", ".join(missed)
             sys.exit(1)
 
-    if not options.image_name:
+    if options.image_name:
+        BB_VARS.default_image = options.image_name
+    else:
         options.build_check = False
 
     if options.build_check:
-- 
2.1.4


