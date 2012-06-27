Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZZ-0001h3-3X
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344564"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:22 -0700
Message-Id: <df58d93d9ab6eaecd26ba0b84eea747ab0d71700.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/20] archiver.bbclass: Add the function of filtering packages
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:30 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This function can miss packages whose license is in
"COPYLEFT_LICENSE_EXCLUDE" and tarball packages with license in
"COPYLEFT_LICENSE_INCLUDE".

[YOCTO #2473]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/classes/archiver.bbclass |   71 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 70 insertions(+), 1 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 083bb1d..2b5404f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -10,6 +10,68 @@ SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type')
                                     if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
 SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE','type') \
                                  if d.getVarFlag('ARCHIVER_MODE', 'log_type')!= 'none' else 'tar'}'
+FILTER ?= '${@d.getVarFlag('ARCHIVER_MODE','filter') \
+           if d.getVarFlag('ARCHIVER_MODE', 'filter')!= 'none' else 'no'}'
+
+
+COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
+COPYLEFT_LICENSE_INCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
+
+COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
+COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
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
+    """Determine if this recipe's sources should be deployed for compliance"""
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
+            return True, 'recipe has included licenses: %s' % ', '.join(reason)
+        else:
+            return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
+
+def tar_filter(d):
+    """Only tarball the packages belonging to COPYLEFT_LICENSE_INCLUDE and miss packages in COPYLEFT_LICENSE_EXCLUDE. Don't tarball any packages when \"FILTER\" is \"no\""""
+    if d.getVar('FILTER', True).upper() == "YES":
+        included, reason = copyleft_should_include(d)
+        if not included:
+                return False
+        else:
+                return True
+    else:
+        return False
 
 def get_bb_inc(d):
 	'''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
@@ -293,7 +355,7 @@ def archive_sources_patches(d,stage_name):
 	import shutil
 
 	check_archiving_type(d)	
-	if not_tarball(d):
+	if not_tarball(d) or tar_filter(d):
 		return
 	
 	source_tar_name = archive_sources(d,stage_name)
@@ -320,6 +382,8 @@ def archive_sources_patches(d,stage_name):
 def archive_scripts_logs(d):
 	'''archive scripts and logs. scripts include .bb and .inc files and logs include stuff in "temp".'''
 
+        if tar_filter(d):
+                return
 	work_dir = d.getVar('WORKDIR', True)
 	temp_dir = os.path.join(work_dir,'temp')
 	source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
@@ -340,6 +404,9 @@ def archive_scripts_logs(d):
 
 def dumpdata(d):
 	'''dump environment to "${P}-${PR}.showdata.dump" including all kinds of variables and functions when running a task'''
+
+        if tar_filter(d):
+                return
 	workdir = bb.data.getVar('WORKDIR', d, 1)
 	distro = bb.data.getVar('DISTRO', d, 1)
 	s = d.getVar('S', True)
@@ -367,6 +434,8 @@ def create_diff_gz(d):
 	import shutil
 	import subprocess
 
+        if tar_filter(d):
+                return
 	work_dir = d.getVar('WORKDIR', True)
 	exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
 	pf = d.getVar('PF', True)
-- 
1.7.7.6



