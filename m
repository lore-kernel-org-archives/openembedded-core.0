Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY01-0002DX-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:37 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 8B2142FD1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:58 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:37 -0700
Message-Id: <527e26ea1e44f114fc9fcec1bc7d83156dba1a70.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 8B2142FD1D.EE60A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 06/16] sanity.bbclass: copy the data store and finalise before running checks
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:37 -0000

From: Joshua Lock <josh@linux.intel.com>

At the ConfigParsed event the datastore has yet to be finalised and thus
appends and overrides have not been set.
To ensure the sanity check is being run against the configuration values
the user has set call finalize() on a copy of the datastore and pass that
for all sanity checks.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |  127 +++++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 59 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 687ddeb..0c2fa04 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -112,8 +112,8 @@ def check_connectivity(d):
 
     return retval
 
-def check_supported_distro(e):
-    tested_distros = e.data.getVar('SANITY_TESTED_DISTROS', True)
+def check_supported_distro(sanity_data):
+    tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS', True)
     if not tested_distros:
         return
 
@@ -160,26 +160,26 @@ def check_supported_distro(e):
         bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
 
 # Checks we should only make if MACHINE is set correctly
-def check_sanity_validmachine(e):
+def check_sanity_validmachine(sanity_data):
     from bb import data
 
     messages = ""
 
     # Check TUNE_ARCH is set
-    if data.getVar('TUNE_ARCH', e.data, True) == 'INVALID':
+    if data.getVar('TUNE_ARCH', sanity_data, True) == 'INVALID':
         messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
 
     # Check TARGET_ARCH is set correctly
-    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
+    if data.getVar('TARGE_ARCH', sanity_data, False) == '${TUNE_ARCH}':
         messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
     
     # Check TARGET_OS is set
-    if data.getVar('TARGET_OS', e.data, True) == 'INVALID':
+    if data.getVar('TARGET_OS', sanity_data, True) == 'INVALID':
         messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
 
     # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
-    pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
-    tunepkg = data.getVar('TUNE_PKGARCH', e.data, True)
+    pkgarchs = data.getVar('PACKAGE_ARCHS', sanity_data, True)
+    tunepkg = data.getVar('TUNE_PKGARCH', sanity_data, True)
     tunefound = False
     seen = {}
     dups = []
@@ -201,7 +201,7 @@ def check_sanity_validmachine(e):
     return messages
 
 
-def check_sanity(e):
+def check_sanity(sanity_data):
     from bb import note, error, data, __version__
 
     try:
@@ -211,7 +211,7 @@ def check_sanity(e):
     import commands
 
     # Check the bitbake version meets minimum requirements
-    minversion = data.getVar('BB_MIN_VERSION', e.data , True)
+    minversion = data.getVar('BB_MIN_VERSION', sanity_data , True)
     if not minversion:
         # Hack: BB_MIN_VERSION hasn't been parsed yet so return 
         # and wait for the next call
@@ -233,42 +233,42 @@ def check_sanity(e):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, __version__)
 
     # Check that the MACHINE is valid, if it is set
-    if data.getVar('MACHINE', e.data, True):
-        if not check_conf_exists("conf/machine/${MACHINE}.conf", e.data):
+    if data.getVar('MACHINE', sanity_data, True):
+        if not check_conf_exists("conf/machine/${MACHINE}.conf", sanity_data):
             messages = messages + 'Please set a valid MACHINE in your local.conf or environment\n'
         else:
-            messages = messages + check_sanity_validmachine(e)
+            messages = messages + check_sanity_validmachine(sanity_data)
     else:
         messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
 
     # Check we are using a valid lacal.conf
-    current_conf  = data.getVar('CONF_VERSION', e.data, True)
-    conf_version =  data.getVar('LOCALCONF_VERSION', e.data, True)
+    current_conf  = data.getVar('CONF_VERSION', sanity_data, True)
+    conf_version =  data.getVar('LOCALCONF_VERSION', sanity_data, True)
 
     if current_conf != conf_version:
         messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf conf/local.conf.sample\" is a good way to visualise the changes.\n"
 
     # Check bblayers.conf is valid
-    current_lconf = data.getVar('LCONF_VERSION', e.data, True)
-    lconf_version = data.getVar('LAYER_CONF_VERSION', e.data, True)
+    current_lconf = data.getVar('LCONF_VERSION', sanity_data, True)
+    lconf_version = data.getVar('LAYER_CONF_VERSION', sanity_data, True)
     if current_lconf != lconf_version:
         messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
 
     # If we have a site.conf, check it's valid
