Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D448977A60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 15:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 30E7718BEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CCnT1wo1qJ8h
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:38 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3F12418C1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 297351A2A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EB311A2A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:38 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:38 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 130BA2205
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:38 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v8TFqaDw001350
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 17:52:36 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v8TFqaFe001349
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Sep 2017 17:52:36 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 17:52:34 +0200
Message-Id: <20170929155234.1308-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2] license.py: Correct selection of licenses in is_included()
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
X-List-Received-Date: Fri, 29 Sep 2017 15:52:40 -0000

When faced with multiple sets of licenses combined with | (OR), it was
possible for oe.license.is_included() to choose a set of licenses with
a blacklisted license and then report failure, even if choosing
another set of licenses would have resulted in a successful
result. This happened when the chosen set still contained more
whitelisted licenses than the other set.

This change makes sure a set with any blacklisted license is always
considered with a lower weight than a set with only whitelisted
licenses.

Example: Faced with the license string "GPL-3.0 & GPL-2.0 & LGPL-2.1 |
Proprietary" and with "GPL-3.0" being blacklisted, the old code would
report a failure since "GPL-3.0 & GPL-2.0 & LGPL-2.1" still contains
more whitelisted licenses than "Proprietary" does.

This change also adds a unit test for oe.license.is_included().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Correct the parent class for TestIsIncluded, a change I had
forgotten to git --amend when going from Pyro to Rocko.

 meta/lib/oe/license.py                        | 18 +++++++++++-----
 meta/lib/oeqa/selftest/cases/oelib/license.py | 31 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 8d2fd1709c..ca385d5187 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -106,7 +106,8 @@ def is_included(licensestr, whitelist=None, blacklist=None):
     license string matches the whitelist and does not match the blacklist.
 
     Returns a tuple holding the boolean state and a list of the applicable
-    licenses which were excluded (or None, if the state is True)
+    licenses that were excluded if state is False, or the licenses that were
+    included if the state is True.
     """
 
     def include_license(license):
@@ -117,10 +118,17 @@ def is_included(licensestr, whitelist=None, blacklist=None):
 
     def choose_licenses(alpha, beta):
         """Select the option in an OR which is the 'best' (has the most
-        included licenses)."""
-        alpha_weight = len(list(filter(include_license, alpha)))
-        beta_weight = len(list(filter(include_license, beta)))
-        if alpha_weight > beta_weight:
+        included licenses and no excluded licenses)."""
+        # The factor 1000 below is arbitrary, just expected to be much larger
+        # that the number of licenses actually specified. That way the weight
+        # will be negative if the list of licenses contains an excluded license,
+        # but still gives a higher weight to the list with the most included
+        # licenses.
+        alpha_weight = (len(list(filter(include_license, alpha))) -
+                        1000 * (len(list(filter(exclude_license, alpha))) > 0))
+        beta_weight = (len(list(filter(include_license, beta))) -
+                       1000 * (len(list(filter(exclude_license, beta))) > 0))
+        if alpha_weight >= beta_weight:
             return alpha
         else:
             return beta
diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index bfd9ed9c29..d7f91fb2f4 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -66,3 +66,34 @@ class TestComplexCombinations(TestSimpleCombinations):
         "(GPL-2.0|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0", "BSD-4-clause", "MIT"],
     }
     preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0"]
+
+class TestIsIncluded(TestCase):
+    tests = {
+        ("FOO | BAR", None, None):
+            [True, ["FOO"]],
+        ("FOO | BAR", None, "FOO"):
+            [True, ["BAR"]],
+        ("FOO | BAR", "BAR", None):
+            [True, ["BAR"]],
+        ("FOO | BAR & FOOBAR", "*BAR", None):
+            [True, ["BAR", "FOOBAR"]],
+        ("FOO | BAR & FOOBAR", None, "FOO*"):
+            [False, ["FOOBAR"]],
+        ("(FOO | BAR) & FOOBAR | BARFOO", None, "FOO"):
+            [True, ["BAR", "FOOBAR"]],
+        ("(FOO | BAR) & FOOBAR | BAZ & MOO & BARFOO", None, "FOO"):
+            [True, ["BAZ", "MOO", "BARFOO"]],
+        ("GPL-3.0 & GPL-2.0 & LGPL-2.1 | Proprietary", None, None):
+            [True, ["GPL-3.0", "GPL-2.0", "LGPL-2.1"]],
+        ("GPL-3.0 & GPL-2.0 & LGPL-2.1 | Proprietary", None, "GPL-3.0"):
+            [True, ["Proprietary"]],
+        ("GPL-3.0 & GPL-2.0 & LGPL-2.1 | Proprietary", None, "GPL-3.0 Proprietary"):
+            [False, ["GPL-3.0"]]
+    }
+
+    def test_tests(self):
+        for args, expected in self.tests.items():
+            is_included, licenses = oe.license.is_included(
+                args[0], (args[1] or '').split(), (args[2] or '').split())
+            self.assertEqual(is_included, expected[0])
+            self.assertListEqual(licenses, expected[1])
-- 
2.12.0


