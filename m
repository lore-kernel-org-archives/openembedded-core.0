Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QkRD6-0007XE-7F
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 03:40:56 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 3EFDA3055B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 21:36:37 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 18:36:29 -0700
Message-Id: <5e2e4f943ba2cb2d4e1d8152e65f133ae699a462.1311384871.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311384871.git.scott.a.garman@intel.com>
References: <cover.1311384871.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1311384871.git.scott.a.garman@intel.com>
References: <cover.1311384871.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 3EFDA3055B.5C2C6
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: report error if TMPDIR cannot be determined
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
X-List-Received-Date: Sat, 23 Jul 2011 01:40:56 -0000

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
1.7.1



