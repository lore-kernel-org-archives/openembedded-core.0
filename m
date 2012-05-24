Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXLg9-0001An-UZ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 02:13:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2012 17:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103547426"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 17:03:07 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 17:02:59 -0700
Message-Id: <66aec3b7113a35ced4c76a152e1b8929514b3f77.1337816265.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
Subject: [PATCH 3/7] sanity.bbclass: data.getVar(VAR, obj, exp) -> obj.getVar(VAR, exp)
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
X-List-Received-Date: Thu, 24 May 2012 00:13:23 -0000

Replace calls to data.getVar(VARIABLE, data_object, expand) to
direct calls to the getVar method the the data_object.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   60 +++++++++++++++++++++---------------------
 1 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5361f1f..5cf9ea1 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -236,20 +236,20 @@ def check_sanity_validmachine(sanity_data):
     messages = ""
 
     # Check TUNE_ARCH is set
-    if data.getVar('TUNE_ARCH', sanity_data, True) == 'INVALID':
+    if sanity_data.getVar('TUNE_ARCH', True) == 'INVALID':
         messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
 
     # Check TARGET_ARCH is set correctly
-    if data.getVar('TARGE_ARCH', sanity_data, False) == '${TUNE_ARCH}':
+    if sanity_data.getVar('TARGE_ARCH', False) == '${TUNE_ARCH}':
         messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
     
     # Check TARGET_OS is set
-    if data.getVar('TARGET_OS', sanity_data, True) == 'INVALID':
+    if sanity_data.getVar('TARGET_OS', True) == 'INVALID':
         messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
 
     # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
-    pkgarchs = data.getVar('PACKAGE_ARCHS', sanity_data, True)
-    tunepkg = data.getVar('TUNE_PKGARCH', sanity_data, True)
+    pkgarchs = sanity_data.getVar('PACKAGE_ARCHS', True)
+    tunepkg = sanity_data.getVar('TUNE_PKGARCH', True)
     tunefound = False
     seen = {}
     dups = []
@@ -281,7 +281,7 @@ def check_sanity(sanity_data):
     import commands
 
     # Check the bitbake version meets minimum requirements
-    minversion = data.getVar('BB_MIN_VERSION', sanity_data , True)
+    minversion = sanity_data.getVar('BB_MIN_VERSION', True)
     if not minversion:
         # Hack: BB_MIN_VERSION hasn't been parsed yet so return 
         # and wait for the next call
@@ -303,7 +303,7 @@ def check_sanity(sanity_data):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, __version__)
 
     # Check that the MACHINE is valid, if it is set
-    if data.getVar('MACHINE', sanity_data, True):
+    if sanity_data.getVar('MACHINE', True):
         if not check_conf_exists("conf/machine/${MACHINE}.conf", sanity_data):
             messages = messages + 'Please set a valid MACHINE in your local.conf or environment\n'
         else:
@@ -312,33 +312,33 @@ def check_sanity(sanity_data):
         messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
 
     # Check we are using a valid lacal.conf
-    current_conf  = data.getVar('CONF_VERSION', sanity_data, True)
-    conf_version =  data.getVar('LOCALCONF_VERSION', sanity_data, True)
+    current_conf  = sanity_data.getVar('CONF_VERSION', True)
+    conf_version =  sanity_data.getVar('LOCALCONF_VERSION', True)
 
     if current_conf != conf_version:
         messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf conf/local.conf.sample\" is a good way to visualise the changes.\n"
 
     # Check bblayers.conf is valid
-    current_lconf = data.getVar('LCONF_VERSION', sanity_data, True)
-    lconf_version = data.getVar('LAYER_CONF_VERSION', sanity_data, True)
+    current_lconf = sanity_data.getVar('LCONF_VERSION', True)
+    lconf_version = sanity_data.getVar('LAYER_CONF_VERSION', True)
     if current_lconf != lconf_version:
         messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
 
     # If we have a site.conf, check it's valid
     if check_conf_exists("conf/site.conf", sanity_data):
-        current_sconf = data.getVar('SCONF_VERSION', sanity_data, True)
-        sconf_version = data.getVar('SITE_CONF_VERSION', sanity_data, True)
+        current_sconf = sanity_data.getVar('SCONF_VERSION', True)
+        sconf_version = sanity_data.getVar('SITE_CONF_VERSION', True)
         if current_sconf != sconf_version:
             messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf conf/site.conf.sample\" is a good way to visualise the changes.\n"
 
-    assume_provided = data.getVar('ASSUME_PROVIDED', sanity_data , True).split()
+    assume_provided = sanity_data.getVar('ASSUME_PROVIDED', True).split()
     # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
     if "diffstat-native" not in assume_provided:
         messages = messages + 'Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n'
 
     # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
     # set, since so much relies on it being set.
-    dldir = data.getVar('DL_DIR', sanity_data, True)
+    dldir = sanity_data.getVar('DL_DIR', True)
     if not dldir:
         messages = messages + "DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n"
     if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
