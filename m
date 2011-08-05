Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMOA-0000dX-8j
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926404"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:28:04 -0700
Message-Id: <eef5340934132913857d9759150012c72c3e7a2d.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/14] libzypp: Increase the size of the arch compat table
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:43 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Fix [YOCTO #1313]

Increase the size of the arch compat table to 30 entries.

Also cleanup a few things related to Poky -> OE name changing.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Fixed up arm patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../arm-workaround-global-constructor.patch        |   23 ++++---
 .../libzypp/libzypp/libzypp-compatargs.patch       |   54 +++++++++++++++
 ...libzypp-pokyarch.patch => libzypp-oearch.patch} |   24 ++++----
 meta/recipes-extended/libzypp/libzypp_git.bb       |   69 ++++++++++----------
 4 files changed, 113 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
 rename meta/recipes-extended/libzypp/libzypp/{libzypp-pokyarch.patch => libzypp-oearch.patch} (98%)

diff --git a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
index 86458d7..bfdb29b 100644
--- a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
+++ b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
@@ -8,14 +8,15 @@ before the usage of _foo during the initialization of the compatibility
 table.
 
 The patch, along with a similar change to the recipe generation of the 
-poky-arch.h file, remove the DEF_BUILTIN globals and replace them with
+oe-arch.h file, remove the DEF_BUILTIN globals and replace them with
 immediate strings wherever they are used.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
---- git.orig/zypp/Arch.cc	2011-03-29 14:15:32.695079271 -0500
-+++ git/zypp/Arch.cc	2011-03-29 14:17:22.680910025 -0500
+Index: git/zypp/Arch.cc
+===================================================================
+--- git.orig/zypp/Arch.cc	2011-08-04 21:03:31.000000000 -0700
++++ git/zypp/Arch.cc	2011-08-04 21:04:16.635480895 -0700
 @@ -152,13 +152,10 @@
      // NOTE: Thake care CompatBits::IntT is able to provide one
      //       bit for each architecture.
@@ -24,13 +25,13 @@ diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
 -    DEF_BUILTIN( all );
 -    DEF_BUILTIN( any );
 -    DEF_BUILTIN( noarch );
- 
--#include "poky-arch.h"
--#undef DEF_BUILTIN
 +/* Global constructors are not working properly on ARM, avoid the
 + * known bad case and merge constructors in with the usages
 + */
  
+-#include "oe-arch.h"
+-#undef DEF_BUILTIN
+ 
      ///////////////////////////////////////////////////////////////////
      //
 @@ -227,9 +224,9 @@
@@ -46,7 +47,7 @@ diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
          ///////////////////////////////////////////////////////////////////
          // Define the CompatibleWith relation:
          //
-@@ -305,9 +302,9 @@
+@@ -331,9 +328,9 @@
    ///////////////////////////////////////////////////////////////////
  
    const Arch Arch_empty ( IdString::Empty );
@@ -57,9 +58,9 @@ diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
 +  const Arch Arch_any( IdString ( "any" ) );
 +  const Arch Arch_noarch( IdString ( "noarch" ) );
  
