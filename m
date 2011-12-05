Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RXg0a-0008Qh-K8
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 22:23:32 +0100
Received: by ywb20 with SMTP id 20so4737701ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 13:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hom7fwyXUEdEIgrsqbb/Hx60bL5aJoU50VLhtDpnjdA=;
	b=jEMxp+YyRKn/a8QGmmr1syOWqWZQJBNKp77wtgGm7YuUn4PPvOcrzS2WlZVhiozmn5
	h0WVwBBE1Ge2/f9YG8wPiIvuR0dLU08K/vnRkiu/p6KB3zZlWLMbWzg5HO08hXG1JSkH
	FeWonbjXqezLILgFo1gvxebqOYIw8zjLCP6/k=
Received: by 10.236.180.101 with SMTP id i65mr15169577yhm.21.1323119805558;
	Mon, 05 Dec 2011 13:16:45 -0800 (PST)
Received: from auron.mgc.mentorg.com (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id i22sm33253970yhm.10.2011.12.05.13.16.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 13:16:45 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 14:16:28 -0700
Message-Id: <1323119789-23067-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
References: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
Subject: [PATCH 3/4] oe.license: add license flattening code
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
X-List-Received-Date: Mon, 05 Dec 2011 21:23:33 -0000

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
1.7.8



