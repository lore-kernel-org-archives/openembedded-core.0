Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA937E643
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 02:00:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H20dUc025463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2019 19:00:49 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 16 Jun 2019 19:00:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 10:12:29 +0800
Message-ID: <2ed26b7b559a21538f30c9a3c5549eac3400561a.1560737530.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1560737530.git.Qi.Chen@windriver.com>
References: <cover.1560737530.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] context.py: fix skipping function
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
X-List-Received-Date: Mon, 17 Jun 2019 02:00:58 -0000
Content-Type: text/plain

The current codes to skip test cases are logically correct, but they
do not work correctly in reality. It does skip the tests as the command
line argument specifies, but the related information is wrong.
e.g.
$ oe-selftest -R archiver bblayers runtime_test
2019-06-17 09:24:53,764 - oe-selftest - WARNING - meta-selftest layer not found in BBLAYERS, adding it
2019-06-17 09:25:06,309 - oe-selftest - INFO - Adding layer libraries:
2019-06-17 09:25:06,310 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta/lib
2019-06-17 09:25:06,310 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-yocto-bsp/lib
2019-06-17 09:25:06,310 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-selftest/lib
2019-06-17 09:25:06,312 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
2019-06-17 09:25:10,521 - oe-selftest - INFO - Adding: "include selftest.inc" in /buildarea5/chenqi/SWAT/poky/build-selftest/conf/local.conf
2019-06-17 09:25:10,521 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2019-06-17 09:25:10,522 - oe-selftest - INFO - test_archiver_allows_to_filter_on_recipe_name (archiver.Archiver)
2019-06-17 09:25:10,522 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "runtime_test"'
2019-06-17 09:25:10,522 - oe-selftest - INFO - Skip by the command line argument "runtime_test"
2019-06-17 09:25:10,523 - oe-selftest - INFO - test_archiver_filters_by_type (archiver.Archiver)
2019-06-17 09:25:10,523 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "runtime_test"'
2019-06-17 09:25:10,523 - oe-selftest - INFO - Skip by the command line argument "runtime_test"

The archiver.Archiver.xxx tests should be skipped by 'archiver' command line
argument, not 'runtime_test'.

Change to use a function generator to achieve the desired effect. After the change,
the effect is as follows.

$ oe-selftest -R archiver bblayers runtime_test
2019-06-17 09:19:06,223 - oe-selftest - WARNING - meta-selftest layer not found in BBLAYERS, adding it
2019-06-17 09:19:19,598 - oe-selftest - INFO - Adding layer libraries:
2019-06-17 09:19:19,599 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta/lib
2019-06-17 09:19:19,599 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-yocto-bsp/lib
2019-06-17 09:19:19,599 - oe-selftest - INFO - 	      /buildarea5/chenqi/SWAT/poky/meta-selftest/lib
2019-06-17 09:19:19,602 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
2019-06-17 09:19:24,368 - oe-selftest - INFO - Adding: "include selftest.inc" in /buildarea5/chenqi/SWAT/poky/build-selftest/conf/local.conf
2019-06-17 09:19:24,368 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2019-06-17 09:19:24,369 - oe-selftest - INFO - test_archiver_allows_to_filter_on_recipe_name (archiver.Archiver)
2019-06-17 09:19:24,369 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,369 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,369 - oe-selftest - INFO - test_archiver_filters_by_type (archiver.Archiver)
2019-06-17 09:19:24,370 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,370 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,370 - oe-selftest - INFO - test_archiver_filters_by_type_and_name (archiver.Archiver)
2019-06-17 09:19:24,370 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,371 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,371 - oe-selftest - INFO - test_archiver_srpm_mode (archiver.Archiver)
2019-06-17 09:19:24,371 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "archiver"'
2019-06-17 09:19:24,372 - oe-selftest - INFO - Skip by the command line argument "archiver"
2019-06-17 09:19:24,372 - oe-selftest - INFO - test_bitbakelayers_add_remove (bblayers.BitbakeLayers)
2019-06-17 09:19:24,373 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "bblayers"'
2019-06-17 09:19:24,373 - oe-selftest - INFO - Skip by the command line argument "bblayers"
2019-06-17 09:19:24,373 - oe-selftest - INFO - test_bitbakelayers_createlayer (bblayers.BitbakeLayers)
2019-06-17 09:19:24,373 - oe-selftest - INFO -  ... skipped 'Skip by the command line argument "bblayers"'
2019-06-17 09:19:24,374 - oe-selftest - INFO - Skip by the command line argument "bblayers"
[snip]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/context.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 0962704..5824489 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -9,6 +9,7 @@ import json
 import time
 import logging
 import collections
+import unittest
 
 from oeqa.core.loader import OETestLoader
 from oeqa.core.runner import OETestRunner
@@ -45,10 +46,14 @@ class OETestContext(object):
     def skipTests(self, skips):
         if not skips:
             return
+        def skipfuncgen(skipmsg):
+            def func():
+                raise unittest.SkipTest(skipmsg)
+            return func
         for test in self.suites:
             for skip in skips:
                 if test.id().startswith(skip):
-                    setattr(test, 'setUp', lambda: test.skipTest('Skip by the command line argument "%s"' % skip))
+                    setattr(test, 'setUp', skipfuncgen('Skip by the command line argument "%s"' % skip))
 
     def loadTests(self, module_paths, modules=[], tests=[],
             modules_manifest="", modules_required=[], filters={}):
-- 
1.9.1


