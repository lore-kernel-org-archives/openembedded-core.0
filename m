Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxzOu-0007zf-0k
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:26:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2013 04:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,521,1355126400"; d="scan'208";a="275597147"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2013 04:10:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 12:10:11 +0000
Message-Id: <50e5e685f695c539bd9c76d7cc195a402c489509.1358942978.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] libzypp: remove
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
X-List-Received-Date: Wed, 23 Jan 2013 12:26:14 -0000

This was only needed by zypper, which has itself been removed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../arm-workaround-global-constructor.patch        |   71 ---
 meta/recipes-extended/libzypp/libzypp/close.patch  |   32 --
 .../libzypp/libzypp/config-release.patch           |   23 -
 meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 --
 .../libzypp/fix_for_compile_wth_gcc-4.6.0.patch    |   22 -
 .../libzypp/libzypp/hardcode-lib-fix.patch         |   22 -
 .../libzypp/libzypp/libzypp-compatargs.patch       |   54 ---
 .../libzypp/libzypp/libzypp-oearch.patch           |  500 --------------------
 .../libzypp/libzypp/libzypp-rpm549.patch           |   32 --
 .../mips-workaround-gcc-tribool-error.patch        |   24 -
 meta/recipes-extended/libzypp/libzypp/no-doc.patch |   33 --
 .../libzypp/libzypp/rpm5-no-rpmdbinit.patch        |   27 --
 meta/recipes-extended/libzypp/libzypp/rpm5.patch   |   32 --
 meta/recipes-extended/libzypp/libzypp_git.bb       |  160 -------
 14 files changed, 1081 deletions(-)
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/close.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/config-release.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/no-doc.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/rpm5.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp_git.bb

