Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3D2C770B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:01:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2015 09:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844321659"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 09:01:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 17:01:41 +0000
Message-Id: <d4481df5121af988a8f26417a492a2a7644143cd.1446829227.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] verify-homepage: tidy up output and comments
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
X-List-Received-Date: Fri, 06 Nov 2015 17:02:00 -0000

* Set up and use a proper logger
* Tweak output messages and comments

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/verify-homepage.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 3e73339..522824b 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -1,6 +1,7 @@
 #!/usr/bin/env python
 
-# This script is used for verify HOMEPAGE.
+# This script can be used to verify HOMEPAGE values for all recipes in
+# the current configuration.
 # The result is influenced by network environment, since the timeout of connect url is 5 seconds as default.
 
 import sys
@@ -14,16 +15,19 @@ scripts_path = os.path.abspath(os.path.dirname(os.path.realpath(__file__)) + '/.
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 import scriptpath
+import scriptutils
 
 # Allow importing bitbake modules
 bitbakepath = scriptpath.add_bitbake_lib_path()
 
 import bb.tinfoil
 
+logger = scriptutils.logger_create('verify_homepage')
+
 def wgetHomepage(pn, homepage):
     result = subprocess.call('wget ' + '-q -T 5 -t 1 --spider ' + homepage, shell = True)
     if result:
-        bb.warn("Failed to verify HOMEPAGE (%s) of %s" % (homepage, pn))
+        logger.warn("%s: failed to verify HOMEPAGE: %s " % (pn, homepage))
         return 1
     else:
         return 0
@@ -44,10 +48,9 @@ def verifyHomepage(bbhandler):
     return count
 
 if __name__=='__main__':
-    failcount = 0
     bbhandler = bb.tinfoil.Tinfoil()
     bbhandler.prepare()
-    print "Start to verify HOMEPAGE:"
+    logger.info("Start verifying HOMEPAGE:")
     failcount = verifyHomepage(bbhandler)
-    print "finish to verify HOMEPAGE."
-    print "Summary: %s failed" % failcount
+    logger.info("Finished verifying HOMEPAGE.")
+    logger.info("Summary: %s failed" % failcount)
-- 
2.1.0


