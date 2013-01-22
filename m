Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TxfvH-00027t-OD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 16:38:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2013 07:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,515,1355126400"; d="scan'208";a="280582552"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2013 07:22:29 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2013 17:29:15 +0200
Message-Id: <1358868555-2289-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] valgrind: update to 3.8.1
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
X-List-Received-Date: Tue, 22 Jan 2013 15:38:05 -0000

Changed license copyright notice 2011->2012
remove unnecessary patches
built for x86, 86-64, ppc

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../valgrind/valgrind-3.7.0/configure-fix.patch    |   40 -----------------
 .../valgrind-3.7.0/fix_for_automake_1.11.2.patch   |   45 --------------------
 ...ind-3.7.0-fix-error-of-reading-debug-info.patch |   33 --------------
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |    0
 .../configure-with-newer-glibc.patch               |   13 +++---
 .../fix_issue_caused_by_ccache.patch               |    0
 .../fix_unsupporting_kernel_3.patch                |    0
 .../fixed-perl-path.patch                          |    0
 .../{valgrind_3.7.0.bb => valgrind_3.8.1.bb}       |   13 ++----
 9 files changed, 11 insertions(+), 133 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_for_automake_1.11.2.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/configure-with-newer-glibc.patch (79%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/fix_issue_caused_by_ccache.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/fix_unsupporting_kernel_3.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.7.0 => valgrind-3.8.1}/fixed-perl-path.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.7.0.bb => valgrind_3.8.1.bb} (74%)

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
deleted file mode 100644
index 1f4bd7e..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-To recognize gcc version from poky in configure.in
-Added GLIBC 2.15 stanza to supported GLIBCs
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: valgrind-3.7.0/configure.in
-===================================================================
---- valgrind-3.7.0.orig/configure.in
-+++ valgrind-3.7.0/configure.in
-@@ -104,11 +104,13 @@ AC_MSG_CHECKING([for a supported version
- # 
- # i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
- # i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
-+# ARCH-VENDOR-OS-gcc (GCC) VERSION Copyright
- #
- [gcc_version=`${CC} --version \
-              | head -n 1 \
-              | $SED 's/i686-apple-darwin10//' \
-              | $SED 's/i686-apple-darwin11//' \
-+             | $SED 's/.*GCC[^0-9]*//' \
-              | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`]
- 
- is_clang="notclang"
-@@ -779,6 +781,13 @@ case "${GLIBC_VERSION}" in
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.15)
-+	AC_MSG_RESULT(2.15 family)
-+	AC_DEFINE([GLIBC_2_15], 1, [Define to 1 if you're using glibc 2.15.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_for_automake_1.11.2.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_for_automake_1.11.2.patch
deleted file mode 100644
index 866facf..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_for_automake_1.11.2.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Pending
-
-automake version 1.11.2 has made use of dir variables more strict.
-the use of pkglibdir with DATA var results in automake errors.
-
-This commits uses pkgdatadir var instead of pkglibdir to avoid 
-the strict check errors.
-
-RP 2012/1/4
-
-Index: valgrind-3.7.0/Makefile.am
-===================================================================
---- valgrind-3.7.0.orig/Makefile.am	2012-01-04 15:55:07.034044860 +0000
-+++ valgrind-3.7.0/Makefile.am	2012-01-04 15:55:55.034035120 +0000
-@@ -61,7 +61,7 @@
- # default.supp, as it is built from the base .supp files at compile-time.
- dist_noinst_DATA = $(SUPP_FILES)
- 
--pkglib_DATA = default.supp
-+pkgdata_DATA = default.supp
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = valgrind.pc
-Index: valgrind-3.7.0/coregrind/Makefile.am
-===================================================================
---- valgrind-3.7.0.orig/coregrind/Makefile.am	2012-01-04 15:55:02.090043851 +0000
-+++ valgrind-3.7.0/coregrind/Makefile.am	2012-01-04 15:55:30.270044097 +0000
-@@ -495,7 +495,7 @@
- 	m_gdbserver/powerpc-altivec64l.xml
- 
- # so as to make sure these get copied into the install tree
--pkglib_DATA  = $(GDBSERVER_XML_FILES)
-+pkgdata_DATA  = $(GDBSERVER_XML_FILES)
- 
- # so as to make sure these get copied into the tarball
- EXTRA_DIST  += $(GDBSERVER_XML_FILES)
-@@ -506,7 +506,7 @@
- 
- all-local: inplace-noinst_PROGRAMS inplace-noinst_DSYMS
- 	mkdir -p $(inplacedir); \
--	for f in $(pkglib_DATA); do \
-+	for f in $(pkgdata_DATA); do \
- 	  rm -f $(inplacedir)/$$f; \
- 	  ln -f -s ../$(subdir)/$$f $(inplacedir); \
- 	done
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
deleted file mode 100644
index b1626f0..0000000
--- a/meta/recipes-devtools/valgrind/valgrind-3.7.0/valgrind-3.7.0-fix-error-of-reading-debug-info.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-fix debug info reading error when do memcheck on ppc targets
-    following is the error message:
-        --2263-- WARNING: Serious error when reading debug info
-        --2263-- When reading debug info from /lib/ld-2.13.so:
-        --2263-- Can't make sense of .got section mapping
-        --2263-- WARNING: Serious error when reading debug info
-        --2263-- When reading debug info from /home/root/lzh:
-        --2263-- Can't make sense of .data section mapping
-        --2263-- WARNING: Serious error when reading debug info
-        --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_core-ppc32-linux.so:
-        --2263-- Can't make sense of .data section mapping
-        --2263-- WARNING: Serious error when reading debug info
-        --2263-- When reading debug info from /usr/lib/valgrind/vgpreload_memcheck-ppc32-linux.so:
-        --2263-- Can't make sense of .data section mapping
-        --2263-- WARNING: Serious error when reading debug info
-        --2263-- When reading debug info from /lib/libc-2.13.so:
-        --2263-- Can't make sense of .data section mapping
-
-Signed-off-by: Zhenhua Luo <b19537@freescale.com>
-
---- a/coregrind/m_debuginfo/readelf.c	2012-09-11 21:45:36.696462313 -0500
-+++ b/coregrind/m_debuginfo/readelf.c	2012-09-11 21:45:49.913463615 -0500
-@@ -1539,7 +1539,7 @@
-                 && phdr->p_offset < di->fsm.rw_map_foff + di->fsm.rw_map_size
-                 && phdr->p_offset + phdr->p_filesz 
-                    <= di->fsm.rw_map_foff + di->fsm.rw_map_size
--                && (phdr->p_flags & (PF_R | PF_W | PF_X)) == (PF_R | PF_W)) {
-+                && (phdr->p_flags & (PF_R | PF_W | PF_X)) >= (PF_R | PF_W)) {
-                if (n_rw == N_RX_RW_AREAS) {
-                   ML_(symerr)(di, True,
-                               "N_RX_RW_AREAS is too low; "
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.8.1/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-newer-glibc.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
similarity index 79%
rename from meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-newer-glibc.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
index b369de8..d3cea23 100644
--- a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-newer-glibc.patch
+++ b/meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
@@ -2,13 +2,14 @@ Add case for glibc 2.16 and correct error message to denote support until 2.16
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Radu Moisan <radu.moisan@intel.com>
 
 Upstream-Status: Pending
-Index: valgrind-3.7.0/configure.in
+Index: valgrind-3.8.1/configure.in
 ===================================================================
---- valgrind-3.7.0.orig/configure.in
-+++ valgrind-3.7.0/configure.in
-@@ -788,6 +788,20 @@ case "${GLIBC_VERSION}" in
+--- valgrind-3.8.1.orig/configure.in
++++ valgrind-3.8.1/configure.in
+@@ -910,6 +910,20 @@ case "${GLIBC_VERSION}" in
  	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
  	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
@@ -29,11 +30,11 @@ Index: valgrind-3.7.0/configure.in
       darwin)
  	AC_MSG_RESULT(Darwin)
  	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
-@@ -801,7 +815,7 @@ case "${GLIBC_VERSION}" in
+@@ -923,7 +937,7 @@ case "${GLIBC_VERSION}" in
  
       *)
  	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.14])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
 +	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.17])
  	AC_MSG_ERROR([or Darwin libc])
  	;;
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_issue_caused_by_ccache.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_issue_caused_by_ccache.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_unsupporting_kernel_3.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.7.0/fix_unsupporting_kernel_3.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind-3.8.1/fixed-perl-path.patch
similarity index 100%
rename from meta/recipes-devtools/valgrind/valgrind-3.7.0/fixed-perl-path.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.8.1/fixed-perl-path.patch
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
similarity index 74%
rename from meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
index 0bf6ef4..adc5434 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=0ef036a7ddce4cdc738d65d63b3e8153 \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=aee56014c1dd64260a59fd4df38752f6 \
+                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=6b18ba0139d10678ce3a9969f68e4c6d \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=b6bb5ab625a759823e17197ec3e2ee83 \
                     file://COPYING.DOCS;md5=8fdeb5abdb235a08e76835f8f3260215"
 
 X11DEPENDS = "virtual/libx11"
@@ -15,17 +15,12 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
            file://fix_unsupporting_kernel_3.patch \
            file://fixed-perl-path.patch \
-           file://fix_for_automake_1.11.2.patch \
-           file://configure-fix.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://configure-with-newer-glibc.patch \
           "
 
-SRC_URI_append_powerpc = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
-SRC_URI_append_powerpc64 = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
-
-SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
-SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
+SRC_URI[md5sum] = "288758010b271119a0ffc0183f1d6e38"
+SRC_URI[sha256sum] = "473be00576bed311a662b277a2bfbe97d9cca4058e68619a0e420c9fc19958db"
 
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
-- 
1.7.9.5



