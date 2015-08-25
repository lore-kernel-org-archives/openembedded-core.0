Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C78676D19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 15:55:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Aug 2015 08:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,746,1432623600"; d="scan'208";a="775381271"
Received: from mlopezva-mobl2.zpn.intel.com (HELO localhost.localdomain)
	([10.219.16.76])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2015 08:55:32 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 10:55:17 -0500
Message-Id: <1440518117-6722-5-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440518117-6722-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1440518117-6722-1-git-send-email-mariano.lopez@linux.intel.com>
Subject: [PATCH 4/4 v2] oetest: Fix regression when testing real hardware
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
X-List-Received-Date: Tue, 25 Aug 2015 15:55:32 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This fix the regression introduced in commit
9c72c1a5aa0b49d3895bbefee7a264adfcc6f4ca
when testing with real hardware. This regression
happens when a test in real hardware fails.

[YOCTO #8203]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index b33ca0a..dbdbc90 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -13,6 +13,7 @@ import inspect
 import subprocess
 import bb
 from oeqa.utils.decorators import LogResults
+from oeqa.targetcontrol import QemuTarget
 from sys import exc_info, exc_clear
 
 def loadTests(tc, type="runtime"):
@@ -123,12 +124,13 @@ class oeRuntimeTest(oeTest):
         if not exc_info() == (None, None, None):
             exc_clear()
             self.tc.host_dumper.create_dir(self._testMethodName)
-            self.target.target_dumper.dump_target(
-                    self.tc.host_dumper.dump_dir)
             self.tc.host_dumper.dump_host()
-            print ("%s dump data from host and target "
-                    "stored in %s" % (self._testMethodName,
-                     self.target.target_dumper.dump_dir))
+            #Only QemuTarget has a serial console
+            if (isinstance(self.target, QemuTarget)):
+                self.target.target_dumper.dump_target(
+                        self.tc.host_dumper.dump_dir)
+            print ("%s dump data stored in %s" % (self._testMethodName,
+                     self.tc.host_dumper.dump_dir))
 
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
-- 
1.9.1


