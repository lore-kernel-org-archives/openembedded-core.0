Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5557F8BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 17:17:32 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAIHHUOZ014981;
	Mon, 18 Nov 2019 11:17:31 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 11:17:30 -0600
Message-Id: <20191118171730.153048-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118171730.153048-1-mark.hatle@kernel.crashing.org>
References: <20191118171730.153048-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 1/1] gcc-9.2: Update the relocation patch to add PREFIX/EXEC_PREFIX
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
X-List-Received-Date: Mon, 18 Nov 2019 17:17:32 -0000

Without relocating PREFIX/EXEC_PREFIX the system can not do runtime
relocation for the path to the usr/lib/gcc directory, and other components.

While this is not a normal or supported use-case it does work in the upstream
gcc.  This is difficult to test with the regular OE SDKs, as it requires
running the components with the correct LD_LIBRARY_PATH and ld.so.

Without this update, gcc will typically not be able to find the gcc
provided include file for stddef.h and similar.  This is due to certain
relocations being based on the PREFIX and/or EXEC_PREFIX locations which
are hardcoded at compilation time.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 ...le-sysroot-support-for-nativesdk-gcc.patch | 185 +++++++++++++++---
 1 file changed, 159 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch
index ba62bc1fd3..2e7a444b58 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -24,22 +24,32 @@ Upstream-Status: Inappropriate
 RP 2015/7/28
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Without
+these as part of the gccrelocprefix the system can't do runtime relocation
+if the executable is moved.  (These paths were missed in the original
+implementation.)
+
+Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
 ---
- gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++-------------
- gcc/cppdefault.h |  3 ++-
- gcc/gcc.c        | 20 +++++++++++++------
- 3 files changed, 53 insertions(+), 20 deletions(-)
+ c-family/c-opts.c |    4 +--
+ cppdefault.c      |   63 +++++++++++++++++++++++++++++++++---------------------
+ cppdefault.h      |   13 ++++-------
+ gcc.c             |   20 ++++++++++++-----
+ incpath.c         |   12 +++++-----
+ prefix.c          |    4 +--
+ 6 files changed, 68 insertions(+), 48 deletions(-)
 
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index 980e2bd47a7..39b6059efdc 100644
---- a/gcc/cppdefault.c
-+++ b/gcc/cppdefault.c
+Index: gcc-9.2.0/gcc/cppdefault.c
+===================================================================
+--- gcc-9.2.0.orig/gcc/cppdefault.c
++++ gcc-9.2.0/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
  # undef CROSS_INCLUDE_DIR
  #endif
  
 +static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
-+static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
++char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
 +static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
 +static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
 +static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
@@ -65,7 +75,7 @@ index 980e2bd47a7..39b6059efdc 100644
  const struct default_include cpp_include_defaults[]
  #ifdef INCLUDE_DEFAULTS
  = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
+@@ -42,38 +66,38 @@ const struct default_include cpp_include
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
@@ -113,7 +123,7 @@ index 980e2bd47a7..39b6059efdc 100644
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
+@@ -85,33 +109,24 @@ const struct default_include cpp_include
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -134,10 +144,29 @@ index 980e2bd47a7..39b6059efdc 100644
  #endif
      { 0, 0, 0, 0, 0, 0 }
    };
-diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index e2d96f1e760..29fa5f815c8 100644
---- a/gcc/cppdefault.h
-+++ b/gcc/cppdefault.h
+ #endif /* no INCLUDE_DEFAULTS */
+ 
+-#ifdef GCC_INCLUDE_DIR
+-const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
+-const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
+-#else
+-const char cpp_GCC_INCLUDE_DIR[] = "";
+-const size_t cpp_GCC_INCLUDE_DIR_len = 0;
+-#endif
+-
+ /* The configured prefix.  */
+-const char cpp_PREFIX[] = PREFIX;
+-const size_t cpp_PREFIX_len = sizeof PREFIX - 1;
+-const char cpp_EXEC_PREFIX[] = STANDARD_EXEC_PREFIX;
++char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
++char EXEC_PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
+ 
+ /* This value is set by cpp_relocated at runtime */
+ const char *gcc_exec_prefix;
+Index: gcc-9.2.0/gcc/cppdefault.h
+===================================================================
+--- gcc-9.2.0.orig/gcc/cppdefault.h
++++ gcc-9.2.0/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
  
  struct default_include
@@ -148,10 +177,31 @@ index e2d96f1e760..29fa5f815c8 100644
    const char *const component;	/* The component containing the directory
  				   (see update_path in prefix.c) */
    const char cplusplus;		/* Only look here if we're compiling C++.  */
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 1a3704b2763..db0e2934038 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
+@@ -50,17 +51,13 @@ struct default_include
+ };
+ 
+ extern const struct default_include cpp_include_defaults[];
+-extern const char cpp_GCC_INCLUDE_DIR[];
+-extern const size_t cpp_GCC_INCLUDE_DIR_len;
++extern char GCC_INCLUDE_DIRVAR[] __attribute__ ((section (".gccrelocprefix")));
+ 
+ /* The configure-time prefix, i.e., the value supplied as the argument
+    to --prefix=.  */
+-extern const char cpp_PREFIX[];
++extern char PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
+ /* The length of the configure-time prefix.  */
+-extern const size_t cpp_PREFIX_len;
+-/* The configure-time execution prefix.  This is typically the lib/gcc
+-   subdirectory of cpp_PREFIX.  */
+-extern const char cpp_EXEC_PREFIX[];
++extern char EXEC_PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
+ /* The run-time execution prefix.  This is typically the lib/gcc
+    subdirectory of the actual installation.  */
+ extern const char *gcc_exec_prefix;
+Index: gcc-9.2.0/gcc/gcc.c
+===================================================================
+--- gcc-9.2.0.orig/gcc/gcc.c
++++ gcc-9.2.0/gcc/gcc.c
 @@ -253,6 +253,8 @@ FILE *report_times_to_file = NULL;
  #endif
  static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
