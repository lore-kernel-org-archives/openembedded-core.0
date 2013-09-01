Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1B86BD5D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2013 07:52:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8185aFm014040 for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Sep 2013 09:05:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Cps1R-DCW51O
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2013 09:05:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8185WuF014032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Sep 2013 09:05:34 +0100
Message-ID: <1378021960.1059.138.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 01 Sep 2013 08:52:40 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: meta: Don't use deprecated bitbake API
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
X-List-Received-Date: Sun, 01 Sep 2013 07:52:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These have been deprecated for a long time, convert the remaining
references to the correct modules and prepare for removal of the 
compatibility support from bitbake.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index e42c419..66efe7d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -99,7 +99,7 @@ def get_bb_inc(d):
     licenses = get_licenses(d)
     script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
     bb_inc = os.path.join(script_logs, 'bb_inc')
-    bb.mkdirhier(bb_inc)
+    bb.utils.mkdirhier(bb_inc)
 
     def find_file(dir, file):
         for root, dirs, files in os.walk(dir):
@@ -139,7 +139,7 @@ def get_logs(d):
     script_logs = os.path.join(work_dir, 'script-logs/'+ target_sys + '/' + licenses + '/' + pf + '/script-logs')
 
     try:
-        bb.mkdirhier(os.path.join(script_logs, 'temp'))
+        bb.utils.mkdirhier(os.path.join(script_logs, 'temp'))
         oe.path.copytree(os.path.join(work_dir, 'temp'), os.path.join(script_logs, 'temp'))
     except (IOError, AttributeError):
         pass
@@ -158,7 +158,7 @@ def get_series(d):
     s = d.getVar('S', True)
     dest = os.path.join(work_dir, pf + '-series')
     shutil.rmtree(dest, ignore_errors=True)
-    bb.mkdirhier(dest)
+    bb.utils.mkdirhier(dest)
 
     src_uri = d.getVar('SRC_URI', True).split()
     fetch = bb.fetch2.Fetch(src_uri, d)
@@ -175,7 +175,7 @@ def get_series(d):
             shutil.copy(patch, dest)
         except IOError:
             if os.path.isdir(patch):
-                bb.mkdirhier(os.path.join(dest, patch))
+                bb.utils.mkdirhier(os.path.join(dest, patch))
                 oe.path.copytree(patch, os.path.join(dest, patch))
     return dest
 
@@ -190,11 +190,11 @@ def get_applying_patches(d):
     work_dir = d.getVar('WORKDIR', True)
     dest = os.path.join(work_dir, pf + '-patches')
     shutil.rmtree(dest, ignore_errors=True)
-    bb.mkdirhier(dest)
+    bb.utils.mkdirhier(dest)
 
     patches = src_patches(d)
     for patch in patches:
-        _, _, local, _, _, parm = bb.decodeurl(patch)
+        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
         if local:
              shutil.copy(local, dest)
     return dest
@@ -357,7 +357,7 @@ def move_tarball_deploy(d, tarball_list):
     work_dir = d.getVar('WORKDIR', True)
     tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
     if not os.path.exists(tar_sources):
-        bb.mkdirhier(tar_sources)
+        bb.utils.mkdirhier(tar_sources)
     for source in tarball_list:
         if source:
             if os.path.exists(os.path.join(tar_sources, source)):
@@ -459,7 +459,7 @@ def dumpdata(d):
     licenses = get_licenses(d)
     dumpdir = os.path.join(workdir, 'diffgz-envdata/'+ target_sys + '/' + licenses + '/' + pf )
     if not os.path.exists(dumpdir):
-        bb.mkdirhier(dumpdir)
+        bb.utils.mkdirhier(dumpdir)
 
     dumpfile = os.path.join(dumpdir, bb.data.expand("${P}-${PR}.showdata.dump", d))
 
@@ -499,7 +499,7 @@ def create_diff_gz(d):
     distro = d.getVar('DISTRO',True) or ""
     dest = s + '/' + distro + '/files'
     if not os.path.exists(dest):
