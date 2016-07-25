Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AAA45731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:47:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jul 2016 01:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,418,1464678000"; d="scan'208";a="739333532"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2016 01:47:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2016 20:47:18 +1200
Message-Id: <41e6291f6e442bb1f837e718d75ba61151e028c7.1469436396.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469436396.git.paul.eggleton@linux.intel.com>
References: <cover.1469436396.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469436396.git.paul.eggleton@linux.intel.com>
References: <cover.1469436396.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: record unknown license files
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
X-List-Received-Date: Mon, 25 Jul 2016 08:47:33 -0000

Add a comment to the recipe listing license files that were found but
not able to be identified, so that the user can find and examine them
by hand fairly easily.

Fixes [YOCTO #9882].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f246028..838c23b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -479,12 +479,15 @@ def create_recipe(args):
 
     licvalues = guess_license(srctree_use)
     lic_files_chksum = []
+    lic_unknown = []
     if licvalues:
         licenses = []
         for licvalue in licvalues:
             if not licvalue[0] in licenses:
                 licenses.append(licvalue[0])
             lic_files_chksum.append('file://%s;md5=%s' % (licvalue[1], licvalue[2]))
+            if licvalue[0] == 'Unknown':
+                lic_unknown.append(licvalue[1])
         lines_before.append('# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is')
         lines_before.append('# your responsibility to verify that the values are complete and correct.')
         if len(licvalues) > 1:
@@ -493,6 +496,13 @@ def create_recipe(args):
             lines_before.append('# these in the LICENSE value using & if the multiple licenses all apply, or | if there')
             lines_before.append('# is a choice between the multiple licenses. If in doubt, check the accompanying')
             lines_before.append('# documentation to determine which situation is applicable.')
+        if lic_unknown:
+            lines_before.append('#')
+            lines_before.append('# The following license files were not able to be identified and are')
+            lines_before.append('# represented as "Unknown" below, you will need to check them yourself:')
+            for licfile in lic_unknown:
+                lines_before.append('#   %s' % licfile)
+            lines_before.append('#')
     else:
         lines_before.append('# Unable to find any files that looked like license statements. Check the accompanying')
         lines_before.append('# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.')
-- 
2.5.5