- #define POKY_PROTO 1
- #include "poky-arch.h"
-@@ -316,7 +316,7 @@
+ #define OE_PROTO 1
+ #include "oe-arch.h"
+@@ -345,7 +342,7 @@
    //	METHOD TYPE : Ctor
    //
    Arch::Arch()
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
new file mode 100644
index 0000000..9cd7a36
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
@@ -0,0 +1,54 @@
+zypp/Arch.cc: Add room for additional architecture compatibilities
+
+Upstream-status: Pending
+
+Increase the size of the compatibility table from 9 to 30.  There are already
+existing checks within libzypp to ensure that we don't overflow the 64-bit
+architecture field, so nothing further was required.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
+--- git.orig/zypp/Arch.cc	2011-08-02 16:40:37.696662889 -0500
++++ git/zypp/Arch.cc	2011-08-04 11:24:18.051745246 -0500
+@@ -280,13 +280,39 @@
+                               IdString arch6_r = IdString(),
+                               IdString arch7_r = IdString(),
+                               IdString arch8_r = IdString(),
+-                              IdString arch9_r = IdString() )
++                              IdString arch9_r = IdString(),
++                              IdString arch10_r = IdString(),
++                              IdString arch11_r = IdString(),
++                              IdString arch12_r = IdString(),
++                              IdString arch13_r = IdString(),
++                              IdString arch14_r = IdString(),
++                              IdString arch15_r = IdString(),
++                              IdString arch16_r = IdString(),
++                              IdString arch17_r = IdString(),
++                              IdString arch18_r = IdString(),
++                              IdString arch19_r = IdString(),
++                              IdString arch20_r = IdString(),
++                              IdString arch21_r = IdString(),
++                              IdString arch22_r = IdString(),
++                              IdString arch23_r = IdString(),
++                              IdString arch24_r = IdString(),
++                              IdString arch25_r = IdString(),
++                              IdString arch26_r = IdString(),
++                              IdString arch27_r = IdString(),
++                              IdString arch28_r = IdString(),
++                              IdString arch29_r = IdString(),
++                              IdString arch30_r = IdString() )
+       {
+         const CompatEntry & target( assertCompatSetEntry( targetArch_r ) );
+         target.addCompatBit( assertCompatSetEntry( arch0_r )._idBit );
+ #define _SETARG(N) if ( arch##N##_r.empty() ) return; target.addCompatBit( assertCompatSetEntry( arch##N##_r )._idBit )
+         _SETARG(1); _SETARG(2); _SETARG(3); _SETARG(4);
+         _SETARG(5); _SETARG(6); _SETARG(7); _SETARG(8); _SETARG(9);
++        _SETARG(10); _SETARG(11); _SETARG(12); _SETARG(13); _SETARG(14);
++        _SETARG(15); _SETARG(16); _SETARG(17); _SETARG(18); _SETARG(19);
++        _SETARG(20); _SETARG(21); _SETARG(22); _SETARG(23); _SETARG(24);
++        _SETARG(25); _SETARG(26); _SETARG(27); _SETARG(28); _SETARG(29);
++	_SETARG(30);
+ #undef _SETARG
+       }
+ 
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
similarity index 98%
rename from meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
rename to meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
index 1eab1e8..9a0e42b 100644
--- a/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
+++ b/meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
@@ -3,7 +3,7 @@ Upstream-Status: Inappropriate [distribution]
 Disable all of the internal architectures
 
 We disable all of the internal architectures and replace them with ones
-generated by the libzypp recipe as specified in the poky-arch.h.
+generated by the libzypp recipe as specified in the oe-arch.h.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
@@ -148,7 +148,7 @@ diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
 -
 -    DEF_BUILTIN( sh4 );
 -    DEF_BUILTIN( sh4a );
-+#include "poky-arch.h"
++#include "oe-arch.h"
  #undef DEF_BUILTIN
  
      ///////////////////////////////////////////////////////////////////
@@ -211,9 +211,9 @@ diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
 -        //
 -        defCompatibleWith( _sh4,	_noarch );
 -        defCompatibleWith( _sh4a,	_noarch,_sh4 );
-+#define POKY_DEF_COMPAT 1
-+#include "poky-arch.h"
-+#undef POKY_DEF_COMPAT
++#define OE_DEF_COMPAT 1
++#include "oe-arch.h"
++#undef OE_DEF_COMPAT
          //
          ///////////////////////////////////////////////////////////////////
          // dumpOn( USR ) << endl;
@@ -270,9 +270,9 @@ diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
 -
 -  const Arch Arch_sh4( _sh4 );
 -  const Arch Arch_sh4a( _sh4a );
-+#define POKY_PROTO 1
-+#include "poky-arch.h"
-+#undef POKY_PROTO
++#define OE_PROTO 1
++#include "oe-arch.h"
++#undef OE_PROTO
  
    ///////////////////////////////////////////////////////////////////
    //
