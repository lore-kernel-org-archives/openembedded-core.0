Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06E176E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 12:48:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2014 04:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,667,1384329600"; d="scan'208";a="439792482"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 16 Jan 2014 04:48:08 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id E2F586A4093;
	Thu, 16 Jan 2014 04:48:03 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 14:48:59 +0200
Message-Id: <1389876539-31534-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] lib/oeqa: allow a layer to provide it's own TEST_TARGET class
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
X-List-Received-Date: Thu, 16 Jan 2014 12:48:08 -0000

Allows a layer to define new classes in <layer>/lib/oeqa/utils/controllers.py
and completely control or extend deployment of a target. (core currently
has QemuTarget and SimpleRemoteTarget).
The value of TEST_TARGET must be the name of the new class.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/targetcontrol.py  | 23 +++++++++++++++++++----
 meta/lib/oeqa/utils/__init__.py |  3 +++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index dee38ec..757f9d3 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -8,18 +8,33 @@ import os
 import shutil
 import subprocess
 import bb
-
+import traceback
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 
 
 def get_target_controller(d):
-    if d.getVar("TEST_TARGET", True) == "qemu":
+    testtarget = d.getVar("TEST_TARGET", True)
+    # old, simple names
+    if testtarget == "qemu":
         return QemuTarget(d)
-    elif d.getVar("TEST_TARGET", True) == "simpleremote":
+    elif testtarget == "simpleremote":
         return SimpleRemoteTarget(d)
     else:
-        bb.fatal("Please set a valid TEST_TARGET")
+        # use the class name
+        try:
+            # is it a core class defined here?
+            controller = getattr(__name__, testtarget)
+        except AttributeError:
+            # nope, perhaps a layer defined one
+            try:
+                module = __import__("oeqa.utils.controllers", globals(), locals(), [testtarget])
+                controller = getattr(module, testtarget)
+            except ImportError as e:
+                bb.fatal("Failed to import oeqa.utils.controllers:\n%s" % traceback.format_exc())
+            except AttributeError:
+                bb.fatal("\"%s\" is not a valid value for TEST_TARGET" % testtarget)
+        return controller(d)
 
 
 class BaseTarget(object):
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index e69de29..8eda927 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -0,0 +1,3 @@
+# Enable other layers to have modules in the same named directory
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
-- 
1.8.4.2


