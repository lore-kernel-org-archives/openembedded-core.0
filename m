Received: from nat-lmt.mentorg.com ([139.181.28.34]
	helo=gemini.alm.mentorg.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1U8AJt-0004EB-Ha
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 15:06:52 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r1KDoXVJ016825; 
	Wed, 20 Feb 2013 07:50:35 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2013 18:50:22 +0500
Message-Id: <1361368222-32310-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2 v4] archiver class: Use tasks with sstate instead of pre/post funcs
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
X-List-Received-Date: Wed, 20 Feb 2013 14:06:52 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

* Add tasks to move sources, script/logs and diff/env files in
  deploy directory.
* Enable SSTATE for 'do_archive_scripts_logs' task
* Enable SSTATE for 'do_dumpdata_create_diff_gz' task
* SSTATE is not used for sources/patches archiver task because source
  archive package can result into a very large file. It will be an
  unnecessary overhead to keep sources in DL_DIR and cached-binaries.
* If 'SOURCE_ARCHIVE_PACKAGE_TYPE' is 'srpm' then use pre/post functions
  because in this case we do not want to use tasks to move sources/logs
  in DEPLOY_DIR. 'do_package_write_rpm' is responsible for handling
  archiver packages.

[YOCTO #3449]

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/archive-configured-source.bbclass |   49 ++++++++++++++++++++++--
 meta/classes/archive-original-source.bbclass   |   49 ++++++++++++++++++++++--
 meta/classes/archive-patched-source.bbclass    |   49 ++++++++++++++++++++++--
 meta/classes/archiver.bbclass                  |   40 +++++++++++++------
 4 files changed, 167 insertions(+), 20 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 1eaaf4c..e492ce3 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -8,10 +8,53 @@
 inherit archiver
 
 # Get archiving package with configured sources including patches
-do_configure[postfuncs] += "do_archive_configured_sources "
+addtask do_archive_configured_sources after do_configure
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+addtask do_archive_scripts_logs after do_package_write_rpm
 
 # Get dump date and create diff file 
-do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
+addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+
+python () {
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
+        """
+        If package type is not 'srpm' then add tasks to move archive packages of
+        configured sources and scripts/logs in ${DEPLOY_DIR}/sources.
+        """
+        pn = d.getVar('PN', True)
+        d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
+        build_deps = ' %s:do_archive_configured_sources' %pn
+        build_deps += ' %s:do_archive_scripts_logs' %pn
+        d.appendVarFlag('do_build', 'depends', build_deps)
+
+    else:
+        d.prependVarFlag('do_configure', 'postfuncs', "do_archive_configured_sources")
+        d.prependVarFlag('do_package_write_rpm', 'prefuncs', "do_archive_scripts_logs")
+}
+
+ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
+ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
+ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
+
+SSTATETASKS += "do_archive_scripts_logs"
+do_archive_scripts_logs[sstate-name] = "archive_scripts_logs"
+do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
+do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_archive_scripts_logs_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_archive_scripts_logs_setscene
+
+SSTATETASKS += "do_dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-name] = "dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
+do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_dumpdata_create_diff_gz_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_dumpdata_create_diff_gz_setscene
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 1b3f8d0..f123caf 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -8,10 +8,53 @@
 inherit archiver
 
 # Get original sources archiving package with patches
-do_unpack[postfuncs] += "do_archive_original_sources_patches "
+addtask do_archive_original_sources_patches after do_unpack
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+addtask do_archive_scripts_logs after do_package_write_rpm
 
 # Get dump date and create diff file 
-do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
+addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+
+python () {
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
+        """
+        If package type is not 'srpm' then add tasks to move archive packages of
+        original sources and scripts/logs in ${DEPLOY_DIR}/sources.
+        """
+        pn = d.getVar('PN', True)
+        d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
+        build_deps = ' %s:do_archive_original_sources_patches' %pn
+        build_deps += ' %s:do_archive_scripts_logs' %pn
+        d.appendVarFlag('do_build', 'depends', build_deps)
+
+    else:
+        d.prependVarFlag('do_unpack', 'postfuncs', "do_archive_original_sources_patches")
+        d.prependVarFlag('do_package_write_rpm', 'prefuncs', "do_archive_scripts_logs")
+}
+
+ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
+ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
+ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
+
+SSTATETASKS += "do_archive_scripts_logs"
+do_archive_scripts_logs[sstate-name] = "archive_scripts_logs"
+do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
+do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_archive_scripts_logs_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_archive_scripts_logs_setscene
+
+SSTATETASKS += "do_dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-name] = "dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
+do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_dumpdata_create_diff_gz_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_dumpdata_create_diff_gz_setscene
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index 40b2dcb..f9f558e 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -8,10 +8,53 @@
 inherit archiver
 
 # Get archiving package with patched sources including patches
-do_patch[postfuncs] += "do_archive_patched_sources "
+addtask do_archive_patched_sources after do_patch
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
-do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+addtask do_archive_scripts_logs after do_package_write_rpm
 
 # Get dump date and create diff file 
-do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
+addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+
+python () {
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
+        """
+        If package type is not 'srpm' then add tasks to move archive packages of
+        patched sources and scripts/logs in ${DEPLOY_DIR}/sources.
+        """
+        pn = d.getVar('PN', True)
+        d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
+        build_deps = ' %s:do_archive_patched_sources' %pn
+        build_deps += ' %s:do_archive_scripts_logs' %pn
+        d.appendVarFlag('do_build', 'depends', build_deps)
+
+    else:
+        d.prependVarFlag('do_patch', 'postfuncs', "do_archive_patched_sources")
+        d.prependVarFlag('do_package_write_rpm', 'prefuncs', "do_archive_scripts_logs")
+}
+
+ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
+ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
+ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
+
+SSTATETASKS += "do_archive_scripts_logs"
+do_archive_scripts_logs[sstate-name] = "archive_scripts_logs"
+do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
+do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_archive_scripts_logs_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_archive_scripts_logs_setscene
+
+SSTATETASKS += "do_dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-name] = "dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
+do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_dumpdata_create_diff_gz_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_dumpdata_create_diff_gz_setscene
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a4a2158..4323827 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -94,9 +94,11 @@ def get_bb_inc(d):
     work_dir = d.getVar('WORKDIR', True)
     bbfile = d.getVar('FILE', True)
     bbdir = os.path.dirname(bbfile)
-    script_logs = os.path.join(work_dir, 'script-logs')
+    target_sys = d.getVar('TARGET_SYS', True)
+    pf = d.getVar('PF', True)
+    licenses = get_licenses(d)
+    script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
     bb_inc = os.path.join(script_logs, 'bb_inc')
-    bb.mkdirhier(script_logs)
     bb.mkdirhier(bb_inc)
 
     def find_file(dir, file):
@@ -124,6 +126,18 @@ def get_bb_inc(d):
     for bbincfile in bbinc:
         shutil.copy(bbincfile, bb_inc)
 
+    return script_logs
+
+def get_logs(d):
+    """
+    create a directory "script-logs" in ${WORKDIR}
+    """
+    work_dir = d.getVar('WORKDIR', True)
+    target_sys = d.getVar('TARGET_SYS', True)
+    pf = d.getVar('PF', True)
+    licenses = get_licenses(d)
+    script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
+
     try:
         bb.mkdirhier(os.path.join(script_logs, 'temp'))
         oe.path.copytree(os.path.join(work_dir, 'temp'), os.path.join(script_logs, 'temp'))
@@ -309,7 +323,8 @@ def archive_logs(d, logdir, bbinc=False):
     work_dir = d.getVar('WORKDIR', True)
     log_dir =  os.path.basename(logdir)
     tarname = pf + '-' + log_dir + ".tar.gz"
-    tarname = do_tarball(work_dir, log_dir, tarname)
+    archive_dir = os.path.join( logdir, '..' )
+    tarname = do_tarball(archive_dir, log_dir, tarname)
     if bbinc:
         shutil.rmtree(logdir, ignore_errors=True)
     return tarname
@@ -414,6 +429,7 @@ def archive_scripts_logs(d):
     archive scripts and logs. scripts include .bb and .inc files and
     logs include stuff in "temp".
     """
+    import shutil
 
     if tar_filter(d):
         return
@@ -421,18 +437,20 @@ def archive_scripts_logs(d):
     temp_dir = os.path.join(work_dir, 'temp')
     source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
     if source_archive_log_with_scripts == 'logs_with_scripts':
+        logdir = get_logs(d)
         logdir = get_bb_inc(d)
-        tarlog = archive_logs(d, logdir, True)
     elif source_archive_log_with_scripts == 'logs':
-        if os.path.exists(temp_dir):
-            tarlog = archive_logs(d, temp_dir, False)
+        logdir = get_logs(d)
     else:
         return
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        move_tarball_deploy(d, [tarlog])
+    tarlog = archive_logs(d, logdir, True)
 
-    else:
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
+        if os.path.exists(work_dir+ '/' + tarlog):
+            os.remove(work_dir+ '/' + tarlog)
+        shutil.move(os.path.join(logdir, '..', tarlog), work_dir)
+        shutil.rmtree(os.path.join(work_dir,'script-logs'))
         store_package(d, tarlog)
 
 def dumpdata(d):
@@ -449,7 +467,7 @@ def dumpdata(d):
     pf = d.getVar('PF', True)
     target_sys = d.getVar('TARGET_SYS', True)
     licenses = get_licenses(d)
-    dumpdir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
+    dumpdir = os.path.join(workdir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
     if not os.path.exists(dumpdir):
         bb.mkdirhier(dumpdir)
 
@@ -480,7 +498,7 @@ def create_diff_gz(d):
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
     target_sys = d.getVar('TARGET_SYS', True)
-    diff_dir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
+    diff_dir = os.path.join(work_dir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
     diff_file = os.path.join(diff_dir, bb.data.expand("${P}-${PR}.diff.gz",d))
 
     f = open(os.path.join(work_dir,'temp/exclude-from-file'), 'a')
-- 
1.7.9.5



