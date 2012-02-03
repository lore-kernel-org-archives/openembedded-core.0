Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RtL7R-0002mp-NH
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 16:32:09 +0100
Received: by wgbdr13 with SMTP id dr13so3599933wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 07:24:12 -0800 (PST)
Received: by 10.180.92.227 with SMTP id cp3mr12219593wib.13.1328282652310;
	Fri, 03 Feb 2012 07:24:12 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id t6sm7291602wid.1.2012.02.03.07.24.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 07:24:11 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 17:24:04 +0200
Message-Id: <1328282644-4459-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] js: Update to v1.8.5
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
X-List-Received-Date: Fri, 03 Feb 2012 15:32:09 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/js/files/buildcc.patch       |   22 ------
 meta/recipes-support/js/files/configure.ac        |   28 --------
 meta/recipes-support/js/files/jsautocfg.h         |   74 ---------------------
 meta/recipes-support/js/files/link_with_gcc.patch |   15 ----
 meta/recipes-support/js/files/usepic.patch        |   26 -------
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb      |   50 --------------
 meta/recipes-support/js/js_1.8.5-1.0.0.bb         |   45 +++++++++++++
 7 files changed, 45 insertions(+), 215 deletions(-)
 delete mode 100644 meta/recipes-support/js/files/buildcc.patch
 delete mode 100644 meta/recipes-support/js/files/configure.ac
 delete mode 100644 meta/recipes-support/js/files/jsautocfg.h
 delete mode 100644 meta/recipes-support/js/files/link_with_gcc.patch
 delete mode 100644 meta/recipes-support/js/files/usepic.patch
 delete mode 100644 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
 create mode 100644 meta/recipes-support/js/js_1.8.5-1.0.0.bb

