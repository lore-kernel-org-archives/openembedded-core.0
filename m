Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlFgv-0001n2-V6
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:35:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 00:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,259,1309762800"; d="scan'208";a="31038680"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 00:30:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 00:30:43 -0700
Message-Id: <0e3c373f707202c119093e7a33c53bf51b2d31fa.1311578785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED 25 July PULL 7/7] runqemu: report error if TMPDIR cannot be determined
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
X-List-Received-Date: Mon, 25 Jul 2011 07:35:06 -0000

From: Scott Garman <scott.a.garman@intel.com>

Invoking runqemu outside of the build directory for an
in-tree setup results in an empty TMPDIR because bitbake -e
cannot be run to find it.

A symptom of this problem is running runqemu and getting the
following error:

Error: Unable to find tunctl binary in <directory>

Catch this case and report the error to the user.

This fixes [YOCTO #1278]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |   27 ++++++++++++++++-----------
 1 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5aed25a..dacaf7c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -272,22 +272,27 @@ setup_tmpdir() {
 
         # We have bitbake in PATH, get TMPDIR from bitbake
         TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        if [ -z "$TMPDIR" ]; then
+            echo "Error: this script needs to be run from your build directory,"
+            echo "or you need to explicitly set TMPDIR in your environment"
+            exit 1
+        fi
     fi
 }
 
 setup_sysroot() {
-	# Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
-	# environment script. If that variable isn't set, we're
-	# either in an in-tree build scenario or the environment
-	# script wasn't source'd.
-	if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
-		setup_tmpdir
-		BUILD_ARCH=`uname -m`
-		BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
-		BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
-
-		OECORE_NATIVE_SYSROOT=$TMPDIR/sysroots/$BUILD_SYS
-	fi 
+    # Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
+    # environment script. If that variable isn't set, we're
+    # either in an in-tree build scenario or the environment
+    # script wasn't source'd.
+    if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
+        setup_tmpdir
+        BUILD_ARCH=`uname -m`
+        BUILD_OS=`uname | tr '[A-Z]' '[a-z]'`
+        BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
+
+        OECORE_NATIVE_SYSROOT=$TMPDIR/sysroots/$BUILD_SYS
+    fi 
 }
 
 # Locate a rootfs image based on defaults defined above
-- 
1.7.3.4



