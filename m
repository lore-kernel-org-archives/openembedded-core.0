Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0AD1763CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 07:08:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8978GMB020904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Sep 2015 00:08:16 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 9 Sep 2015 00:08:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Sep 2015 00:08:15 -0700
Message-ID: <4784fff22319b2cea11554c8168ced09f6541da0.1441782430.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1441782430.git.liezhi.yang@windriver.com>
References: <cover.1441782430.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gcc-5.2: remake 0040-nativesdk-gcc-support.patch
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
X-List-Received-Date: Wed, 09 Sep 2015 07:08:16 -0000
Content-Type: text/plain

It couldn't be applied by sled11's patch, now fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gcc/gcc-5.2/0040-nativesdk-gcc-support.patch   |  142 +++++++++-----------
 1 file changed, 67 insertions(+), 75 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch b/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
index ba7360c..fd81ae2 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
@@ -19,70 +19,9 @@ b) Add other paths which need relocation into a .gccrelocprefix section
 Upstream-Status: Inappropriate
 RP 2015/7/28
 
-Index: gcc-4.9.2/gcc/gcc.c
-===================================================================
---- gcc-4.9.2.orig/gcc/gcc.c
-+++ gcc-4.9.2/gcc/gcc.c
-@@ -120,6 +120,8 @@ static const char *target_system_root =
- #else
- static const char *target_system_root = 0;
- #endif
-+ 
-+static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
- 
- /* Nonzero means pass the updated target_system_root to the compiler.  */
- 
-@@ -384,6 +386,7 @@ or with constant text in a single argume
-  %G     process LIBGCC_SPEC as a spec.
-  %R     Output the concatenation of target_system_root and
-         target_sysroot_suffix.
-+ %r     Output the base path target_relocatable_prefix
-  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
-  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
-  %C     process CPP_SPEC as a spec.
-@@ -1218,10 +1221,10 @@ static const char *gcc_libexec_prefix;
-    gcc_exec_prefix is set because, in that case, we know where the
-    compiler has been installed, and use paths relative to that
-    location instead.  */
--static const char *const standard_exec_prefix = STANDARD_EXEC_PREFIX;
--static const char *const standard_libexec_prefix = STANDARD_LIBEXEC_PREFIX;
--static const char *const standard_bindir_prefix = STANDARD_BINDIR_PREFIX;
--static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
-+static char standard_exec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
-+static char standard_libexec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_LIBEXEC_PREFIX;
-+static char standard_bindir_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_BINDIR_PREFIX;
-+static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
- 
- /* For native compilers, these are well-known paths containing
-    components that may be provided by the system.  For cross
-@@ -1229,9 +1232,9 @@ static const char *const standard_startf
- static const char *md_exec_prefix = MD_EXEC_PREFIX;
- static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
- static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
--static const char *const standard_startfile_prefix_1
-+static char standard_startfile_prefix_1[4096] __attribute__ ((section (".gccrelocprefix")))
-   = STANDARD_STARTFILE_PREFIX_1;
--static const char *const standard_startfile_prefix_2
-+static char standard_startfile_prefix_2[4096] __attribute__ ((section (".gccrelocprefix")))
-   = STANDARD_STARTFILE_PREFIX_2;
- 
- /* A relative path to be used in finding the location of tools
-@@ -5305,6 +5310,11 @@ do_spec_1 (const char *spec, int inswitc
- 	      }
- 	    break;
- 
-+          case 'r':
-+              obstack_grow (&obstack, target_relocatable_prefix,
-+		      strlen (target_relocatable_prefix));
-+            break;
-+
- 	  case 'S':
- 	    value = do_spec_1 (startfile_spec, 0, NULL);
- 	    if (value != 0)
-Index: gcc-4.9.2/gcc/cppdefault.c
-===================================================================
---- gcc-4.9.2.orig/gcc/cppdefault.c
-+++ gcc-4.9.2/gcc/cppdefault.c
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
  # undef CROSS_INCLUDE_DIR
  #endif
@@ -114,7 +53,7 @@ Index: gcc-4.9.2/gcc/cppdefault.c
  const struct default_include cpp_include_defaults[]
  #ifdef INCLUDE_DEFAULTS
  = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include
+@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
@@ -162,7 +101,7 @@ Index: gcc-4.9.2/gcc/cppdefault.c
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,21 +109,21 @@ const struct default_include cpp_include
+@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -183,15 +122,9 @@ Index: gcc-4.9.2/gcc/cppdefault.c
  #endif
      { 0, 0, 0, 0, 0, 0 }
    };
- #endif /* no INCLUDE_DEFAULTS */
- 
- #ifdef GCC_INCLUDE_DIR
- const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
- const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
-Index: gcc-4.9.2/gcc/cppdefault.h
-===================================================================
---- gcc-4.9.2.orig/gcc/cppdefault.h
-+++ gcc-4.9.2/gcc/cppdefault.h
+diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+--- a/gcc/cppdefault.h
++++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
  
  struct default_include
@@ -202,3 +135,62 @@ Index: gcc-4.9.2/gcc/cppdefault.h
    const char *const component;	/* The component containing the directory
  				   (see update_path in prefix.c) */
    const char cplusplus;		/* Only look here if we're compiling C++.  */
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -120,6 +120,8 @@ static const char *target_system_root = TARGET_SYSTEM_ROOT;
+ #else
+ static const char *target_system_root = 0;
+ #endif
++ 
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
+ 
+ /* Nonzero means pass the updated target_system_root to the compiler.  */
+ 
+@@ -390,6 +392,7 @@ or with constant text in a single argument.
+  %G     process LIBGCC_SPEC as a spec.
+  %R     Output the concatenation of target_system_root and
+         target_sysroot_suffix.
++ %r     Output the base path target_relocatable_prefix
+  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
+  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
+  %C     process CPP_SPEC as a spec.
+@@ -1286,10 +1289,10 @@ static const char *gcc_libexec_prefix;
+    gcc_exec_prefix is set because, in that case, we know where the
+    compiler has been installed, and use paths relative to that
+    location instead.  */
+-static const char *const standard_exec_prefix = STANDARD_EXEC_PREFIX;
+-static const char *const standard_libexec_prefix = STANDARD_LIBEXEC_PREFIX;
+-static const char *const standard_bindir_prefix = STANDARD_BINDIR_PREFIX;
+-static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
++static char standard_exec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
++static char standard_libexec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_LIBEXEC_PREFIX;
++static char standard_bindir_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_BINDIR_PREFIX;
++static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+ 
+ /* For native compilers, these are well-known paths containing
+    components that may be provided by the system.  For cross
+@@ -1297,9 +1300,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+ static const char *md_exec_prefix = MD_EXEC_PREFIX;
+ static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
+ static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
+-static const char *const standard_startfile_prefix_1
++static char standard_startfile_prefix_1[4096] __attribute__ ((section (".gccrelocprefix")))
+   = STANDARD_STARTFILE_PREFIX_1;
+-static const char *const standard_startfile_prefix_2
++static char standard_startfile_prefix_2[4096] __attribute__ ((section (".gccrelocprefix")))
+   = STANDARD_STARTFILE_PREFIX_2;
+ 
+ /* A relative path to be used in finding the location of tools
+@@ -5550,6 +5553,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 	      }
+ 	    break;
+ 
++          case 'r':
++              obstack_grow (&obstack, target_relocatable_prefix,
++		      strlen (target_relocatable_prefix));
++            break;
++
+ 	  case 'S':
+ 	    value = do_spec_1 (startfile_spec, 0, NULL);
+ 	    if (value != 0)
-- 
1.7.9.5


