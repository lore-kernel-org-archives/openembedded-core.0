Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0FB76F817
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:03:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3o7J010746
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:51 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:20 +0800
Message-ID: <091efa61bc526e408183aa5c6dda0b8eb76f16f8.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] archiver.bbclass: refactor it
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
X-List-Received-Date: Tue, 11 Mar 2014 17:03:56 -0000
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
This bbclass is used for creating archive for:
1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
2) patched source: ARCHIVER_MODE[src] = "patched" (default)
3) configured source: ARCHIVER_MODE[src] = "configured"
4) The patches between do_unpack and do_patch:
   ARCHIVER_MODE[diff] = "1"
   And you can set the one that you'd like to exclude from the diff:
   ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
5) The environment data, similar to 'bitbake -e recipe':
   ARCHIVER_MODE[dumpdata] = "1"
6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"

All of the above can be packed into a .src.rpm package: (when PACKAGES
!= "")
ARCHIVER_MODE[srpm] = "1"

[YOCTO #4986]
[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 819 ++++++++++++++----------------------------
 1 file changed, 265 insertions(+), 554 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 43373ae..b1109dc 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -1,20 +1,38 @@
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# This file is used for archiving sources, patches, and logs to a
-# tarball.  It also output building environment to xxx.dump.data and
-# create xxx.diff.gz to record all content in ${S} to a diff file.
+# This bbclass is used for creating archive for:
+# 1) original (or unpacked) source: ARCHIVER_MODE[src] = "original"
+# 2) patched source: ARCHIVER_MODE[src] = "patched" (default)
+# 3) configured source: ARCHIVER_MODE[src] = "configured"
+# 4) The patches between do_unpack and do_patch:
+#    ARCHIVER_MODE[diff] = "1"
+#    And you can set the one that you'd like to exclude from the diff:
+#    ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
+# 5) The environment data, similar to 'bitbake -e recipe':
+#    ARCHIVER_MODE[dumpdata] = "1"
+# 6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
 #
+# All of the above can be packed into a .src.rpm package: (when PACKAGES != "")
+# ARCHIVER_MODE[srpm] = "1"
 
-ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
-ARCHIVE_TYPE ?= "tar srpm"
-PATCHES_ARCHIVE_WITH_SERIES = 'yes'
-SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type') \
-    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
-SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE', 'type') \
-    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'tar'}'
-FILTER ?= '${@d.getVarFlag('ARCHIVER_MODE', 'filter') \
-    if d.getVarFlag('ARCHIVER_MODE', 'filter')!= 'none' else 'no'}'
+ARCHIVER_MODE[srpm] ?= "0"
+ARCHIVER_MODE[src] ?= "patched"
+ARCHIVER_MODE[diff] ?= "0"
+ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
+ARCHIVER_MODE[dumpdata] ?= "0"
+ARCHIVER_MODE[recipe] ?= "0"
+
+DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
+AR_TOPDIR = "${WORKDIR}/deploy-sources"
+ARCHIVER_OUTDIR = "${AR_TOPDIR}/${TARGET_SYS}/${PF}/"
+ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
+
+do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
+do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
+do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
+
+# This is a convenience for the shell script to use it
 
 
 COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
@@ -23,7 +41,7 @@ COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include lic
 
 COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
 COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
-COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
+COPYLEFT_LICENSE_EXCLUDE[doc] = 'Space separated list of globs which exclude licenses'
 
 COPYLEFT_RECIPE_TYPE ?= '${@copyleft_recipe_type(d)}'
 COPYLEFT_RECIPE_TYPE[doc] = 'The "type" of the current recipe (e.g. target, native, cross)'
@@ -38,593 +56,286 @@ COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe
 
 python () {
     pn = d.getVar('PN', True)
-    packaging = d.getVar('IMAGE_PKGTYPE', True)
 
-    if tar_filter(d):
-        return
-
-    if d.getVar('PACKAGES', True) != '':
-        d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
+    ar_src = d.getVarFlag('ARCHIVER_MODE', 'src', True)
+    ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata', True)
+    ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
+
+    if ar_src == "original":
+        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_original' % pn)
+    elif ar_src == "patched":
+        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
+    elif ar_src == "configured":
+        # We can't use "addtask do_ar_configured after do_configure" since it
+        # will cause the deptask of do_populate_sysroot to run not matter what
+        # archives we need, so we add the depends here.
+        d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_configure' % pn)
+        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_configured' % pn)
+    elif ar_src:
+        bb.fatal("Invalid ARCHIVER_MODE[src]: %s" % ar_src)
+
+    if ar_dumpdata == "1":
+        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_dumpdata' % pn)
+
+    if ar_recipe == "1":
+        d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_recipe' % pn)
+
+    # Output the srpm package
+    ar_srpm = d.getVarFlag('ARCHIVER_MODE', 'srpm', True)
+    if ar_srpm == "1":
+        if d.getVar('PACKAGES', True) != '' and d.getVar('IMAGE_PKGTYPE', True) == 'rpm':
+            d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
+            if ar_dumpdata == "1":
+                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_dumpdata' % pn)
+            if ar_recipe == "1":
+                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_recipe' % pn)
+            if ar_src == "original":
+                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_original' % pn)
+            elif ar_src == "patched":
+                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_patched' % pn)
+            elif ar_src == "configured":
+                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
+
+    # The gcc staff uses shared source
+    flag = d.getVarFlag("do_unpack", "stamp-base", True)
+    if flag:
+        if ar_src in [ 'original', 'patched' ]:
+            ar_outdir = os.path.join(d.getVar('AR_TOPDIR', True), 'work-shared')
+            d.setVar('ARCHIVER_OUTDIR', ar_outdir)
+        d.setVarFlag('do_ar_original', 'stamp-base', flag)
+        d.setVarFlag('do_ar_patched', 'stamp-base', flag)
+        d.setVarFlag('do_unpack_and_patch', 'stamp-base', flag)
+        d.setVarFlag('do_ar_original', 'vardepsexclude', 'PN PF ARCHIVER_OUTDIR WORKDIR')
+        d.setVarFlag('do_unpack_and_patch', 'vardepsexclude', 'PN PF ARCHIVER_OUTDIR WORKDIR')
+        d.setVarFlag('do_ar_patched', 'vardepsexclude', 'PN PF ARCHIVER_OUTDIR WORKDIR')
+        d.setVarFlag('create_diff_gz', 'vardepsexclude', 'PF')
+        d.setVarFlag('create_tarball', 'vardepsexclude', 'PF')
+
+        flag_clean = d.getVarFlag('do_unpack', 'stamp-base-clean', True)
+        if flag_clean:
+            d.setVarFlag('do_ar_original', 'stamp-base-clean', flag_clean)
+            d.setVarFlag('do_ar_patched', 'stamp-base-clean', flag_clean)
+            d.setVarFlag('do_unpack_and_patch', 'stamp-base-clean', flag_clean)
+}
 
-    build_deps = ' %s:do_dumpdata_create_diff_gz' % pn
+# Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
+# Files in SRC_URI are copied directly, anything that's a directory
+# (e.g. git repositories) is "unpacked" and then put into a tarball.
+python do_ar_original() {
 
-    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
-        build_deps += ' %s:do_archive_scripts_logs' % pn
+    import shutil, tarfile, tempfile
 
-    if not not_tarball(d):
-        archiver_mode = d.getVar('ARCHIVER_MODE')
-        d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_%s_sources' % (pn, archiver_mode))
-        build_deps += ' %s:do_archive_%s_sources' % (pn, archiver_mode)
+    if d.getVarFlag('ARCHIVER_MODE', 'src', True) != "original":
+        return
 
-    if bb.data.inherits_class('image', d):
-        d.appendVarFlag('do_rootfs', 'depends', build_deps)
-    else:
-        d.appendVarFlag('do_build', 'depends', build_deps)
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    bb.note('Archiving the original source...')
+    fetch = bb.fetch2.Fetch([], d)
+    for url in fetch.urls:
+        local = fetch.localpath(url)
+        if os.path.isfile(local):
+            shutil.copy(local, ar_outdir)
+        elif os.path.isdir(local):
+            basename = os.path.basename(local)
+
+            tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR', True))
+            fetch.unpack(tmpdir, (url,))
+
+            os.chdir(tmpdir)
+            tarname = os.path.join(ar_outdir, basename + '.tar.gz')
+            tar = tarfile.open(tarname, 'w:gz')
+            tar.add('.')
+            tar.close()
 }
 
-def copyleft_recipe_type(d):
-    for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
-        if oe.utils.inherits(d, recipe_type):
-            return recipe_type
-    return 'target'
-
-def copyleft_should_include(d):
-    """
-    Determine if this recipe's sources should be deployed for compliance
-    """
-    import ast
-    import oe.license
-    from fnmatch import fnmatchcase as fnmatch
+python do_ar_patched() {
 
-    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE', True)
-    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
-        return False, 'recipe type "%s" is excluded' % recipe_type
-
-    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
-    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
+    if d.getVarFlag('ARCHIVER_MODE', 'src', True) != 'patched':
+        return
 
-    try:
-        is_included, reason = oe.license.is_included(d.getVar('LICENSE', True), include, exclude)
-    except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
-    else:
-        if is_included:
-            if reason:
-                return True, 'recipe has included licenses: %s' % ', '.join(reason)
-            else:
-                return False, 'recipe does not include a copyleft license'
-        else:
-            return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
-
-def tar_filter(d):
-    """
-    Only archive the package belongs to COPYLEFT_LICENSE_INCLUDE
-    and ignore the one in COPYLEFT_LICENSE_EXCLUDE. Don't exclude any
-    packages when \"FILTER\" is \"no\"
-    """
-    if d.getVar('FILTER', True) == "yes":
-        included, reason = copyleft_should_include(d)
-        return not included
+    # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    bb.note('Archiving the patched source...')
+    d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+    # The gcc staff uses shared source
+    flag = d.getVarFlag('do_unpack', 'stamp-base', True)
+    if flag:
+        create_tarball(d, d.getVar('S', True), 'patched', ar_outdir, 'gcc')
     else:
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
+        create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
+}
 
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
+python do_ar_configured() {
     import shutil
 
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
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    if d.getVarFlag('ARCHIVER_MODE', 'src', True) == 'configured':
+        bb.note('Archiving the configured source...')
+        # The libtool-native's do_configure will remove the
+        # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
+        # do_configure, we archive the already configured ${S} to
+        # instead of.
+        if d.getVar('PN', True) != 'libtool-native':
+            # Change the WORKDIR to make do_configure run in another dir.
+            d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+        if bb.data.inherits_class('kernel-yocto', d):
+            bb.build.exec_func('do_kernel_configme', d)
+            bb.build.exec_func('do_configure', d)
+        srcdir = d.getVar('S', True)
+        builddir = d.getVar('B', True)
+        if srcdir != builddir:
+            if os.path.exists(builddir):
+                oe.path.copytree(builddir, os.path.join(srcdir, \
+                    'build.%s.ar_configured' % d.getVar('PF', True)))
+        create_tarball(d, srcdir, 'configured', ar_outdir)
+}
 
-def get_source_from_downloads(d, stage_name):
+def create_tarball(d, srcdir, suffix, ar_outdir, pf=None):
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
-        tar = tarfile.open(tarname, "w:gz")
-        tar.add(srcdir)
-        tar.close()
-    else:
-        tarname = ''
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
-
-    work_dir = d.getVar('WORKDIR', True)
-    file = get_source_from_downloads(d, stage_name)
-    if file:
-        shutil.copy(file, work_dir)
-        file = os.path.basename(file)
+    bb.utils.mkdirhier(ar_outdir)
+    if pf:
+        tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % (pf, suffix))
     else:
-        file = archive_sources_from_directory(d, stage_name)
-    return file
+        tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % \
+            (d.getVar('PF', True), suffix))
 