-    if check_conf_exists("conf/site.conf", e.data):
-        current_sconf = data.getVar('SCONF_VERSION', e.data, True)
-        sconf_version = data.getVar('SITE_CONF_VERSION', e.data, True)
+    if check_conf_exists("conf/site.conf", sanity_data):
+        current_sconf = data.getVar('SCONF_VERSION', sanity_data, True)
+        sconf_version = data.getVar('SITE_CONF_VERSION', sanity_data, True)
         if current_sconf != sconf_version:
             messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf conf/site.conf.sample\" is a good way to visualise the changes.\n"
 
-    assume_provided = data.getVar('ASSUME_PROVIDED', e.data , True).split()
+    assume_provided = data.getVar('ASSUME_PROVIDED', sanity_data , True).split()
     # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
     if "diffstat-native" not in assume_provided:
         messages = messages + 'Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n'
 
     # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
     # set, since so much relies on it being set.
-    dldir = data.getVar('DL_DIR', e.data, True)
+    dldir = data.getVar('DL_DIR', sanity_data, True)
     if not dldir:
         messages = messages + "DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n"
     if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
@@ -276,32 +276,32 @@ def check_sanity(e):
     
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
-    distro = data.getVar('DISTRO', e.data, True)
+    distro = data.getVar('DISTRO', sanity_data, True)
     if distro:
-        if not ( check_conf_exists("conf/distro/${DISTRO}.conf", e.data) or check_conf_exists("conf/distro/include/${DISTRO}.inc", e.data) ):
-            messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % data.getVar("DISTRO", e.data, True )
+        if not ( check_conf_exists("conf/distro/${DISTRO}.conf", sanity_data) or check_conf_exists("conf/distro/include/${DISTRO}.inc", sanity_data) ):
+            messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % data.getVar("DISTRO", sanity_data, True )
 
     missing = ""
 
-    if not check_app_exists("${MAKE}", e.data):
+    if not check_app_exists("${MAKE}", sanity_data):
         missing = missing + "GNU make,"
 
-    if not check_app_exists('${BUILD_PREFIX}gcc', e.data):
-        missing = missing + "C Compiler (%sgcc)," % data.getVar("BUILD_PREFIX", e.data, True)
+    if not check_app_exists('${BUILD_PREFIX}gcc', sanity_data):
+        missing = missing + "C Compiler (%sgcc)," % data.getVar("BUILD_PREFIX", sanity_data, True)
 
-    if not check_app_exists('${BUILD_PREFIX}g++', e.data):
-        missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", e.data, True)
+    if not check_app_exists('${BUILD_PREFIX}g++', sanity_data):
+        missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", sanity_data, True)
 
-    required_utilities = e.data.getVar('SANITY_REQUIRED_UTILITIES', True)
+    required_utilities = sanity_data.getVar('SANITY_REQUIRED_UTILITIES', True)
 
     if "qemu-native" in assume_provided:
