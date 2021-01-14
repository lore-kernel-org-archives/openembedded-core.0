Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: I8O5JK6eDrqgu2evIwT6lwXGRyqFCYvDIs1EQ6ve7E8wzNXlABDAWUsp4ikvSvUwro4G1faSKD
 CKsXZoqJxzyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062611"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:09:59 -0800
IronPort-SDR: bIaAnUH1UdIzopsaikRyCzEsQS9efVK4WyZWcGKGPWLeSsB9oQHc99gxzvPfKrLtv7/jWrlQoE
 k/y2LF7W00Lw==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986493"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:09:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/14] selftest: Add argument to keep build dir
Date: Fri, 15 Jan 2021 00:09:37 +0800
Message-Id: <f41c17a155e9bfd233bc2166c6ab7f5e547f39fa.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

The oe-selftest code already keeps the selftest build directory in place
if any tests failed. By default the build directory is deleted if all
tests pass but there may be cases where it's desirable to keep this
directory around, for example to compare intermediate files between
passing and failing test runs.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67aa7069dbe8f5f5f186eb67708ece5c4bd42976)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index dd3609c1d6..1659926975 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -34,7 +34,7 @@ class NonConcurrentTestSuite(unittest.TestSuite):
         (builddir, newbuilddir) = self.setupfunc("-st", None, self.suite)
         ret = super().run(result)
         os.chdir(builddir)
-        if newbuilddir and ret.wasSuccessful():
+        if newbuilddir and ret.wasSuccessful() and self.removefunc:
             self.removefunc(newbuilddir)
 
 def removebuilddir(d):
@@ -54,7 +54,7 @@ def removebuilddir(d):
     bb.utils.prunedir(d, ionice=True)
 
 class OESelftestTestContext(OETestContext):
-    def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None):
+    def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None, keep_builddir=None):
         super(OESelftestTestContext, self).__init__(td, logger)
 
         self.machines = machines
@@ -62,6 +62,11 @@ class OESelftestTestContext(OETestContext):
         self.config_paths = config_paths
         self.newbuilddir = newbuilddir
 
+        if keep_builddir:
+            self.removebuilddir = None
+        else:
+            self.removebuilddir = removebuilddir
+
     def setup_builddir(self, suffix, selftestdir, suite):
         builddir = os.environ['BUILDDIR']
         if not selftestdir:
@@ -119,9 +124,9 @@ class OESelftestTestContext(OETestContext):
         if processes:
             from oeqa.core.utils.concurrencytest import ConcurrentTestSuite
 
-            return ConcurrentTestSuite(suites, processes, self.setup_builddir, removebuilddir)
+            return ConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir)
         else:
-            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, removebuilddir)
+            return NonConcurrentTestSuite(suites, processes, self.setup_builddir, self.removebuilddir)
 
     def runTests(self, processes=None, machine=None, skips=[]):
         if machine:
@@ -179,6 +184,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 action='append', default=None,
                 help='Exclude all (unhidden) tests that match any of the specified tag(s). (exclude applies before select)')
 
+        parser.add_argument('-K', '--keep-builddir', action='store_true',
+                help='Keep the test build directory even if all tests pass')
+
         parser.add_argument('-B', '--newbuilddir', help='New build directory to use for tests.')
         parser.add_argument('-v', '--verbose', action='store_true')
         parser.set_defaults(func=self.run)
@@ -236,6 +244,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
         self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
         self.tc_kwargs['init']['newbuilddir'] = args.newbuilddir
+        self.tc_kwargs['init']['keep_builddir'] = args.keep_builddir
 
         def tag_filter(tags):
             if args.exclude_tags:
-- 
2.29.2