-def archive_patches(d, patchdir, series):
-    """
-    archive patches to tarball and also include series files if 'series' is True
-    """
-    import shutil
+    srcdir = srcdir.rstrip('/')
+    dirname = os.path.dirname(srcdir)
+    basename = os.path.basename(srcdir)
+    os.chdir(dirname)
+    bb.note('Creating %s' % tarname)
+    tar = tarfile.open(tarname, 'w:gz')
+    tar.add(basename)
+    tar.close()
 
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
-    """
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
-    """
-    archive logs in temp to tarball and .bb and .inc files if bbinc is True
-    """
-    import shutil
+# creating .diff.gz between source.orig and source
+def create_diff_gz(d, src_orig, src, ar_outdir):
 
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
+    import subprocess
 
-    if tarball_list is []:
+    if not os.path.isdir(src) or not os.path.isdir(src_orig):
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
 
+    # The diff --exclude can't exclude the file with path, so we copy
+    # the patched source, and remove the files that we'd like to
+    # exclude.
+    src_patched = src + '.patched'
+    oe.path.copyhardlinktree(src, src_patched)
+    for i in d.getVarFlag('ARCHIVER_MODE', 'diff-exclude', True).split():
+        bb.utils.remove(os.path.join(src_orig, i), recurse=True)
+        bb.utils.remove(os.path.join(src_patched, i), recurse=True)
+
+    dirname = os.path.dirname(src)
+    basename = os.path.basename(src)
+    os.chdir(dirname)
+    out_file = os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF', True))
+    diff_cmd = 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basename, basename, out_file)
+    subprocess.call(diff_cmd, shell=True)
+    bb.utils.remove(src_patched, recurse=True)
+
+# Run do_unpack and do_patch
+python do_unpack_and_patch() {
+    if d.getVarFlag('ARCHIVER_MODE', 'src', True) not in \
+            [ 'patched', 'configured'] and \
+            d.getVarFlag('ARCHIVER_MODE', 'diff', True) != '1':
+        return
 
-def archive_sources_patches(d, stage_name):
-    """
-    archive sources and patches to tarball. stage_name will append
-    strings ${stage_name} to ${PR} as middle name. for example,
-    zlib-1.4.6-prepatch(stage_name).tar.gz
-    """
-    import shutil
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
 
-    check_archiving_type(d)
+    # Change the WORKDIR to make do_unpack do_patch run in another dir.
+    d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
 
-    source_tar_name = archive_sources(d, stage_name)
-    if stage_name == "prepatch":
-        if d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True) == 'yes':
-            patch_tar_name = select_archive_patches(d, "all")
-        elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True) == 'no':
-            patch_tar_name = select_archive_patches(d, "applying")
-        else:
-            bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' to 'yes' or 'no' ")
+    # The kernel source is ready after do_validate_branches
+    if bb.data.inherits_class('kernel-yocto', d):
+        bb.build.exec_func('do_unpack', d)
+        bb.build.exec_func('do_kernel_checkout', d)
+        bb.build.exec_func('do_validate_branches', d)
     else:
-        patch_tar_name = ''
+        bb.build.exec_func('do_unpack', d)
+
+    # Save the original source for creating the patches
+    if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
+        src = d.getVar('S', True).rstrip('/')
+        src_orig = '%s.orig' % src
+        oe.path.copytree(src, src_orig)
+    bb.build.exec_func('do_patch', d)
+    # Create the patches
+    if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
+        bb.note('Creating diff gz...')
+        create_diff_gz(d, src_orig, src, ar_outdir)
+        bb.utils.remove(src_orig, recurse=True)
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
+python do_ar_recipe () {
     """
