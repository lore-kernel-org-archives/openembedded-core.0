Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9U1b-00069Q-Go
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 06:49:07 +0200
Received: by mail-ie0-f175.google.com with SMTP id c11so2406212ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 21:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FjTm94MkEdP9z23uKf5MBEAtZZNV99ktdh+I9MOXgUg=;
	b=VFH+zUrby1CB/5n+NUWyeVoMUThEGwkE8MeBMrnfZyNcyAdaZfO3LRJU3fppKVP7TD
	KuJaY9ZeCm9kDPAjySfU+1IsIwBia+U4C6jQS7V7mPTlXS/u8yVBF4uo/fM+7ZDmDuQW
	pc3PnCT+IlSEO0BTdx9m8JJgaF6jSDKl+CsWLI5u8DKfg3kqWv/DE5pPfflr/y7Ru0Yf
	3nIEZ27vpcSpoRi7itcczMpRKHtEQSjXH7lir++PW48cWy2Dt9N6wqbVmW3Zc1g8M792
	13BZMMwdSYjZBUc09FTOQ3IrIWdFfSw0ugXr82AQpVxzzNGCOBNBuYt2UjQJo2LhWO/f
	6eQQ==
Received: by 10.50.182.231 with SMTP id eh7mr20532486igc.42.1346906205575;
	Wed, 05 Sep 2012 21:36:45 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id xm2sm2662687igb.3.2012.09.05.21.36.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 21:36:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 21:35:47 -0700
Message-Id: <0630c60d49ce26684408ea0f71d6d0b268258979.1346905978.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
References: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346905978.git.raj.khem@gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] gcc-4.7: Backport libgcc fixes to appease the new build sequence
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
X-List-Received-Date: Thu, 06 Sep 2012 04:49:07 -0000

This makes the libgcc builds identical when done with gcc-cross-initial
or final gcc-cross. Since eglibc only sees gcc-cross-initial it is
important that the final libgcc that appears on root file system is same
as the one against which eglibc was built.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    4 +-
 ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 ++++++++++++++++++++
 ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 +++++++++++
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index b455b28..d8e6421 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r12"
+PR = "r13"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -77,6 +77,8 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://libtool.patch \
 	   file://gcc-armv4-pass-fix-v4bx-to-ld.patch \
 	   file://ppc_no_crtsavres.patch \
