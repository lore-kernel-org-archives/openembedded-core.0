Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C3827761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SDNVl1003353 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:23:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Dr6cKtHRxsXM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:23:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SDNgGu003397
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:23:53 +0100
Message-ID: <1438089817.11208.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 14:23:37 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH 3/4] gcc: Add support for nativesdk-gcc
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
X-List-Received-Date: Tue, 28 Jul 2015 13:23:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Being able to build a nativesdk gcc is useful, particularly in cases
where the host compiler may be of an incompatible version (or a 32
bit compiler is needed).

Sadly, building nativesdk-gcc is not straight forward. We install
nativesdk-gcc into a relocatable location and this means that its
library locations can change. "Normal" sysroot support doesn't help
in this case since the values of paths like "libdir" change, not just
base root directory of the system.

In order to handle this we do two things:

a) Add %r into spec file markup which can be used for injected paths
   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
b) Add other paths which need relocation into a .gccrelocprefix section
   which the relocation code will notice and adjust automatically.

This patch adds tweaks to the relocation script to handle the
new section too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index f5908b6..7a3e4eb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
     file://0060-Only-allow-e500-double-in-SPE_SIMD_REGNO_P-registers.patch \
     file://0061-target-gcc-includedir.patch \
     file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+    file://0063-nativesdk-gcc-support.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch b/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
