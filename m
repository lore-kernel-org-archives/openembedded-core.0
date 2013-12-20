Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D385B60D67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 14:55:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 20 Dec 2013 06:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,521,1384329600"; d="scan'208";a="447624116"
Received: from dsgunati-mobl.gar.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2013 06:55:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 14:55:10 +0000
Message-Id: <910ec21046171291eadeb7c45560ec798483485c.1387551254.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387551254.git.paul.eggleton@linux.intel.com>
References: <cover.1387551254.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1387551254.git.paul.eggleton@linux.intel.com>
References: <cover.1387551254.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/insane: restore printing LIC_FILES_CHKSUM checksum if not specified
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
X-List-Received-Date: Fri, 20 Dec 2013 14:55:26 -0000

OE-Core rev ec8590aa81e201e28e500935d31cd7266114471f (by me)
unintentionally disabled printing the actual checksum value if no
checksum was specified, i.e.:

LIC_FILES_CHKSUM = "file://COPYING;md5="

Printing the actual checksum in this case is really useful when writing
a new recipe, so put this back in.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e77e993..55ed91f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -604,9 +604,6 @@ def package_qa_check_license(workdir, d):
             raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
 
         recipemd5 = parm.get('md5', '')
-        if not recipemd5:
-            bb.error(pn + ": md5 checksum is not specified for ", url)
-            return False
         beginline, endline = 0, 0
         if 'beginline' in parm:
             beginline = int(parm['beginline'])
@@ -638,18 +635,22 @@ def package_qa_check_license(workdir, d):
         if recipemd5 == md5chksum:
             bb.note (pn + ": md5 checksum matched for ", url)
         else:
-            bb.error (pn + ": md5 data is not matching for ", url)
-            bb.error (pn + ": The new md5 checksum is ", md5chksum)
-            if beginline:
-                if endline:
-                    srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
+            if recipemd5:
+                bb.error(pn + ": md5 data is not matching for ", url)
+                bb.error(pn + ": The new md5 checksum is ", md5chksum)
+                if beginline:
+                    if endline:
+                        srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
+                    else:
+                        srcfiledesc = "%s (beginning on line %d)" % (srclicfile, beginline)
+                elif endline:
+                    srcfiledesc = "%s (ending on line %d)" % (srclicfile, endline)
                 else:
-                    srcfiledesc = "%s (beginning on line %d)" % (srclicfile, beginline)
-            elif endline:
-                srcfiledesc = "%s (ending on line %d)" % (srclicfile, endline)
+                    srcfiledesc = srclicfile
+                bb.error(pn + ": Check if the license information has changed in %s to verify that the LICENSE value \"%s\" remains valid" % (srcfiledesc, lic))
             else:
-                srcfiledesc = srclicfile
-            bb.error(pn + ": Check if the license information has changed in %s to verify that the LICENSE value \"%s\" remains valid" % (srcfiledesc, lic))
+                bb.error(pn + ": md5 checksum is not specified for ", url)
+                bb.error(pn + ": The md5 checksum is ", md5chksum)
             sane = False
 
     return sane
-- 
1.8.1.2