+	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
+	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch b/meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
new file mode 100644
index 0000000..b6f8f94
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
@@ -0,0 +1,93 @@
+From b78f422ee83d279a83c62491b252cfec5b94e92a Mon Sep 17 00:00:00 2001
+From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Aug 2012 08:36:23 +0000
+Subject: [PATCH] 	* Makefile.in (vis_hide, gen-hide-list): Do not make
+ definitions 	depend on --enable-shared. 
+ ($(lib1asmfuncs-o)): Use %.vis files independent of 
+ --enable-shared. 	* static-object.mk
+ ($(base)$(objext), $(base).vis) 
+ ($(base)_s$(objext)): Use same rules for visibility
+ handling as in 	shared-object.mk.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@190588 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ libgcc/ChangeLog        |   10 ++++++++++
+ libgcc/Makefile.in      |   16 ++++------------
+ libgcc/static-object.mk |   10 ++++++++--
+ 3 files changed, 22 insertions(+), 14 deletions(-)
+
+Upstream-Status: Backport
+
+-Khem 
+05-Sep-2012
+
+Index: gcc-4_7-branch/libgcc/Makefile.in
+===================================================================
+--- gcc-4_7-branch.orig/libgcc/Makefile.in	2012-08-21 22:33:20.000000000 -0700
++++ gcc-4_7-branch/libgcc/Makefile.in	2012-09-05 17:30:28.572998745 -0700
+@@ -362,6 +362,7 @@
+   ifneq ($(LIBUNWIND),)
+     install-libunwind = install-libunwind
+   endif
++endif
+ 
+ # For -fvisibility=hidden.  We need both a -fvisibility=hidden on
+ # the command line, and a #define to prevent libgcc2.h etc from
+@@ -385,11 +386,8 @@
+ gen-hide-list = echo > $@
+ endif
+ 
+-else
+-# Not enable_shared.
++ifneq ($(enable_shared),yes)
+ iterator = $(srcdir)/empty.mk $(patsubst %,$(srcdir)/static-object.mk,$(iter-items))
+-vis_hide =
+-gen-hide-list = echo > \$@
+ endif
+ 
+ LIB2ADD += enable-execute-stack.c
+@@ -438,7 +436,6 @@
+ 		       $(LIB2_DIVMOD_FUNCS))
+ 
+ # Build "libgcc1" (assembly) components.
+-ifeq ($(enable_shared),yes)
+ 
+ lib1asmfuncs-o = $(patsubst %,%$(objext),$(LIB1ASMFUNCS))
+ $(lib1asmfuncs-o): %$(objext): $(srcdir)/config/$(LIB1ASMSRC) %.vis
+@@ -450,14 +447,9 @@
+ lib1asmfuncs-s-o = $(patsubst %,%_s$(objext),$(LIB1ASMFUNCS))
+ $(lib1asmfuncs-s-o): %_s$(objext): $(srcdir)/config/$(LIB1ASMSRC)
+ 	$(gcc_s_compile) -DL$* -xassembler-with-cpp -c $<
+-libgcc-s-objects += $(lib1asmfuncs-s-o)
+-
+-else
++ifeq ($(enable_shared),yes)
+ 
+-lib1asmfuncs-o = $(patsubst %,%$(objext),$(LIB1ASMFUNCS))
+-$(lib1asmfuncs-o): %$(objext): $(srcdir)/config/$(LIB1ASMSRC)
+-	$(gcc_compile) -DL$* -xassembler-with-cpp -c $<
+-libgcc-objects += $(lib1asmfuncs-o)
++libgcc-s-objects += $(lib1asmfuncs-s-o)
+ 
+ endif
+ 
+Index: gcc-4_7-branch/libgcc/static-object.mk
+===================================================================
+--- gcc-4_7-branch.orig/libgcc/static-object.mk	2012-08-21 22:33:20.000000000 -0700
++++ gcc-4_7-branch/libgcc/static-object.mk	2012-09-05 17:30:28.572998745 -0700
+@@ -24,7 +24,13 @@
+ endif
+ endif
+ 
+-$(base)$(objext): $o
+-	$(gcc_compile) -c -xassembler-with-cpp $<
++$(base)$(objext): $o $(base).vis
++	$(gcc_compile) -c -xassembler-with-cpp -include $*.vis $<
++
++$(base).vis: $(base)_s$(objext)
++	$(gen-hide-list)
++
++$(base)_s$(objext): $o
++	$(gcc_s_compile) -c -xassembler-with-cpp $<
+ 
+ endif
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch b/meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
new file mode 100644
index 0000000..15034f7
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
@@ -0,0 +1,49 @@
+From 935475158f45b9c55a54647543c0402b4b3043ae Mon Sep 17 00:00:00 2001
+From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sun, 19 Aug 2012 15:11:40 +0000
+Subject: [PATCH] 	* crtstuff.c (USE_PT_GNU_EH_FRAME): Define for
+ systems using glibc 	even if inhibit_libc.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@190517 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ libgcc/ChangeLog  |    5 +++++
+ libgcc/crtstuff.c |   16 +++++++++++++++-
+ 2 files changed, 20 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport
+
+-Khem 05-Sep-2012
+Index: gcc-4_7-branch/libgcc/crtstuff.c
+===================================================================
+--- gcc-4_7-branch.orig/libgcc/crtstuff.c	2012-08-21 22:33:20.000000000 -0700
++++ gcc-4_7-branch/libgcc/crtstuff.c	2012-09-05 17:28:49.248994968 -0700
+@@ -1,7 +1,7 @@
+ /* Specialized bits of code needed to support construction and
+    destruction of file-scope objects in C++ code.
+    Copyright (C) 1991, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
+-   2002, 2003, 2004, 2005, 2006, 2007, 2009, 2010, 2011
++   2002, 2003, 2004, 2005, 2006, 2007, 2009, 2010, 2011, 2012
+    Free Software Foundation, Inc.
+    Contributed by Ron Guilmette (rfg@monkeys.com).
+ 
+@@ -113,6 +113,20 @@
+ #  define USE_PT_GNU_EH_FRAME
+ # endif
+ #endif
++
++#if defined(OBJECT_FORMAT_ELF) \
++    && !defined(OBJECT_FORMAT_FLAT) \
++    && defined(HAVE_LD_EH_FRAME_HDR) \
++    && !defined(CRTSTUFFT_O) \
++    && defined(inhibit_libc) \
++    && (defined(__GLIBC__) || defined(__gnu_linux__) || defined(__GNU__))
++/* On systems using glibc, an inhibit_libc build of libgcc is only
++   part of a bootstrap process.  Build the same crt*.o as would be
++   built with headers present, so that it is not necessary to build
++   glibc more than once for the bootstrap to converge.  */
++# define USE_PT_GNU_EH_FRAME
++#endif
++
+ #if defined(EH_FRAME_SECTION_NAME) && !defined(USE_PT_GNU_EH_FRAME)
+ # define USE_EH_FRAME_REGISTRY
+ #endif
-- 
1.7.9.5



