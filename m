Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1Tsbly-0003lB-PT
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:11:32 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id r08FuFaF020251;
	Tue, 8 Jan 2013 09:56:16 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 20:56:13 +0500
Message-Id: <1357660573-19837-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] archiver class: Make archiver tasks SSTATE aware
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
X-List-Received-Date: Tue, 08 Jan 2013 16:11:33 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

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
 meta/classes/archive-configured-source.bbclass |   53 +++++++++++++++++++++++-
 meta/classes/archive-original-source.bbclass   |   53 +++++++++++++++++++++++-
 meta/classes/archive-patched-source.bbclass    |   53 +++++++++++++++++++++++-
 meta/classes/archiver.bbclass                  |   41 +++++++++++++-----
 4 files changed, 183 insertions(+), 17 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index d804e3d..64799e3 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -8,10 +8,59 @@
 inherit archiver
 
 # Get archiving package with configured sources including patches
-addtask do_archive_configured_sources after do_configure before do_compile
+addtask do_archive_configured_sources after do_configure
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package before do_package_write_rpm
+addtask do_archive_scripts_logs after do_package_write_rpm
 
 # Get dump date and create diff file 
 addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+
+python () {
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
+        """
+        If package type is not 'srpm' then add tasks to move archive packages of
+        configured sources and scripts/logs in ${DEPLOY_DIR}/sources.
+        """
+        deps = d.getVarFlag('do_compile', 'deps') or []
+        deps.append('do_archive_configured_sources')
+        d.setVarFlag('do_compile', 'deps', deps)
+
+        recrdeptask = d.getVarFlag('do_build', 'recrdeptask') or []
+        recrdeptask += ' do_archive_configured_sources '
+        d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
+
+        deps = d.getVarFlag('do_build', 'deps') or []
+        deps.append('do_archive_scripts_logs')
+        d.setVarFlag('do_build', 'deps', deps)
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
index 604d19c..44dffb4 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -8,10 +8,59 @@
 inherit archiver
 
 # Get original sources archiving package with patches
-addtask do_archive_original_sources_patches after do_unpack before do_patch
+addtask do_archive_original_sources_patches after do_unpack
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package before do_package_write_rpm
+addtask do_archive_scripts_logs after do_package_write_rpm
 
 # Get dump date and create diff file 
 addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+
+python () {
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
+        """
+        If package type is not 'srpm' then add tasks to move archive packages of
+        original sources and scripts/logs in ${DEPLOY_DIR}/sources.
+        """
+        deps = d.getVarFlag('do_patch', 'deps') or []
+        deps.append('do_archive_original_sources_patches')
+        d.setVarFlag('do_patch', 'deps', deps)
+
+        recrdeptask = d.getVarFlag('do_build', 'recrdeptask') or []
+        recrdeptask += ' do_archive_original_sources_patches '
+        d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
+
+        deps = d.getVarFlag('do_build', 'deps') or []
+        deps.append('do_archive_scripts_logs')
+        d.setVarFlag('do_build', 'deps', deps)
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
index 4b0a199..35bae54 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -8,10 +8,59 @@
 inherit archiver
 
 # Get archiving package with patched sources including patches
-addtask do_archive_patched_sources after do_patch before do_configure
+addtask do_archive_patched_sources after do_patch
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs after do_package before do_package_write_rpm
+addtask do_archive_scripts_logs after do_package_write_rpm
 
 # Get dump date and create diff file 
 addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+
+python () {
+    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
+        """
+        If package type is not 'srpm' then add tasks to move archive packages of
+        patched sources and scripts/logs in ${DEPLOY_DIR}/sources.
+        """
+        deps = d.getVarFlag('do_configure', 'deps') or []
+        deps.append('do_archive_patched_sources')
+        d.setVarFlag('do_configure', 'deps', deps)
+
+        recrdeptask = d.getVarFlag('do_build', 'recrdeptask') or []
+        recrdeptask += ' do_archive_patched_sources '
+        d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
+
+        deps = d.getVarFlag('do_build', 'deps') or []
+        deps.append('do_archive_scripts_logs')
+        d.setVarFlag('do_build', 'deps', deps)
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
index a4a2158..82745ea 100644
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
@@ -124,11 +126,24 @@ def get_bb_inc(d):
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
     except (IOError, AttributeError):
         pass
+
     return script_logs
 
 def get_series(d):
@@ -309,7 +324,8 @@ def archive_logs(d, logdir, bbinc=False):
     work_dir = d.getVar('WORKDIR', True)
     log_dir =  os.path.basename(logdir)
     tarname = pf + '-' + log_dir + ".tar.gz"
-    tarname = do_tarball(work_dir, log_dir, tarname)
+    archive_dir = os.path.join( logdir, '..' )
+    tarname = do_tarball(archive_dir, log_dir, tarname)
     if bbinc:
         shutil.rmtree(logdir, ignore_errors=True)
     return tarname
@@ -414,6 +430,7 @@ def archive_scripts_logs(d):
     archive scripts and logs. scripts include .bb and .inc files and
     logs include stuff in "temp".
     """
+    import shutil
 
     if tar_filter(d):
         return
@@ -421,18 +438,20 @@ def archive_scripts_logs(d):
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
@@ -449,7 +468,7 @@ def dumpdata(d):
     pf = d.getVar('PF', True)
     target_sys = d.getVar('TARGET_SYS', True)
     licenses = get_licenses(d)
-    dumpdir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
+    dumpdir = os.path.join(workdir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
     if not os.path.exists(dumpdir):
         bb.mkdirhier(dumpdir)
 
@@ -480,7 +499,7 @@ def create_diff_gz(d):
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
     target_sys = d.getVar('TARGET_SYS', True)
-    diff_dir = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
+    diff_dir = os.path.join(work_dir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
     diff_file = os.path.join(diff_dir, bb.data.expand("${P}-${PR}.diff.gz",d))
 
     f = open(os.path.join(work_dir,'temp/exclude-from-file'), 'a')
-- 
1.7.9.5



