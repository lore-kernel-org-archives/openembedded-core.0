Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCV3V-00045s-Tn
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 13:59:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2012 04:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146196994"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.228])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 04:50:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 12:50:08 +0100
Message-Id: <4a226262b48b8f0c56019183604b70c0f565d5f2.1332848153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] scripts/bitbake: try harder to check if pseudo exists
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
X-List-Received-Date: Tue, 27 Mar 2012 11:59:18 -0000

If pseudodone doesn't exist, we can get STAGING_BINDIR_NATIVE by calling
bitbake -e and use that as the path to check for pseudo before we give
up and try to build it explicitly first.

This is useful for people who share TMPDIR between multiple build
directories.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 45c8697..1ba1839 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -53,14 +53,21 @@ if [ "`pwd`" != "$BUILDDIR" ] ; then
 fi
 
 buildpseudo="1"
-if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
-    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
+if [ $needpseudo = "1" ]; then
+    if [ -e "$BUILDDIR/pseudodone" ]; then
+        PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
+    else
+        PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
+    fi
     if [ -e "$PSEUDOBINDIR/pseudo" -a -e "$PSEUDOBINDIR/tar" -a "$needtar" = "1" ]; then
         buildpseudo="0"
     fi
     if [ -e "$PSEUDOBINDIR/pseudo" -a $needtar = "0" ]; then
         buildpseudo="0"
     fi
+    if [ $buildpseudo = "0" -a ! -e "$BUILDDIR/pseudodone" ] ; then
+        echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
+    fi
 fi
 if [ $needpseudo = "0" ]; then
     buildpseudo="0"
@@ -104,7 +111,6 @@ BITBAKE=`which bitbake`
 export PATH=$OLDPATH
 if [ $needpseudo = "1" ]; then
     export PSEUDO_BUILD=2
-    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
     PSEUDO_BINDIR=$PSEUDOBINDIR PSEUDO_LIBDIR=$PSEUDOBINDIR/../lib/pseudo/lib PSEUDO_PREFIX=$PSEUDOBINDIR/../../ PSEUDO_DISABLED=1 $PSEUDOBINDIR/pseudo $BITBAKE $@
 else
     export PSEUDO_BUILD=0
-- 
1.7.5.4



