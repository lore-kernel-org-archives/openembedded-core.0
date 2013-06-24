Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32B366A961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 14:34:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5OEYEKs002979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:34:14 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 07:34:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:44:30 -0500
Message-ID: <1372085070-30429-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] gcc: When cross compiling a target gcc, target flags may be used on the host
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
X-List-Received-Date: Mon, 24 Jun 2013 14:34:13 -0000
Content-Type: text/plain

The original fix worked some of the time, but not on all machines.  Fix
this by applying the change in a different way.  Following the example of
the existing BUILD_CFLAGS.

Below is the commit message from the original change to help explain why
this is needed:

Configure identifies a number of warning flags (WARN_CFLAGS and
WARN_CXXFLAGS) from the $CC value.  The cross compiler may be different
from the host compiler and may not support the same set of flags.  This
leads to problems such as:

cc1plus: error: unrecognized command line option "-Wno-narrowing"
cc1plus: error: unrecognized command line option "-Wno-overlength-strings"

Work around this problem by removing the warning flags from the
BUILD_CXXFLAGS value, in a way similar to the BUILD_CFLAGS.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../gcc/gcc-4.8/gcc-4.8-build-args.patch           | 58 +++++++++-------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch b/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch
index 95f39bb..c27e009 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch
@@ -1,6 +1,6 @@
 When cross compiling a target gcc, target flags may be used on the host
 
-Configure identifies a number of warning flags (WARN_CFLAGS and 
+Configure identifies a number of warning flags (WARN_CFLAGS and
 WARN_CXXFLAGS) from the $CC value.  The cross compiler may be different
 from the host compiler and may not support the same set of flags.  This
 leads to problems such as:
@@ -9,43 +9,33 @@ cc1plus: error: unrecognized command line option "-Wno-narrowing"
 cc1plus: error: unrecognized command line option "-Wno-overlength-strings"
 
 Work around this problem by removing the warning flags from the
-BUILD_*FLAGS values.
+BUILD_CXXFLAGS value, in a way similar to the BUILD_CFLAGS.
 
 Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur gcc-4.8.0.orig/gcc/configure.ac gcc-4.8.0/gcc/configure.ac
---- gcc-4.8.0.orig/gcc/configure.ac	2013-05-29 14:44:24.960853593 -0500
-+++ gcc-4.8.0/gcc/configure.ac	2013-05-31 01:34:09.518775962 -0500
-@@ -1892,8 +1892,8 @@
- # These are the normal (build=host) settings:
- CC_FOR_BUILD='$(CC)'		AC_SUBST(CC_FOR_BUILD)
- CXX_FOR_BUILD='$(CXX)'		AC_SUBST(CXX_FOR_BUILD)
--BUILD_CFLAGS='$(ALL_CFLAGS)'	AC_SUBST(BUILD_CFLAGS)
--BUILD_CXXFLAGS='$(ALL_CXXFLAGS)' AC_SUBST(BUILD_CXXFLAGS)
-+BUILD_CFLAGS='$(ALL_BUILD_CFLAGS)'	AC_SUBST(BUILD_CFLAGS)
-+BUILD_CXXFLAGS='$(ALL_BUILD_CXXFLAGS)' AC_SUBST(BUILD_CXXFLAGS)
- BUILD_LDFLAGS='$(LDFLAGS)'	AC_SUBST(BUILD_LDFLAGS)
- STMP_FIXINC=stmp-fixinc		AC_SUBST(STMP_FIXINC)
+Index: gcc-4.8.0/gcc/configure
+===================================================================
+--- gcc-4.8.0.orig/gcc/configure
++++ gcc-4.8.0/gcc/configure
+@@ -11720,6 +10581,7 @@ STMP_FIXINC=stmp-fixinc
+ if test x$build != x$host || test "x$coverage_flags" != x
+ then
+     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
++    BUILD_CXXFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
+     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
+ fi
  
-diff -ur gcc-4.8.0.orig/gcc/Makefile.in gcc-4.8.0/gcc/Makefile.in
---- gcc-4.8.0.orig/gcc/Makefile.in	2013-05-29 14:44:24.369853593 -0500
-+++ gcc-4.8.0/gcc/Makefile.in	2013-05-31 01:34:30.360776427 -0500
-@@ -989,10 +989,16 @@
- ALL_CFLAGS = $(T_CFLAGS) $(CFLAGS-$@) \
-   $(CFLAGS) $(INTERNAL_CFLAGS) $(COVERAGE_FLAGS) $(WARN_CFLAGS) @DEFS@
+Index: gcc-4.8.0/gcc/configure.ac
+===================================================================
+--- gcc-4.8.0.orig/gcc/configure.ac
++++ gcc-4.8.0/gcc/configure.ac
+@@ -1901,6 +1901,7 @@ STMP_FIXINC=stmp-fixinc		AC_SUBST(STMP_F
+ if test x$build != x$host || test "x$coverage_flags" != x
+ then
+     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
++    BUILD_CXXFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
+     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
+ fi
  
-+ALL_BUILD_CFLAGS = $(T_CFLAGS) $(CFLAGS-$@) \
-+  $(CFLAGS) $(INTERNAL_CFLAGS) @DEFS@
-+
- # The C++ version.
- ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@) $(CXXFLAGS) $(INTERNAL_CFLAGS) \
-   $(COVERAGE_FLAGS) $(NOEXCEPTION_FLAGS) $(WARN_CXXFLAGS) @DEFS@
- 
-+ALL_BUILD_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@) $(CXXFLAGS) $(INTERNAL_CFLAGS) \
-+  $(NOEXCEPTION_FLAGS) @DEFS@
-+
- # Likewise.  Put INCLUDES at the beginning: this way, if some autoconf macro
- # puts -I options in CPPFLAGS, our include files in the srcdir will always
- # win against random include files in /usr/include.
-- 
1.8.3.1