-        if not check_app_exists("qemu-arm", e.data):
+        if not check_app_exists("qemu-arm", sanity_data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-    if "." in data.getVar('PATH', e.data, True).split(":"):
+    if "." in data.getVar('PATH', sanity_data, True).split(":"):
         messages = messages + "PATH contains '.' which will break the build, please remove this"
 
-    if data.getVar('TARGET_ARCH', e.data, True) == "arm":
+    if data.getVar('TARGET_ARCH', sanity_data, True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
@@ -315,7 +315,7 @@ def check_sanity(e):
             pass
 
     for util in required_utilities.split():
-        if not check_app_exists( util, e.data ):
+        if not check_app_exists( util, sanity_data ):
             missing = missing + "%s," % util
 
     if missing != "":
@@ -326,10 +326,10 @@ def check_sanity(e):
     if pseudo_msg != "":
         messages = messages + pseudo_msg + '\n'
 
-    check_supported_distro(e)
+    check_supported_distro(sanity_data)
 
     # Check if DISPLAY is set if IMAGETEST is set
-    if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
+    if not data.getVar( 'DISPLAY', sanity_data, True ) and data.getVar( 'IMAGETEST', sanity_data, True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
 
     omask = os.umask(022)
@@ -337,11 +337,11 @@ def check_sanity(e):
         messages = messages + "Please use a umask which allows a+rx and u+rwx\n"
     os.umask(omask)
 
-    oes_bb_conf = data.getVar( 'OES_BITBAKE_CONF', e.data, True )
+    oes_bb_conf = data.getVar( 'OES_BITBAKE_CONF', sanity_data, True )
     if not oes_bb_conf:
         messages = messages + 'You do not include OpenEmbeddeds version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
 
-    nolibs = data.getVar('NO32LIBS', e.data, True)
+    nolibs = data.getVar('NO32LIBS', sanity_data, True)
     if not nolibs:
         lib32path = '/lib'
         if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
@@ -350,8 +350,8 @@ def check_sanity(e):
         if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):
             messages = messages + "You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n"
 
-    tmpdir = data.getVar('TMPDIR', e.data, True)
-    sstate_dir = data.getVar('SSTATE_DIR', e.data, True)
+    tmpdir = data.getVar('TMPDIR', sanity_data, True)
+    sstate_dir = data.getVar('SSTATE_DIR', sanity_data, True)
 
     # Check saved sanity info
     last_sanity_version = 0
@@ -368,16 +368,16 @@ def check_sanity(e):
             if line.startswith('SSTATE_DIR'):
                 last_sstate_dir = line.split()[1]
     
-    sanity_version = int(data.getVar('SANITY_VERSION', e.data, True) or 1)
+    sanity_version = int(data.getVar('SANITY_VERSION', sanity_data, True) or 1)
     if last_sanity_version < sanity_version: 
-        messages = messages + check_sanity_version_change(e.data)
-        messages = messages + check_sanity_tmpdir_change(tmpdir, e.data)
-        messages = messages + check_sanity_sstate_dir_change(sstate_dir, e.data)
+        messages = messages + check_sanity_version_change(sanity_data)
+        messages = messages + check_sanity_tmpdir_change(tmpdir, sanity_data)
+        messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
     else: 
         if last_tmpdir != tmpdir:
-            messages = messages + check_sanity_tmpdir_change(tmpdir, e.data)
+            messages = messages + check_sanity_tmpdir_change(tmpdir, sanity_data)
         if last_sstate_dir != sstate_dir:
-            messages = messages + check_sanity_sstate_dir_change(sstate_dir, e.data)
+            messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
 
     if os.path.exists("conf") and not messages:
         f = file(sanityverfile, 'w')
@@ -402,8 +402,8 @@ def check_sanity(e):
     #
     # Check the 'ABI' of TMPDIR
     #
-    current_abi = data.getVar('OELAYOUT_ABI', e.data, True)
-    abifile = data.getVar('SANITY_ABIFILE', e.data, True)
+    current_abi = data.getVar('OELAYOUT_ABI', sanity_data, True)
+    abifile = data.getVar('SANITY_ABIFILE', sanity_data, True)
     if os.path.exists(abifile):
         f = file(abifile, "r")
         abi = f.read().strip()
@@ -412,16 +412,16 @@ def check_sanity(e):
             f.write(current_abi)
         elif abi == "2" and current_abi == "3":
             bb.note("Converting staging from layout version 2 to layout version 3")
-            os.system(e.data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"))
-            os.system(e.data.expand("ln -s sysroots ${TMPDIR}/staging"))
-            os.system(e.data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"))
+            os.system(sanity_data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"))
+            os.system(sanity_data.expand("ln -s sysroots ${TMPDIR}/staging"))
+            os.system(sanity_data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"))
             f = file(abifile, "w")
             f.write(current_abi)
         elif abi == "3" and current_abi == "4":
             bb.note("Converting staging layout from version 3 to layout version 4")
-            if os.path.exists(e.data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
-                os.system(e.data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"))
-                os.system(e.data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"))
+            if os.path.exists(sanity_data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
+                os.system(sanity_data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"))
+                os.system(sanity_data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"))
 
             f = file(abifile, "w")
             f.write(current_abi)
@@ -429,7 +429,7 @@ def check_sanity(e):
             messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
         elif abi == "5" and current_abi == "6":
             bb.note("Converting staging layout from version 5 to layout version 6")
-            os.system(e.data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"))
+            os.system(sanity_data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"))
             f = file(abifile, "w")
             f.write(current_abi)
         elif abi == "7" and current_abi == "8":
@@ -442,7 +442,7 @@ def check_sanity(e):
         f.write(current_abi)
     f.close()
 
-    oeroot = data.getVar('COREBASE', e.data)
+    oeroot = data.getVar('COREBASE', sanity_data)
     if oeroot.find ('+') != -1:
         messages = messages + "Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include a +."
     elif oeroot.find (' ') != -1:
@@ -451,12 +451,21 @@ def check_sanity(e):
     if messages != "":
         raise_sanity_error(messages)
 
+# Create a copy of the datastore and finalise it to ensure appends and 
+# overrides are set - the datastore has yet to be finalised at ConfigParsed
+def copy_data(e):
+    sanity_data = bb.data.createCopy(e.data)
+    sanity_data.finalize()
+    return sanity_data
+
 addhandler check_sanity_eventhandler
 python check_sanity_eventhandler() {
     if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
-        check_sanity(e)
+        sanity_data = copy_data(e)
+        check_sanity(sanity_data)
     elif bb.event.getName(e) == "SanityCheck":
-        check_sanity(e)
+        sanity_data = copy_data(e)
+        check_sanity(sanity_data)
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
 
     return
-- 
1.7.9.5



