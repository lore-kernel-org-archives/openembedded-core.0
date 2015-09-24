Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B602756C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 14:24:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Sep 2015 07:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,581,1437462000"; d="scan'208";a="776142278"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2015 07:23:56 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id EC0256A4083;
	Thu, 24 Sep 2015 07:23:00 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 17:21:53 +0300
Message-Id: <1443104513-6181-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/decorators: Add timestamp to decorator logs.
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
X-List-Received-Date: Thu, 24 Sep 2015 14:24:53 -0000

To avoid logs being overwriten when running the automated
tests multiple times, log files include timestamps in
their names and a link is created to point to the latest one.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index b6adcb1..7116208 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -111,6 +111,12 @@ class NoParsingFilter(logging.Filter):
 def LogResults(original_class):
     orig_method = original_class.run
 
+    from time import strftime, gmtime
+    caller = os.path.basename(sys.argv[0])
+    timestamp = strftime('%Y%m%d%H%M%S',gmtime())
+    logfile = os.path.join(os.getcwd(),'results-'+caller+'.'+timestamp+'.log')
+    linkfile = os.path.join(os.getcwd(),'results-'+caller+'.log')
+
     #rewrite the run method of unittest.TestCase to add testcase logging
     def run(self, result, *args, **kws):
         orig_method(self, result, *args, **kws)
@@ -127,14 +133,13 @@ def LogResults(original_class):
         #create custom logging level for filtering.
         custom_log_level = 100
         logging.addLevelName(custom_log_level, 'RESULTS')
-        caller = os.path.basename(sys.argv[0])
 
         def results(self, message, *args, **kws):
             if self.isEnabledFor(custom_log_level):
                 self.log(custom_log_level, message, *args, **kws)
         logging.Logger.results = results
 
-        logging.basicConfig(filename=os.path.join(os.getcwd(),'results-'+caller+'.log'),
+        logging.basicConfig(filename=logfile,
                             filemode='w',
                             format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                             datefmt='%H:%M:%S',
@@ -163,6 +168,14 @@ def LogResults(original_class):
             local_log.results("Testcase "+str(test_case)+": PASSED")
 
     original_class.run = run
+
+    # Create symlink to the current log
+    if os.path.islink(linkfile):
+        os.unlink(linkfile)
+    elif os.path.isfile(linkfile):
+            os.remove(linkfile)
+    os.symlink(logfile, linkfile)
+
     return original_class
 
 class TimeOut(BaseException):
-- 
2.1.4


