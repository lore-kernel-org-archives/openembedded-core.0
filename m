Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B759B71999
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 16:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9472A18CEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FnIdj-kD8Eun
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:17 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7A9B1180D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64E7E1E2C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59F2F1E2C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:17 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:17 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 4E3A721AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:17 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v8TG6Fb1004310
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 18:06:15 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v8TG6FLK004309
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Sep 2017 18:06:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 18:06:11 +0200
Message-Id: <20170929160611.4255-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] oeqa/core/loader: Make _built_modules_dict() support packages correctly
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
X-List-Received-Date: Fri, 29 Sep 2017 16:06:19 -0000

For test modules in a package, e.g., oelib.license, running
`oe-selftest -r oelib.license` or `oe-selftest -r
oelib.license.TestSimpleCombinations` would fail with a message that
the specified test cases could not be found. This was due to the
parsing in _built_modules_dict(), which failed to distinguish between
<package>.<module>.<class> and <module>.<class>.<testcase> and treated
both cases as the latter.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/core/loader.py | 50 +++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 332086a13d..975a081ba4 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -2,6 +2,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
+import re
 import sys
 import unittest
 import inspect
@@ -39,42 +40,19 @@ def _built_modules_dict(modules):
     if modules == None:
         return modules_dict
 
-    for m in modules:
-        ms = m.split('.')
-
-        if len(ms) == 1:
-            module_name = ms[0]
-            if not module_name in modules_dict:
-                modules_dict[module_name] = {}
-        elif len(ms) == 2:
-            module_name = ms[0]
-            class_name = ms[1]
-            if not module_name in modules_dict:
-                modules_dict[module_name] = {}
-            if not class_name in modules_dict[module_name]:
-                modules_dict[module_name][class_name] = []
-        elif len(ms) == 3:
-            module_name = ms[0]
-            class_name = ms[1]
-            test_name = ms[2]
-
-            if not module_name in modules_dict:
-                modules_dict[module_name] = {}
-            if not class_name in modules_dict[module_name]:
-                modules_dict[module_name][class_name] = []
-            if not test_name in modules_dict[module_name][class_name]:
-                modules_dict[module_name][class_name].append(test_name)
-        elif len(ms) >= 4:
-            module_name = '.'.join(ms[0:-2])
-            class_name = ms[-2]
-            test_name = ms[-1]
-
-            if not module_name in modules_dict:
-                modules_dict[module_name] = {}
-            if not class_name in modules_dict[module_name]:
-                modules_dict[module_name][class_name] = []
-            if not test_name in modules_dict[module_name][class_name]:
-                modules_dict[module_name][class_name].append(test_name)
+    for module in modules:
+        # Assumption: package and module names do not contain upper case
+        # characters, whereas class names do
+        m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)
+
+        module_name, class_name, test_name = m.groups()
+
+        if module_name and module_name not in modules_dict:
+            modules_dict[module_name] = {}
+        if class_name and class_name not in modules_dict[module_name]:
+            modules_dict[module_name][class_name] = []
+        if test_name and test_name not in modules_dict[module_name][class_name]:
+            modules_dict[module_name][class_name].append(test_name)
 
     return modules_dict
 
-- 
2.12.0