-    archive scripts and logs. scripts include .bb and .inc files and
-    logs include stuff in "temp".
+    archive the recipe, including .bb and .inc.
     """
+    import re
     import shutil
 
-    work_dir = d.getVar('WORKDIR', True)
-    temp_dir = os.path.join(work_dir, 'temp')
-    source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
-    if source_archive_log_with_scripts == 'logs_with_scripts':
-        logdir = get_logs(d)
-        logdir = get_bb_inc(d)
-    elif source_archive_log_with_scripts == 'logs':
-        logdir = get_logs(d)
-    else:
-        return
-
-    tarlog = archive_logs(d, logdir, True)
-
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) == 'srpm':
-        store_package(d, tarlog)
+    require_re = re.compile( r"require\s+(.+)" )
+    include_re = re.compile( r"include\s+(.+)" )
+    bbfile = d.getVar('FILE', True)
+    outdir = os.path.join(d.getVar('WORKDIR', True), \
+            '%s-recipe' % d.getVar('PF', True))
+    bb.utils.mkdirhier(outdir)
+    shutil.copy(bbfile, outdir)
+
+    dirname = os.path.dirname(bbfile)
+    bbpath = '%s:%s' % (dirname, d.getVar('BBPATH', True))
+    f = open(bbfile, 'r')
+    for line in f.readlines():
+        incfile = None
+        if require_re.match(line):
+            incfile = require_re.match(line).group(1)
+        elif include_re.match(line):
+            incfile = include_re.match(line).group(1)
+        if incfile:
+            incfile = bb.data.expand(incfile, d)
+            incfile = bb.utils.which(bbpath, incfile)
+            if incfile:
+                shutil.copy(incfile, outdir)
+
+    create_tarball(d, outdir, 'recipe', d.getVar('ARCHIVER_OUTDIR', True))
+    bb.utils.remove(outdir, recurse=True)
+}
 
-def dumpdata(d):
+python do_dumpdata () {
     """
