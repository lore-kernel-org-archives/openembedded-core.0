Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S435V-000584-2P for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 05:30:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244LqKK020443
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:21:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20117-07 for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2012 04:21:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244LSGk020390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:21:33 GMT
Message-ID: <1330834891.3949.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 03 Mar 2012 20:21:31 -0800
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] meta: Replace bb.data.expand(xxx, d) -> d.expand(xxx)
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
X-List-Received-Date: Sun, 04 Mar 2012 04:30:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

sed \
 -e 's:bb.data.\(expand([^,()]*\), *\([^) ]*\) *):\2.\1):g' \
 -i `grep -ril bb.data.expand *`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                          |    4 +-
 meta/classes/buildstats.bbclass                    |   12 ++++----
 meta/classes/cpan-base.bbclass                     |    2 +-
 meta/classes/icecc.bbclass                         |   26 ++++++++--------
 meta/classes/image-swab.bbclass                    |    2 +-
 meta/classes/insane.bbclass                        |    2 +-
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 meta/classes/package.bbclass                       |   24 ++++++++--------
 meta/classes/package_deb.bbclass                   |    2 +-
 meta/classes/package_rpm.bbclass                   |    6 ++--
 meta/classes/package_tar.bbclass                   |    4 +-
 meta/classes/recipe_sanity.bbclass                 |    6 ++--
 meta/classes/relocatable.bbclass                   |    8 ++--
 meta/classes/sanity.bbclass                        |   18 ++++++------
 meta/classes/sourcepkg.bbclass                     |    4 +-
 meta/classes/sstate.bbclass                        |   30 ++++++++++----------
 meta/classes/syslinux.bbclass                      |    2 +-
 meta/classes/utility-tasks.bbclass                 |    2 +-
 meta/conf/distro/include/csl-versions.inc          |    4 +-
 meta/conf/distro/include/tcmode-external-csl.inc   |    2 +-
 meta/lib/oe/data.py                                |    2 +-
 meta/lib/oe/packagedata.py                         |   12 ++++----
 meta/recipes-connectivity/connman/connman.inc      |    4 +-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    4 +-
 meta/recipes-core/busybox/busybox.inc              |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    4 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-devtools/apt/apt-native.inc           |    2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    2 +-
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 meta/recipes-graphics/directfb/directfb.inc        |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 .../gstreamer/gst-plugins-package.inc              |    8 ++--
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    4 +-
 meta/recipes-qt/qt4/qt4.inc                        |   22 +++++++-------
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    2 +-
 44 files changed, 129 insertions(+), 129 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 48e4a28..82dcda9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -122,7 +122,7 @@ def generate_git_config(e):
                 gitconfig_path = e.data.getVar('GIT_CONFIG', True)
                 proxy_command = "    gitProxy = %s\n" % data.getVar('OE_GIT_PROXY_COMMAND', e.data, True)
 
-                bb.mkdirhier(bb.data.expand("${GIT_CONFIG_PATH}", e.data))
+                bb.mkdirhier(e.data.expand("${GIT_CONFIG_PATH}"))
                 if (os.path.exists(gitconfig_path)):
                         os.remove(gitconfig_path)
 
