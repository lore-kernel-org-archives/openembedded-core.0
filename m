Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9C47FBDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:48:24 +0000 (UTC)
IronPort-SDR: GtHgRUFP/liD85VFhRe39YtnUPw5q6t4VXW/YXloYpEIaEgReUclf5hduVTfI4tjzr9xRlj7H4
	n6MsKeBxmM0vXUX1B4FbSJca2Qy8ttaAzhPTtpEFO/TehkfNkjA0RLi6sQxgJizNxPAzASMIR1
	zpW3WyK3vIfa/ubBoPSs8HLLuu8LQAxAQeJ7vwcxkIePbeIxxAW253G6g44VVwME17a2BIyI3k
	QjmCFBVNJpUeHGhyBNtS3LXIrMJ7BlLX3kJZDFejp/ENc6ozBRnE7EV819kk6l6ebNNVVNhhQl
	Qcs=
X-IronPort-AV: E=Sophos;i="5.69,302,1571695200"; 
   d="scan'208";a="3390378"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 17:48:20 +0100
Message-Id: <20191211164820.26588-8-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211164820.26588-1-pkj@axis.com>
References: <20191211164820.26588-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3 8/8] incompatible_lic.py: Add tests for incompatible licenses with wildcards
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
X-List-Received-Date: Wed, 11 Dec 2019 16:48:25 -0000
Content-Transfer-Encoding: 8bit

Suggested-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New in this patch set.
PATCHv3: Added the missing incompatible-licenses.bb recipe file.

 .../license/incompatible-licenses.bb          |  3 ++
 .../oeqa/selftest/cases/incompatible_lic.py   | 42 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-selftest/recipes-test/license/incompatible-licenses.bb

diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
new file mode 100644
index 0000000000..9c1545efba
--- /dev/null
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -0,0 +1,3 @@
+SUMMARY = "Recipe with multiple SPDX licenses"
+DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
+LICENSE = "GPL-2.0 & GPL-3.0 & LGPL-3.0"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 458a940618..3eabd79097 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -23,6 +23,18 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     def test_incompatible_alias_spdx_license(self):
         self.lic_test('incompatible-license', 'GPL-3.0', 'GPLv3')
 
+    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
+    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded license
+    # matching this SPDX license
+    def test_incompatible_spdx_license_wildcard(self):
+        self.lic_test('incompatible-license', 'GPL-3.0', '*GPL-3.0')
+
+    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
+    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded alias
+    # license matching this SPDX license
+    def test_incompatible_alias_spdx_license_wildcard(self):
+        self.lic_test('incompatible-license', 'GPL-3.0', '*GPLv3')
+
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
     # license
@@ -34,6 +46,36 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     def test_incompatible_alias_spdx_license_alias(self):
         self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3')
 
+    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
+    # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
+    # license matching this SPDX license
+    def test_incompatible_spdx_license_alias_wildcard(self):
+        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPL-3.0')
+
+    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
+    # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
+    # alias license matching the SPDX license
+    def test_incompatible_alias_spdx_license_alias_wildcard(self):
+        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPLv3')
+
+    # Verify that a package with multiple SPDX licenses (from
+    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains
+    # some of them
+    def test_incompatible_spdx_licenses(self):
+        self.lic_test('incompatible-licenses', 'GPL-3.0 LGPL-3.0', 'GPL-3.0 LGPL-3.0')
+
+    # Verify that a package with multiple SPDX licenses (from
+    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
+    # wildcard to some of them
+    def test_incompatible_spdx_licenses_wildcard(self):
+        self.lic_test('incompatible-licenses', 'GPL-3.0 LGPL-3.0', '*GPL-3.0')
+
+    # Verify that a package with multiple SPDX licenses (from
+    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
+    # wildcard matching all licenses
+    def test_incompatible_all_licenses_wildcard(self):
+        self.lic_test('incompatible-licenses', 'GPL-2.0 GPL-3.0 LGPL-3.0', '*')
+
     # Verify that a package with a non-SPDX license (neither in
     # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
     # INCOMPATIBLE_LICENSE contains this license
-- 
2.21.0


