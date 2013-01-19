Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1TwV1M-0001Aq-Lz
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 10:47:58 +0100
Received: from atl4mhob06.myregisteredsite.com
	(atl4mhob06.myregisteredsite.com [209.17.115.44])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0J9W4qG004791 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 04:32:04 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob06.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0J9W3I5014535 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 04:32:03 -0500
Received: (qmail 22434 invoked by uid 0); 19 Jan 2013 09:32:02 -0000
Received: from unknown (HELO phenom.lan) (mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 19 Jan 2013 09:32:02 -0000
From: mike.looijmans@topic.nl
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 10:31:46 +0100
Message-Id: <1358587906-24240-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] gcc: Enable OpenMP compiling and library
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
X-List-Received-Date: Sat, 19 Jan 2013 09:47:58 -0000

From: Mike Looijmans <mike.looijmans@topic.nl>

Multicore embedded systems are getting more and more common.

Remove "--disable-openmp" from the GCC configuration options and
always build libgomp. This only creates a "bigger" compiler but
has no effect on the compiled binaries that don't use openmp.

Tested a clean build on mips32el and arm7a, no problems encountered.

Autoconf will not detect OpenMP after this change, because it will
build and run a target binary on the build system. In order to use
OpenMP, the variable ac_cv_prog_c_openmp=-fopenmp must be set.
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    9 +++------
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    4 +---
 .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 +-
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 08a0103..a7aa4a4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -88,7 +88,6 @@ JAVA = ""
 EXTRA_OECONF_BASE = " --enable-lto \
 			--enable-libssp \
 			--disable-bootstrap \
-			--disable-libgomp \
 			--disable-libmudflap \
 			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
@@ -99,7 +98,6 @@ EXTRA_OECONF_BASE = " --enable-lto \
 			--enable-cheaders=c_global "
 
 EXTRA_OECONF_INITIAL = "--disable-libmudflap \
-			--disable-libgomp \
 			--disable-libssp \
 			--disable-libquadmath \
 			--with-system-zlib \
@@ -108,7 +106,6 @@ EXTRA_OECONF_INITIAL = "--disable-libmudflap \
 			--enable-decimal-float=no"
 
 EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
-				--disable-libgomp \
 				--disable-libquadmath \
 				--with-system-zlib \
 				--disable-lto \
@@ -117,9 +114,9 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
-EXTRA_OECONF_PATHS = " \ 
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
-                      --with-sysroot=${STAGING_DIR_TARGET} \ 
+EXTRA_OECONF_PATHS = " \
+                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
+                      --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 do_configure_prepend () {
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index d40383c..1c9155f 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -7,9 +7,7 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=${STAGING_DIR_TARGET} \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-RUNTIMETARGET = "libssp libstdc++-v3"
-RUNTIMETARGET_append_powerpc = " libgomp"
-RUNTIMETARGET_append_powerpc64 = " libgomp"
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
 #  ?
 # libiberty
 # libmudflap
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
index 53c4632..6c048c0 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
@@ -13,7 +13,7 @@ SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
-		--disable-libgomp --disable-libmudflap \
+		--disable-libmudflap \
 		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
 		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
-- 
1.7.5.4