@@ -307,7 +307,7 @@ python () {
         def appendVar(varname, appends):
             if not appends:
                 return
-            varname = bb.data.expand(varname, d)
+            varname = d.expand(varname)
             d.appendVar(varname, " " + " ".join(appends))
 
         extradeps = []
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index efd3426..dc9afb1 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -132,7 +132,7 @@ def get_timedata(var, data):
 def write_task_data(status, logfile, dev, e):
     bn = get_bn(e)
     bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-    taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+    taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
     file = open(os.path.join(logfile), "a")
     timedata = get_timedata("__timedata_task", e.data)
     if timedata:
@@ -205,7 +205,7 @@ python run_buildstats () {
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         build_time = os.path.join(bsdir, "build_stats")
         file = open(build_time, "a")
         ########################################################################
@@ -230,7 +230,7 @@ python run_buildstats () {
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         if device != "NoLogicalDevice":
             set_diskdata("__diskdata_task", device, e.data)
         set_timedata("__timedata_task", e.data)
@@ -248,7 +248,7 @@ python run_buildstats () {
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         write_task_data("passed", os.path.join(taskdir, e.task), device, e)
         if e.task == "do_rootfs":
             bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
@@ -263,7 +263,7 @@ python run_buildstats () {
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         write_task_data("failed", os.path.join(taskdir, e.task), device, e)
         ########################################################################
         # Lets make things easier and tell people where the build failed in 
@@ -272,7 +272,7 @@ python run_buildstats () {
         ########################################################################
         build_status = os.path.join(bsdir, "build_stats")
         file = open(build_status,"a")
-        file.write(bb.data.expand("Failed at: ${PF} at task: %s \n" % e.task, e.data))
+        file.write(e.data.expand("Failed at: ${PF} at task: %s \n" % e.task))
         file.close()
         
 }
diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 6cb1fef..b4b7b81 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -12,7 +12,7 @@ PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
 # Determine the staged version of perl from the perl configuration file
 def get_perl_version(d):
 	import re
-    	cfg = bb.data.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh', d)
+    	cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
 	try:
 		f = open(cfg, 'r')
 	except IOError:
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index a14e02d..4557073 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -39,7 +39,7 @@ def icecc_dep_prepend(d):
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
 def get_cross_kernel_cc(bb,d):
-    kernel_cc = bb.data.expand('${KERNEL_CC}', d)
+    kernel_cc = d.expand('${KERNEL_CC}')
     kernel_cc = kernel_cc.replace('ccache', '').strip()
     kernel_cc = kernel_cc.split(' ')[0]
     kernel_cc = kernel_cc.strip()
@@ -49,7 +49,7 @@ def create_path(compilers, bb, d):
     """
     Create Symlinks for the icecc in the staging directory
     """
-    staging = os.path.join(bb.data.expand('${STAGING_BINDIR}', d), "ice")
+    staging = os.path.join(d.expand('${STAGING_BINDIR}'), "ice")
     if icc_is_kernel(bb, d):
         staging += "-kernel"
 
@@ -78,7 +78,7 @@ def create_path(compilers, bb, d):
     return staging
 
 def use_icc(bb,d):
-    package_tmp = bb.data.expand('${PN}', d)
+    package_tmp = d.expand('${PN}')
 
     system_class_blacklist = [ "none" ] 
     user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
@@ -101,7 +101,7 @@ def use_icc(bb,d):
             return "no"
 
     if d.getVar('PARALLEL_MAKE') == "":
-        bb.note(package_tmp, " ", bb.data.expand('${PV}', d), " has empty PARALLEL_MAKE, disable icecc")
+        bb.note(package_tmp, " ", d.expand('${PV}'), " has empty PARALLEL_MAKE, disable icecc")
         return "no"
 
     return "yes"
@@ -124,19 +124,19 @@ def icc_version(bb, d):
 
     if icc_is_native(bb, d):
         archive_name = "local-host-env"
-    elif bb.data.expand('${HOST_PREFIX}', d) == "":
-        bb.fatal(bb.data.expand("${PN}", d), " NULL prefix")
+    elif d.expand('${HOST_PREFIX}') == "":
+        bb.fatal(d.expand("${PN}"), " NULL prefix")
     else:
-        prefix = bb.data.expand('${HOST_PREFIX}' , d)
-        distro = bb.data.expand('${DISTRO}', d)
-        target_sys = bb.data.expand('${TARGET_SYS}', d)
+        prefix = d.expand('${HOST_PREFIX}' )
+        distro = d.expand('${DISTRO}')
+        target_sys = d.expand('${TARGET_SYS}')
         float = d.getVar('TARGET_FPU') or "hard"
         archive_name = prefix + distro + "-"        + target_sys + "-" + float
         if icc_is_kernel(bb, d):
             archive_name += "-kernel"
 
     import socket
-    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
+    ice_dir = d.expand('${STAGING_DIR_NATIVE}${prefix_native}')
     tar_file = os.path.join(ice_dir, 'ice', archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
 
     return tar_file
@@ -146,7 +146,7 @@ def icc_path(bb,d):
         return create_path( [get_cross_kernel_cc(bb,d), ], bb, d)
 
     else:
-        prefix = bb.data.expand('${HOST_PREFIX}', d)
+        prefix = d.expand('${HOST_PREFIX}')
         return create_path( [prefix+"gcc", prefix+"g++"], bb, d)      
 
 def icc_get_tool(bb, d, tool):
@@ -155,8 +155,8 @@ def icc_get_tool(bb, d, tool):
     elif icc_is_kernel(bb, d):
         return os.popen("which %s" % get_cross_kernel_cc(bb, d)).read()[:-1]
     else:
-        ice_dir = bb.data.expand('${STAGING_BINDIR_TOOLCHAIN}', d)
-        target_sys = bb.data.expand('${TARGET_SYS}',  d)
+        ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
+        target_sys = d.expand('${TARGET_SYS}')
         return os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
 
 set_icecc_env() {
diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bbclass
index 5aace0f..0414653 100644
--- a/meta/classes/image-swab.bbclass
+++ b/meta/classes/image-swab.bbclass
@@ -54,7 +54,7 @@ python() {
        deps = (d.getVarFlag('do_setscene', 'depends') or "").split()
        deps.append('strace-native:do_populate_sysroot')
        d.setVarFlag('do_setscene', 'depends', " ".join(deps))
-       logdir = bb.data.expand("${TRACE_LOGDIR}", d)
+       logdir = d.expand("${TRACE_LOGDIR}")
        bb.utils.mkdirhier(logdir)
     else:
        d.setVar('STRACEFUNC', '')
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7a84465..6298136 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -673,7 +673,7 @@ python do_package_qa () {
 python do_qa_staging() {
     bb.note("QA checking staging")
 
-    if not package_qa_check_staged(bb.data.expand('${SYSROOT_DESTDIR}/${STAGING_LIBDIR}',d), d):
+    if not package_qa_check_staged(d.expand('${SYSROOT_DESTDIR}/${STAGING_LIBDIR}'), d):
         bb.fatal("QA staging was broken by the package built above")
 }
 
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 187e3cc..aabca78 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -244,7 +244,7 @@ python do_kernel_configcheck() {
     bb.plain("NOTE: validating kernel configuration")
 
     pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
-    cmd = bb.data.expand("cd ${B}/..; kconf_check -config- ${B} ${S} ${B} ${KBRANCH}",d )
+    cmd = d.expand("cd ${B}/..; kconf_check -config- ${B} ${S} ${B} ${KBRANCH}")
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 5c42619..e8c4497 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -195,10 +195,10 @@ def splitfile(file, debugfile, debugsrcdir, d):
     dvar = d.getVar('PKGD', True)
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     objcopy = d.getVar("OBJCOPY", True)
-    debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
+    debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
     workdir = d.getVar("WORKDIR", True)
     workparentdir = os.path.dirname(workdir)
-    sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
+    sourcefile = d.expand("${WORKDIR}/debugsources.list")
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
@@ -238,11 +238,11 @@ def splitfile2(debugsrcdir, d):
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     strip = d.getVar("STRIP", True)
     objcopy = d.getVar("OBJCOPY", True)
-    debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
+    debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
     workdir = d.getVar("WORKDIR", True)
     workparentdir = os.path.dirname(workdir)
     workbasedir = os.path.basename(workdir)
-    sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
+    sourcefile = d.expand("${WORKDIR}/debugsources.list")
 
     if debugsrcdir:
        nosuchdir = []
@@ -624,7 +624,7 @@ python fixup_perms () {
 				if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
 					bb.error("Fixup perms: %s invalid line: %s" % (conf, line))
 					continue
-				entry = fs_perms_entry(bb.data.expand(line, d))
+				entry = fs_perms_entry(d.expand(line))
 				if entry and entry.path:
 					fs_perms_table[entry.path] = entry
 			f.close()
@@ -1071,9 +1071,9 @@ python emit_pkgdata() {
 	pkgdatadir = d.getVar('PKGDESTWORK', True)
 
 	# Take shared lock since we're only reading, not writing
-	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d), True)
+	lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
 
-	data_file = pkgdatadir + bb.data.expand("/${PN}" , d)
+	data_file = pkgdatadir + d.expand("/${PN}" )
 	f = open(data_file, 'w')
 	f.write("PACKAGES: %s\n" % packages)
 	f.close()
@@ -1154,7 +1154,7 @@ python package_do_filedeps() {
 	pkgdest = d.getVar('PKGDEST', True)
 	packages = d.getVar('PACKAGES', True)
 
-	rpmdeps = bb.data.expand("${RPMDEPS}", d)
+	rpmdeps = d.expand("${RPMDEPS}")
 	r = re.compile(r'[<>=]+ +[^ ]*')
 
 	# Quick routine to process the results of the rpmdeps call...
@@ -1253,7 +1253,7 @@ python package_do_shlibs() {
 	shlibswork_dir = d.getVar('SHLIBSWORKDIR', True)
 
 	# Take shared lock since we're only reading, not writing
-	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
+	lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
 	def linux_so(root, path, file):
 		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
@@ -1499,7 +1499,7 @@ python package_do_pkgconfig () {
 						if m:
 							name = m.group(1)
 							val = m.group(2)
-							pd.setVar(name, bb.data.expand(val, pd))
+							pd.setVar(name, pd.expand(val))
 							continue
 						m = field_re.match(l)
 						if m:
@@ -1509,7 +1509,7 @@ python package_do_pkgconfig () {
 								pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
 
 	# Take shared lock since we're only reading, not writing
-	lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
+	lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
 	for pkg in packages.split():
 		pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
@@ -1560,7 +1560,7 @@ python read_shlibdeps () {
 		rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
 
 		for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
-			depsfile = bb.data.expand("${PKGDEST}/" + pkg + extension, d)
+			depsfile = d.expand("${PKGDEST}/" + pkg + extension)
 			if os.access(depsfile, os.R_OK):
 				fd = file(depsfile)
 				lines = fd.readlines()
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8721fd2..1f7ec9c 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -20,7 +20,7 @@ python do_package_deb_install () {
     pkgfn = d.getVar('PKGFN', True)
     rootfs = d.getVar('IMAGE_ROOTFS', True)
     debdir = d.getVar('DEPLOY_DIR_DEB', True)
-    apt_config = bb.data.expand('${STAGING_ETCDIR_NATIVE}/apt/apt.conf', d)
+    apt_config = d.expand('${STAGING_ETCDIR_NATIVE}/apt/apt.conf')
     stagingbindir = d.getVar('STAGING_BINDIR_NATIVE', True)
     tmpdir = d.getVar('TMPDIR', True)
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index af8c63e..68313ec 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -998,9 +998,9 @@ python do_package_rpm () {
 		d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
 	else:
 		d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
-	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}', d)
-	pkgarch = bb.data.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}', d)
-	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc', d)
+	pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
+	pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}')
+	magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
 
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 7590177..68b1bf0 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -4,7 +4,7 @@ IMAGE_PKGTYPE ?= "tar"
 
 python package_tar_fn () {
 	fn = os.path.join(d.getVar('DEPLOY_DIR_TAR'), "%s-%s-%s.tar.gz" % (d.getVar('PKG'), d.getVar('PKGV'), d.getVar('PKGR')))
-	fn = bb.data.expand(fn, d)
+	fn = d.expand(fn)
 	d.setVar('PKGFN', fn)
 }
 
@@ -68,7 +68,7 @@ python do_package_tar () {
 		overrides = localdata.getVar('OVERRIDES')
 		if not overrides:
 			raise bb.build.FuncFailed('OVERRIDES not defined')
-		overrides = bb.data.expand(overrides, localdata)
+		overrides = localdata.expand(overrides)
 		localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
 
 		bb.data.update_data(localdata)
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index b324659..da8ad76 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -66,7 +66,7 @@ def can_use_autotools_base(cfgdata, d):
 def can_remove_FILESPATH(cfgdata, d):
     expected = cfgdata.get("FILESPATH")
     #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', True).split(':') for p in d.getVar('FILESPATHPKG', True).split(':') for o in (d.getVar('OVERRIDES', True) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
-    expectedpaths = bb.data.expand(expected, d)
+    expectedpaths = d.expand(expected)
     unexpanded = d.getVar("FILESPATH", 0)
     filespath = d.getVar("FILESPATH", True).split(":")
     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
@@ -91,7 +91,7 @@ def can_remove_FILESDIR(cfgdata, d):
     return unexpanded != expected and \
            os.path.exists(expanded) and \
            (expanded in filespath or
-            expanded == bb.data.expand(expected, d))
+            expanded == d.expand(expected))
 
 def can_remove_others(p, cfgdata, d):
     for k in ["S", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
@@ -104,7 +104,7 @@ def can_remove_others(p, cfgdata, d):
 
         try:
             expanded = d.getVar(k, True)
-            cfgexpanded = bb.data.expand(cfgunexpanded, d)
+            cfgexpanded = d.expand(cfgunexpanded)
         except bb.fetch.ParameterError:
             continue
 
diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 54227a9..072f533 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -7,9 +7,9 @@ def process_dir (directory, d):
     import subprocess as sub
     import stat
 
-    cmd = bb.data.expand('${CHRPATH_BIN}', d)
+    cmd = d.expand('${CHRPATH_BIN}')
     tmpdir = d.getVar('TMPDIR')
-    basedir = bb.data.expand('${base_prefix}', d)
+    basedir = d.expand('${base_prefix}')
 
     #bb.debug("Checking %s for binaries to process" % directory)
     if not os.path.exists(directory):
@@ -82,7 +82,7 @@ def process_dir (directory, d):
                 os.chmod(fpath, perms)
 
 def rpath_replace (path, d):
-    bindirs = bb.data.expand("${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${libexecdir} ${PREPROCESS_RELOCATE_DIRS}", d).split()
+    bindirs = d.expand("${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${libexecdir} ${PREPROCESS_RELOCATE_DIRS}").split()
 
     for bindir in bindirs:
         #bb.note ("Processing directory " + bindir)
@@ -90,5 +90,5 @@ def rpath_replace (path, d):
         process_dir (directory, d)
 
 python relocatable_binaries_preprocess() {
-    rpath_replace(bb.data.expand('${SYSROOT_DESTDIR}', d), d)
+    rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
 }
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d8835da..1b941ac 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -13,12 +13,12 @@ def raise_sanity_error(msg):
 
 def check_conf_exists(fn, data):
     bbpath = []
-    fn = bb.data.expand(fn, data)
+    fn = data.expand(fn)
     vbbpath = data.getVar("BBPATH")
     if vbbpath:
         bbpath += vbbpath.split(":")
     for p in bbpath:
-        currname = os.path.join(bb.data.expand(p, data), fn)
+        currname = os.path.join(data.expand(p), fn)
         if os.access(currname, os.R_OK):
             return True
     return False
@@ -411,16 +411,16 @@ def check_sanity(e):
             f.write(current_abi)
         elif abi == "2" and current_abi == "3":
             bb.note("Converting staging from layout version 2 to layout version 3")
-            os.system(bb.data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots", e.data))
-            os.system(bb.data.expand("ln -s sysroots ${TMPDIR}/staging", e.data))
-            os.system(bb.data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done", e.data))
+            os.system(e.data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"))
+            os.system(e.data.expand("ln -s sysroots ${TMPDIR}/staging"))
+            os.system(e.data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"))
             f = file(abifile, "w")
             f.write(current_abi)
         elif abi == "3" and current_abi == "4":
             bb.note("Converting staging layout from version 3 to layout version 4")
-            if os.path.exists(bb.data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}", e.data)):
-                os.system(bb.data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}", e.data))
-                os.system(bb.data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}", e.data))
+            if os.path.exists(e.data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
+                os.system(e.data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"))
+                os.system(e.data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"))
 
             f = file(abifile, "w")
             f.write(current_abi)
@@ -428,7 +428,7 @@ def check_sanity(e):
             messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
         elif abi == "5" and current_abi == "6":
             bb.note("Converting staging layout from version 5 to layout version 6")
-            os.system(bb.data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}", e.data))
+            os.system(e.data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"))
             f = file(abifile, "w")
             f.write(current_abi)
         elif abi == "7" and current_abi == "8":
diff --git a/meta/classes/sourcepkg.bbclass b/meta/classes/sourcepkg.bbclass
index 2a78a90..102c109 100644
--- a/meta/classes/sourcepkg.bbclass
+++ b/meta/classes/sourcepkg.bbclass
@@ -17,7 +17,7 @@ def get_src_tree(d):
 		return
 
 	s_tree_raw = s.split('/')[1]
-	s_tree = bb.data.expand(s_tree_raw, d)
+	s_tree = d.expand(s_tree_raw)
 
 	src_tree_path = os.path.join(workdir, s_tree)
 	try:
@@ -59,7 +59,7 @@ python sourcepkg_do_dumpdata() {
 	distro = d.getVar('DISTRO', True)
 	s_tree = get_src_tree(d)
 	openembeddeddir = os.path.join(workdir, s_tree, distro)
-	dumpfile = os.path.join(openembeddeddir, bb.data.expand("${P}-${PR}.showdata.dump",d))
+	dumpfile = os.path.join(openembeddeddir, d.expand("${P}-${PR}.showdata.dump"))
 	
 	try:
 		os.mkdir(openembeddeddir)
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e4338e0..0d16d11 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -24,16 +24,16 @@ python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
     elif bb.data.inherits_class('cross', d):
-        d.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${TUNE_PKGARCH}", d))
-        d.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d))
+        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TUNE_PKGARCH}"))
+        d.setVar('SSTATE_MANMACH', d.expand("${BUILD_ARCH}_${MACHINE}"))
     elif bb.data.inherits_class('crosssdk', d):
-        d.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${PACKAGE_ARCH}", d))
+        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${PACKAGE_ARCH}"))
     elif bb.data.inherits_class('nativesdk', d):
-        d.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}", d))
+        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}"))
     elif bb.data.inherits_class('cross-canadian', d):
-        d.setVar('SSTATE_PKGARCH', bb.data.expand("${SDK_ARCH}_${PACKAGE_ARCH}", d))
+        d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
     else:
-        d.setVar('SSTATE_MANMACH', bb.data.expand("${MACHINE}", d))
+        d.setVar('SSTATE_MANMACH', d.expand("${MACHINE}"))
 
     # These classes encode staging paths into their scripts data so can only be
     # reused if we manipulate the paths
@@ -97,8 +97,8 @@ def sstate_install(ss, d):
 
     sharedfiles = []
     shareddirs = []
-    bb.mkdirhier(bb.data.expand("${SSTATE_MANIFESTS}", d))
-    manifest = bb.data.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'], d)
+    bb.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
+    manifest = d.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
 
     if os.access(manifest, os.R_OK):
         bb.fatal("Package already staged (%s)?!" % manifest)
@@ -153,7 +153,7 @@ def sstate_installpkg(ss, d):
         bb.mkdirhier(dir)
         oe.path.remove(dir)
 
-    sstateinst = bb.data.expand("${WORKDIR}/sstate-install-%s/" % ss['name'], d)
+    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
 
     if not os.path.exists(sstatepkg):
@@ -246,7 +246,7 @@ def sstate_clean_manifest(manifest, d):
 def sstate_clean(ss, d):
     import oe.path
 
-    manifest = bb.data.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'], d)
+    manifest = d.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
 
     if os.path.exists(manifest):
         locks = []
@@ -351,7 +351,7 @@ def sstate_package(ss, d):
 
     tmpdir = d.getVar('TMPDIR', True)
 
-    sstatebuild = bb.data.expand("${WORKDIR}/sstate-build-%s/" % ss['name'], d)
+    sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['name'])
     sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['name'] + ".tgz"
     bb.mkdirhier(sstatebuild)
     bb.mkdirhier(os.path.dirname(sstatepkg))
@@ -397,7 +397,7 @@ def pstaging_fetch(sstatepkg, d):
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
 
-    dldir = bb.data.expand("${SSTATE_DIR}", localdata)
+    dldir = localdata.expand("${SSTATE_DIR}")
     srcuri = "file://" + os.path.basename(sstatepkg)
 
     bb.mkdirhier(dldir)
@@ -484,7 +484,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
     }
 
     for task in range(len(sq_fn)):
-        sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
+        sstatefile = d.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz")
         sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
@@ -499,7 +499,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
         localdata = bb.data.createCopy(d)
         bb.data.update_data(localdata)
 
-        dldir = bb.data.expand("${SSTATE_DIR}", localdata)
+        dldir = localdata.expand("${SSTATE_DIR}")
         localdata.setVar('DL_DIR', dldir)
         localdata.setVar('PREMIRRORS', mirrors)
 
@@ -509,7 +509,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             if task in ret:
                 continue
 
-            sstatefile = bb.data.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz", d)
+            sstatefile = d.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_" + mapping[sq_task[task]] + ".tgz")
             sstatefile = sstatefile.replace("${BB_TASKHASH}", sq_hash[task])
 
             srcuri = "file://" + os.path.basename(sstatefile)
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index b194fa6..700ea53 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -95,7 +95,7 @@ python build_syslinux_menu () {
 		overrides = localdata.getVar('OVERRIDES')
 		if not overrides:
 			raise bb.build.FuncFailed('OVERRIDES not defined')
-		overrides = bb.data.expand(overrides, localdata)
+		overrides = localdata.expand(overrides)
 	
 		localdata.setVar('OVERRIDES', label + ':' + overrides)
 		bb.data.update_data(localdata)
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index bbdf6e1..cbb000a 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -16,7 +16,7 @@ addtask clean
 do_clean[nostamp] = "1"
 python do_clean() {
 	"""clear the build and temp directories"""
-	dir = bb.data.expand("${WORKDIR}", d)
+	dir = d.expand("${WORKDIR}")
 	bb.note("Removing " + dir)
 	oe.path.remove(dir)
 
diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index 22e8394..6b8b2c5 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -39,7 +39,7 @@ def csl_get_gcc_version(d):
 
 def csl_get_libc_version(d):
 	import os,bb
-	syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}', d)
+	syspath = d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
 	if not syspath:
 	        return 'UNKNOWN'
 
@@ -55,7 +55,7 @@ def csl_get_libc_version(d):
 
 def csl_get_kernel_version(d):
 	import os,bb
-	syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}', d)
+	syspath = d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
 	if not syspath:
 	        return 'UNKNOWN'
 
diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 1ff808d..7bb8453 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -92,7 +92,7 @@ def populate_toolchain_links(d):
     d = d.createCopy()
     d.finalize()
 
-    pattern = bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*', d)
+    pattern = d.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*')
     files = glob(pattern)
     if not files:
         bb.fatal("Unable to populate toolchain binary symlinks")
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index af900be..e50f453 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -7,7 +7,7 @@ def typed_value(key, d):
     var_type = d.getVarFlag(key, 'type')
     flags = d.getVarFlags(key)
     if flags is not None:
-        flags = dict((flag, bb.data.expand(value, d))
+        flags = dict((flag, d.expand(value))
                      for flag, value in flags.iteritems())
     else:
         flags = {}
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 918e7ad..a7a40f0 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -26,15 +26,15 @@ def read_pkgdatafile(fn):
     return pkgdata
 
 def get_subpkgedata_fn(pkg, d):
-    archs = bb.data.expand("${PACKAGE_ARCHS}", d).split(" ")
+    archs = d.expand("${PACKAGE_ARCHS}").split(" ")
     archs.reverse()
-    pkgdata = bb.data.expand('${TMPDIR}/pkgdata/', d)
-    targetdir = bb.data.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/', d)
+    pkgdata = d.expand('${TMPDIR}/pkgdata/')
+    targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
     for arch in archs:
         fn = pkgdata + arch + targetdir + pkg
         if os.path.exists(fn):
             return fn
-    return bb.data.expand('${PKGDATA_DIR}/runtime/%s' % pkg, d)
+    return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
 
 def has_subpkgdata(pkg, d):
     return os.access(get_subpkgedata_fn(pkg, d), os.R_OK)
@@ -43,11 +43,11 @@ def read_subpkgdata(pkg, d):
     return read_pkgdatafile(get_subpkgedata_fn(pkg, d))
 
 def has_pkgdata(pn, d):
-    fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
+    fn = d.expand('${PKGDATA_DIR}/%s' % pn)
     return os.access(fn, os.R_OK)
 
 def read_pkgdata(pn, d):
-    fn = bb.data.expand('${PKGDATA_DIR}/%s' % pn, d)
+    fn = d.expand('${PKGDATA_DIR}/%s' % pn)
     return read_pkgdatafile(fn)
 
 #
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d1bf7cd..d9d663c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -75,8 +75,8 @@ python populate_packages_prepend() {
 	packages = []
 	multilib_prefix = (d.getVar("MLPREFIX", True) or "")
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
-	plugin_dir = bb.data.expand('${libdir}/connman/plugins/', d)
-	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
+	plugin_dir = d.expand('${libdir}/connman/plugins/')
+	plugin_name = d.expand('${PN}-plugin-%s')
 	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
 	for (file, package) in packages:
 		plugintype = package.split( '-' )[-1]
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 92ad0d9..ae3864c 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -63,10 +63,10 @@ python populate_packages_prepend() {
 	# time before the files from the package may be available, hence
 	# storing the data from the files in the preinst directly.
 
-	f = open(bb.data.expand("${STAGING_DATADIR}/base-passwd/passwd.master", d), 'r')
+	f = open(d.expand("${STAGING_DATADIR}/base-passwd/passwd.master"), 'r')
 	passwd = "".join(f.readlines())
 	f.close()
-	f = open(bb.data.expand("${STAGING_DATADIR}/base-passwd/group.master", d), 'r')
+	f = open(d.expand("${STAGING_DATADIR}/base-passwd/group.master"), 'r')
 	group = "".join(f.readlines())
 	f.close()
 
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 7aa131c..ec76ad2 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -82,7 +82,7 @@ python () {
   if "${OE_FEATURES}":
     d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
-                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))))
+                   ("\\n".join((d.expand("${OE_FEATURES}").split("\n")))))
   d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
                   ("\\n".join(["CONFIG_CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 43303b7..3b10c43 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -178,8 +178,8 @@ do_install() {
 }
 
 python populate_packages_prepend () {
-        base_libdir = bb.data.expand("${base_libdir}", d)
-        pnbase = bb.data.expand("${PN}-lib%s", d)
+        base_libdir = d.expand("${base_libdir}")
+        pnbase = d.expand("${PN}-lib%s")
         do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
 }
 
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 69d8921..78010db 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -142,7 +142,7 @@ python () {
   if "${OE_FEATURES}":
     d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
-                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))))
+                   ("\\n".join((d.expand("${OE_FEATURES}").split("\n")))))
   d.setVar('configmangle_append',
                  "/^### CROSS$/a\\\n%s\n" %
                   ("\\n".join(["CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 4bf5105..51e1e3b 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -18,7 +18,7 @@ python do_install_config () {
 	data = infile.read()
 	infile.close()
 
-	data = bb.data.expand(data, d)
+	data = d.expand(data)
 
 	outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
 	if not os.path.exists(outdir):
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index bf6c239..f550aab 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -79,7 +79,7 @@ do_clean[lockfiles] = "${SW}.clean.lock"
 
 python workshared_clean () {
 	"""clear the source directory"""
-	dir = bb.data.expand("${SW}", d)
+	dir = d.expand("${SW}")
 	bb.note("Removing " + dir)
 	oe.path.remove(dir)
 
diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index c872e00..e32412c 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -1,7 +1,7 @@
 INHIBIT_PACKAGE_STRIP = "1"
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
-BINRELPATH = "${@oe.path.relative(bb.data.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}", d), bb.data.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}", d))}"
+BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"))}"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install-host
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index f9a6cc9..a0c34a3 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -290,7 +290,7 @@ PACKAGES_append = " perl-modules "
 RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
 
 python populate_packages_prepend () {
-        libdir = bb.data.expand('${libdir}/perl/${PV}', d)
+        libdir = d.expand('${libdir}/perl/${PV}')
         do_split_packages(d, libdir, 'auto/(Encode/.[^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
         do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
         do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
index 2c247f0..3ae3867 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -58,6 +58,6 @@ CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
 PACKAGES_DYNAMIC = "lighttpd-module-*"
 
 python populate_packages_prepend () {
-        lighttpd_libdir = bb.data.expand('${libdir}', d)
+        lighttpd_libdir = d.expand('${libdir}')
         do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
 }
diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index 8dd5ac5..08ce1d1 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -61,9 +61,9 @@ python populate_packages_prepend () {
 		d.setVar('FILES_' + pn, nf)
 
 	dvar = bb.data.expand('${WORKDIR}/package', d, True)
-	pam_libdir = bb.data.expand('${base_libdir}/security', d)
-	pam_sbindir = bb.data.expand('${sbindir}', d)
-	pam_filterdir = bb.data.expand('${base_libdir}/security/pam_filter', d)
+	pam_libdir = d.expand('${base_libdir}/security')
+	pam_sbindir = d.expand('${sbindir}')
+	pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
 
 	do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', extra_depends='')
 	pam_plugin_append_file('pam-plugin-unix', pam_sbindir, 'unix_chkpwd')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index 603b38f..0e2067a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -60,7 +60,7 @@ PACKAGES_DYNAMIC_virtclass-native = ""
 python populate_packages_prepend () {
 	postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
-	loaders_root = bb.data.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders', d)
+	loaders_root = d.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders')
 
 	do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s', postinst_pixbufloader)
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index e45768d..66be75a 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -37,7 +37,7 @@ python populate_packages_prepend () {
 	prologue = d.getVar("postinst_prologue", True)
 	postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
-	gtk_libdir = bb.data.expand('${libdir}/gtk-2.0/${LIBV}', d)
+	gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
 	loaders_root = os.path.join(gtk_libdir, 'loaders')
 	immodules_root = os.path.join(gtk_libdir, 'immodules')
 	printmodules_root = os.path.join(gtk_libdir, 'printbackends');
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index 1e7a87f..aee18c5 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -37,7 +37,7 @@ python populate_packages_prepend () {
 	prologue = d.getVar("postinst_prologue", True)
 	postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
-	gtk_libdir = bb.data.expand('${libdir}/gtk-2.0/${LIBV}', d)
+	gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
 	loaders_root = os.path.join(gtk_libdir, 'loaders')
 	immodules_root = os.path.join(gtk_libdir, 'immodules')
 	printmodules_root = os.path.join(gtk_libdir, 'printbackends');
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index c27826c..559c76e 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -43,7 +43,7 @@ python populate_packages_prepend () {
 
 	prologue = d.getVar("postinst_prologue", True)
 
-	gtk_libdir = bb.data.expand('${libdir}/gtk-2.0/${LIBV}', d)
+	gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
 	immodules_root = os.path.join(gtk_libdir, 'immodules')
 	printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index d45159f..9061ac1 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -36,7 +36,7 @@ EXTRA_OECONF = "\
 #
 #python populate_packages_prepend () {
 #    import os.path
-#    inputdrivers_libdir = bb.data.expand('${libdir}/directfb-${RV}/inputdrivers', d)
+#    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
 #    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-inputdrivers-%s', 'Directfb plugin for %s')
 #}
 
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 8b36d04..a2d5dc3 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -52,7 +52,7 @@ fi
 python populate_packages_prepend () {
 	prologue = d.getVar("postinst_prologue", True)
 
-	modules_root = bb.data.expand('${libdir}/pango/${LIBV}/modules', d)
+	modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
 
 	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules > /etc/pango/pango.modules')
 }
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index ccabe3c..4572265 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -1,14 +1,14 @@
 LIBV = "0.10"
 
 python populate_packages_prepend () {
-	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
+	gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
 	postinst = d.getVar('plugin_postinst', True)
 	glibdir = d.getVar('libdir', True)
 
 	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
-	do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', bb.data.expand('${PN}-%s-staticdev', d), 'GStreamer plugin for %s (static development files)', extra_depends=bb.data.expand('${PN}-staticdev',d))
+	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+	do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
+	do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
 	
 	pn = d.getVar('PN', True)
 	metapkg =  pn + '-meta'
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ca3a28d..dda0352 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -106,7 +106,7 @@ pkg_postinst_${PN}-server() {
 python populate_packages_prepend() {
         #d.setVar('PKG_pulseaudio', 'pulseaudio')
 
-        plugindir = bb.data.expand('${libdir}/pulse-${PV}/modules/', d)
+        plugindir = d.expand('${libdir}/pulse-${PV}/modules/')
         do_split_packages(d, plugindir, '^module-(.*)\.so$', 'pulseaudio-module-%s', 'PulseAudio module for %s', extra_depends='' )
         do_split_packages(d, plugindir, '^lib(.*)\.so$', 'pulseaudio-lib-%s', 'PulseAudio library for %s', extra_depends='' )
 }
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
index 469351c..df18f91 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -31,8 +31,8 @@ PACKAGES_DYNAMIC = "qmmp-plugin-* "
 
 python populate_packages_prepend () {
 	import os
-	qmmp_libdir = bb.data.expand('${libdir}/qmmp', d)
-	gd = bb.data.expand('${D}/${libdir}/qmmp', d)
+	qmmp_libdir = d.expand('${libdir}/qmmp')
+	gd = d.expand('${D}/${libdir}/qmmp')
 	plug_dirs = os.listdir(gd)
 
 	for plug_dir in plug_dirs:
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 4d71913..2e70bd9 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -257,17 +257,17 @@ do_compile() {
 }
 
 python populate_packages_prepend() {
-        translation_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/translations/', d)
-        translation_name = bb.data.expand('${QT_BASE_NAME}-translation-%s', d)
+        translation_dir = d.expand('${datadir}/${QT_DIR_NAME}/translations/')
+        translation_name = d.expand('${QT_BASE_NAME}-translation-%s')
         do_split_packages(d, translation_dir, '^(assistant|designer|linguist|qt|qtconfig|qvfb)_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
  
-        phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
-        phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
+        phrasebook_dir = d.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/')
+        phrasebook_name = d.expand('${QT_BASE_NAME}-phrasebook-%s')
         import os;
-        if os.path.exists("%s%s" % (bb.data.expand('${D}',d), phrasebook_dir)):
+        if os.path.exists("%s%s" % (d.expand('${D}'), phrasebook_dir)):
                 do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
         else:
-                bb.note("The path does not exist:", bb.data.expand('${D}', d), phrasebook_dir)
+                bb.note("The path does not exist:", d.expand('${D}'), phrasebook_dir)
  
         # Package all the plugins and their -dbg version and create a meta package
         def qtopia_split(path, name, glob):
@@ -275,17 +275,17 @@ python populate_packages_prepend() {
                 Split the package into a normal and -dbg package and then add the
                 new packages to the meta package.
                 """
-                plugin_dir = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/' % path, d)
-                if not os.path.exists("%s%s" % (bb.data.expand('${D}',d), plugin_dir)):
-                        bb.note("The path does not exist:", bb.data.expand('${D}', d), plugin_dir)
+                plugin_dir = d.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/' % path)
+                if not os.path.exists("%s%s" % (d.expand('${D}'), plugin_dir)):
+                        bb.note("The path does not exist:", d.expand('${D}'), plugin_dir)
                         return
  
-                plugin_name = bb.data.expand('${QT_BASE_NAME}-plugin-%s-%%s' % name, d)
+                plugin_name = d.expand('${QT_BASE_NAME}-plugin-%s-%%s' % name)
                 dev_packages = []
                 dev_hook = lambda file,pkg,b,c,d:dev_packages.append((file,pkg))
                 do_split_packages(d, plugin_dir, glob, plugin_name, '${PN} %s for %%s' % name, extra_depends='', hook=dev_hook)
                 # Create a -dbg package as well
-                plugin_dir_dbg = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/.debug' % path, d)
+                plugin_dir_dbg = d.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/.debug' % path)
                 packages = d.getVar('PACKAGES')
                 for (file,package) in dev_packages:
                         packages = "%s %s-dbg" % (packages, package)
diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-support/libpcre/libpcre_8.21.bb
index 4eb65d7..f48d9f2 100644
--- a/meta/recipes-support/libpcre/libpcre_8.21.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
@@ -46,7 +46,7 @@ do_compile () {
 }
 
 python populate_packages_prepend () {
-	pcre_libdir = bb.data.expand('${libdir}', d)
+	pcre_libdir = d.expand('${libdir}')
 	do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.+', 'lib%s', 'libpcre %s library', extra_depends='', allow_links=True)
 }
 