@@ -398,9 +398,9 @@ diff -ur git.orig/zypp/Arch.h git/zypp/Arch.h
 -  extern const Arch Arch_sh4;
 -  /** \relates Arch */
 -  extern const Arch Arch_sh4a;
-+#define POKY_EXTERN_PROTO 1
-+#include "poky-arch.h"
-+#undef POKY_EXTERN_PROTO
++#define OE_EXTERN_PROTO 1
++#include "oe-arch.h"
++#undef OE_EXTERN_PROTO
    //@}
  
    ///////////////////////////////////////////////////////////////////
@@ -411,7 +411,7 @@ diff -ur git.orig/zypp/CMakeLists.txt git/zypp/CMakeLists.txt
  
  SET( zypp_HEADERS
    Arch.h
-+  poky-arch.h
++  oe-arch.h
    AutoDispose.h
    Bit.h
    ByteCount.h
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index bb36a90..1fc6809 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -14,16 +14,17 @@ RDEPENDS_${PN} = "sat-solver"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
            file://rpm5.patch \
            file://rpm5-no-rpmdbinit.patch \
 	   file://config-release.patch \
-	   file://libzypp-pokyarch.patch \
+	   file://libzypp-oearch.patch \
+	   file://libzypp-compatargs.patch \
 	   file://fix_for_compile_wth_gcc-4.6.0.patch \
-          file://hardcode-lib-fix.patch \
+	   file://hardcode-lib-fix.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
@@ -49,57 +50,57 @@ AVOID_CONSTRUCTOR_mips = "true"
 do_archgen () {
 	# We need to dynamically generate our arch file based on the machine
 	# configuration
-	echo "/* Automatically generated by the libzypp recipes */" 		 > zypp/poky-arch.h
-	echo "/* Avoid Constructor: ${AVOID_CONSTRUCTOR} */" 			 >> zypp/poky-arch.h
-	echo ""									>> zypp/poky-arch.h
-	echo "#ifndef POKY_ARCH_H"						>> zypp/poky-arch.h
-	echo "#define POKY_ARCH_H 1"						>> zypp/poky-arch.h
-	echo "#define Arch_machine Arch_${MACHINE_ARCH}" | tr - _		>> zypp/poky-arch.h
-	echo "#endif /* POKY_ARCH_H */"						>> zypp/poky-arch.h
-	echo ""									>> zypp/poky-arch.h
+	echo "/* Automatically generated by the libzypp recipes */" 		 > zypp/oe-arch.h
+	echo "/* Avoid Constructor: ${AVOID_CONSTRUCTOR} */" 			 >> zypp/oe-arch.h
+	echo ""									>> zypp/oe-arch.h
+	echo "#ifndef OE_ARCH_H"						>> zypp/oe-arch.h
+	echo "#define OE_ARCH_H 1"						>> zypp/oe-arch.h
+	echo "#define Arch_machine Arch_${MACHINE_ARCH}" | tr - _		>> zypp/oe-arch.h
+	echo "#endif /* OE_ARCH_H */"						>> zypp/oe-arch.h
+	echo ""									>> zypp/oe-arch.h
 	if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-	  echo "#ifdef DEF_BUILTIN"						>> zypp/poky-arch.h
-	  echo "/* Specify builtin types */"					>> zypp/poky-arch.h
+	  echo "#ifdef DEF_BUILTIN"						>> zypp/oe-arch.h
+	  echo "/* Specify builtin types */"					>> zypp/oe-arch.h
 	  for each_arch in ${PACKAGE_ARCHS} ; do
 		case "$each_arch" in
 			all | any | noarch)
 				continue;;
 		esac
-		echo "    DEF_BUILTIN( ${each_arch} );"	 | tr - _		>> zypp/poky-arch.h
+		echo "    DEF_BUILTIN( ${each_arch} );"	 | tr - _		>> zypp/oe-arch.h
 	  done
-	  echo "#endif /* DEF_BUILTIN */"						>> zypp/poky-arch.h
-	  echo ""									>> zypp/poky-arch.h
+	  echo "#endif /* DEF_BUILTIN */"						>> zypp/oe-arch.h
+	  echo ""									>> zypp/oe-arch.h
 	fi
-	echo "#ifdef POKY_EXTERN_PROTO"						>> zypp/poky-arch.h
-	echo "/* Specify extern prototypes */"					>> zypp/poky-arch.h
+	echo "#ifdef OE_EXTERN_PROTO"						>> zypp/oe-arch.h
+	echo "/* Specify extern prototypes */"					>> zypp/oe-arch.h
 	for each_arch in ${PACKAGE_ARCHS} ; do
 		case "$each_arch" in
 			all | any | noarch)
 				continue;;
 		esac
