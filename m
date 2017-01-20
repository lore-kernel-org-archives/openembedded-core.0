Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF2E771E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567480"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:51 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:06 -0600
Message-Id: <77b1b9d1febd4af16e040d49a774a6e7aec79999.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 35/55] oeqa/runtime: Add OEHasPackage decorator
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:51 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new decorator will be used to skip the test
if the image under test doesn't have the required
packages installed.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 53 ++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/decorator/package.py

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
new file mode 100644
index 0000000..aa6ecb6
--- /dev/null
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -0,0 +1,53 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.decorator import OETestDecorator, registerDecorator
+from oeqa.core.utils.misc import strToSet
+
+@registerDecorator
+class OEHasPackage(OETestDecorator):
+    """
+        Checks if image has packages (un)installed.
+
+        The argument must be a string, set, or list of packages that must be
+        installed or not present in the image.
+
+        The way to tell a package must not be in an image is using an
+        exclamation point ('!') before the name of the package.
+
+        If test depends on pkg1 or pkg2 you need to use:
+        @OEHasPackage({'pkg1', 'pkg2'})
+
+        If test depends on pkg1 and pkg2 you need to use:
+        @OEHasPackage('pkg1')
+        @OEHasPackage('pkg2')
+
+        If test depends on pkg1 but pkg2 must not be present use:
+        @OEHasPackage({'pkg1', '!pkg2'})
+    """
+
+    attrs = ('need_pkgs',)
+
+    def setUpDecorator(self):
+        need_pkgs = set()
+        unneed_pkgs = set()
+        pkgs = strToSet(self.need_pkgs)
+        for pkg in pkgs:
+            if pkg.startswith('!'):
+                unneed_pkgs.add(pkg[1:])
+            else:
+                need_pkgs.add(pkg)
+
+        if unneed_pkgs:
+            msg = 'Checking if %s is not installed' % ', '.join(unneed_pkgs)
+            self.logger.debug(msg)
+            if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
+                msg = "Test can't run with %s installed" % ', or'.join(unneed_pkgs)
+                self.case.skipTest(msg)
+
+        if need_pkgs:
+            msg = 'Checking if at least one of %s is installed' % ', '.join(need_pkgs)
+            self.logger.debug(msg)
+            if self.case.tc.image_packages.isdisjoint(need_pkgs):
+                msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
+                self.case.skipTest(msg)
-- 
2.1.4


