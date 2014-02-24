Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA52B6EE66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:53:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1OFr1JN018759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 07:53:01 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 24 Feb 2014 07:53:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 23:56:08 +0800
Message-ID: <fcde865a8931e0ae6c187c049c373f951e5a47b1.1393256563.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] archiver.bbclass: move a few code to copyleft_compliance.bbclass
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
X-List-Received-Date: Mon, 24 Feb 2014 15:53:01 -0000
Content-Type: text/plain

Move the code which is only used by copyleft_compliance.bbclass from
archiver.bbclassc, and remove the "inherit archiver" from
copyleft_compliance.bbclass.

The archiver.bbclass is used for archiving various types of sources, but
the copyleft_compliance.bbclass is used for analysing the license, they
don't have much relationships.

[YOCTO #4986]
[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass            | 53 ------------------------------
 meta/classes/copyleft_compliance.bbclass | 55 ++++++++++++++++++++++++++++++--
 2 files changed, 53 insertions(+), 55 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ca6df43..c39416f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -35,25 +35,6 @@ ARCHIVER_OUTDIR = "${AR_TOPDIR}/${TARGET_SYS}/${PF}"
 # This is a convenience for the shell script to use it
 AR_EXCLUDE ?= "${@d.getVarFlag('ARCHIVER_MODE', 'diff-exclude', True)}"
 
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
-
 python () {
     pn = d.getVar('PN', True)
     packaging = d.getVar('IMAGE_PKGTYPE', True)
@@ -123,40 +104,6 @@ python () {
         d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
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
 def create_tarball(d, srcdir, suffix):
     """
     create the tarball from srcdir
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 32aa757..b47c2c9 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -6,11 +6,62 @@
 #
 # vi:sts=4:sw=4:et
 
-# Need the copyleft_should_include
-inherit archiver
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
 
 COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
 
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
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
     import os.path
-- 
1.8.3.1


