Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 652B671B45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 11:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v06Bnibp006279; Fri, 6 Jan 2017 11:49:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XUsjFaCngIeI; Fri,  6 Jan 2017 11:49:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v06BncaR006274
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 6 Jan 2017 11:49:39 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cPT1e-0005HD-5B; Fri, 06 Jan 2017 11:49:38 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 11:49:35 +0000
Message-Id: <1483703375-20241-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] meta/scripts: Various getVar/getVarFlag expansion parameter fixes
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
X-List-Received-Date: Fri, 06 Jan 2017 11:49:47 -0000

There were a few straggling expansion parameter removals left for
getVar/getVarFlag where the odd whitespace meant they were missed
on previous passes. There were also some plain broken ussages such
as:

d.getVar('ALTERNATIVE_TARGET', old_name, True)
path = d.getVar('PATH', d, True)
d.getVar('IMAGE_ROOTFS', 'True')

which I've corrected (they happend to work by luck).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/blacklist.bbclass                     |  2 +-
 meta/classes/bugzilla.bbclass                      |  4 ++--
 meta/classes/cml1.bbclass                          |  2 +-
 meta/classes/compress_doc.bbclass                  |  2 +-
 meta/classes/gummiboot.bbclass                     | 14 +++++------
 meta/classes/insane.bbclass                        |  4 ++--
 meta/classes/kernel-yocto.bbclass                  |  6 ++---
 meta/classes/license.bbclass                       |  4 ++--
 meta/classes/multilib.bbclass                      |  2 +-
 meta/classes/package.bbclass                       |  4 ++--
 meta/classes/packagefeed-stability.bbclass         |  2 +-
 meta/classes/populate_sdk_ext.bbclass              |  2 +-
 meta/classes/qemu.bbclass                          |  2 +-
 meta/classes/sanity.bbclass                        |  4 ++--
 meta/classes/systemd.bbclass                       |  2 +-
 meta/classes/tinderclient.bbclass                  | 28 +++++++++++-----------
 meta/classes/uninative.bbclass                     |  2 +-
 meta/classes/utils.bbclass                         |  2 +-
 meta/conf/bitbake.conf                             |  2 +-
 meta/conf/multilib.conf                            |  2 +-
 meta/lib/oe/package_manager.py                     |  6 ++---
 meta/lib/oe/utils.py                               |  2 +-
 meta/lib/oeqa/runtime/_ptest.py                    |  2 +-
 meta/recipes-core/glibc/glibc-ld.inc               |  2 +-
 meta/recipes-core/meta/meta-environment-extsdk.bb  |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |  2 +-
 meta/recipes-support/attr/ea-acl.inc               |  4 ++--
 scripts/lib/devtool/package.py                     |  2 +-
 scripts/lib/devtool/upgrade.py                     |  2 +-
 29 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index 6513819..3413a5b 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -38,7 +38,7 @@ python blacklist_multilib_eventhandler() {
 }
 
 python () {
-    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN'), True)
+    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN'))
 
     if blacklist:
         raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blacklist))
diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
index 6d9a821..8909c27 100644
--- a/meta/classes/bugzilla.bbclass
+++ b/meta/classes/bugzilla.bbclass
@@ -117,7 +117,7 @@ python bugzilla_eventhandler() {
         compon  = data.getVar("BUGZILLA_COMPONENT")
         version = data.getVar("BUGZILLA_VERSION")
 
-        proxy   = data.getVar('http_proxy', True )
+        proxy   = data.getVar('http_proxy')
         if (proxy):
             import urllib2
             s, u, p, hostport = urllib2._parse_proxy(proxy)
@@ -140,7 +140,7 @@ python bugzilla_eventhandler() {
                                                            "pv"      : data.getVar("PV"),
                                                            }
         log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T'), event.task))
-        text     = "The %s step in %s failed at %s for machine %s" % (e.task, data.getVar("PN"), data.getVar('DATETIME'), data.getVar( 'MACHINE', True ) )
+        text     = "The %s step in %s failed at %s for machine %s" % (e.task, data.getVar("PN"), data.getVar('DATETIME'), data.getVar('MACHINE') )
         if len(log_file) != 0:
             print >> debug_file, "Adding log file %s" % log_file[0]
             file = open(log_file[0], 'r')
diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 187d407..38e6613 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -27,7 +27,7 @@ python do_menuconfig() {
         mtime = 0
 
     oe_terminal("${SHELL} -c \"make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
-                d.getVar('PN', True ) + ' Configuration', d)
+                d.getVar('PN') + ' Configuration', d)
 
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
diff --git a/meta/classes/compress_doc.bbclass b/meta/classes/compress_doc.bbclass
index ba97721..069d534 100644
--- a/meta/classes/compress_doc.bbclass
+++ b/meta/classes/compress_doc.bbclass
@@ -249,7 +249,7 @@ python compress_doc_updatealternatives () {
                     d.setVarFlag('ALTERNATIVE_TARGET', new_name, new_target)
                 elif d.getVar('ALTERNATIVE_TARGET_%s' % pkg):
                     d.setVar('ALTERNATIVE_TARGET_%s' % pkg, new_target)
-                elif d.getVar('ALTERNATIVE_TARGET', old_name, True):
+                elif d.getVar('ALTERNATIVE_TARGET'):
                     d.setVar('ALTERNATIVE_TARGET', new_target)
 
                 new_names.append(new_name)
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 4f2dea6..5aaf766 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -60,8 +60,8 @@ efi_hddimg_populate() {
 }
 
 python build_efi_cfg() {
-    s = d.getVar("S", True)
-    labels = d.getVar('LABELS', True)
+    s = d.getVar("S")
+    labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
         return
@@ -70,7 +70,7 @@ python build_efi_cfg() {
         bb.debug(1, "No labels, nothing to do")
         return
 
-    cfile = d.getVar('GUMMIBOOT_CFG', True)
+    cfile = d.getVar('GUMMIBOOT_CFG')
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
@@ -78,7 +78,7 @@ python build_efi_cfg() {
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
-    timeout = d.getVar('GUMMIBOOT_TIMEOUT', True)
+    timeout = d.getVar('GUMMIBOOT_TIMEOUT')
     if timeout:
         cfgfile.write('timeout %s\n' % timeout)
     else:
@@ -88,7 +88,7 @@ python build_efi_cfg() {
     for label in labels.split():
         localdata = d.createCopy()
 
-        overrides = localdata.getVar('OVERRIDES', True)
+        overrides = localdata.getVar('OVERRIDES')
         if not overrides:
             bb.fatal('OVERRIDES not defined')
 
@@ -104,8 +104,8 @@ python build_efi_cfg() {
         entrycfg.write('title %s\n' % label)
         entrycfg.write('linux /vmlinuz\n')
 
-        append = localdata.getVar('APPEND', True)
-        initrd = localdata.getVar('INITRD', True)
+        append = localdata.getVar('APPEND')
+        initrd = localdata.getVar('INITRD')
 
         if initrd:
             entrycfg.write('initrd /initrd\n')
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f8f6e00..632821c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -336,7 +336,7 @@ def package_qa_check_libdir(d):
     import re
 
     pkgdest = d.getVar('PKGDEST')
-    base_libdir = d.getVar("base_libdir",True) + os.sep
+    base_libdir = d.getVar("base_libdir") + os.sep
     libdir = d.getVar("libdir") + os.sep
     libexecdir = d.getVar("libexecdir") + os.sep
     exec_prefix = d.getVar("exec_prefix") + os.sep
@@ -568,7 +568,7 @@ def package_qa_check_desktop(path, name, d, elf, messages):
     Run all desktop files through desktop-file-validate.
     """
     if path.endswith(".desktop"):
-        desktop_file_validate = os.path.join(d.getVar('STAGING_BINDIR_NATIVE',True),'desktop-file-validate')
+        desktop_file_validate = os.path.join(d.getVar('STAGING_BINDIR_NATIVE'),'desktop-file-validate')
         output = os.popen("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c7fff5a..5cfd8af 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -286,7 +286,7 @@ python do_kernel_configcheck() {
     # if KMETA isn't set globally by a recipe using this routine, we need to
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
     # meta-series for processing
-    kmeta = d.getVar( "KMETA", True ) or "meta"
+    kmeta = d.getVar("KMETA") or "meta"
     if not os.path.exists(kmeta):
         kmeta = "." + kmeta
 
@@ -298,8 +298,8 @@ python do_kernel_configcheck() {
     cmd = d.expand("cd ${S}; kconf_check --report -o ${S}/%s/cfg/ ${B}/.config ${S} %s" % (kmeta,configs))
     ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
 
-    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
-    bsp_check_visibility = int(d.getVar( "KCONF_BSP_AUDIT_LEVEL", True ) or 0)
+    config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
+    bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
 
     # if config check visibility is non-zero, report dropped configuration values
     mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 009ee4a..44467d0 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -117,7 +117,7 @@ def write_license_files(d, license_manifest, pkg_dic):
     copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
     copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
     if copy_lic_manifest == "1":
-        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS', 'True'), 
+        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS'), 
                                 'usr', 'share', 'common-licenses')
         bb.utils.mkdirhier(rootfs_license_dir)
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
@@ -516,7 +516,7 @@ def canonical_license(d, license):
     """
     lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
     if not lic and license.endswith('+'):
-        lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'), True)
+        lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'))
         if lic:
             lic += '+'
     return lic or license
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 498f7f5..a4f70f2 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -119,7 +119,7 @@ PACKAGEFUNCS_append = " do_package_qa_multilib"
 python do_package_qa_multilib() {
 
     def check_mlprefix(pkg, var, mlprefix):
-        values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var) or "")
+        values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg)) or d.getVar(var) or "")
         candidates = []
         for i in values:
             if i.startswith('virtual/'):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e177e77..568b85c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1286,11 +1286,11 @@ python emit_pkgdata() {
             c = codecs.getencoder("unicode_escape")
             return c(str)[0].decode("latin1")
 
-        val = d.getVar('%s_%s' % (var, pkg), True)
+        val = d.getVar('%s_%s' % (var, pkg))
         if val:
             f.write('%s_%s: %s\n' % (var, pkg, encode(val)))
             return val
-        val = d.getVar('%s' % (var), True)
+        val = d.getVar('%s' % (var))
         if val:
             f.write('%s: %s\n' % (var, encode(val)))
         return val
diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index f30dc70..04d2ef4 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -84,7 +84,7 @@ def package_compare_impl(pkgtype, d):
     import oe.sstatesig
 
     pn = d.getVar('PN')
-    deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), True)
+    deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper())
     prepath = deploydir + '-prediff/'
 
     # Find out PKGR values are
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d1b3fb4..f21ae8b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -512,7 +512,7 @@ install_tools() {
 	# (they get populated from sstate on installation)
 	unfsd_path="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
 	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" -a ! -e $unfsd_path ] ; then
-		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True), d.getVar('TOPDIR'))}
+		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE'), d.getVar('TOPDIR'))}
 		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd $unfsd_path
 	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 6167582..f5c5780 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -52,7 +52,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH'), True) or ""}"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9674ae9..c876dc6 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -199,7 +199,7 @@ def check_toolchain_tune_args(data, tune, multilib, errs):
 
 def check_toolchain_args_present(data, tune, multilib, tune_errors, which):
     args_set = (data.getVar("TUNE_%s" % which) or "").split()