-    dump environment to "${P}-${PR}.showdata.dump" including all
-    kinds of variables and functions when running a task
+    dump environment data to ${PF}-showdata.dump
     """
 
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
-
-    bb.note("Dumping metadata into '%s'" % dumpfile)
-    f = open(dumpfile, "w")
+    dumpfile = os.path.join(d.getVar('ARCHIVER_OUTDIR', True), \
+        '%s-showdata.dump' % d.getVar('PF', True))
+    bb.note('Dumping metadata into %s' % dumpfile)
+    f = open(dumpfile, 'w')
     # emit variables and shell functions
     bb.data.emit_env(f, d, True)
     # emit the metadata which isn't valid shell
     for e in d.keys():
         if bb.data.getVarFlag(e, 'python', d):
-            f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
-    f.close()
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
+            f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, True)))
     f.close()
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
-}
-
-# This function will run when user want to get tarball for patched
-# sources after do_patch
-python do_archive_patched_sources(){
-    archive_sources_patches(d, 'patched')
-}
-
-# This function will run when user want to get tarball for configured
-# sources after do_configure
-python do_archive_configured_sources(){
-    archive_sources_patches(d, 'configured')
-}
-
-# This function will run when user want to get tarball for logs or both
-# logs and scripts(.bb and .inc files)
-python do_archive_scripts_logs(){
-    archive_scripts_logs(d)
-}
-
-# This function will run when user want to know what variable and
-# functions in a running task are and also can get a diff file including
-# all content a package should include.
-python do_dumpdata_create_diff_gz(){
-    dumpdata(d)
-    create_diff_gz(d)
-}
-
-# This functions prepare for archiving "linux-yocto" because this
-# package create directory 's' before do_patch instead of after
-# do_unpack.  This is special control for archiving linux-yocto only.
-python do_archive_linux_yocto(){
-    s = d.getVar('S', True)
-    if 'linux-yocto' in s:
-        source_tar_name = archive_sources(d, '')
-    if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-        move_tarball_deploy(d, [source_tar_name, ''])
-}
-do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
-
-# remove tarball for sources, patches and logs after creating srpm.
-python do_delete_tarlist(){
-    work_dir = d.getVar('WORKDIR', True)
-    tarlist = os.path.join(work_dir, 'tar-package')
-    if os.path.exists(tarlist):
-        os.remove(tarlist)
 }
-do_delete_tarlist[deptask] = "do_archive_scripts_logs"
-do_package_write_rpm[postfuncs] += "do_delete_tarlist "
-
-# Get archiving package with temp(logs) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs
-
-# Get dump date and create diff file
-addtask do_dumpdata_create_diff_gz
-
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
 
-SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
-do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_archive_scripts_logs_setscene () {
-    sstate_setscene(d)
+SSTATETASKS += "do_deploy_archives"
+do_deploy_archives () {
+    echo "Deploying source archive files ..."
 }
-
-addtask do_archive_scripts_logs_setscene
-
-SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
-do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_dumpdata_create_diff_gz_setscene () {
+python do_deploy_archives_setscene () {
     sstate_setscene(d)
 }
-
-addtask do_dumpdata_create_diff_gz_setscene
-
-addtask do_archive_original_sources after do_unpack
-addtask do_archive_patched_sources after do_patch
-addtask do_archive_configured_sources after do_configure
+do_deploy_archives[sstate-inputdirs] = "${AR_TOPDIR}"
+do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
+
+addtask do_ar_original after do_unpack
+addtask do_unpack_and_patch after do_patch
+addtask do_ar_patched after do_unpack_and_patch
+addtask do_ar_configured after do_unpack_and_patch
+addtask do_dumpdata
+addtask do_ar_recipe
+addtask do_deploy_archives before do_build
-- 
1.8.3.1


