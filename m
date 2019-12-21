Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3B39D6D561
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 18:52:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id b9so6655419pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 10:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rju4aJpA7sDGRmBYbx8vwerBtK0LKVKl+LuWnt732XM=;
	b=YCR49qAj+FHkNzB6SLK+IEa0GuT/hLk22KdZR40EtxNf1FqobrxkQsMRqDdsJ1APCo
	hvWWbH5ea6bHMUzMW1O/6r0fuQY3awgT86aOBLTA1+4XQehVjjRBKa65gdN/GfzeyOeq
	z6Ns4zPVtNbcL1SXcl/D9nZdMY6XZARvdjiHm6DSkpW2voBUCdnbqgb6u6aq3ulWKc5Z
	8TTQCEefpnz3PRlVbEefL+yp/XRwhb6Rt7isOQ8pbBHEm8zcwZPcuP+3fDxKUXx5fmUM
	DQkjQHTCpFLvrf3Ul0eF+KiYmObT8wAnnEI/KGYLoMpvWDYfDqH53cSwdNwvIzsCADJ8
	l/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rju4aJpA7sDGRmBYbx8vwerBtK0LKVKl+LuWnt732XM=;
	b=dStMbETqnIQm6D5ZHDiU+KoR+Q2xoALIWaiXDtCW/FwD1GHt/9rEyXbDq8Nj3LqmqH
	3XuABLBRVECH4A/3VfbLXx/yfQClpl4DFGlzU09Nv43oiEbFJRwGF9qleYiT1NlGMSE5
	dezyXwCVWeyvyEKBI4/8ApOc6FfNZnIfqPlQmMSk96ZPBmhcP2Gbrzm6pUh3xNRCSTBz
	ujkDLmc+XN98vMNkVrxNzkStV1zPVZ8IM501e/wgzHeRkuBtv0FrhqkGLNgEfJz0rRAh
	I3SNivYHkUSsKsnJ8mFhsNAloLhg5LX/vdH3IJmX0JEpCgQvnD/KXq6kB6fv+YwAacbC
	wiLA==
X-Gm-Message-State: APjAAAWE3xmYSiT1pn1nd64ohk0WGHRucNk5nqWL5gKnvor2m9/d4/3T
	9/vAjw93fj31kinrqhrllhv7r7YyJh4=
X-Google-Smtp-Source: APXvYqxonGGPye2sdpJnEGoHamGNjOhgzx+IorsysFUwyi18J5m0ue3tW485xoC+pj/0UawjP/1D7w==
X-Received: by 2002:a62:5547:: with SMTP id j68mr24287926pfb.6.1576954331625; 
	Sat, 21 Dec 2019 10:52:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d22sm16080433pgg.52.2019.12.21.10.52.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Dec 2019 10:52:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2019 10:52:03 -0800
Message-Id: <20191221185203.3425218-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] strace: Upgrade to 5.4
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
X-List-Received-Date: Sat, 21 Dec 2019 18:52:11 -0000
Content-Transfer-Encoding: 8bit

Remove a patch already present upstream
Add a patch to fix build with upcoming glibc 2.31 where
__ptrace_syscall_info definition is added

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...yscall_info-to-__ptrace_syscall_info.patch | 52 +++++++++++++++++++
 ...Check-for-mips-and-alpha-before-usin.patch | 32 ------------
 .../strace/strace/Makefile-ptest.patch        |  6 +--
 ...st-test-for-m32-mx32-compile-support.patch | 10 ++--
 .../strace/strace/sys_headers.patch           |  2 +-
 .../strace/{strace_5.3.bb => strace_5.4.bb}   |  6 +--
 6 files changed, 62 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
 rename meta/recipes-devtools/strace/{strace_5.3.bb => strace_5.4.bb} (89%)