diff --git a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
deleted file mode 100644
index bfdb29b..0000000
--- a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream-Status: Pending
-
-Workaround a problem with the C++ global constructors on ARM.
-
-As documented in the Yocto Bugzilla bug 938, the global constructors 
-that define DEF_BUILTIN [const IdString _foo ( "foo" );] are not running 
-before the usage of _foo during the initialization of the compatibility 
-table.
-
-The patch, along with a similar change to the recipe generation of the 
-oe-arch.h file, remove the DEF_BUILTIN globals and replace them with
-immediate strings wherever they are used.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: git/zypp/Arch.cc
-===================================================================
---- git.orig/zypp/Arch.cc	2011-08-04 21:03:31.000000000 -0700
-+++ git/zypp/Arch.cc	2011-08-04 21:04:16.635480895 -0700
-@@ -152,13 +152,10 @@
-     // NOTE: Thake care CompatBits::IntT is able to provide one
-     //       bit for each architecture.
-     //
--#define DEF_BUILTIN(A) const IdString  _##A( #A );
--    DEF_BUILTIN( all );
--    DEF_BUILTIN( any );
--    DEF_BUILTIN( noarch );
-+/* Global constructors are not working properly on ARM, avoid the
-+ * known bad case and merge constructors in with the usages
-+ */
- 
--#include "oe-arch.h"
--#undef DEF_BUILTIN
- 
-     ///////////////////////////////////////////////////////////////////
-     //
-@@ -227,9 +224,9 @@
-         // _noarch must have _idBit 0.
-         // Other builtins have 1-bit set
-         // and are initialized done on the fly.
--        _compatSet.insert( Arch::CompatEntry( _all, 0 ) );
--        _compatSet.insert( Arch::CompatEntry( _any, 0 ) );
--        _compatSet.insert( Arch::CompatEntry( _noarch, 0 ) );
-+        _compatSet.insert( Arch::CompatEntry( IdString ( "all" ), 0 ) );
-+        _compatSet.insert( Arch::CompatEntry( IdString ( "any" ), 0 ) );
-+        _compatSet.insert( Arch::CompatEntry( IdString ( "noarch" ), 0 ) );
-         ///////////////////////////////////////////////////////////////////
-         // Define the CompatibleWith relation:
-         //
-@@ -331,9 +328,9 @@
-   ///////////////////////////////////////////////////////////////////
- 
-   const Arch Arch_empty ( IdString::Empty );
--  const Arch Arch_all( _all );
--  const Arch Arch_any( _any );
--  const Arch Arch_noarch( _noarch );
-+  const Arch Arch_all( IdString ( "all" ) );
-+  const Arch Arch_any( IdString ( "any" ) );
-+  const Arch Arch_noarch( IdString ( "noarch" ) );
- 
- #define OE_PROTO 1
- #include "oe-arch.h"
-@@ -345,7 +342,7 @@
-   //	METHOD TYPE : Ctor
-   //
-   Arch::Arch()
--  : _entry( &ArchCompatSet::instance().assertDef( _noarch ) )
-+  : _entry( &ArchCompatSet::instance().assertDef( IdString ( "noarch" ) ) )
-   {}
- 
-   Arch::Arch( IdString::IdType id_r )
diff --git a/meta/recipes-extended/libzypp/libzypp/close.patch b/meta/recipes-extended/libzypp/libzypp/close.patch
deleted file mode 100644
index 0ff1825..0000000
--- a/meta/recipes-extended/libzypp/libzypp/close.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-close() is used without a protype therefore we include unistd.h
-Fixes compile errors like below
-
-/home/kraj/work/openembedded-core/build/tmp-eglibc/work/qemuppc-oe-linux/libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r18/git/zypp/ExternalProgram.h:239:47: error: '::close' has not been declared
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: git/zypp/ExternalProgram.h
-===================================================================
---- git.orig/zypp/ExternalProgram.h	2012-03-23 08:27:31.716438539 -0700
-+++ git/zypp/ExternalProgram.h	2012-03-23 08:27:54.520439367 -0700
-@@ -16,6 +16,7 @@
- #include <map>
- #include <string>
- #include <vector>
-+#include <unistd.h>
- 
- #include "zypp/base/ExternalDataSource.h"
- #include "zypp/Pathname.h"
-Index: git/zypp/base/Random.cc
-===================================================================
---- git.orig/zypp/base/Random.cc	2012-03-23 08:31:09.732449118 -0700
-+++ git/zypp/base/Random.cc	2012-03-23 08:31:36.240450324 -0700
-@@ -3,6 +3,7 @@
- #include <cstdio>
- #include <iostream>
- #include <fcntl.h>
-+#include <unistd.h>
- #include "zypp/base/Random.h"
- 
- using namespace std;
diff --git a/meta/recipes-extended/libzypp/libzypp/config-release.patch b/meta/recipes-extended/libzypp/libzypp/config-release.patch
deleted file mode 100644
index 26c7307..0000000
--- a/meta/recipes-extended/libzypp/libzypp/config-release.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-Configure distro version package
-
-We need to configure a package that the system can use to determine the
-system distribution version.
-
-Hack: for now set to packagegroup-core-rpm.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig/zypp/ZConfig.cc git/zypp/ZConfig.cc
---- git.orig/zypp/ZConfig.cc	2011-03-14 16:30:07.492786134 -0500
-+++ git/zypp/ZConfig.cc	2011-03-15 11:39:15.396801927 -0500
-@@ -821,7 +821,7 @@
-   ///////////////////////////////////////////////////////////////////
- 
-   std::string ZConfig::distroverpkg() const
--  { return "redhat-release"; }
-+  { return "packagegroup-core-rpm"; }
- 
-   ///////////////////////////////////////////////////////////////////
- 
diff --git a/meta/recipes-extended/libzypp/libzypp/cstdio.patch b/meta/recipes-extended/libzypp/libzypp/cstdio.patch
deleted file mode 100644
index a021d58..0000000
--- a/meta/recipes-extended/libzypp/libzypp/cstdio.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-include cstdio to get definitions of ::xxx functions which
-are now reported by gcc-4.7 as wanrings and warnings are treated
-as errors
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: git/zypp/ExternalProgram.cc
-===================================================================
---- git.orig/zypp/ExternalProgram.cc	2012-06-01 16:25:17.098304709 -0700
-+++ git/zypp/ExternalProgram.cc	2012-06-01 16:25:37.254305681 -0700
-@@ -22,6 +22,7 @@
- #include <cstring> // strsignal
- #include <iostream>
- #include <sstream>
-+#include <cstdio>
- 
- #include "zypp/base/Logger.h"
- #include "zypp/base/String.h"
-Index: git/zypp/PluginScript.cc
-===================================================================
---- git.orig/zypp/PluginScript.cc	2012-06-01 16:21:37.814294089 -0700
-+++ git/zypp/PluginScript.cc	2012-06-01 16:24:41.002302961 -0700
-@@ -14,6 +14,7 @@
- 
- #include <iostream>
- #include <sstream>
-+#include <cstdio>
- 
- #include "zypp/base/LogTools.h"
- #include "zypp/base/DefaultIntegral.h"
-@@ -336,7 +337,7 @@
-     if ( fd == -1 )
-       ZYPP_THROW( PluginScriptException( "Bad file descriptor" ) );
- 
--    ::clearerr( filep );
-+    std::clearerr( filep );
-     std::string data;
-     {
-       PluginDebugBuffer _debug( data ); // dump receive buffer if PLUGIN_DEBUG
-@@ -370,7 +371,7 @@
- 	    int retval = select( fd+1, &rfds, NULL, NULL, &tv );
- 	    if ( retval > 0 )	// FD_ISSET( fd, &rfds ) will be true.
- 	    {
--	      ::clearerr( filep );
-+	      std::clearerr( filep );
- 	    }
- 	    else if ( retval == 0 )
- 	    {
diff --git a/meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch b/meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
deleted file mode 100644
index 0f17b48..0000000
--- a/meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Pending
-
-Fix following compilation errors with gcc 4.6.0
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/09
-
-| i586-poky-linux-g++: error: unrecognized option '--as-needed'
-| make[2]: *** [zypp/libzypp.so.810.1.0] Error 1
-
-
-Index: git/zypp/CMakeLists.txt
-===================================================================
---- git.orig/zypp/CMakeLists.txt
-+++ git/zypp/CMakeLists.txt
-@@ -903,7 +903,7 @@ SET_LOGGROUP( "satsolver" ${zypp_sat_SRC
- ADD_LIBRARY(zypp SHARED ${zypp_lib_SRCS})
- SET_TARGET_PROPERTIES( zypp PROPERTIES VERSION "${LIBZYPP_VERSION_INFO}" )
- SET_TARGET_PROPERTIES( zypp PROPERTIES SOVERSION "${LIBZYPP_SOVERSION_INFO}" )
--SET_TARGET_PROPERTIES( zypp PROPERTIES LINK_FLAGS "--as-needed" )
-+SET_TARGET_PROPERTIES( zypp PROPERTIES LINK_FLAGS "-Wl,--as-needed" )
- ADD_DEPENDENCIES(zypp schema_header)
- # System libraries
- SET(UTIL_LIBRARY util)
diff --git a/meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch b/meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
deleted file mode 100644
index c11f5c5..0000000
--- a/meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-tools/CMakeLists.txt: replace the hardcode "lib"
-
-replace the hardcode "lib" with LIB_INSTALL_DIR
-this will work with non /usr/lib libdir case
-
-Upstream-Status: Pending
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-Index: libzypp/tools/CMakeLists.txt
-===================================================================
---- libzypp.orig/tools/CMakeLists.txt
-+++ libzypp/tools/CMakeLists.txt
-@@ -1,7 +1,7 @@
- 
- ADD_SUBDIRECTORY( package-manager )
- 
--INSTALL( FILES notify-message DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/zypp" )
-+INSTALL( FILES notify-message DESTINATION "${LIB_INSTALL_DIR}/zypp" )
- 
- ## ############################################################
- 
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
deleted file mode 100644
index 8d24ab0..0000000
--- a/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-zypp/Arch.cc: Add room for additional architecture compatibilities
-
-Upstream-Status: Pending
-
-Increase the size of the compatibility table from 9 to 30.  There are already
-existing checks within libzypp to ensure that we don't overflow the 64-bit
-architecture field, so nothing further was required.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
---- git.orig/zypp/Arch.cc	2011-08-02 16:40:37.696662889 -0500
-+++ git/zypp/Arch.cc	2011-08-04 11:24:18.051745246 -0500
-@@ -280,13 +280,39 @@
-                               IdString arch6_r = IdString(),
-                               IdString arch7_r = IdString(),
-                               IdString arch8_r = IdString(),
--                              IdString arch9_r = IdString() )
-+                              IdString arch9_r = IdString(),
-+                              IdString arch10_r = IdString(),
-+                              IdString arch11_r = IdString(),
-+                              IdString arch12_r = IdString(),
-+                              IdString arch13_r = IdString(),
-+                              IdString arch14_r = IdString(),
-+                              IdString arch15_r = IdString(),
-+                              IdString arch16_r = IdString(),
-+                              IdString arch17_r = IdString(),
-+                              IdString arch18_r = IdString(),
-+                              IdString arch19_r = IdString(),
-+                              IdString arch20_r = IdString(),
-+                              IdString arch21_r = IdString(),
-+                              IdString arch22_r = IdString(),
-+                              IdString arch23_r = IdString(),
-+                              IdString arch24_r = IdString(),
-+                              IdString arch25_r = IdString(),
-+                              IdString arch26_r = IdString(),
-+                              IdString arch27_r = IdString(),
-+                              IdString arch28_r = IdString(),
-+                              IdString arch29_r = IdString(),
-+                              IdString arch30_r = IdString() )
-       {
-         const CompatEntry & target( assertCompatSetEntry( targetArch_r ) );
-         target.addCompatBit( assertCompatSetEntry( arch0_r )._idBit );
- #define _SETARG(N) if ( arch##N##_r.empty() ) return; target.addCompatBit( assertCompatSetEntry( arch##N##_r )._idBit )
-         _SETARG(1); _SETARG(2); _SETARG(3); _SETARG(4);
-         _SETARG(5); _SETARG(6); _SETARG(7); _SETARG(8); _SETARG(9);
-+        _SETARG(10); _SETARG(11); _SETARG(12); _SETARG(13); _SETARG(14);
-+        _SETARG(15); _SETARG(16); _SETARG(17); _SETARG(18); _SETARG(19);
-+        _SETARG(20); _SETARG(21); _SETARG(22); _SETARG(23); _SETARG(24);
-+        _SETARG(25); _SETARG(26); _SETARG(27); _SETARG(28); _SETARG(29);
-+	_SETARG(30);
- #undef _SETARG
-       }
- 
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
deleted file mode 100644
index 9a0e42b..0000000
--- a/meta/recipes-extended/libzypp/libzypp/libzypp-oearch.patch
+++ /dev/null
@@ -1,500 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
-Disable all of the internal architectures
-
-We disable all of the internal architectures and replace them with ones
-generated by the libzypp recipe as specified in the oe-arch.h.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig/tests/lib/TestSetup.h git/tests/lib/TestSetup.h
---- git.orig/tests/lib/TestSetup.h	2011-03-28 14:24:36.534800770 -0500
-+++ git/tests/lib/TestSetup.h	2011-03-28 14:25:04.969912234 -0500
-@@ -66,7 +66,7 @@
-  *   // enabls loging fot the scope of this block:
-  *   // base::LogControl::TmpLineWriter shutUp( new log::FileLineWriter( "/tmp/YLOG" ) );
-  *
-- *   TestSetup test( Arch_x86_64 );
-+ *   TestSetup test( Arch_machine );
-  *   // test.loadTarget(); // initialize and load target
-  *   test.loadRepo( TESTS_SRC_DIR"/data/openSUSE-11.1" );
-  *
-@@ -313,7 +313,7 @@
-      * a TestSetup system or a real system. The  provided repostitories are
-      * loaded into the pool (without refresh).
-     */
--    static void LoadSystemAt( const Pathname & sysRoot, const Arch & _testSetupArch_r = Arch_x86_64 )
-+    static void LoadSystemAt( const Pathname & sysRoot, const Arch & _testSetupArch_r = Arch_machine )
-     {
-       if ( ! PathInfo( sysRoot ).isDir() )
-         ZYPP_THROW( Exception("sysRoot argument needs to be a directory") );
-diff -ur git.orig/tools/DumpSelectable.cc git/tools/DumpSelectable.cc
---- git.orig/tools/DumpSelectable.cc	2011-03-28 14:24:36.547876951 -0500
-+++ git/tools/DumpSelectable.cc	2011-03-28 14:25:04.969912234 -0500
-@@ -78,7 +78,7 @@
-   else if ( TestSetup::isTestSetup( sysRoot ) )
-   {
-     message << str::form( "*** Load TestSetup from '%s'", sysRoot.c_str() ) << endl;
--    TestSetup test( sysRoot, Arch_x86_64 );
-+    TestSetup test( sysRoot, Arch_machine );
-     test.loadRepos();
-   }
-   else
-diff -ur git.orig/tools/NameReqPrv.cc git/tools/NameReqPrv.cc
---- git.orig/tools/NameReqPrv.cc	2011-03-28 14:24:36.547876951 -0500
-+++ git/tools/NameReqPrv.cc	2011-03-28 14:25:04.970849384 -0500
-@@ -112,7 +112,7 @@
-   else if ( TestSetup::isTestSetup( sysRoot ) )
-   {
-     message << str::form( "*** Load TestSetup from '%s'", sysRoot.c_str() ) << endl;
--    TestSetup test( sysRoot, Arch_x86_64 );
-+    TestSetup test( sysRoot, Arch_machine );
-     test.loadRepos();
-     dumpRange( message, satpool.reposBegin(), satpool.reposEnd() ) << endl;
-   }
-diff -ur git.orig/tools/ToolScanRepos.cc git/tools/ToolScanRepos.cc
---- git.orig/tools/ToolScanRepos.cc	2011-03-28 14:24:36.547876951 -0500
-+++ git/tools/ToolScanRepos.cc	2011-03-28 14:25:04.970849384 -0500
-@@ -46,7 +46,7 @@
-   ///////////////////////////////////////////////////////////////////
-   Pathname mtmp( "/tmp" );
-   Pathname mroot( mtmp/appname );
--  Arch     march( Arch_x86_64 );
-+  Arch     march( Arch_machine );
-   bool     oClearRoot = true;
- 
-   std::vector<std::string> urls;
-@@ -83,7 +83,7 @@
-       if ( *(argv[0]) ) // empty
-         march = Arch( argv[0] );
-       else
--        march = Arch_x86_64;
-+        march = Arch_machine;
-     }
-    else
-     {
-@@ -131,4 +131,4 @@
- 
-   INT << "===[END]============================================" << endl << endl;
-   return ret;
--}
-\ No newline at end of file
-+}
-diff -ur git.orig/tools/zypp-list.cc git/tools/zypp-list.cc
---- git.orig/tools/zypp-list.cc	2011-03-28 14:24:36.547876951 -0500
-+++ git/tools/zypp-list.cc	2011-03-28 14:25:04.971901224 -0500
-@@ -56,7 +56,7 @@
-   else if ( TestSetup::isTestSetup( sysRoot ) )
-   {
-     message << str::form( "*** Load TestSetup from '%s'", sysRoot.c_str() ) << endl;
--    TestSetup test( sysRoot, Arch_x86_64 );
-+    TestSetup test( sysRoot, Arch_machine );
-     test.loadRepos();
-     dumpRange( message, satpool.reposBegin(), satpool.reposEnd() ) << endl;
-   }
-diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
---- git.orig/zypp/Arch.cc	2011-03-28 14:24:36.548877414 -0500
-+++ git/zypp/Arch.cc	2011-03-28 14:31:13.943786442 -0500
-@@ -153,53 +153,11 @@
-     //       bit for each architecture.
-     //
- #define DEF_BUILTIN(A) const IdString  _##A( #A );
-+    DEF_BUILTIN( all );
-+    DEF_BUILTIN( any );
-     DEF_BUILTIN( noarch );
- 
--    DEF_BUILTIN( i386 );
--    DEF_BUILTIN( i486 );
--    DEF_BUILTIN( i586 );
--    DEF_BUILTIN( i686 );
--    DEF_BUILTIN( athlon );
--    DEF_BUILTIN( x86_64 );
--
--    DEF_BUILTIN( pentium3 );
--    DEF_BUILTIN( pentium4 );
--
--    DEF_BUILTIN( s390 );
--    DEF_BUILTIN( s390x );
--
--    DEF_BUILTIN( ppc );
--    DEF_BUILTIN( ppc64 );
--
--    DEF_BUILTIN( ia64 );
--
--    DEF_BUILTIN( alphaev67 );
--    DEF_BUILTIN( alphaev6 );
--    DEF_BUILTIN( alphapca56 );
--    DEF_BUILTIN( alphaev56 );
--    DEF_BUILTIN( alphaev5 );
--    DEF_BUILTIN( alpha );
--
--    DEF_BUILTIN( sparc64v );
--    DEF_BUILTIN( sparcv9v );
--    DEF_BUILTIN( sparc64 );
--    DEF_BUILTIN( sparcv9 );
--    DEF_BUILTIN( sparcv8 );
--    DEF_BUILTIN( sparc );
--
--    DEF_BUILTIN( armv7l );
--    DEF_BUILTIN( armv6l );
--    DEF_BUILTIN( armv5tejl );
--    DEF_BUILTIN( armv5tel );
--    DEF_BUILTIN( armv5l );
--    DEF_BUILTIN( armv4tl );
--    DEF_BUILTIN( armv4l );
--    DEF_BUILTIN( armv3l );
--
--    DEF_BUILTIN( sh3 );
--
--    DEF_BUILTIN( sh4 );
--    DEF_BUILTIN( sh4a );
-+#include "oe-arch.h"
- #undef DEF_BUILTIN
- 
-     ///////////////////////////////////////////////////////////////////
-@@ -269,6 +227,8 @@
-         // _noarch must have _idBit 0.
-         // Other builtins have 1-bit set
-         // and are initialized done on the fly.
-+        _compatSet.insert( Arch::CompatEntry( _all, 0 ) );
-+        _compatSet.insert( Arch::CompatEntry( _any, 0 ) );
-         _compatSet.insert( Arch::CompatEntry( _noarch, 0 ) );
-         ///////////////////////////////////////////////////////////////////
-         // Define the CompatibleWith relation:
-@@ -276,52 +236,9 @@
-         // NOTE: Order of definition is significant! (Arch::compare)
- 	//       - define compatible (less) architectures first!
-         //
--        defCompatibleWith( _i386,	_noarch );
--        defCompatibleWith( _i486,	_noarch,_i386 );
--        defCompatibleWith( _i586,	_noarch,_i386,_i486 );
--        defCompatibleWith( _i686,	_noarch,_i386,_i486,_i586 );
--        defCompatibleWith( _athlon,	_noarch,_i386,_i486,_i586,_i686 );
--        defCompatibleWith( _x86_64,	_noarch,_i386,_i486,_i586,_i686,_athlon );
--
--        defCompatibleWith( _pentium3,	_noarch,_i386,_i486,_i586,_i686 );
--        defCompatibleWith( _pentium4,	_noarch,_i386,_i486,_i586,_i686,_pentium3 );
--
--        defCompatibleWith( _ia64,	_noarch,_i386,_i486,_i586,_i686 );
--        //
--        defCompatibleWith( _s390,	_noarch );
--        defCompatibleWith( _s390x,	_noarch,_s390 );
--        //
--        defCompatibleWith( _ppc,	_noarch );
--        defCompatibleWith( _ppc64,	_noarch,_ppc );
--        //
--        defCompatibleWith( _alpha,	_noarch );
--        defCompatibleWith( _alphaev5,	_noarch,_alpha );
--        defCompatibleWith( _alphaev56,	_noarch,_alpha,_alphaev5 );
--        defCompatibleWith( _alphapca56,	_noarch,_alpha,_alphaev5,_alphaev56 );
--        defCompatibleWith( _alphaev6,	_noarch,_alpha,_alphaev5,_alphaev56,_alphapca56 );
--        defCompatibleWith( _alphaev67,	_noarch,_alpha,_alphaev5,_alphaev56,_alphapca56,_alphaev6 );
--        //
--        defCompatibleWith( _sparc,	_noarch );
--        defCompatibleWith( _sparcv8,	_noarch,_sparc );
--        defCompatibleWith( _sparcv9,	_noarch,_sparc,_sparcv8 );
--	defCompatibleWith( _sparcv9v,	_noarch,_sparc,_sparcv8,_sparcv9 );
--	//
--        defCompatibleWith( _sparc64,	_noarch,_sparc,_sparcv8,_sparcv9 );
--	defCompatibleWith( _sparc64v,	_noarch,_sparc,_sparcv8,_sparcv9,_sparcv9v,_sparc64 );
--        //
--        defCompatibleWith( _armv3l,	_noarch );
--        defCompatibleWith( _armv4l,	_noarch,_armv3l );
--        defCompatibleWith( _armv4tl,	_noarch,_armv3l,_armv4l );
--        defCompatibleWith( _armv5l,	_noarch,_armv3l,_armv4l,_armv4tl );
--        defCompatibleWith( _armv5tel,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l );
--        defCompatibleWith( _armv5tejl,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l,_armv5tel );
--        defCompatibleWith( _armv6l,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l,_armv5tel,_armv5tejl );
--        defCompatibleWith( _armv7l,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l,_armv5tel,_armv5tejl,_armv6l );
--        //
--        defCompatibleWith( _sh3,	_noarch );
--        //
--        defCompatibleWith( _sh4,	_noarch );
--        defCompatibleWith( _sh4a,	_noarch,_sh4 );
-+#define OE_DEF_COMPAT 1
-+#include "oe-arch.h"
-+#undef OE_DEF_COMPAT
-         //
-         ///////////////////////////////////////////////////////////////////
-         // dumpOn( USR ) << endl;
-@@ -388,53 +305,13 @@
-   ///////////////////////////////////////////////////////////////////
- 
-   const Arch Arch_empty ( IdString::Empty );
-+  const Arch Arch_all( _all );
-+  const Arch Arch_any( _any );
-   const Arch Arch_noarch( _noarch );
- 
--  const Arch Arch_i386( _i386 );
--  const Arch Arch_i486( _i486 );
--  const Arch Arch_i586( _i586 );
--  const Arch Arch_i686( _i686 );
--  const Arch Arch_athlon( _athlon );
--  const Arch Arch_x86_64( _x86_64 );
--
--  const Arch Arch_pentium3( _pentium3 );
--  const Arch Arch_pentium4( _pentium4 );
--
--  const Arch Arch_s390( _s390 );
--  const Arch Arch_s390x( _s390x );
--
--  const Arch Arch_ppc( _ppc );
--  const Arch Arch_ppc64( _ppc64 );
--
--  const Arch Arch_ia64( _ia64 );
--
--  const Arch Arch_alphaev67( _alphaev67 );
--  const Arch Arch_alphaev6( _alphaev6 );
--  const Arch Arch_alphapca56( _alphapca56 );
--  const Arch Arch_alphaev56( _alphaev56 );
--  const Arch Arch_alphaev5( _alphaev5 );
--  const Arch Arch_alpha( _alpha );
--
--  const Arch Arch_sparc64v( _sparc64v );
--  const Arch Arch_sparc64( _sparc64 );
--  const Arch Arch_sparcv9v( _sparcv9v );
--  const Arch Arch_sparcv9( _sparcv9 );
--  const Arch Arch_sparcv8( _sparcv8 );
--  const Arch Arch_sparc( _sparc );
--
--  const Arch Arch_armv7l( _armv7l );
--  const Arch Arch_armv6l( _armv6l );
--  const Arch Arch_armv5tejl( _armv5tejl );
--  const Arch Arch_armv5tel( _armv5tel );
--  const Arch Arch_armv5l( _armv5l );
--  const Arch Arch_armv4tl( _armv4tl );
--  const Arch Arch_armv4l( _armv4l );
--  const Arch Arch_armv3l( _armv3l );
--
--  const Arch Arch_sh3( _sh3 );
--
--  const Arch Arch_sh4( _sh4 );
--  const Arch Arch_sh4a( _sh4a );
-+#define OE_PROTO 1
-+#include "oe-arch.h"
-+#undef OE_PROTO
- 
-   ///////////////////////////////////////////////////////////////////
-   //
-@@ -504,26 +381,10 @@
-   //
-   Arch Arch::baseArch( ) const
-   {
--    // check the multilib archs:
--    if (Arch_x86_64.compatibleWith(*this))
--    {
--      return Arch_x86_64;
--    }
--    if (Arch_sparc64v.compatibleWith(*this))
--    {
--      return Arch_sparc64v;
--    }
--    if (Arch_sparc64.compatibleWith(*this))
--    {
--      return Arch_sparc64;
--    }
--    if (Arch_ppc64.compatibleWith(*this))
--    {
--      return Arch_ppc64;
--    }
--    if (Arch_s390x.compatibleWith(*this))
-+    // Check the multilib arch:
-+    if (Arch_machine.compatibleWith(*this))
-     {
--      return Arch_s390x;
-+      return Arch_machine;
-     }
-     // Here: no multilib; return arch before noarch
-     CompatSet cset( compatSet( *this ) );
-diff -ur git.orig/zypp/Arch.h git/zypp/Arch.h
---- git.orig/zypp/Arch.h	2011-03-28 14:24:36.548877414 -0500
-+++ git/zypp/Arch.h	2011-03-28 14:25:04.972801208 -0500
-@@ -162,89 +162,13 @@
-   extern const Arch Arch_empty;
- 
-   /** \relates Arch */
-+  extern const Arch Arch_all;
-+  extern const Arch Arch_any;
-   extern const Arch Arch_noarch;
- 
--  /** \relates Arch */
--  extern const Arch Arch_pentium4;
--  /** \relates Arch */
--  extern const Arch Arch_pentium3;
--
--  /** \relates Arch */
--  extern const Arch Arch_x86_64;
--  /** \relates Arch */
--  extern const Arch Arch_athlon;
--  /** \relates Arch */
--  extern const Arch Arch_i686;
--  /** \relates Arch */
--  extern const Arch Arch_i586;
--  /** \relates Arch */
--  extern const Arch Arch_i486;
--  /** \relates Arch */
--  extern const Arch Arch_i386;
--
--  /** \relates Arch */
--  extern const Arch Arch_s390x;
--  /** \relates Arch */
--  extern const Arch Arch_s390;
--
--  /** \relates Arch */
--  extern const Arch Arch_ppc64;
--  /** \relates Arch */
--  extern const Arch Arch_ppc;
--
--  /** \relates Arch */
--  extern const Arch Arch_ia64;
--
--  /** \relates Arch */
--  extern const Arch Arch_alphaev67;
--  /** \relates Arch */
--  extern const Arch Arch_alphaev6;
--  /** \relates Arch */
--  extern const Arch Arch_alphapca56;
--  /** \relates Arch */
--  extern const Arch Arch_alphaev56;
--  /** \relates Arch */
--  extern const Arch Arch_alphaev5;
--  /** \relates Arch */
--  extern const Arch Arch_alpha;
--
--   /** \relates Arch */
--  extern const Arch Arch_sparc64v;
--  /** \relates Arch */
--  extern const Arch Arch_sparc64;
--  /** \relates Arch */
--  extern const Arch Arch_sparcv9v;
--  /** \relates Arch */
--  extern const Arch Arch_sparcv9;
--  /** \relates Arch */
--  extern const Arch Arch_sparcv8;
--  /** \relates Arch */
--  extern const Arch Arch_sparc;
--
--  /** \relates Arch */
--  extern const Arch Arch_armv7l;
--  /** \relates Arch */
--  extern const Arch Arch_armv6l;
--  /** \relates Arch */
--  extern const Arch Arch_armv5tejl;
--  /** \relates Arch */
--  extern const Arch Arch_armv5tel;
--  /** \relates Arch */
--  extern const Arch Arch_armv5l;
--  /** \relates Arch */
--  extern const Arch Arch_armv4tl;
--  /** \relates Arch */
--  extern const Arch Arch_armv4l;
--  /** \relates Arch */
--  extern const Arch Arch_armv3l;
--
--   /** \relates Arch */
--  extern const Arch Arch_sh3;
--
--  /** \relates Arch */
--  extern const Arch Arch_sh4;
--  /** \relates Arch */
--  extern const Arch Arch_sh4a;
-+#define OE_EXTERN_PROTO 1
-+#include "oe-arch.h"
-+#undef OE_EXTERN_PROTO
-   //@}
- 
-   ///////////////////////////////////////////////////////////////////
-diff -ur git.orig/zypp/CMakeLists.txt git/zypp/CMakeLists.txt
---- git.orig/zypp/CMakeLists.txt
-+++ git/zypp/CMakeLists.txt
-@@ -90,6 +90,7 @@ SET( zypp_EARLY_SRCS
- 
- SET( zypp_HEADERS
-   Arch.h
-+  oe-arch.h
-   AutoDispose.h
-   Bit.h
-   ByteCount.h
-diff -ur git.orig/zypp/ZConfig.cc git/zypp/ZConfig.cc
---- git.orig/zypp/ZConfig.cc	2011-03-28 14:24:37.178989632 -0500
-+++ git/zypp/ZConfig.cc	2011-03-28 14:25:04.973971936 -0500
-@@ -48,77 +48,9 @@
-     */
-     Arch _autodetectSystemArchitecture()
-     {
--      struct ::utsname buf;
--      if ( ::uname( &buf ) < 0 )
--      {
--        ERR << "Can't determine system architecture" << endl;
--        return Arch_noarch;
--      }
--
--      Arch architecture( buf.machine );
--      MIL << "Uname architecture is '" << buf.machine << "'" << endl;
-+      /* Define the default architecture, ignore uname! */
-+      Arch architecture( Arch_machine );
- 
--      if ( architecture == Arch_i686 )
--      {
--	// some CPUs report i686 but dont implement cx8 and cmov
--	// check for both flags in /proc/cpuinfo and downgrade
--	// to i586 if either is missing (cf bug #18885)
--        std::ifstream cpuinfo( "/proc/cpuinfo" );
--        if ( cpuinfo )
--        {
--          for( iostr::EachLine in( cpuinfo ); in; in.next() )
--          {
--            if ( str::hasPrefix( *in, "flags" ) )
--            {
--              if (    in->find( "cx8" ) == std::string::npos
--                   || in->find( "cmov" ) == std::string::npos )
--              {
--                architecture = Arch_i586;
--                WAR << "CPU lacks 'cx8' or 'cmov': architecture downgraded to '" << architecture << "'" << endl;
--              }
--              break;
--            }
--          }
--        }
--        else
--        {
--          ERR << "Cant open " << PathInfo("/proc/cpuinfo") << endl;
--        }
--      }
--      else if ( architecture == Arch_sparc || architecture == Arch_sparc64 )
--      {
--	// Check for sun4[vum] to get the real arch. (bug #566291)
--	std::ifstream cpuinfo( "/proc/cpuinfo" );
--        if ( cpuinfo )
--        {
--          for( iostr::EachLine in( cpuinfo ); in; in.next() )
--          {
--            if ( str::hasPrefix( *in, "type" ) )
--            {
--              if ( in->find( "sun4v" ) != std::string::npos )
--              {
--                architecture = ( architecture == Arch_sparc64 ? Arch_sparc64v : Arch_sparcv9v );
--                WAR << "CPU has 'sun4v': architecture upgraded to '" << architecture << "'" << endl;
--              }
--              else if ( in->find( "sun4u" ) != std::string::npos )
--              {
--                architecture = ( architecture == Arch_sparc64 ? Arch_sparc64 : Arch_sparcv9 );
--                WAR << "CPU has 'sun4u': architecture upgraded to '" << architecture << "'" << endl;
--              }
--              else if ( in->find( "sun4m" ) != std::string::npos )
--              {
--                architecture = Arch_sparcv8;
--                WAR << "CPU has 'sun4m': architecture upgraded to '" << architecture << "'" << endl;
--              }
--              break;
--            }
--          }
--        }
--        else
--        {
--          ERR << "Cant open " << PathInfo("/proc/cpuinfo") << endl;
--        }
--      }
-       return architecture;
-     }
- 
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
deleted file mode 100644
index 7244284..0000000
--- a/meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-commit 6c47ad415246cc3a3edac2e1637106d330574c85
-Author: Mark Hatle <mark.hatle@windriver.com>
-Date:   Fri May 11 19:05:09 2012 -0500
-
-    RpmHeader.cc: RPM 5.4.9 integration
-    
-    _RPMVSF_xxx - NODIGEST, NOSIGNATURES, NOHEADER, and NOPAYLOAD
-    are now obsolete and no longer supported.
-
-    Upstream-Status: Inappropriate [other]
-      OE version is too old, when we uprev if this patch is still need it
-      should be sent upstream at that time.
-    
-    Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff --git a/zypp/target/rpm/RpmHeader.cc b/zypp/target/rpm/RpmHeader.cc
-index 1224ecd..c96dae6 100644
---- a/zypp/target/rpm/RpmHeader.cc
-+++ b/zypp/target/rpm/RpmHeader.cc
-@@ -230,10 +230,12 @@ RpmHeader::constPtr RpmHeader::readPackage( const Pathname & path_r,
-   librpmDb::globalInit();
-   rpmts ts = ::rpmtsCreate();
-   unsigned vsflag = RPMVSF_DEFAULT;
-+#if !defined(_RPM_5)
-   if ( verification_r & NODIGEST )
-     vsflag |= _RPMVSF_NODIGESTS;
-   if ( verification_r & NOSIGNATURE )
-     vsflag |= _RPMVSF_NOSIGNATURES;
-+#endif
-   ::rpmtsSetVSFlags( ts, rpmVSFlags(vsflag) );
- 
-   Header nh = 0;
diff --git a/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch b/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
deleted file mode 100644
index d01ef70..0000000
--- a/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-# with gcc 4.3.3 and MIPS target, gcc "internal compiler error: segmentation fault" error
-# occurs when compiling Applydeltarpm.cc. I didn't find the exact reason leading to this
-# error, but it should be related to how boost tribool type is interpreted by g++. So provide
-# this mips workaround for now. We'll come back later to check whether it's still required after
-# upgrading to 4.5.0.
-#
-# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-09-08
-
-diff --git a/zypp/repo/Applydeltarpm.cc b/zypp/repo/Applydeltarpm.cc
-index 7b382be..0d7a1f8 100644
---- a/zypp/repo/Applydeltarpm.cc
-+++ b/zypp/repo/Applydeltarpm.cc
-@@ -77,7 +77,8 @@ namespace zypp
-       else
-         {
-           // _last is 'indeterminate' or '!have'
--          if ( (_last = have) )
-+          _last = have;
-+          if ( _last )
-             MIL << "Found executable " << prog << endl;
-           else
-             WAR << "No executable " << prog << endl;
diff --git a/meta/recipes-extended/libzypp/libzypp/no-doc.patch b/meta/recipes-extended/libzypp/libzypp/no-doc.patch
deleted file mode 100644
index c7e6e92..0000000
--- a/meta/recipes-extended/libzypp/libzypp/no-doc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-not building doc (doxygen based)
-
-8/19/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0629b1f..41746cc 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -110,13 +110,6 @@ FIND_PACKAGE(EXPAT REQUIRED)
- FIND_PACKAGE(OpenSSL REQUIRED)
- FIND_PACKAGE(Udev REQUIRED)
- 
--FIND_PROGRAM( DOXYGEN doxygen )
--IF ( NOT DOXYGEN )
--  MESSAGE( FATAL_ERROR "doxygen not found: install doxygen to build the documentation." )
--ELSE ( NOT DOXYGEN )
--  MESSAGE( STATUS "doxygen found: ${DOXYGEN}" )
--ENDIF ( NOT DOXYGEN )
--
- MESSAGE(STATUS "soname: ${LIBZYPP_VERSION_INFO}")
- MESSAGE(STATUS "version: ${VERSION}")
- 
-@@ -154,7 +147,7 @@ ADD_SUBDIRECTORY( devel EXCLUDE_FROM_ALL )
- ADD_SUBDIRECTORY( tools )
- ADD_SUBDIRECTORY( examples )
- ADD_SUBDIRECTORY( po EXCLUDE_FROM_ALL )
--ADD_SUBDIRECTORY( doc )
-+#ADD_SUBDIRECTORY( doc )
- ADD_SUBDIRECTORY( vendor )
- ADD_SUBDIRECTORY( tests EXCLUDE_FROM_ALL )
- 
diff --git a/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch b/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
deleted file mode 100644
index 7006203..0000000
--- a/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-diff --git a/zypp/target/rpm/librpmDb.cc b/zypp/target/rpm/librpmDb.cc
-index 1689fbb..4999cd9 100644
---- a/zypp/target/rpm/librpmDb.cc
-+++ b/zypp/target/rpm/librpmDb.cc
-@@ -60,20 +60,6 @@ public:
-     const char * root = ( _root == "/" ? NULL : _root.asString().c_str() );
-     int          perms = 0644;
- 
--    // check whether to create a new db
--    PathInfo master( _root + _dbPath + "Packages" );
--    if ( ! master.isFile() )
--    {
--      // init database
--      int res = ::rpmdbInit( root, perms );
--      if ( res )
--      {
--        ERR << "rpmdbInit error(" << res << "): " << *this << endl;
--        _error = shared_ptr<RpmInitException>(new RpmInitException(_root, _dbPath));
--        ZYPP_THROW(*_error);
--      }
--    }
--
-     // open database
-     int res = ::rpmdbOpen( root, &_db, (readonly_r ? O_RDONLY : O_RDWR ), perms );
-     if ( res || !_db )
diff --git a/meta/recipes-extended/libzypp/libzypp/rpm5.patch b/meta/recipes-extended/libzypp/libzypp/rpm5.patch
deleted file mode 100644
index bf3da24..0000000
--- a/meta/recipes-extended/libzypp/libzypp/rpm5.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
-build fix for rpm5
-
-8/19/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/zypp/target/rpm/BinHeader.cc b/zypp/target/rpm/BinHeader.cc
-index e9ad382..86a9c96 100644
---- a/zypp/target/rpm/BinHeader.cc
-+++ b/zypp/target/rpm/BinHeader.cc
-@@ -19,7 +19,7 @@ extern "C"
- 
- #ifndef _RPM_4_4_COMPAT
- #ifdef _RPM_5
--typedef rpmuint32_t rpm_count_t;
-+typedef uint32_t rpm_count_t;
- #else
- typedef int32_t rpm_count_t;
- #endif
-diff --git a/zypp/target/rpm/librpmDb.cv3.cc b/zypp/target/rpm/librpmDb.cv3.cc
-index bf18e45..5454ea9 100644
---- a/zypp/target/rpm/librpmDb.cv3.cc
-+++ b/zypp/target/rpm/librpmDb.cv3.cc
-@@ -14,7 +14,7 @@ extern "C"
- {
- #ifndef _RPM_4_4_COMPAT
- #ifdef _RPM_5
--typedef rpmuint32_t rpm_count_t;
-+typedef uint32_t rpm_count_t;
- #else
- typedef int32_t rpm_count_t;
- #endif
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
deleted file mode 100644
index 1729c78..0000000
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ /dev/null
@@ -1,160 +0,0 @@
-HOMEPAGE = "http://en.opensuse.org/Portal:Libzypp"
-DESCRIPTION  = "The ZYpp Linux Software management framework"
-
-LICENSE  = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=11fccc94d26293d78cb4996cb17e5fa7"
-
-inherit cmake gettext
-
-DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev libproxy"
-
-S = "${WORKDIR}/git"
-SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
-PV = "0.0-git${SRCPV}"
-PR = "r23"
-
-SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
-           file://no-doc.patch \
-           file://rpm5.patch \
-           file://rpm5-no-rpmdbinit.patch \
-	   file://config-release.patch \
-	   file://libzypp-oearch.patch \
-	   file://libzypp-compatargs.patch \
-	   file://fix_for_compile_wth_gcc-4.6.0.patch \
-	   file://hardcode-lib-fix.patch \
-	   file://close.patch \
-	   file://libzypp-rpm549.patch \
-	   file://cstdio.patch \
-          "
-
-SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
-
-# ARM specific global constructor workaround
-SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
-
-# rpmdb2solv from sat-solver is run from libzypp
-RDEPENDS_${PN} = "sat-solver rpm-libs gzip ${RDEPGNUPG}"
-
-RDEPGNUPG = "gnupg"
-RDEPGNUPG_libc-uclibc = ""
-
-PACKAGES =+ "${PN}-pkgmgt"
-
-FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
-FILES_${PN}-dev += "${datadir}/cmake"
-
-FILES_${PN}-pkgmgt = "${bindir}/package-manager \
-                      ${bindir}/package-manager-su \
-                      ${datadir}/applications/package-manager.desktop \
-                     "
-
-EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
-OECMAKE_CXX_LINK_FLAGS_libc-uclibc += "-pthread"
-
-LDFLAGS += "-lpthread"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-AVOID_CONSTRUCTOR = ""
-
-# Due to an ARM specific compiler issue
-AVOID_CONSTRUCTOR_arm = "true"
-
-# Due to a potential conflict with '_mips' being a define
-AVOID_CONSTRUCTOR_mips = "true"
-
-do_archgen () {
-	# We need to dynamically generate our arch file based on the machine
-	# configuration
-	echo "/* Automatically generated by the libzypp recipes */" 		 > zypp/oe-arch.h
-	echo "/* Avoid Constructor: ${AVOID_CONSTRUCTOR} */" 			 >> zypp/oe-arch.h
-	echo ""									>> zypp/oe-arch.h
-	echo "#ifndef OE_ARCH_H"						>> zypp/oe-arch.h
-	echo "#define OE_ARCH_H 1"						>> zypp/oe-arch.h
-	echo "#define Arch_machine Arch_${MACHINE_ARCH}" | tr - _		>> zypp/oe-arch.h
-	echo "#endif /* OE_ARCH_H */"						>> zypp/oe-arch.h
-	echo ""									>> zypp/oe-arch.h
-	if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-	  echo "#ifdef DEF_BUILTIN"						>> zypp/oe-arch.h
-	  echo "/* Specify builtin types */"					>> zypp/oe-arch.h
-	  for each_arch in ${PACKAGE_ARCHS} ; do
-		case "$each_arch" in
-			all | any | noarch)
-				continue;;
-		esac
-		echo "    DEF_BUILTIN( ${each_arch} );"	 | tr - _		>> zypp/oe-arch.h
-	  done
-	  echo "#endif /* DEF_BUILTIN */"						>> zypp/oe-arch.h
-	  echo ""									>> zypp/oe-arch.h
-	fi
-	echo "#ifdef OE_EXTERN_PROTO"						>> zypp/oe-arch.h
-	echo "/* Specify extern prototypes */"					>> zypp/oe-arch.h
-	for each_arch in ${PACKAGE_ARCHS} ; do
-		case "$each_arch" in
-			all | any | noarch)
-				continue;;
-		esac
-		echo "  extern const Arch Arch_${each_arch};" | tr - _		>> zypp/oe-arch.h
-	done
-	echo "#endif /* OE_EXTERN_PROTO */"					>> zypp/oe-arch.h
-	echo ""									>> zypp/oe-arch.h
-	echo "#ifdef OE_PROTO"						>> zypp/oe-arch.h
-	echo "/* Specify prototypes */"						>> zypp/oe-arch.h
-	for each_arch in ${PACKAGE_ARCHS} ; do
-		case "$each_arch" in
-			all | any | noarch)
-				continue;;
-		esac
-		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-		  printf "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
-		  echo "(_${each_arch});" | tr - _				>> zypp/oe-arch.h
-		else
-		  printf "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
-		  echo "( IdString ( \"${each_arch}\" ) );" | tr - _		>> zypp/oe-arch.h
-		fi
-	done
-	echo "#endif /* OE_PROTO */"						>> zypp/oe-arch.h
-	echo ""									>> zypp/oe-arch.h
-	echo "#ifdef OE_DEF_COMPAT"						>> zypp/oe-arch.h
-	echo "/* Specify compatibility information */"				>> zypp/oe-arch.h
-	INSTALL_PLATFORM_ARCHS=""
-	for each_arch in ${PACKAGE_ARCHS} ; do
-		INSTALL_PLATFORM_ARCHS="$each_arch $INSTALL_PLATFORM_ARCHS"
-	done
-
-	COMPAT_WITH=""
-	set -- ${INSTALL_PLATFORM_ARCHS}
-	while [ $# -gt 0 ]; do
-		case "$1" in
-			all | any | noarch)
-				shift ; continue;;
-		esac
-		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-		  CARCH="_$1"
-		else
-		  CARCH="IdString(\"$1\")"
-		fi
-		shift
-		COMPAT=""
-		for each_arch in "$@"; do
-			if [ -z "${AVOID_CONSTRUCTOR}" ]; then
-			  arch_val="_${each_arch}"
-			else
-			  arch_val="IdString(\"${each_arch}\")"
-			fi
-			if [ -z "$COMPAT" ]; then
-				COMPAT=${arch_val}
-			else
-				COMPAT="${arch_val},$COMPAT"
-			fi
-		done
-		COMPAT_WITH="${CARCH},${COMPAT} $COMPAT_WITH"
-	done
-	for each_compat in ${COMPAT_WITH} ; do
-		echo "        defCompatibleWith( ${each_compat} );" | tr - _	>> zypp/oe-arch.h
-	done
-	echo "#endif /* DEF_COMPAT */"						>> zypp/oe-arch.h
-	echo ""									>> zypp/oe-arch.h
-}
-
-addtask archgen before do_configure after do_patch
-- 
1.7.10.4



