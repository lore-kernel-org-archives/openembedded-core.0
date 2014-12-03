Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 11CEE60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 01:18:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2014 17:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="492641394"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.114])
	by orsmga003.jf.intel.com with ESMTP; 02 Dec 2014 17:14:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 17:18:08 -0800
Message-Id: <bdf8a128a4e72bae07ca9da7226c16c84ea65c3f.1417552133.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
In-Reply-To: <cover.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] valgrind: Upgrade to 3.10.0
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
X-List-Received-Date: Wed, 03 Dec 2014 01:18:12 -0000

Rebase existing patches
Add patch to fix rpath issue with ptest

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../valgrind/remove-arm-variant-specific.patch     | 20 +++++++++--------
 .../valgrind/remove-ppc-tests-failing-build.patch  | 26 +++++++++++-----------
 .../valgrind/valgrind/valgrind-remove-rpath.patch  | 25 +++++++++++++++++++++
 .../{valgrind_3.9.0.bb => valgrind_3.10.0.bb}      |  6 ++---
 4 files changed, 52 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.9.0.bb => valgrind_3.10.0.bb} (94%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
index 46dea60..f84bf9a 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
@@ -8,13 +8,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 
-diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 2a19f5b..ccdeb77 100644
---- a/none/tests/arm/Makefile.am
-+++ b/none/tests/arm/Makefile.am
-@@ -16,15 +16,16 @@ EXTRA_DIST = \
- 		vcvt_fixed_float_VFP.vgtest \
- 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest
+Index: valgrind-3.10.0/none/tests/arm/Makefile.am
+===================================================================
+--- valgrind-3.10.0.orig/none/tests/arm/Makefile.am
++++ valgrind-3.10.0/none/tests/arm/Makefile.am
+@@ -17,15 +17,16 @@ EXTRA_DIST = \
+ 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest \
+ 	vfpv4_fma.stdout.exp vfpv4_fma.stderr.exp vfpv4_fma.vgtest
  
 +# For yocto:
 +#  Only include tests that don't require Thumb.
@@ -31,8 +31,8 @@ index 2a19f5b..ccdeb77 100644
 -	v6intThumb \
  	v6media \
  	vcvt_fixed_float_VFP \
- 	vfp
-@@ -34,32 +35,3 @@ AM_CXXFLAGS  += @FLAG_M32@
+ 	vfp \
+@@ -36,34 +37,3 @@ AM_CXXFLAGS  += @FLAG_M32@
  AM_CCASFLAGS += @FLAG_M32@
  
  allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
@@ -65,3 +65,5 @@ index 2a19f5b..ccdeb77 100644
 -intdiv_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
 -ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
 -ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
+-
+-vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a15 -mfpu=vfpv4 -marm
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
index 2a14e18..1c640ff 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
@@ -36,10 +36,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 
-diff --git a/memcheck/tests/ppc32/Makefile.am b/memcheck/tests/ppc32/Makefile.am
-index bd70eea..1436e8e 100644
---- a/memcheck/tests/ppc32/Makefile.am
-+++ b/memcheck/tests/ppc32/Makefile.am
+Index: valgrind-3.10.0/memcheck/tests/ppc32/Makefile.am
+===================================================================
+--- valgrind-3.10.0.orig/memcheck/tests/ppc32/Makefile.am
++++ valgrind-3.10.0/memcheck/tests/ppc32/Makefile.am
 @@ -7,8 +7,7 @@ EXTRA_DIST = $(noinst_SCRIPTS) \
  	power_ISA2_05.stderr.exp power_ISA2_05.stdout.exp power_ISA2_05.vgtest \
  	power_ISA2_05.stdout.exp_Without_FPPO
@@ -50,11 +50,11 @@ index bd70eea..1436e8e 100644
  
  power_ISA2_05_CFLAGS = $(AM_CFLAGS) $(WERROR) -Winline -Wall -Wshadow -g \
  		-I$(top_srcdir)/include @FLAG_M32@
-diff --git a/none/tests/ppc32/Makefile.am b/none/tests/ppc32/Makefile.am
-index 4f581b6..91ce7e7 100644
---- a/none/tests/ppc32/Makefile.am
-+++ b/none/tests/ppc32/Makefile.am
-@@ -50,16 +50,8 @@ check_PROGRAMS = \
+Index: valgrind-3.10.0/none/tests/ppc32/Makefile.am
+===================================================================
+--- valgrind-3.10.0.orig/none/tests/ppc32/Makefile.am
++++ valgrind-3.10.0/none/tests/ppc32/Makefile.am
+@@ -52,16 +52,8 @@ check_PROGRAMS = \
  	allexec \
  	bug129390-ppc32 \
  	bug139050-ppc32 \
@@ -67,9 +67,9 @@ index 4f581b6..91ce7e7 100644
 -	test_isa_2_07_part1 \
 -	test_isa_2_07_part2 \
 -	test_tm \
--	test_touch_tm
+-	test_touch_tm \
 +	ldstrev lsw mftocrf mcrfs test_fx test_gx \
-+	twi tw xlc_dbl_u32 power6_bcmp 
++	twi tw xlc_dbl_u32 power6_bcmp \
+ 	ldst_multiple \
+ 	data-cache-instructions
  
- AM_CFLAGS    += @FLAG_M32@
- AM_CXXFLAGS  += @FLAG_M32@
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
new file mode 100644
index 0000000..07a2726
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-remove-rpath.patch
@@ -0,0 +1,25 @@
+
+Upstream-Status: Inapporpiate [embedded config]
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: valgrind-3.10.0/none/tests/Makefile.am
+===================================================================
+--- valgrind-3.10.0.orig/none/tests/Makefile.am
++++ valgrind-3.10.0/none/tests/Makefile.am
+@@ -280,7 +280,6 @@ threaded_fork_LDADD	= -lpthread
+ threadederrno_LDADD	= -lpthread
+ tls_SOURCES		= tls.c tls2.c
+ tls_DEPENDENCIES	= tls.so tls2.so
+-tls_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests
+ tls_LDADD		= tls.so tls2.so -lpthread
+ tls_so_SOURCES		= tls_so.c
+ tls_so_DEPENDENCIES	= tls2.so
+@@ -288,7 +287,7 @@ if VGCONF_OS_IS_DARWIN
+  tls_so_LDFLAGS		= -dynamic -dynamiclib -all_load -fpic
+  tls_so_LDADD		= `pwd`/tls2.so
+ else
+- tls_so_LDFLAGS		= -Wl,-rpath,$(abs_top_builddir)/none/tests -shared -fPIC
++ tls_so_LDFLAGS		= -shared -fPIC
+  tls_so_LDADD		= tls2.so
+ endif
+ tls_so_CFLAGS		= $(AM_CFLAGS) -fPIC
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
similarity index 94%
rename from meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
index c415e77..4c6e1a7 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r8"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
@@ -19,12 +18,13 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://force-nostabs.patch \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
+           file://valgrind-remove-rpath.patch \
            file://add-ptest.patch \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "0947de8112f946b9ce64764af7be6df2"
-SRC_URI[sha256sum] = "e6af71a06bc2534541b07743e1d58dc3caf744f38205ca3e5b5a0bdf372ed6f0"
+SRC_URI[md5sum] = "7c311a72a20388aceced1aa5573ce970"
+SRC_URI[sha256sum] = "03047f82dfc6985a4c7d9d2700e17bc05f5e1a0ca6ad902e5d6c81aeb720edc9"
 
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
-- 
1.8.3.1


