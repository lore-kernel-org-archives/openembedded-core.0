Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8w8z-0008QS-MK
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 17:33:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2011 08:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56793350"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.159])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2011 08:28:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 16:28:26 +0100
Message-Id: <463178b156299b46831b8641c7e7119b85501f8a.1317223487.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317223487.git.paul.eggleton@linux.intel.com>
References: <cover.1317223487.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317223487.git.paul.eggleton@linux.intel.com>
References: <cover.1317223487.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/oe-setup-rpmrepo: use setup_tmpdir from runqemu
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
X-List-Received-Date: Wed, 28 Sep 2011 15:33:57 -0000

Update the internal copy of setup_tmpdir in the oe-setup-rpmrepo script
to be the same as the one in the runqemu script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-setup-rpmrepo |   27 ++++++++++++++-------------
 1 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
index fc2f7a8..ea885f6 100755
--- a/scripts/oe-setup-rpmrepo
+++ b/scripts/oe-setup-rpmrepo
@@ -35,19 +35,20 @@ fi
 
 setup_tmpdir() {
     if [ -z "$TMPDIR" ]; then
-        if [ "x$BUILDDIR" = "x" -o ! -d "$BUILDDIR/tmp" ]; then
-            # BUILDDIR unset, try and get TMPDIR from bitbake
-            type -P bitbake &>/dev/null || {
-                echo "In order for this script to dynamically infer paths";
-                echo "to kernels or filesystem images, you either need";
-                echo "bitbake in your PATH or to source oe-init-build-env";
-                echo "before running this script" >&2;
-                exit 1; }
-
-            # We have bitbake in PATH, get TMPDIR from bitbake
-            TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
-        else
-            TMPDIR=$BUILDDIR/tmp
+        # Try to get TMPDIR from bitbake
+        type -P bitbake &>/dev/null || {
+            echo "In order for this script to dynamically infer paths";
+            echo "to kernels or filesystem images, you either need";
+            echo "bitbake in your PATH or to source oe-init-build-env";
+            echo "before running this script" >&2;
+            exit 1; }
+
+        # We have bitbake in PATH, get TMPDIR from bitbake
+        TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        if [ -z "$TMPDIR" ]; then
+            echo "Error: this script needs to be run from your build directory,"
+            echo "or you need to explicitly set TMPDIR in your environment"
+            exit 1
         fi
     fi
 }
-- 
1.7.4.1



