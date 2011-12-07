Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RYNNC-0002I3-88
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 20:41:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2011 11:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99763159"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.36])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 11:34:57 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:34:42 -0800
Message-Id: <001c3b269cd430db9c42541d01241f8b567ea396.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 3/8] oe.license: add license flattening code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 19:41:46 -0000

From: Christopher Larson <kergoth@gmail.com>

This flattens a license tree by selecting one side of each OR operation
(chosen via the user supplied function).

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/license.py            |   30 ++++++++++++++++++++++++++++++
 meta/lib/oe/tests/test_license.py |   30 ++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index b230d3e..7ab66e7 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -30,3 +30,33 @@ class LicenseVisitor(ast.NodeVisitor):
             new_elements.append(element)
 
         self.visit(ast.parse(' '.join(new_elements)))
+
+class FlattenVisitor(LicenseVisitor):
+    """Flatten a license tree (parsed from a string) by selecting one of each
+    set of OR options, in the way the user specifies"""
+    def __init__(self, choose_licenses):
+        self.choose_licenses = choose_licenses
+        self.licenses = []
+        LicenseVisitor.__init__(self)
+
+    def visit_Str(self, node):
+        self.licenses.append(node.s)
+
+    def visit_BinOp(self, node):
+        if isinstance(node.op, ast.BitOr):
+            left = FlattenVisitor(self.choose_licenses)
+            left.visit(node.left)
+
+            right = FlattenVisitor(self.choose_licenses)
+            right.visit(node.right)
+
+            selected = self.choose_licenses(left.licenses, right.licenses)
+            self.licenses.extend(selected)
+        else:
+            self.generic_visit(node)
+
+def flattened_licenses(licensestr, choose_licenses):
+    """Given a license string and choose_licenses function, return a flat list of licenses"""
+    flatten = FlattenVisitor(choose_licenses)
+    flatten.visit_string(licensestr)
+    return flatten.licenses
diff --git a/meta/lib/oe/tests/test_license.py b/meta/lib/oe/tests/test_license.py
index cb949fc..c388886 100644
--- a/meta/lib/oe/tests/test_license.py
+++ b/meta/lib/oe/tests/test_license.py
@@ -36,3 +36,33 @@ class TestSingleLicense(unittest.TestCase):
             with self.assertRaises(oe.license.InvalidLicense) as cm:
                 self.parse(license)
             self.assertEqual(cm.exception.license, license)
+
+class TestSimpleCombinations(unittest.TestCase):
+    tests = {
+        "FOO&BAR": ["FOO", "BAR"],
+        "BAZ & MOO": ["BAZ", "MOO"],
+        "ALPHA|BETA": ["ALPHA"],
+        "BAZ&MOO|FOO": ["FOO"],
+        "FOO&BAR|BAZ": ["FOO", "BAR"],
+    }
+    preferred = ["ALPHA", "FOO", "BAR"]
+
+    def test_tests(self):
+        def choose(a, b):
+            if all(lic in self.preferred for lic in b):
+                return b
+            else:
+                return a
+
+        for license, expected in self.tests.items():
+            licenses = oe.license.flattened_licenses(license, choose)
+            self.assertListEqual(licenses, expected)
+
+class TestComplexCombinations(TestSimpleCombinations):
+    tests = {
+        "FOO & (BAR | BAZ)&MOO": ["FOO", "BAR", "MOO"],
+        "(ALPHA|(BETA&THETA)|OMEGA)&DELTA": ["OMEGA", "DELTA"],
+        "((ALPHA|BETA)&FOO)|BAZ": ["BETA", "FOO"],
+        "(GPL-2.0|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0", "BSD-4-clause", "MIT"],
+    }
+    preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0"]
-- 
1.7.1



