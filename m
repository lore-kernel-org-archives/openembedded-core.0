Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EB9CF731B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 18:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,365,1464678000"; d="scan'208";a="995612655"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 18:49:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:49:35 -0700
Message-Id: <94dbef78ead50f15af862cf8ddb9332bbe0126e9.1468546499.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: [krogoth][PATCH 4/8] rpm: Fix build with gcc6
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:02 -0000

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: e9c86d85460f45011bd978e1495a2b802d733020)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch | 54 +++++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb         |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch

diff --git a/meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch b/meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
new file mode 100644
index 0000000..0a372c6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
@@ -0,0 +1,54 @@
+gcc6 has fixed a long standing c++ include issue where <cheader>
+was different from <header.h> inclusion via
+
+https://gcc.gnu.org/ml/libstdc++/2016-01/msg00025.html
+
+and its also descibed in https://gcc.gnu.org/gcc-6/porting_to.html
+rpmio component uses some .cpp and .cc fies which need to use
+C stdlib.h from C library and not the C++ libstdc++ header
+therefore we pass _GLIBCXX_INCLUDE_NEXT_C_HEADERS so that it
+keeps the old behavior
+
+/a/build/tmp/sysroots/raspberrypi2/usr/include/c++/6.0.1/cstdlib:143:11: error: '::getenv' has not been declared
+   using ::getenv;
+           ^~~~~~
+In file included from ../../rpm-5.4.15/system.h:201:0,
+                 from ../../rpm-5.4.15/rpmio/rpmjs.cpp:1:
+/a/build/tmp/sysroots/raspberrypi2/usr/include/c++/6.0.1/stdlib.h:62:12: error: 'std::getenv' has not been declared
+ using std::getenv;
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: rpm-5.4.15/rpmio/Makefile.am
+===================================================================
+--- rpm-5.4.15.orig/rpmio/Makefile.am
++++ rpm-5.4.15/rpmio/Makefile.am
+@@ -151,7 +151,7 @@ librpmio_la_SOURCES = \
+ 	groestl.c hamsi.c jh.c keccak.c lane.c luffa.c md2.c md6.c radiogatun.c\
+ 	salsa10.c salsa20.c shabal.c shavite3.c simd.c skein.c tib3.c tiger.c \
+ 	rpmgit.c rpmio-stub.c \
+-	rpmjs.cpp rpmjsio.c rpmkeyring.c \
++	rpmjni.cc rpmjs.cpp rpmjsio.c rpmkeyring.c \
+ 	rpmnix.c rpmodbc.c rpmsql.c set.c \
+ 	ar.c \
+ 	argv.c \
+@@ -195,7 +195,6 @@ librpmio_la_SOURCES = \
+ 	rpmhook.c \
+ 	rpmio.c \
+ 	rpmiob.c \
+-	rpmjni.cc \
+ 	rpmku.c \
+ 	rpmlog.c \
+ 	rpmltc.c \
+@@ -279,7 +278,9 @@ keccak.lo: $(top_srcdir)/rpmio/keccak.c
+ #rpmjs.lo: $(top_srcdir)/rpmio/rpmjs.c
+ #	@$(LTCOMPILE) -O0 -c $<
+ rpmjs.lo: $(top_srcdir)/rpmio/rpmjs.cpp
+-	@$(LTCOMPILE) -O0 -c $<
++	@$(LTCOMPILE) -O0 -c -D_GLIBCXX_INCLUDE_NEXT_C_HEADERS $<
++rpmjni.lo: $(top_srcdir)/rpmio/rpmjni.cc
++	@$(LTCOMPILE) -O0 -c -D_GLIBCXX_INCLUDE_NEXT_C_HEADERS $<
+ 
+ YACC = byacc -d
+ getdate.c: getdate.y
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index f2c12d2..7ebd5e9 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -116,6 +116,7 @@ SRC_URI += " \
 	   file://rpm-fix-lua-tests-compilation-failure.patch \
 	   file://rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch \
 	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
+	   file://gcc6-stdlib.patch \
 "
 
 # OE specific changes
@@ -344,7 +345,7 @@ EXTRA_OECONF += "--verbose \
 		--program-prefix= \
 		YACC=byacc"
 
-CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
+CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE -D_GLIBCXX_INCLUDE_NEXT_C_HEADERS"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-- 
2.7.4


