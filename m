Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC9A73DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:52:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 07:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,379,1427785200"; d="scan'208";a="724674998"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2015 07:52:16 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 14:52:17 +0000
Message-Id: <1c71f065442669e78c8901221be906d023be765c.1430923708.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1430923708.git.anibal.limon@linux.intel.com>
References: <cover.1430923708.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1430923708.git.anibal.limon@linux.intel.com>
References: <cover.1430923708.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] license_class: Generalize license_ok function
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
X-List-Received-Date: Wed, 06 May 2015 14:52:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add dont_want_licenses as parameter to license_ok function and move it
to oe.license module in order to use in other modules.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 21 ++++-----------------
 meta/lib/oe/license.py       | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 975867d..780b9d5 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -341,36 +341,23 @@ def incompatible_license(d, dont_want_licenses, package=None):
     take into consideration 'or' operand.  dont_want_licenses should be passed
     as canonical (SPDX) names.
     """
-    import re
     import oe.license
-    from fnmatch import fnmatchcase as fnmatch
     license = d.getVar("LICENSE_%s" % package, True) if package else None
     if not license:
         license = d.getVar('LICENSE', True)
 
-    def license_ok(license):
-        for dwl in dont_want_licenses:
-            # If you want to exclude license named generically 'X', we
-            # surely want to exclude 'X+' as well.  In consequence, we
-            # will exclude a trailing '+' character from LICENSE in
-            # case INCOMPATIBLE_LICENSE is not a 'X+' license.
-            lic = license
-            if not re.search('\+$', dwl):
-                lic = re.sub('\+', '', license)
-            if fnmatch(lic, dwl):
-                return False
-        return True
-
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
     def choose_lic_set(a, b):
-        return a if all(license_ok(lic) for lic in a) else b
+        return a if all(oe.license.license_ok(lic, dont_want_licenses) \
+		 for lic in a) else b
 
     try:
         licenses = oe.license.flattened_licenses(license, choose_lic_set)
     except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('P', True), exc))
-    return any(not license_ok(canonical_license(d, l)) for l in licenses)
+    return any(not oe.license.license_ok(canonical_license(d, l), \
+		dont_want_licenses) for l in licenses)
 
 def check_license_flags(d):
     """
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 31ca15b..bc146a28 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -5,6 +5,20 @@ import ast
 import re
 from fnmatch import fnmatchcase as fnmatch
 
+def license_ok(license, dont_want_licenses):
+    """ Return False if License exist in dont_want_licenses else True """
+    for dwl in dont_want_licenses:
+        # If you want to exclude license named generically 'X', we
+        # surely want to exclude 'X+' as well.  In consequence, we
+        # will exclude a trailing '+' character from LICENSE in
+        # case INCOMPATIBLE_LICENSE is not a 'X+' license.
+        lic = license
+        if not re.search('\+$', dwl):
+            lic = re.sub('\+', '', license)
+        if fnmatch(lic, dwl):
+            return False
+    return True
+
 class LicenseError(Exception):
     pass
 
-- 
1.8.4.5


