Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB8EE6B8A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:56:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2013 02:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="369662430"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Aug 2013 02:56:53 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7B2446A4092;
	Wed, 28 Aug 2013 02:56:51 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 12:56:45 +0300
Message-Id: <1377683805-12957-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: remove some unnecessary checks from setUpModule
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
X-List-Received-Date: Wed, 28 Aug 2013 09:56:54 -0000

These checks are unnecessary.
setUpModule is run when a module is loaded and we
shouldn't run commands on the target here, (plus if
ssh doesn't work we error out in setup multiple times, instead
of skipping the real test, which might depend on test_ssh).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/date.py  | 3 ---
 meta/lib/oeqa/runtime/df.py    | 2 --
 meta/lib/oeqa/runtime/dmesg.py | 2 --
 meta/lib/oeqa/runtime/vnc.py   | 2 +-
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index d6c04cb..3b35964 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -2,9 +2,6 @@ from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
 import re
 
-def setUpModule():
-    skipModuleUnless(oeRuntimeTest.tc.target.run('which date')[0] == 0, "No date in image or no connection")
-
 class DateTest(oeRuntimeTest):
 
     def setUp(self):
diff --git a/meta/lib/oeqa/runtime/df.py b/meta/lib/oeqa/runtime/df.py
index c911989..b6da350 100644
--- a/meta/lib/oeqa/runtime/df.py
+++ b/meta/lib/oeqa/runtime/df.py
@@ -2,8 +2,6 @@ import unittest
 from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
 
-def setUpModule():
-    skipModuleUnless(oeRuntimeTest.tc.target.run('which df')[0] == 0, "No df in image or no connection")
 
 class DfTest(oeRuntimeTest):
 
diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
index 48370fb..a53d1f0 100644
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -2,8 +2,6 @@ import unittest
 from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
 
-def setUpModule():
-    skipModuleUnless(oeRuntimeTest.tc.target.run('which dmesg')[0] == 0, "No dmesg in image or no connection")
 
 class DmesgTest(oeRuntimeTest):
 
diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
index 9476184..ce11179 100644
--- a/meta/lib/oeqa/runtime/vnc.py
+++ b/meta/lib/oeqa/runtime/vnc.py
@@ -3,7 +3,7 @@ from oeqa.utils.decorators import *
 import re
 
 def setUpModule():
-    skipModuleUnless(oeRuntimeTest.tc.target.run('which x11vnc')[0] == 0, "No x11vnc in image")
+    skipModuleUnless(oeRuntimeTest.hasPackage('x11vnc'), "No x11vnc package in image")
 
 class VNCTest(oeRuntimeTest):
 
-- 
1.8.3.1


