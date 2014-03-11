Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A22C16F88B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:03:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3sj4010749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:54 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:22 +0800
Message-ID: <82dfd76f1ebe7801ed08efc1d93f91d73df5a035.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] archiver.bbclass: move a few code to copyleft_compliance.bbclass
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
X-List-Received-Date: Tue, 11 Mar 2014 17:03:55 -0000
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
 meta/classes/archiver.bbclass            | 19 -----------
 meta/classes/copyleft_compliance.bbclass | 55 ++++++++++++++++++++++++++++++--
 2 files changed, 53 insertions(+), 21 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b1109dc..54b498d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -35,25 +35,6 @@ do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
 # This is a convenience for the shell script to use it
 
 
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