-        bb.mkdirhier(dest)
+        bb.utils.mkdirhier(dest)
     for i in os.listdir(os.getcwd()):
         if os.path.isfile(i):
             try:
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8ad35e4..7d43c7b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -577,7 +577,7 @@ python () {
         d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
 
     # *.xz should depends on xz-native for unpacking
-    # Not endswith because of "*.patch.xz;patch=1". Need bb.decodeurl in future
+    # Not endswith because of "*.patch.xz;patch=1". Need bb.fetch.decodeurl in future
     if '.xz' in srcuri:
         d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index b98ba3b..72fff11 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -175,7 +175,7 @@ python run_buildstats () {
         # set the buildname
         ########################################################################
         try:
-            bb.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
+            bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
         except:
             pass
         set_bn(e)
@@ -185,7 +185,7 @@ python run_buildstats () {
         
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         try:
-            bb.mkdirhier(bsdir)
+            bb.utils.mkdirhier(bsdir)
         except:
             pass
         if device != "NoLogicalDevice":
@@ -236,7 +236,7 @@ python run_buildstats () {
             set_diskdata("__diskdata_task", device, e.data)
         set_timedata("__timedata_task", e.data)
         try:
-            bb.mkdirhier(taskdir)
+            bb.utils.mkdirhier(taskdir)
         except:
             pass
         # write into the task event file the name and start time
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index ca3ca43..2cdce46 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,4 +1,4 @@
-CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
+CCACHE = "${@bb.utils.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 6b30b87..32aa757 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -33,7 +33,7 @@ python do_prepare_copyleft_sources () {
     pf = d.getVar('PF', True)
     dest = os.path.join(sources_dir, pf)
     shutil.rmtree(dest, ignore_errors=True)
-    bb.mkdirhier(dest)
+    bb.utils.mkdirhier(dest)
 
     for u in ud.values():
         local = os.path.normpath(fetch.localpath(u.url))
@@ -51,7 +51,7 @@ python do_prepare_copyleft_sources () {
 
     patches = src_patches(d)
     for patch in patches:
-        _, _, local, _, _, parm = bb.decodeurl(patch)
+        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
         patchdir = parm.get('patchdir')
         if patchdir:
             series = os.path.join(dest, 'series.subdir.%s' % patchdir.replace('/', '_'))
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index aef7973..085575a 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -591,7 +591,7 @@ python do_checkpkg() {
         pupver = "N/A"
         pstatus = "ErrUnknown"
 
-        (type, host, path, user, pswd, parm) = bb.decodeurl(uri)
+        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(uri)
         if type in ['http', 'https', 'ftp']:
                 if d.getVar('PRSPV', True):
                     pcurver = d.getVar('PRSPV', True)
@@ -621,7 +621,7 @@ python do_checkpkg() {
                         dirver = m.group().strip("/")
 
                         """use new path and remove param. for wget only param is md5sum"""
-                        alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
+                        alturi = bb.fetch.encodeurl([type, host, altpath, user, pswd, {}])
                         my_uri = d.getVar('REGEX_URI', True)
                         if my_uri:
                             if d.getVar('PRSPV', True):
@@ -647,7 +647,7 @@ python do_checkpkg() {
 
                         chk_uri = d.getVar('REGEX_URI', True)
                         if not chk_uri:
-                                alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
+                                alturi = bb.fetch.encodeurl([type, host, altpath, user, pswd, {}])
                         else:
                                 alturi = chk_uri
                         newver = check_new_version(alturi, curname, d)
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6cd49fc..4a0946c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -153,7 +153,7 @@ def get_devtable_list(d):
     if devtables == None:
         devtables = 'files/device_table-minimal.txt'
     for devtable in devtables.split():
-        str += " %s" % bb.which(d.getVar('BBPATH', True), devtable)
+        str += " %s" % bb.utils.which(d.getVar('BBPATH', True), devtable)
     return str
 
 IMAGE_CLASSES ?= "image_types"
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index aa02985..524cdca 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -594,7 +594,7 @@ def package_qa_check_license(workdir, d):
     srcdir = d.getVar('S', True)
 
     for url in lic_files.split():
-        (type, host, path, user, pswd, parm) = bb.decodeurl(url)
+        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         srclicfile = os.path.join(srcdir, path)
         if not os.path.isfile(srclicfile):
             raise bb.build.FuncFailed( pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile)
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fcc00e3..26d449a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -9,7 +9,7 @@ def find_patches(d):
     patches = src_patches(d)
     patch_list=[]
     for p in patches:
-        _, _, local, _, _, _ = bb.decodeurl(p)
+        _, _, local, _, _, _ = bb.fetch.decodeurl(p)
         patch_list.append(local)
 
     return patch_list
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 2ca47cc..621c1b2 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -129,9 +129,9 @@ def add_package_and_files(d):
             d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))
 
 def copy_license_files(lic_files_paths, destdir):
-    bb.mkdirhier(destdir)
+    bb.utils.mkdirhier(destdir)
     for (basename, path) in lic_files_paths:
-        ret = bb.copyfile(path, os.path.join(destdir, basename))
+        ret = bb.utils.copyfile(path, os.path.join(destdir, basename))
         # If the copy didn't occur, something horrible went wrong and we fail out
         if not ret:
             bb.warn("%s could not be copied for some reason. It may not exist. WARN for now." % path)
@@ -188,7 +188,7 @@ def find_license_files(d):
 
     def find_license(license_type):
         try:
-            bb.mkdirhier(gen_lic_dest)
+            bb.utils.mkdirhier(gen_lic_dest)
         except:
             pass
         spdx_generic = None
@@ -227,7 +227,7 @@ def find_license_files(d):
         return lic_files_paths
 
     for url in lic_files.split():
-        (type, host, path, user, pswd, parm) = bb.decodeurl(url)
+        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         # We want the license filename and path
         srclicfile = os.path.join(srcdir, path)
         lic_files_paths.append((os.path.basename(path), srclicfile))
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 068c11a..765e894 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -220,7 +220,7 @@ python do_package_deb () {
         basedir = os.path.join(os.path.dirname(root))
 
         pkgoutdir = os.path.join(outdir, localdata.getVar('PACKAGE_ARCH', True))
-        bb.mkdirhier(pkgoutdir)
+        bb.utils.mkdirhier(pkgoutdir)
 
         os.chdir(root)
         from glob import glob
@@ -236,7 +236,7 @@ python do_package_deb () {
             continue
 
         controldir = os.path.join(root, 'DEBIAN')
-        bb.mkdirhier(controldir)
+        bb.utils.mkdirhier(controldir)
         os.chmod(controldir, 0755)
         try:
             ctrlfile = open(os.path.join(controldir, 'control'), 'w')
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 68ffc62..a633cfc 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -253,7 +253,7 @@ python do_package_ipk () {
         basedir = os.path.join(os.path.dirname(root))
         arch = localdata.getVar('PACKAGE_ARCH', True)
         pkgoutdir = "%s/%s" % (outdir, arch)
-        bb.mkdirhier(pkgoutdir)
+        bb.utils.mkdirhier(pkgoutdir)
         os.chdir(root)
         from glob import glob
         g = glob('*')
@@ -268,7 +268,7 @@ python do_package_ipk () {
             continue
 
         controldir = os.path.join(root, 'CONTROL')
-        bb.mkdirhier(controldir)
+        bb.utils.mkdirhier(controldir)
         try:
             ctrlfile = open(os.path.join(controldir, 'control'), 'w')
         except OSError:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a9ec9b2..c58f18a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1069,7 +1069,7 @@ python do_package_rpm () {
             clean_licenses = get_licenses(d)
             pkgwritesrpmdir = bb.data.expand('${PKGWRITEDIRSRPM}/${PACKAGE_ARCH_EXTEND}', d)
             pkgwritesrpmdir = pkgwritesrpmdir + '/' + clean_licenses
-            bb.mkdirhier(pkgwritesrpmdir)
+            bb.utils.mkdirhier(pkgwritesrpmdir)
             os.chmod(pkgwritesrpmdir, 0755)
             return pkgwritesrpmdir
             
@@ -1123,7 +1123,7 @@ python do_package_rpm () {
     pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
     pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}')
     magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
-    bb.mkdirhier(pkgwritedir)
+    bb.utils.mkdirhier(pkgwritedir)
     os.chmod(pkgwritedir, 0755)
 
     cmd = rpmbuild
diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index ed12802..86c65b3 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -44,7 +44,7 @@ def src_patches(d, all = False ):
         if patchdir:
             patchparm['patchdir'] = patchdir
 
-        localurl = bb.encodeurl(('file', '', local, '', '', patchparm))
+        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
         patches.append(localurl)
 
     if all:
@@ -147,7 +147,7 @@ python patch_do_patch() {
     os.environ['TMPDIR'] = process_tmpdir
 
     for patch in src_patches(d):
-        _, _, local, _, _, parm = bb.decodeurl(patch)
+        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)
 
         if "patchdir" in parm:
             patchdir = parm["patchdir"]
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 2f90159..5dd4624 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -73,7 +73,7 @@ def can_delete_FILESPATH(cfgdata, d):
 
 def can_delete_FILESDIR(cfgdata, d):
     expected = cfgdata.get("FILESDIR")
-    #expected = "${@bb.which(d.getVar('FILESPATH', True), '.')}"
+    #expected = "${@bb.utils.which(d.getVar('FILESPATH', True), '.')}"
     unexpanded = d.getVar("FILESDIR", 0)
     if unexpanded is None:
         return False
diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index bde6e49..55ce3af 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -45,9 +45,9 @@ python do_spdx () {
     cur_ver_code = get_ver_code( info['sourcedir'] ) 
     cache_cur = False
     if not os.path.exists( spdx_sstate_dir ):
-        bb.mkdirhier( spdx_sstate_dir )
+        bb.utils.mkdirhier( spdx_sstate_dir )
     if not os.path.exists( info['spdx_temp_dir'] ):
-        bb.mkdirhier( info['spdx_temp_dir'] )
+        bb.utils.mkdirhier( info['spdx_temp_dir'] )
     if os.path.exists( sstatefile ):
         ## cache for this package exists. read it in
         cached_spdx = get_cached_spdx( sstatefile )
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c86f393..b088e58 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -129,7 +129,7 @@ def sstate_install(ss, d):
 
     sharedfiles = []
     shareddirs = []
-    bb.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
+    bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
 
     d2 = d.createCopy()
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
@@ -215,7 +215,7 @@ def sstate_installpkg(ss, d):
         # remove dir if it exists, ensure any parent directories do exist
         if os.path.exists(dir):
             oe.path.remove(dir)
-        bb.mkdirhier(dir)
+        bb.utils.mkdirhier(dir)
         oe.path.remove(dir)
 
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
@@ -281,7 +281,7 @@ def sstate_installpkg(ss, d):
         workdir = d.getVar('WORKDIR', True)
         src = sstateinst + "/" + plain.replace(workdir, '')
         dest = plain
-        bb.mkdirhier(src)
+        bb.utils.mkdirhier(src)
         prepdir(dest)
         os.rename(src, dest)
 
@@ -456,8 +456,8 @@ def sstate_package(ss, d):
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['name'])
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['name'] + ".tgz"
     bb.utils.remove(sstatebuild, recurse=True)
-    bb.mkdirhier(sstatebuild)
-    bb.mkdirhier(os.path.dirname(sstatepkg))
+    bb.utils.mkdirhier(sstatebuild)
+    bb.utils.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
@@ -477,8 +477,8 @@ def sstate_package(ss, d):
     workdir = d.getVar('WORKDIR', True)
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
-        bb.mkdirhier(plain)
-        bb.mkdirhier(pdir)
+        bb.utils.mkdirhier(plain)
+        bb.utils.mkdirhier(pdir)
         oe.path.copyhardlinktree(plain, pdir)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
@@ -503,7 +503,7 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     bb.data.update_data(localdata)
 
     dldir = localdata.expand("${SSTATE_DIR}")
-    bb.mkdirhier(dldir)
+    bb.utils.mkdirhier(dldir)
 
     localdata.delVar('MIRRORS')
     localdata.delVar('FILESPATH')
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 591b4ac..efbc4eb 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -20,7 +20,7 @@ def emit_terminal_func(command, envdata, d):
     runfmt = d.getVar('BB_RUNFMT', True) or "run.{func}.{pid}"
     runfile = runfmt.format(func=cmd_func, task=cmd_func, taskfunc=cmd_func, pid=os.getpid())
     runfile = os.path.join(d.getVar('T', True), runfile)
-    bb.mkdirhier(os.path.dirname(runfile))
+    bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
         script.write('#!/bin/sh -e\n')
diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
index d6cac74..5590f7a 100644
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -114,7 +114,7 @@ def populate_toolchain_links(d):
         bb.fatal("Unable to populate toolchain binary symlinks in %s" % pattern)
 
     bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
-    bb.mkdirhier(bindir)
+    bb.utils.mkdirhier(bindir)
     for f in files:
         base = os.path.basename(f)
         newpath = os.path.join(bindir, base)
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 244f6c5..59abd0a 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -331,7 +331,7 @@ class QuiltTree(PatchSet):
             patch = self.patches[kwargs["patch"]]
             if not patch:
                 raise PatchError("No patch found at index %s in patchset." % kwargs["patch"])
-            (type, host, path, user, pswd, parm) = bb.decodeurl(patch["remote"])
+            (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(patch["remote"])
             if type == "file":
                 import shutil
                 if not patch.get("file") and patch.get("remote"):
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index ae743cc..507c062 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -13,6 +13,6 @@ do_configure() {
 	oe_runconf
 }
 
-export AUTOMAKE = "${@bb.which('automake', d.getVar('PATH', True))}"
+export AUTOMAKE = "${@bb.utils.which('automake', d.getVar('PATH', True))}"
 
 FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index f89aa8e..005aa6b 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -34,7 +34,7 @@ python gcc_multilib_setup() {
             rel_path = os.path.relpath(fn, src_conf_dir)
             parent_dir = os.path.dirname(rel_path)
             bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
-            bb.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
+            bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
 
     multilibs = (d.getVar('MULTILIB_VARIANTS', True) or '').split()
     if not multilibs:
diff --git a/meta/recipes-support/libpcre/libpcre_8.33.bb b/meta/recipes-support/libpcre/libpcre_8.33.bb
index 50930b4..caf877f 100644
--- a/meta/recipes-support/libpcre/libpcre_8.33.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.33.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "c603957a4966811c04af5f6048c71cfb4966ec93312d7b3118116ed9f3
 
 S = "${WORKDIR}/pcre-${PV}"
 
-FILESPATH .= ":${@base_set_filespath([bb.which(BBPATH, 'recipes-support/libpcre/files', direction=True)], d)}"
+FILESPATH .= ":${@base_set_filespath([bb.utils.which(BBPATH, 'recipes-support/libpcre/files', direction=True)], d)}"
 
 PROVIDES += "pcre"
 DEPENDS += "bzip2 zlib"



