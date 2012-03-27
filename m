Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCV3W-00045s-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 13:59:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2012 04:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146197003"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.228])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 04:50:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 12:50:09 +0100
Message-Id: <0b6dadd78b527731df18b8fa308d714b6d3ef956.1332848153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] scripts/bitbake: allow switching between build directories
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
X-List-Received-Date: Tue, 27 Mar 2012 11:59:19 -0000

The recent addition of the check to ensure the user was in their build
directory disabled the ability to switch between build directories
without re-running the build environment setup script. We can rely
upon checking for conf/bblayers.conf instead, so use this check.

This does allow BUILDDIR (which is normally set by the environment
script) to be unset; however if it is set then it is assumed to be the
correct build directory and will be used in the error message that is
shown when we can't find conf/bblayers.conf.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 1ba1839..f02e89b 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -37,6 +37,16 @@ if [ "$py_v26_check" != "True" ]; then
 	exit 1
 fi
 
+if [ ! -e conf/bblayers.conf ] ; then
+    BDPRINT=""
+    [ -n "$BUILDDIR" ] && BDPRINT=": $BUILDDIR"
+    echo "Unable to find conf/bblayers.conf"
+    echo "BitBake must be run from within your build directory$BDPRINT"
+    exit 1
+elif [ -z "$BUILDDIR" ] ; then
+    BUILDDIR="`pwd`"
+fi
+
 needtar="1"
 TARVERSION=`tar --version | head -n 1 | cut -d ' ' -f 4`
 float_test() {
@@ -47,11 +57,6 @@ float_test() {
 # but earlier versions do not
 float_test "$TARVERSION > 1.23" && needtar="0"
 
-if [ "`pwd`" != "$BUILDDIR" ] ; then
-    echo "BitBake must be run from your build directory: $BUILDDIR"
-    exit 1
-fi
-
 buildpseudo="1"
 if [ $needpseudo = "1" ]; then
     if [ -e "$BUILDDIR/pseudodone" ]; then
-- 
1.7.5.4



