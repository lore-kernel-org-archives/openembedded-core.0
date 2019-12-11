Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id B57BD7FC41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 03:11:31 +0000 (UTC)
IronPort-SDR: lrFk++YRYP/JFq4ofKwXhhTgKFGa2KN3VxJR4EoYAyDZGcpt3xuVje5vqjd/1iqRt1ldaIOVz3
	bYY/etAkGNwTezIYic0CqOl8h91NejOl+uSgODMi6AVCLYicyS3hv6143iBnD72XABlyCdiKrs
	e/hkQDVVmbaWFKf0wYA6yeB7i+V6Xzk7RlWROC0FcF6gc8hvUu1Lqbq2wlxkbUYmOlCqFPrqUg
	X4nYVlLNrpyO9KXlESeuRXYunMfbrE5k/5Lo/3+NdShwwPtc1hNzOWzDeN87FM/0TqnjZ81ShY
	J6A=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3360218"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 04:11:23 +0100
Message-Id: <20191211031126.22782-5-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211031126.22782-1-pkj@axis.com>
References: <20191211031126.22782-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv2 5/8] base.bbclass: Report only the licenses that are incompatible for a package
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
X-List-Received-Date: Wed, 11 Dec 2019 03:11:32 -0000
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
index a3170d219c..145daea3ec 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -542,24 +542,30 @@ python () {
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


