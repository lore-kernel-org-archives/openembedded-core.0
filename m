Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4at-0006iI-8p
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632935"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:09 -0800
Message-Id: <c48bbea1cea18f5c1f0beaa38e5fa23902b711aa.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/62] copyleft_compliance: add debug message with the reason for exclusion
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 37ed09e..fd04638 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -39,8 +39,9 @@ def copyleft_should_include(d):
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
 
-    if d.getVar('COPYLEFT_RECIPE_TYPE', True) not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
-        return False
+    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
+    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
+        return False, 'recipe type "%s" is excluded' % recipe_type
 
     include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
     exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
@@ -63,18 +64,27 @@ def copyleft_should_include(d):
         licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
-    except SyntaxError:
-        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
-
-    return all(include_license(lic) for lic in licenses)
+    except SyntaxError as exc:
+        bb.warn('%s: error when parsing the LICENSE variable: %s' % (d.getVar('P', True), exc))
+    else:
+        excluded = filter(lambda lic: not include_license(lic), licenses)
+        if excluded:
+            return False, 'recipe has excluded licenses: %s' % ', '.join(excluded)
+        else:
+            return True, None
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
     import os.path
     import shutil
 
-    if not copyleft_should_include(d):
+    p = d.getVar('P', True)
+    included, reason = copyleft_should_include(d)
+    if not included:
+        bb.debug(1, 'copyleft: %s is excluded: %s' % (p, reason))
         return
+    else:
+        bb.debug(1, 'copyleft: %s is included' % p)
 
     sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', 1)
     src_uri = d.getVar('SRC_URI', 1).split()
-- 
1.7.6.5



