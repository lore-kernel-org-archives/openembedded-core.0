Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id AB90D76294
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:37 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id o11so348659571qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wHAHYSfIeDZ7JAaNw95kF1teAUdYMm1V2obcUJ2UolY=;
	b=rWp5nxP8FGDHnjs3PIPpYH59/7vD2MTem2EM1bKii13cgPZzTsSGOvmwu6oglW226n
	h+iFz3k959jFS1Pb0E0pmbnQoDGAYhy8eaCaM2nmDi7Lwpnnkvwts2MuTKv2pfGXzarS
	D8bSUauVGj7+slNPwAZj8RWyMxaLP6mMVpvZtckmsxlD871mO7g4shuVCc3H7Bpd5LPh
	oC1jje0qJ6prU1spTLVHdRdkvnwdV/Ay0g74AAdWMm1H8w8DYeoQn6XhbO3r9j8xEEzL
	ZTw0Jlkpb/W2AA57m50FJZnrC5zcgbAdXajhZTBwhKji+BQwIWtwhGvo7hrlvYo8YF5Y
	0JKw==
X-Received: by 10.140.18.167 with SMTP id 36mr96038967qgf.38.1452248378318;
	Fri, 08 Jan 2016 02:19:38 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:44 +0000
Message-Id: <3e32a103a4798d92153c0650f2f82475b267e622.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 16/53] elfutils: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:38 -0000

Remove mempcpy patch its already in uclibc now
refresh libargp patch to match latest elfutils

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc-support-for-elfutils-0.161.patch        | 79 ++++++++++++++--------
 .../elfutils/elfutils/mempcpy.patch                | 24 -------
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  1 -
 meta/recipes-devtools/elfutils/elfutils_0.163.bb   |  3 +-
 4 files changed, 52 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils/mempcpy.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
