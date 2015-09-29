Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E20D77025
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:47:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 29 Sep 2015 04:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,607,1437462000"; d="scan'208";a="815390265"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 29 Sep 2015 04:47:12 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id B85BC6A4005;
	Tue, 29 Sep 2015 04:46:16 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 14:45:05 +0300
Message-Id: <1443527105-10834-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/decorators: Fixed a problem with decorator logs link.
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
X-List-Received-Date: Tue, 29 Sep 2015 11:47:13 -0000

When not doing actual tests with testimage, like for example
exporting tests, the link to the log file was still created
although the actual log file was not existent. Fixed it by
moving the link creation part into the run() method.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 7116208..55190aa 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -167,14 +167,14 @@ def LogResults(original_class):
         if passed:
             local_log.results("Testcase "+str(test_case)+": PASSED")
 
-    original_class.run = run
+        # Create symlink to the current log
+        if os.path.islink(linkfile):
+            os.unlink(linkfile)
+        elif os.path.isfile(linkfile):
+                os.remove(linkfile)
+        os.symlink(logfile, linkfile)
 
-    # Create symlink to the current log
-    if os.path.islink(linkfile):
-        os.unlink(linkfile)
-    elif os.path.isfile(linkfile):
-            os.remove(linkfile)
-    os.symlink(logfile, linkfile)
+    original_class.run = run
 
     return original_class
 
-- 
2.1.4


