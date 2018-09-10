Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0337F79709
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 02:33:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8A2XXRg015878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Sep 2018 19:33:33 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 9 Sep 2018 19:33:26 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Sep 2018 10:33:25 +0800
Message-ID: <1536546805-365650-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libx11: Upgrade 1.6.5 ->1.6.6
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
X-List-Received-Date: Mon, 10 Sep 2018 02:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{libx11-diet_1.6.5.bb => libx11-diet_1.6.6.bb} |   8 +-
 .../{X18NCMSstubs.diff => X18NCMSstubs.patch}      | 159 +++++++++++----------
 .../xorg-lib/libx11/fix-disable-xlocale.diff       |  17 ---
 .../xorg-lib/libx11/fix-disable-xlocale.patch      |  32 +++++
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |  29 ++--
 .../xorg-lib/{libx11_1.6.5.bb => libx11_1.6.6.bb}  |   4 +-
 6 files changed, 145 insertions(+), 104 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.5.bb => libx11-diet_1.6.6.bb} (56%)
 rename meta/recipes-graphics/xorg-lib/libx11/{X18NCMSstubs.diff => X18NCMSstubs.patch} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.5.bb => libx11_1.6.6.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.6.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.5.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.6.bb
index 295f96a2..a4ba4e5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.6.bb
@@ -3,16 +3,16 @@ require libx11.inc
 DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
-SRC_URI += "file://X18NCMSstubs.diff \
-            file://fix-disable-xlocale.diff \
+SRC_URI += "file://X18NCMSstubs.patch \
+            file://fix-disable-xlocale.patch \
             file://fix-utf8-wrong-define.patch \
            "
 
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
-SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
+SRC_URI[md5sum] = "6b0f83e851b3b469dd660f3a95ac3e42"
+SRC_URI[sha256sum] = "65fe181d40ec77f45417710c6a67431814ab252d21c2e85c75dd1ed568af414f"
 
 EXTRA_OECONF += "--disable-xlocale"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
rename to meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
index 744cedc..4ca2f42 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
@@ -1,52 +1,49 @@
-Upstream-Status: Pending
+From 62005ad019d6afb81da100b3113292a16472d241 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 10 Sep 2018 09:08:27 +0800
+Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
 
-Upstream-Status: Inappropriate [configuration]
-Index: libX11-1.3/src/imConv.c
-===================================================================
---- libX11-1.3.orig/src/imConv.c
-+++ libX11-1.3/src/imConv.c
-@@ -83,6 +83,7 @@ static const struct SubstRec SubstTable[
-  * from UCS char to specified charset char.
-  * This converter is needed for _XimGetCharCode subroutine.
-  */
-+#ifdef XLOCALE
- XPointer
- _XimGetLocaleCode (
-     _Xconst char*	encoding_name)
-@@ -96,6 +97,7 @@ _XimGetLocaleCode (
-     }
-     return cvt;
- }
-+#endif
+Update patch to version 1.6.6
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/Makefile.am    |   5 +-
+ src/X18NCMSstubs.c | 426 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/imConv.c       |   5 +-
+ src/locking.c      |   4 +
+ 4 files changed, 438 insertions(+), 2 deletions(-)
+ create mode 100644 src/X18NCMSstubs.c
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f8c476d..cdbcbbd 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -336,13 +336,16 @@ if THRSTUBS
+ libX11_la_SOURCES+=UIThrStubs.c
+ endif
  
