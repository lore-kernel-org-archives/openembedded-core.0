Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFD8731E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 02:18:37 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pZvPS3C50z3hjYW;
	Wed,  6 Jan 2016 03:13:32 +0100 (CET)
X-Auth-Info: 5s7OmQQShiwCMjv3BsWeGXKw9H3ITYM3/c7Elee8D14=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3pZvPS0q9CzvdWV;
	Wed,  6 Jan 2016 03:13:32 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 03:13:29 +0100
Message-Id: <1452046409-7350-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] gcc5: Fix build on NIOS2
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
X-List-Received-Date: Wed, 06 Jan 2016 02:18:38 -0000

The gcc 5.3 does not build on NIOS2 due to a missing MUSL_DYNAMIC_LINKER
definition in it's config file. Add the definition to fix the build issue.
The output produced during the failing build is as follows:

g++    -isystem/b/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -static-libstdc++ -static-libgcc -L/b/tmp/sysroots/x86_64-linux/usr/lib -L/b/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/b/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ar.o -o gcc-ar \
        file-find.o libcommon.a ../libcpp/libcpp.a   ../libbacktrace/.libs/libbacktrace.a ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a
In file included from ./tm.h:27:0,
                 from /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:34:
./config/linux.h:92:28: error: expected ',' or ';' before 'MUSL_DYNAMIC_LINKER'
     BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
                            ^
./config/linux.h:59:60: note: in definition of macro 'CHOOSE_DYNAMIC_LINKER1'
   "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
                                                            ^
./config/linux.h:91:3: note: in expansion of macro 'CHOOSE_DYNAMIC_LINKER'
   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, \
   ^
./config/nios2/linux.h:40:25: note: in expansion of macro 'GNU_USER_DYNAMIC_LINKER'
       -dynamic-linker " GNU_USER_DYNAMIC_LINKER "} \
                         ^
/b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:884:32: note: in expansion of macro 'LINK_SPEC'
 static const char *link_spec = LINK_SPEC;
                                ^
<command-line>:0:27: warning: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
/b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:1295:48: note: in expansion of macro 'STANDARD_STARTFILE_PREFIX'
 static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc                         |  1 +
 .../gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch               | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 3ce0893..80999c1 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -76,6 +76,7 @@ SRC_URI = "\
            file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch \
            file://0045-Support-for-arm-linux-musl.patch \
            file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
+	   file://0047-Fix-nios2-musl-build.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
new file mode 100644
index 0000000..44cea84
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
@@ -0,0 +1,11 @@
+diff -Naru gcc-5.3.0.orig/gcc/config/nios2/linux.h gcc-5.3.0/gcc/config/nios2/linux.h
+--- gcc-5.3.0.orig/gcc/config/nios2/linux.h	2015-05-28 16:08:37.000000000 +0200
++++ gcc-5.3.0/gcc/config/nios2/linux.h	2016-01-04 02:42:46.878844806 +0100
+@@ -30,6 +30,7 @@
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
-- 
2.1.4


