Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A090460842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:28:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MDenUl006980; Thu, 22 Aug 2013 14:40:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ebcj2VQUwlIX; Thu, 22 Aug 2013 14:40:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MDeiKo006958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 22 Aug 2013 14:40:46 +0100
Message-ID: <1377178123.6762.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 14:28:43 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-4.8: Add two patches to deal with cross-canadian build failures
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
X-List-Received-Date: Thu, 22 Aug 2013 13:29:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See the patch headers for more information about the cross-canadian build failures
these patches avoid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 9d92eda..e66bdaf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -72,6 +72,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0040-fix-g++-sysroot.patch \
 	   file://0041-libtool-avoid-libdir.patch \
 	   file://0042-pr57748.patch \
+	   file://0043-cpp.patch \
+	   file://0044-gengtypes.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0043-cpp.patch b/meta/recipes-devtools/gcc/gcc-4.8/0043-cpp.patch
new file mode 100644
index 0000000..eaf8646
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0043-cpp.patch
@@ -0,0 +1,40 @@
+The OE environment sets and exports CPP as being the target gcc. When building 
+gcc-cross-canadian for a mingw targetted sdk, the following can be found in
+build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
+
+configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
+configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
+configure:3666: $? = 0
+configure:3698: result: no
+configure:3786: checking how to run the C preprocessor
+configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
+configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32  conftest.c
+configure:3876: $? = 0
+
+Note this is a *build* target (in build-x86_64-linux) so it should be using 
+the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32 headers are 
+very different, using the wrong cpp is a real problem. It is leaking into 
+configure through the CPP variable. Ultimately this leads to build failures 
+related to not being able to include a process.h file for pem-unix.c.
+
+The fix is to ensure we export a sane CPP value into the build environment when
+using build targets. We could define a CPP_FOR_BUILD value which may be the version
+which needs to be upstreamed but for now, this fix is good enough to avoid the 
+problem.
+
+RP 22/08/2013
+
+Upstream-Status: Pending
+
+Index: gcc-4.8.1/Makefile.in
+===================================================================
+--- gcc-4.8.1.orig/Makefile.in	2013-03-30 11:25:03.000000000 +0000
++++ gcc-4.8.1/Makefile.in	2013-08-13 12:03:17.151988882 +0000
+@@ -149,6 +149,7 @@
+ 	AR="$(AR_FOR_BUILD)"; export AR; \
+ 	AS="$(AS_FOR_BUILD)"; export AS; \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
++	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0044-gengtypes.patch b/meta/recipes-devtools/gcc/gcc-4.8/0044-gengtypes.patch
new file mode 100644
index 0000000..e38761d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0044-gengtypes.patch
@@ -0,0 +1,97 @@
+gengtype is generated for both the build system and the target. -DGENERATOR_FILE
+was added in the patch http://gcc.gnu.org/ml/gcc-patches/2012-07/msg00273.html
+and was applied to both versions of gengtype.
+
+Unfortunately the presence of this flag triggers the build configuration (bconfig.h) 
+to be included for the target build of gengtype. Compiling gengtype with the target 
+compiler and bconfig.h can result in errors if the build and target systems are 
+dissimilar. An example case this fails is cross compiling gcc on linux for a darwin 
+target system:
+
+In file included from /media/build1/poky/build/tmp/work-shared/gcc-4.8.1-r0/gcc-4.8.1/gcc/gengtype-parse.c:25:0:
+| /media/build1/poky/build/tmp/work-shared/gcc-4.8.1-r0/gcc-4.8.1/gcc/gengtype-parse.c: In function 'void parse_error(const char*, ...)':
+| /media/build1/poky/build/tmp/work-shared/gcc-4.8.1-r0/gcc-4.8.1/gcc/system.h:93:53: error: 'fputc_unlocked' was not declared in this scope
+|  #  define fputc(C, Stream) fputc_unlocked (C, Stream)
+
+which occurs since auto-build.h and auto-host.h have differnet values of
+HAVE_FPUTC_UNLOCKED:
+
+#define HAVE_FPUTC_UNLOCKED 1
+/* #undef HAVE_FPUTS_UNLOCKED */
+
+The obvious fix is to only include the flag on build/ targets which this patch does, however 
+this also leads to compile errors due to const_tree being undefined but used in double_int.h
+
+I added a GENERATOR_FILE2 flag to workaround those in the 
+target case and allow the build to succeed.
+
+Only the build/gengtypes should have the -DGENERATOR_FILE 
+
+RP 22/8/2013
+
+Upstream-Status: Pending
+
+Index: gcc-4.8.1/gcc/Makefile.in
+===================================================================
+--- gcc-4.8.1.orig/gcc/Makefile.in	2013-08-19 11:40:36.844014424 +0000
++++ gcc-4.8.1/gcc/Makefile.in	2013-08-19 11:40:37.784014402 +0000
+@@ -3903,27 +3903,29 @@
+ 
+ gengtype-lex.o build/gengtype-lex.o : gengtype-lex.c gengtype.h $(SYSTEM_H)
+ gengtype-lex.o: $(CONFIG_H) $(BCONFIG_H)
+-CFLAGS-gengtype-lex.o += -DGENERATOR_FILE
++CFLAGS-build/gengtype-lex.o += -DGENERATOR_FILE
+ build/gengtype-lex.o: $(BCONFIG_H)
+ 
+ gengtype-parse.o build/gengtype-parse.o : gengtype-parse.c gengtype.h \
+   $(SYSTEM_H)
+ gengtype-parse.o: $(CONFIG_H)
+-CFLAGS-gengtype-parse.o += -DGENERATOR_FILE
++CFLAGS-build/gengtype-parse.o += -DGENERATOR_FILE
+ build/gengtype-parse.o: $(BCONFIG_H)
+ 
+ gengtype-state.o build/gengtype-state.o: gengtype-state.c $(SYSTEM_H) \
+   gengtype.h errors.h double-int.h version.h $(HASHTAB_H) $(OBSTACK_H) \
+   $(XREGEX_H)
+ gengtype-state.o: $(CONFIG_H)
+-CFLAGS-gengtype-state.o += -DGENERATOR_FILE
++CFLAGS-gengtype-state.o += -DGENERATOR_FILE2
++CFLAGS-build/gengtype-state.o += -DGENERATOR_FILE
+ build/gengtype-state.o: $(BCONFIG_H)
+ 
+ gengtype.o build/gengtype.o : gengtype.c $(SYSTEM_H) gengtype.h 	\
+   rtl.def insn-notes.def errors.h double-int.h version.h $(HASHTAB_H) \
+   $(OBSTACK_H) $(XREGEX_H)
+ gengtype.o: $(CONFIG_H)
+-CFLAGS-gengtype.o += -DGENERATOR_FILE
++CFLAGS-gengtype.o += -DGENERATOR_FILE2
++CFLAGS-build/gengtype.o += -DGENERATOR_FILE
+ build/gengtype.o: $(BCONFIG_H)
+ 
+ build/genmddeps.o: genmddeps.c $(BCONFIG_H) $(SYSTEM_H) coretypes.h	\
+@@ -3988,7 +3990,7 @@
+ # any system header is included.
+ gengtype-lex.c : gengtype-lex.l
+ 	-$(FLEX) $(FLEXFLAGS) -o$@ $< && { \
+-	  echo '#include "bconfig.h"' > $@.tmp; \
++	  echo '' > $@.tmp; \
+ 	  cat $@ >> $@.tmp; \
+ 	  mv $@.tmp $@; \
+ 	}
+Index: gcc-4.8.1/gcc/double-int.h
+===================================================================
+--- gcc-4.8.1.orig/gcc/double-int.h	2013-01-30 11:04:30.000000000 +0000
++++ gcc-4.8.1/gcc/double-int.h	2013-08-19 11:41:51.564012719 +0000
+@@ -448,10 +448,12 @@
+ 
+ 
+ #ifndef GENERATOR_FILE
++#ifndef GENERATOR_FILE2
+ /* Conversion to and from GMP integer representations.  */
+ 
+ void mpz_set_double_int (mpz_t, double_int, bool);
+ double_int mpz_get_double_int (const_tree, mpz_t, bool);
+ #endif
++#endif
+ 
+ #endif /* DOUBLE_INT_H */