index f1533bf..7167965 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
@@ -25,11 +25,11 @@ Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
  libelf/Makefile.am | 5 +++++
  4 files changed, 23 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index a1ad6db..81fc33f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,6 +70,14 @@ AS_IF([test "$use_locks" = yes],
+Index: elfutils-0.163/configure.ac
+===================================================================
+--- elfutils-0.163.orig/configure.ac
++++ elfutils-0.163/configure.ac
+@@ -64,6 +64,14 @@ AS_IF([test "$use_locks" = yes],
  
  AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
  
@@ -44,63 +44,86 @@ index a1ad6db..81fc33f 100644
  AC_PROG_CC
  AC_PROG_RANLIB
  AC_PROG_YACC
-diff --git a/libcpu/Makefile.am b/libcpu/Makefile.am
-index 3beccf3..9ba6c04 100644
---- a/libcpu/Makefile.am
-+++ b/libcpu/Makefile.am
-@@ -80,6 +80,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i386.mnemonics`"
+@@ -346,18 +354,13 @@ AC_LINK_IFELSE(
+ )
+ 
+ dnl If our libc doesn't provide argp, then test for libargp
+-if test "$libc_has_argp" = "false" ; then
+-	AC_MSG_WARN("libc does not have argp")
+-	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true"], [have_argp="false"])
+-
+-	if test "$have_argp" = "false"; then
+-		AC_MSG_ERROR("no libargp found")
+-	else
+-		argp_LDADD="-largp"
+-	fi
+-else
+-	argp_LDADD=""
+-fi
++AS_IF([test "x$libc_has_argp" = "xfalse"],
++	[AC_MSG_WARN("libc does not have argp")
++	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true" argp_LDADD="-largp"], [have_argp="false"])], [argp_LDADD=""])
++
++AS_IF([test "x$libc_has_argp" = "xfalse" -a "x$have_argp" = "xfalse"],
++	AC_CHECK_LIB([uargp], [argp_parse], [have_uargp="true" argp_LDADD="-luargp"], [have_uargp="false"])], [argp_LDADD=""])
++
+ AC_SUBST([argp_LDADD])
+ 
+ dnl The directories with content.
+Index: elfutils-0.163/libcpu/Makefile.am
+===================================================================
+--- elfutils-0.163.orig/libcpu/Makefile.am
++++ elfutils-0.163/libcpu/Makefile.am
+@@ -80,6 +80,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i3
  i386_lex.o: i386_parse.h
  i386_gendis_LDADD = $(libeu) -lm
  
 +if USE_UCLIBC
-+i386_gendis_LDADD += -luargp -lintl
++i386_gendis_LDADD += -lintl
 +endif
 +
  i386_parse.h: i386_parse.c ;
  
  EXTRA_DIST = defs/i386
-diff --git a/libdw/Makefile.am b/libdw/Makefile.am
-index 887da6b..d31b428 100644
---- a/libdw/Makefile.am
-+++ b/libdw/Makefile.am
+Index: elfutils-0.163/libdw/Makefile.am
+===================================================================
+--- elfutils-0.163.orig/libdw/Makefile.am
++++ elfutils-0.163/libdw/Makefile.am
 @@ -102,6 +102,11 @@ endif
  libdw_pic_a_SOURCES =
  am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
  
 +libdw_so_LDLIBS =
 +if USE_UCLIBC
-+libdw_so_LDLIBS += -lintl -luargp
++libdw_so_LDLIBS += -lintl
 +endif
 +
  libdw_so_SOURCES =
  libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
  	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
-@@ -112,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
+@@ -112,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
  		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
  		-Wl,--version-script,$<,--no-undefined \
  		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl $(zip_LIBS)
-+		-ldl $(zip_LIBS) $(libdw_so_LDLIBS)
+-		-ldl $(argp_LDADD) $(zip_LIBS)
++		-ldl $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
  	@$(textrel_check)
  	ln -fs $@ $@.$(VERSION)
  
-diff --git a/libelf/Makefile.am b/libelf/Makefile.am
-index afcb2aa..02836a1 100644
---- a/libelf/Makefile.am
-+++ b/libelf/Makefile.am
-@@ -93,7 +93,12 @@ libelf_a_SOURCES = elf_version.c elf_hash.c elf_error.c elf_fill.c \
+Index: elfutils-0.163/libelf/Makefile.am
+===================================================================
+--- elfutils-0.163.orig/libelf/Makefile.am
++++ elfutils-0.163/libelf/Makefile.am
+@@ -93,7 +93,12 @@ libelf_a_SOURCES = elf_version.c elf_has
  libelf_pic_a_SOURCES =
  am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
  
 +
  libelf_so_LDLIBS =
 +if USE_UCLIBC
-+libelf_so_LDLIBS += -lintl -luargp
++libelf_so_LDLIBS += -lintl
 +endif
 +
  if USE_LOCKS
  libelf_so_LDLIBS += -lpthread
  endif
--- 
-1.8.3.4
-
diff --git a/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
deleted file mode 100644
index 24e31fa..0000000
--- a/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-
-uclibc does not export __mempcpy like glibc so we alias it here.
-This patch may make sense for upstream but elfutils uses more
-glibc specific features like obstack_printf which are missing in
-uclibc they need to be fixed along to make it work all the way
-
-Upstream-Status: Inappropriate[Elfutils uses more glibc specific features]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: elfutils-0.148/libelf/elf_begin.c
-===================================================================
---- elfutils-0.148.orig/libelf/elf_begin.c
-+++ elfutils-0.148/libelf/elf_begin.c
-@@ -68,6 +68,9 @@
- #include "libelfP.h"
- #include "common.h"
- 
-+#ifdef __UCLIBC__
-+#define __mempcpy mempcpy
-+#endif
- 
- /* Create descriptor for archive in memory.  */
- static inline Elf *
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 0d8490d..ff53257 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -27,7 +27,6 @@ SRC_URI += "\
         file://elf_additions.diff \
         file://elfutils-fsize.patch \
         file://remove-unused.patch \
-        file://mempcpy.patch \
         file://fix_for_gcc-4.7.patch \
         file://dso-link-change.patch \
         file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
index e391813..41bfbdc 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
@@ -11,7 +11,6 @@ SRC_URI[md5sum] = "77ce87f259987d2e54e4d87b86cbee41"
 SRC_URI[sha256sum] = "7c774f1eef329309f3b05e730bdac50013155d437518a2ec0e24871d312f2e23"
 
 SRC_URI += "\
-        file://mempcpy.patch \
         file://dso-link-change.patch \
         file://Fix_elf_cvt_gunhash.patch \
         file://fixheadercheck.patch \
@@ -51,7 +50,7 @@ EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
 do_install_append() {
 	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
-		rm ${D}${bindir}/eu-objdump
+		rm -f ${D}${bindir}/eu-objdump
 	fi
 }
 
-- 
2.7.0


