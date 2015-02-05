Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 92C9B72E19
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:16 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so10806406pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hZdcPbR/acI2tGqqNUYUEEuWWHYkIcO71XZglsDOmT4=;
	b=zz5C/+8s8KzUYW4ukKoJWowViQ7TsFtFKZPQuzwDqhvmDPMFIpx9/zG1+uWvoEpAfy
	BWL/KAI7HFjElgPDlhf+TNfeor5mg3dfz/sc/ZfykpX/HkUbbuf1FEj/0NPY7Go64aIk
	jrky3mgYTFYWCxcQtZ6G7PmPZvZaX4Pjgt4Gq/9OjOKl2glgvacnaF7aS6FDxrc8ZzMF
	hZKlWwo5yHC5dT9LU16G91VihSBHd57eFJdvLKo/0hsv/3MvK3Ym2fjgzhLXuCgjNhtO
	WgmPmFIb7eGvWJ3WztjQgiidUra03q49WnBSbSDsvf5HPgw/jgtdSIHWwYOci9M4Y9nD
	lkYg==
X-Received: by 10.68.237.2 with SMTP id uy2mr6857606pbc.72.1423152317833;
	Thu, 05 Feb 2015 08:05:17 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:40 -0800
Message-Id: <994a515470c760032e1a204114c19d783f610b4c.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 32/61] gcc: ensure target gcc headers can be included
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:16 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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

(From OE-Core rev: 5c87bb9ac2b35b3f8cf2b7d3e4507e7013115162)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 8769128..c88a496 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -73,6 +73,7 @@ SRC_URI = "\
     file://0056-top-level-reorder_gcc-bug-61144.patch \
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
1.9.1


