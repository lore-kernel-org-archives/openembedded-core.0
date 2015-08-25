Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9F83576CA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:05:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 02:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="548073806"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2015 02:04:43 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 6D2106A4087;
	Tue, 25 Aug 2015 02:03:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:18 +0300
Message-Id: <157b92638e19a6950323e965ef48d26a83aa5f2f.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/17] wic: set default image
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:06 -0000

Set BitbakeVars.default_image when wic is called with -e option.
This makes get_bitbake_var API to use provided image as a default
source of variables.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index c1d3003..87ada36 100755
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