diff --git a/meta/recipes-support/js/files/buildcc.patch b/meta/recipes-support/js/files/buildcc.patch
deleted file mode 100644
index 19daf72..0000000
--- a/meta/recipes-support/js/files/buildcc.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-jskwgen should be built by BUILD_CC in cross environment
-
-7/23/2010 - created by Qing He <qing.he@intel.com>
-
-diff -uNr js.orig//src/Makefile.ref js/src/Makefile.ref
---- js.orig//src/Makefile.ref	2009-02-25 21:24:29.000000000 +0800
-+++ js/src/Makefile.ref	2010-07-23 13:26:51.000000000 +0800
-@@ -303,10 +303,10 @@
- 
- $(OBJDIR)/jskwgen.o: jskwgen.c jskeyword.tbl
- 	@$(MAKE_OBJDIR)
--	$(CC) -o $@ -c $(CFLAGS) $<
-+	$(BUILD_CC) -o $@ -c $(BUILD_CFLAGS) $<
- 
- $(OBJDIR)/jskwgen$(HOST_BIN_SUFFIX): $(OBJDIR)/jskwgen.$(OBJ_SUFFIX)
--	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
-+	$(BUILD_CC) -o $@ $(BUILD_CFLAGS) $(BUILD_LDFLAGS) $^
- 
- endif
- 
diff --git a/meta/recipes-support/js/files/configure.ac b/meta/recipes-support/js/files/configure.ac
deleted file mode 100644
index 41af298..0000000
--- a/meta/recipes-support/js/files/configure.ac
+++ /dev/null
@@ -1,28 +0,0 @@
-AC_INIT
-
-AC_CHECK_SIZEOF([char])
-AC_CHECK_SIZEOF([short])
-AC_CHECK_SIZEOF([int])
-AC_CHECK_SIZEOF([int64_t])
-AC_CHECK_SIZEOF([long])
-AC_CHECK_SIZEOF([long long])
-AC_CHECK_SIZEOF([int *])
-AC_CHECK_SIZEOF([float])
-AC_CHECK_SIZEOF([double])
-
-AC_CHECK_ALIGNOF([char])
-AC_CHECK_ALIGNOF([short])
-AC_CHECK_ALIGNOF([int])
-AC_CHECK_ALIGNOF([int64_t])
-AC_CHECK_ALIGNOF([long])
-AC_CHECK_ALIGNOF([long long])
-AC_CHECK_ALIGNOF([int *])
-AC_CHECK_ALIGNOF([float])
-AC_CHECK_ALIGNOF([double])
-
-AC_C_BIGENDIAN
-
-AC_TYPE_LONG_LONG_INT
-
-AC_CONFIG_HEADER([conf.h])
-AC_OUTPUT
diff --git a/meta/recipes-support/js/files/jsautocfg.h b/meta/recipes-support/js/files/jsautocfg.h
deleted file mode 100644
index 295e491..0000000
--- a/meta/recipes-support/js/files/jsautocfg.h
+++ /dev/null
@@ -1,74 +0,0 @@
-#ifndef js_cpucfg___
-#define js_cpucfg___
-
-/* AUTOMATICALLY GENERATED - DO NOT EDIT */
-
-#include "conf.h"
-
-#ifdef WORDS_BIGENDIAN
-# undef  IS_LITTLE_ENDIAN
-# define IS_BIG_ENDIAN 1
-#else
-# define IS_LITTLE_ENDIAN 1
-# undef  IS_BIG_ENDIAN
-#endif
-
-#define __I_LOG2(n) (    \
-        ((n) == 1)?   0: \
-        ((n) == 2)?   1: \
-        ((n) == 4)?   2: \
-        ((n) == 8)?   3: \
-        ((n) == 16)?  4: \
-        ((n) == 32)?  5: \
-        ((n) == 64)?  6: \
-        ((n) == 128)? 7: \
-            -1)
-
-#define JS_BYTES_PER_BYTE   SIZEOF_CHAR
-#define JS_BYTES_PER_SHORT  SIZEOF_SHORT
-#define JS_BYTES_PER_INT    SIZEOF_INT
-#define JS_BYTES_PER_INT64  SIZEOF_INT64_T
-#define JS_BYTES_PER_LONG   SIZEOF_LONG
-#define JS_BYTES_PER_FLOAT  SIZEOF_FLOAT
-#define JS_BYTES_PER_DOUBLE SIZEOF_DOUBLE
-#define JS_BYTES_PER_WORD   SIZEOF_LONG
-#define JS_BYTES_PER_DWORD  SIZEOF_LONG_LONG
-
-#define JS_BITS_PER_BYTE    8L
-#define JS_BITS_PER_SHORT   (JS_BITS_PER_BYTE * JS_BYTES_PER_SHORT)
-#define JS_BITS_PER_INT     (JS_BITS_PER_BYTE * JS_BYTES_PER_INT)
-#define JS_BITS_PER_INT64   (JS_BITS_PER_BYTE * JS_BYTES_PER_INT64)
-#define JS_BITS_PER_LONG    (JS_BITS_PER_BYTE * JS_BYTES_PER_LONG)
-#define JS_BITS_PER_FLOAT   (JS_BITS_PER_BYTE * JS_BYTES_PER_GLOAT)
-#define JS_BITS_PER_DOUBLE  (JS_BITS_PER_BYTE * JS_BYTES_PER_DOUBLE)
-#define JS_BITS_PER_WORD    (JS_BITS_PER_BYTE * JS_BYTES_PER_WORD)
-
-#define JS_BITS_PER_BYTE_LOG2   __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_SHORT_LOG2  __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_INT_LOG2    __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_INT64_LOG2  __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_LONG_LOG2   __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_FLOAT_LOG2  __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_DOUBLE_LOG2 __I_LOG2(JS_BITS_PER_BYTE)
-#define JS_BITS_PER_WORD_LOG2   __I_LOG2(JS_BITS_PER_BYTE)
-
-#define JS_ALIGN_OF_SHORT   ALIGNOF_SHORT
-#define JS_ALIGN_OF_INT     ALIGNOF_INT
-#define JS_ALIGN_OF_LONG    ALIGNOF_LONG
-#define JS_ALIGN_OF_INT64   ALIGNOF_INT64_T
-#define JS_ALIGN_OF_FLOAT   ALIGNOF_FLOAT
-#define JS_ALIGN_OF_DOUBLE  ALIGNOF_DOUBLE
-#define JS_ALIGN_OF_POINTER ALIGNOF_INT_P
-#define JS_ALIGN_OF_WORD    ALIGNOF_LONG
-
-#define JS_BYTES_PER_WORD_LOG2   __I_LOG2(JS_BYTES_PER_WORD)
-#define JS_BYTES_PER_DWORD_LOG2  __I_LOG2(JS_BYTES_PER_DWORDS)
-#define JS_WORDS_PER_DWORD_LOG2  __I_LOG2(JS_BYTES_PER_DWORDS / JS_BYTES_PER_WORD)
-
-#define JS_STACK_GROWTH_DIRECTION (-1)
-
-#ifdef HAVE_LONG_LONG_INT
-# define JS_HAVE_LONG_LONG
-#endif
-
-#endif /* js_cpucfg___ */
diff --git a/meta/recipes-support/js/files/link_with_gcc.patch b/meta/recipes-support/js/files/link_with_gcc.patch
deleted file mode 100644
index 988df61..0000000
--- a/meta/recipes-support/js/files/link_with_gcc.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: src/config/Linux_All.mk
-===================================================================
---- src.orig/config/Linux_All.mk	2005-05-10 19:53:44.000000000 +0000
-+++ src/config/Linux_All.mk	2007-06-18 17:20:05.000000000 +0000
-@@ -47,7 +47,7 @@
- OS_CFLAGS = -DXP_UNIX -DSVR4 -DSYSV -D_BSD_SOURCE -DPOSIX_SOURCE -DHAVE_LOCALTIME_R
- 
- RANLIB = echo
--MKSHLIB = $(LD) -shared $(XMKSHLIBOPTS)
-+MKSHLIB = $(CC) -shared $(XMKSHLIBOPTS)
- 
- #.c.o:
- #      $(CC) -c -MD $*.d $(CFLAGS) $<
diff --git a/meta/recipes-support/js/files/usepic.patch b/meta/recipes-support/js/files/usepic.patch
deleted file mode 100644
index 91b0923..0000000
--- a/meta/recipes-support/js/files/usepic.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Mips needs -fPIC to compile properly. These tests are broken anyway as they test 
-the build system architecture, not the target. This is a hack.
-
-RP 10/6/2010
-
-Index: src/config/Linux_All.mk
-===================================================================
---- src.orig/config/Linux_All.mk	2010-06-10 22:09:43.000000000 +0100
-+++ src/config/Linux_All.mk	2010-06-10 22:09:55.000000000 +0100
-@@ -90,14 +90,10 @@
- # Use the editline library to provide line-editing support.
- JS_EDITLINE = 1
- 
--ifeq ($(CPU_ARCH),x86_64)
- # Use VA_COPY() standard macro on x86-64
- # FIXME: better use it everywhere
- OS_CFLAGS += -DHAVE_VA_COPY -DVA_COPY=va_copy
--endif
- 
--ifeq ($(CPU_ARCH),x86_64)
- # We need PIC code for shared libraries
- # FIXME: better patch rules.mk & fdlibm/Makefile*
- OS_CFLAGS += -DPIC -fPIC
--endif
diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
deleted file mode 100644
index adca44e..0000000
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "Spidermonkey: a javascript engine written in C"
-HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
-SECTION = "libs"
-
-# the package is licensed under either of the following
-LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
-PR = "r3"
-
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
-           file://link_with_gcc.patch \
-           file://usepic.patch \
-           file://buildcc.patch;striplevel=2 \
-           file://jsautocfg.h \
-           file://configure.ac"
-
-SRC_URI[md5sum] = "eaad8815dcc66a717ddb87e9724d964e"
-SRC_URI[sha256sum] = "374398699ac3fd802d98d642486cf6b0edc082a119c9c9c499945a0bc73e3413"
-
-S = "${WORKDIR}/js/src"
-
-# use local autoconf script to generate a usable jsautocfg.h
-# don't bother with automake
-inherit autotools
-
-do_configure_prepend() {
-	cp -f ${WORKDIR}/configure.ac ${S}
-	cp -f ${WORKDIR}/jsautocfg.h ${S}
-}
-
-EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'XCFLAGS=${CFLAGS}' 'XLDFLAGS=${LDFLAGS} -Wl,-soname=libjs' \
-                'BUILD_CC=${BUILD_CC}' 'BUILD_CFLAGS=${BUILD_CFLAGS}' 'BUILD_LDFLAGS=${BUILD_LDFLAGS}'"
-
-PARALLEL_MAKE = ""
-
-do_compile() {
-	oe_runmake -f Makefile.ref JS_EDITLINE=1 PREBUILT_CPUCFG=1 BUILD_OPT=1
-}
-
-do_install() {
-	install -d ${D}${libdir}
-	install -d ${D}${includedir}
-	install -d ${D}${includedir}/js
-	oe_libinstall -so -C Linux_All_OPT.OBJ libjs ${D}${libdir}
-	install -m 0644 ${S}/*.h ${D}${includedir}/js
-	install -m 0644 ${S}/jsproto.tbl ${D}${includedir}/js
-}
-
-FILES_${PN} = "${libdir}/lib*.so"
-
diff --git a/meta/recipes-support/js/js_1.8.5-1.0.0.bb b/meta/recipes-support/js/js_1.8.5-1.0.0.bb
new file mode 100644
index 0000000..033a79e
--- /dev/null
+++ b/meta/recipes-support/js/js_1.8.5-1.0.0.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Spidermonkey: a javascript engine written in C"
+HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
+SECTION = "libs"
+
+# the package is licensed under either of the following
+LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://jsapi.cpp;beginline=4;endline=35;md5=d26d5cdc168368b8af90a541dd6ffd8b"
+PR = "r0"
+
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz   \
+	    "
+
+SRC_URI[md5sum] = "a4574365938222adca0a6bd33329cb32"
+SRC_URI[sha256sum] = "5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687"
+
+S = "${WORKDIR}/js-1.8.5/js/src"
+
+inherit autotools
+
+EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'XCFLAGS=${CFLAGS}' 'XLDFLAGS=${LDFLAGS} -Wl,-soname=libjs' \
+                'BUILD_CC=${BUILD_CC}' 'BUILD_CFLAGS=${BUILD_CFLAGS}' 'BUILD_LDFLAGS=${BUILD_LDFLAGS}' "
+
+PARALLEL_MAKE = ""
+
+do_configure() {
+    ./configure --prefix=/usr
+}
+
+do_install() {
+	autotools_do_install
+	# We create a symlink in order to avoid failures of older packages that use -ljs
+	ln -sf ${D}${libdir}/libmozjs185.so.1.0.0 ${D}${libdir}/libjs.so 
+}
+
+FILES_${PN} = "${libdir}/libmozjs185.so.1.0.0 \
+		${bindir}/*"
+
+FILES_${PN}-dev = "${includedir}/* \
+		    /usr/lib/pkgconfig/* \
+		    /usr/lib/libmozjs185.so \
+		    /usr/lib/libmozjs185.so.1.0 \
+		    /usr/lib/libjs.so \
+		    "
+
+FILES_${PN}-staticdev = "${libdir}/*.a"
-- 
1.7.5.4



