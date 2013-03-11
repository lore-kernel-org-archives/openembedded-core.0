Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UF5py-0004UY-RW
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 17:44:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 09:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,824,1355126400"; d="scan'208";a="300091462"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2013 09:27:51 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 18:27:41 +0200
Message-Id: <30a5af8d2c6dd9cb6dba8a519fc00d30be439bdd.1363018567.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363018567.git.laurentiu.palcu@intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1363018567.git.laurentiu.palcu@intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] xserver-xorg: upgrade to 1.14.0
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
X-List-Received-Date: Mon, 11 Mar 2013 16:44:38 -0000

Aditionally:
 * adjust the aarch64.patch because the logic changed and the
   lnx_video.c changes are no longer necessary;
 * created patch to fix compilation issue when not using xinerama;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-xserver/xserver-xorg-1.13.1/aarch64.patch |   64 --------------------
 .../xorg-xserver/xserver-xorg-1.14.0/aarch64.patch |   35 +++++++++++
 .../crosscompile.patch                             |    0
 .../fix_compilation_when_not_using_xinerama.patch  |   21 +++++++
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 .../mips64-compiler.patch                          |    0
 ...erver-xorg_1.13.1.bb => xserver-xorg_1.14.0.bb} |    5 +-
 8 files changed, 59 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/crosscompile.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/mips64-compiler.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.13.1.bb => xserver-xorg_1.14.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
deleted file mode 100644
index 8a4f3e3..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Subject: Add AArch64 support to xserver-xorg
-Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-lnx_video.c parts are not existing in 1.14 branch.
-
-Xserver was checked in AArch64 fastmodel (commercial one with graphics support).
-
-http://patchwork.freedesktop.org/patch/12785/
-
-Upstream-status: Pending
-
----
- hw/xfree86/os-support/linux/lnx_video.c |    4 ++--
- include/servermd.h                      |    7 +++++++
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
---- xorg-server-1.13.1.orig/hw/xfree86/os-support/linux/lnx_video.c
-+++ xorg-server-1.13.1/hw/xfree86/os-support/linux/lnx_video.c
-@@ -509,11 +509,11 @@ xf86EnableIO(void)
-             return FALSE;
-         }
- #endif
-     }
-     close(fd);
--#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__arm__) && !defined(__m32r__) && !defined(__nds32__)
-+#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__arm__) && !defined(__m32r__) && !defined(__nds32__) && !defined(__aarch64__)
-     if (ioperm(0, 1024, 1) || iopl(3)) {
-         if (errno == ENODEV)
-             ErrorF("xf86EnableIOPorts: no I/O ports found\n");
-         else
-             FatalError("xf86EnableIOPorts: failed to set IOPL"
-@@ -538,11 +538,11 @@ xf86DisableIO(void)
-     if (!ExtendedEnabled)
-         return;
- #if defined(__powerpc__)
-     munmap(ioBase, 0x20000);
-     ioBase = NULL;
--#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__arm__) && !defined(__s390__) && !defined(__m32r__) && !defined(__nds32__)
-+#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__arm__) && !defined(__s390__) && !defined(__m32r__) && !defined(__nds32__) && !defined(__aarch64__)
-     iopl(0);
-     ioperm(0, 1024, 0);
- #endif
-     ExtendedEnabled = FALSE;
- 
---- xorg-server-1.13.1.orig/include/servermd.h
-+++ xorg-server-1.13.1/include/servermd.h
-@@ -243,10 +243,17 @@ SOFTWARE.
- #define BITMAP_BIT_ORDER       LSBFirst
- #define GLYPHPADBYTES		4
- /* ???? */
- #endif                          /* AMD64 */
- 
-+#if defined(__aarch64__) || defined(aarch64) || defined(__aarch64)
-+#define IMAGE_BYTE_ORDER	MSBFirst
-+#define BITMAP_BIT_ORDER       MSBFirst
-+#define GLYPHPADBYTES		4
-+/* ???? */
-+#endif                          /* AArch64 */
-+
- #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
- 	defined(__alpha__) || defined(__alpha) || \
- 	defined(__i386__) || \
- 	defined(__s390x__) || defined(__s390__)
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
new file mode 100644
index 0000000..7882ebe
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
@@ -0,0 +1,35 @@
+Subject: Add AArch64 support to xserver-xorg
+Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+lnx_video.c parts are not existing in 1.14 branch.
+
+Xserver was checked in AArch64 fastmodel (commercial one with graphics support).
+
+http://patchwork.freedesktop.org/patch/12785/
+
+Upstream-status: Pending
+
+---
+ include/servermd.h                      |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+--- xorg-server-1.13.1.orig/include/servermd.h
++++ xorg-server-1.13.1/include/servermd.h
+@@ -243,10 +243,17 @@ SOFTWARE.
+ #define BITMAP_BIT_ORDER       LSBFirst
+ #define GLYPHPADBYTES		4
+ /* ???? */
+ #endif                          /* AMD64 */
+ 
++#if defined(__aarch64__) || defined(aarch64) || defined(__aarch64)
++#define IMAGE_BYTE_ORDER	MSBFirst
++#define BITMAP_BIT_ORDER       MSBFirst
++#define GLYPHPADBYTES		4
++/* ???? */
++#endif                          /* AArch64 */
++
+ #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
+ 	defined(__alpha__) || defined(__alpha) || \
+ 	defined(__i386__) || \
+ 	defined(__s390x__) || defined(__s390__)
+ 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
new file mode 100644
index 0000000..f0c165d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Pending
+
+fix compilation when not using xinerama
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Index: xorg-server-1.14.0/xfixes/xfixesint.h
+===================================================================
+--- xorg-server-1.14.0.orig/xfixes/xfixesint.h	2012-07-10 09:06:41.000000000 +0300
++++ xorg-server-1.14.0/xfixes/xfixesint.h	2013-03-11 15:01:07.019098531 +0200
+@@ -291,8 +291,10 @@
+  SProcXFixesDestroyPointerBarrier(ClientPtr client);
+ 
+ /* Xinerama */
++#ifdef PANORAMIX
+ extern int (*PanoramiXSaveXFixesVector[XFixesNumberRequests]) (ClientPtr);
+ void PanoramiXFixesInit(void);
+ void PanoramiXFixesReset(void);
++#endif
+ 
+ #endif                          /* _XFIXESINT_H_ */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/macro_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/macro_tweak.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/mips64-compiler.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/mips64-compiler.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/mips64-compiler.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
index 50b3117..83b8049 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb
@@ -5,10 +5,11 @@ SRC_URI += "file://crosscompile.patch \
             file://fix_open_max_preprocessor_error.patch \
             file://mips64-compiler.patch \
             file://aarch64.patch \
+            file://fix_compilation_when_not_using_xinerama.patch \
            "
 
-SRC_URI[md5sum] = "a13d8876e3e804189392119638a07a1f"
-SRC_URI[sha256sum] = "c93540e2799df4655c6f1b67dc7d8d6db96df4f08ef1702fffbc5df843a43d00"
+SRC_URI[md5sum] = "86110278b784e279381b7f6f2295c508"
+SRC_URI[sha256sum] = "1f5107573252c26439fdd165481765a2c0964e02a2e9fab36e02414d08f30630"
 
 PR = "${INC_PR}.0"
 
-- 
1.7.9.5



