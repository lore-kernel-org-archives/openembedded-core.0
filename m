Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id B6A017FAA3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 05:38:20 +0000 (UTC)
IronPort-SDR: d2Le6QToHfneGE6DRrlycY/cQOzFQWQN5xYRQMe664wuNM2dmHPfsLTKoFFx9ksEkrVskc5ORD
	B+Tae6nrniZ9m+aXJLwzW+goX6U4+vlIF1jxt3yQtk7ZX3Jr+3WHXsoC77PUij9dOg6sZ063LF
	d2Ixttt0E0p/8a8cumnXrlcLG/FE4G65OqC9b19nEoJ1xayTyuvnx9aKODItuYuzp7pq/JlGtN
	oaRlQjVwr2OksLYcRu6z0u1IgKQIfs84a6RM7CIJxVkLlJFvpmkEILfYGCsIk9whGEB/8lI6fE
	eVE=
X-IronPort-AV: E=Sophos;i="5.69,286,1571695200"; 
   d="scan'208";a="3353227"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2019 06:38:13 +0100
Message-Id: <20191207053815.1757-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191207053815.1757-1-pkj@axis.com>
References: <20191207053815.1757-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 5/7] base.bbclass: Report only the licenses that are incompatible for a package
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
X-List-Received-Date: Sat, 07 Dec 2019 05:38:22 -0000
Content-Transfer-Encoding: 8bit

Instead of reporting ${LICENSE} when a package is identified as using
an incompatible license, report the license(s) that are actually
incompatible.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/base.bbclass                     | 26 ++++++++++++-------
 .../oeqa/selftest/cases/incompatible_lic.py   |  6 ++---
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5176168cf8..87d8ba2cf8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -547,24 +547,30 @@ python () {
                 bb.note("Including %s as buildable despite it having an incompatible license because it has been whitelisted" % pn)
             else:
                 pkgs = d.getVar('PACKAGES').split()
-                skipped_pkgs = []
+                skipped_pkgs = {}
                 unskipped_pkgs = []
                 for pkg in pkgs:
-                    if incompatible_license(d, bad_licenses, pkg):
-                        skipped_pkgs.append(pkg)
+                    incompatible_lic = incompatible_license(d, bad_licenses, pkg)
+                    if incompatible_lic:
+                        skipped_pkgs[pkg] = incompatible_lic
                     else:
                         unskipped_pkgs.append(pkg)
-                all_skipped = skipped_pkgs and not unskipped_pkgs
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
-                        bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + license)
+                        bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
                         mlprefix = d.getVar('MLPREFIX')
-                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
+                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, ' '.join(skipped_pkgs[pkg]))
                     for pkg in unskipped_pkgs:
-                        bb.debug(1, "INCLUDING the package " + pkg)
-                elif all_skipped or incompatible_license(d, bad_licenses):
-                    bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, license))
-                    raise bb.parse.SkipRecipe("it has an incompatible license: %s" % license)
+                        bb.debug(1, "Including the package %s" % pkg)
+                else:
+                    incompatible_lic = incompatible_license(d, bad_licenses)
+                    for pkg in skipped_pkgs:
+                        incompatible_lic += skipped_pkgs[pkg]
+                    incompatible_lic = sorted(list(set(incompatible_lic)))
+
+                    if incompatible_lic:
+                        bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
+                        raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
         # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
         # superset of all per-package licenses. We do not do advanced (pattern)
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index ad878571b5..9d1e801117 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -4,7 +4,7 @@ from oeqa.utils.commands import bitbake
 class IncompatibleLicenseTests(OESelftestTestCase):
 
     def lic_test(self, pn, pn_lic, lic):
-        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has an incompatible license: %s' % (pn, pn, pn_lic)
+        error_msg = 'ERROR: Nothing PROVIDES \'%s\'\n%s was skipped: it has incompatible license(s): %s' % (pn, pn, pn_lic)
 
         self.write_config("INCOMPATIBLE_LICENSE += \"%s\"" % (lic))
 
@@ -27,12 +27,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
     # license
     def test_incompatible_spdx_license_alias(self):
-        self.lic_test('incompatible-license-alias', 'GPLv3', 'GPL-3.0')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPL-3.0')
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains this alias
     def test_incompatible_alias_spdx_license_alias(self):
-        self.lic_test('incompatible-license-alias', 'GPLv3', 'GPLv3')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3')
 
     # Verify that a package with a non-SPDX license (neither in
     # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
-- 
2.21.0