-		echo "  extern const Arch Arch_${each_arch};" | tr - _		>> zypp/poky-arch.h
+		echo "  extern const Arch Arch_${each_arch};" | tr - _		>> zypp/oe-arch.h
 	done
-	echo "#endif /* POKY_EXTERN_PROTO */"					>> zypp/poky-arch.h
-	echo ""									>> zypp/poky-arch.h
-	echo "#ifdef POKY_PROTO"						>> zypp/poky-arch.h
-	echo "/* Specify prototypes */"						>> zypp/poky-arch.h
+	echo "#endif /* OE_EXTERN_PROTO */"					>> zypp/oe-arch.h
+	echo ""									>> zypp/oe-arch.h
+	echo "#ifdef OE_PROTO"						>> zypp/oe-arch.h
+	echo "/* Specify prototypes */"						>> zypp/oe-arch.h
 	for each_arch in ${PACKAGE_ARCHS} ; do
 		case "$each_arch" in
 			all | any | noarch)
 				continue;;
 		esac
 		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/poky-arch.h
-		  echo "(_${each_arch});" 					>> zypp/poky-arch.h
+		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
+		  echo "(_${each_arch});" 					>> zypp/oe-arch.h
 		else
-		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/poky-arch.h
-		  echo "( IdString ( \"${each_arch}\" ) );" 			>> zypp/poky-arch.h
+		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
+		  echo "( IdString ( \"${each_arch}\" ) );" 			>> zypp/oe-arch.h
 		fi
 	done
-	echo "#endif /* POKY_PROTO */"						>> zypp/poky-arch.h
-	echo ""									>> zypp/poky-arch.h
-	echo "#ifdef POKY_DEF_COMPAT"						>> zypp/poky-arch.h
-	echo "/* Specify compatibility information */"				>> zypp/poky-arch.h
+	echo "#endif /* OE_PROTO */"						>> zypp/oe-arch.h
+	echo ""									>> zypp/oe-arch.h
+	echo "#ifdef OE_DEF_COMPAT"						>> zypp/oe-arch.h
+	echo "/* Specify compatibility information */"				>> zypp/oe-arch.h
 	INSTALL_PLATFORM_ARCHS=""
 	for each_arch in ${PACKAGE_ARCHS} ; do
 		INSTALL_PLATFORM_ARCHS="$each_arch $INSTALL_PLATFORM_ARCHS"
@@ -134,10 +135,10 @@ do_archgen () {
 		COMPAT_WITH="${CARCH},${COMPAT} $COMPAT_WITH"
 	done
 	for each_compat in ${COMPAT_WITH} ; do
-		echo "        defCompatibleWith( ${each_compat} );"		>> zypp/poky-arch.h
+		echo "        defCompatibleWith( ${each_compat} );"		>> zypp/oe-arch.h
 	done
-	echo "#endif /* DEF_COMPAT */"						>> zypp/poky-arch.h
-	echo ""									>> zypp/poky-arch.h
+	echo "#endif /* DEF_COMPAT */"						>> zypp/oe-arch.h
+	echo ""									>> zypp/oe-arch.h
 }
 
 addtask archgen before do_configure after do_patch
-- 
1.7.3.4