@@ -346,10 +346,10 @@ def check_sanity(sanity_data):
     
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
-    distro = data.getVar('DISTRO', sanity_data, True)
+    distro = sanity_data.getVar('DISTRO', True)
     if distro:
         if not ( check_conf_exists("conf/distro/${DISTRO}.conf", sanity_data) or check_conf_exists("conf/distro/include/${DISTRO}.inc", sanity_data) ):
-            messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % data.getVar("DISTRO", sanity_data, True )
+            messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % sanity_data.getVar("DISTRO", True )
 
     missing = ""
 
@@ -357,10 +357,10 @@ def check_sanity(sanity_data):
         missing = missing + "GNU make,"
 
     if not check_app_exists('${BUILD_PREFIX}gcc', sanity_data):
-        missing = missing + "C Compiler (%sgcc)," % data.getVar("BUILD_PREFIX", sanity_data, True)
+        missing = missing + "C Compiler (%sgcc)," % sanity_data.getVar("BUILD_PREFIX", True)
 
     if not check_app_exists('${BUILD_PREFIX}g++', sanity_data):
-        missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", sanity_data, True)
+        missing = missing + "C++ Compiler (%sg++)," % sanity_data.getVar("BUILD_PREFIX", True)
 
     required_utilities = sanity_data.getVar('SANITY_REQUIRED_UTILITIES', True)
 
@@ -368,11 +368,11 @@ def check_sanity(sanity_data):
         if not check_app_exists("qemu-arm", sanity_data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-    paths = data.getVar('PATH', sanity_data, True).split(":")
+    paths = sanity_data.getVar('PATH', True).split(":")
     if "." in paths or "" in paths:
         messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
 
-    if data.getVar('TARGET_ARCH', sanity_data, True) == "arm":
+    if sanity_data.getVar('TARGET_ARCH', True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
@@ -403,7 +403,7 @@ def check_sanity(sanity_data):
         messages = messages + toolchain_msg + '\n'
 
     # Check if DISPLAY is set if IMAGETEST is set
-    if not data.getVar( 'DISPLAY', sanity_data, True ) and data.getVar( 'IMAGETEST', sanity_data, True ) == 'qemu':
+    if not sanity_data.getVar( 'DISPLAY', True ) and sanity_data.getVar( 'IMAGETEST', True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
 
     omask = os.umask(022)
@@ -411,11 +411,11 @@ def check_sanity(sanity_data):
         messages = messages + "Please use a umask which allows a+rx and u+rwx\n"
     os.umask(omask)
 
-    oes_bb_conf = data.getVar( 'OES_BITBAKE_CONF', sanity_data, True )
+    oes_bb_conf = sanity_data.getVar( 'OES_BITBAKE_CONF', True)
     if not oes_bb_conf:
         messages = messages + 'You do not include OpenEmbeddeds version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
 
-    nolibs = data.getVar('NO32LIBS', sanity_data, True)
+    nolibs = sanity_data.getVar('NO32LIBS', True)
     if not nolibs:
         lib32path = '/lib'
         if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
@@ -424,8 +424,8 @@ def check_sanity(sanity_data):
         if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):
             messages = messages + "You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n"
 
-    tmpdir = data.getVar('TMPDIR', sanity_data, True)
-    sstate_dir = data.getVar('SSTATE_DIR', sanity_data, True)
+    tmpdir = sanity_data.getVar('TMPDIR', True)
+    sstate_dir = sanity_data.getVar('SSTATE_DIR', True)
 
     # Check saved sanity info
     last_sanity_version = 0
@@ -442,7 +442,7 @@ def check_sanity(sanity_data):
             if line.startswith('SSTATE_DIR'):
                 last_sstate_dir = line.split()[1]
     
-    sanity_version = int(data.getVar('SANITY_VERSION', sanity_data, True) or 1)
+    sanity_version = int(sanity_data.getVar('SANITY_VERSION', True) or 1)
     if last_sanity_version < sanity_version: 
         messages = messages + check_sanity_version_change(sanity_data)
         messages = messages + check_sanity_tmpdir_change(tmpdir, sanity_data)
@@ -476,8 +476,8 @@ def check_sanity(sanity_data):
     #
     # Check the 'ABI' of TMPDIR
     #
-    current_abi = data.getVar('OELAYOUT_ABI', sanity_data, True)
-    abifile = data.getVar('SANITY_ABIFILE', sanity_data, True)
+    current_abi = sanity_data.getVar('OELAYOUT_ABI', True)
+    abifile = sanity_data.getVar('SANITY_ABIFILE', True)
     if os.path.exists(abifile):
         f = file(abifile, "r")
         abi = f.read().strip()
@@ -516,7 +516,7 @@ def check_sanity(sanity_data):
         f.write(current_abi)
     f.close()
 
-    oeroot = data.getVar('COREBASE', sanity_data)
+    oeroot = sanity_data.getVar('COREBASE')
     if oeroot.find ('+') != -1:
         messages = messages + "Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include a +."
     elif oeroot.find (' ') != -1:
-- 
1.7.7.6



