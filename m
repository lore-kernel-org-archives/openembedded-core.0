Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S9zRO-00086m-VO
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 14:49:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 14:37:05 +0100
Message-Id: <1332250625-18091-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] scripts/bitbake: Allow to override path to pseudodone, make BUILDDIR optional
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
X-List-Received-Date: Tue, 20 Mar 2012 13:49:35 -0000

* Allows to workaround breakage caused by commit
  b4df1c7c79b5c801658bcf890ba3a8eab3d83189.

* Related thread on OE-core mailing list:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019136.html

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 scripts/bitbake |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 45c8697..3377b26 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -47,14 +47,24 @@ float_test() {
 # but earlier versions do not
 float_test "$TARVERSION > 1.23" && needtar="0"
 
-if [ "`pwd`" != "$BUILDDIR" ] ; then
-    echo "BitBake must be run from your build directory: $BUILDDIR"
+if [ -n "$BUILDDIR" ]; then
+    if [ "`pwd`" != "$BUILDDIR" ] ; then
+        echo "BitBake must be run from your build directory: $BUILDDIR"
+        exit 1
+    fi
+    if [ -z "$PSEUDODONE" ]; then
+        PSEUDODONE="$BUILDDIR/pseudodone"
+    fi
+fi
+
+if [ -z "$PSEUDODONE" ]; then
+    echo "BitBake requires PSEUDODONE to be set."
     exit 1
 fi
 
 buildpseudo="1"
-if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
-    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
+if [ $needpseudo = "1" ] && [ -e "$PSEUDODONE" ]; then
+    PSEUDOBINDIR=`cat $PSEUDODONE`
     if [ -e "$PSEUDOBINDIR/pseudo" -a -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
         buildpseudo="0"
     fi
@@ -96,7 +106,7 @@ if [ $buildpseudo = "1" ]; then
     if [ "$ret" != "0" ]; then
         exit 1
     fi
-    echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
+    echo $PSEUDOBINDIR > $PSEUDODONE
     # This needs to exist in case pseudo has to log somewhere
     mkdir -p $PSEUDOBINDIR/../../var/pseudo
 fi
@@ -104,7 +114,7 @@ BITBAKE=`which bitbake`
 export PATH=$OLDPATH
 if [ $needpseudo = "1" ]; then
     export PSEUDO_BUILD=2
-    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
+    PSEUDOBINDIR=`cat $PSEUDODONE`
     PSEUDO_BINDIR=$PSEUDOBINDIR PSEUDO_LIBDIR=$PSEUDOBINDIR/../lib/pseudo/lib PSEUDO_PREFIX=$PSEUDOBINDIR/../../ PSEUDO_DISABLED=1 $PSEUDOBINDIR/pseudo $BITBAKE $@
 else
     export PSEUDO_BUILD=0
-- 
1.7.5.4



