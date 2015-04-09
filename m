Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id 461026E268
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:59:46 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJO41153; Thu, 09 Apr 2015 20:59:45 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 9 Apr 2015 20:59:36 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Apr 2015 12:56:27 +0000
Message-ID: <1428584187-6584-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
Cc: peifeiyue@huawei.com
Subject: [PATCH] elfutils: fix an incorrect patch for 0.161
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
X-List-Received-Date: Thu, 09 Apr 2015 12:59:49 -0000
Content-Type: text/plain

The original uclibc-support.patch is not compatible with elfutils-0.161.
It should be corrected through adjusting context.

So regenerate a new patch for elfutils-0.161, rename the patch for
elfutils-0.148, and put them into respective directories.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 .../uclibc-support-for-elfutils-0.148.patch}       |   0
 .../uclibc-support-for-elfutils-0.161.patch        | 106 +++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   2 +-
 meta/recipes-devtools/elfutils/elfutils_0.161.bb   |   2 +-
 4 files changed, 108 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils/uclibc-support.patch => elfutils-0.148/uclibc-support-for-elfutils-0.148.patch} (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support-for-elfutils-0.148.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support-for-elfutils-0.148.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch
new file mode 100644
index 0000000..f1533bf
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.161/uclibc-support-for-elfutils-0.161.patch
@@ -0,0 +1,106 @@
+From 3daec2dd11a04955f95e8f65a48820103d84dbec Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Thu, 9 Apr 2015 12:12:49 +0000
+Subject: [PATCH] uclibc support for elfutils 0.161
+
+on uclibc systems libintl and libuargp are separate from libc.
+so they need to be specified on commandline when we use proxy-libintl
+then libintl is a static archive so it should be listed last since
+elfutils does not respect disable-nls we need to link in libintl
+
+We add a new option --enable-uclibc which will be used to control
+the uclibc specific configurations during build.
+
+Upstream-Status: Inappropriate [uclibc specific]
+
+Signed-off-by: Khem Raj <raj.khem>
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+[Junling Zheng:
+ - adjust context
+]
+---
+ configure.ac       | 8 ++++++++
+ libcpu/Makefile.am | 4 ++++
+ libdw/Makefile.am  | 7 ++++++-
+ libelf/Makefile.am | 5 +++++
+ 4 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a1ad6db..81fc33f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,6 +70,14 @@ AS_IF([test "$use_locks" = yes],
+ 
+ AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
+ 
++AC_ARG_ENABLE([uclibc],
++AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
++use_uclibc=yes, use_uclibc=no)
++AM_CONDITIONAL(USE_UCLIBC, test "$use_uclibc" = yes)
++AS_IF([test "$use_uclibc" = yes], [AC_DEFINE(USE_UCLIBC)])
++
++AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
++
+ AC_PROG_CC
+ AC_PROG_RANLIB
+ AC_PROG_YACC
+diff --git a/libcpu/Makefile.am b/libcpu/Makefile.am
+index 3beccf3..9ba6c04 100644
+--- a/libcpu/Makefile.am
++++ b/libcpu/Makefile.am
+@@ -80,6 +80,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i386.mnemonics`"
+ i386_lex.o: i386_parse.h
+ i386_gendis_LDADD = $(libeu) -lm
+ 
++if USE_UCLIBC
++i386_gendis_LDADD += -luargp -lintl
++endif
++
+ i386_parse.h: i386_parse.c ;
+ 
+ EXTRA_DIST = defs/i386
+diff --git a/libdw/Makefile.am b/libdw/Makefile.am
+index 887da6b..d31b428 100644
+--- a/libdw/Makefile.am
++++ b/libdw/Makefile.am
+@@ -102,6 +102,11 @@ endif
+ libdw_pic_a_SOURCES =
+ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+ 
++libdw_so_LDLIBS =
++if USE_UCLIBC
++libdw_so_LDLIBS += -lintl -luargp
++endif
++
+ libdw_so_SOURCES =
+ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
+@@ -112,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl $(zip_LIBS)
++		-ldl $(zip_LIBS) $(libdw_so_LDLIBS)
+ 	@$(textrel_check)
+ 	ln -fs $@ $@.$(VERSION)
+ 
+diff --git a/libelf/Makefile.am b/libelf/Makefile.am
+index afcb2aa..02836a1 100644
+--- a/libelf/Makefile.am
++++ b/libelf/Makefile.am
+@@ -93,7 +93,12 @@ libelf_a_SOURCES = elf_version.c elf_hash.c elf_error.c elf_fill.c \
+ libelf_pic_a_SOURCES =
+ am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
+ 
++
+ libelf_so_LDLIBS =
++if USE_UCLIBC
++libelf_so_LDLIBS += -lintl -luargp
++endif
++
+ if USE_LOCKS
+ libelf_so_LDLIBS += -lpthread
+ endif
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 16db6b2..c3f90ec 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -36,7 +36,7 @@ SRC_URI += "\
         file://elf_begin.c-CVE-2014-9447-fix.patch \
 "
 # Only apply when building uclibc based target recipe
-SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
+SRC_URI_append_libc-uclibc = " file://uclibc-support-for-elfutils-0.148.patch"
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
index a3c1f36..648b6dd 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
@@ -34,7 +34,7 @@ SRC_URI += "\
 "
 
 # Only apply when building uclibc based target recipe
-SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
+SRC_URI_append_libc-uclibc = " file://uclibc-support-for-elfutils-0.161.patch"
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
-- 
1.8.3.4


