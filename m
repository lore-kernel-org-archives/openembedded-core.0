Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOdC-0001Vu-9s
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jun 2011 01:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14284030"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:59 -0700
Message-Id: <d12c98a8e22959e337c4950121073ec8e0d1dbb7.1308037754.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 51/51] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:51 -0000

From: Anders Darander <anders@chargestorm.se>

The old standard of using /home/anders/openembedded-core/build/tmp as TMPDIR do not work any longer,
as - is appended to the real TMPDIR. Thus, always take TMPDIR from
bitbake, unless TMPDIR is set in the environment.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 scripts/runqemu |   22 +++++++++-------------
 1 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a09362c..aa44070 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -262,20 +262,16 @@ SPITZ_DEFAULT_ROOTFS="core-image-sato"
 
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
-        fi
+        # BUILDDIR unset, try and get TMPDIR from bitbake
+        type -P bitbake &>/dev/null || {
+            echo "In order for this script to dynamically infer paths";
+            echo "to kernels or filesystem images, you either need";
+            echo "bitbake in your PATH or to source oe-init-build-env";
+            echo "before running this script" >&2;
+            exit 1; }
+
+        # We have bitbake in PATH, get TMPDIR from bitbake
+        TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
     fi
 }
 
-- 
1.7.3.4



