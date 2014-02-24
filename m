Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E3AF36E92F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:52:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1OFqwSb018751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 07:52:58 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 24 Feb 2014 07:52:54 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 23:56:06 +0800
Message-ID: <1026f63b88e1781645e49bec5a1c53a4cd686adb.1393256563.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] archiver.bbclass: refactor it
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
X-List-Received-Date: Mon, 24 Feb 2014 15:52:58 -0000
Content-Type: text/plain

The archiver didn't work, and there were a few problems, for example:
1) There was no src_dir.org (or orig), but the diff command still use it
2) There were a few duplicated code
3) It didn't archive the source for the native or gcc
4) The work flow is not very well
5) The "subprocess.call('fakeroot cp xxxx'" should be removed
6) And others ...

So that we have to refactor it, the benefits are:
1) Fix the problems and make it work well.
2) Reduce more than 300 lines
3) Make it easy to use.

Hre are the explanation about the bbclass:
The bbclass is used for creating the tarball from:
1) unpacked source: ARCHIVER_MODE[src] = "unpacked"
2) patched source: ARCHIVER_MODE[src] = "patched"
3) configured source: ARCHIVER_MODE[src] = "configured"
4) The patches between do_unpack and do_configure:
   ARCHIVER_MODE[diff] = "1"
   And set the files that will be excluded from diff:
   ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
5) The environment data, similar to 'bitbake -e recipe':
   ARCHIVER_MODE[dumpdata] = "1"
6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
7) The log.* and run.* files under ${T}
   ARCHIVER_MODE[log] = "1"

All of the above can be packed into a .src.rpm package: (when PACKAGES != "")
ARCHIVER_MODE[type] = "srpm",
except the seventh, because the logs are not completed until the rpm
package has been built: ARCHIVER_MODE[type] = "srpm"

