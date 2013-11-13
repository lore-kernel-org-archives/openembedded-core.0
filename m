Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D0B1C6D476
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:32:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2013 06:32:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920121"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:32:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:39 +0000
Message-Id: <76e8106836dbd7afb19f45dc69f78296568a6bd2.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/11] classes/insane: improve LIC_FILES_CHKSUM messages
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
X-List-Received-Date: Wed, 13 Nov 2013 14:32:57 -0000

* If the md5 parameter is specified with no value, report that the
  checksum is not specified instead of reporting that it has changed
* If the md5 checksum has changed, point directly to the license file in
  a way that is easy to copy and paste and give the line numbers in an
  easy to read form, as well as asking the user to verify that the new
  contents matches the current LICENSE value.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3558dee..f9f8def 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -602,7 +602,8 @@ def package_qa_check_license(workdir, d):
         if not os.path.isfile(srclicfile):
             raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
 
-        if 'md5' not in parm:
+        recipemd5 = parm.get('md5', '')
+        if not recipemd5:
             bb.error(pn + ": md5 checksum is not specified for ", url)
             return False
         beginline, endline = 0, 0
@@ -633,12 +634,21 @@ def package_qa_check_license(workdir, d):
             md5chksum = bb.utils.md5_file(tmplicfile)
             os.unlink(tmplicfile)
 
-        if parm['md5'] == md5chksum:
+        if recipemd5 == md5chksum:
             bb.note (pn + ": md5 checksum matched for ", url)
         else:
             bb.error (pn + ": md5 data is not matching for ", url)
             bb.error (pn + ": The new md5 checksum is ", md5chksum)
-            bb.error (pn + ": Check if the license information has changed in")
+            if beginline:
+                if endline:
+                    srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
+                else:
+                    srcfiledesc = "%s (beginning on line %d)" % (srclicfile, beginline)
+            elif endline:
+                srcfiledesc = "%s (ending on line %d)" % (srclicfile, endline)
+            else:
+                srcfiledesc = srclicfile
+            bb.error(pn + ": Check if the license information has changed in %s to verify that the LICENSE value \"%s\" remains valid" % (srcfiledesc, lic))
             sane = False
 
     return sane
-- 
1.8.1.2


