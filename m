Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 599D8616E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2013 18:56:00 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so1667894eek.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2013 10:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iYWbA41lMUZHGiUtfCFZThinmr8i8IH2DkeVSeBZwYI=;
	b=oD9r78ZLRCuA5uNaZWs2H8j3PXKklwtjRxjUBeyV0PolYQ1UEsQRGUyGaL9w09nidW
	Ys73gYZMlqxQHVW5BZP3nMhbdEyfCv0hAXk99PkEuMdJZW0Tggglq7Y7TdNEI3oAFbJJ
	b+9W3i/DoeUwEqzOfOnFpm4W0dlBH6VJmcw6MhEzVN7wkb8DGJgGXXii/tfzNwT+5puJ
	inm1inSpWnZ3PalTNeSvCyuk6br39H0u9gNk3vCvlc93qRMFdScypOzkwJMDjzwCH97U
	7Ok8xJN317HuZjCWFmIymQcJ3Fgn3mszacapLigduJNooqWUowE+jdKwiNneTT3Nfqyr
	XZmw==
X-Received: by 10.14.204.70 with SMTP id g46mr3970117eeo.84.1387652160651;
	Sat, 21 Dec 2013 10:56:00 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id p45sm29919366eeg.1.2013.12.21.10.55.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Dec 2013 10:55:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2013 19:56:33 +0100
Message-Id: <1387652193-25373-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: [RFC][PATCH] archiver: Use subdirectory in WORKDIR when creating archives
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
X-List-Received-Date: Sat, 21 Dec 2013 18:56:01 -0000

From: Martin Jansa <martin.jansa@lge.com>

* RFC: because I haven't tested all possible archiver configurations
       please check added note about diffgz archives and .org -
       was it ever working correctly? It was like this since initial
       commit.

* archiver can sometimes overwrite or remove some files which are
  needed by other tasks.

  This happens in cases where file referenced in SRC_URI aren't
  unpacked and are used by other tasks directly from WORKDIR

  def archive_sources(d, stage_name): downloads sources from
  SRC_URI again to WORKDIR in order to create source tarball from them
  (normally it's ok, because source tarball is directly unpacked from
  DL_DIR so never stays in WORKDIR).

  def archive_sources_patches(d, stage_name): then creates the tarball
  itself and moves source and patch tarballs to deploy with:
  move_tarball_deploy(d, [source_tar_name, patch_tar_name])

  But in cases where source_tar_name == "required" file we're using:
    1) do_unpack downloads "required" from DL_DIR to WORKDIR,
    2) archive_sources overwrites it with another copy,
    3) archive_sources_patches removes it,
    4) do_deploy fails because it wants to install now non-existent
       ${WORKDIR}/required

* move duplicated ARCHIVE_SSTATE_* assignments from archive-*.bbclass
  to common archiver.bbclass
* introduce separate workdir for archiver ARCHIVE_SSTATE_WORKDIR and
  move ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR,
  ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR into it
* change archiver.bbclass to dump scripts-logs and diffgs-envdata into
  right directory (respect variables defined above instead of hardcoding
  the paths in code).
