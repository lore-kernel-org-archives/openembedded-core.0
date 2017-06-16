Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5C56F78476
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279564"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:40 +0300
Message-Id: <bb7bf72afae3f44d7e10f4d67e3149ba051cfbda.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/32] guile: remove the recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:26 -0000

With the removal of autogen and remake, guile is no longer needed.
Nothing requires it in meta-oe either.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-devtools/guile/files/arm_aarch64.patch |  19 ----
 .../guile/files/arm_endianness.patch               |  23 ----
 ...-modules-are-removed-gc-test-as-unresolve.patch |  39 -------
 ...with-owner-not-retained-threads-test-as-u.patch |  33 ------
 .../guile/files/guile_2.0.6_fix_sed_error.patch    |  24 ----
 .../guile/files/libguile-Makefile.am-hook.patch    |  42 -------
 .../guile/files/opensuse/guile-64bit.patch         |  39 -------
 .../files/workaround-ice-ssa-corruption.patch      |  60 ----------
 meta/recipes-devtools/guile/guile_2.0.14.bb        | 125 ---------------------
 9 files changed, 404 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/arm_aarch64.patch
 delete mode 100644 meta/recipes-devtools/guile/files/arm_endianness.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
 delete mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch
 delete mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
 delete mode 100644 meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
 delete mode 100644 meta/recipes-devtools/guile/guile_2.0.14.bb

