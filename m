Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 02F436E56F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 03:28:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBH3SCBX000710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 19:28:12 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 16 Dec 2013 19:28:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2013 19:33:57 +0800
Message-ID: <62ac5a693a9d124580050cef011477375e716771.1387279561.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1387279561.git.liezhi.yang@windriver.com>
References: <cover.1387279561.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc-4.8/libstdc++-v3: disable sdt
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
X-List-Received-Date: Tue, 17 Dec 2013 03:28:13 -0000
Content-Type: text/plain

We may meet such an error when building gcc/libstdc++-v3:

gcc-4.8.1/libstdc++-v3/libsupc++/unwind-cxx.h:41:21: fatal error:
sys/sdt.h: No such file or directory

We already have a patch to disable the sdt for gcc, we also need disable
it for libstdc++-v3.

BTW, we need edit both configure.ac and configure to make them keep
compatible.

NOTE, this commit edit the patch gcc-4.8/0031-Disable-sdt.patch directly.

[YOCTO #5657]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gcc/gcc-4.8/0031-Disable-sdt.patch             | 80 ++++++++++++++++++++--
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
index c714239..2c1d5e0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0031-Disable-sdt.patch
@@ -1,4 +1,4 @@
-From eb70cb2785af7171897f363298bbfcd83de5ec57 Mon Sep 17 00:00:00 2001
+From b85265bc94ec1beaf1d3b697c03db62991553467 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
 Subject: [PATCH 31/35] Disable sdt.
@@ -12,16 +12,23 @@ RP 2012/8/7
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Disable sdt for libstdc++-v3.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 Upstream-Status: Inappropriate [hack]
 ---
- gcc/configure |   12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
+ gcc/configure             | 12 ++++++------
+ gcc/configure.ac          | 18 +++++++++---------
+ libstdc++-v3/configure    |  6 +++---
+ libstdc++-v3/configure.ac |  2 +-
+ 4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index d587993..8bc0c98 100755
+index 3c550a6..01c7626 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -26792,12 +26792,12 @@ fi
+@@ -26812,12 +26812,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -40,6 +47,67 @@ index d587993..8bc0c98 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
  $as_echo "$have_sys_sdt_h" >&6; }
  
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 3601ab6..06e501f 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -4779,15 +4779,15 @@ if test x$gcc_cv_libc_provides_ssp = xyes; then
+ fi
+ 
+ # Test for <sys/sdt.h> on the target.
+-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
+-AC_MSG_CHECKING(sys/sdt.h in the target C library)
+-have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
+-            [Define if your target C library provides sys/sdt.h])
+-fi
+-AC_MSG_RESULT($have_sys_sdt_h)
++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
++#have_sys_sdt_h=no
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
++#            [Define if your target C library provides sys/sdt.h])
++#fi
++#AC_MSG_RESULT($have_sys_sdt_h)
+ 
+ # Check if TFmode long double should be used by default or not.
+ # Some glibc targets used DFmode long double, but with glibc 2.4
+diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
+index 4953c9f..53a1145 100755
+--- a/libstdc++-v3/configure
++++ b/libstdc++-v3/configure
+@@ -20578,11 +20578,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+-  if test $glibcxx_cv_sys_sdt_h = yes; then
++#  if test $glibcxx_cv_sys_sdt_h = yes; then
+ 
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+ 
+-  fi
++#  fi
+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_h" >&5
+ $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
+ 
+diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
+index 73d430a..f2135e2 100644
+--- a/libstdc++-v3/configure.ac
++++ b/libstdc++-v3/configure.ac
+@@ -211,7 +211,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+ GLIBCXX_CHECK_SC_NPROC_ONLN
+ GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
+ GLIBCXX_CHECK_SYSCTL_HW_NCPU
+-GLIBCXX_CHECK_SDT_H
++#GLIBCXX_CHECK_SDT_H
+ 
+ # Check for available headers.
+ AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
 -- 
-1.7.10.4
+1.8.3.1
 
-- 
1.8.3.1


