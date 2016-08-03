Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC6773289
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 13:32:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 03 Aug 2016 06:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="1029002162"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2016 06:32:26 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 16:32:15 +0300
Message-Id: <1470231135-2058-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470231135-2058-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470231135-2058-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 2/2] license: simple verification of LICENSE_<pkg> values
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
X-List-Received-Date: Wed, 03 Aug 2016 13:32:52 -0000

LICENSE should be a superset of all LICENSE_<pkg> values. That is,
LICENSE should contain all licenses and LICENSE_<pkg> can be used to
"filter" this on a per-package basis. LICENSE_<pkg> shouldn't contain
anything that isn't specified in LICENSE.

This patch implements simple checking of LICENSE_<pkg> values. It does
do not do advanced parsing/matching of license expressions, but,
checks that all licenses mentioned in LICENSE_<pkg> are also specified in
LICENSE. A warning is printed if problems are found.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/base.bbclass | 13 +++++++++++++
 meta/lib/oe/license.py    | 18 ++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5d8e8d6..32aca31 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -545,6 +545,19 @@ python () {
                 if pn in incompatwl:
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
 
+        # Try to verify per-package (LICENSE_<pkg>) values. LICENSE should be a
+        # superset of all per-package licenses. We do not do advanced (pattern)
+        # matching of license expressions - just check that all license strings
+        # in LICENSE_<pkg> are found in LICENSE.
+        license_set = oe.license.list_licenses(license)
+        for pkg in d.getVar('PACKAGES', True).split():
+            pkg_license = d.getVar('LICENSE_' + pkg, True)
+            if pkg_license:
+                unlisted = oe.license.list_licenses(pkg_license) - license_set
+                if unlisted:
+                    bb.warn("LICENSE_%s includes licenses (%s) that are not "
+                            "listed in LICENSE" % (pkg, ' '.join(unlisted)))
+
     needsrcrev = False
     srcuri = d.getVar('SRC_URI', True)
     for uri in srcuri.split():
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 39ef965..8d2fd17 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -215,3 +215,21 @@ def manifest_licenses(licensestr, dont_want_licenses, canonical_license, d):
     manifest.licensestr = manifest.licensestr.replace('[', '(').replace(']', ')')
 
     return (manifest.licensestr, manifest.licenses)
+
+class ListVisitor(LicenseVisitor):
+    """Record all different licenses found in the license string"""
+    def __init__(self):
+        self.licenses = set()
+
+    def visit_Str(self, node):
+        self.licenses.add(node.s)
+
+def list_licenses(licensestr):
+    """Simply get a list of all licenses mentioned in a license string.
+       Binary operators are not applied or taken into account in any way"""
+    visitor = ListVisitor()
+    try:
+        visitor.visit_string(licensestr)
+    except SyntaxError as exc:
+        raise LicenseSyntaxError(licensestr, exc)
+    return visitor.licenses
-- 
2.6.6


