Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStgy-00033L-5E
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:31:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 10:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99043275"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:21:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 10:21:47 -0700
Message-Id: <1a9bce1db3c1612f70ab868d7886808a79b915e1.1336756650.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336756650.git.sgw@linux.intel.com>
References: <cover.1336756650.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336756650.git.sgw@linux.intel.com>
References: <cover.1336756650.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/4] xserver-xorg: Fix build on powerpc
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
X-List-Received-Date: Fri, 11 May 2012 17:31:48 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +++--
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++++++++++++++++
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index f5fa629..6a86af4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -1,10 +1,11 @@
-SRC_URI += "file://crosscompile.patch"
-
 # Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch"
+SRC_URI += "file://crosscompile.patch \
+            file://fix_open_max_preprocessor_error.patch \
+            file://gcc-47-warning.patch \
+           "
 
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r1"
+PR = "r2"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
new file mode 100644
index 0000000..ed4eaac
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
@@ -0,0 +1,33 @@
+This patch fixes errors on powerpc like below
+
+| lnx_video.c: In function 'unmapVidMem':
+| lnx_video.c:472:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+
+Its in 1.12 branch 
+
+http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.12-branch&id=eb3377ffb8a7baa26c9831e56ed782d48b28fa71
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
+===================================================================
+--- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:32:34.186489019 -0700
++++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:49:14.926537452 -0700
+@@ -469,11 +469,11 @@
+ static void
+ unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
+ {
+-    memType alignOff = (memType)Base 
+-	- ((memType)Base & ~(getpagesize() - 1));
++    uintptr_t alignOff = (uintptr_t)Base 
++	- ((uintptr_t)Base & ~(getpagesize() - 1));
+ 
+-    DebugF("alignment offset: %lx\n",alignOff);
+-    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
++    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
++    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
+ }
+ 
+ 
-- 
1.7.7.6



