Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ACD4073F9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:19:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 25 Jun 2015 04:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,675,1427785200"; d="scan'208";a="514055715"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 04:19:31 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:20:02 +0300
Message-Id: <3c85b8693383b32c77c464b738fe4c707f8344b2.1435228589.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
References: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1435228589.git.jussi.kukkonen@intel.com>
References: <cover.1435228589.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] xorg-xserver: Upgrade 1.17.1 -> 1.17.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 11:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes CVE-2015-3164 in Xwayland.

Remove unnecessary patches:
 * fix_open_max_preprocessor_error.patch is no longer needed:
   OPEN_MAX is defined in every case now
 * xorg-CVE-2013-6424.patch was handled in pixman several releases ago
 * other removed patches are included in 1.17.2

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...Fix-error-check-for-pci_device_map_legacy.patch | 50 ----------------------
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch | 48 ---------------------
 .../fix_open_max_preprocessor_error.patch          | 15 -------
 .../xserver-xorg/xorg-CVE-2013-6424.patch          | 31 --------------
 .../xorg-xserver/xserver-xorg/xtrans.patch         | 38 ----------------
 ...erver-xorg_1.17.1.bb => xserver-xorg_1.17.2.bb} | 13 ++----
 6 files changed, 3 insertions(+), 192 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.1.bb => xserver-xorg_1.17.2.bb} (62%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
deleted file mode 100644
index 28b3218..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0a78b599b34cc8b5fe6fe82f90e90234e8ab7a56 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
-Date: Sat, 7 Feb 2015 18:13:21 +0100
-Subject: [PATCH] int10: Fix error check for pci_device_map_legacy
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-pci_device_map_legacy returns 0 on success.
-
-Upstream-status: backport 0a78b599b34cc8b5fe6fe82f90e90234e8ab7a56
-
-Signed-off-by: Jürg Billeter <j@bitron.ch>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- hw/xfree86/int10/generic.c                | 2 +-
- hw/xfree86/os-support/linux/int10/linux.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/xfree86/int10/generic.c b/hw/xfree86/int10/generic.c
-index 012d194..8d5c4da 100644
---- a/hw/xfree86/int10/generic.c
-+++ b/hw/xfree86/int10/generic.c
-@@ -104,7 +104,7 @@ readIntVec(struct pci_device *dev, unsigned char *buf, int len)
- {
-     void *map;
- 
--    if (!pci_device_map_legacy(dev, 0, len, 0, &map))
-+    if (pci_device_map_legacy(dev, 0, len, 0, &map))
-         return FALSE;
- 
-     memcpy(buf, map, len);
-diff --git a/hw/xfree86/os-support/linux/int10/linux.c b/hw/xfree86/os-support/linux/int10/linux.c
-index 79b9a88..6ca118f 100644
---- a/hw/xfree86/os-support/linux/int10/linux.c
-+++ b/hw/xfree86/os-support/linux/int10/linux.c
-@@ -75,7 +75,7 @@ readLegacy(struct pci_device *dev, unsigned char *buf, int base, int len)
- {
-     void *map;
- 
--    if (!pci_device_map_legacy(dev, base, len, 0, &map))
-+    if (pci_device_map_legacy(dev, base, len, 0, &map))
-         return FALSE;
- 
-     memcpy(buf, map, len);
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
deleted file mode 100644
index 9c9f595..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 21b896939c5bb242f3aacc37baf12379e43254b6 Mon Sep 17 00:00:00 2001
-From: Egbert Eich <eich@freedesktop.org>
-Date: Tue, 3 Mar 2015 16:27:05 +0100
-Subject: symbols: Fix sdksyms.sh to cope with gcc5
-
-Gcc5 adds additional lines stating line numbers before and
-after __attribute__() which need to be skipped.
-
-Signed-off-by: Egbert Eich <eich@freedesktop.org>
-Tested-by: Daniel Stone <daniels@collabora.com>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
-index 2305073..05ac410 100755
---- a/hw/xfree86/sdksyms.sh
-+++ b/hw/xfree86/sdksyms.sh
-@@ -350,13 +350,25 @@ BEGIN {
-     if (sdk) {
- 	n = 3;
- 
-+        # skip line numbers GCC 5 adds before __attribute__
-+        while ($n == "" || $0 ~ /^# [0-9]+ "/) {
-+           getline;
-+           n = 1;
-+        }
-+
- 	# skip attribute, if any
- 	while ($n ~ /^(__attribute__|__global)/ ||
- 	    # skip modifiers, if any
- 	    $n ~ /^\*?(unsigned|const|volatile|struct|_X_EXPORT)$/ ||
- 	    # skip pointer
--	    $n ~ /^[a-zA-Z0-9_]*\*$/)
-+	    $n ~ /^[a-zA-Z0-9_]*\*$/) {
- 	    n++;
-+            # skip line numbers GCC 5 adds after __attribute__
-+            while ($n == "" || $0 ~ /^# [0-9]+ "/) {
-+               getline;
-+               n = 1;
-+            }
-+        }
- 
- 	# type specifier may not be set, as in
- 	#   extern _X_EXPORT unsigned name(...)
--- 
-cgit v0.10.2
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
deleted file mode 100644
index 2f62972..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/os/osdep.h
-===================================================================
---- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
-+++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
-@@ -92,7 +92,7 @@
-  * like sysconf(_SC_OPEN_MAX) is not supported.
-  */
- 
--#if OPEN_MAX <= 256
-+#if 0
- #define MAXSOCKS (OPEN_MAX - 1)
- #else
- #define MAXSOCKS 256
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
deleted file mode 100644
index 7c61530..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-This patch comes from:
-http://lists.x.org/archives/xorg-devel/2013-October/037996.html
-
-Upstream-Status: Backport
-
-Signed-off-by: Baogen shang <baogen.shang@windriver.com>
-diff -Naur xorg-server-1.14.0-orig/exa/exa_render.c xorg-server-1.14.0/exa/exa_render.c
---- xorg-server-1.14.0-orig/exa/exa_render.c	2014-02-27 14:32:38.000000000 +0800
-+++ xorg-server-1.14.0/exa/exa_render.c	2014-02-27 15:46:59.000000000 +0800
-@@ -1141,7 +1141,8 @@
- 
-         exaPrepareAccess(pPicture->pDrawable, EXA_PREPARE_DEST);
-         for (; ntrap; ntrap--, traps++)
--            (*ps->RasterizeTrapezoid) (pPicture, traps, -bounds.x1, -bounds.y1);
-+            if (xTrapezoidValid(traps))
-+                (*ps->RasterizeTrapezoid) (pPicture, traps, -bounds.x1, -bounds.y1);
-         exaFinishAccess(pPicture->pDrawable, EXA_PREPARE_DEST);
- 
-         xRel = bounds.x1 + xSrc - xDst;
-diff -Naur xorg-server-1.14.0-orig/render/picture.h xorg-server-1.14.0/render/picture.h
---- xorg-server-1.14.0-orig/render/picture.h	2014-02-27 14:32:26.000000000 +0800
-+++ xorg-server-1.14.0/render/picture.h	2014-02-27 15:48:13.000000000 +0800
-@@ -211,7 +211,7 @@
- /* whether 't' is a well defined not obviously empty trapezoid */
- #define xTrapezoidValid(t)  ((t)->left.p1.y != (t)->left.p2.y && \
- 			     (t)->right.p1.y != (t)->right.p2.y && \
--			     (int) ((t)->bottom - (t)->top) > 0)
-+			     ((t)->bottom > (t)->top))
- 
- /*
-  * Standard NTSC luminance conversions:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
deleted file mode 100644
index e6dba04..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Since _XSERVTransClose frees the connection pointer passed to it,
-remove that pointer from the array, so we don't try to double free it
-if we come back into CloseWellKnownConnections again.
-
-Should fix https://bugzilla.yoctoproject.org/show_bug.cgi?id=6665 in which
-the shutdown section of the main() loop called CloseWellKnownConnections()
-and then moved on to ddxGiveUp(), which failed to release the VT and thus
-called AbortServer(), which called CloseWellKnownConnections() again.
-
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
----
- os/connection.c |    9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/os/connection.c b/os/connection.c
-index ddfe50a..7ff44e1 100644
---- a/os/connection.c
-+++ b/os/connection.c
-@@ -513,8 +513,13 @@ CloseWellKnownConnections(void)
- {
-     int i;
-
--    for (i = 0; i < ListenTransCount; i++)
--        _XSERVTransClose(ListenTransConns[i]);
-+    for (i = 0; i < ListenTransCount; i++) {
-+        if (ListenTransConns[i] != NULL) {
-+            _XSERVTransClose(ListenTransConns[i]);
-+            ListenTransConns[i] = NULL;
-+        }
-+    }
-+    ListenTransCount = 0;
- }
-
- static void
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
similarity index 62%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
index edca51e..3039d30 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
@@ -1,16 +1,9 @@
 require xserver-xorg.inc
 
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch \
-            file://xorg-CVE-2013-6424.patch \
-            file://xtrans.patch \
-            file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
-	    file://0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch \
-	    file://0001-int10-Fix-error-check-for-pci_device_map_legacy.patch \
+SRC_URI += "file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
            "
-
-SRC_URI[md5sum] = "5986510d59e394a50126a8e2833e79d3"
-SRC_URI[sha256sum] = "2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab"
+SRC_URI[md5sum] = "397e405566651150490ff493e463f1ad"
+SRC_URI[sha256sum] = "f61120612728f2c5034671d0ca3e2273438c60aba93b3dda4a8aa40e6a257993"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


