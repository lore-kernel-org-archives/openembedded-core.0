Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BD19A77D3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 21:26:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 12 Apr 2017 14:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="76695867"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 12 Apr 2017 14:26:27 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 14:29:12 -0700
Message-Id: <b85dace6a77160ecd2a98d118d4703ab51486ded.1492031994.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492031994.git.brian.avery@intel.com>
References: <cover.1492031994.git.brian.avery@intel.com>
Subject: [PATCH 2/4] oe-find-native-sysroot: work with RSS
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
X-List-Received-Date: Wed, 12 Apr 2017 21:26:28 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The generic STAGING_DIR_NATIVE is gone since RSS, so when find
OECORE_NATIVE_SYSROOT, the user has to specify which recipe's
STAGING_DIR_NATIVE will be used as OECORE_NATIVE_SYSROOT.

* The usage is changed from ". oe-find-native-sysroot" to
  ". oe-find-native-sysroot <recipe>".
* The oe-run-native's usage has changed from
  "oe-run-native tool" to "oe-run-native native-recipe tool".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-find-native-sysroot | 56 ++++++++++++++++++++++++++++--------------
 scripts/oe-run-native          | 15 +++++++----
 scripts/runqemu-export-rootfs  |  2 +-
 scripts/runqemu-extract-sdk    |  2 +-
 4 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 13a5c46..ad7b2d1 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -9,7 +9,7 @@
 # it, e.g:
 #
 # SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot`
-# . $SYSROOT_SETUP_SCRIPT
+# . $SYSROOT_SETUP_SCRIPT <recipe>
 #
 # This script will terminate execution of your calling program unless
 # you set a variable $SKIP_STRICT_SYSROOT_CHECK to a non-empty string
@@ -30,8 +30,8 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-if [ "$1" = '--help' -o "$1" = '-h' ] ; then
-    echo 'Usage: oe-find-native-sysroot [-h|--help]'
+if [ "$1" = '--help' -o "$1" = '-h' -o $# -ne 1 ] ; then
+    echo 'Usage: oe-find-native-sysroot <recipe> [-h|--help]'
     echo ''
     echo 'OpenEmbedded find-native-sysroot - helper script to set'
     echo 'environment variables OECORE_NATIVE_SYSROOT and PSEUDO'
@@ -39,11 +39,31 @@ if [ "$1" = '--help' -o "$1" = '-h' ] ; then
     echo 'executable binary'
     echo ''
     echo 'options:'
+    echo '  recipe              its STAGING_DIR_NATIVE is used as native sysroot'
     echo '  -h, --help          show this help message and exit'
     echo ''
     exit 2
 fi
 
+# Global vars
+BITBAKE_E=""
+OECORE_NATIVE_SYSROOT=""
+
+set_oe_native_sysroot(){
+    echo "Running bitbake -e $1"
+    BITBAKE_E="`bitbake -e $1`"
+    OECORE_NATIVE_SYSROOT=`echo "$BITBAKE_E" | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
+
+    if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
+        # This indicates that there was an error running bitbake -e that
+        # the user needs to be informed of
+        echo "There was an error running bitbake to determine STAGING_DIR_NATIVE"
+        echo "Here is the output from bitbake -e $1"
+        echo $BITBAKE_E
+        exit 1
+    fi
+}
+
 if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
     BITBAKE=`which bitbake 2> /dev/null`
     if [ "x$BITBAKE" != "x" ]; then
@@ -54,10 +74,10 @@ if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
                 exit 1
             fi
             touch conf/sanity.conf
-            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
+            set_oe_native_sysroot $1
             rm -f conf/sanity.conf
         else
-            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
+            set_oe_native_sysroot $1
         fi
     else
         echo "Error: Unable to locate bitbake command."
@@ -69,21 +89,11 @@ if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
     fi
 fi
 
-if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
-    # This indicates that there was an error running bitbake -e that
-    # the user needs to be informed of
-    echo "There was an error running bitbake to determine STAGING_DIR_NATIVE"
-    echo "Here is the output from bitbake -e"
-    bitbake -e
-    exit 1
-fi
-
-# Set up pseudo command
-if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ]; then
-    echo "Error: Unable to find pseudo binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
+if [ ! -e "$OECORE_NATIVE_SYSROOT/" ]; then
+    echo "Error: $OECORE_NATIVE_SYSROOT doesn't exist."
 
     if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
-        echo "Have you run 'bitbake meta-ide-support'?"
+        echo "Have you run 'bitbake $1 -caddto_recipe_sysroot'?"
     else
         echo "This shouldn't happen - something is wrong with your toolchain installation"
     fi
@@ -92,4 +102,12 @@ if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ]; then
         exit 1
     fi
 fi
-PSEUDO="$OECORE_NATIVE_SYSROOT/usr/bin/pseudo"
+
+# Set up pseudo command
+pseudo="$OECORE_NATIVE_SYSROOT/usr/bin/pseudo"
+if [ -e "$pseudo" ]; then
+    echo "PSEUDO=$pseudo"
+    PSEUDO="$pseudo"
+else
+    echo "PSEUDO $pseudo is not found."
+fi
diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index f2453e7..de3c02e 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -22,34 +22,39 @@
 #
 
 if [ $# -lt 1 -o "$1" = '--help' -o "$1" = '-h' ] ; then
-    echo 'oe-run-native: error: the following arguments are required: <native tool>'
-    echo 'Usage: oe-run-native tool [parameters]'
+    echo 'oe-run-native: error: the following arguments are required: <native recipe> <native tool>'
+    echo 'Usage: oe-run-native native-recipe tool [parameters]'
     echo ''
     echo 'OpenEmbedded run-native - runs native tools'
     echo ''
     echo 'arguments:'
+    echo '  native-recipe       The recipe which provoides tool'
     echo '  tool                Native tool to run'
     echo ''
     exit 2
 fi
 
+native_recipe="$1"
+tool="$2"
+shift
+
 SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
 if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
         echo "Error: Unable to find oe-find-native-sysroot script"
         exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT
+. $SYSROOT_SETUP_SCRIPT $native_recipe
 
 OLD_PATH=$PATH
 
 # look for a tool only in native sysroot
 PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
-tool=`/usr/bin/which $1 2>/dev/null`
+tool=`/usr/bin/which $tool 2>/dev/null`
 
 if [ -n "$tool" ] ; then
     # add old path to allow usage of host tools
     PATH=$PATH:$OLD_PATH $@
 else
-    echo "Error: Unable to find '$1' in native sysroot"
+    echo "Error: Unable to find '$tool' in $PATH"
     exit 1
 fi
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 7ebc071..c7992d8 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -44,7 +44,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 	echo "Did you forget to source your build environment setup script?"
 	exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT
+. $SYSROOT_SETUP_SCRIPT meta-ide-support
 
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
 	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 32ddd48..2a0dd50 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -35,7 +35,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
     echo "Did you forget to source your build system environment setup script?"
     exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT
+. $SYSROOT_SETUP_SCRIPT meta-ide-support
 PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
 
 ROOTFS_TARBALL=$1
-- 
1.9.1


