Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1UFBr9-0003vx-TQ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:10:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2013 15:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="276776773"
Received: from wrk.jf.intel.com ([10.7.202.65])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2013 15:53:31 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 15:51:23 -0700
Message-Id: <accbc7b928cdb003d9ccf04901e2765712a3eb86.1363041436.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ef21fcf1adf6da74d0770982070dfc78db886154.1363041436.git.kevin.strasser@linux.intel.com>
References: <ef21fcf1adf6da74d0770982070dfc78db886154.1363041436.git.kevin.strasser@linux.intel.com>
In-Reply-To: <cover.1363041435.git.kevin.strasser@linux.intel.com>
References: <cover.1363041435.git.kevin.strasser@linux.intel.com>
Subject: [PATCH 2/2] archiver: fix archive filtering behavior
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 23:10:12 -0000

With the addition of sstate, ensure that archiving tasks are only
added to the build if they produce output in the directory specified
by the 'sstate-inputdirs' flag.

Move calls to 'tar_filter' and 'not_tarball' out to
archive-*-source.bbclass in order to filter out packages before their
archiving tasks are added to the build.

Additionally, negate the return value of copyleft_should_include in
tar_filter, so that packages that do not pass are in turn filtered out.

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 meta/classes/archive-configured-source.bbclass |   10 ++++++++--
 meta/classes/archive-original-source.bbclass   |   10 ++++++++--
 meta/classes/archive-patched-source.bbclass    |   10 ++++++++--
 meta/classes/archiver.bbclass                  |   13 +------------
 4 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 2738cab..0f2c9ee 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -14,11 +14,15 @@ addtask do_archive_configured_sources after do_configure
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz before do_build
+addtask do_dumpdata_create_diff_gz
 
 python () {
     pn = d.getVar('PN', True)
     packaging = d.getVar('IMAGE_PKGTYPE', True)
+
+    if tar_filter(d):
+        return
+
     d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
@@ -27,7 +31,9 @@ python () {
         configured sources and scripts/logs in ${DEPLOY_DIR}/sources.
         """
         d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
-        build_deps = ' %s:do_archive_configured_sources' %pn
+        build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
+        if not not_tarball(d):
+            build_deps += ' %s:do_archive_configured_sources' %pn
         if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
             build_deps += ' %s:do_archive_scripts_logs' %pn
             d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 2858d33..1e138ce 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -14,11 +14,15 @@ addtask do_archive_original_sources_patches after do_unpack
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz before do_build
+addtask do_dumpdata_create_diff_gz
 
 python () {
     pn = d.getVar('PN', True)
     packaging = d.getVar('IMAGE_PKGTYPE', True)
+
+    if tar_filter(d):
+        return
+
     d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
@@ -27,7 +31,9 @@ python () {
         original sources and scripts/logs in ${DEPLOY_DIR}/sources.
         """
         d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
-        build_deps = ' %s:do_archive_original_sources_patches' %pn
+        build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
+        if not not_tarball(d):
+            build_deps += ' %s:do_archive_original_sources_patches' %pn
         if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
             build_deps += ' %s:do_archive_scripts_logs' %pn
             d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index b47d36c..ac6d2c3 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -14,11 +14,15 @@ addtask do_archive_patched_sources after do_patch
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz before do_build
+addtask do_dumpdata_create_diff_gz
 
 python () {
     pn = d.getVar('PN', True)
     packaging = d.getVar('IMAGE_PKGTYPE', True)
+
+    if tar_filter(d):
+        return
+
     d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
@@ -27,7 +31,9 @@ python () {
         patched sources and scripts/logs in ${DEPLOY_DIR}/sources.
         """
         d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
-        build_deps = ' %s:do_archive_patched_sources' %pn
+        build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
+        if not not_tarball(d):
+            build_deps += ' %s:do_archive_patched_sources' %pn
         if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
             build_deps += ' %s:do_archive_scripts_logs' %pn
             d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 4323827..ed07b2e 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -75,10 +75,7 @@ def tar_filter(d):
     """
     if d.getVar('FILTER', True) == "yes":
         included, reason = copyleft_should_include(d)
-        if not included:
-            return False
-        else:
-            return True
+        return not included
     else:
         return False
 
@@ -400,8 +397,6 @@ def archive_sources_patches(d, stage_name):
     import shutil
 
     check_archiving_type(d)
-    if not_tarball(d) or tar_filter(d):
-        return
 
     source_tar_name = archive_sources(d, stage_name)
     if stage_name == "prepatch":
@@ -431,8 +426,6 @@ def archive_scripts_logs(d):
     """
     import shutil
 
-    if tar_filter(d):
-        return
     work_dir = d.getVar('WORKDIR', True)
     temp_dir = os.path.join(work_dir, 'temp')
     source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
@@ -459,8 +452,6 @@ def dumpdata(d):
     kinds of variables and functions when running a task
     """
 
-    if tar_filter(d):
-        return
     workdir = bb.data.getVar('WORKDIR', d, 1)
     distro = bb.data.getVar('DISTRO', d, 1)
     s = d.getVar('S', True)
@@ -491,8 +482,6 @@ def create_diff_gz(d):
     import shutil
     import subprocess
 
-    if tar_filter(d):
-        return
     work_dir = d.getVar('WORKDIR', True)
     exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
     pf = d.getVar('PF', True)
-- 
1.7.9.5



