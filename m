Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QWAxN-0007NA-4S
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 19:29:45 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Mon, 13 Jun 2011
	19:26:20 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jun 2011 19:26:16 +0200
Message-ID: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Mon, 13 Jun 2011 17:29:45 -0000
Content-Type: text/plain

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
1.7.4.1



