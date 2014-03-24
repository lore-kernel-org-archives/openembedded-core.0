Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 664F46EFFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 05:33:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O5XksA021404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Mar 2014 22:33:46 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 23 Mar 2014 22:33:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 13:39:26 +0800
Message-ID: <de07fab55872b0841d275612c89955f981c56ad2.1395639299.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395639298.git.liezhi.yang@windriver.com>
References: <cover.1395639298.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/3] archiver.bbclass: make it can filter the license
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
X-List-Received-Date: Mon, 24 Mar 2014 05:33:51 -0000
Content-Type: text/plain

* Filter the license (default: no), the recipe whose license in
  COPYLEFT_LICENSE_INCLUDE will be included, and in
  COPYLEFT_LICENSE_EXCLUDE will be excluded.

* The user can set the recipe type that would be archived (native,
  target, and so on), deafult to all.

The copyleft_filter.bbclass is come from copyleft_compliance.bbclass,
which is used by both copyleft_compliance.bbclass and archiver.bbclass.

[YOCTO #5740]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass            | 27 ++++++++++++--
 meta/classes/copyleft_compliance.bbclass | 56 +----------------------------
 meta/classes/copyleft_filter.bbclass     | 62 ++++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+), 57 deletions(-)
 create mode 100644 meta/classes/copyleft_filter.bbclass

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 7780c71..9aa9335 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -12,9 +12,23 @@
 # 5) The environment data, similar to 'bitbake -e recipe':
 #    ARCHIVER_MODE[dumpdata] = "1"
 # 6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
+# 7) Whether output the .src.rpm package:
+#    ARCHIVER_MODE[srpm] = "1"
+# 8) Filter the license, the recipe whose license in
+#    COPYLEFT_LICENSE_INCLUDE will be included, and in
+#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
+#    COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
+#    COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
+# 9) The recipe type that will be archived:
+#    COPYLEFT_RECIPE_TYPES = 'target'
 #
-# All of the above can be packed into a .src.rpm package: (when PACKAGES != "")
-# ARCHIVER_MODE[srpm] = "1"
+
+# Don't filter the license by default
+COPYLEFT_LICENSE_INCLUDE ?= ''
+COPYLEFT_LICENSE_EXCLUDE ?= ''
+# Create archive for all the recipe types
+COPYLEFT_RECIPE_TYPES ?= 'target native nativesdk cross crosssdk cross-canadian'
+inherit copyleft_filter
 
 ARCHIVER_MODE[srpm] ?= "0"
 ARCHIVER_MODE[src] ?= "patched"
@@ -38,6 +52,15 @@ do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
 python () {
     pn = d.getVar('PN', True)
 
+    if d.getVar('COPYLEFT_LICENSE_INCLUDE', True) or \
+            d.getVar('COPYLEFT_LICENSE_EXCLUDE', True):
+        included, reason = copyleft_should_include(d)
+        if not included:
+            bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
+            return
+        else:
+            bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
+
     ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
     ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
     ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index b47c2c9..907c183 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -2,66 +2,12 @@
 # Defaults to using symlinks, as it's a quick operation, and one can easily
 # follow the links when making use of the files (e.g. tar with the -h arg).
 #
-# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
-#
 # vi:sts=4:sw=4:et
 
-COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
-COPYLEFT_LICENSE_INCLUDE[type] = 'list'
-COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
-
-COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
-COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
-COPYLEFT_LICENSE_EXCLUDE[doc] = 'Space separated list of globs which exclude licenses'
-
-COPYLEFT_RECIPE_TYPE ?= '${@copyleft_recipe_type(d)}'
-COPYLEFT_RECIPE_TYPE[doc] = 'The "type" of the current recipe (e.g. target, native, cross)'
-
-COPYLEFT_RECIPE_TYPES ?= 'target'
-COPYLEFT_RECIPE_TYPES[type] = 'list'
-COPYLEFT_RECIPE_TYPES[doc] = 'Space separated list of recipe types to include'
-
-COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-canadian'
-COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
-COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
+inherit copyleft_filter
 
 COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
 
-def copyleft_recipe_type(d):
-    for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
-        if oe.utils.inherits(d, recipe_type):
-            return recipe_type
-    return 'target'
-
-def copyleft_should_include(d):
-    """
-    Determine if this recipe's sources should be deployed for compliance
-    """
-    import ast
-    import oe.license
-    from fnmatch import fnmatchcase as fnmatch
-
-    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
-    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
-        return False, 'recipe type "%s" is excluded' % recipe_type
-
-    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
-    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
-
-    try:
-        is_included, reason = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
-    except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
-    else:
-        if is_included:
-            if reason:
-                return True, 'recipe has included licenses: %s' % ', '.join(reason)
-            else:
-                return False, 'recipe does not include a copyleft license'
-        else:
-            return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
-
-
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
     import os.path
diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
new file mode 100644
index 0000000..2c1d8f1
--- /dev/null
+++ b/meta/classes/copyleft_filter.bbclass
@@ -0,0 +1,62 @@
+# Filter the license, the copyleft_should_include returns True for the
+# COPYLEFT_LICENSE_INCLUDE recipe, and False for the
+# COPYLEFT_LICENSE_EXCLUDE.
+#
+# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
+#
+# vi:sts=4:sw=4:et
+
+COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
+COPYLEFT_LICENSE_INCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
+
+COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
+COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
+COPYLEFT_LICENSE_EXCLUDE[doc] = 'Space separated list of globs which exclude licenses'
+
+COPYLEFT_RECIPE_TYPE ?= '${@copyleft_recipe_type(d)}'
+COPYLEFT_RECIPE_TYPE[doc] = 'The "type" of the current recipe (e.g. target, native, cross)'
+
+COPYLEFT_RECIPE_TYPES ?= 'target'
+COPYLEFT_RECIPE_TYPES[type] = 'list'
+COPYLEFT_RECIPE_TYPES[doc] = 'Space separated list of recipe types to include'
+
+COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-canadian'
+COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
+COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
+
+def copyleft_recipe_type(d):
+    for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
+        if oe.utils.inherits(d, recipe_type):
+            return recipe_type
+    return 'target'
+
+def copyleft_should_include(d):
+    """
+    Determine if this recipe's sources should be deployed for compliance
+    """
+    import ast
+    import oe.license
+    from fnmatch import fnmatchcase as fnmatch
+
+    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
+    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
+        return False, 'recipe type "%s" is excluded' % recipe_type
+
+    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
+    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
+
+    try:
+        is_included, reason = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
+    except oe.license.LicenseError as exc:
+        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+    else:
+        if is_included:
+            if reason:
+                return True, 'recipe has included licenses: %s' % ', '.join(reason)
+            else:
+                return False, 'recipe does not include a copyleft license'
+        else:
+            return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
+
+
-- 
1.8.3.1


