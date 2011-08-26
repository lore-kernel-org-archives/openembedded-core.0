Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19EhCPOvRQTMfZAWPJIZzHgOYo87wW+y+4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QwxYQ-0007qF-Ph
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 16:38:43 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7QEXr3T029611
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 09:33:53 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 09:33:53 -0500
Message-Id: <1314369233-22081-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2011 14:38:43 -0000

The gcc-poison-parameters was added specifically to deal with an issue
on ppc targets and a bug when we build with -Os -frename-registers.

This bug below reports the issue and is fixed in gcc-4.6.x/mainline:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44618

Backport patch to gcc 4.5.1.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    4 +-
 .../gcc/gcc-4.5.1/gcc-poison-parameters.patch      |   85 ------
 meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch  |  314 ++++++++++++++++++++
 3 files changed, 316 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/gcc-poison-parameters.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index aa1cc95..f2991f2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
@@ -56,7 +56,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://64bithack.patch \
 	   file://optional_libstdc.patch \
 	   file://disable_relax_pic_calls_flag.patch \
-	   file://gcc-poison-parameters.patch \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
 	   file://use-defaults.h-and-t-oe-in-B.patch \
@@ -66,6 +65,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://pr45094.patch \
 	   file://pr45052.patch \
 	   file://pr45886.patch \
