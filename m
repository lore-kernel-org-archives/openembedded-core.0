Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Soe6B-00037b-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:19:46 +0200
Received: by ggnp4 with SMTP id p4so223888ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kuAhSVviXV+e1lZZ2nhdzdUduxAVKaSBfh/Bpc+BBW0=;
	b=GFZ679AZ0asSMbRZZDu39euKaP7lagD0QAMGnUtg+LB/R5XGNd6jwpQ8r+ux8PHxgg
	KPS0zGGuO/06msMpBmg+4Z8Ds+nJs9uznQT9oIWaEP4OvU3JG6Ugl/GOPxSjKtfFKgCF
	hzvwi8WMiPidtRoxRvhtm9tqJqRVGql7tagCzHBuxP7XI84dBqcH8Qj2tZvY0SAy6gJQ
	vvQkn4OSpjVw2h4qmDawJ/KNuYmZyfx7tPoPGmwy7DcxUxxBxpZUKD7Va7FYdpdlSPt/
	3bVOoT5Nq1doLU9+rcQkTux37W/w7EtqTzuRaUTo/H3DsbgvZVukosqluRVcUXUQx7jo
	/FRg==
Received: by 10.66.82.228 with SMTP id l4mr38501831pay.41.1341940110091;
	Tue, 10 Jul 2012 10:08:30 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pz9sm8640859pbb.61.2012.07.10.10.08.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 10:08:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 10:07:49 -0700
Message-Id: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] runqemu: Fix running qemu when build without gl
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
X-List-Received-Date: Tue, 10 Jul 2012 17:19:46 -0000

When gl is disabled in PACKAGECONFIG then we dont need
to check for supporting libs to be present before running
qemu.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu          |   14 --------------
 scripts/runqemu-internal |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8d149a2..0b547f2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -384,20 +384,6 @@ echo "FSTYPE: [$FSTYPE]"
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
index 041464d..2598800 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -467,6 +467,23 @@ if [ ! -x "$QEMUBIN" ]; then
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
1.7.5.4



