Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 89F647FC78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 03:11:32 +0000 (UTC)
IronPort-SDR: oD0eD/AW5NKNO5zb0GtQuw1U9asgEy+sXC6G9tbSgpVMvilZilWCYn845ur/aNqs72YCa8HEZW
	VOyIu52uCy9d/2cqy2yKMolyiFSDGOwRRcleOB1Vo9unxCHyxFNWb6CvFFos0NCS6dmk8CSLPV
	DRUwBmwkZ5vjUQ+h0CIF2i0CkKG5WRi5LHFDngeyk0pSyW4Z6ZfAHMBURBCBO9yg9gtLyd5/e7
	xgMAncYFpP6LAcovmLogZ3W8FgzDvfenz5yEaay7X+a2E0Zy+tdGBeMz4Sc3ABB3mVVrjYboki
	3XQ=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3360220"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 04:11:26 +0100
Message-Id: <20191211031126.22782-8-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211031126.22782-1-pkj@axis.com>
References: <20191211031126.22782-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 8/8] incompatible_lic.py: Add tests for incompatible licenses with wildcards
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
X-List-Received-Date: Wed, 11 Dec 2019 03:11:33 -0000
Content-Transfer-Encoding: 8bit

Suggested-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New in this patch set.

 .../oeqa/selftest/cases/incompatible_lic.py   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

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