diff --git a/meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch b/meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch
new file mode 100644
index 0000000000..dd0617a15f
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch
@@ -0,0 +1,52 @@
+From 86bbe1135d5d13db1ced64141acfb513c03d2f30 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Dec 2019 10:18:38 -0800
+Subject: [PATCH] define ptrace_syscall_info to __ptrace_syscall_info
+
+glibc 2.31+ has defined __ptrace_syscall_info [1]
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d1e411e5c786ce3028d98b4e6fc02c2fcf66ae37;hp=2e4e75727eb05eef4c10470d865bd42962d5fae7
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ get_personality.h | 2 ++
+ ptrace.h          | 2 ++
+ 2 files changed, 4 insertions(+)
+
+--- a/get_personality.h
++++ b/get_personality.h
+@@ -10,7 +10,9 @@
+ 
+ # include "ptrace.h"
+ 
++# if HAVE_STRUCT___PTRACE_SYSCALL_INFO
+ extern int
+ get_personality_from_syscall_info(const struct ptrace_syscall_info *);
++# endif
+ 
+ #endif /* !STRACE_GET_PERSONALITY_H */
+--- a/ptrace.h
++++ b/ptrace.h
+@@ -186,6 +186,9 @@ struct ptrace_syscall_info {
+ };
+ # endif
+ 
++# if HAVE_STRUCT___PTRACE_SYSCALL_INFO
++#  define ptrace_syscall_info __ptrace_syscall_info
++# endif
+ # if !HAVE_DECL_PTRACE_PEEKUSER
+ #  define PTRACE_PEEKUSER PTRACE_PEEKUSR
+ # endif
+--- a/configure.ac
++++ b/configure.ac
+@@ -317,7 +317,8 @@ AC_CHECK_MEMBERS([struct stat.st_mtime_n
+ AC_CHECK_TYPES(m4_normalize([
+ 	struct pt_all_user_regs,
+ 	struct ia64_fpreg,
+-	struct ptrace_peeksiginfo_args
++	struct ptrace_peeksiginfo_args,
++	struct __ptrace_syscall_info
+ ]),,, [#include <sys/ptrace.h>])
+ 
+ # For kernels that do not have v3.10-rc1~201^2~11
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
deleted file mode 100644
index 95d85bf34a..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 879ae71c472ce522f1b3514d2abf6ad49b4acc07 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 18 Sep 2017 22:51:32 -0700
-Subject: [PATCH] tests/sigaction: Check for mips and alpha before using
- sa_restorer
-
-local structure does not define restorer member for mips and alpha
-in definition, we need to match that assumption here where they are
-being set
-
-Fixes
-| ../../strace-4.18/tests/sigaction.c:177:36: error: 'struct_set_sa {aka struct set_sa}' has no member named 'restorer'
-|  # define SA_RESTORER_ARGS , new_act->restorer
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- tests/sigaction.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/tests/sigaction.c
-+++ b/tests/sigaction.c
-@@ -156,7 +156,7 @@ main(void)
- 	sigdelset(mask.libc, SIGHUP);
- 
- 	memcpy(new_act->mask, mask.old, sizeof(mask.old));
--# ifdef SA_RESTORER
-+#if defined(SA_RESTORER) && !defined(MIPS) && !defined(ALPHA)
- 	new_act->flags = SA_RESTORER;
- 	new_act->restorer = (unsigned long) 0xdeadfacecafef00dULL;
- #  define SA_RESTORER_FMT ", sa_flags=SA_RESTORER, sa_restorer=%#lx"
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 08fa5c53b8..2437d1fb6d 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -13,11 +13,9 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  tests/Makefile.am | 19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
 
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 825c989..4623c48 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -14,6 +14,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+@@ -15,6 +15,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
  MPERS_NAME =
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
@@ -25,7 +23,7 @@ index 825c989..4623c48 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  AM_CPPFLAGS = $(ARCH_MFLAGS) \
  	      -I$(builddir) \
-@@ -477,3 +478,21 @@ BUILT_SOURCES = ksysent.h
+@@ -531,3 +532,21 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../scno.am
diff --git a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
index a9bd900da8..ae22105cbe 100644
--- a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
+++ b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
@@ -23,19 +23,17 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  m4/mpers.m4 | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/m4/mpers.m4 b/m4/mpers.m4
-index 13725d7..d8578ea 100644
 --- a/m4/mpers.m4
 +++ b/m4/mpers.m4
-@@ -88,6 +88,7 @@ case "$arch" in
- 	CFLAGS="$CFLAGS MPERS_CFLAGS $IFLAG"
- 	AC_CACHE_CHECK([for mpers_name personality compile support], [st_cv_cc],
+@@ -103,6 +103,7 @@ case "$arch" in
+ 	CFLAGS="$CFLAGS MPERS_CFLAGS${IFLAG:+ }$IFLAG"
+ 	AC_CACHE_CHECK([for mpers_name personality compile support (using $CC $CFLAGS)], [st_cv_cc],
  		[AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
 +						     #include <sys/syscall.h>
  						     int main(){return 0;}]])],
  				   [st_cv_cc=yes],
  				   [st_cv_cc=no])])
-@@ -95,6 +96,7 @@ case "$arch" in
+@@ -110,6 +111,7 @@ case "$arch" in
  		AC_CACHE_CHECK([for mpers_name personality runtime support],
  			[st_cv_runtime],
  			[AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
diff --git a/meta/recipes-devtools/strace/strace/sys_headers.patch b/meta/recipes-devtools/strace/strace/sys_headers.patch
index e46f2c350d..d1b704e0d9 100644
--- a/meta/recipes-devtools/strace/strace/sys_headers.patch
+++ b/meta/recipes-devtools/strace/strace/sys_headers.patch
@@ -11,7 +11,7 @@ Suggested-by: Rich Felker <dalias@aerifal.cx>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/configure.ac
 +++ b/configure.ac
-@@ -439,11 +439,7 @@ AC_CHECK_HEADERS(m4_normalize([
+@@ -441,11 +441,7 @@ AC_CHECK_HEADERS(m4_normalize([
  	sys/conf.h
  	sys/eventfd.h
  	sys/fanotify.h
diff --git a/meta/recipes-devtools/strace/strace_5.3.bb b/meta/recipes-devtools/strace/strace_5.4.bb
similarity index 89%
rename from meta/recipes-devtools/strace/strace_5.3.bb
rename to meta/recipes-devtools/strace/strace_5.4.bb
index b000afb30b..1e428ccd64 100644
--- a/meta/recipes-devtools/strace/strace_5.3.bb
+++ b/meta/recipes-devtools/strace/strace_5.4.bb
@@ -12,13 +12,13 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://run-ptest \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
-           file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
            file://sys_headers.patch \
+           file://0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch \
            "
-SRC_URI[md5sum] = "84f5e72de813c9b1bb6057ee8ab428d8"
-SRC_URI[sha256sum] = "6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047"
+SRC_URI[md5sum] = "b2b58f05eb3c5c0bf9d1e26003b4d698"
+SRC_URI[sha256sum] = "f7d00514d51290b6db78ad7a9de709baf93caa5981498924cbc9a744cfd2a741"
 
 inherit autotools ptest
 
-- 
2.24.1


