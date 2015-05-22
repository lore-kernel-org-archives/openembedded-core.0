Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 884E67324E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 16:53:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2015 09:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="733835065"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2015 09:53:39 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 09:52:37 -0700
Message-Id: <1432313557-21793-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] eglibc-use-option-groups: Conditionally exclude c++ tests
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
X-List-Received-Date: Fri, 22 May 2015 16:53:39 -0000

Some test programs written in c++ are still included in spite of
"libc-cxx-tests" being omitted from DISTRO_FEATURES_LIBC.
All .cc programs are compiled with g++.
g++ automatically specifies linking against the C++ library.
This patch conditionally excludes the following tests as well:

  bug-atexit3-lib.cc
  tst-cancel24.cc
  tst-cancel24-static.cc
  tst-unique3lib.cc
  tst-unique3lib2.cc
  tst-unique4lib.cc
  tst-unique3.cc
  tst-unique4.cc

Tested with DISTRO_FEATURES_LIBC_remove = " libc-cxx-tests"

[YOCTO #7003]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../glibc/glibc/eglibc-use-option-groups.patch     | 82 ++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 439b4a9..da92203 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -491,19 +491,72 @@ Index: git/dlfcn/Makefile
  subdir		:= dlfcn
  
  include ../Makeconfig
-@@ -36,8 +38,11 @@ endif
+@@ -36,14 +38,18 @@ endif
  ifeq (yes,$(build-shared))
  tests = glrefmain failtest tst-dladdr default errmsg1 tstcxaatexit \
  	bug-dlopen1 bug-dlsym1 tst-dlinfo bug-atexit1 bug-atexit2 \
 -	bug-atexit3 tstatexit bug-dl-leaf tst-rec-dlopen
 +	tstatexit bug-dl-leaf tst-rec-dlopen
- endif
-+
 +tests-$(OPTION_EGLIBC_CXX_TESTS) += bug-atexit3
-+
+ endif
  modules-names = glreflib1 glreflib2 glreflib3 failtestmod defaultmod1 \
  		defaultmod2 errmsg1mod modatexit modcxaatexit \
  		bug-dlsym1-lib1 bug-dlsym1-lib2 bug-atexit1-lib \
+-		bug-atexit2-lib bug-atexit3-lib bug-dl-leaf-lib \
++		bug-atexit2-lib bug-dl-leaf-lib \
+ 		bug-dl-leaf-lib-cb moddummy1 moddummy2
+ 
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++modules-names += bug-atexit3-lib
++endif
+ failtestmod.so-no-z-defs = yes
+ glreflib2.so-no-z-defs = yes
+ errmsg1mod.so-no-z-defs = yes
+Index: git/elf/Makefile
+===================================================================
+--- git.orig/elf/Makefile
++++ git/elf/Makefile
+@@ -17,6 +17,8 @@
+ 
+ # Makefile for elf subdirectory of GNU C Library.
+ 
++include ../option-groups.mak
++
+ subdir		:= elf
+ 
+ include ../Makeconfig
+@@ -144,10 +146,11 @@ tests += loadtest restest1 preloadtest loadfail multiload origtest resolvfail \
+ 	 unload3 unload4 unload5 unload6 unload7 unload8 tst-global1 order2 \
+ 	 tst-audit1 tst-audit2 tst-audit8 tst-audit9 \
+ 	 tst-stackguard1 tst-addr1 tst-thrlock \
+-	 tst-unique1 tst-unique2 tst-unique3 tst-unique4 \
++	 tst-unique1 tst-unique2 \
+ 	 tst-initorder tst-initorder2 tst-relsort1 tst-null-argv \
+ 	 tst-ptrguard1
+ #	 reldep9
++tests-$(OPTION_EGLIBC_CXX_TESTS) += tst-unique3 tst-unique4
+ ifeq ($(build-hardcoded-path-in-tests),yes)
+ tests += tst-dlopen-aout
+ endif
+@@ -205,8 +208,6 @@ modules-names = testobj1 testobj2 testobj3 testobj4 testobj5 testobj6 \
+ 		tst-unique1mod1 tst-unique1mod2 \
+ 		tst-unique2mod1 tst-unique2mod2 \
+ 		tst-auditmod9a tst-auditmod9b \
+-		tst-unique3lib tst-unique3lib2 \
+-		tst-unique4lib \
+ 		tst-initordera1 tst-initorderb1 \
+ 		tst-initordera2 tst-initorderb2 \
+ 		tst-initordera3 tst-initordera4 \
+@@ -214,6 +215,9 @@ modules-names = testobj1 testobj2 testobj3 testobj4 testobj5 testobj6 \
+ 		tst-initorder2d \
+ 		tst-relsort1mod1 tst-relsort1mod2 tst-array2dep \
+ 		tst-array5dep tst-null-argv-lib
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++modules-names += tst-unique3lib tst-unique3lib2 tst-unique4lib 
++endif
+ ifeq (yesyes,$(have-fpie)$(build-shared))
+ modules-names += tst-piemod1
+ tests += tst-pie1 tst-pie2
 Index: git/elf/dl-support.c
 ===================================================================
 --- git.orig/elf/dl-support.c
@@ -3103,6 +3156,27 @@ Index: git/nptl/Makefile
  # Files which must not be linked with libpthread.
  tests-nolibpthread = tst-unload
  
+@@ -363,12 +377,18 @@
+ 		    $(common-objpfx)libc.a
+ 
+ tests-static += tst-locale1 tst-locale2 tst-stackguard1-static \
+-		tst-cancel21-static tst-cancel24-static tst-cond8-static \
++		tst-cancel21-static tst-cond8-static \
+ 		tst-mutex8-static tst-mutexpi8-static tst-sem11-static \
+ 		tst-sem12-static
+-tests += tst-stackguard1-static tst-cancel21-static tst-cancel24-static \
++
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++tests-static += tst-cancel24-static
++endif
++
++tests += tst-stackguard1-static tst-cancel21-static \
+ 	 tst-cond8-static tst-mutex8-static tst-mutexpi8-static \
+ 	 tst-sem11-static tst-sem12-static
++tests-$(OPTION_EGLIBC_CXX_TESTS) += tst-cancel24-static
+ xtests-static += tst-setuid1-static
+ 
+ # These tests are linked with libc before libpthread
 Index: git/nptl/pthread_create.c
 ===================================================================
 --- git.orig/nptl/pthread_create.c
-- 
1.9.1