- /*
-  * Returns the locale dependent representation of a keysym.
-@@ -106,6 +108,7 @@ _XimGetLocaleCode (
-  * terminating NUL byte. Return 0 if the keysym is not representable in the
-  * locale
-  */
-+#ifdef XLOCALE
- /*ARGSUSED*/
- int
- _XimGetCharCode (
-@@ -135,6 +138,7 @@ _XimGetCharCode (
-         buf[count]= '\0';
-     return count;
- }
-+#endif
++libX11_la_SOURCES+=X18NCMSstubs.c
++
+ x11datadir = @X11_DATADIR@
+ x11data_DATA = XErrorDB
  
- #ifdef XKB
- static int lookup_string(
-Index: libX11-1.3/src/X18NCMSstubs.c
-===================================================================
+ EXTRA_DIST = \
+ 	$(x11data_DATA) \
+ 	os2Stubs.c \
+-	UIThrStubs.c 
++	UIThrStubs.c \
++	X18NCMSstubs.c
+ 
+ libX11_xcb_la_SOURCES = x11_xcb.c Xxcbint.h
+ libX11_xcb_la_LDFLAGS = -version-number 1:0:0 -no-undefined
+diff --git a/src/X18NCMSstubs.c b/src/X18NCMSstubs.c
+new file mode 100644
+index 0000000..429cb31
 --- /dev/null
-+++ libX11-1.3/src/X18NCMSstubs.c
-@@ -0,0 +1,428 @@
-+/*
-+ * X18NCMSstubs.c
-+ * - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
++++ b/src/X18NCMSstubs.c
+@@ -0,0 +1,426 @@
++ /* - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
 + *
-+ * Copyright © 2003 Matthew Allum
++ * Copyright Â© 2003 Matthew Allum
 + *
 + * Permission to use, copy, modify, distribute, and sell this software and its
 + * documentation for any purpose is hereby granted without fee, provided that
@@ -470,33 +467,48 @@ Index: libX11-1.3/src/X18NCMSstubs.c
 +}
 +
 +#endif
-Index: libX11-1.3/src/Makefile.am
-===================================================================
---- libX11-1.3.orig/src/Makefile.am
-+++ libX11-1.3/src/Makefile.am
-@@ -335,6 +335,8 @@ if THRSTUBS
- libX11_la_SOURCES+=UIThrStubs.c
- endif
- 
-+libX11_la_SOURCES+=X18NCMSstubs.c
-+
- x11datadir = @X11_DATADIR@
- x11data_DATA = XKeysymDB XErrorDB
- 
-@@ -342,6 +344,7 @@ EXTRA_DIST = \
- 	$(x11data_DATA) \
- 	os2Stubs.c \
--	UIThrStubs.c 
-+	UIThrStubs.c \
-+	X18NCMSstubs.c
- 
- if XCB
- libX11_la_SOURCES += \
-Index: libX11-1.3/src/locking.c
-===================================================================
---- libX11-1.3.orig/src/locking.c
-+++ libX11-1.3/src/locking.c
-@@ -66,7 +66,9 @@ in this Software without prior written a
+diff --git a/src/imConv.c b/src/imConv.c
+index c3c1974..04ecc81 100644
+--- a/src/imConv.c
++++ b/src/imConv.c
+@@ -80,6 +80,7 @@ static const struct SubstRec SubstTable[] = {
+  * from UCS char to specified charset char.
+  * This converter is needed for _XimGetCharCode subroutine.
+  */
++#ifdef XLOCALE
+ XPointer
+ _XimGetLocaleCode (
+     _Xconst char*	encoding_name)
+@@ -93,7 +94,7 @@ _XimGetLocaleCode (
+     }
+     return cvt;
+ }
+-
++#endif
+ /*
+  * Returns the locale dependent representation of a keysym.
+  * The locale's encoding is passed in form of pointer to UCS convertor.
+@@ -105,6 +105,7 @@ _XimGetLocaleCode (
+  * locale
+  */
+ /*ARGSUSED*/
++#ifdef XLOCALE
+ int
+ _XimGetCharCode (
+     XPointer            ucs_conv,
+@@ -133,6 +134,7 @@ _XimGetCharCode (
+         buf[count]= '\0';
+     return count;
+ }
++#endif
+
+ #ifdef XKB
+ static int lookup_string(
+diff --git a/src/locking.c b/src/locking.c
+index 9f4fe06..e6967ee 100644
+--- a/src/locking.c
++++ b/src/locking.c
+@@ -65,7 +65,9 @@ in this Software without prior written authorization from The Open Group.
  #define NUM_FREE_CVLS 4
  
  /* in lcWrap.c */
@@ -506,7 +518,7 @@ Index: libX11-1.3/src/locking.c
  
  #ifdef WIN32
  static DWORD _X_TlsIndex = (DWORD)-1;
-@@ -594,9 +596,11 @@ Status XInitThreads(void)
+@@ -597,9 +599,11 @@ Status XInitThreads(void)
      _Xglobal_lock = &global_lock;
      xmutex_init(_Xglobal_lock->lock);
      xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
@@ -518,3 +530,6 @@ Index: libX11-1.3/src/locking.c
      _XLockMutex_fn = _XLockMutex;
      _XUnlockMutex_fn = _XUnlockMutex;
      _XCreateMutex_fn = _XCreateMutex;
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
deleted file mode 100644
index a7c3984..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
-@@ -701,7 +701,11 @@
-     }
-     if (l - 2 - (p - charset) < 0)
- 	return 0;
-+#ifdef XLOCALE
-     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
-+#else
-+    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
-+#endif
- 	return 0;
-     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
- 	return 0;
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
new file mode 100644
index 0000000..3677fb1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
@@ -0,0 +1,32 @@
+From 5c1693028ef12ab767d7cdbc349c27efa1ada87a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 10 Sep 2018 09:13:38 +0800
+Subject: [PATCH] Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+Update patch to version 1.6.6
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/Font.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/Font.c b/src/Font.c
+index a73f9b1..8f4d210 100644
+--- a/src/Font.c
++++ b/src/Font.c
+@@ -675,7 +675,11 @@ int _XF86LoadQueryLocaleFont(
+     }
+     if (l - 2 - (p - charset) < 0)
+ 	return 0;
++#ifdef XLOCALE
+     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
++#else
++    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
++#endif
+ 	return 0;
+     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
+ 	return 0;
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
index c6347f5..1a3069a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
@@ -1,19 +1,30 @@
-Upstream-Status: Pending
+From 046703373055c7029c19d171e415ff3caaa87372 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 10 Sep 2018 09:16:33 +0800
+Subject: [PATCH] Upstream-Status: Pending
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
+Update patch to version 1.6.6
 
---- libX11-X11R7.0-1.0.0/include/X11/Xlib.h~fix-utf8-wrong-define
-+++ libX11-X11R7.0-1.0.0/include/X11/Xlib.h
-@@ -103,7 +103,7 @@
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ include/X11/Xlib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/X11/Xlib.h b/include/X11/Xlib.h
+index 84403f7..56be654 100644
+--- a/include/X11/Xlib.h
++++ b/include/X11/Xlib.h
+@@ -67,7 +67,7 @@ _Xmblen(
  
  /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
     November 2000. Its presence is indicated through the following macro. */
 -#define X_HAVE_UTF8_STRING 1
 +#undef X_HAVE_UTF8_STRING
  
- typedef char *XPointer;
- 
+ /* The Xlib structs are full of implicit padding to properly align members.
+    We can't clean that up without breaking ABI, so tell clang not to bother
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.6.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.6.bb
index 427bf28..0fee1a9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.6.bb
@@ -10,5 +10,5 @@ do_configure_append () {
     sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
 }
 
-SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
-SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
+SRC_URI[md5sum] = "6b0f83e851b3b469dd660f3a95ac3e42"
+SRC_URI[sha256sum] = "65fe181d40ec77f45417710c6a67431814ab252d21c2e85c75dd1ed568af414f"
-- 
2.7.4