* use d.getVar* API
* unify workdir/work_dir usage for ${WORKDIR} and use separate variable
  archiver_workdir when it means ARCHIVE_SSTATE_WORKDIR

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/archive-configured-source.bbclass |   4 -
 meta/classes/archive-original-source.bbclass   |   4 -
 meta/classes/archive-patched-source.bbclass    |   4 -
 meta/classes/archiver.bbclass                  | 108 ++++++++++++++-----------
 4 files changed, 61 insertions(+), 59 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 961a532..7f6d9ee 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -40,10 +40,6 @@ python () {
         d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
 SSTATETASKS += "do_archive_scripts_logs"
 do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
 do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index e271a08..d49340d 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -40,10 +40,6 @@ python () {
         d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
 SSTATETASKS += "do_archive_scripts_logs"
 do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
 do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index c5f5cca..f7dfad1 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -40,10 +40,6 @@ python () {
         d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
 SSTATETASKS += "do_archive_scripts_logs"
 do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
 do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 66efe7d..b5ed271 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -36,6 +36,11 @@ COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-
 COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
 COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
 
+ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
+ARCHIVE_SSTATE_WORKDIR = "${WORKDIR}/archiver-sources/"
+ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${ARCHIVE_SSTATE_WORKDIR}/script-logs/"
+ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${ARCHIVE_SSTATE_WORKDIR}/diffgz-envdata/"
+
 def copyleft_recipe_type(d):
     for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
         if oe.utils.inherits(d, recipe_type):
@@ -91,13 +96,13 @@ def get_bb_inc(d):
 
     bbinc = []
     pat=re.compile('require\s*([^\s]*\.*)(.*)')
-    work_dir = d.getVar('WORKDIR', True)
+    logsdir = d.getVar('ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR', True)
     bbfile = d.getVar('FILE', True)
     bbdir = os.path.dirname(bbfile)
     target_sys = d.getVar('TARGET_SYS', True)
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
-    script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
+    script_logs = os.path.join(logsdir, target_sys + '/' + licenses + '/' + pf + '/script-logs')
     bb_inc = os.path.join(script_logs, 'bb_inc')
     bb.utils.mkdirhier(bb_inc)
 
@@ -130,17 +135,18 @@ def get_bb_inc(d):
 
 def get_logs(d):
     """
-    create a directory "script-logs" in ${WORKDIR}
+    create a directory ${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}
     """
-    work_dir = d.getVar('WORKDIR', True)
+    logsdir = d.getVar('ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR', True)
+    workdir = d.getVar('WORKDIR', True)
     target_sys = d.getVar('TARGET_SYS', True)
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
-    script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
+    script_logs = os.path.join(logsdir, target_sys + '/' + licenses + '/' + pf + '/script-logs')
 
     try:
         bb.utils.mkdirhier(os.path.join(script_logs, 'temp'))
-        oe.path.copytree(os.path.join(work_dir, 'temp'), os.path.join(script_logs, 'temp'))
+        oe.path.copytree(os.path.join(workdir, 'temp'), os.path.join(script_logs, 'temp'))
     except (IOError, AttributeError):
         pass
     return script_logs
@@ -154,9 +160,10 @@ def get_series(d):
 
     src_patches=[]
     pf = d.getVar('PF', True)
-    work_dir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR', True)
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
     s = d.getVar('S', True)
-    dest = os.path.join(work_dir, pf + '-series')
+    dest = os.path.join(archiver_workdir, pf + '-series')
     shutil.rmtree(dest, ignore_errors=True)
     bb.utils.mkdirhier(dest)
 
@@ -165,7 +172,7 @@ def get_series(d):
     locals = (fetch.localpath(url) for url in fetch.urls)
     for local in locals:
         src_patches.append(local)
-    if not cmp(work_dir, s):
+    if not cmp(workdir, s):
         tmp_list = src_patches
     else:
         tmp_list = src_patches[1:]
@@ -187,8 +194,8 @@ def get_applying_patches(d):
     import shutil
 
     pf = d.getVar('PF', True)
-    work_dir = d.getVar('WORKDIR', True)
-    dest = os.path.join(work_dir, pf + '-patches')
+    workdir = d.getVar('WORKDIR', True)
+    dest = os.path.join(workdir, pf + '-patches')
     shutil.rmtree(dest, ignore_errors=True)
     bb.utils.mkdirhier(dest)
 
@@ -226,17 +233,20 @@ def get_source_from_downloads(d, stage_name):
         pass
     return ''
 
-def do_tarball(workdir, srcdir, tarname):
+def do_tarball(archiver_workdir, srcdir, tarname):
     """
-    tar "srcdir" under "workdir" to "tarname"
+    tar "srcdir" under "archiver_workdir" to "tarname"
     """
     import tarfile
 
     sav_dir = os.getcwd()
-    os.chdir(workdir)
+
+    if not os.path.exists(archiver_workdir):
+        bb.utils.mkdirhier(archiver_workdir)
+    os.chdir(archiver_workdir)
     if (len(os.listdir(srcdir))) != 0:
         tar = tarfile.open(tarname, "w:gz")
-        tar.add(srcdir)
+        tar.add(srcdir, arcname=os.path.basename(srcdir))
         tar.close()
     else:
         tarname = ''
@@ -250,20 +260,20 @@ def archive_sources_from_directory(d, stage_name):
     """
 
     s = d.getVar('S', True)
-    work_dir=d.getVar('WORKDIR', True)
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
+    workdir = d.getVar('WORKDIR', True)
     PF = d.getVar('PF', True)
     tarname = PF + '-' + stage_name + ".tar.gz"
 
-    if os.path.exists(s) and work_dir in s:
+    if os.path.exists(s) and workdir in s:
         try:
-            source_dir = os.path.join(work_dir, [ i for i in s.replace(work_dir, '').split('/') if i][0])
+            source_dir = os.path.join(workdir, [ i for i in s.replace(workdir, '').split('/') if i][0])
         except IndexError:
-            if not cmp(s, work_dir):
+            if not cmp(s, workdir):
                 return ''
     else:
         return ''
-    source = os.path.basename(source_dir)
-    return do_tarball(work_dir, source, tarname)
+    return do_tarball(archiver_workdir, source_dir, tarname)
 
 def archive_sources(d, stage_name):
     """
@@ -272,10 +282,13 @@ def archive_sources(d, stage_name):
     """
     import shutil
 
-    work_dir = d.getVar('WORKDIR', True)
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
+    if not os.path.exists(archiver_workdir):
+        bb.utils.mkdirhier(archiver_workdir)
+
     file = get_source_from_downloads(d, stage_name)
     if file:
-        shutil.copy(file, work_dir)
+        shutil.copy(file, archiver_workdir)
         file = os.path.basename(file)
     else:
         file = archive_sources_from_directory(d, stage_name)
@@ -288,12 +301,11 @@ def archive_patches(d, patchdir, series):
     import shutil
 
     s = d.getVar('S', True)
-    work_dir = d.getVar('WORKDIR', True)
-    patch_dir = os.path.basename(patchdir)
-    tarname = patch_dir + ".tar.gz"
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
+    tarname = os.path.basename(patchdir) + ".tar.gz"
     if series  == 'all' and os.path.exists(os.path.join(s, 'patches/series')):
         shutil.copy(os.path.join(s, 'patches/series'), patchdir)
-    tarname = do_tarball(work_dir, patch_dir, tarname)
+    tarname = do_tarball(archiver_workdir, patchdir, tarname)
     shutil.rmtree(patchdir, ignore_errors=True)
     return tarname
 
@@ -320,11 +332,10 @@ def archive_logs(d, logdir, bbinc=False):
     import shutil
 
     pf = d.getVar('PF', True)
-    work_dir = d.getVar('WORKDIR', True)
     log_dir =  os.path.basename(logdir)
     tarname = pf + '-' + log_dir + ".tar.gz"
     archive_dir = os.path.join( logdir, '..' )
-    tarname = do_tarball(archive_dir, log_dir, tarname)
+    tarname = do_tarball(archive_dir, logdir, tarname)
     if bbinc:
         shutil.rmtree(logdir, ignore_errors=True)
     return tarname
@@ -354,7 +365,7 @@ def move_tarball_deploy(d, tarball_list):
     target_sys = d.getVar('TARGET_SYS', True)
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
-    work_dir = d.getVar('WORKDIR', True)
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
     tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
     if not os.path.exists(tar_sources):
         bb.utils.mkdirhier(tar_sources)
@@ -362,7 +373,7 @@ def move_tarball_deploy(d, tarball_list):
         if source:
             if os.path.exists(os.path.join(tar_sources, source)):
                 os.remove(os.path.join(tar_sources, source))
-            shutil.move(os.path.join(work_dir, source), tar_sources)
+            shutil.move(os.path.join(archiver_workdir, source), tar_sources)
 
 def check_archiving_type(d):
     """check the type for archiving package('tar' or 'srpm')"""
@@ -381,8 +392,8 @@ def get_package(d):
     """
     get tarballs name from "tar-package"
     """
-    work_dir = (d.getVar('WORKDIR', True))
-    tarlist = os.path.join(work_dir, 'tar-package')
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
+    tarlist = os.path.join(archiver_workdir, 'tar-package')
     if os.path.exists(tarlist):
         f = open(tarlist, 'r')
         line = f.readline().rstrip('\n').split()
@@ -429,8 +440,8 @@ def archive_scripts_logs(d):
     """
     import shutil
 
-    work_dir = d.getVar('WORKDIR', True)
-    temp_dir = os.path.join(work_dir, 'temp')
+    workdir = d.getVar('WORKDIR', True)
+    temp_dir = os.path.join(workdir, 'temp')
     source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
     if source_archive_log_with_scripts == 'logs_with_scripts':
         logdir = get_logs(d)
@@ -451,13 +462,13 @@ def dumpdata(d):
     kinds of variables and functions when running a task
     """
 
-    workdir = bb.data.getVar('WORKDIR', d, 1)
-    distro = bb.data.getVar('DISTRO', d, 1)
+    diffgzdir = d.getVar('ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR', True)
+    distro = d.getVar('DISTRO', True)
     s = d.getVar('S', True)
     pf = d.getVar('PF', True)
     target_sys = d.getVar('TARGET_SYS', True)
     licenses = get_licenses(d)
-    dumpdir = os.path.join(workdir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
+    dumpdir = os.path.join(diffgzdir, target_sys + '/' + licenses + '/' + pf )
     if not os.path.exists(dumpdir):
         bb.utils.mkdirhier(dumpdir)
 
@@ -469,27 +480,30 @@ def dumpdata(d):
     bb.data.emit_env(f, d, True)
     # emit the metadata which isn't valid shell
     for e in d.keys():
-        if bb.data.getVarFlag(e, 'python', d):
-            f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
+        if d.getVarFlag(e, 'python'):
+            f.write("\npython %s () {\n%s}\n" % (e, d.getVar(e, True)))
     f.close()
 
 def create_diff_gz(d):
     """
-    creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for
+    creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz for
     mapping all content in 's' including patches to  xxx.diff.gz
+    Because "s + .'org'" doesn't exist it creates diff.gz including
+    not only changes, but also original files.
     """
     import shutil
     import subprocess
 
-    work_dir = d.getVar('WORKDIR', True)
+    workdir = d.getVar('WORKDIR', True)
+    diffgzdir = d.getVar('ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR', True)
     exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
     target_sys = d.getVar('TARGET_SYS', True)
-    diff_dir = os.path.join(work_dir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
+    diff_dir = os.path.join(diffgzdir, target_sys + '/' + licenses + '/' + pf)
     diff_file = os.path.join(diff_dir, bb.data.expand("${P}-${PR}.diff.gz",d))
 
-    f = open(os.path.join(work_dir,'temp/exclude-from-file'), 'a')
+    f = open(os.path.join(workdir,'temp/exclude-from-file'), 'a')
     for i in exclude_from:
         f.write(i)
         f.write("\n")
@@ -508,7 +522,7 @@ def create_diff_gz(d):
                 subprocess.call('fakeroot cp -rf ' + i + " " + dest, shell=True)
 
     bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
-    cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + work_dir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > " + diff_file
+    cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + workdir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > " + diff_file
     d.setVar('DIFF', cmd + "\n")
     d.setVarFlag('DIFF', 'func', '1')
     bb.build.exec_func('DIFF', d)
@@ -560,8 +574,8 @@ do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
 
 # remove tarball for sources, patches and logs after creating srpm.
 python do_delete_tarlist(){
-    work_dir = d.getVar('WORKDIR', True)
-    tarlist = os.path.join(work_dir, 'tar-package')
+    archiver_workdir = d.getVar('ARCHIVE_SSTATE_WORKDIR', True)
+    tarlist = os.path.join(archiver_workdir, 'tar-package')
     if os.path.exists(tarlist):
         os.remove(tarlist)
 }
-- 
1.8.4.3


