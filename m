Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SPbCx-0000X8-W5
	for Openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 17:11:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q42BUq9J002288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 2 May 2012 04:30:52 -0700 (PDT)
Received: from localhost.localdomain (128.224.60.100) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 2 May 2012 04:30:52 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 2 May 2012 06:30:46 -0500
Message-ID: <1335958246-4192-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.6.6.2
MIME-Version: 1.0
Subject: [PATCH] runqemu: Fix TAP='TUNSETGROUP: Invalid argument' by falling back to tunctl -u
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
X-List-Received-Date: Wed, 02 May 2012 15:11:12 -0000
Content-Type: text/plain

By default the runqemu script tries to set the group permissions on any
tap device it creates.  The TUNSETGROUP ioctl is not implemented on some
popular host enterprise linux distributions.

Internally the script will exit as follows:

++ /opt/qemux86/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tunctl -b -g 100
+ TAP='TUNSETGROUP: Invalid argument'
+ STATUS=1
+ '[' 1 -ne 0 ']'
+ echo 'tunctl failed:'
tunctl failed:
+ echo TUNSETGROUP: Invalid argument

This patch implements a fallback to using the userid as the owner of
the tap device which is supported by all 2.6 kernels, the default remains
to try and use the groupid first.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/runqemu-ifup     |   20 +++++++++++++-------
 scripts/runqemu-internal |    5 +++--
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index f80538f..e4c3daf 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -34,7 +34,7 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "sudo $(basename $0) <gid> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir>"
 }
 
 if [ $EUID -ne 0 ]; then
@@ -42,13 +42,14 @@ if [ $EUID -ne 0 ]; then
 	exit 1
 fi
 
-if [ $# -ne 2 ]; then
+if [ $# -ne 3 ]; then
 	usage
 	exit 1
 fi
 
-GROUP="-g $1"
-NATIVE_SYSROOT_DIR=$2
+USERID="-u $1"
+GROUP="-g $2"
+NATIVE_SYSROOT_DIR=$3
 
 TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
 if [ ! -x "$TUNCTL" ]; then
@@ -59,9 +60,14 @@ fi
 TAP=`$TUNCTL -b $GROUP 2>&1`
 STATUS=$?
 if [ $STATUS -ne 0 ]; then
-	echo "tunctl failed:"
-	echo $TAP
-	exit 1
+# If tunctl -g fails, try using tunctl -u, for older host kernels 
+# which do not support the TUNSETGROUP ioctl
+	TAP=`$TUNCTL -b $USERID 2>&1`
+	STATUS=$?
+	if [ $STATUS -ne 0 ]; then
+		echo "tunctl failed:"
+		exit 1
+	fi
 fi
 
 IFCONFIG=`which ifconfig 2> /dev/null`
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 1831a09..fb0d806 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -173,13 +173,14 @@ if [ "$TAP" = "" ]; then
     fi
 
     GROUPID=`id -g`
+    USERID=`id -u`
     echo "Setting up tap interface under sudo"
     # Redirect stderr since we could see a LD_PRELOAD warning here if pseudo is loaded
     # but inactive. This looks scary but is harmless
-    tap=`sudo $QEMUIFUP $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
+    tap=`sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT 2> /dev/null`
     if [ $? -ne 0 ]; then
         # Re-run standalone to see verbose errors
-        sudo $QEMUIFUP $GROUPID $OECORE_NATIVE_SYSROOT
+        sudo $QEMUIFUP $USERID $GROUPID $OECORE_NATIVE_SYSROOT
         return
     fi
     LOCKFILE="$LOCKDIR/$tap"
-- 
1.6.6.2



