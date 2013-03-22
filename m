Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1UJ8l2-0008Qv-9j
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 21:40:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2013 13:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="283374432"
Received: from wrk.jf.intel.com ([10.7.202.62])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2013 13:23:07 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 13:19:22 -0700
Message-Id: <722fd23d73a54996db9b282eddd5f310b59ce1e2.1363982857.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363982857.git.kevin.strasser@linux.intel.com>
References: <cover.1363982857.git.kevin.strasser@linux.intel.com>
In-Reply-To: <cover.1363982857.git.kevin.strasser@linux.intel.com>
References: <cover.1363982857.git.kevin.strasser@linux.intel.com>
Cc: kevstras@gmail.com
Subject: [PATCH 1/1] archiver: fix srpm archiving build errors
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
X-List-Received-Date: Fri, 22 Mar 2013 20:41:14 -0000

srpm archiving doesn't need to be handled as a different case
when deciding what archive tasks to add.

When srpm is selected as the archiving type, the scripts and logs
archive staging directory ${WORKDIR}/script-logs is cleaned, and
its contents moved out to ${WORKDIR}.

Now that we are including ${WORKDIR}/script-logs in sstate-inputdirs,
the directory must be preserved.

[YOCTO #4032]

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 meta/classes/archive-configured-source.bbclass |   25 +++++++++---------------
 meta/classes/archive-original-source.bbclass   |   25 +++++++++---------------
 meta/classes/archive-patched-source.bbclass    |   25 +++++++++---------------
 meta/classes/archiver.bbclass                  |    4 ----
 4 files changed, 27 insertions(+), 52 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 0f2c9ee..d346f69 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -24,24 +24,17 @@ python () {
         return
 
     d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
+    build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        """
-        If package type is not 'srpm' then add tasks to move archive packages of
-        configured sources and scripts/logs in ${DEPLOY_DIR}/sources.
-        """
+    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
+        build_deps += ' %s:do_archive_scripts_logs' %pn
+
+    if not not_tarball(d):
         d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
-        build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
-        if not not_tarball(d):
-            build_deps += ' %s:do_archive_configured_sources' %pn
-        if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-            build_deps += ' %s:do_archive_scripts_logs' %pn
-            d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
-        d.appendVarFlag('do_build', 'depends', build_deps)
-
-    else:
-        d.prependVarFlag('do_configure', 'postfuncs', "do_archive_configured_sources")
-        d.prependVarFlag('do_package_write_rpm', 'prefuncs', "do_archive_scripts_logs")
+        build_deps += ' %s:do_archive_configured_sources' %pn
+
+    d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
 ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 1e138ce..7258293 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -24,24 +24,17 @@ python () {
         return
 
     d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
+    build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        """
-        If package type is not 'srpm' then add tasks to move archive packages of
-        original sources and scripts/logs in ${DEPLOY_DIR}/sources.
-        """
+    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
+        build_deps += ' %s:do_archive_scripts_logs' %pn
+
+    if not not_tarball(d):
         d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
-        build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
-        if not not_tarball(d):
-            build_deps += ' %s:do_archive_original_sources_patches' %pn
-        if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-            build_deps += ' %s:do_archive_scripts_logs' %pn
-            d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
-        d.appendVarFlag('do_build', 'depends', build_deps)
-
-    else:
-        d.prependVarFlag('do_unpack', 'postfuncs', "do_archive_original_sources_patches")
-        d.prependVarFlag('do_package_write_rpm', 'prefuncs', "do_archive_scripts_logs")
+        build_deps += ' %s:do_archive_original_sources_patches' %pn
+
+    d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
 ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index ac6d2c3..9e5ec74 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -24,24 +24,17 @@ python () {
         return
 
     d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
+    build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        """
-        If package type is not 'srpm' then add tasks to move archive packages of
-        patched sources and scripts/logs in ${DEPLOY_DIR}/sources.
-        """
+    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
+        build_deps += ' %s:do_archive_scripts_logs' %pn
+
+    if not not_tarball(d):
         d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
-        build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
-        if not not_tarball(d):
-            build_deps += ' %s:do_archive_patched_sources' %pn
-        if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-            build_deps += ' %s:do_archive_scripts_logs' %pn
-            d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
-        d.appendVarFlag('do_build', 'depends', build_deps)
-
-    else:
-        d.prependVarFlag('do_patch', 'postfuncs', "do_archive_patched_sources")
-        d.prependVarFlag('do_package_write_rpm', 'prefuncs', "do_archive_scripts_logs")
+        build_deps += ' %s:do_archive_patched_sources' %pn
+
+    d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
 ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ed07b2e..6749d61 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -440,10 +440,6 @@ def archive_scripts_logs(d):
     tarlog = archive_logs(d, logdir, True)
 
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-        if os.path.exists(work_dir+ '/' + tarlog):
-            os.remove(work_dir+ '/' + tarlog)
-        shutil.move(os.path.join(logdir, '..', tarlog), work_dir)
-        shutil.rmtree(os.path.join(work_dir,'script-logs'))
         store_package(d, tarlog)
 
 def dumpdata(d):
-- 
1.7.9.5



