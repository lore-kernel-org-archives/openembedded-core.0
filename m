Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 757B9606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:30 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172555"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:31 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:07 -0600
Message-Id: <a441b35b571a2c8be5daf099c95be6f95c8b265d.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 02/32] oeqa/core: Add utils module for OEQA framework
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

misc: Functions for transform object to other types.
path: Functions for path handling.
test: Functions for operations related to test cases and suites.

[YOCTO #10232]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/utils/__init__.py |  0
 meta/lib/oeqa/core/utils/misc.py     | 37 +++++++++++++++++++
 meta/lib/oeqa/core/utils/path.py     | 14 +++++++
 meta/lib/oeqa/core/utils/test.py     | 71 ++++++++++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+)
 create mode 100644 meta/lib/oeqa/core/utils/__init__.py
 create mode 100644 meta/lib/oeqa/core/utils/misc.py
 create mode 100644 meta/lib/oeqa/core/utils/path.py
 create mode 100644 meta/lib/oeqa/core/utils/test.py

diff --git a/meta/lib/oeqa/core/utils/__init__.py b/meta/lib/oeqa/core/utils/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/core/utils/misc.py b/meta/lib/oeqa/core/utils/misc.py
new file mode 100644
index 0000000..6ae58ad
--- /dev/null
+++ b/meta/lib/oeqa/core/utils/misc.py
@@ -0,0 +1,37 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+def toList(obj, obj_type, obj_name="Object"):
+    if isinstance(obj, obj_type):
+        return [obj]
+    elif isinstance(obj, list):
+        return obj
+    else:
+        raise TypeError("%s must be %s or list" % (obj_name, obj_type))
+
+def toSet(obj, obj_type, obj_name="Object"):
+    if isinstance(obj, obj_type):
+        return {obj}
+    elif isinstance(obj, list):
+        return set(obj)
+    elif isinstance(obj, set):
+        return obj
+    else:
+        raise TypeError("%s must be %s or set" % (obj_name, obj_type))
+
+def strToList(obj, obj_name="Object"):
+    return toList(obj, str, obj_name)
+
+def strToSet(obj, obj_name="Object"):
+    return toSet(obj, str, obj_name)
+
+def intToList(obj, obj_name="Object"):
+    return toList(obj, int, obj_name)
+
+def dataStoteToDict(d, variables):
+    data = {}
+
+    for v in variables:
+        data[v] = d.getVar(v, True)
+
+    return data
diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/path.py
new file mode 100644
index 0000000..cb06523
--- /dev/null
+++ b/meta/lib/oeqa/core/utils/path.py
@@ -0,0 +1,14 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+
+def findFile(file_name, directory):
+    """
+        Search for a file in directory and returns its complete path.
+    """
+    for r, d, f in os.walk(directory):
+        if file_name in f:
+            return os.path.join(r, file_name)
+    return None
diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
new file mode 100644
index 0000000..820b997
--- /dev/null
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -0,0 +1,71 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import unittest
+
+def getSuiteCases(suite):
+    """
+        Returns individual test from a test suite.
+    """
+    tests = []
+    for item in suite:
+        if isinstance(item, unittest.suite.TestSuite):
+            tests.extend(getSuiteCases(item))
+        elif isinstance(item, unittest.TestCase):
+            tests.append(item)
+    return tests
+
+def getSuiteModules(suite):
+    """
+        Returns modules in a test suite.
+    """
+    modules = set()
+    for test in getSuiteCases(suite):
+        modules.add(getCaseModule(test))
+    return modules
+
+def getSuiteCasesInfo(suite, func):
+    """
+        Returns test case info from suite. Info is fetched from func.
+    """
+    tests = []
+    for test in getSuiteCases(suite):
+        tests.append(func(test))
+    return tests
+
+def getSuiteCasesNames(suite):
+    """
+        Returns test case names from suite.
+    """
+    return getSuiteCasesInfo(suite, getCaseMethod)
+
+def getSuiteCasesIDs(suite):
+    """
+        Returns test case ids from suite.
+    """
+    return getSuiteCasesInfo(suite, getCaseID)
+
+def getCaseModule(test_case):
+    """
+        Returns test case module name.
+    """
+    return test_case.__module__
+
+def getCaseClass(test_case):
+    """
+        Returns test case class name.
+    """
+    return test_case.__class__.__name__
+
+def getCaseID(test_case):
+    """
+        Returns test case complete id.
+    """
+    return test_case.id()
+
+def getCaseMethod(test_case):
+    """
+        Returns test case method name.
+    """
+    return getCaseID(test_case).split('.')[-1]
-- 
2.1.4


