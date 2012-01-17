Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4at-0006h2-P7
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632939"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:10 -0800
Message-Id: <02985e579a87b49505dda91a679d81c41e2ed7f2.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/62] oe.license: add is_included convenience function
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

Given a license string and whitelist and blacklist, determine if the
license string matches the whitelist and does not match the blacklist.

When encountering an OR, it prefers the side with the highest weight (more
included licenses). It then checks the inclusion of the flattened list of
licenses from there.

Returns a tuple holding the boolean state and a list of the applicable
licenses which were excluded (or None, if the state is True)

Examples:

    is_included, excluded = oe.license.is_included(licensestr, ['GPL*', 'LGPL*'])
    is_included, excluded = oe.license.is_included(licensestr, blacklist=['Proprietary', 'CLOSED'])

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass |   23 +++---------------
 meta/lib/oe/license.py                   |   36 ++++++++++++++++++++++++++++++
 meta/lib/test.py                         |    3 ++
 3 files changed, 43 insertions(+), 19 deletions(-)
 create mode 100644 meta/lib/test.py

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index fd04638..6f058e0 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -46,32 +46,17 @@ def copyleft_should_include(d):
     include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
     exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
 
-    def include_license(license):
-        if any(fnmatch(license, pattern) for pattern in exclude):
-            return False
-        if any(fnmatch(license, pattern) for pattern in include):
-            return True
-        return False
-
-    def choose_licenses(a, b):
-        """Select the left option in an OR if all its licenses are to be included"""
-        if all(include_license(lic) for lic in a):
-            return a
-        else:
-            return b
-
     try:
-        licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+        is_included, excluded = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
     except SyntaxError as exc:
         bb.warn('%s: error when parsing the LICENSE variable: %s' % (d.getVar('P', True), exc))
     else:
-        excluded = filter(lambda lic: not include_license(lic), licenses)
-        if excluded:
-            return False, 'recipe has excluded licenses: %s' % ', '.join(excluded)
-        else:
+        if is_included:
             return True, None
+        else:
+            return False, 'recipe has excluded licenses: %s' % ', '.join(excluded)
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7ab66e7..3543cfe 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -3,6 +3,7 @@
 
 import ast
 import re
+from fnmatch import fnmatchcase as fnmatch
 
 class InvalidLicense(StandardError):
     def __init__(self, license):
@@ -60,3 +61,38 @@ def flattened_licenses(licensestr, choose_licenses):
     flatten = FlattenVisitor(choose_licenses)
     flatten.visit_string(licensestr)
     return flatten.licenses
+
+def is_included(licensestr, whitelist=None, blacklist=None):
+    """Given a license string and whitelist and blacklist, determine if the
+    license string matches the whitelist and does not match the blacklist.
+
+    Returns a tuple holding the boolean state and a list of the applicable
+    licenses which were excluded (or None, if the state is True)
+    """
+
+    def include_license(license):
+        return (any(fnmatch(license, pattern) for pattern in whitelist) and not
+                any(fnmatch(license, pattern) for pattern in blacklist))
+
+    def choose_licenses(alpha, beta):
+        """Select the option in an OR which is the 'best' (has the most
+        included licenses)."""
+        alpha_weight = len(filter(include_license, alpha))
+        beta_weight = len(filter(include_license, beta))
+        if alpha_weight > beta_weight:
+            return alpha
+        else:
+            return beta
+
+    if not whitelist:
+        whitelist = ['*']
+
+    if not blacklist:
+        blacklist = []
+
+    licenses = flattened_licenses(licensestr, choose_licenses)
+    excluded = filter(lambda lic: not include_license(lic), licenses)
+    if excluded:
+        return False, excluded
+    else:
+        return True, None
diff --git a/meta/lib/test.py b/meta/lib/test.py
new file mode 100644
index 0000000..12f4d83
--- /dev/null
+++ b/meta/lib/test.py
@@ -0,0 +1,3 @@
+import oe.license
+
+print(oe.license.is_included('LGPLv2.1 | GPLv3', ['*'], []))
-- 
1.7.6.5