@@ -161,7 +211,7 @@ index 1a3704b2763..db0e2934038 100644
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -527,6 +529,7 @@ or with constant text in a single argument.
+@@ -527,6 +529,7 @@ or with constant text in a single argume
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -169,7 +219,7 @@ index 1a3704b2763..db0e2934038 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1493,10 +1496,10 @@ static const char *gcc_libexec_prefix;
+@@ -1500,10 +1503,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -184,7 +234,7 @@ index 1a3704b2763..db0e2934038 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1504,9 +1507,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1511,9 +1514,9 @@ static const char *const standard_startf
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -196,7 +246,7 @@ index 1a3704b2763..db0e2934038 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5915,6 +5918,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -5922,6 +5925,11 @@ do_spec_1 (const char *spec, int inswitc
  	      }
  	    break;
  
@@ -208,6 +258,89 @@ index 1a3704b2763..db0e2934038 100644
  	  case 'S':
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
--- 
-2.22.1
-
+Index: gcc-9.2.0/gcc/c-family/c-opts.c
+===================================================================
+--- gcc-9.2.0.orig/gcc/c-family/c-opts.c
++++ gcc-9.2.0/gcc/c-family/c-opts.c
+@@ -1382,8 +1382,8 @@ add_prefixed_path (const char *suffix, i
+   size_t prefix_len, suffix_len;
+ 
+   suffix_len = strlen (suffix);
+-  prefix     = iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
+-  prefix_len = iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
++  prefix     = iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
++  prefix_len = iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVAR) - 7;
+ 
+   path = (char *) xmalloc (prefix_len + suffix_len + 1);
+   memcpy (path, prefix, prefix_len);
+Index: gcc-9.2.0/gcc/incpath.c
+===================================================================
+--- gcc-9.2.0.orig/gcc/incpath.c
++++ gcc-9.2.0/gcc/incpath.c
+@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot,
+   int relocated = cpp_relocated ();
+   size_t len;
+ 
+-  if (iprefix && (len = cpp_GCC_INCLUDE_DIR_len) != 0)
++  if (iprefix && (len = strlen(GCC_INCLUDE_DIRVAR) - 7) != 0)
+     {
+       /* Look for directories that start with the standard prefix.
+ 	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
+@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot,
+ 		 now.  */
+ 	      if (sysroot && p->add_sysroot)
+ 		continue;
+-	      if (!filename_ncmp (p->fname, cpp_GCC_INCLUDE_DIR, len))
++	      if (!filename_ncmp (p->fname, GCC_INCLUDE_DIRVAR, len))
+ 		{
+ 		  char *str = concat (iprefix, p->fname + len, NULL);
+ 		  if (p->multilib == 1 && imultilib)
+@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot,
+ 	      free (sysroot_no_trailing_dir_separator);
+ 	    }
+ 	  else if (!p->add_sysroot && relocated
+-		   && !filename_ncmp (p->fname, cpp_PREFIX, cpp_PREFIX_len))
++		   && !filename_ncmp (p->fname, PREFIXVAR, strlen(PREFIXVAR)))
+ 	    {
+  	      static const char *relocated_prefix;
+ 	      char *ostr;
+@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot,
+ 		  dummy = concat (gcc_exec_prefix, "dummy", NULL);
+ 		  relocated_prefix
+ 		    = make_relative_prefix (dummy,
+-					    cpp_EXEC_PREFIX,
+-					    cpp_PREFIX);
++					    EXEC_PREFIXVAR,
++					    PREFIXVAR);
+ 		  free (dummy);
+ 		}
+ 	      ostr = concat (relocated_prefix,
+-			     p->fname + cpp_PREFIX_len,
++			     p->fname + strlen(PREFIXVAR),
+ 			     NULL);
+ 	      str = update_path (ostr, p->component);
+ 	      free (ostr);
+Index: gcc-9.2.0/gcc/prefix.c
+===================================================================
+--- gcc-9.2.0.orig/gcc/prefix.c
++++ gcc-9.2.0/gcc/prefix.c
+@@ -72,7 +72,9 @@ License along with GCC; see the file COP
+ #include "prefix.h"
+ #include "common/common-target.h"
+ 
+-static const char *std_prefix = PREFIX;
++static const char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
++
++static const char *std_prefix = PREFIXVAR;
+ 
+ static const char *get_key_value (char *);
+ static char *translate_name (char *);
+@@ -212,7 +214,7 @@ translate_name (char *name)
+ 	prefix = getenv (key);
+ 
+       if (prefix == 0)
+-	prefix = PREFIX;
++	prefix = PREFIXVAR;
+ 
+       /* We used to strip trailing DIR_SEPARATORs here, but that can
+ 	 sometimes yield a result with no separator when one was coded
-- 
2.17.1


