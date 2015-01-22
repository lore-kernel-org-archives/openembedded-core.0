Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 720567299C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:50:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2015 06:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,449,1418112000"; d="scan'208";a="641046084"
Received: from psroczyn-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.156])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2015 06:50:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 14:50:00 +0000
Message-Id: <9ead3feb39a54e7d86d72a172d33b88364b460f5.1421938154.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1421938154.git.paul.eggleton@linux.intel.com>
References: <cover.1421938154.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1421938154.git.paul.eggleton@linux.intel.com>
References: <cover.1421938154.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] gcc: ensure target gcc headers can be included
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
X-List-Received-Date: Thu, 22 Jan 2015 14:50:12 -0000

There are a few headers installed as part of gcc-runtime (omp.h,
ssp/*.h). Being installed from a recipe built for the target
architecture, these are within the target sysroot and not
cross/nativesdk; thus they weren't able to be found by gcc with the
existing search paths. Add support for picking up these headers
under the sysroot supplied on the gcc command line in order to
resolve this.

Thanks to Richard Purdie for giving me a number of pointers during
fixing this issue.

Fixes [YOCTO #7141].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc/gcc-4.9/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 18a6692..06e6982 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -73,6 +73,7 @@ SRC_URI = "\
     file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
     file://0050-PR-target-58595.patch \
     file://0052-PR-rtl-optimization-61801.patch \
+    file://target-gcc-includedir.patch \
 "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch b/meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch
new file mode 100644
index 0000000..f48c66d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch
@@ -0,0 +1,81 @@
+Ensure target gcc headers can be included
+
+There are a few headers installed as part of the OpenEmbedded
+gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
+built for the target architecture, these are within the target
+sysroot and not cross/nativesdk; thus they weren't able to be
+found by gcc with the existing search paths. Add support for
+picking up these headers under the sysroot supplied on the gcc
+command line in order to resolve this.
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Pending
+
+--- a/gcc/Makefile.in	2014-12-23 11:57:33.327873331 +0000
++++ b/gcc/Makefile.in	2015-01-21 11:32:35.447305394 +0000
+@@ -587,6 +587,7 @@
+ 
+ # Directory in which the compiler finds libraries etc.
+ libsubdir = $(libdir)/gcc/$(target_noncanonical)/$(version)
++libsubdir_target = gcc/$(target_noncanonical)/$(version)
+ # Directory in which the compiler finds executables
+ libexecsubdir = $(libexecdir)/gcc/$(target_noncanonical)/$(version)
+ # Directory in which all plugin resources are installed
+@@ -2534,6 +2535,7 @@
+ 
+ PREPROCESSOR_DEFINES = \
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
+   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+--- a/gcc/cppdefault.c	2015-01-13 17:40:26.131012725 +0000
++++ b/gcc/cppdefault.c	2015-01-21 11:30:08.928426492 +0000
+@@ -59,6 +59,10 @@
+     /* This is the dir for gcc's private headers.  */
+     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
+ #endif
++#ifdef GCC_INCLUDE_SUBDIR_TARGET
++    /* This is the dir for gcc's private headers under the specified sysroot.  */
++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++#endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+diff --git a/gcc/defaults.h b/gcc/defaults.h
+index f94ae17..d98b40b 100644
+--- a/gcc/defaults.h
++++ b/gcc/defaults.h
+@@ -1390,4 +1390,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 
+ #endif /* GCC_INSN_FLAGS_H  */
+ 
++/* Default prefixes to attach to command names.  */
++
++#ifndef STANDARD_STARTFILE_PREFIX_1
++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
++#endif
++#ifndef STANDARD_STARTFILE_PREFIX_2
++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
++#endif
++
+ #endif  /* ! GCC_DEFAULTS_H */
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 9f0b781..174fca8 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1189,13 +1189,6 @@ static const char *gcc_libexec_prefix;
+ 
+ /* Default prefixes to attach to command names.  */
+ 
+-#ifndef STANDARD_STARTFILE_PREFIX_1
+-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
+-#endif
+-#ifndef STANDARD_STARTFILE_PREFIX_2
+-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
+-#endif
+-
+ #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
+ #undef MD_EXEC_PREFIX
+ #undef MD_STARTFILE_PREFIX
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 2568e99..0f407b7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -74,6 +74,7 @@ SRC_URI = "\
     file://0057-aarch64-config.patch \
     file://0058-gcc-r212171.patch \
     file://0059-gcc-PR-rtl-optimization-63348.patch \
+    file://target-gcc-includedir.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch b/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
new file mode 100644
index 0000000..f48c66d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
@@ -0,0 +1,81 @@
+Ensure target gcc headers can be included
+
+There are a few headers installed as part of the OpenEmbedded
+gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
+built for the target architecture, these are within the target
+sysroot and not cross/nativesdk; thus they weren't able to be
+found by gcc with the existing search paths. Add support for
+picking up these headers under the sysroot supplied on the gcc
+command line in order to resolve this.
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Pending
+
+--- a/gcc/Makefile.in	2014-12-23 11:57:33.327873331 +0000
++++ b/gcc/Makefile.in	2015-01-21 11:32:35.447305394 +0000
+@@ -587,6 +587,7 @@
+ 
+ # Directory in which the compiler finds libraries etc.
+ libsubdir = $(libdir)/gcc/$(target_noncanonical)/$(version)
++libsubdir_target = gcc/$(target_noncanonical)/$(version)
+ # Directory in which the compiler finds executables
+ libexecsubdir = $(libexecdir)/gcc/$(target_noncanonical)/$(version)
+ # Directory in which all plugin resources are installed
+@@ -2534,6 +2535,7 @@
+ 
+ PREPROCESSOR_DEFINES = \
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
+   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+--- a/gcc/cppdefault.c	2015-01-13 17:40:26.131012725 +0000
++++ b/gcc/cppdefault.c	2015-01-21 11:30:08.928426492 +0000
+@@ -59,6 +59,10 @@
+     /* This is the dir for gcc's private headers.  */
+     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
+ #endif
++#ifdef GCC_INCLUDE_SUBDIR_TARGET
++    /* This is the dir for gcc's private headers under the specified sysroot.  */
++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++#endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+diff --git a/gcc/defaults.h b/gcc/defaults.h
+index f94ae17..d98b40b 100644
+--- a/gcc/defaults.h
++++ b/gcc/defaults.h
+@@ -1390,4 +1390,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 
+ #endif /* GCC_INSN_FLAGS_H  */
+ 
++/* Default prefixes to attach to command names.  */
++
++#ifndef STANDARD_STARTFILE_PREFIX_1
++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
++#endif
++#ifndef STANDARD_STARTFILE_PREFIX_2
++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
++#endif
++
+ #endif  /* ! GCC_DEFAULTS_H */
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 9f0b781..174fca8 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1189,13 +1189,6 @@ static const char *gcc_libexec_prefix;
+ 
+ /* Default prefixes to attach to command names.  */
+ 
+-#ifndef STANDARD_STARTFILE_PREFIX_1
+-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
+-#endif
+-#ifndef STANDARD_STARTFILE_PREFIX_2
+-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
+-#endif
+-
+ #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
+ #undef MD_EXEC_PREFIX
+ #undef MD_STARTFILE_PREFIX
-- 
1.9.3


