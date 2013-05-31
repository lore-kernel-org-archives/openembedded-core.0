Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 28A3462222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4VFGZV9015491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2013 08:16:35 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 31 May 2013 08:16:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2013 10:23:10 -0500
Message-ID: <1370013790-22303-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] gcc: Workaround for compiler flag mismatch
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
X-List-Received-Date: Fri, 31 May 2013 15:16:36 -0000
Content-Type: text/plain

When cross compiling the target compiler, both the cross-compiler
and the host compiler are used.  However, the -W options used were
discovered from the cross-compiler and may be incompatible with the
host compiler.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/gcc-4.8-build-args.patch           | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index a9786da..80bd02c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -66,6 +66,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
 	   file://0035-wcast-qual-PR-55383.patch \
 	   file://gcc-4.8-PR56797.patch \
+	   file://gcc-4.8-build-args.patch \
 	  "
 SRC_URI[md5sum] = "e6040024eb9e761c3bea348d1fa5abb0"
 SRC_URI[sha256sum] = "b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch b/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch
new file mode 100644
index 0000000..95f39bb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/gcc-4.8-build-args.patch
@@ -0,0 +1,51 @@
+When cross compiling a target gcc, target flags may be used on the host
+
+Configure identifies a number of warning flags (WARN_CFLAGS and 
+WARN_CXXFLAGS) from the $CC value.  The cross compiler may be different
+from the host compiler and may not support the same set of flags.  This
+leads to problems such as:
+
+cc1plus: error: unrecognized command line option "-Wno-narrowing"
+cc1plus: error: unrecognized command line option "-Wno-overlength-strings"
+
+Work around this problem by removing the warning flags from the
+BUILD_*FLAGS values.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur gcc-4.8.0.orig/gcc/configure.ac gcc-4.8.0/gcc/configure.ac
+--- gcc-4.8.0.orig/gcc/configure.ac	2013-05-29 14:44:24.960853593 -0500
++++ gcc-4.8.0/gcc/configure.ac	2013-05-31 01:34:09.518775962 -0500
+@@ -1892,8 +1892,8 @@
+ # These are the normal (build=host) settings:
+ CC_FOR_BUILD='$(CC)'		AC_SUBST(CC_FOR_BUILD)
+ CXX_FOR_BUILD='$(CXX)'		AC_SUBST(CXX_FOR_BUILD)
+-BUILD_CFLAGS='$(ALL_CFLAGS)'	AC_SUBST(BUILD_CFLAGS)
+-BUILD_CXXFLAGS='$(ALL_CXXFLAGS)' AC_SUBST(BUILD_CXXFLAGS)
++BUILD_CFLAGS='$(ALL_BUILD_CFLAGS)'	AC_SUBST(BUILD_CFLAGS)
++BUILD_CXXFLAGS='$(ALL_BUILD_CXXFLAGS)' AC_SUBST(BUILD_CXXFLAGS)
+ BUILD_LDFLAGS='$(LDFLAGS)'	AC_SUBST(BUILD_LDFLAGS)
+ STMP_FIXINC=stmp-fixinc		AC_SUBST(STMP_FIXINC)
+ 
+diff -ur gcc-4.8.0.orig/gcc/Makefile.in gcc-4.8.0/gcc/Makefile.in
+--- gcc-4.8.0.orig/gcc/Makefile.in	2013-05-29 14:44:24.369853593 -0500
++++ gcc-4.8.0/gcc/Makefile.in	2013-05-31 01:34:30.360776427 -0500
+@@ -989,10 +989,16 @@
+ ALL_CFLAGS = $(T_CFLAGS) $(CFLAGS-$@) \
+   $(CFLAGS) $(INTERNAL_CFLAGS) $(COVERAGE_FLAGS) $(WARN_CFLAGS) @DEFS@
+ 
++ALL_BUILD_CFLAGS = $(T_CFLAGS) $(CFLAGS-$@) \
++  $(CFLAGS) $(INTERNAL_CFLAGS) @DEFS@
++
+ # The C++ version.
+ ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@) $(CXXFLAGS) $(INTERNAL_CFLAGS) \
+   $(COVERAGE_FLAGS) $(NOEXCEPTION_FLAGS) $(WARN_CXXFLAGS) @DEFS@
+ 
++ALL_BUILD_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@) $(CXXFLAGS) $(INTERNAL_CFLAGS) \
++  $(NOEXCEPTION_FLAGS) @DEFS@
++
+ # Likewise.  Put INCLUDES at the beginning: this way, if some autoconf macro
+ # puts -I options in CPPFLAGS, our include files in the srcdir will always
+ # win against random include files in /usr/include.
-- 
1.8.3.rc1.25.g423ecb0