-    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s_tune-%s" % (which, tune), True) or "").split()
+    args_wanted = (data.getVar("TUNEABI_REQUIRED_%s_tune-%s" % (which, tune)) or "").split()
     args_missing = []
 
     # If no args are listed/required, we are done.
@@ -455,7 +455,7 @@ def check_gcc_march(sanity_data):
     message = ""
 
     # Check if -march not in BUILD_CFLAGS
-    if sanity_data.getVar("BUILD_CFLAGS",True).find("-march") < 0:
+    if sanity_data.getVar("BUILD_CFLAGS").find("-march") < 0:
         result = False
 
         # Construct a test file
diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 34bfefa..0b1c228 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -69,7 +69,7 @@ python systemd_populate_packages() {
         return
 
     def get_package_var(d, var, pkg):
-        val = (d.getVar('%s_%s' % (var, pkg), True) or "").strip()
+        val = (d.getVar('%s_%s' % (var, pkg)) or "").strip()
         if val == "":
             val = (d.getVar(var) or "").strip()
         return val
diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
index 706a392..00f453c 100644
--- a/meta/classes/tinderclient.bbclass
+++ b/meta/classes/tinderclient.bbclass
@@ -82,7 +82,7 @@ def tinder_format_http_post(d,status,log):
     # we only need on build_status.pl but sending it
     # always does not hurt
     try:
-        f = open(d.getVar('TMPDIR',True)+'/tinder-machine.id', 'r')
+        f = open(d.getVar('TMPDIR')+'/tinder-machine.id', 'r')
         id = f.read()
         variables['machine_id'] = id
     except:
@@ -106,8 +106,8 @@ def tinder_build_start(d):
 
     # get the body and type
     content_type, body = tinder_format_http_post(d,None,None)
-    server = d.getVar('TINDER_HOST', True )
-    url    = d.getVar('TINDER_URL', True )
+    server = d.getVar('TINDER_HOST')
+    url    = d.getVar('TINDER_URL')
 
     selector = url + "/xml/build_start.pl"
 
@@ -163,16 +163,16 @@ def tinder_print_info(d):
     time    = tinder_time_string()
     ops     = os.uname()[0]
     version = os.uname()[2]
-    url     = d.getVar( 'TINDER_URL' , True )
-    tree    = d.getVar( 'TINDER_TREE', True )
-    branch  = d.getVar( 'TINDER_BRANCH', True )
-    srcdate = d.getVar( 'SRCDATE', True )
-    machine = d.getVar( 'MACHINE', True )
-    distro  = d.getVar( 'DISTRO', True )
-    bbfiles = d.getVar( 'BBFILES', True )
-    tarch   = d.getVar( 'TARGET_ARCH', True )
-    fpu     = d.getVar( 'TARGET_FPU', True )
-    oerev   = d.getVar( 'OE_REVISION', True ) or "unknown"
+    url     = d.getVar('TINDER_URL')
+    tree    = d.getVar('TINDER_TREE')
+    branch  = d.getVar('TINDER_BRANCH')
+    srcdate = d.getVar('SRCDATE')
+    machine = d.getVar('MACHINE')
+    distro  = d.getVar('DISTRO')
+    bbfiles = d.getVar('BBFILES')
+    tarch   = d.getVar('TARGET_ARCH')
+    fpu     = d.getVar('TARGET_FPU')
+    oerev   = d.getVar('OE_REVISION') or "unknown"
 
     # there is a bug with tipple quoted strings
     # i will work around but will fix the original
@@ -326,7 +326,7 @@ def tinder_do_tinder_report(event):
         status = 100
         # Check if we have a old status...
         try:
-            h = open(event.data.getVar('TMPDIR',True)+'/tinder-status', 'r')
+            h = open(event.data.getVar('TMPDIR')+'/tinder-status', 'r')
             status = int(h.read())
         except:
             pass
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 03ad5d6..54f63af 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -20,7 +20,7 @@ python uninative_event_fetchloader() {
     loader isn't already present.
     """
 
-    chksum = d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH"), True)
+    chksum = d.getVarFlag("UNINATIVE_CHECKSUM", d.getVar("BUILD_ARCH"))
     if not chksum:
         bb.fatal("Uninative selected but not configured correctly, please set UNINATIVE_CHECKSUM[%s]" % d.getVar("BUILD_ARCH"))
 
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 640daed..d834a8a 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -307,7 +307,7 @@ hardlinkdir () {
 
 def check_app_exists(app, d):
     app = d.expand(app).strip()
-    path = d.getVar('PATH', d, True)
+    path = d.getVar('PATH')
     return bool(bb.utils.which(path, app))
 
 def explode_deps(s):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7b0ae65..40efb95 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -561,7 +561,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
-SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'], True)}"
+SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"
 
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index ce97d5d..4dc0543 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,5 +1,5 @@
 
-baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID'), True) or d.getVar('BASELIB')}"
+baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE') or 'INVALID')) or d.getVar('BASELIB')}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e557473..a8644cc 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -129,11 +129,9 @@ class RpmIndexer(Indexer):
                     if default_tune:
                         localdata.setVar("DEFAULTTUNE", default_tune)
                         bb.data.update_data(localdata)
-                        package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
-                                                                  True).split()
+                        package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS').split()
                         package_archs[eext[1]].reverse()
-                        target_os[eext[1]] = localdata.getVar("TARGET_OS",
-                                                              True).strip()
+                        target_os[eext[1]] = localdata.getVar("TARGET_OS").strip()
 
         ml_prefix_list = collections.OrderedDict()
         for mlib in package_archs:
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 3de21fc..76806b5 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -30,7 +30,7 @@ def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    result = bb.utils.vercmp_string(d.getVar(variable,True), checkvalue)
+    result = bb.utils.vercmp_string(d.getVar(variable), checkvalue)
     if result <= 0:
         return truevalue
     else:
diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index cfb4041..a243251 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -99,7 +99,7 @@ class PtestRunnerTest(oeRuntimeTest):
         return complementary_pkgs.split()
 
     def setUpLocal(self):
-        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME'))
+        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR"), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME'))
 
     @skipUnlessPassed('test_ssh')
     def test_ptestrunner(self):
diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index 547c235..c266437 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -26,7 +26,7 @@ def glibc_dl_info(d):
     ld_append_if_tune_exists(d, infos, ld_info_all)
 
     #DEFAULTTUNE_MULTILIB_ORIGINAL
-    original_tune=d.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL",True)
+    original_tune=d.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
     if original_tune:
         localdata = bb.data.createCopy(d)
         localdata.setVar("DEFAULTTUNE", original_tune)
diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/recipes-core/meta/meta-environment-extsdk.bb
index 52012cc..76d2661 100644
--- a/meta/recipes-core/meta/meta-environment-extsdk.bb
+++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
@@ -6,7 +6,7 @@ PN = "meta-environment-extsdk-${MACHINE}"
 
 create_sdk_files_append() {
 	local sysroot=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET'), d.getVar('TOPDIR'))}
-	local sdkpathnative=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE',True), d.getVar('TOPDIR'))}
+	local sdkpathnative=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE'), d.getVar('TOPDIR'))}
 
 	toolchain_create_sdk_env_script '' '' $sysroot '' ${bindir_native} ${prefix_native} $sdkpathnative
 }
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 078d752..30d2243 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -33,7 +33,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 python __anonymous () {
-    major = d.getVar("PV",True).split('.')[0]
+    major = d.getVar("PV").split('.')[0]
     if major == "3":
         d.setVar("HEADER_FETCH_VER", "3.0")
     elif major == "4":
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 8750c3b..cc33c10 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -21,8 +21,8 @@ do_install_append_class-native () {
 	if test "${libdir}" = "${base_libdir}" ; then
 		return
 	fi
-	librelpath=${@os.path.relpath(d.getVar('libdir',True), d.getVar('base_libdir'))}
-	baselibrelpath=${@os.path.relpath(d.getVar('base_libdir',True), d.getVar('libdir'))}
+	librelpath=${@os.path.relpath(d.getVar('libdir'), d.getVar('base_libdir'))}
+	baselibrelpath=${@os.path.relpath(d.getVar('base_libdir'), d.getVar('libdir'))}
 
 	# Remove bad symlinks & create the correct symlinks
 	if test -L ${D}${libdir}/lib${BPN}.so ; then
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index b4f4720..af9e8f1 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -34,7 +34,7 @@ def package(args, config, basepath, workspace):
         if not image_pkgtype:
             image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE')
 
-        deploy_dir_pkg = tinfoil.config_data.getVar('DEPLOY_DIR_%s' % image_pkgtype.upper(), True)
+        deploy_dir_pkg = tinfoil.config_data.getVar('DEPLOY_DIR_%s' % image_pkgtype.upper())
     finally:
         tinfoil.shutdown()
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 9595f3e..c334342 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -117,7 +117,7 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d)
     brf = os.path.basename(os.path.splitext(rc)[0]) # rc basename
 
     srctree = os.path.abspath(srctree)
-    pn = d.getVar('PN',True)
+    pn = d.getVar('PN')
     af = os.path.join(appendpath, '%s.bbappend' % brf)
     with open(af, 'w') as f:
         f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
-- 
2.7.4


