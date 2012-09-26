Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TGw99-0000R7-Al
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 20:15:45 +0200
Received: from localhost (unknown [64.122.245.103])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 20D40304D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 14:02:46 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 11:02:26 -0700
Message-Id: <5a9d41df316c1556df085de8662de191f5749d64.1348682342.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348682342.git.scott.a.garman@intel.com>
References: <cover.1348682342.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1348682342.git.scott.a.garman@intel.com>
References: <cover.1348682342.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 20D40304D3.0CDDD
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/2] oe-find-native-sysroot: show bitbake errors to user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 18:15:45 -0000

Ran into another bug that was masked by hiding a bitbake error message.
This catches this situation and displays the error to the user.

Also includes whitespace fixes.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/oe-find-native-sysroot |   29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index b2c22aa..9df9b44 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -30,31 +30,40 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
+if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
     BITBAKE=`which bitbake 2> /dev/null`
     if [ "x$BITBAKE" != "x" ]; then
-	if [ "$UID" = "0" ]; then
+        if [ "$UID" = "0" ]; then
             # Root cannot run bitbake unless sanity checking is disabled
             if [ ! -d "./conf" ]; then
-		echo "Error: root cannot run bitbake by default, and I cannot find a ./conf directory to be able to disable sanity checking"
-		exit 1
+                echo "Error: root cannot run bitbake by default, and I cannot find a ./conf directory to be able to disable sanity checking"
+                exit 1
             fi
             touch conf/sanity.conf
             OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '=' -f2 | cut -d '"' -f2`
             rm -f conf/sanity.conf
-	else
+        else
             OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '=' -f2 | cut -d '"' -f2`
-	fi
+        fi
     else
-	echo "Error: Unable to locate your native sysroot."
-	echo "Did you forget to source the build environment setup script?"
+        echo "Error: Unable to locate bitbake command."
+        echo "Did you forget to source the build environment setup script?"
 
-	if [ -z "$SKIP_STRICT_SYSROOT_CHECK" ]; then
+        if [ -z "$SKIP_STRICT_SYSROOT_CHECK" ]; then
             exit 1
-	fi
+        fi
     fi
 fi
 
+if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
+    # This indicates that there was an error running bitbake -e that
+    # the user needs to be informed of
+    echo "There was an error running bitbake to determine STAGING_DIR_NATIVE"
+    echo "Here is the output from bitbake -e"
+    bitbake -e
+    exit 1
+fi
+
 # Set up pseudo command
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/pseudo" ]; then
     echo "Error: Unable to find pseudo binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
-- 
1.7.9.5



