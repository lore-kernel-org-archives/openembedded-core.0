Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C043E601DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 14:34:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2015 07:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="730261058"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2015 07:34:52 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 06:29:25 +0000
Message-Id: <1432276165-31516-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] copyleft_filter.bbclass: Allow to filter on name
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
X-List-Received-Date: Fri, 22 May 2015 14:34:51 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The archiver uses a license based filter to provide the source code.
This patch allows to search on name based on two new variables (SRC_INCLUDE_NAME,
SRC_EXCLUDE_NAME). Both variables are empty by default.
The filter by name has higher priority than the license filter.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/archiver.bbclass        | 14 ++++++--------
 meta/classes/copyleft_filter.bbclass | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b598aa3..138c407 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -52,14 +52,12 @@ do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
 python () {
     pn = d.getVar('PN', True)
 
-    if d.getVar('COPYLEFT_LICENSE_INCLUDE', True) or \
-            d.getVar('COPYLEFT_LICENSE_EXCLUDE', True):
-        included, reason = copyleft_should_include(d)
-        if not included:
-            bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
-            return
-        else:
-            bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
+    included, reason = should_include_src(d)
+    if not included:
+        bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
+        return
+    else:
+        bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
 
     ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
     ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index 2c1d8f1..d5c3b59 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -25,6 +25,14 @@ COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-
 COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
 COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
 
+SRC_INCLUDE_NAME ?= ''
+SRC_INCLUDE_NAME[type] = 'list'
+SRC_INCLUDE_NAME[doc] = 'Space separated list of recipe names to include'
+
+SRC_EXCLUDE_NAME ?= ''
+SRC_EXCLUDE_NAME[type] = 'list'
+SRC_EXCLUDE_NAME[doc] = 'Space separated list of recipe names to exclude'
+
 def copyleft_recipe_type(d):
     for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
         if oe.utils.inherits(d, recipe_type):
@@ -59,4 +67,24 @@ def copyleft_should_include(d):
         else:
             return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
 
+def should_include_src(d):
+    """
+    Determine if this recipe's source should be deployed
+    """
+    from fnmatch import fnmatchcase as fnmatch
+
+    if d.getVar('COPYLEFT_LICENSE_INCLUDE', True) or \
+            d.getVar('COPYLEFT_LICENSE_EXCLUDE', True):
+        is_included, reason = copyleft_should_include(d)
+
+    if any(fnmatch(d.getVar('PN', True), name) \
+            for name in oe.data.typed_value('SRC_INCLUDE_NAME', d)):
+        is_included, reason =  True, 'recipe included by name'
+    if any(fnmatch(d.getVar('PN', True), name) \
+            for name in oe.data.typed_value('SRC_EXCLUDE_NAME', d)):
+        is_included, reason = False, 'recipe excluded by name'
+
+    if 'reason' not in locals():
+        is_included, reason = False, 'recipe did not match any condition'
+    return is_included, reason
 
-- 
1.8.4.5


