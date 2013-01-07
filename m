Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsCIN-0002pX-9S
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:59:15 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BE967D22CD;
	Mon,  7 Jan 2013 13:44:06 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 13:44:01 +0100
Message-Id: <1357562642-4332-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] xserver-xorg: add AArch64 support
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
X-List-Received-Date: Mon, 07 Jan 2013 12:59:15 -0000

Launchpad bug: https://bugs.launchpad.net/linaro-aarch64/+bug/1092128

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../xorg-xserver/xserver-xorg-1.13.1/aarch64.patch | 64 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.13.1.bb            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
new file mode 100644
index 0000000..8a4f3e3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
@@ -0,0 +1,64 @@
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
+ hw/xfree86/os-support/linux/lnx_video.c |    4 ++--
+ include/servermd.h                      |    7 +++++++
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+--- xorg-server-1.13.1.orig/hw/xfree86/os-support/linux/lnx_video.c
++++ xorg-server-1.13.1/hw/xfree86/os-support/linux/lnx_video.c
+@@ -509,11 +509,11 @@ xf86EnableIO(void)
+             return FALSE;
+         }
+ #endif
+     }
+     close(fd);
+-#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__arm__) && !defined(__m32r__) && !defined(__nds32__)
++#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__s390__) && !defined(__arm__) && !defined(__m32r__) && !defined(__nds32__) && !defined(__aarch64__)
+     if (ioperm(0, 1024, 1) || iopl(3)) {
+         if (errno == ENODEV)
+             ErrorF("xf86EnableIOPorts: no I/O ports found\n");
+         else
+             FatalError("xf86EnableIOPorts: failed to set IOPL"
+@@ -538,11 +538,11 @@ xf86DisableIO(void)
+     if (!ExtendedEnabled)
+         return;
+ #if defined(__powerpc__)
+     munmap(ioBase, 0x20000);
+     ioBase = NULL;
+-#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__arm__) && !defined(__s390__) && !defined(__m32r__) && !defined(__nds32__)
++#elif !defined(__mc68000__) && !defined(__sparc__) && !defined(__mips__) && !defined(__sh__) && !defined(__hppa__) && !defined(__arm__) && !defined(__s390__) && !defined(__m32r__) && !defined(__nds32__) && !defined(__aarch64__)
+     iopl(0);
+     ioperm(0, 1024, 0);
+ #endif
+     ExtendedEnabled = FALSE;
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
index d6c63b9..50b3117 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
@@ -4,6 +4,7 @@ require xserver-xorg.inc
 SRC_URI += "file://crosscompile.patch \
             file://fix_open_max_preprocessor_error.patch \
             file://mips64-compiler.patch \
+            file://aarch64.patch \
            "
 
 SRC_URI[md5sum] = "a13d8876e3e804189392119638a07a1f"
-- 
1.8.0