[YOCTO #4986]
[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 721 +++++++++++++-----------------------------
 1 file changed, 213 insertions(+), 508 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 43373ae..ca6df43 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -1,21 +1,39 @@
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# This file is used for archiving sources, patches, and logs to a
-# tarball.  It also output building environment to xxx.dump.data and
-# create xxx.diff.gz to record all content in ${S} to a diff file.
+# This bbclass is used for creating the tarball from:
+# 1) unpacked source: ARCHIVER_MODE[src] = "unpacked"
+# 2) patched source: ARCHIVER_MODE[src] = "patched"
+# 3) configured source: ARCHIVER_MODE[src] = "configured"
+# 4) The patches between do_unpack and do_configure:
+#    ARCHIVER_MODE[diff] = "1"
+#    And you can set the one that you'd like to exclude from the diff:
+#    AR_EXCLUDE ?= "${@d.getVarFlag('ARCHIVER_MODE', 'diff-exclude', True)}
+# 5) The environment data, similar to 'bitbake -e recipe':
+#    ARCHIVER_MODE[dumpdata] = "1"
+# 6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
+# 7) The log.* and run.* files under ${T}
+#    ARCHIVER_MODE[log] = "1"
 #
-
-ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
-ARCHIVE_TYPE ?= "tar srpm"
-PATCHES_ARCHIVE_WITH_SERIES = 'yes'
-SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type') \
-    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
-SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE', 'type') \
-    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'tar'}'
-FILTER ?= '${@d.getVarFlag('ARCHIVER_MODE', 'filter') \
-    if d.getVarFlag('ARCHIVER_MODE', 'filter')!= 'none' else 'no'}'
-
+# All of the above can be packed into a .src.rpm package: (when PACKAGES != "")
+# ARCHIVER_MODE[type] = "srpm",
+# except the seventh, because the logs are not completed until the rpm
+# package has been built: ARCHIVER_MODE[type] = "srpm"
+
+ARCHIVER_MODE[type] ?= "tar"
+ARCHIVER_MODE[src] ?= "configured"
+ARCHIVER_MODE[diff] ?= "0"
+ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
+ARCHIVER_MODE[dumpdata] ?= "0"
+ARCHIVER_MODE[log] ?= "0"
+ARCHIVER_MODE[recipe] ?= "0"
+
+DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
+AR_TOPDIR = "${WORKDIR}/deploy-sources"
+ARCHIVER_OUTDIR = "${AR_TOPDIR}/${TARGET_SYS}/${PF}"
+
+# This is a convenience for the shell script to use it
+AR_EXCLUDE ?= "${@d.getVarFlag('ARCHIVER_MODE', 'diff-exclude', True)}"
 
 COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
 COPYLEFT_LICENSE_INCLUDE[type] = 'list'
@@ -23,7 +41,7 @@ COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include lic
 
 COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
 COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
-COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
+COPYLEFT_LICENSE_EXCLUDE[doc] = 'Space separated list of globs which exclude licenses'
 
 COPYLEFT_RECIPE_TYPE ?= '${@copyleft_recipe_type(d)}'
 COPYLEFT_RECIPE_TYPE[doc] = 'The "type" of the current recipe (e.g. target, native, cross)'
@@ -40,22 +58,64 @@ python () {
     pn = d.getVar('PN', True)
     packaging = d.getVar('IMAGE_PKGTYPE', True)
 
-    if tar_filter(d):
-        return
-
-    if d.getVar('PACKAGES', True) != '':
-        d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
-
-    build_deps = ' %s:do_dumpdata_create_diff_gz' % pn
-
-    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
-        build_deps += ' %s:do_archive_scripts_logs' % pn
-
-    if not not_tarball(d):
-        archiver_mode = d.getVar('ARCHIVER_MODE')
-        d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_%s_sources' % (pn, archiver_mode))
-        build_deps += ' %s:do_archive_%s_sources' % (pn, archiver_mode)
+    ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
+    if ar_src == 'unpacked':
+        # The kernel source is ready after do_validate_branches
+        if bb.data.inherits_class('kernel-yocto', d):
+            d.appendVarFlag('do_validate_branches', 'postfuncs', ' do_ar_unpacked')
+        else:
+            d.appendVarFlag('do_unpack', 'postfuncs', ' do_ar_unpacked')
+    elif ar_src == 'patched':
+        d.appendVarFlag('do_patch', 'postfuncs', ' do_ar_patched')
+    elif ar_src == 'configured':
+        d.appendVarFlag('do_configure', 'postfuncs', ' do_ar_configured')
+    else:
+        bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
+
+    # Check the archive type
+    ar_type = d.getVarFlag('ARCHIVER_MODE', 'type', True)
+    if ar_type == 'srpm':
+        if d.getVar('PACKAGES', True) != '' and packaging == 'rpm':
+            d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
+    elif ar_type != 'tar':
+        bb.fatal("Invalid ARCHIVER_MODE[type]: %s" % ar_type)
+
+
+    # Check whether create the .diff.gz
+    create_diff = d.getVarFlag('ARCHIVER_MODE', 'diff', True)
+    if create_diff == "1":
+        # Save the source to source.orig after do_unpack
+        d.appendVarFlag('do_unpack', 'postfuncs', ' do_save_orig')
+        # The kernel source is ready after do_validate_branches
+        if bb.data.inherits_class('kernel-yocto', d):
+            d.appendVarFlag('do_save_orig', 'depends', ' %s:do_validate_branches' % pn)
+        # Create the .diff.gz after do_unpack before do_configure
+        d.appendVarFlag('do_configure', 'depends', ' %s:do_create_diff_gz' % pn)
+    elif create_diff and create_diff != "0":
+        bb.fatal("Invalid ARCHIVER_MODE[diff]: %s" % create_diff)
+
+    # The gcc staff uses shared source
+    flag = d.getVarFlag("do_unpack", "stamp-base", True)
+    if flag:
+        d.setVarFlag("do_save_orig", "vardepsexclude", "PN PF")
+        d.setVarFlag("create_tarball", "vardepsexclude", "PN PF TARGET_SYS ARCHIVER_OUTDIR")
+        ar_outdir = "%s/work-shared/%s/%s" %  \
+            (d.getVar("AR_TOPDIR", True), d.getVar("TARGET_SYS", True), d.getVar('PF', True))
+        d.setVar("ARCHIVER_OUTDIR", ar_outdir)
+
+    build_deps = ' %s:do_deploy_archives' % pn
+
+    ar_log = d.getVarFlag('ARCHIVER_MODE', 'log', True)
+    # The do_ar_log should be run as late as possible
+    if ar_log == "1":
+        if d.getVar('PACKAGES', True) != '':
+            d.appendVarFlag('do_ar_log', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
+            build_deps += ' %s:do_ar_log' % pn
+        else:
+            d.appendVarFlag('do_ar_log', 'depends', ' %s:do_populate_sysroot' % pn)
+            build_deps += ' %s:do_ar_log' % pn
+    elif ar_log and ar_log != '0':
+        bb.fatal("Invalid ARCHIVER_MODE[log]: %s" % create_diff)
 
     if bb.data.inherits_class('image', d):
         d.appendVarFlag('do_rootfs', 'depends', build_deps)
@@ -97,398 +157,99 @@ def copyleft_should_include(d):
         else:
             return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
 
-def tar_filter(d):
-    """
-    Only archive the package belongs to COPYLEFT_LICENSE_INCLUDE
-    and ignore the one in COPYLEFT_LICENSE_EXCLUDE. Don't exclude any
-    packages when \"FILTER\" is \"no\"
-    """
-    if d.getVar('FILTER', True) == "yes":
-        included, reason = copyleft_should_include(d)
-        return not included
-    else:
-        return False
-
-def get_bb_inc(d):
-    """
-    create a directory "script-logs" including .bb and .inc file in ${WORKDIR}
-    """
-    import re
-    import shutil
-
-    bbinc = []
-    pat=re.compile('require\s*([^\s]*\.*)(.*)')
-    work_dir = d.getVar('WORKDIR', True)
-    bbfile = d.getVar('FILE', True)
-    bbdir = os.path.dirname(bbfile)
-    target_sys = d.getVar('TARGET_SYS', True)
-    pf = d.getVar('PF', True)
-    licenses = get_licenses(d)
-    script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
-    bb_inc = os.path.join(script_logs, 'bb_inc')
-    bb.utils.mkdirhier(bb_inc)
-
-    def find_file(dir, file):
-        for root, dirs, files in os.walk(dir):
-            if file in files:
-                return os.path.join(root, file)
-
-    def get_inc (file):
-        f = open(file, 'r')
-        for line in f.readlines():
-            if 'require' not  in line:
-                bbinc.append(file)
-            else:
-                try:
-                    incfile = pat.match(line).group(1)
-                    incfile = bb.data.expand(os.path.basename(incfile), d)
-                    abs_incfile = find_file(bbdir, incfile)
-                    if abs_incfile:
-                        bbinc.append(abs_incfile)
-                        get_inc(abs_incfile)
-                except AttributeError:
-                    pass
-    get_inc(bbfile)
-    bbinc = list(set(bbinc))
-    for bbincfile in bbinc:
-        shutil.copy(bbincfile, bb_inc)
-
-    return script_logs
-
-def get_logs(d):
-    """
-    create a directory "script-logs" in ${WORKDIR}
-    """
-    work_dir = d.getVar('WORKDIR', True)
-    target_sys = d.getVar('TARGET_SYS', True)
-    pf = d.getVar('PF', True)
-    licenses = get_licenses(d)
-    script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
-
-    try:
-        bb.utils.mkdirhier(os.path.join(script_logs, 'temp'))
-        oe.path.copytree(os.path.join(work_dir, 'temp'), os.path.join(script_logs, 'temp'))
-    except (IOError, AttributeError):
-        pass
-    return script_logs
-
-def get_series(d):
-    """
-    copy patches and series file to a pointed directory which will be
-    archived to tarball in ${WORKDIR}
-    """
-    import shutil
-
-    src_patches=[]
-    pf = d.getVar('PF', True)
-    work_dir = d.getVar('WORKDIR', True)
-    s = d.getVar('S', True)
-    dest = os.path.join(work_dir, pf + '-series')
-    shutil.rmtree(dest, ignore_errors=True)
-    bb.utils.mkdirhier(dest)
-
-    src_uri = d.getVar('SRC_URI', True).split()
-    fetch = bb.fetch2.Fetch(src_uri, d)
-    locals = (fetch.localpath(url) for url in fetch.urls)
-    for local in locals:
-        src_patches.append(local)
-    if not cmp(work_dir, s):
-        tmp_list = src_patches
-    else:
-        tmp_list = src_patches[1:]
-
-    for patch in tmp_list:
-        try:
-            shutil.copy(patch, dest)
-        except IOError:
-            if os.path.isdir(patch):
-                bb.utils.mkdirhier(os.path.join(dest, patch))
-                oe.path.copytree(patch, os.path.join(dest, patch))
-    return dest
-
-def get_applying_patches(d):
-    """
-    only copy applying patches to a pointed directory which will be
-    archived to tarball
-    """
-    import shutil
-
-    pf = d.getVar('PF', True)
-    work_dir = d.getVar('WORKDIR', True)
-    dest = os.path.join(work_dir, pf + '-patches')
-    shutil.rmtree(dest, ignore_errors=True)
-    bb.utils.mkdirhier(dest)
-
-    patches = src_patches(d)
-    for patch in patches:
-        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
-        if local:
-             shutil.copy(local, dest)
-    return dest
-
-def not_tarball(d):
-    """
-    packages including key words 'work-shared', 'native', 'packagegroup-' will be passed
-    """
-    workdir = d.getVar('WORKDIR', True)
-    s = d.getVar('S', True)
-    if 'work-shared' in s or 'packagegroup-' in workdir or 'native' in workdir:
-        return True
-    else:
-        return False
-
-def get_source_from_downloads(d, stage_name):
+def create_tarball(d, srcdir, suffix):
     """
-    copy tarball of $P to $WORKDIR when this tarball exists in $DL_DIR
-    """
-    if stage_name in 'patched' 'configured':
-        return
-    pf = d.getVar('PF', True)
-    dl_dir = d.getVar('DL_DIR', True)
-    try:
-        source = os.path.join(dl_dir, os.path.basename(d.getVar('SRC_URI', True).split()[0]))
-        if os.path.exists(source) and not os.path.isdir(source):
-            return source
-    except (IndexError, OSError):
-        pass
-    return ''
-
-def do_tarball(workdir, srcdir, tarname):
-    """
-    tar "srcdir" under "workdir" to "tarname"
+    create the tarball from srcdir
     """
     import tarfile
 
-    sav_dir = os.getcwd()
-    os.chdir(workdir)
-    if (len(os.listdir(srcdir))) != 0:
+    outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    bb.utils.mkdirhier(outdir)
+    tarname = os.path.join(outdir, "%s-%s.tar.gz" % \
+        (d.getVar("PF", True), suffix))
+
+    srcdir = srcdir.rstrip('/')
+    dirname = os.path.dirname(srcdir)
+    basename = os.path.basename(srcdir)
+    olddir = os.getcwd()
+    os.chdir(dirname)
+    bb.note("Creating %s" % tarname)
+    if (len(os.listdir(basename))) != 0:
         tar = tarfile.open(tarname, "w:gz")
-        tar.add(srcdir)
+        tar.add(basename)
         tar.close()
     else:
         tarname = ''
-    os.chdir(sav_dir)
-    return tarname
-
-def archive_sources_from_directory(d, stage_name):
-    """
-    archive sources codes tree to tarball when tarball of $P doesn't
-    exist in $DL_DIR
-    """
-
-    s = d.getVar('S', True)
-    work_dir=d.getVar('WORKDIR', True)
-    PF = d.getVar('PF', True)
-    tarname = PF + '-' + stage_name + ".tar.gz"
-
-    if os.path.exists(s) and work_dir in s:
-        try:
-            source_dir = os.path.join(work_dir, [ i for i in s.replace(work_dir, '').split('/') if i][0])
-        except IndexError:
-            if not cmp(s, work_dir):
-                return ''
-    else:
-        return ''
-    source = os.path.basename(source_dir)
-    return do_tarball(work_dir, source, tarname)
-
-def archive_sources(d, stage_name):
-    """
-    copy tarball from $DL_DIR to $WORKDIR if have tarball, archive
-    source codes tree in $WORKDIR if $P is directory instead of tarball
-    """
-    import shutil
+    os.chdir(olddir)
 
-    work_dir = d.getVar('WORKDIR', True)
-    file = get_source_from_downloads(d, stage_name)
-    if file:
-        shutil.copy(file, work_dir)
-        file = os.path.basename(file)
-    else:
-        file = archive_sources_from_directory(d, stage_name)
-    return file
-
-def archive_patches(d, patchdir, series):
-    """
-    archive patches to tarball and also include series files if 'series' is True
-    """
-    import shutil
-
-    s = d.getVar('S', True)
-    work_dir = d.getVar('WORKDIR', True)
-    patch_dir = os.path.basename(patchdir)
-    tarname = patch_dir + ".tar.gz"
-    if series  == 'all' and os.path.exists(os.path.join(s, 'patches/series')):
-        shutil.copy(os.path.join(s, 'patches/series'), patchdir)
-    tarname = do_tarball(work_dir, patch_dir, tarname)
-    shutil.rmtree(patchdir, ignore_errors=True)
-    return tarname
-
-def select_archive_patches(d, option):
-    """
-    select to archive all patches including non-applying and series or
-    applying patches
+python do_ar_log() {
     """
-    if option == "all":
-        patchdir = get_series(d)
-    elif option == "applying":
-        patchdir = get_applying_patches(d)
-    try:
-        os.rmdir(patchdir)
-    except OSError:
-            tarpatch = archive_patches(d, patchdir, option)
-            return tarpatch
-    return
-
-def archive_logs(d, logdir, bbinc=False):
+    archive log.* and run.* under the ${T} dir.
     """
-    archive logs in temp to tarball and .bb and .inc files if bbinc is True
-    """
-    import shutil
 
-    pf = d.getVar('PF', True)
-    work_dir = d.getVar('WORKDIR', True)
-    log_dir =  os.path.basename(logdir)
-    tarname = pf + '-' + log_dir + ".tar.gz"
-    archive_dir = os.path.join( logdir, '..' )
-    tarname = do_tarball(archive_dir, log_dir, tarname)
-    if bbinc:
-        shutil.rmtree(logdir, ignore_errors=True)
-    return tarname
-
-def get_licenses(d):
-    """get licenses for running .bb file"""
-    import oe.license
-
-    licenses_type = d.getVar('LICENSE', True) or ""
-    lics = oe.license.is_included(licenses_type)[1:][0]
-    lice = ''
-    for lic in lics:
-        licens = d.getVarFlag('SPDXLICENSEMAP', lic)
-        if licens != None:
-            lice += licens
-        else:
-            lice += lic
-    return lice
-
-
-def move_tarball_deploy(d, tarball_list):
-    """move tarball in location to ${DEPLOY_DIR}/sources"""
-    import shutil
-
-    if tarball_list is []:
+    ar_log = d.getVarFlag('ARCHIVER_MODE', 'log', True)
+    if ar_log == '0':
         return
-    target_sys = d.getVar('TARGET_SYS', True)
-    pf = d.getVar('PF', True)
-    licenses = get_licenses(d)
-    work_dir = d.getVar('WORKDIR', True)
-    tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
-    if not os.path.exists(tar_sources):
-        bb.utils.mkdirhier(tar_sources)
-    for source in tarball_list:
-        if source:
-            if os.path.exists(os.path.join(tar_sources, source)):
-                os.remove(os.path.join(tar_sources, source))
-            shutil.move(os.path.join(work_dir, source), tar_sources)
-
-def check_archiving_type(d):
-    """check the type for archiving package('tar' or 'srpm')"""
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) not in d.getVar('ARCHIVE_TYPE', True).split():
-        bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\', no other types")
-
-def store_package(d, package_name):
-    """
-    store tarbablls name to file "tar-package"
-    """
-    f = open(os.path.join(d.getVar('WORKDIR', True), 'tar-package'), 'a')
-    f.write(package_name + ' ')
-    f.close()
-
-def get_package(d):
-    """
-    get tarballs name from "tar-package"
-    """
-    work_dir = (d.getVar('WORKDIR', True))
-    tarlist = os.path.join(work_dir, 'tar-package')
-    if os.path.exists(tarlist):
-        f = open(tarlist, 'r')
-        line = f.readline().rstrip('\n').split()
-        f.close()
-        return line
-    return []
+    elif ar_log and ar_log != '1':
+        bb.fatal("Invalid ARCHIVER_MODE[log]: %s" % ar_log)
 
+    create_tarball(d, d.getVar('T', True), 'log')
+}
 
-def archive_sources_patches(d, stage_name):
+python do_ar_recipe() {
     """
-    archive sources and patches to tarball. stage_name will append
-    strings ${stage_name} to ${PR} as middle name. for example,
-    zlib-1.4.6-prepatch(stage_name).tar.gz
+    archive the recipe, including .bb and .inc.
     """
+    import re
     import shutil
 
-    check_archiving_type(d)
+    ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
+    if ar_recipe == '0':
+        return
+    elif ar_recipe and ar_recipe != '1':
+        bb.fatal("Invalid ARCHIVER_MODE[recipe]: %s" % ar_recipe)
 
-    source_tar_name = archive_sources(d, stage_name)
-    if stage_name == "prepatch":
-        if d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True) == 'yes':
-            patch_tar_name = select_archive_patches(d, "all")
-        elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True) == 'no':
-            patch_tar_name = select_archive_patches(d, "applying")
-        else:
-            bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' to 'yes' or 'no' ")
-    else:
-        patch_tar_name = ''
+    require_re = re.compile( r"require\s+(.+)" )
+    include_re = re.compile( r"include\s+(.+)" )
+    outdir = os.path.join(d.getVar('ARCHIVER_OUTDIR', True), d.getVar('PF', True))
+    bbfile = d.getVar('FILE', True)
+    bb.utils.mkdirhier(outdir)
+    shutil.copy(bbfile, outdir)
+
+    dirname = os.path.dirname(bbfile)
+    bbpath = "%s:%s" % (dirname, d.getVar('BBPATH', True))
+    f = open(bbfile, 'r')
+    for line in f.readlines():
+        incfile = None
+        if require_re.match(line):
+            incfile = require_re.match(line).group(1)
+        elif include_re.match(line):
+            incfile = include_re.match(line).group(1)
+        if incfile:
+            incfile = bb.utils.which(bbpath, incfile)
+            if incfile:
+                shutil.copy(incfile, outdir)
+
+    create_tarball(d, outdir, 'recipe')
+    shutil.rmtree(outdir)
+}
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        move_tarball_deploy(d, [source_tar_name, patch_tar_name])
-    else:
-        tarlist = os.path.join(d.getVar('WORKDIR', True), 'tar-package')
-        if os.path.exists(tarlist):
-            os.remove(tarlist)
-        for package in os.path.basename(source_tar_name), patch_tar_name:
-            if package:
-                store_package(d, str(package) + ' ')
-
-def archive_scripts_logs(d):
+python do_dumpdata() {
     """
-    archive scripts and logs. scripts include .bb and .inc files and
-    logs include stuff in "temp".
+    dump environment data to ${PF}-showdata.dump
     """
-    import shutil
 
-    work_dir = d.getVar('WORKDIR', True)
-    temp_dir = os.path.join(work_dir, 'temp')
-    source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
-    if source_archive_log_with_scripts == 'logs_with_scripts':
-        logdir = get_logs(d)
-        logdir = get_bb_inc(d)
-    elif source_archive_log_with_scripts == 'logs':
-        logdir = get_logs(d)
-    else:
+    # Check whether dump data (bb.data.emit_env)
+    emit_env = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
+    if not emit_env or emit_env == "0":
         return
+    elif emit_env != "1":
+        bb.fatal("Invalid ARCHIVER_MODE[dumpdata]: %s" % emit_env)
 
-    tarlog = archive_logs(d, logdir, True)
+    bb.utils.mkdirhier(d.getVar('ARCHIVER_OUTDIR', True))
 
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-        store_package(d, tarlog)
-
-def dumpdata(d):
-    """
-    dump environment to "${P}-${PR}.showdata.dump" including all
-    kinds of variables and functions when running a task
-    """
-
-    workdir = bb.data.getVar('WORKDIR', d, 1)
-    distro = bb.data.getVar('DISTRO', d, 1)
-    s = d.getVar('S', True)
-    pf = d.getVar('PF', True)
-    target_sys = d.getVar('TARGET_SYS', True)
-    licenses = get_licenses(d)
-    dumpdir = os.path.join(workdir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
-    if not os.path.exists(dumpdir):
-        bb.utils.mkdirhier(dumpdir)
-
-    dumpfile = os.path.join(dumpdir, bb.data.expand("${P}-${PR}.showdata.dump", d))
+    dumpfile = "%s/%s-showdata.dump" % \
+        (d.getVar('ARCHIVER_OUTDIR', True), d.getVar("PF", True))
 
     bb.note("Dumping metadata into '%s'" % dumpfile)
     f = open(dumpfile, "w")
@@ -497,134 +258,78 @@ def dumpdata(d):
     # emit the metadata which isn't valid shell
     for e in d.keys():
         if bb.data.getVarFlag(e, 'python', d):
-            f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
+            f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, True)))
     f.close()
