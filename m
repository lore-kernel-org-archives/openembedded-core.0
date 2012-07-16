Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhS-0006tH-Ri
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443351"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:26 -0700
Message-Id: <6612873dc59054e6d37fa7488226218bfb759127.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/30] runqemu: Fix running qemu when build without gl
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:07 -0000

From: Khem Raj <raj.khem@gmail.com>

When gl is disabled in PACKAGECONFIG then we dont need
to check for supporting libs to be present before running
qemu.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu          |   14 --------------
 scripts/runqemu-internal |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 650d1df..7454dd4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -387,20 +387,6 @@ echo "FSTYPE: [$FSTYPE]"
 setup_sysroot
 # OECORE_NATIVE_SYSROOT is now set for all cases
 
-# We can't run without a libGL.so
-libgl='no'
-
-[ -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so ] && libgl='yes'
-[ -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so ] && libgl='yes'
-[ -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so ] && libgl='yes'
-
-if [ "$libgl" != 'yes' ]; then
-    echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
-    Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
-    Fedora package names are: mesa-libGL-devel mesa-libGLU-devel."
-    exit 1;
-fi
-
 INTERNAL_SCRIPT="$0-internal"
 if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
 INTERNAL_SCRIPT=`which runqemu-internal`
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index a21ea93..eeadb24 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -468,6 +468,23 @@ if [ ! -x "$QEMUBIN" ]; then
     return
 fi
 
+NEED_GL=`ldd $QEMUBIN/$QEMU 2>&1 | grep libGLU`
+# We can't run without a libGL.so
+if [ "$NEED_GL" != "" ]; then
+    libgl='no'
+
+    [ -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so ] && libgl='yes'
+    [ -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so ] && libgl='yes'
+    [ -e /usr/lib/*-linux-gnu/libGL.so -a -e /usr/lib/*-linux-gnu/libGLU.so ] && libgl='yes'
+
+    if [ "$libgl" != 'yes' ]; then
+        echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
+        Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.
+        Fedora package names are: mesa-libGL-devel mesa-libGLU-devel."
+        exit 1;
+    fi
+fi
+
 do_quit() {
     if [ -n "$PIDFILE" ]; then
         #echo kill `cat $PIDFILE`
-- 
1.7.7.6