diff --git a/meta/recipes-devtools/guile/files/arm_aarch64.patch b/meta/recipes-devtools/guile/files/arm_aarch64.patch
deleted file mode 100644
index f1788b62fb3..00000000000
--- a/meta/recipes-devtools/guile/files/arm_aarch64.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-guile: add aarch64 recognition
-
-Assume little-endian.
-
-Upstream-Status: Pending
-
-Signed-off-by: joe.slater@windriver.com
-
---- a/module/system/base/target.scm
-+++ b/module/system/base/target.scm
-@@ -70,6 +70,8 @@
-             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
-                            "mips" "mips64"))
-              (endianness big))
-+            ((string-match "^aarch64" cpu)
-+             (endianness little))
-             ((string-match "^arm.*eb" cpu)
-              (endianness big))
-             ((string-match "^arm.*" cpu)
diff --git a/meta/recipes-devtools/guile/files/arm_endianness.patch b/meta/recipes-devtools/guile/files/arm_endianness.patch
deleted file mode 100644
index ea4328b81da..00000000000
--- a/meta/recipes-devtools/guile/files/arm_endianness.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Support form ARM endianness
-
-Fixes Yocto bug# 2729
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: guile-2.0.5/module/system/base/target.scm
-===================================================================
---- guile-2.0.5.orig/module/system/base/target.scm	2012-01-24 03:06:06.000000000 -0800
-+++ guile-2.0.5/module/system/base/target.scm	2012-07-12 13:05:44.372364103 -0700
-@@ -70,7 +70,9 @@
-             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
-                            "mips" "mips64"))
-              (endianness big))
--            ((string-match "^arm.*el" cpu)
-+            ((string-match "^arm.*eb" cpu)
-+             (endianness big))
-+            ((string-match "^arm.*" cpu)
-              (endianness little))
-             (else
-              (error "unknown CPU endianness" cpu)))))
diff --git a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch b/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
deleted file mode 100644
index c7bf635ac72..00000000000
--- a/meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-From e52bfcdbaca5dce498678d8f512381e3e39a4066 Mon Sep 17 00:00:00 2001
-From: Rob Browning <rlb@defaultvalue.org>
-Date: Sun, 18 Mar 2012 11:40:55 -0500
-Subject: Mark "Unused modules are removed" gc test as unresolved.
-
-As per discussion with upstream, mark this test as unresolved since it
-may produce false negatives, depending on the behavior/timing of the
-garbage collector.
----
- test-suite/tests/gc.test |   11 ++++++-----
- 1 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/test-suite/tests/gc.test b/test-suite/tests/gc.test
-index a969752..8c8e13e 100644
---- a/test-suite/tests/gc.test
-+++ b/test-suite/tests/gc.test
-@@ -84,11 +84,13 @@
-       ;; one gc round. not sure why.
- 
-       (maybe-gc-flakiness
--       (= (let lp ((i 0))
--            (if (guard)
--                (lp (1+ i))
--                i))
--          total))))
-+       (or (= (let lp ((i 0))
-+                (if (guard)
-+                    (lp (1+ i))
-+                    i))
-+              total)
-+           (throw 'unresolved)))))
-+
- 
-   (pass-if "Lexical vars are collectable"
-     (let ((l (compile
diff --git a/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch b/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
deleted file mode 100644
index d3faf3e01ad..00000000000
--- a/meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-From 848543091d55dddb54a85612155964506d712852 Mon Sep 17 00:00:00 2001
-From: Rob Browning <rlb@defaultvalue.org>
-Date: Sun, 18 Mar 2012 13:28:24 -0500
-Subject: Mark "mutex with owner not retained" threads test as unresolved.
-
-As per discussion with upstream, mark this test as unresolved since it
-may produce false negatives, depending on the behavior/timing of the
-garbage collector.
----
- test-suite/tests/threads.test |    6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/test-suite/tests/threads.test b/test-suite/tests/threads.test
-index 85a7c38..50899cb 100644
---- a/test-suite/tests/threads.test
-+++ b/test-suite/tests/threads.test
-@@ -414,8 +414,10 @@
- 
-             (gc) (gc)
-             (let ((m (g)))
--              (and (mutex? m)
--                   (eq? (mutex-owner m) (current-thread)))))))
-+              (or
-+               (and (mutex? m)
-+                    (eq? (mutex-owner m) (current-thread)))
-+               (throw 'unresolved))))))
- 
-       ;;
-       ;; mutex lock levels
diff --git a/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch b/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
deleted file mode 100644
index 5597bb21f1a..00000000000
--- a/meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-This fixes sed issue when prefix has / in it, like /usr/local
-
-autoreconf error avoided:
-| sed: -e expression #1, char 9: unknown option to `s'
-| configure.ac:39: error: AC_INIT should be called with package and version arguments
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/01
-
-Index: guile-2.0.5/build-aux/git-version-gen
-===================================================================
---- guile-2.0.5.orig/build-aux/git-version-gen
-+++ guile-2.0.5/build-aux/git-version-gen
-@@ -187,7 +187,7 @@ else
-     v=UNKNOWN
- fi
- 
--v=`echo "$v" |sed "s/^$prefix//"`
-+v=`echo "$v" |sed "s#^$prefix##"`
- 
- # Test whether to append the "-dirty" suffix only if the version
- # string we're using came from git.  I.e., skip the test if it's "UNKNOWN"
diff --git a/meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch b/meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch
deleted file mode 100644
index 290b9d447d9..00000000000
--- a/meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9c4e120a7a87db34d22a50883a5a525170b480d7 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 6 Jan 2015 23:10:51 -0800
-Subject: [PATCH] libguile/Makefile.am: install-data-hook -> install-exec-hook
-
-It may install such a file:
-/usr/lib64/libguile-2.0*-gdb.scm
-
-This is because when there is no file in the directory:
-for f in libguile-2.0*; do
-    [snip]
-done
-
-The f would be libguile-2.0* itself, use install-exec-hook will fix the
-problem since it depends on install-libLTLIBRARIES.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libguile/Makefile.am |    4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/libguile/Makefile.am b/libguile/Makefile.am
-index 5decd99..52645b7 100644
---- a/libguile/Makefile.am
-+++ b/libguile/Makefile.am
-@@ -446,10 +446,8 @@ EXTRA_libguile_@GUILE_EFFECTIVE_VERSION@_la_SOURCES = _scm.h		\
- ## delete guile-snarf.awk from the installation bindir, in case it's
- ## lingering there due to an earlier guile version not having been
- ## wiped out.
--install-exec-hook:
-+install-exec-hook: libguile-2.0-gdb.scm
- 	rm -f $(DESTDIR)$(bindir)/guile-snarf.awk
--
--install-data-hook: libguile-2.0-gdb.scm
- 	@$(MKDIR_P) $(DESTDIR)$(libdir)
- ## We want to install libguile-2.0-gdb.scm as SOMETHING-gdb.scm.
- ## SOMETHING is the full name of the final library.  We want to ignore
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch b/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
deleted file mode 100644
index da69b5fd7b9..00000000000
--- a/meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Inappropriate [opensuse patch]
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Index: guile-2.0.3/libguile/hash.c
-===================================================================
---- guile-2.0.3.orig/libguile/hash.c	2011-07-06 15:49:59.000000000 -0700
-+++ guile-2.0.3/libguile/hash.c	2012-01-13 21:49:43.332844884 -0800
-@@ -270,7 +270,7 @@ scm_hasher(SCM obj, unsigned long n, siz
- unsigned long
- scm_ihashq (SCM obj, unsigned long n)
- {
--  return (SCM_UNPACK (obj) >> 1) % n;
-+  return ((unsigned long) SCM_UNPACK (obj) >> 1) % n;
- }
- 
- 
-@@ -306,7 +306,7 @@ scm_ihashv (SCM obj, unsigned long n)
-   if (SCM_NUMP(obj))
-     return (unsigned long) scm_hasher(obj, n, 10);
-   else
--    return SCM_UNPACK (obj) % n;
-+    return (unsigned long) SCM_UNPACK (obj) % n;
- }
- 
- 
-Index: guile-2.0.3/libguile/struct.c
-===================================================================
---- guile-2.0.3.orig/libguile/struct.c	2011-07-06 15:50:00.000000000 -0700
-+++ guile-2.0.3/libguile/struct.c	2012-01-13 21:49:43.332844884 -0800
-@@ -942,7 +942,7 @@ scm_struct_ihashq (SCM obj, unsigned lon
- {
-   /* The length of the hash table should be a relative prime it's not
-      necessary to shift down the address.  */
--  return SCM_UNPACK (obj) % n;
-+  return (unsigned long) SCM_UNPACK (obj) % n;
- }
- 
- SCM_DEFINE (scm_struct_vtable_name, "struct-vtable-name", 1, 0, 0, 
diff --git a/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
deleted file mode 100644
index 6c348384a56..00000000000
--- a/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-libguile/vm-i-system.c: workaround ice ssa corruption while compiling with option -g -O
-
-While compiling with option -g -O, there was a ssa corruption:
-..
-Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESCE.
-sp_48(ab) and  sp_3476(ab)
-guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
-guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
- #define VM_NAME   vm_debug_engine
-                   ^
-guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_NAME'
- VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
- ^
-Please submit a full bug report,
-with preprocessed source if appropriate.
-See <http://gcc.gnu.org/bugs.html> for instructions.
-...
-
-Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libguile/vm-i-system.c | 20 ++++++++++++++++----
- 1 file changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/libguile/vm-i-system.c b/libguile/vm-i-system.c
---- a/libguile/vm-i-system.c
-+++ b/libguile/vm-i-system.c
-@@ -625,10 +625,22 @@ VM_DEFINE_INSTRUCTION (47, bind_optionals_shuffle, "bind-optionals/shuffle", 6,
-   /* now shuffle up, from walk to ntotal */
-   {
-     scm_t_ptrdiff nshuf = sp - walk + 1, i;
--    sp = (fp - 1) + ntotal + nshuf;
--    CHECK_OVERFLOW ();
--    for (i = 0; i < nshuf; i++)
--      sp[-i] = walk[nshuf-i-1];
-+    /* check the value of nshuf to workaround ice ssa corruption */
-+    /* while compiling with -O -g */
-+    if (nshuf > 0)
-+    {
-+      sp = (fp - 1) + ntotal + nshuf;
-+      CHECK_OVERFLOW ();
-+      for (i = 0; i < nshuf; i++)
-+        sp[-i] = walk[nshuf-i-1];
-+    }
-+    else
-+    {
-+      sp = (fp - 1) + ntotal + nshuf;
-+      CHECK_OVERFLOW ();
-+      for (i = 0; i < nshuf; i++)
-+        sp[-i] = walk[nshuf-i-1];
-+    }
-   }
-   /* and fill optionals & keyword args with SCM_UNDEFINED */
-   while (walk <= (fp - 1) + ntotal)
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/guile/guile_2.0.14.bb b/meta/recipes-devtools/guile/guile_2.0.14.bb
deleted file mode 100644
index 7a01d0ffc91..00000000000
--- a/meta/recipes-devtools/guile/guile_2.0.14.bb
+++ /dev/null
@@ -1,125 +0,0 @@
-SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for Extensions"
-DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
- the official extension language for the GNU operating system.\
- Guile is a library designed to help programmers create flexible applications.\
- Using Guile in an application allows the application's functionality to be\
- extended by users or other programmers with plug-ins, modules, or scripts.\
- Guile provides what might be described as 'practical software freedom,'\
- making it possible for users to customize an application to meet their\
- needs without digging into the application's internals."
-
-HOMEPAGE = "http://www.gnu.org/software/guile/"
-SECTION = "devel"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
-           file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
-           file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
-           file://opensuse/guile-64bit.patch \
-           file://guile_2.0.6_fix_sed_error.patch \
-           file://arm_endianness.patch \
-           file://arm_aarch64.patch \
-           file://workaround-ice-ssa-corruption.patch \
-           file://libguile-Makefile.am-hook.patch \
-           "
-
-SRC_URI[md5sum] = "c64977c775effd19393364b3018fd8cd"
-SRC_URI[sha256sum] = "e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8619d82"
-
-inherit autotools gettext pkgconfig texinfo
-BBCLASSEXTEND = "native"
-
-# Fix "Argument list too long" error when len(TMPDIR) = 410
-acpaths = "-I ./m4"
-
-DEPENDS = "libunistring bdwgc gmp libtool libffi ncurses readline"
-# add guile-native only to the target recipe's DEPENDS
-DEPENDS_append_class-target = " guile-native libatomic-ops"
-
-# The comment of the script guile-config said it has been deprecated but we should
-# at least add the required dependency to make it work since we still provide the script.
-RDEPENDS_${PN} = "pkgconfig"
-
-RDEPENDS_${PN}_append_libc-glibc_class-target = " glibc-gconv-iso8859-1"
-
-EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix --without-libreadline-prefix', ''][bb.data.inherits_class('native',d)]}"
-
-EXTRA_OECONF_append_class-target = " --with-libunistring-prefix=${STAGING_LIBDIR} \
-                                     --with-libgmp-prefix=${STAGING_LIBDIR} \
-                                     --with-libltdl-prefix=${STAGING_LIBDIR}"
-EXTRA_OECONF_append_libc-uclibc = " guile_cv_use_csqrt=no "
-
-CFLAGS_append_libc-musl = " -DHAVE_GC_SET_FINALIZER_NOTIFIER \
-	                    -DHAVE_GC_GET_HEAP_USAGE_SAFE \
-	                    -DHAVE_GC_GET_FREE_SPACE_DIVISOR \
-	                    -DHAVE_GC_SET_FINALIZE_ON_DEMAND \
-                           "
-
-do_configure_prepend() {
-	mkdir -p po
-}
-
-export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
-
-do_install_append_class-native() {
-	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
-
-	create_wrapper ${D}/${bindir}/guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-	create_wrapper ${D}${bindir}/${HOST_SYS}-guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-}
-
-do_install_append_class-target() {
-	# cleanup buildpaths in scripts
-	sed -i -e 's:${STAGING_DIR_NATIVE}::' ${D}${bindir}/guile-config
-	sed -i -e 's:${STAGING_DIR_HOST}::' ${D}${bindir}/guile-snarf
-
-	sed -i -e 's:${STAGING_DIR_TARGET}::g' ${D}${libdir}/pkgconfig/guile-2.0.pc
-}
-
-do_install_append_libc-musl() {
-	rm -f ${D}${libdir}/charset.alias
-}
-
-SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
-
-guile_cross_config() {
-	# this is only for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-	        # Create guile-config returning target values instead of native values
-	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-        	printf '#!%s \\\n--no-auto-compile -e main -s\n!#\n(define %%guile-build-info %s(\n' $(which ${BUILD_SYS}-guile) "'" \
-			> ${B}/guile-config.cross
-	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
-			-e 's:",[ \t]*": . ":' \
-			-e 's:" *}, *\\:"):' \
-			-e 's:^.*cachedir.*$::' \
-			-e '/^  (/p' \
-			< ${B}/libguile/libpath.h >> ${B}/guile-config.cross
-	        echo '))' >> ${B}/guile-config.cross
-	        cat ${B}/meta/guile-config >> ${B}/guile-config.cross
-	        install ${B}/guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
-	fi
-}
-
-# Guile needs the compiled files to be newer than the source, and it won't
-# auto-compile into the prefix even if it can write there, so touch them here as
-# sysroot is managed.
-SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
-GUILESSTATEDIR = "${COMPONENTS_DIR}/${TUNE_PKGARCH}/${PN}/${libdir}/guile/2.0/ccache"
-GUILESSTATEDIR_class-native = "${COMPONENTS_DIR}/${BUILD_ARCH}/${PN}/${libdir_native}/guile/2.0/ccache"
-guile_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-                find ${GUILESSTATEDIR} -type f | xargs touch
-	fi
-}
-
-# http://errors.yoctoproject.org/Errors/Details/20491/
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.11.0


