Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp7.bon.at (bsmtp7.bon.at [213.33.87.19])
	by mail.openembedded.org (Postfix) with ESMTP id F09157E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:26:22 +0000 (UTC)
Received: from qschulz.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp7.bon.at (Postfix) with ESMTPSA id 45NXPC2yBkz5tlF;
	Tue, 11 Jun 2019 16:26:23 +0200 (CEST)
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:26:07 +0200
Message-Id: <20190611142607.18038-2-quentin.schulz@streamunlimited.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>,
	andriy.danylovskyy@streamunlimited.com, bunk@stusta.de
Subject: [PATCH v4 2/2] selftests: add tests for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 14:26:23 -0000

One bug went unnoticed without these selftests: an INCOMPATIBLE_LICENSE
with a non-SPDX license for a package with that non-SPDX license wasn't
enforcing the denial of build for said package.

While adding a test for that particular case, let's add a few more so
that we cover a handful more use cases of INCOMPATIBLE_LICENSE.

Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
---

added in v4

 .../license/incompatible-license-alias.bb     |  3 ++
 .../license/incompatible-license.bb           |  3 ++
 .../license/incompatible-nonspdx-license.bb   |  3 ++
 .../oeqa/selftest/cases/incompatible_lic.py   | 42 +++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 meta-selftest/recipes-test/license/incompatible-license-alias.bb
 create mode 100644 meta-selftest/recipes-test/license/incompatible-license.bb
 create mode 100644 meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/incompatible_lic.py

diff --git a/meta-selftest/recipes-test/license/incompatible-license-alias.bb b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
new file mode 100644
index 0000000000..e0b4e13c26
--- /dev/null
+++ b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
@@ -0,0 +1,3 @@
+SUMMARY = "Recipe with an alias of an SPDX license"
+DESCRIPTION = "Is licensed with an alias of an SPDX license to be used for testing"
+LICENSE = "GPLv3"
diff --git a/meta-selftest/recipes-test/license/incompatible-license.bb b/meta-selftest/recipes-test/license/incompatible-license.bb
new file mode 100644
index 0000000000..1728ad76b7
--- /dev/null
+++ b/meta-selftest/recipes-test/license/incompatible-license.bb
@@ -0,0 +1,3 @@
+SUMMARY = "Recipe with an SPDX license"
+DESCRIPTION = "Is licensed with an SPDX license to be used for testing"
+LICENSE = "GPL-3.0"
diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
new file mode 100644
index 0000000000..35af0966ef
--- /dev/null
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -0,0 +1,3 @@
+SUMMARY = "Recipe with a non-SPDX license"
+DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
+LICENSE = "FooLicense"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
new file mode 100644
index 0000000000..4e0d1f53d3
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -0,0 +1,42 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+from oeqa.core.decorator.oeid import OETestID
+
+class IncompatibleLicenseTests(OESelftestTestCase):
+
+    def test_lic(self, pn, pn_lic, lic):
+        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has an incompatible license: %s' % (pn, pn, pn_lic)
+
+        self.write_config("INCOMPATIBLE_LICENSE += \"%s\"" % (lic))
+
+        result = bitbake(pn, ignore_status=True)
+        if error_msg not in result.output:
+            raise AssertionError(result.output)
+
+    # Verify that a package with an SPDX license (from SRC_DISTRIBUTE_LICENSES)
+    # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
+    def test_incompatible_spdx_license(self):
+        self.test_lic('incompatible-license', 'GPL-3.0', 'GPL-3.0')
+
+    # Verify that a package with an SPDX license (from SRC_DISTRIBUTE_LICENSES)
+    # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
+    # SPDXLICENSEMAP) of this SPDX license
+    def test_incompatible_alias_spdx_license(self):
+        self.test_lic('incompatible-license', 'GPL-3.0', 'GPLv3')
+
+    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
+    # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
+    # license
+    def test_incompatible_spdx_license_alias(self):
+        self.test_lic('incompatible-license-alias', 'GPLv3', 'GPL-3.0')
+
+    # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
+    # license cannot be built when INCOMPATIBLE_LICENSE contains this alias
+    def test_incompatible_alias_spdx_license_alias(self):
+        self.test_lic('incompatible-license-alias', 'GPLv3', 'GPLv3')
+
+    # Verify that a package with a non-SPDX license (neither in
+    # SRC_DISTRIBUTE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
+    # INCOMPATIBLE_LICENSE contains this license
+    def test_incompatible_nonspdx_license(self):
+        self.test_lic('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
-- 
2.17.1


