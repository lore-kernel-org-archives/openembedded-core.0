Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd2-0001K5-Qx
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283931"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:31 -0700
Message-Id: <c61647c85f552777e1b53df44cb83c4e6fd9157a.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/51] libx11-diet: Fixed checksum and rebase patch
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |   14 +++--
 .../xorg-lib/libx11/X18NCMSstubs.diff              |   62 +++++++++++--------
 2 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
index fee44ae..a4929d2 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -3,13 +3,15 @@ require libx11.inc
 DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
 this version."
 
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=597df7e9217e89ccaeb749f48ce2aeb0"
 
-SRC_URI += "file://x11_disable_makekeys.patch;patch=1 \
-            file://include_fix.patch;patch=1 \
-            file://X18NCMSstubs.diff;patch=1 \
-            file://fix-disable-xlocale.diff;patch=1 \
-            file://fix-utf8-wrong-define.patch;patch=1"
+PR = "r2"
+
+SRC_URI += "file://x11_disable_makekeys.patch \
+            file://include_fix.patch \
+            file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
index 2e86a48..91ab180 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
@@ -1,8 +1,10 @@
 Upstream-Status: Pending
 
---- libX11-X11R7.0-1.0.0/src/imConv.c.orig	2006-03-08 09:46:03.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/imConv.c	2006-03-08 10:50:10.000000000 +0100
-@@ -83,6 +83,7 @@
+Index: libX11-1.3/src/imConv.c
+===================================================================
+--- libX11-1.3.orig/src/imConv.c
++++ libX11-1.3/src/imConv.c
+@@ -83,6 +83,7 @@ static const struct SubstRec SubstTable[
   * from UCS char to specified charset char.
   * This converter is needed for _XimGetCharCode subroutine.
   */
@@ -10,7 +12,7 @@ Upstream-Status: Pending
  XPointer
  _XimGetLocaleCode (
      _Xconst char*	encoding_name)
-@@ -96,6 +97,7 @@
+@@ -96,6 +97,7 @@ _XimGetLocaleCode (
      }
      return cvt;
  }
@@ -18,15 +20,15 @@ Upstream-Status: Pending
  
  /*
   * Returns the locale dependent representation of a keysym.
-@@ -107,6 +109,7 @@
+@@ -106,6 +108,7 @@ _XimGetLocaleCode (
+  * terminating NUL byte. Return 0 if the keysym is not representable in the
   * locale
   */
- /*ARGSUSED*/
 +#ifdef XLOCALE
- int 
+ /*ARGSUSED*/
+ int
  _XimGetCharCode (
-     XPointer            ucs_conv,
-@@ -135,6 +138,7 @@
+@@ -135,6 +138,7 @@ _XimGetCharCode (
          buf[count]= '\0';
      return count;
  }
@@ -34,8 +36,10 @@ Upstream-Status: Pending
  
  #ifdef XKB
  static int lookup_string(
---- libX11-X11R7.0-1.0.0/src/X18NCMSstubs.c.orig	2006-03-08 08:43:19.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/X18NCMSstubs.c	2006-03-08 11:41:28.000000000 +0100
+Index: libX11-1.3/src/X18NCMSstubs.c
+===================================================================
+--- /dev/null
++++ libX11-1.3/src/X18NCMSstubs.c
 @@ -0,0 +1,428 @@
 +/*
 + * X18NCMSstubs.c
@@ -465,9 +469,11 @@ Upstream-Status: Pending
 +}
 +
 +#endif
---- libX11-X11R7.0-1.0.0/src/Makefile.am.orig	2006-03-08 08:31:09.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/Makefile.am	2006-03-08 09:36:23.000000000 +0100
-@@ -331,6 +331,8 @@
+Index: libX11-1.3/src/Makefile.am
+===================================================================
+--- libX11-1.3.orig/src/Makefile.am
++++ libX11-1.3/src/Makefile.am
+@@ -335,6 +335,8 @@ if THRSTUBS
  libX11_la_SOURCES+=UIThrStubs.c
  endif
  
@@ -476,7 +482,7 @@ Upstream-Status: Pending
  x11datadir = @X11_DATADIR@
  x11data_DATA = XKeysymDB XErrorDB
  
-@@ -338,7 +340,8 @@
+@@ -342,7 +344,8 @@ EXTRA_DIST = \
  	$(x11data_DATA) \
  	os2Stubs.c \
  	udcInf.c \
@@ -484,11 +490,13 @@ Upstream-Status: Pending
 +	UIThrStubs.c \
 +	X18NCMSstubs.c
  
- #
- # Figure out which sub-libraries to link into Xlib
---- libX11-X11R7.0-1.0.0/src/locking.c.orig	2006-03-08 11:05:56.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/locking.c	2006-03-08 11:06:37.000000000 +0100
-@@ -55,7 +55,9 @@
+ if XCB
+ libX11_la_SOURCES += \
+Index: libX11-1.3/src/locking.c
+===================================================================
+--- libX11-1.3.orig/src/locking.c
++++ libX11-1.3/src/locking.c
+@@ -66,7 +66,9 @@ in this Software without prior written a
  #define NUM_FREE_CVLS 4
  
  /* in lcWrap.c */
@@ -498,7 +506,7 @@ Upstream-Status: Pending
  
  #ifdef WIN32
  static DWORD _X_TlsIndex = (DWORD)-1;
-@@ -625,9 +627,11 @@
+@@ -594,9 +596,11 @@ Status XInitThreads(void)
      _Xglobal_lock = &global_lock;
      xmutex_init(_Xglobal_lock->lock);
      xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
@@ -510,10 +518,12 @@ Upstream-Status: Pending
      _XLockMutex_fn = _XLockMutex;
      _XUnlockMutex_fn = _XUnlockMutex;
      _XCreateMutex_fn = _XCreateMutex;
---- libX11-X11R7.0-1.0.0/configure.ac.orig	2006-03-08 10:03:57.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/configure.ac	2006-03-08 10:06:01.000000000 +0100
-@@ -215,7 +215,14 @@
- esac
+Index: libX11-1.3/configure.ac
+===================================================================
+--- libX11-1.3.orig/configure.ac
++++ libX11-1.3/configure.ac
+@@ -289,7 +289,14 @@ else
+ fi
  AC_SUBST(KEYSYMDEF)
  
 -AM_CONDITIONAL(UDC, test xfalse = xtrue)
@@ -526,5 +536,5 @@ Upstream-Status: Pending
 +	AC_DEFINE(UDC,1,[Include support for UDC])
 +fi
  
- AC_ARG_ENABLE(xcms, 
+ AC_ARG_ENABLE(xcms,
                AC_HELP_STRING([--disable-xcms],
-- 
1.7.3.4



