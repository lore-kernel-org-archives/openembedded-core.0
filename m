Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrUFg-0003zi-Hn for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:25:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDDt1X025047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:13:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24227-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:13:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IDDl2x025040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:13:48 +0100
Message-ID: <1342617231.30680.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 14:13:51 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] Remove a number of unneeded import os/bb calls
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
X-List-Received-Date: Wed, 18 Jul 2012 13:25:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The bb and os modules are always imported so having these extra import calls
are a waste of space/execution time. They also set a bad example for people
copy and pasting code so clean them up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2b5404f..8e97e44 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -76,7 +76,6 @@ def tar_filter(d):
 def get_bb_inc(d):
 	'''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
 	import re
-	import os
 	import shutil
 	
 	bbinc = []
@@ -154,7 +153,6 @@ def get_series(d):
 
 def get_applying_patches(d):
 	"""only copy applying patches to a pointed directory which will be archived to tarball"""
-	import os
 	import shutil
 
 
@@ -174,7 +172,6 @@ def get_applying_patches(d):
 
 def not_tarball(d):
 	'''packages including key words 'work-shared','native', 'task-' will be passed'''
-	import os
 
 	workdir = d.getVar('WORKDIR',True)
 	s = d.getVar('S',True)
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8c0c5f3..6532d10 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -14,7 +14,7 @@ OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup oe.sstatesig
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
-    import os, sys
+    import sys
 
     bbpath = d.getVar("BBPATH", True).split(":")
     sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
@@ -117,11 +117,9 @@ GIT_CONFIG_PATH = "${STAGING_DIR_NATIVE}/etc"
 GIT_CONFIG = "${GIT_CONFIG_PATH}/gitconfig"
 
 def generate_git_config(e):
-    from bb import data
-
-    if data.getVar('GIT_CORE_CONFIG', e.data, True):
+    if e.data.getVar('GIT_CORE_CONFIG', True):
         gitconfig_path = e.data.getVar('GIT_CONFIG', True)
-        proxy_command = "    gitProxy = %s\n" % data.getVar('OE_GIT_PROXY_COMMAND', e.data, True)
+        proxy_command = "    gitProxy = %s\n" % e.data.getVar('OE_GIT_PROXY_COMMAND', True)
 
         bb.mkdirhier(e.data.expand("${GIT_CONFIG_PATH}"))
         if (os.path.exists(gitconfig_path)):
@@ -129,7 +127,7 @@ def generate_git_config(e):
 
         f = open(gitconfig_path, 'w')
         f.write("[core]\n")
-        ignore_hosts = data.getVar('GIT_PROXY_IGNORE', e.data, True).split()
+        ignore_hosts = e.data.getVar('GIT_PROXY_IGNORE', True).split()
         for ignore_host in ignore_hosts:
             f.write("    gitProxy = none for %s\n" % ignore_host)
         f.write(proxy_command)
diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
index 4028d26..6806dcd 100644
--- a/meta/classes/bugzilla.bbclass
+++ b/meta/classes/bugzilla.bbclass
@@ -72,7 +72,7 @@ def bugzilla_add_comment(debug_file, server, args, bug_number, text):
 
 addhandler bugzilla_eventhandler
 python bugzilla_eventhandler() {
-    import bb, os, glob
+    import glob
     import xmlrpclib, httplib
 
     class ProxiedTransport(xmlrpclib.Transport):
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d2d19ff..916aae6 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -414,9 +414,6 @@ buildhistory_commit() {
 }
 
 python buildhistory_eventhandler() {
-	import bb.build
-	import bb.event
-
 	if isinstance(e, bb.event.BuildCompleted):
 		if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
 			if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 3ca7337..c59cb7a 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -58,7 +58,6 @@ def copyleft_should_include(d):
 
 python do_prepare_copyleft_sources () {
     """Populate a tree of the recipe sources and emit patch series files"""
-    import os.path
     import shutil
 
     p = d.getVar('P', True)
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 7b212c9..f196df5 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -654,7 +654,6 @@ do_distro_check[nostamp] = "1"
 python do_distro_check() {
     """checks if the package is present in other public Linux distros"""
     import oe.distro_check as dc
-    import bb
     import shutil
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk',d):
         return
@@ -704,8 +703,6 @@ python checklicense_eventhandler() {
 addtask checklicense
 do_checklicense[nostamp] = "1"
 python do_checklicense() {
-    import os
-    import bb
     import shutil
     logpath = d.getVar('LOG_DIR', True)
     bb.utils.mkdirhier(logpath)
diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index f51eeba..7ece886 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -26,7 +26,6 @@ do_qemuimagetest_standalone[depends] += "qemu-native:do_populate_sysroot"
 def qemuimagetest_main(d):
     import sys
     import re
-    import os
     import shutil
     import subprocess
     
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ab59fc8..d914b11 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -188,7 +188,7 @@ do_kernel_configme() {
 }
 
 python do_kernel_configcheck() {
-    import bb, re, string, sys, commands
+    import re, string, sys, commands
 
     bb.plain("NOTE: validating kernel configuration")
 
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index e3214a6..70490ef 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -118,7 +118,7 @@ do_collect_bins_from_locale_tree() {
 inherit qemu
 
 python package_do_split_gconvs () {
-    import os, re
+    import re
     if (d.getVar('PACKAGE_NO_GCONV', True) == '1'):
         bb.note("package requested not splitting gconvs")
         return
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 03e413b..a2721ab 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -143,8 +143,6 @@ python do_populate_lic() {
     """
     Populate LICENSE_DIRECTORY with licenses.
     """
-    import os
-    import bb
     import shutil
     import oe.license
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a51e955..fc83424 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -444,7 +444,7 @@ python perform_packagecopy () {
 # seeding this list with reasonable defaults, then load from
 # the fs-perms.txt files
 python fixup_perms () {
-    import os, pwd, grp
+    import pwd, grp
 
     # init using a string with the same format as a line as documented in
     # the fs-perms.txt file
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9d26375..74545c7 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -637,7 +637,6 @@ python write_specfile () {
                     array.append("%s: %s" % (tag, dep))
 
     def walk_files(walkpath, target, conffiles):
-        import os
         for rootpath, dirs, files in os.walk(walkpath):
             path = rootpath.replace(walkpath, "")
             for dir in dirs:
@@ -1019,8 +1018,6 @@ python write_specfile () {
 }
 
 python do_package_rpm () {
-    import os
-    
     def creat_srpm_dir(d):
         if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) and d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() == 'SRPM':
             clean_licenses = get_licenses(d)
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 0e75ac4..68896ce 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -4,8 +4,6 @@
 #
 
 def qemu_target_binary(data):
-    import bb
-
     target_arch = data.getVar("TARGET_ARCH", True)
     if target_arch in ("i486", "i586", "i686"):
         target_arch = "i386"
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 61e07bf..63e9e7f 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -55,7 +55,6 @@ def can_use_autotools_base(cfgdata, d):
         if cfg.find(i) != -1:
             return False
 
-    import os
     for clsfile in d.getVar("__inherit_cache", 0):
         (base, _) = os.path.splitext(os.path.basename(clsfile))
         if cfg.find("%s_do_configure" % base) != -1:
@@ -146,9 +145,7 @@ do_recipe_sanity_all () {
 addtask recipe_sanity_all after do_recipe_sanity
 
 python recipe_sanity_eh () {
-    from bb.event import getName
-
-    if getName(e) != "ConfigParsed":
+    if bb.event.getName(e) != "ConfigParsed":
         return
 
     d = e.data
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a3fe075..e4a200b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -254,8 +254,6 @@ def check_supported_distro(sanity_data):
 
 # Checks we should only make if MACHINE is set correctly
 def check_sanity_validmachine(sanity_data):
-    from bb import data
-
     messages = ""
 
     # Check TUNE_ARCH is set
@@ -291,7 +289,6 @@ def check_sanity_validmachine(sanity_data):
 
 
 def check_sanity(sanity_data):
-    from bb import note, error, data, __version__
     import subprocess
 
     try:
@@ -319,8 +316,8 @@ def check_sanity(sanity_data):
     if sys.hexversion < 0x020600F0:
         messages = messages + 'The system requires at least Python 2.6 to run. Please update your Python interpreter.\n'
 
-    if (LooseVersion(__version__) < LooseVersion(minversion)):
-        messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, __version__)
+    if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
+        messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__)
 
     # Check that the MACHINE is valid, if it is set
     if sanity_data.getVar('MACHINE', True):
diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclient.bbclass
index 1027c7c..e57bc48 100644
--- a/meta/classes/tinderclient.bbclass
+++ b/meta/classes/tinderclient.bbclass
@@ -55,22 +55,22 @@ def tinder_format_http_post(d,status,log):
 
     # the variables we will need to send on this form post
     variables =  {
-        "tree"         : data.getVar('TINDER_TREE',    d, True),
-        "machine_name" : data.getVar('TINDER_MACHINE', d, True),
+        "tree"         : d.getVar('TINDER_TREE', True),
+        "machine_name" : d.getVar('TINDER_MACHINE', True),
         "os"           : os.uname()[0],
         "os_version"   : os.uname()[2],
         "compiler"     : "gcc",
-        "clobber"      : data.getVar('TINDER_CLOBBER', d, True) or "0",
-        "srcdate"      : data.getVar('SRCDATE', d, True),
-        "PN"           : data.getVar('PN', d, True),
-        "PV"           : data.getVar('PV', d, True),
-        "PR"           : data.getVar('PR', d, True),
-        "FILE"         : data.getVar('FILE', d, True) or "N/A",
-        "TARGETARCH"   : data.getVar('TARGET_ARCH', d, True),
-        "TARGETFPU"    : data.getVar('TARGET_FPU', d, True) or "Unknown",
-        "TARGETOS"     : data.getVar('TARGET_OS', d, True) or "Unknown",
-        "MACHINE"      : data.getVar('MACHINE', d, True) or "Unknown",
-        "DISTRO"       : data.getVar('DISTRO', d, True) or "Unknown",
+        "clobber"      : d.getVar('TINDER_CLOBBER', True) or "0",
+        "srcdate"      : d.getVar('SRCDATE', True),
+        "PN"           : d.getVar('PN', True),
+        "PV"           : d.getVar('PV', True),
+        "PR"           : d.getVar('PR', True),
+        "FILE"         : d.getVar('FILE', True) or "N/A",
+        "TARGETARCH"   : d.getVar('TARGET_ARCH', True),
+        "TARGETFPU"    : d.getVar('TARGET_FPU', True) or "Unknown",
+        "TARGETOS"     : d.getVar('TARGET_OS', True) or "Unknown",
+        "MACHINE"      : d.getVar('MACHINE', True) or "Unknown",
+        "DISTRO"       : d.getVar('DISTRO', True) or "Unknown",
         "zecke-rocks"  : "sure",
     }
 
@@ -82,7 +82,7 @@ def tinder_format_http_post(d,status,log):
     # we only need on build_status.pl but sending it
     # always does not hurt
     try:
-        f = file(data.getVar('TMPDIR',d,True)+'/tinder-machine.id', 'r')
+        f = file(d.getVar('TMPDIR',True)+'/tinder-machine.id', 'r')
         id = f.read()
         variables['machine_id'] = id
     except:
@@ -103,12 +103,11 @@ def tinder_build_start(d):
     by posting our name and tree to the build_start.pl script
     on the server.
     """
-    from bb import data
 
     # get the body and type
     content_type, body = tinder_format_http_post(d,None,None)
-    server = data.getVar('TINDER_HOST', d, True )
-    url    = data.getVar('TINDER_URL',  d, True )
+    server = d.getVar('TINDER_HOST', True )
+    url    = d.getVar('TINDER_URL', True )
 
     selector = url + "/xml/build_start.pl"
 
@@ -128,7 +127,7 @@ def tinder_build_start(d):
 
     # now we will need to save the machine number
     # we will override any previous numbers
-    f = file(data.getVar('TMPDIR', d, True)+"/tinder-machine.id", 'w')
+    f = file(d.getVar('TMPDIR', True)+"/tinder-machine.id", 'w')
     f.write(report)
 
 
@@ -136,12 +135,10 @@ def tinder_send_http(d, status, _log):
     """
     Send this log as build status
     """
-    from bb import data
-
 
     # get the body and type
-    server = data.getVar('TINDER_HOST', d, True )
-    url    = data.getVar('TINDER_URL',  d, True )
+    server = d.getVar('TINDER_HOST', True)
+    url    = d.getVar('TINDER_URL', True)
 
     selector = url + "/xml/build_status.pl"
 
@@ -162,22 +159,20 @@ def tinder_print_info(d):
         we use.
     """
 
-    from   bb import data
     # get the local vars
-
     time    = tinder_time_string()
     ops     = os.uname()[0]
     version = os.uname()[2]
-    url     = data.getVar( 'TINDER_URL' , d, True )
-    tree    = data.getVar( 'TINDER_TREE', d, True )
-    branch  = data.getVar( 'TINDER_BRANCH', d, True )
-    srcdate = data.getVar( 'SRCDATE', d, True )
-    machine = data.getVar( 'MACHINE', d, True )
-    distro  = data.getVar( 'DISTRO',  d, True )
-    bbfiles = data.getVar( 'BBFILES', d, True )
-    tarch   = data.getVar( 'TARGET_ARCH', d, True )
-    fpu     = data.getVar( 'TARGET_FPU', d, True )
-    oerev   = data.getVar( 'OE_REVISION', d, True ) or "unknown"
+    url     = d.getVar( 'TINDER_URL' , True )
+    tree    = d.getVar( 'TINDER_TREE', True )
+    branch  = d.getVar( 'TINDER_BRANCH', True )
+    srcdate = d.getVar( 'SRCDATE', True )
+    machine = d.getVar( 'MACHINE', True )
+    distro  = d.getVar( 'DISTRO', True )
+    bbfiles = d.getVar( 'BBFILES', True )
+    tarch   = d.getVar( 'TARGET_ARCH', True )
+    fpu     = d.getVar( 'TARGET_FPU', True )
+    oerev   = d.getVar( 'OE_REVISION', True ) or "unknown"
 
     # there is a bug with tipple quoted strings
     # i will work around but will fix the original
@@ -212,8 +207,6 @@ def tinder_print_env():
     """
     Print the environment variables of this build
     """
-    from bb import data
-
     time_start = tinder_time_string()
     time_end   = tinder_time_string()
 
@@ -272,12 +265,10 @@ def tinder_do_tinder_report(event):
     BuildCompleted Event. In this case we have to look up the status and
     send it instead of 100/success.
     """
-    from bb.event import getName
-    from bb import data, mkdirhier, build
     import glob
 
     # variables
-    name = getName(event)
+    name = bb.event.getName(event)
     log  = ""
     status = 1
     # Check what we need to do Build* shows we start or are done
@@ -287,7 +278,7 @@ def tinder_do_tinder_report(event):
 
         try:
             # truncate the tinder log file
-            f = file(data.getVar('TINDER_LOG', event.data, True), 'w')
+            f = file(event.data.getVar('TINDER_LOG', True), 'w')
             f.write("")
             f.close()
         except:
@@ -296,7 +287,7 @@ def tinder_do_tinder_report(event):
         try:
             # write a status to the file. This is needed for the -k option
             # of BitBake
-            g = file(data.getVar('TMPDIR', event.data, True)+"/tinder-status", 'w')
+            g = file(event.data.getVar('TMPDIR', True)+"/tinder-status", 'w')
             g.write("")
             g.close()
         except IOError:
@@ -305,10 +296,10 @@ def tinder_do_tinder_report(event):
     # Append the Task-Log (compile,configure...) to the log file
     # we will send to the server
     if name == "TaskSucceeded" or name == "TaskFailed":
-        log_file = glob.glob("%s/log.%s.*" % (data.getVar('T', event.data, True), event.task))
+        log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T', True), event.task))
 
         if len(log_file) != 0:
-            to_file  = data.getVar('TINDER_LOG', event.data, True)
+            to_file  = event.data.getVar('TINDER_LOG', True)
             log     += "".join(open(log_file[0], 'r').readlines())
 
     # set the right 'HEADER'/Summary for the TinderBox
@@ -319,23 +310,23 @@ def tinder_do_tinder_report(event):
     elif name == "TaskFailed":
         log += "<--- TINDERBOX Task %s failed (FAILURE)\n" % event.task
     elif name == "PkgStarted":
-        log += "---> TINDERBOX Package %s started\n" % data.getVar('PF', event.data, True)
+        log += "---> TINDERBOX Package %s started\n" % event.data.getVar('PF', True)
     elif name == "PkgSucceeded":
-        log += "<--- TINDERBOX Package %s done (SUCCESS)\n" % data.getVar('PF', event.data, True)
+        log += "<--- TINDERBOX Package %s done (SUCCESS)\n" % event.data.getVar('PF', True)
     elif name == "PkgFailed":
-        if not data.getVar('TINDER_AUTOBUILD', event.data, True) == "0":
+        if not event.data.getVar('TINDER_AUTOBUILD', True) == "0":
             build.exec_task('do_clean', event.data)
-        log += "<--- TINDERBOX Package %s failed (FAILURE)\n" % data.getVar('PF', event.data, True)
+        log += "<--- TINDERBOX Package %s failed (FAILURE)\n" % event.data.getVar('PF', True)
         status = 200
         # remember the failure for the -k case
-        h = file(data.getVar('TMPDIR', event.data, True)+"/tinder-status", 'w')
+        h = file(event.data.getVar('TMPDIR', True)+"/tinder-status", 'w')
         h.write("200")
     elif name == "BuildCompleted":
         log += "Build Completed\n"
         status = 100
         # Check if we have a old status...
         try:
-            h = file(data.getVar('TMPDIR',event.data,True)+'/tinder-status', 'r')
+            h = file(event.data.getVar('TMPDIR',True)+'/tinder-status', 'r')
             status = int(h.read())
         except:
             pass
@@ -351,7 +342,7 @@ def tinder_do_tinder_report(event):
         log += "Error:Was Runtime: %d\n" % event.isRuntime()
         status = 200
         # remember the failure for the -k case
-        h = file(data.getVar('TMPDIR', event.data, True)+"/tinder-status", 'w')
+        h = file(event.data.getVar('TMPDIR', True)+"/tinder-status", 'w')
         h.write("200")
 
     # now post the log
@@ -366,13 +357,10 @@ def tinder_do_tinder_report(event):
 # we want to be an event handler
 addhandler tinderclient_eventhandler
 python tinderclient_eventhandler() {
-    from bb import note, error, data
-    from bb.event import getName
-
-    if e.data is None or getName(e) == "MsgNote":
+    if e.data is None or bb.event.getName(e) == "MsgNote":
         return
 
-    do_tinder_report = data.getVar('TINDER_REPORT', e.data, True)
+    do_tinder_report = e.data.getVar('TINDER_REPORT', True)
     if do_tinder_report and do_tinder_report == "1":
         tinder_do_tinder_report(e)
 
diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
index 0790b8a..e8f52d2 100644
--- a/meta/conf/distro/include/csl-versions.inc
+++ b/meta/conf/distro/include/csl-versions.inc
@@ -38,7 +38,6 @@ def csl_get_gcc_version(d):
 		return version
 
 def csl_get_libc_version(d):
-	import os,bb
 	syspath = d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
 	if not syspath:
 	        return 'UNKNOWN'
@@ -54,7 +53,6 @@ def csl_get_libc_version(d):
 	return 'UNKNOWN'
 
 def csl_get_kernel_version(d):
-	import os,bb
 	syspath = d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
 	if not syspath:
 	        return 'UNKNOWN'
diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
index 1635eec..098c724 100644
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -104,7 +104,6 @@ addhandler toolchain_setup
 
 def populate_toolchain_links(d):
     import errno
-    import os
     from glob import glob
 
     d = d.createCopy()
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index e50f453..4cc0e02 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -1,5 +1,4 @@
 import oe.maketype
-import bb.msg
 
 def typed_value(key, d):
     """Construct a value for the specified metadata variable, using its flags
diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index 0e9dbc6..139f333 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -5,7 +5,6 @@ variable.  Other flags may be utilized in the construction of the types.  See
 the arguments of the type's factory for details.
 """
 
-import bb
 import inspect
 import types
 
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 9a28e6b..5f897ff 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -1,5 +1,3 @@
-import os
-import bb.data
 import codecs
 
 def packaged(pkg, d):
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 17b7e1f..bc86bb5 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -1,6 +1,4 @@
 import oe.path
-import os
-import bb.utils, bb.msg, bb.data, bb.fetch2
 
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1fdfa87..7197b23 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -1,7 +1,5 @@
-import bb
 import errno
 import glob
-import os
 import shutil
 import subprocess
 
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 16785ce..c3fb76a 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,4 +1,3 @@
-import bb
 
 def prserv_make_conn(d, check = False):
     import prserv.serv
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 43639d5..fb0a87e 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -1,5 +1,4 @@
 import logging
-import os
 import oe.classutils
 import shlex
 from bb.process import Popen, ExecutionError
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 8912dac..e14743f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,5 +1,3 @@
-import bb, bb.data
-
 def read_file(filename):
     try:
         f = file( filename, "r" )
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 4d4d2cf..d9cb048 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -58,7 +58,7 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIR
 #
 
 python __anonymous () {
-    import bb, re
+    import re
     uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with target %s" %
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 4220beb..fee5ae8 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -53,7 +53,7 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIR
 #
 
 python __anonymous () {
-    import bb, re
+    import re
     uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with target %s" %
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index b9bc3aa..2325dbf 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -124,8 +124,6 @@ python __anonymous () {
     # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (one of them)
     # then include task-base-wifi in task-base
 
-    import bb
-
     distro_features = set(d.getVar("DISTRO_FEATURES", True).split())
     machine_features= set(d.getVar("MACHINE_FEATURES", True).split())
 
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 26f3d74..762ecf7 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -40,7 +40,6 @@ def get_files_apt_doc(d, bb, manpages):
     return manpages
 
 def get_commands_apt_doc(d, bb, manpages):
-    import os
     s = list()
     __dir_cache__ = list()
     for m in manpages.split():
diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index 9274ed3..dd75d42 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -53,8 +53,6 @@ RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cr
 RRECOMMENDS_${PN} = "libpam-runtime"
 
 python populate_packages_prepend () {
-    import os.path
-
     def pam_plugin_append_file(pn, dir, file):
         nf = os.path.join(dir, file)
         of = d.getVar('FILES_' + pn, True)
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index f90b3fc..1d4121c 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -32,8 +32,6 @@ LIBV = "2.10.0"
 PACKAGES_DYNAMIC += "gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 
 python populate_packages_prepend () {
-    import os.path
-
     prologue = d.getVar("postinst_prologue", True)
     postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index e2d6ef1..16aa693 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -32,8 +32,6 @@ LIBV = "2.10.0"
 PACKAGES_DYNAMIC += "gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 
 python populate_packages_prepend () {
-    import os.path
-
     prologue = d.getVar("postinst_prologue", True)
     postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index e49e6e7..3b85759 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -39,8 +39,6 @@ LIBV = "2.10.0"
 PACKAGES_DYNAMIC += "gtk-immodule-* gtk-printbackend-*"
 
 python populate_packages_prepend () {
-    import os.path
-
     prologue = d.getVar("postinst_prologue", True)
 
     gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 3baa46e..c544870 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -29,8 +29,6 @@ CFLAGS_prepend = "-DHAVE_ANIMATION "
 inherit gnome
 
 python populate_packages_prepend() {
-    import os.path
-
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
     themes_root = os.path.join(d.getVar('datadir', True), "themes")
 
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index a164717..6655217 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -35,7 +35,6 @@ EXTRA_OECONF = "\
 #PACKAGES_DYNAMIC = "directfb-inputdrivers-*"
 #
 #python populate_packages_prepend () {
-#    import os.path
 #    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
 #    do_split_packages(d, inputdrivers_libdir, '*.so$', 'directfb-inputdrivers-%s', 'Directfb plugin for %s')
 #}
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 6eb5fd8..6bf2503 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -11,8 +11,6 @@ DRIDRIVERS_append_x86-64 = ",i915,i965"
 EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers --with-dri-drivers=${DRIDRIVERS}"
 
 python populate_packages_prepend() {
-    import os.path
-
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
 
     do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 8aa1458..d39f49d 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -3,8 +3,6 @@ FILES_kernel-devicetree = "/boot/devicetree*"
 KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x3000"
 
 python __anonymous () {
-    import bb
-
     devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
     if devicetree:
 	depends = d.getVar("DEPENDS", True)
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
index ebaced4..390a826 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -30,7 +30,6 @@ PACKAGES_DYNAMIC = "qmmp-plugin-* "
 
 
 python populate_packages_prepend () {
-    import os
     qmmp_libdir = d.expand('${libdir}/qmmp')
     gd = d.expand('${D}/${libdir}/qmmp')
     plug_dirs = os.listdir(gd)
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 3f61a20..df70e09 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -38,8 +38,6 @@ QT_LIB_NAMES = "Qt3Support QtAssistantClient QtCLucene QtCore QtDBus QtDesigner
 QT_EXTRA_LIBS = "pvrQWSWSEGL"
 
 python __anonymous () {
-    import bb
-
     lib_packages = []
     dev_packages = []
     dbg_packages = []
@@ -280,7 +278,7 @@ python populate_packages_prepend() {
  
     phrasebook_dir = d.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/')
     phrasebook_name = d.expand('${QT_BASE_NAME}-phrasebook-%s')
-    import os;
+
     if os.path.exists("%s%s" % (d.expand('${D}'), phrasebook_dir)):
         do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
     else:
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index c084c40..98b09f8 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -59,7 +59,6 @@ FILES_${PN}-dbg += "/usr/games/.debug/*"
 FILES_${PN}-extra = "/usr/games/ /usr/share/applications /etc/gconf/schemas"
 
 python __anonymous () {
-    import bb
     var = bb.data.expand("FILES_${PN}", d, 1)
     data = d.getVar(var, True)
     for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 1162ccd..ec602a6 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -47,8 +47,6 @@ BOOST_LIBS = "\
 # Make a package for each library, plus -dev
 PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
-    import bb
-
     packages = []
     extras = []
     for lib in d.getVar('BOOST_LIBS', True).split( ):
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 2aeec44..83a03b3 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=12;endline=15;md5=a48af114a80c222ca
 PR = "r2"
 
 python __anonymous () {
-    import bb, re
+    import re
     uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with uClibc")




