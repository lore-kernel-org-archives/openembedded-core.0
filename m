Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E66AC73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 21:40:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2015 14:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="807769864"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2015 14:40:57 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 13:31:32 +0000
Message-Id: <aff257855c6708b9c4db09136eb94032aed12a1b.1442582395.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1442582395.git.mariano.lopez@linux.intel.com>
References: <cover.1442582395.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] testimage.bbclass: Fix break introduced with SIGTERM handling
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
X-List-Received-Date: Fri, 18 Sep 2015 21:40:58 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The SIGTERM introduced another break into runexported test,
the handler is in the class TestContext while exporting it
will try to convert the singnal handler to JSON, and this
will throw an exception.

The SIGTERM handler is not needed in the exported test, so this
change will remove the handler before exporting the test. Also
when a test is exported the target is not deployed/started
anymore, it is not necessary.

[YOCTO #8239]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a1918ba..fd4143d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -305,13 +305,15 @@ def testimage_main(d):
         import traceback
         bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
 
-    target.deploy()
 
-    try:
-        target.start()
-        if export:
-            exportTests(d,tc)
-        else:
+    if export:
+        signal.signal(signal.SIGTERM, tc.origsigtermhandler)
+        tc.origsigtermhandler = None
+        exportTests(d,tc)
+    else:
+        target.deploy()
+        try:
+            target.start()
             starttime = time.time()
             result = runTests(tc)
             stoptime = time.time()
@@ -324,9 +326,9 @@ def testimage_main(d):
                 bb.plain(msg)
             else:
                 raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
-    finally:
-        signal.signal(signal.SIGTERM, tc.origsigtermhandler)
-        target.stop()
+        finally:
+            signal.signal(signal.SIGTERM, tc.origsigtermhandler)
+            target.stop()
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
 
-- 
1.8.4.5


