Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNuxt-0005xF-JN
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 02:57:15 +0200
Received: by mail-pd0-f181.google.com with SMTP id y10so1706950pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PF9Rp0fOISIGw4tgMCeh818v+HV4CsFPkk0QoNfVM2o=;
	b=U0cWS8ZY3EWqQX+0qzLj3X3QRN3j6+jgqVJlFc/GLMX/Bzh4B9rrzDPocCbjCdS4YX
	gtt6Ru2MxhtjUU1/RuFcrc7I8GIXHHGGieS1GZoFTVriv2JavQGIWSykGAZqXA3JugJ0
	doCwTDyhCYXOnyBKlj5SumSID1Wgnr8U5McPuUUBUe4zT5f+727ohKD9MMMmabMj/qEJ
	k91mj7OMCYSGvux0ESH7GRqRQAymQGoiYN3XnVntYX04QmhNvWosiwQJF02FZVK8i35d
	FdIPa0hslus2BEheO3fkyOUN6YnJYRIqwhuF3p3N2g1wAVvkKWsNoCIrPOUjZ6Mwd0Bu
	Piqg==
X-Received: by 10.66.184.14 with SMTP id eq14mr7852551pac.215.1365122399052;
	Thu, 04 Apr 2013 17:39:59 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id m9sm4351149paa.17.2013.04.04.17.39.58
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 17:39:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 17:39:05 -0700
Message-Id: <f4bbd20381bd06824f279e19fa0d0db6bae7b53a.1365122145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1365122145.git.raj.khem@gmail.com>
References: <cover.1365122145.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] coreutils: Fix build on uclibc after upgrade to 8.21
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
X-List-Received-Date: Fri, 05 Apr 2013 00:57:17 -0000

This upgrade started to breaking build on uclibc
the patches in there fixes the build. What patches
do are explained in patch headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-ltr-and-lpthread-for-getting-spawn-func.patch |   15 ++++
 ...sys_time.in.h-Fix-use-of-restrict-keyword.patch |   51 +++++++++++++
 .../coreutils/coreutils-8.21/gcc-uclibc.patch      |   77 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.21.bb      |    5 +-
 4 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/0001-local.mk-Add-ltr-and-lpthread-for-getting-spawn-func.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/0001-sys_time.in.h-Fix-use-of-restrict-keyword.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/gcc-uclibc.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.21/0001-local.mk-Add-ltr-and-lpthread-for-getting-spawn-func.patch b/meta/recipes-core/coreutils/coreutils-8.21/0001-local.mk-Add-ltr-and-lpthread-for-getting-spawn-func.patch