-
-def create_diff_gz(d):
-    """
-    creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for
-    mapping all content in 's' including patches to  xxx.diff.gz
-    """
-    import shutil
-    import subprocess
-
-    work_dir = d.getVar('WORKDIR', True)
-    exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
-    pf = d.getVar('PF', True)
-    licenses = get_licenses(d)
-    target_sys = d.getVar('TARGET_SYS', True)
-    diff_dir = os.path.join(work_dir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
-    diff_file = os.path.join(diff_dir, bb.data.expand("${P}-${PR}.diff.gz",d))
-
-    f = open(os.path.join(work_dir,'temp/exclude-from-file'), 'a')
-    for i in exclude_from:
-        f.write(i)
-        f.write("\n")
-    f.close()
-
-    s=d.getVar('S', True)
-    distro = d.getVar('DISTRO',True) or ""
-    dest = s + '/' + distro + '/files'
-    if not os.path.exists(dest):
-        bb.utils.mkdirhier(dest)
-    for i in os.listdir(os.getcwd()):
-        if os.path.isfile(i):
-            try:
-                shutil.copy(i, dest)
-            except IOError:
-                subprocess.call('fakeroot cp -rf ' + i + " " + dest, shell=True)
-
-    bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
-    cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + work_dir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > " + diff_file
-    d.setVar('DIFF', cmd + "\n")
-    d.setVarFlag('DIFF', 'func', '1')
-    bb.build.exec_func('DIFF', d)
-    shutil.rmtree(s + '.org', ignore_errors=True)
-
-# This function will run when user want to get tarball for sources and
-# patches after do_unpack
-python do_archive_original_sources(){
-    archive_sources_patches(d, 'prepatch')
 }
 
-# This function will run when user want to get tarball for patched
-# sources after do_patch
-python do_archive_patched_sources(){
-    archive_sources_patches(d, 'patched')
+# Save ${S} to ${S}.orig
+python do_save_orig() {
+    s = d.getVar('S', True).rstrip('/')
+    orig = "%s.orig.%s" % (s, d.getVar('PF', True))
+    oe.path.remove(orig)
+    oe.path.copytree(s, orig)
 }
 
-# This function will run when user want to get tarball for configured
-# sources after do_configure
-python do_archive_configured_sources(){
-    archive_sources_patches(d, 'configured')
+# creating .diff.gz between source.orig and source
+do_create_diff_gz() {
+    # creating .diff.gz between source.orig and source
+
+    diff_file="${ARCHIVER_OUTDIR}/${PF}-diff.gz"
+    # FIXME:
+    # The diff --exclude can't exclude the file with path, so we copy
+    # the patched source, and remove the files that we'd like to
+    # exclude.
+    s=`echo ${S} | sed 's#/*$##'`
+    [ -d ${s}.orig.${PF} ] || return 0
+    rm -fr ${s}.patched.${PF}
+    cp -al $s ${s}.patched.${PF}
+    for i in ${AR_EXCLUDE}; do
+        rm -fr ${s}.orig.${PF}/$i
+        rm -fr ${s}.patched.${PF}/$i
+    done
+
+    mkdir -p "${ARCHIVER_OUTDIR}"
+    dname=$(dirname ${s})
+    basename=$(basename ${s})
+    olddir=$(pwd)
+    cd $dname || exit 1
+    LC_ALL=C TZ=UTC0 diff -Naur \
+        ${basename}.orig.${PF} ${basename}.patched.${PF} | gzip -c > $diff_file
+    rm -fr ${s}.patched.${PF}
+    cd $olddir
 }
 
-# This function will run when user want to get tarball for logs or both
-# logs and scripts(.bb and .inc files)
-python do_archive_scripts_logs(){
-    archive_scripts_logs(d)
+# Create the tarball after do_unpack
+python do_ar_unpacked(){
+    create_tarball(d, d.getVar('S', True), 'unpacked')
 }
 
-# This function will run when user want to know what variable and
-# functions in a running task are and also can get a diff file including
-# all content a package should include.
-python do_dumpdata_create_diff_gz(){
-    dumpdata(d)
-    create_diff_gz(d)
+# Create the tarball after do_patch
+python do_ar_patched(){
+    create_tarball(d, d.getVar('S', True), 'patched')
 }
 
-# This functions prepare for archiving "linux-yocto" because this
-# package create directory 's' before do_patch instead of after
-# do_unpack.  This is special control for archiving linux-yocto only.
-python do_archive_linux_yocto(){
-    s = d.getVar('S', True)
-    if 'linux-yocto' in s:
-        source_tar_name = archive_sources(d, '')
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        move_tarball_deploy(d, [source_tar_name, ''])
+# Create the tarball after do_configure
+python do_ar_configured(){
+    create_tarball(d, d.getVar('S', True), 'configured')
 }
-do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
-
-# remove tarball for sources, patches and logs after creating srpm.
-python do_delete_tarlist(){
-    work_dir = d.getVar('WORKDIR', True)
-    tarlist = os.path.join(work_dir, 'tar-package')
-    if os.path.exists(tarlist):
-        os.remove(tarlist)
-}
-do_delete_tarlist[deptask] = "do_archive_scripts_logs"
-do_package_write_rpm[postfuncs] += "do_delete_tarlist "
-
-# Get archiving package with temp(logs) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs
-
-# Get dump date and create diff file
-addtask do_dumpdata_create_diff_gz
 
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
-SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
-do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_archive_scripts_logs_setscene () {
-    sstate_setscene(d)
+do_deploy_archives () {
+    echo "Deploying source archive files ..."
 }
 
-addtask do_archive_scripts_logs_setscene
-
-SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
-do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_dumpdata_create_diff_gz_setscene () {
+SSTATETASKS += "do_deploy_archives"
+python do_deploy_archives_setscene () {
     sstate_setscene(d)
 }
 
-addtask do_dumpdata_create_diff_gz_setscene
+do_deploy_archives[sstate-inputdirs] = "${AR_TOPDIR}"
+do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
+
+# This is used for deploying the archives
+addtask do_deploy_archives after do_configure
 
-addtask do_archive_original_sources after do_unpack
-addtask do_archive_patched_sources after do_patch
-addtask do_archive_configured_sources after do_configure
+addtask do_dumpdata before do_deploy_archives
+addtask do_ar_recipe before do_deploy_archives
+addtask do_ar_log before do_deploy_archives
+addtask do_create_diff_gz after do_patch
-- 
1.8.3.1