new file mode 100644
index 0000000..ba7360c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0063-nativesdk-gcc-support.patch
@@ -0,0 +1,204 @@
+Being able to build a nativesdk gcc is useful, particularly in cases
+where the host compiler may be of an incompatible version (or a 32
+bit compiler is needed).
+
+Sadly, building nativesdk-gcc is not straight forward. We install
+nativesdk-gcc into a relocatable location and this means that its
+library locations can change. "Normal" sysroot support doesn't help
+in this case since the values of paths like "libdir" change, not just
+base root directory of the system.
+
+In order to handle this we do two things:
+
+a) Add %r into spec file markup which can be used for injected paths
+   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
+b) Add other paths which need relocation into a .gccrelocprefix section
+   which the relocation code will notice and adjust automatically.
+
+
+Upstream-Status: Inappropriate
+RP 2015/7/28
+
+Index: gcc-4.9.2/gcc/gcc.c
+===================================================================
+--- gcc-4.9.2.orig/gcc/gcc.c
++++ gcc-4.9.2/gcc/gcc.c
+@@ -120,6 +120,8 @@ static const char *target_system_root =
+ #else
+ static const char *target_system_root = 0;
+ #endif
++ 
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
+ 
+ /* Nonzero means pass the updated target_system_root to the compiler.  */
+ 
+@@ -384,6 +386,7 @@ or with constant text in a single argume
+  %G     process LIBGCC_SPEC as a spec.
+  %R     Output the concatenation of target_system_root and
+         target_sysroot_suffix.
++ %r     Output the base path target_relocatable_prefix
+  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
+  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
+  %C     process CPP_SPEC as a spec.
+@@ -1218,10 +1221,10 @@ static const char *gcc_libexec_prefix;
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
+@@ -1229,9 +1232,9 @@ static const char *const standard_startf
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
+@@ -5305,6 +5310,11 @@ do_spec_1 (const char *spec, int inswitc
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
+Index: gcc-4.9.2/gcc/cppdefault.c
+===================================================================
+--- gcc-4.9.2.orig/gcc/cppdefault.c
++++ gcc-4.9.2/gcc/cppdefault.c
+@@ -35,6 +35,30 @@
+ # undef CROSS_INCLUDE_DIR
+ #endif
+ 
++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
++#ifdef LOCAL_INCLUDE_DIR
++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = LOCAL_INCLUDE_DIR;
++#endif
++#ifdef PREFIX_INCLUDE_DIR
++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX_INCLUDE_DIR;
++#endif
++#ifdef FIXED_INCLUDE_DIR
++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = FIXED_INCLUDE_DIR;
++#endif
++#ifdef CROSS_INCLUDE_DIR
++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = CROSS_INCLUDE_DIR;
++#endif
++#ifdef TOOL_INCLUDE_DIR
++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = TOOL_INCLUDE_DIR;
++#endif
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = NATIVE_SYSTEM_HEADER_DIR;
++#endif
++
+ const struct default_include cpp_include_defaults[]
+ #ifdef INCLUDE_DEFAULTS
+ = INCLUDE_DEFAULTS;
+@@ -42,38 +66,38 @@ const struct default_include cpp_include
+ = {
+ #ifdef GPLUSPLUS_INCLUDE_DIR
+     /* Pick up GNU C++ generic include files.  */
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
+     /* Pick up GNU C++ target-dependent include files.  */
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
+ #endif
+ #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
+     /* Pick up GNU C++ backward and deprecated include files.  */
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_DIR
+     /* This is the dir for gcc's private headers.  */
+-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_SUBDIR_TARGET
+     /* This is the dir for gcc's private headers under the specified sysroot.  */
+-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
+ #endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
+ #endif
+ #ifdef PREFIX_INCLUDE_DIR
+-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
+ #endif
+ #ifdef FIXED_INCLUDE_DIR
+     /* This is the dir for fixincludes.  */
+-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
+       /* A multilib suffix needs adding if different multilibs use
+ 	 different headers.  */
+ #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
+@@ -85,21 +109,21 @@ const struct default_include cpp_include
+ #endif
+ #ifdef CROSS_INCLUDE_DIR
+     /* One place the target system's headers might be.  */
+-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef TOOL_INCLUDE_DIR
+     /* Another place the target system's headers might be.  */
+-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
+ #endif
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+     /* /usr/include comes dead last.  */
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
+ #endif
+     { 0, 0, 0, 0, 0, 0 }
+   };
+ #endif /* no INCLUDE_DEFAULTS */
+ 
+ #ifdef GCC_INCLUDE_DIR
+ const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
+ const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
+Index: gcc-4.9.2/gcc/cppdefault.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/cppdefault.h
++++ gcc-4.9.2/gcc/cppdefault.h
+@@ -33,7 +33,8 @@
+ 
+ struct default_include
+ {
+-  const char *const fname;	/* The name of the directory.  */
++  const char *fname;     /* The name of the directory.  */
++
+   const char *const component;	/* The component containing the directory
+ 				   (see update_path in prefix.c) */
+   const char cplusplus;		/* Only look here if we're compiling C++.  */
diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
index dba8999..1a1ed4c 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
            file://0037-pr65779.patch \
            file://0038-fix-g++-sysroot.patch \
            file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0040-nativesdk-gcc-support.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch b/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
new file mode 100644
index 0000000..ba7360c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
@@ -0,0 +1,204 @@
+Being able to build a nativesdk gcc is useful, particularly in cases
+where the host compiler may be of an incompatible version (or a 32
+bit compiler is needed).
+
+Sadly, building nativesdk-gcc is not straight forward. We install
+nativesdk-gcc into a relocatable location and this means that its
+library locations can change. "Normal" sysroot support doesn't help
+in this case since the values of paths like "libdir" change, not just
+base root directory of the system.
+
+In order to handle this we do two things:
+
+a) Add %r into spec file markup which can be used for injected paths
+   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
+b) Add other paths which need relocation into a .gccrelocprefix section
+   which the relocation code will notice and adjust automatically.
+
+
+Upstream-Status: Inappropriate
+RP 2015/7/28
+
+Index: gcc-4.9.2/gcc/gcc.c
+===================================================================
+--- gcc-4.9.2.orig/gcc/gcc.c
++++ gcc-4.9.2/gcc/gcc.c
+@@ -120,6 +120,8 @@ static const char *target_system_root =
+ #else
+ static const char *target_system_root = 0;
+ #endif
++ 
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
+ 
+ /* Nonzero means pass the updated target_system_root to the compiler.  */
+ 
+@@ -384,6 +386,7 @@ or with constant text in a single argume
+  %G     process LIBGCC_SPEC as a spec.
+  %R     Output the concatenation of target_system_root and
+         target_sysroot_suffix.
++ %r     Output the base path target_relocatable_prefix
+  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
+  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
+  %C     process CPP_SPEC as a spec.
+@@ -1218,10 +1221,10 @@ static const char *gcc_libexec_prefix;
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
+@@ -1229,9 +1232,9 @@ static const char *const standard_startf
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
+@@ -5305,6 +5310,11 @@ do_spec_1 (const char *spec, int inswitc
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
+Index: gcc-4.9.2/gcc/cppdefault.c
+===================================================================
+--- gcc-4.9.2.orig/gcc/cppdefault.c
++++ gcc-4.9.2/gcc/cppdefault.c
+@@ -35,6 +35,30 @@
+ # undef CROSS_INCLUDE_DIR
+ #endif
+ 
++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
++#ifdef LOCAL_INCLUDE_DIR
++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = LOCAL_INCLUDE_DIR;
++#endif
++#ifdef PREFIX_INCLUDE_DIR
++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX_INCLUDE_DIR;
++#endif
++#ifdef FIXED_INCLUDE_DIR
++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = FIXED_INCLUDE_DIR;
++#endif
++#ifdef CROSS_INCLUDE_DIR
++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = CROSS_INCLUDE_DIR;
++#endif
++#ifdef TOOL_INCLUDE_DIR
++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = TOOL_INCLUDE_DIR;
++#endif
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = NATIVE_SYSTEM_HEADER_DIR;
++#endif
++
+ const struct default_include cpp_include_defaults[]
+ #ifdef INCLUDE_DEFAULTS
+ = INCLUDE_DEFAULTS;
+@@ -42,38 +66,38 @@ const struct default_include cpp_include
+ = {
+ #ifdef GPLUSPLUS_INCLUDE_DIR
+     /* Pick up GNU C++ generic include files.  */
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
+     /* Pick up GNU C++ target-dependent include files.  */
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
+ #endif
+ #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
+     /* Pick up GNU C++ backward and deprecated include files.  */
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_DIR
+     /* This is the dir for gcc's private headers.  */
+-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_SUBDIR_TARGET
+     /* This is the dir for gcc's private headers under the specified sysroot.  */
+-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
+ #endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
+ #endif
+ #ifdef PREFIX_INCLUDE_DIR
+-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
+ #endif
+ #ifdef FIXED_INCLUDE_DIR
+     /* This is the dir for fixincludes.  */
+-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
+       /* A multilib suffix needs adding if different multilibs use
+ 	 different headers.  */
+ #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
+@@ -85,21 +109,21 @@ const struct default_include cpp_include
+ #endif
+ #ifdef CROSS_INCLUDE_DIR
+     /* One place the target system's headers might be.  */
+-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef TOOL_INCLUDE_DIR
+     /* Another place the target system's headers might be.  */
+-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
+ #endif
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+     /* /usr/include comes dead last.  */
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
+ #endif
+     { 0, 0, 0, 0, 0, 0 }
+   };
+ #endif /* no INCLUDE_DEFAULTS */
+ 
+ #ifdef GCC_INCLUDE_DIR
+ const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
+ const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
+Index: gcc-4.9.2/gcc/cppdefault.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/cppdefault.h
++++ gcc-4.9.2/gcc/cppdefault.h
+@@ -33,7 +33,8 @@
+ 
+ struct default_include
+ {
+-  const char *const fname;	/* The name of the directory.  */
++  const char *fname;     /* The name of the directory.  */
++
+   const char *const component;	/* The component containing the directory
+ 				   (see update_path in prefix.c) */
+   const char cplusplus;		/* Only look here if we're compiling C++.  */
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index dcd0819..8c07c2d 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -39,13 +39,14 @@ python gcc_multilib_setup() {
             bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
             bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
 
+    pn = d.getVar('PN', True)
     multilibs = (d.getVar('MULTILIB_VARIANTS', True) or '').split()
-    if not multilibs:
+    if not multilibs and pn != "nativesdk-gcc":
         return
 
     mlprefix = d.getVar('MLPREFIX', True)
-    pn = d.getVar('PN', True)
-    if ('%sgcc' % mlprefix) != pn and (not pn.startswith('gcc-cross-canadian')):
+
+    if ('%sgcc' % mlprefix) != pn and (not pn.startswith('gcc-cross-canadian')) and pn != "nativesdk-gcc":
         return
 
 
@@ -74,7 +75,7 @@ python gcc_multilib_setup() {
     def write_headers(root, files, libdir32, libdir64, libdirx32, libdirn32):
         def wrap_libdir(libdir):
             if libdir.find('SYSTEMLIBS_DIR') != -1:
-                return libdir
+                return '"%r"'
             else:
                 return '"/%s/"' % libdir
 
@@ -135,17 +136,23 @@ python gcc_multilib_setup() {
         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
     }
 
+    libdir32 = 'SYSTEMLIBS_DIR'
+    libdir64 = 'SYSTEMLIBS_DIR'
+    libdirx32 = 'SYSTEMLIBS_DIR'
+    libdirn32 = 'SYSTEMLIBS_DIR'
+
+
     target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlprefix
                     else d.getVar('TARGET_ARCH', True))
+    if pn == "nativesdk-gcc":
+        header_config_files = gcc_header_config_files[d.getVar("SDK_ARCH", True)]
+        write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
+        return
+
     if target_arch not in gcc_target_config_files:
         bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
         return
 
-    libdir32 = 'SYSTEMLIBS_DIR'
-    libdir64 = 'SYSTEMLIBS_DIR'
-    libdirx32 = 'SYSTEMLIBS_DIR'
-    libdirn32 = 'SYSTEMLIBS_DIR'
-
     target_config_files = gcc_target_config_files[target_arch]
     header_config_files = gcc_header_config_files[target_arch]
 
diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb b/meta/recipes-devtools/gcc/gcc_4.8.bb
index c4827c6..2c618df 100644
--- a/meta/recipes-devtools/gcc/gcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
@@ -5,3 +5,5 @@ require gcc-target.inc
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
 ARM_INSTRUCTION_SET_armv4 = "arm"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/gcc_4.9.bb b/meta/recipes-devtools/gcc/gcc_4.9.bb
index c4827c6..b84baae 100644
--- a/meta/recipes-devtools/gcc/gcc_4.9.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.9.bb
@@ -5,3 +5,10 @@ require gcc-target.inc
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
 ARM_INSTRUCTION_SET_armv4 = "arm"
+
+BBCLASSEXTEND = "nativesdk"
+
+#SYSTEMHEADERS_class-nativesdk = "${@'${target_includedir}'.replace(d.getVar('SDKPATH', True),'%r')}"
+#SYSTEMLIBS_class-nativesdk = "${@'${target_base_libdir}'.replace(d.getVar('SDKPATH', True),'%r')}/"
+#SYSTEMLIBS1_class-nativesdk = "${@'${target_libdir}'.replace(d.getVar('SDKPATH', True),'%r')}/"
+
diff --git a/meta/recipes-devtools/gcc/gcc_5.2.bb b/meta/recipes-devtools/gcc/gcc_5.2.bb
index 254cd7f..b0a523c 100644
--- a/meta/recipes-devtools/gcc/gcc_5.2.bb
+++ b/meta/recipes-devtools/gcc/gcc_5.2.bb
@@ -11,3 +11,5 @@ do_configure_prepend() {
 	# broken libtool here
 	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
 }
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index b2dd258..8b15072 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -161,7 +161,19 @@ def change_dl_sysdirs():
                 # write it back
                 f.seek(sh_offset)
                 f.write(new_ldsocache_path)
-
+            elif name == b(".gccrelocprefix"):
+                offset = 0
+                while (offset + 4096) <= sh_size:
+                    path = f.read(4096)
+                    new_path = old_prefix.sub(new_prefix, path)
+                    # pad with zeros
+                    new_path += b("\0") * (4096 - len(new_path))
+                    #print "Changing %s to %s at %s" % (str(path), str(new_path), str(offset))
+                    # write it back
+                    f.seek(sh_offset + offset)
+                    f.write(new_path)
+                    offset = offset + 4096
+                    print "size is" + str(sh_size)
     if sysdirs != "" and sysdirslen != "":
         paths = sysdirs.split(b("\0"))
         sysdirs = b("")