new file mode 100644
index 0000000..f231b4a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.21/0001-local.mk-Add-ltr-and-lpthread-for-getting-spawn-func.patch
@@ -0,0 +1,15 @@
+Index: coreutils-8.21/src/local.mk
+===================================================================
+--- coreutils-8.21.orig/src/local.mk	2013-01-30 16:46:24.000000000 -0800
++++ coreutils-8.21/src/local.mk	2013-04-03 09:32:17.775482144 -0700
+@@ -302,6 +302,10 @@
+ # for pthread
+ src_sort_LDADD += $(LIB_PTHREAD)
+ 
++# uclibc
++src_timeout_LDADD += $(YIELD_LIB) $(LIBMULTITHREAD)
++src_sort_LDADD += $(YIELD_LIB) $(LIBMULTITHREAD)
++
+ # Get the release year from lib/version-etc.c.
+ RELEASE_YEAR = \
+   `sed -n '/.*COPYRIGHT_YEAR = \([0-9][0-9][0-9][0-9]\) };/s//\1/p' \
diff --git a/meta/recipes-core/coreutils/coreutils-8.21/0001-sys_time.in.h-Fix-use-of-restrict-keyword.patch b/meta/recipes-core/coreutils/coreutils-8.21/0001-sys_time.in.h-Fix-use-of-restrict-keyword.patch
new file mode 100644
index 0000000..c549710
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.21/0001-sys_time.in.h-Fix-use-of-restrict-keyword.patch
@@ -0,0 +1,51 @@
+From 23fe0be0366c0110446ab93abb74a8d7a36412af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Apr 2013 01:13:17 -0700
+Subject: [PATCH] sys_time.in.h: Fix use of restrict keyword
+
+GCC detects that we call 'restrict' as param name in function
+signatures and complains since both params are called 'restrict'
+therefore we use __restrict to denote the C99 keywork
+
+This only happens of uclibc since this code is not excercised with
+eglibc otherwise we will have same issue there too
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ lib/sys_time.in.h |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/sys_time.in.h b/lib/sys_time.in.h
+index 656c3f1..97bc077 100644
+--- a/lib/sys_time.in.h
++++ b/lib/sys_time.in.h
+@@ -84,20 +84,20 @@ struct timeval
+ #   define gettimeofday rpl_gettimeofday
+ #  endif
+ _GL_FUNCDECL_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ _GL_CXXALIAS_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict));
++                  (struct timeval *__restrict, void *__restrict));
+ # else
+ #  if !@HAVE_GETTIMEOFDAY@
+ _GL_FUNCDECL_SYS (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ #  endif
+ /* Need to cast, because on glibc systems, by default, the second argument is
+                                                   struct timezone *.  */
+ _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
+-                       (struct timeval *restrict, void *restrict));
++                       (struct timeval *__restrict, void *__restrict));
+ # endif
+ _GL_CXXALIASWARN (gettimeofday);
+ #elif defined GNULIB_POSIXCHECK
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/coreutils/coreutils-8.21/gcc-uclibc.patch b/meta/recipes-core/coreutils/coreutils-8.21/gcc-uclibc.patch
new file mode 100644
index 0000000..d763ee8
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.21/gcc-uclibc.patch
@@ -0,0 +1,77 @@
+There are some new warnings coming out of gcc 4.7+ in first case
+declaration of is_range is in a else block and is jumped over by
+a vicious 'goto' so lets move the is_range declation before the
+
+second option disables -Wsuggest-attribute=const warning on
+gcc 4.7+
+
+
+Fixes issues like
+
+| make[2]: *** [lib/strerror-override.o] Error 1
+| make[2]: *** Waiting for unfinished jobs....
+| In file included from lib/fnmatch.c:170:0:
+| lib/fnmatch_loop.c: In function 'internal_fnmatch':
+| lib/fnmatch_loop.c:237:21: error: jump skips variable initialization [-Werror=jump-misses-init]
+|                      goto normal_bracket;
+|                      ^
+| lib/fnmatch_loop.c:601:23: note: label 'normal_bracket' defined here
+|                        normal_bracket:
+|                        ^
+| lib/fnmatch_loop.c:423:26: note: 'is_range' declared here
+|                      bool is_range = false;
+|                           ^
+
+
+and 
+
+
+| lib/strerror-override.c: In function 'strerror_override':
+| lib/strerror-override.c:35:1: error: function might be candidate for attribute 'const' [-Werror=suggest-attribute=const]
+|  strerror_override (int errnum)
+|  ^
+| cc1: all warnings being treated as errors
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+--- ./lib/fnmatch_loop.c.khem	2013-04-04 17:00:13.816681938 -0700
++++ ./lib/fnmatch_loop.c	2013-04-04 17:06:50.896689411 -0700
+@@ -202,6 +202,7 @@ FCT (const CHAR *pattern, const CHAR *st
+             const CHAR *p_init = p;
+             const CHAR *n_init = n;
+             register bool not;
++            bool is_range = false;
+             CHAR cold;
+             UCHAR fn;
+ 
+@@ -420,7 +421,6 @@ FCT (const CHAR *pattern, const CHAR *st
+                   }
+                 else
+                   {
+-                    bool is_range = false;
+ 
+ #ifdef _LIBC
+                     bool is_seqval = false;
+--- ./lib/strerror-override.c.khem	2013-04-04 17:07:27.684690137 -0700
++++ ./lib/strerror-override.c	2013-04-04 17:14:38.324697803 -0700
+@@ -28,11 +28,16 @@
+ #  include <winsock2.h>
+ # endif
+ #endif
++/* Without this pragma, gcc 4.7 suggests that the
++  error: function might be candidate for attribute 'const' */
++#if (__GNUC__ == 4&& 6<= __GNUC_MINOR__) || 4< __GNUC__
++# pragma GCC diagnostic ignored "-Wsuggest-attribute=const"
++#endif
+ 
+ /* If ERRNUM maps to an errno value defined by gnulib, return a string
+    describing the error.  Otherwise return NULL.  */
+ const char *
+-strerror_override (int errnum)
++strerror_override (const int errnum)
+ {
+   /* These error messages are taken from glibc/sysdeps/gnu/errlist.c.  */
+   switch (errnum)
diff --git a/meta/recipes-core/coreutils/coreutils_8.21.bb b/meta/recipes-core/coreutils/coreutils_8.21.bb
index 88561c7..76ec600 100644
--- a/meta/recipes-core/coreutils/coreutils_8.21.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
@@ -17,6 +17,9 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://coreutils-build-with-acl.patch \
            file://dummy_help2man.patch \
+           file://0001-sys_time.in.h-Fix-use-of-restrict-keyword.patch \
+           file://0001-local.mk-Add-ltr-and-lpthread-for-getting-spawn-func.patch \
+           file://gcc-uclibc.patch \
           "
 
 SRC_URI[md5sum] = "065ba41828644eca5dd8163446de5d64"
@@ -24,7 +27,7 @@ SRC_URI[sha256sum] = "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30d63e161444
 
 EXTRA_OECONF = "--disable-acl"
 EXTRA_OECONF_class-native = "--disable-acl --without-gmp"
-
+LDFLAGS_libc-uclibc = "-lrt -pthread"
 # [ df mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-- 
1.7.9.5