+	   file://pr44618.patch \
 	  "
 	
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/gcc-poison-parameters.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/gcc-poison-parameters.patch
deleted file mode 100644
index 74d4527..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/gcc-poison-parameters.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Upstream-Status: Pending
-
-gcc: add poison parameters detection
-
-Add the logic that, if not configured with "--enable-target-optspace",
-gcc will meet error when build target app with "-Os" option.
-This could avoid potential binary crash.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff --git a/gcc/config.in b/gcc/config.in
-index a9e208f..3004321 100644
---- a/gcc/config.in
-+++ b/gcc/config.in
-@@ -132,6 +132,12 @@
- #endif
- 
- 
-+/* Define to enable target optspace support. */
-+#ifndef USED_FOR_TARGET
-+#undef ENABLE_TARGET_OPTSPACE
-+#endif
-+
-+
- /* Define if you want all operations on RTL (the basic data structure of the
-    optimizer and back end) to be checked for dynamic type safety at runtime.
-    This is quite expensive. */
-diff --git a/gcc/configure b/gcc/configure
-index 2e022ed..004ec0b 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -909,6 +909,7 @@ enable_maintainer_mode
- enable_version_specific_runtime_libs
- with_slibdir
- enable_plugin
-+enable_target_optspace
- '
-       ac_precious_vars='build_alias
- host_alias
-@@ -25289,6 +25290,13 @@ $as_echo "#define ENABLE_PLUGIN 1" >>confdefs.h
- 
- fi
- 
-+if test x"$enable_target_optspace" != x; then :
-+
-+$as_echo "#define ENABLE_TARGET_OPTSPACE 1" >>confdefs.h
-+
-+fi
-+
-+
- # Configure the subdirectories
- # AC_CONFIG_SUBDIRS($subdirs)
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index ac4ca70..18ec0aa 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -4434,6 +4434,11 @@ if test x"$enable_plugin" = x"yes"; then
-   AC_DEFINE(ENABLE_PLUGIN, 1, [Define to enable plugin support.])
- fi
- 
-+AC_SUBST(enable_target_optspace)
-+if test x"$enable_target_optspace" != x; then
-+  AC_DEFINE(ENABLE_TARGET_OPTSPACE, 1, [Define to enable target optspace support.])
-+fi
-+
- # Configure the subdirectories
- # AC_CONFIG_SUBDIRS($subdirs)
- 
-diff --git a/gcc/opts.c b/gcc/opts.c
-index 139cd26..2fdd96a 100644
---- a/gcc/opts.c
-+++ b/gcc/opts.c
-@@ -945,6 +945,11 @@ decode_options (unsigned int argc, const char **argv)
-   else
-     set_param_value ("min-crossjump-insns", initial_min_crossjump_insns);
- 
-+#ifndef ENABLE_TARGET_OPTSPACE
-+  if (optimize_size == 1)
-+    error ("Do not use -Os option if --enable-target-optspace is not set.");
-+#endif
-+
-   if (first_time_p)
-     {
-       /* Initialize whether `char' is signed.  */
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch
new file mode 100644
index 0000000..23f41cc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch
@@ -0,0 +1,314 @@
+Upstream-Status: Pending
+
+Backport of bugfix in gcc-4.6.x and mainline that address bug 44618 in
+which we get wrong code generation with -Os -frename-registers.
+
+ 	2011-06-13  Edmar Wienskoski  <edmar@freescale.com>
+
+	PR target/44618
+	* config/rs6000/rs6000.md (save_gpregs_<mode>): Replaced pattern
+	with a set of similar patterns, where the MATCH_OPERAND for the
+	function argument is replaced with individual references to hardware
+	registers.
+	(save_fpregs_<mode>): Ditto
+	(restore_gpregs_<mode>): Ditto
+	(return_and_restore_gpregs_<mode>): Ditto
+	(return_and_restore_fpregs_<mode>): Ditto
+	(return_and_restore_fpregs_aix_<mode>): Ditto
+
+	* gcc.target/powerpc/outofline_rnreg.c: New testcase.
+
+Index: gcc-4.5.1/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4.5.1.orig/gcc/config/rs6000/rs6000.md
++++ gcc-4.5.1/gcc/config/rs6000/rs6000.md
+@@ -15256,25 +15256,88 @@
+   "{stm|stmw} %2,%1"
+   [(set_attr "type" "store_ux")])
+ 
+-(define_insn "*save_gpregs_<mode>"
++; The following comment applies to:
++;     save_gpregs_*
++;     save_fpregs_*
++;     restore_gpregs*
++;     return_and_restore_gpregs*
++;     return_and_restore_fpregs*
++;     return_and_restore_fpregs_aix*
++;
++; The out-of-line save / restore functions expects one input argument.
++; Since those are not standard call_insn's, we must avoid using
++; MATCH_OPERAND for that argument. That way the register rename
++; optimization will not try to rename this register.
++; Each pattern is repeated for each possible register number used in 
++; various ABIs (r11, r1, and for some functions r12)
++
++(define_insn "*save_gpregs_<mode>_r11"
++  [(match_parallel 0 "any_parallel_operand"
++		   [(clobber (reg:P 65))
++		    (use (match_operand:P 1 "symbol_ref_operand" "s"))
++                    (use (reg:P 11))
++		    (set (match_operand:P 2 "memory_operand" "=m")
++			 (match_operand:P 3 "gpc_reg_operand" "r"))])]
++  ""
++  "bl %1"
++  [(set_attr "type" "branch")
++   (set_attr "length" "4")])
++
++(define_insn "*save_gpregs_<mode>_r12"
++  [(match_parallel 0 "any_parallel_operand"
++		   [(clobber (reg:P 65))
++		    (use (match_operand:P 1 "symbol_ref_operand" "s"))
++                    (use (reg:P 12))
++		    (set (match_operand:P 2 "memory_operand" "=m")
++			 (match_operand:P 3 "gpc_reg_operand" "r"))])]
++  ""
++  "bl %1"
++  [(set_attr "type" "branch")
++   (set_attr "length" "4")])
++
++(define_insn "*save_gpregs_<mode>_r1"
++  [(match_parallel 0 "any_parallel_operand"
++		   [(clobber (reg:P 65))
++		    (use (match_operand:P 1 "symbol_ref_operand" "s"))
++                    (use (reg:P 1))
++		    (set (match_operand:P 2 "memory_operand" "=m")
++			 (match_operand:P 3 "gpc_reg_operand" "r"))])]
++  ""
++  "bl %1"
++  [(set_attr "type" "branch")
++   (set_attr "length" "4")])
++
++(define_insn "*save_fpregs_<mode>_r11"
++  [(match_parallel 0 "any_parallel_operand"
++		   [(clobber (reg:P 65))
++		    (use (match_operand:P 1 "symbol_ref_operand" "s"))
++                    (use (reg:P 11))
++		    (set (match_operand:DF 2 "memory_operand" "=m")
++			 (match_operand:DF 3 "gpc_reg_operand" "d"))])]
++  ""
++  "bl %1"
++  [(set_attr "type" "branch")
++   (set_attr "length" "4")])
++
++(define_insn "*save_fpregs_<mode>_r12"
+   [(match_parallel 0 "any_parallel_operand"
+ 		   [(clobber (reg:P 65))
+ 		    (use (match_operand:P 1 "symbol_ref_operand" "s"))
+-                    (use (match_operand:P 2 "gpc_reg_operand" "r"))
+-		    (set (match_operand:P 3 "memory_operand" "=m")
+-			 (match_operand:P 4 "gpc_reg_operand" "r"))])]
++                    (use (reg:P 12))
++		    (set (match_operand:DF 2 "memory_operand" "=m")
++			 (match_operand:DF 3 "gpc_reg_operand" "d"))])]
+   ""
+   "bl %1"
+   [(set_attr "type" "branch")
+    (set_attr "length" "4")])
+ 
+-(define_insn "*save_fpregs_<mode>"
++(define_insn "*save_fpregs_<mode>_r1"
+   [(match_parallel 0 "any_parallel_operand"
+ 		   [(clobber (reg:P 65))
+ 		    (use (match_operand:P 1 "symbol_ref_operand" "s"))
+-                    (use (match_operand:P 2 "gpc_reg_operand" "r"))
+-		    (set (match_operand:DF 3 "memory_operand" "=m")
+-			 (match_operand:DF 4 "gpc_reg_operand" "d"))])]
++                    (use (reg:P 1))
++		    (set (match_operand:DF 2 "memory_operand" "=m")
++			 (match_operand:DF 3 "gpc_reg_operand" "d"))])]
+   ""
+   "bl %1"
+   [(set_attr "type" "branch")
+@@ -15372,52 +15435,156 @@
+ ; FIXME: This would probably be somewhat simpler if the Cygnus sibcall
+ ; stuff was in GCC.  Oh, and "any_parallel_operand" is a bit flexible...
+ 
+-(define_insn "*restore_gpregs_<mode>"
++; The following comment applies to:
++;     save_gpregs_*
++;     save_fpregs_*
++;     restore_gpregs*
++;     return_and_restore_gpregs*
++;     return_and_restore_fpregs*
++;     return_and_restore_fpregs_aix*
++;
++; The out-of-line save / restore functions expects one input argument.
++; Since those are not standard call_insn's, we must avoid using
++; MATCH_OPERAND for that argument. That way the register rename
++; optimization will not try to rename this register.
++; Each pattern is repeated for each possible register number used in 
++; various ABIs (r11, r1, and for some functions r12)
++
++(define_insn "*restore_gpregs_<mode>_r11"
++ [(match_parallel 0 "any_parallel_operand"
++                  [(clobber (match_operand:P 1 "register_operand" "=l"))
++                   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++                   (use (reg:P 11))
++		   (set (match_operand:P 3 "gpc_reg_operand" "=r")
++			(match_operand:P 4 "memory_operand" "m"))])]
++ ""
++ "bl %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*restore_gpregs_<mode>_r12"
+  [(match_parallel 0 "any_parallel_operand"
+                   [(clobber (match_operand:P 1 "register_operand" "=l"))
+                    (use (match_operand:P 2 "symbol_ref_operand" "s"))
+-                   (use (match_operand:P 3 "gpc_reg_operand" "r"))
+-		   (set (match_operand:P 4 "gpc_reg_operand" "=r")
+-			(match_operand:P 5 "memory_operand" "m"))])]
++                   (use (reg:P 12))
++		   (set (match_operand:P 3 "gpc_reg_operand" "=r")
++			(match_operand:P 4 "memory_operand" "m"))])]
+  ""
+  "bl %2"
+  [(set_attr "type" "branch")
+   (set_attr "length" "4")])
+ 
+-(define_insn "*return_and_restore_gpregs_<mode>"
++(define_insn "*restore_gpregs_<mode>_r1"
++ [(match_parallel 0 "any_parallel_operand"
++                  [(clobber (match_operand:P 1 "register_operand" "=l"))
++                   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++                   (use (reg:P 1))
++		   (set (match_operand:P 3 "gpc_reg_operand" "=r")
++			(match_operand:P 4 "memory_operand" "m"))])]
++ ""
++ "bl %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*return_and_restore_gpregs_<mode>_r11"
++ [(match_parallel 0 "any_parallel_operand"
++                  [(return)
++		   (clobber (match_operand:P 1 "register_operand" "=l"))
++		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++                   (use (reg:P 11))
++		   (set (match_operand:P 3 "gpc_reg_operand" "=r")
++			(match_operand:P 4 "memory_operand" "m"))])]
++ ""
++ "b %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*return_and_restore_gpregs_<mode>_r12"
++ [(match_parallel 0 "any_parallel_operand"
++                  [(return)
++		   (clobber (match_operand:P 1 "register_operand" "=l"))
++		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++                   (use (reg:P 12))
++		   (set (match_operand:P 3 "gpc_reg_operand" "=r")
++			(match_operand:P 4 "memory_operand" "m"))])]
++ ""
++ "b %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*return_and_restore_gpregs_<mode>_r1"
+  [(match_parallel 0 "any_parallel_operand"
+                   [(return)
+ 		   (clobber (match_operand:P 1 "register_operand" "=l"))
+ 		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
+-                   (use (match_operand:P 3 "gpc_reg_operand" "r"))
+-		   (set (match_operand:P 4 "gpc_reg_operand" "=r")
+-			(match_operand:P 5 "memory_operand" "m"))])]
++                   (use (reg:P 1))
++		   (set (match_operand:P 3 "gpc_reg_operand" "=r")
++			(match_operand:P 4 "memory_operand" "m"))])]
+  ""
+  "b %2"
+  [(set_attr "type" "branch")
+   (set_attr "length" "4")])
+ 
+-(define_insn "*return_and_restore_fpregs_<mode>"
++(define_insn "*return_and_restore_fpregs_<mode>_r11"
+  [(match_parallel 0 "any_parallel_operand"
+                   [(return)
+ 		   (clobber (match_operand:P 1 "register_operand" "=l"))
+ 		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
+-                   (use (match_operand:P 3 "gpc_reg_operand" "r"))
+-		   (set (match_operand:DF 4 "gpc_reg_operand" "=d")
+-			(match_operand:DF 5 "memory_operand" "m"))])]
++                   (use (reg:P 11))
++		   (set (match_operand:DF 3 "gpc_reg_operand" "=d")
++			(match_operand:DF 4 "memory_operand" "m"))])]
++ ""
++ "b %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*return_and_restore_fpregs_<mode>_r12"
++ [(match_parallel 0 "any_parallel_operand"
++                  [(return)
++		   (clobber (match_operand:P 1 "register_operand" "=l"))
++		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++                   (use (reg:P 12))
++		   (set (match_operand:DF 3 "gpc_reg_operand" "=d")
++			(match_operand:DF 4 "memory_operand" "m"))])]
++ ""
++ "b %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*return_and_restore_fpregs_<mode>_r1"
++ [(match_parallel 0 "any_parallel_operand"
++                  [(return)
++		   (clobber (match_operand:P 1 "register_operand" "=l"))
++		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++                   (use (reg:P 1))
++		   (set (match_operand:DF 3 "gpc_reg_operand" "=d")
++			(match_operand:DF 4 "memory_operand" "m"))])]
++ ""
++ "b %2"
++ [(set_attr "type" "branch")
++  (set_attr "length" "4")])
++
++(define_insn "*return_and_restore_fpregs_aix_<mode>_r11"
++ [(match_parallel 0 "any_parallel_operand"
++		  [(return)
++		   (use (match_operand:P 1 "register_operand" "l"))
++		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
++		   (use (reg:P 11))
++		   (set (match_operand:DF 3 "gpc_reg_operand" "=d")
++			(match_operand:DF 4 "memory_operand" "m"))])]
+  ""
+  "b %2"
+  [(set_attr "type" "branch")
+   (set_attr "length" "4")])
+ 
+-(define_insn "*return_and_restore_fpregs_aix_<mode>"
++(define_insn "*return_and_restore_fpregs_aix_<mode>_r1"
+  [(match_parallel 0 "any_parallel_operand"
+ 		  [(return)
+ 		   (use (match_operand:P 1 "register_operand" "l"))
+ 		   (use (match_operand:P 2 "symbol_ref_operand" "s"))
+-		   (use (match_operand:P 3 "gpc_reg_operand" "r"))
+-		   (set (match_operand:DF 4 "gpc_reg_operand" "=d")
+-			(match_operand:DF 5 "memory_operand" "m"))])]
++		   (use (reg:P 1))
++		   (set (match_operand:DF 3 "gpc_reg_operand" "=d")
++			(match_operand:DF 4 "memory_operand" "m"))])]
+  ""
+  "b %2"
+  [(set_attr "type" "branch")
+Index: gcc-4.5.1/gcc/testsuite/gcc.target/powerpc/outofline_rnreg.c
+===================================================================
+--- /dev/null
++++ gcc-4.5.1/gcc/testsuite/gcc.target/powerpc/outofline_rnreg.c
+@@ -0,0 +1,15 @@
++/* Test that registers used by out of line restore functions does not get renamed.
++   AIX, and 64 bit targets uses r1, which rnreg stays away from.
++   Linux 32 bits targets uses r11, which is susceptible to be renamed */
++/* { dg-do compile } */
++/* { dg-require-effective-target ilp32 } */
++/* { dg-options "-Os -frename-registers -fdump-rtl-rnreg" } */
++/* "* renamed" or "* no available better choice" results are not acceptable */
++/* { dg-final { scan-rtl-dump-not "Register 11 in insn *" "rnreg" { target powerpc*-*-linux* } } } */
++/* { dg-final { cleanup-rtl-dump "rnreg" } } */
++int
++calc (int j)
++{
++  if (j<=1) return 1;
++  return calc(j-1)*(j+1);
++}
-- 
1.7.3.4



