Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q520U-0008DW-Bw
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 22:28:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UKQkBI003000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Mar 2011 13:26:46 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Mar 2011 13:26:45 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2011 15:29:13 -0500
Message-ID: <fad1267709e57aadd15b85e318c36668020e9e31.1301516765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1301516765.git.mark.hatle@windriver.com>
References: <cover.1301516765.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/3] Fix integration of zypper and sat-solver
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
X-List-Received-Date: Wed, 30 Mar 2011 20:28:48 -0000
Content-Type: text/plain

Adjust the integration of zypper and sat-solver to ensure that all of the
defined architectures for a given machine are defined identically to Poky.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libzypp/libzypp/archconf.patch                 |   15 -
 .../libzypp/libzypp/builtin-arch.patch             |  122 -----
 .../libzypp/libzypp/libzypp-pokyarch.patch         |  498 ++++++++++++++++++++
 .../libzypp/libzypp/no-builtin-arch.patch          |  128 -----
 meta/recipes-extended/libzypp/libzypp_git.bb       |   97 +++-
 .../sat-solver/sat-solver/builtin-arch.patch       |   28 --
 .../sat-solver/sat-solver/no-builtin-arch.patch    |   29 --
 .../sat-solver/sat-solver/sat-solver_poky.patch    |  106 +++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   42 +-
 9 files changed, 706 insertions(+), 359 deletions(-)
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/archconf.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
 delete mode 100644 meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/archconf.patch b/meta/recipes-extended/libzypp/libzypp/archconf.patch
deleted file mode 100644
index 44ebe33..0000000
--- a/meta/recipes-extended/libzypp/libzypp/archconf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff --git a/zypp.conf b/zypp.conf
-index 1e84a3f..7a26548 100644
---- a/zypp.conf
-+++ b/zypp.conf
-@@ -17,7 +17,10 @@
- ## ** Changing this needs a full refresh (incl. download)
- ## ** of all repository data.
- ##
-+## ** CAUTION: Don't change this value on yocto !
-+##
- # arch = s390
-+arch = @MACHINE_ARCH@
- 
- 
- ##
diff --git a/meta/recipes-extended/libzypp/libzypp/builtin-arch.patch b/meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
deleted file mode 100644
index 53dcfac..0000000
--- a/meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
-libzypp available archs, see do_archpatch in .bb for more
-details, this is the version for ${BASE_PACKAGE_ARCH} already
-recognized in libzypp.
-
-Also "all" is added as a synonym for noarch.
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/zypp/Arch.cc b/zypp/Arch.cc
-index 7b357bb..d9102cc 100644
---- a/zypp/Arch.cc
-+++ b/zypp/Arch.cc
-@@ -122,7 +122,13 @@ namespace zypp
- 
-   /** \relates Arch::CompatEntry */
-   inline bool operator==( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
--  { return lhs._idStr == rhs._idStr; }
-+  {
-+    if ( (lhs._idStr == "all" && rhs._idStr == "noarch") ||
-+         (lhs._idStr == "noarch" && rhs._idStr == "all") )
-+      return true;
-+    else
-+      return lhs._idStr == rhs._idStr;
-+  }
-   /** \relates Arch::CompatEntry */
-   inline bool operator!=( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
-   { return ! ( lhs == rhs ); }
-@@ -153,7 +159,7 @@ namespace zypp
-     //       bit for each architecture.
-     //
- #define DEF_BUILTIN(A) const IdString  _##A( #A );
--    DEF_BUILTIN( noarch );
-+    const IdString _noarch( "all" );
- 
-     DEF_BUILTIN( i386 );
-     DEF_BUILTIN( i486 );
-@@ -202,6 +208,8 @@ namespace zypp
- 
-     DEF_BUILTIN( sh4 );
-     DEF_BUILTIN( sh4a );
-+
-+    const IdString _machine( "@MACHINE_ARCH@" );
- #undef DEF_BUILTIN
- 
-     ///////////////////////////////////////////////////////////////////
-@@ -326,12 +334,14 @@ namespace zypp
-         //
-         defCompatibleWith( _sh4,	_noarch );
-         defCompatibleWith( _sh4a,	_noarch,_sh4 );
-+
-+        defCompatibleWith( _machine,    @PKG_ARCH_TAIL@,_@PKG_ARCH@ );
-         //
-         ///////////////////////////////////////////////////////////////////
-         // dumpOn( USR ) << endl;
-       }
- 
--    private:
-+    public:
-       /** Return the next avialable _idBit.
-        * Ctor injects _noarch into the _compatSet, 1 is for
-        * nonbuiltin archs, so we can use <tt>size</tt> for
-@@ -440,6 +450,8 @@ namespace zypp
-   const Arch Arch_sh4( _sh4 );
-   const Arch Arch_sh4a( _sh4a );
- 
-+  const Arch Arch_machine( _machine );
-+
-   ///////////////////////////////////////////////////////////////////
-   //
-   //	METHOD NAME : Arch::Arch
-diff --git a/zypp/Arch.h b/zypp/Arch.h
-index 6b18a6e..092211c 100644
---- a/zypp/Arch.h
-+++ b/zypp/Arch.h
-@@ -249,6 +249,8 @@ namespace zypp
-   extern const Arch Arch_sh4;
-   /** \relates Arch */
-   extern const Arch Arch_sh4a;
-+
-+  extern const Arch Arch_machine;
-   //@}
- 
-   ///////////////////////////////////////////////////////////////////
-diff --git a/zypp/parser/yum/schema/common-inc.rnc b/zypp/parser/yum/schema/common-inc.rnc
-index f12ac3b..24ce06e 100644
---- a/zypp/parser/yum/schema/common-inc.rnc
-+++ b/zypp/parser/yum/schema/common-inc.rnc
-@@ -26,6 +26,7 @@ private.evr =
- private.localizedtext = attribute lang { "en" | "de" }, text
- 
- private.archenum = "noarch"
-+            | "all"
-             | "armv4l"
-             | "armv5el"
-             | "armv5tel"
-@@ -46,4 +47,5 @@ private.archenum = "noarch"
-             | "sh4"
-             | "x86_64"
-             | "src"
-+            | "@MACHINE_ARCH@"
- 
-diff --git a/zypp/parser/yum/schema/common-inc.rng b/zypp/parser/yum/schema/common-inc.rng
-index 60e5742..8a9ce2e 100644
---- a/zypp/parser/yum/schema/common-inc.rng
-+++ b/zypp/parser/yum/schema/common-inc.rng
-@@ -89,6 +89,7 @@
-   <define name="private.archenum">
-     <choice>
-       <value>noarch</value>
-+      <value>all</value>
-       <value>armv4l</value>
-       <value>armv5el</value>
-       <value>armv5tel</value>
-@@ -109,6 +110,7 @@
-       <value>sh4</value>
-       <value>x86_64</value>
-       <value>src</value>
-+      <value>@MACHINE_ARCH@</value>
-     </choice>
-   </define>
- </grammar>
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
new file mode 100644
index 0000000..2561a43
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
@@ -0,0 +1,498 @@
+Disable all of the internal architectures
+
+We disable all of the internal architectures and replace them with ones
+generated by the libzypp recipe as specified in the poky-arch.h.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/tests/lib/TestSetup.h git/tests/lib/TestSetup.h
+--- git.orig/tests/lib/TestSetup.h	2011-03-28 14:24:36.534800770 -0500
++++ git/tests/lib/TestSetup.h	2011-03-28 14:25:04.969912234 -0500
+@@ -66,7 +66,7 @@
+  *   // enabls loging fot the scope of this block:
+  *   // base::LogControl::TmpLineWriter shutUp( new log::FileLineWriter( "/tmp/YLOG" ) );
+  *
+- *   TestSetup test( Arch_x86_64 );
++ *   TestSetup test( Arch_machine );
+  *   // test.loadTarget(); // initialize and load target
+  *   test.loadRepo( TESTS_SRC_DIR"/data/openSUSE-11.1" );
+  *
+@@ -313,7 +313,7 @@
+      * a TestSetup system or a real system. The  provided repostitories are
+      * loaded into the pool (without refresh).
+     */
+-    static void LoadSystemAt( const Pathname & sysRoot, const Arch & _testSetupArch_r = Arch_x86_64 )
++    static void LoadSystemAt( const Pathname & sysRoot, const Arch & _testSetupArch_r = Arch_machine )
+     {
+       if ( ! PathInfo( sysRoot ).isDir() )
+         ZYPP_THROW( Exception("sysRoot argument needs to be a directory") );
+diff -ur git.orig/tools/DumpSelectable.cc git/tools/DumpSelectable.cc
+--- git.orig/tools/DumpSelectable.cc	2011-03-28 14:24:36.547876951 -0500
++++ git/tools/DumpSelectable.cc	2011-03-28 14:25:04.969912234 -0500
+@@ -78,7 +78,7 @@
+   else if ( TestSetup::isTestSetup( sysRoot ) )
+   {
+     message << str::form( "*** Load TestSetup from '%s'", sysRoot.c_str() ) << endl;
+-    TestSetup test( sysRoot, Arch_x86_64 );
++    TestSetup test( sysRoot, Arch_machine );
+     test.loadRepos();
+   }
+   else
+diff -ur git.orig/tools/NameReqPrv.cc git/tools/NameReqPrv.cc
+--- git.orig/tools/NameReqPrv.cc	2011-03-28 14:24:36.547876951 -0500
++++ git/tools/NameReqPrv.cc	2011-03-28 14:25:04.970849384 -0500
+@@ -112,7 +112,7 @@
+   else if ( TestSetup::isTestSetup( sysRoot ) )
+   {
+     message << str::form( "*** Load TestSetup from '%s'", sysRoot.c_str() ) << endl;
+-    TestSetup test( sysRoot, Arch_x86_64 );
++    TestSetup test( sysRoot, Arch_machine );
+     test.loadRepos();
+     dumpRange( message, satpool.reposBegin(), satpool.reposEnd() ) << endl;
+   }
+diff -ur git.orig/tools/ToolScanRepos.cc git/tools/ToolScanRepos.cc
+--- git.orig/tools/ToolScanRepos.cc	2011-03-28 14:24:36.547876951 -0500
++++ git/tools/ToolScanRepos.cc	2011-03-28 14:25:04.970849384 -0500
+@@ -46,7 +46,7 @@
+   ///////////////////////////////////////////////////////////////////
+   Pathname mtmp( "/tmp" );
+   Pathname mroot( mtmp/appname );
+-  Arch     march( Arch_x86_64 );
++  Arch     march( Arch_machine );
+   bool     oClearRoot = true;
+ 
+   std::vector<std::string> urls;
+@@ -83,7 +83,7 @@
+       if ( *(argv[0]) ) // empty
+         march = Arch( argv[0] );
+       else
+-        march = Arch_x86_64;
++        march = Arch_machine;
+     }
+    else
+     {
+@@ -131,4 +131,4 @@
+ 
+   INT << "===[END]============================================" << endl << endl;
+   return ret;
+-}
+\ No newline at end of file
++}
+diff -ur git.orig/tools/zypp-list.cc git/tools/zypp-list.cc
+--- git.orig/tools/zypp-list.cc	2011-03-28 14:24:36.547876951 -0500
++++ git/tools/zypp-list.cc	2011-03-28 14:25:04.971901224 -0500
+@@ -56,7 +56,7 @@
+   else if ( TestSetup::isTestSetup( sysRoot ) )
+   {
+     message << str::form( "*** Load TestSetup from '%s'", sysRoot.c_str() ) << endl;
+-    TestSetup test( sysRoot, Arch_x86_64 );
++    TestSetup test( sysRoot, Arch_machine );
+     test.loadRepos();
+     dumpRange( message, satpool.reposBegin(), satpool.reposEnd() ) << endl;
+   }
+diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
+--- git.orig/zypp/Arch.cc	2011-03-28 14:24:36.548877414 -0500
++++ git/zypp/Arch.cc	2011-03-28 14:31:13.943786442 -0500
+@@ -153,53 +153,11 @@
+     //       bit for each architecture.
+     //
+ #define DEF_BUILTIN(A) const IdString  _##A( #A );
++    DEF_BUILTIN( all );
++    DEF_BUILTIN( any );
+     DEF_BUILTIN( noarch );
+ 
+-    DEF_BUILTIN( i386 );
+-    DEF_BUILTIN( i486 );
+-    DEF_BUILTIN( i586 );
+-    DEF_BUILTIN( i686 );
+-    DEF_BUILTIN( athlon );
+-    DEF_BUILTIN( x86_64 );
+-
+-    DEF_BUILTIN( pentium3 );
+-    DEF_BUILTIN( pentium4 );
+-
+-    DEF_BUILTIN( s390 );
+-    DEF_BUILTIN( s390x );
+-
+-    DEF_BUILTIN( ppc );
+-    DEF_BUILTIN( ppc64 );
+-
+-    DEF_BUILTIN( ia64 );
+-
+-    DEF_BUILTIN( alphaev67 );
+-    DEF_BUILTIN( alphaev6 );
+-    DEF_BUILTIN( alphapca56 );
+-    DEF_BUILTIN( alphaev56 );
+-    DEF_BUILTIN( alphaev5 );
+-    DEF_BUILTIN( alpha );
+-
+-    DEF_BUILTIN( sparc64v );
+-    DEF_BUILTIN( sparcv9v );
+-    DEF_BUILTIN( sparc64 );
+-    DEF_BUILTIN( sparcv9 );
+-    DEF_BUILTIN( sparcv8 );
+-    DEF_BUILTIN( sparc );
+-
+-    DEF_BUILTIN( armv7l );
+-    DEF_BUILTIN( armv6l );
+-    DEF_BUILTIN( armv5tejl );
+-    DEF_BUILTIN( armv5tel );
+-    DEF_BUILTIN( armv5l );
+-    DEF_BUILTIN( armv4tl );
+-    DEF_BUILTIN( armv4l );
+-    DEF_BUILTIN( armv3l );
+-
+-    DEF_BUILTIN( sh3 );
+-
+-    DEF_BUILTIN( sh4 );
+-    DEF_BUILTIN( sh4a );
++#include "poky-arch.h"
+ #undef DEF_BUILTIN
+ 
+     ///////////////////////////////////////////////////////////////////
+@@ -269,6 +227,8 @@
+         // _noarch must have _idBit 0.
+         // Other builtins have 1-bit set
+         // and are initialized done on the fly.
++        _compatSet.insert( Arch::CompatEntry( _all, 0 ) );
++        _compatSet.insert( Arch::CompatEntry( _any, 0 ) );
+         _compatSet.insert( Arch::CompatEntry( _noarch, 0 ) );
+         ///////////////////////////////////////////////////////////////////
+         // Define the CompatibleWith relation:
+@@ -276,52 +236,9 @@
+         // NOTE: Order of definition is significant! (Arch::compare)
+ 	//       - define compatible (less) architectures first!
+         //
+-        defCompatibleWith( _i386,	_noarch );
+-        defCompatibleWith( _i486,	_noarch,_i386 );
+-        defCompatibleWith( _i586,	_noarch,_i386,_i486 );
+-        defCompatibleWith( _i686,	_noarch,_i386,_i486,_i586 );
+-        defCompatibleWith( _athlon,	_noarch,_i386,_i486,_i586,_i686 );
+-        defCompatibleWith( _x86_64,	_noarch,_i386,_i486,_i586,_i686,_athlon );
+-
+-        defCompatibleWith( _pentium3,	_noarch,_i386,_i486,_i586,_i686 );
+-        defCompatibleWith( _pentium4,	_noarch,_i386,_i486,_i586,_i686,_pentium3 );
+-
+-        defCompatibleWith( _ia64,	_noarch,_i386,_i486,_i586,_i686 );
+-        //
+-        defCompatibleWith( _s390,	_noarch );
+-        defCompatibleWith( _s390x,	_noarch,_s390 );
+-        //
+-        defCompatibleWith( _ppc,	_noarch );
+-        defCompatibleWith( _ppc64,	_noarch,_ppc );
+-        //
+-        defCompatibleWith( _alpha,	_noarch );
+-        defCompatibleWith( _alphaev5,	_noarch,_alpha );
+-        defCompatibleWith( _alphaev56,	_noarch,_alpha,_alphaev5 );
+-        defCompatibleWith( _alphapca56,	_noarch,_alpha,_alphaev5,_alphaev56 );
+-        defCompatibleWith( _alphaev6,	_noarch,_alpha,_alphaev5,_alphaev56,_alphapca56 );
+-        defCompatibleWith( _alphaev67,	_noarch,_alpha,_alphaev5,_alphaev56,_alphapca56,_alphaev6 );
+-        //
+-        defCompatibleWith( _sparc,	_noarch );
+-        defCompatibleWith( _sparcv8,	_noarch,_sparc );
+-        defCompatibleWith( _sparcv9,	_noarch,_sparc,_sparcv8 );
+-	defCompatibleWith( _sparcv9v,	_noarch,_sparc,_sparcv8,_sparcv9 );
+-	//
+-        defCompatibleWith( _sparc64,	_noarch,_sparc,_sparcv8,_sparcv9 );
+-	defCompatibleWith( _sparc64v,	_noarch,_sparc,_sparcv8,_sparcv9,_sparcv9v,_sparc64 );
+-        //
+-        defCompatibleWith( _armv3l,	_noarch );
+-        defCompatibleWith( _armv4l,	_noarch,_armv3l );
+-        defCompatibleWith( _armv4tl,	_noarch,_armv3l,_armv4l );
+-        defCompatibleWith( _armv5l,	_noarch,_armv3l,_armv4l,_armv4tl );
+-        defCompatibleWith( _armv5tel,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l );
+-        defCompatibleWith( _armv5tejl,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l,_armv5tel );
+-        defCompatibleWith( _armv6l,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l,_armv5tel,_armv5tejl );
+-        defCompatibleWith( _armv7l,	_noarch,_armv3l,_armv4l,_armv4tl,_armv5l,_armv5tel,_armv5tejl,_armv6l );
+-        //
+-        defCompatibleWith( _sh3,	_noarch );
+-        //
+-        defCompatibleWith( _sh4,	_noarch );
+-        defCompatibleWith( _sh4a,	_noarch,_sh4 );
++#define POKY_DEF_COMPAT 1
++#include "poky-arch.h"
++#undef POKY_DEF_COMPAT
+         //
+         ///////////////////////////////////////////////////////////////////
+         // dumpOn( USR ) << endl;
+@@ -388,53 +305,13 @@
+   ///////////////////////////////////////////////////////////////////
+ 
+   const Arch Arch_empty ( IdString::Empty );
++  const Arch Arch_all( _all );
++  const Arch Arch_any( _any );
+   const Arch Arch_noarch( _noarch );
+ 
+-  const Arch Arch_i386( _i386 );
+-  const Arch Arch_i486( _i486 );
+-  const Arch Arch_i586( _i586 );
+-  const Arch Arch_i686( _i686 );
+-  const Arch Arch_athlon( _athlon );
+-  const Arch Arch_x86_64( _x86_64 );
+-
+-  const Arch Arch_pentium3( _pentium3 );
+-  const Arch Arch_pentium4( _pentium4 );
+-
+-  const Arch Arch_s390( _s390 );
+-  const Arch Arch_s390x( _s390x );
+-
+-  const Arch Arch_ppc( _ppc );
+-  const Arch Arch_ppc64( _ppc64 );
+-
+-  const Arch Arch_ia64( _ia64 );
+-
+-  const Arch Arch_alphaev67( _alphaev67 );
+-  const Arch Arch_alphaev6( _alphaev6 );
+-  const Arch Arch_alphapca56( _alphapca56 );
+-  const Arch Arch_alphaev56( _alphaev56 );
+-  const Arch Arch_alphaev5( _alphaev5 );
+-  const Arch Arch_alpha( _alpha );
+-
+-  const Arch Arch_sparc64v( _sparc64v );
+-  const Arch Arch_sparc64( _sparc64 );
+-  const Arch Arch_sparcv9v( _sparcv9v );
+-  const Arch Arch_sparcv9( _sparcv9 );
+-  const Arch Arch_sparcv8( _sparcv8 );
+-  const Arch Arch_sparc( _sparc );
+-
+-  const Arch Arch_armv7l( _armv7l );
+-  const Arch Arch_armv6l( _armv6l );
+-  const Arch Arch_armv5tejl( _armv5tejl );
+-  const Arch Arch_armv5tel( _armv5tel );
+-  const Arch Arch_armv5l( _armv5l );
+-  const Arch Arch_armv4tl( _armv4tl );
+-  const Arch Arch_armv4l( _armv4l );
+-  const Arch Arch_armv3l( _armv3l );
+-
+-  const Arch Arch_sh3( _sh3 );
+-
+-  const Arch Arch_sh4( _sh4 );
+-  const Arch Arch_sh4a( _sh4a );
++#define POKY_PROTO 1
++#include "poky-arch.h"
++#undef POKY_PROTO
+ 
+   ///////////////////////////////////////////////////////////////////
+   //
+@@ -504,26 +381,10 @@
+   //
+   Arch Arch::baseArch( ) const
+   {
+-    // check the multilib archs:
+-    if (Arch_x86_64.compatibleWith(*this))
+-    {
+-      return Arch_x86_64;
+-    }
+-    if (Arch_sparc64v.compatibleWith(*this))
+-    {
+-      return Arch_sparc64v;
+-    }
+-    if (Arch_sparc64.compatibleWith(*this))
+-    {
+-      return Arch_sparc64;
+-    }
+-    if (Arch_ppc64.compatibleWith(*this))
+-    {
+-      return Arch_ppc64;
+-    }
+-    if (Arch_s390x.compatibleWith(*this))
++    // Check the multilib arch:
++    if (Arch_machine.compatibleWith(*this))
+     {
+-      return Arch_s390x;
++      return Arch_machine;
+     }
+     // Here: no multilib; return arch before noarch
+     CompatSet cset( compatSet( *this ) );
+diff -ur git.orig/zypp/Arch.h git/zypp/Arch.h
+--- git.orig/zypp/Arch.h	2011-03-28 14:24:36.548877414 -0500
++++ git/zypp/Arch.h	2011-03-28 14:25:04.972801208 -0500
+@@ -162,89 +162,13 @@
+   extern const Arch Arch_empty;
+ 
+   /** \relates Arch */
++  extern const Arch Arch_all;
++  extern const Arch Arch_any;
+   extern const Arch Arch_noarch;
+ 
+-  /** \relates Arch */
+-  extern const Arch Arch_pentium4;
+-  /** \relates Arch */
+-  extern const Arch Arch_pentium3;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_x86_64;
+-  /** \relates Arch */
+-  extern const Arch Arch_athlon;
+-  /** \relates Arch */
+-  extern const Arch Arch_i686;
+-  /** \relates Arch */
+-  extern const Arch Arch_i586;
+-  /** \relates Arch */
+-  extern const Arch Arch_i486;
+-  /** \relates Arch */
+-  extern const Arch Arch_i386;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_s390x;
+-  /** \relates Arch */
+-  extern const Arch Arch_s390;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_ppc64;
+-  /** \relates Arch */
+-  extern const Arch Arch_ppc;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_ia64;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_alphaev67;
+-  /** \relates Arch */
+-  extern const Arch Arch_alphaev6;
+-  /** \relates Arch */
+-  extern const Arch Arch_alphapca56;
+-  /** \relates Arch */
+-  extern const Arch Arch_alphaev56;
+-  /** \relates Arch */
+-  extern const Arch Arch_alphaev5;
+-  /** \relates Arch */
+-  extern const Arch Arch_alpha;
+-
+-   /** \relates Arch */
+-  extern const Arch Arch_sparc64v;
+-  /** \relates Arch */
+-  extern const Arch Arch_sparc64;
+-  /** \relates Arch */
+-  extern const Arch Arch_sparcv9v;
+-  /** \relates Arch */
+-  extern const Arch Arch_sparcv9;
+-  /** \relates Arch */
+-  extern const Arch Arch_sparcv8;
+-  /** \relates Arch */
+-  extern const Arch Arch_sparc;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_armv7l;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv6l;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv5tejl;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv5tel;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv5l;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv4tl;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv4l;
+-  /** \relates Arch */
+-  extern const Arch Arch_armv3l;
+-
+-   /** \relates Arch */
+-  extern const Arch Arch_sh3;
+-
+-  /** \relates Arch */
+-  extern const Arch Arch_sh4;
+-  /** \relates Arch */
+-  extern const Arch Arch_sh4a;
++#define POKY_EXTERN_PROTO 1
++#include "poky-arch.h"
++#undef POKY_EXTERN_PROTO
+   //@}
+ 
+   ///////////////////////////////////////////////////////////////////
+diff -ur git.orig/zypp/CMakeLists.txt git/zypp/CMakeLists.txt
+--- git.orig/zypp/CMakeLists.txt
++++ git/zypp/CMakeLists.txt
+@@ -90,6 +90,7 @@ SET( zypp_EARLY_SRCS
+ 
+ SET( zypp_HEADERS
+   Arch.h
++  poky-arch.h
+   AutoDispose.h
+   Bit.h
+   ByteCount.h
+diff -ur git.orig/zypp/ZConfig.cc git/zypp/ZConfig.cc
+--- git.orig/zypp/ZConfig.cc	2011-03-28 14:24:37.178989632 -0500
++++ git/zypp/ZConfig.cc	2011-03-28 14:25:04.973971936 -0500
+@@ -48,77 +48,9 @@
+     */
+     Arch _autodetectSystemArchitecture()
+     {
+-      struct ::utsname buf;
+-      if ( ::uname( &buf ) < 0 )
+-      {
+-        ERR << "Can't determine system architecture" << endl;
+-        return Arch_noarch;
+-      }
+-
+-      Arch architecture( buf.machine );
+-      MIL << "Uname architecture is '" << buf.machine << "'" << endl;
++      /* Define the default architecture, ignore uname! */
++      Arch architecture( Arch_machine );
+ 
+-      if ( architecture == Arch_i686 )
+-      {
+-	// some CPUs report i686 but dont implement cx8 and cmov
+-	// check for both flags in /proc/cpuinfo and downgrade
+-	// to i586 if either is missing (cf bug #18885)
+-        std::ifstream cpuinfo( "/proc/cpuinfo" );
+-        if ( cpuinfo )
+-        {
+-          for( iostr::EachLine in( cpuinfo ); in; in.next() )
+-          {
+-            if ( str::hasPrefix( *in, "flags" ) )
+-            {
+-              if (    in->find( "cx8" ) == std::string::npos
+-                   || in->find( "cmov" ) == std::string::npos )
+-              {
+-                architecture = Arch_i586;
+-                WAR << "CPU lacks 'cx8' or 'cmov': architecture downgraded to '" << architecture << "'" << endl;
+-              }
+-              break;
+-            }
+-          }
+-        }
+-        else
+-        {
+-          ERR << "Cant open " << PathInfo("/proc/cpuinfo") << endl;
+-        }
+-      }
+-      else if ( architecture == Arch_sparc || architecture == Arch_sparc64 )
+-      {
+-	// Check for sun4[vum] to get the real arch. (bug #566291)
+-	std::ifstream cpuinfo( "/proc/cpuinfo" );
+-        if ( cpuinfo )
+-        {
+-          for( iostr::EachLine in( cpuinfo ); in; in.next() )
+-          {
+-            if ( str::hasPrefix( *in, "type" ) )
+-            {
+-              if ( in->find( "sun4v" ) != std::string::npos )
+-              {
+-                architecture = ( architecture == Arch_sparc64 ? Arch_sparc64v : Arch_sparcv9v );
+-                WAR << "CPU has 'sun4v': architecture upgraded to '" << architecture << "'" << endl;
+-              }
+-              else if ( in->find( "sun4u" ) != std::string::npos )
+-              {
+-                architecture = ( architecture == Arch_sparc64 ? Arch_sparc64 : Arch_sparcv9 );
+-                WAR << "CPU has 'sun4u': architecture upgraded to '" << architecture << "'" << endl;
+-              }
+-              else if ( in->find( "sun4m" ) != std::string::npos )
+-              {
+-                architecture = Arch_sparcv8;
+-                WAR << "CPU has 'sun4m': architecture upgraded to '" << architecture << "'" << endl;
+-              }
+-              break;
+-            }
+-          }
+-        }
+-        else
+-        {
+-          ERR << "Cant open " << PathInfo("/proc/cpuinfo") << endl;
+-        }
+-      }
+       return architecture;
+     }
+ 
diff --git a/meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch b/meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
deleted file mode 100644
index 22dd89c..0000000
--- a/meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
-libzypp available archs, see do_archpatch in .bb for more
-details, this is the version for ${BASE_PACKAGE_ARCH} not
-recognized in libzypp.
-
-Also "all" is added as a synonym for noarch.
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/zypp/Arch.cc b/zypp/Arch.cc
-index 7b357bb..d4cbca6 100644
---- a/zypp/Arch.cc
-+++ b/zypp/Arch.cc
-@@ -122,7 +122,13 @@ namespace zypp
- 
-   /** \relates Arch::CompatEntry */
-   inline bool operator==( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
--  { return lhs._idStr == rhs._idStr; }
-+  {
-+    if ( (lhs._idStr == "all" && rhs._idStr == "noarch") ||
-+         (lhs._idStr == "noarch" && rhs._idStr == "all") )
-+      return true;
-+    else
-+      return lhs._idStr == rhs._idStr;
-+  }
-   /** \relates Arch::CompatEntry */
-   inline bool operator!=( const Arch::CompatEntry & lhs, const Arch::CompatEntry & rhs )
-   { return ! ( lhs == rhs ); }
-@@ -153,7 +159,7 @@ namespace zypp
-     //       bit for each architecture.
-     //
- #define DEF_BUILTIN(A) const IdString  _##A( #A );
--    DEF_BUILTIN( noarch );
-+    const IdString _noarch( "all" );
- 
-     DEF_BUILTIN( i386 );
-     DEF_BUILTIN( i486 );
-@@ -202,6 +208,9 @@ namespace zypp
- 
-     DEF_BUILTIN( sh4 );
-     DEF_BUILTIN( sh4a );
-+
-+    const IdString _package( "@PKG_ARCH@" );
-+    const IdString _machine( "@MACHINE_ARCH@" );
- #undef DEF_BUILTIN
- 
-     ///////////////////////////////////////////////////////////////////
-@@ -326,12 +335,15 @@ namespace zypp
-         //
-         defCompatibleWith( _sh4,	_noarch );
-         defCompatibleWith( _sh4a,	_noarch,_sh4 );
-+
-+        defCompatibleWith( _package,    _noarch );
-+        defCompatibleWith( _machine,    _noarch,_package );
-         //
-         ///////////////////////////////////////////////////////////////////
-         // dumpOn( USR ) << endl;
-       }
- 
--    private:
-+    public:
-       /** Return the next avialable _idBit.
-        * Ctor injects _noarch into the _compatSet, 1 is for
-        * nonbuiltin archs, so we can use <tt>size</tt> for
-@@ -440,6 +452,9 @@ namespace zypp
-   const Arch Arch_sh4( _sh4 );
-   const Arch Arch_sh4a( _sh4a );
- 
-+  const Arch Arch_package( _package );
-+  const Arch Arch_machine( _machine );
-+
-   ///////////////////////////////////////////////////////////////////
-   //
-   //	METHOD NAME : Arch::Arch
-diff --git a/zypp/Arch.h b/zypp/Arch.h
-index 6b18a6e..f91a562 100644
---- a/zypp/Arch.h
-+++ b/zypp/Arch.h
-@@ -249,6 +249,9 @@ namespace zypp
-   extern const Arch Arch_sh4;
-   /** \relates Arch */
-   extern const Arch Arch_sh4a;
-+
-+  extern const Arch Arch_package;
-+  extern const Arch Arch_machine;
-   //@}
- 
-   ///////////////////////////////////////////////////////////////////
-diff --git a/zypp/parser/yum/schema/common-inc.rnc b/zypp/parser/yum/schema/common-inc.rnc
-index f12ac3b..04677c3 100644
---- a/zypp/parser/yum/schema/common-inc.rnc
-+++ b/zypp/parser/yum/schema/common-inc.rnc
-@@ -26,6 +26,7 @@ private.evr =
- private.localizedtext = attribute lang { "en" | "de" }, text
- 
- private.archenum = "noarch"
-+            | "all"
-             | "armv4l"
-             | "armv5el"
-             | "armv5tel"
-@@ -46,4 +47,6 @@ private.archenum = "noarch"
-             | "sh4"
-             | "x86_64"
-             | "src"
-+            | "@PKG_ARCH@"
-+            | "@MACHINE_ARCH@"
- 
-diff --git a/zypp/parser/yum/schema/common-inc.rng b/zypp/parser/yum/schema/common-inc.rng
-index 60e5742..27694aa 100644
---- a/zypp/parser/yum/schema/common-inc.rng
-+++ b/zypp/parser/yum/schema/common-inc.rng
-@@ -89,6 +89,7 @@
-   <define name="private.archenum">
-     <choice>
-       <value>noarch</value>
-+      <value>all</value>
-       <value>armv4l</value>
-       <value>armv5el</value>
-       <value>armv5tel</value>
-@@ -109,6 +110,8 @@
-       <value>sh4</value>
-       <value>x86_64</value>
-       <value>src</value>
-+      <value>@PKG_ARCH@</value>
-+      <value>@MACHINE_ARCH@</value>
-     </choice>
-   </define>
- </grammar>
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 621ce45..809c187 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -13,16 +13,14 @@ RDEPENDS_${PN} = "sat-solver"
 
 S = "${WORKDIR}/git"
 PV = "0.0-git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
            file://rpm5.patch \
            file://rpm5-no-rpmdbinit.patch \
-           file://builtin-arch.patch;apply=no \
-           file://no-builtin-arch.patch;apply=no \
-           file://archconf.patch;apply=no \
 	   file://config-release.patch \
+	   file://libzypp-pokyarch.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
@@ -34,23 +32,80 @@ EXTRA_OECMAKE += "-DLIB=lib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-do_archpatch () {
-	PKG_ARCH_TAIL=`sed -n ${S}/zypp/Arch.cc -e "s|^.*defCompatibleWith( _${BASE_PACKAGE_ARCH},[ \t]*\(.*\) .*$|\1|p"`
-	if [ "x${PKG_ARCH_TAIL}" == x ]; then
-		PATCHFILE=${WORKDIR}/no-builtin-arch.patch
-	else
-		PATCHFILE=${WORKDIR}/builtin-arch.patch
-	fi
+do_archgen () {
+	# We need to dynamically generate our arch file based on the machine
+	# configuration
+	echo "/* Automatically generated by the libzypp recipes */" 		 > zypp/poky-arch.h
+	echo ""									>> zypp/poky-arch.h
+	echo "#ifndef POKY_ARCH_H"						>> zypp/poky-arch.h
+	echo "#define POKY_ARCH_H 1"						>> zypp/poky-arch.h
+	echo "#define Arch_machine Arch_${MACHINE_ARCH}"			>> zypp/poky-arch.h
+	echo "#endif /* POKY_ARCH_H */"						>> zypp/poky-arch.h
+	echo ""									>> zypp/poky-arch.h
+	echo "#ifdef DEF_BUILTIN"						>> zypp/poky-arch.h
+	echo "/* Specify builtin types */"					>> zypp/poky-arch.h
+	for each_arch in ${PACKAGE_ARCHS} ; do
+		case "$each_arch" in
+			all | any | noarch)
+				continue;;
+		esac
+		echo "    DEF_BUILTIN( ${each_arch} );"				>> zypp/poky-arch.h
+	done
+	echo "#endif /* DEF_BUILTIN */"						>> zypp/poky-arch.h
+	echo ""									>> zypp/poky-arch.h
+	echo "#ifdef POKY_EXTERN_PROTO"						>> zypp/poky-arch.h
+	echo "/* Specify extern prototypes */"					>> zypp/poky-arch.h
+	for each_arch in ${PACKAGE_ARCHS} ; do
+		case "$each_arch" in
+			all | any | noarch)
+				continue;;
+		esac
+		echo "  extern const Arch Arch_${each_arch};"			>> zypp/poky-arch.h
+	done
+	echo "#endif /* POKY_EXTERN_PROTO */"					>> zypp/poky-arch.h
+	echo ""									>> zypp/poky-arch.h
+	echo "#ifdef POKY_PROTO"						>> zypp/poky-arch.h
+	echo "/* Specify prototypes */"						>> zypp/poky-arch.h
+	for each_arch in ${PACKAGE_ARCHS} ; do
+		case "$each_arch" in
+			all | any | noarch)
+				continue;;
+		esac
+		echo "  const Arch Arch_${each_arch} (_${each_arch});"		>> zypp/poky-arch.h
+	done
+	echo "#endif /* POKY_PROTO */"						>> zypp/poky-arch.h
+	echo ""									>> zypp/poky-arch.h
+	echo "#ifdef POKY_DEF_COMPAT"						>> zypp/poky-arch.h
+	echo "/* Specify compatibility information */"				>> zypp/poky-arch.h
+	INSTALL_PLATFORM_ARCHS=""
+	for each_arch in ${PACKAGE_ARCHS} ; do
+		INSTALL_PLATFORM_ARCHS="$each_arch $INSTALL_PLATFORM_ARCHS"
+	done
 
-	sed -i "${PATCHFILE}" \
-		-e "s|@MACHINE_ARCH@|${MACHINE_ARCH}|g" \
-		-e "s|@PKG_ARCH@|${BASE_PACKAGE_ARCH}|g" \
-		-e "s|@PKG_ARCH_TAIL@|${PKG_ARCH_TAIL}|g"
-
-	patch -p1 -i "${PATCHFILE}"
-
-	sed -i ${WORKDIR}/archconf.patch -e "s|@MACHINE_ARCH@|${MACHINE_ARCH}|g"
-	patch -p1 -i ${WORKDIR}/archconf.patch
+	COMPAT_WITH=""
+	set -- ${INSTALL_PLATFORM_ARCHS}
+	while [ $# -gt 0 ]; do
+		case "$1" in
+			all | any | noarch)
+				shift ; continue;;
+		esac
+		ARCH=_"$1"
+		shift
+		COMPAT=""
+		for each_arch in "$@"; do
+			if [ -z "$COMPAT" ]; then
+				COMPAT=_"$each_arch"
+			else
+				COMPAT=_"$each_arch,$COMPAT"
+			fi
+		done
+		COMPAT_WITH="${ARCH},${COMPAT} $COMPAT_WITH"
+	done
+	for each_compat in ${COMPAT_WITH} ; do
+		echo "        defCompatibleWith( ${each_compat} );"		>> zypp/poky-arch.h
+	done
+	echo "#endif /* DEF_COMPAT */"						>> zypp/poky-arch.h
+	echo ""									>> zypp/poky-arch.h
 }
 
-addtask archpatch before do_patch after do_unpack
+addtask archgen before do_configure after do_patch
diff --git a/meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch b/meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
deleted file mode 100644
index c228c36..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
-sat-solver available archs, see do_archpatch in .bb for more
-details, this is the version for ${BASE_PACKAGE_ARCH} already
-recognized in sat-sovler.
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/src/poolarch.c b/src/poolarch.c
-index 34a14a3..660959b 100644
---- a/src/poolarch.c
-+++ b/src/poolarch.c
-@@ -21,6 +21,7 @@
- #include "util.h"
- 
- const char *archpolicies[] = {
-+  "@MACHINE_ARCH@",	"@MACHINE_ARCH@:@PKG_ARCH_TAIL@",
-   "x86_64",	"x86_64:i686:i586:i486:i386",
-   "i686",	"i686:i586:i486:i386",
-   "i586",	"i586:i486:i386",
-@@ -72,7 +74,7 @@ pool_setarch(Pool *pool, const char *arch)
-       return;
-     }
- #ifndef DEBIAN_SEMANTICS
--  id = ARCH_NOARCH;
-+  id = ARCH_ALL;
- #else
-   id = ARCH_ALL;
- #endif
diff --git a/meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch b/meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch
deleted file mode 100644
index 225fbfe..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
-sat-solver available archs, see do_archpatch in .bb for more
-details, this is the version for ${BASE_PACKAGE_ARCH} not
-recognized in sat-sovler.
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/src/poolarch.c b/src/poolarch.c
-index 34a14a3..36367ba 100644
---- a/src/poolarch.c
-+++ b/src/poolarch.c
-@@ -21,6 +21,8 @@
- #include "util.h"
- 
- const char *archpolicies[] = {
-+  "@MACHINE_ARCH@",	"@MACHINE_ARCH@:@PKG_ARCH@",
-+  "@PKG_ARCH@",	"@PKG_ARCH@",
-   "x86_64",	"x86_64:i686:i586:i486:i386",
-   "i686",	"i686:i586:i486:i386",
-   "i586",	"i586:i486:i386",
-@@ -72,7 +74,7 @@ pool_setarch(Pool *pool, const char *arch)
-       return;
-     }
- #ifndef DEBIAN_SEMANTICS
--  id = ARCH_NOARCH;
-+  id = ARCH_ALL;
- #else
-   id = ARCH_ALL;
- #endif
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
new file mode 100644
index 0000000..b762bac
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
@@ -0,0 +1,106 @@
+Fix "arch" integration with Poky.
+
+Add a missing "any" architecture type and update the semantics to use it.
+
+Disable the built-in archpolicies structure, and replace it with one
+we generate in the recipe.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/src/knownid.h b/src/knownid.h
+index 7757ae0..4b8bee7 100644
+--- a/src/knownid.h
++++ b/src/knownid.h
+@@ -57,6 +57,7 @@ KNOWNID(SYSTEM_SYSTEM,			"system:system"),
+ KNOWNID(ARCH_SRC,			"src"),
+ KNOWNID(ARCH_NOSRC,			"nosrc"),
+ KNOWNID(ARCH_NOARCH,			"noarch"),
++KNOWNID(ARCH_ANY,			"any"),
+ KNOWNID(ARCH_ALL,			"all"),
+ 
+ KNOWNID(REPOSITORY_SOLVABLES,		"repository:solvables"),
+diff --git a/src/policy.c b/src/policy.c
+index 55c8677..3356ff8 100644
+--- a/src/policy.c
++++ b/src/policy.c
+@@ -486,6 +486,13 @@ policy_illegal_archchange(Solver *solv, Solvable *s1, Solvable *s2)
+     }
+ 
+   /* we allow changes to/from noarch */
++#ifdef POKY_SEMANTICS
++  if (a1 == a2 || 
++	a1 == ARCH_NOARCH || a2 == ARCH_NOARCH ||
++	a1 == ARCH_ANY || a2 == ARCH_ANY ||
++	a1 == ARCH_ALL || a2 == ARCH_ALL)
++    return 0;
++#else
+ #ifndef DEBIAN_SEMANTICS
+   if (a1 == a2 || a1 == ARCH_NOARCH || a2 == ARCH_NOARCH)
+     return 0;
+@@ -493,6 +500,7 @@ policy_illegal_archchange(Solver *solv, Solvable *s1, Solvable *s2)
+   if (a1 == a2 || a1 == ARCH_ALL || a2 == ARCH_ALL)
+     return 0;
+ #endif
++#endif
+   if (!pool->id2arch)
+     return 0;
+   a1 = a1 <= pool->lastarch ? pool->id2arch[a1] : 0;
+diff --git a/src/poolarch.c b/src/poolarch.c
+index 34a14a3..2d7cd70 100644
+--- a/src/poolarch.c
++++ b/src/poolarch.c
+@@ -20,38 +20,8 @@
+ #include "poolarch.h"
+ #include "util.h"
+ 
+-const char *archpolicies[] = {
+-  "x86_64",	"x86_64:i686:i586:i486:i386",
+-  "i686",	"i686:i586:i486:i386",
+-  "i586",	"i586:i486:i386",
+-  "i486",	"i486:i386",
+-  "i386",	"i386",
+-  "s390x",	"s390x:s390",
+-  "s390",	"s390",
+-  "ia64",	"ia64:i686:i586:i486:i386",
+-  "ppc64",	"ppc64:ppc",
+-  "ppc",	"ppc",
+-  "armv7nhl",	"armv7nhl:armv7hl",
+-  "armv7hl",	"armv7hl",
+-  "armv7l",	"armv7l:armv6l:armv5tejl:armv5tel:armv5l:armv4tl:armv4l:armv3l",
+-  "armv6l",	"armv6l:armv5tejl:armv5tel:armv5l:armv4tl:armv4l:armv3l",
+-  "armv5tejl",	"armv5tejl:armv5tel:armv5l:armv4tl:armv4l:armv3l",
+-  "armv5tel",	"armv5tel:armv5l:armv4tl:armv4l:armv3l",
+-  "armv5l",	"armv5l:armv4tl:armv4l:armv3l",
+-  "armv4tl",	"armv4tl:armv4l:armv3l",
+-  "armv4l",	"armv4l:armv3l",
+-  "armv3l",	"armv3l",
+-  "sh3",	"sh3",
+-  "sh4",	"sh4",
+-  "sh4a",	"sh4a:sh4",
+-  "sparc64v",	"sparc64v:sparc64:sparcv9v:sparcv9:sparcv8:sparc",
+-  "sparc64",	"sparc64:sparcv9:sparcv8:sparc",
+-  "sparcv9v",	"sparcv9v:sparcv9:sparcv8:sparc",
+-  "sparcv9",	"sparcv9:sparcv8:sparc",
+-  "sparcv8",	"sparcv8:sparc",
+-  "sparc",	"sparc",
+-  0
+-};
++/* Provide the const char *archpolicies structure */
++#include "poky-arch.h"
+ 
+ void
+ pool_setarch(Pool *pool, const char *arch)
+@@ -71,10 +41,10 @@ pool_setarch(Pool *pool, const char *arch)
+       pool->lastarch = 0;
+       return;
+     }
+-#ifndef DEBIAN_SEMANTICS
+-  id = ARCH_NOARCH;
+-#else
++#if defined(DEBIAN_SEMANTICS) || defined(POKY_SEMANTICS)
+   id = ARCH_ALL;
++#else
++  id = ARCH_NOARCH;
+ #endif
+   lastarch = id + 255;
+   id2arch = sat_calloc(lastarch + 1, sizeof(Id));
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 33bf939..a693776 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,15 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
            file://sat-solver_obsolete.patch \
            file://cmake.patch \
            file://db5.patch \
-           file://builtin-arch.patch;apply=no \
-           file://no-builtin-arch.patch;apply=no \
+           file://sat-solver_poky.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -26,20 +25,31 @@ inherit cmake pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-do_archpatch () {
-	PKG_ARCH_TAIL=`sed -n ${S}/src/poolarch.c -e "s|^  \"\(${BASE_PACKAGE_ARCH}\)\",.*\"\(.*\)\",.*$|\2|p"`
-	if [ "x${PKG_ARCH_TAIL}" == x ]; then
-		PATCHFILE=${WORKDIR}/no-builtin-arch.patch
-	else
-		PATCHFILE=${WORKDIR}/builtin-arch.patch
-	fi
+do_archgen () {
+	# We need to dynamically generate our arch file based on the machine
+	# configuration
 
-	sed -i "${PATCHFILE}" \
-		-e "s|@MACHINE_ARCH@|${MACHINE_ARCH}|g" \
-		-e "s|@PKG_ARCH@|${BASE_PACKAGE_ARCH}|g" \
-		-e "s|@PKG_ARCH_TAIL@|${PKG_ARCH_TAIL}|g"
+	INSTALL_PLATFORM_ARCHS=""
+	for each_arch in ${PACKAGE_ARCHS} ; do
+		case "$each_arch" in
+			all | any | noarch)
+				continue;;
+		esac
+		INSTALL_PLATFORM_ARCHS="$each_arch $INSTALL_PLATFORM_ARCHS"
+	done
 
-	patch -p1 -i "${PATCHFILE}"
+	echo "/* Automatically generated by the sat-solver recipe */" > src/poky-arch.h
+	echo "const char *archpolicies[] = {" >> src/poky-arch.h
+
+        set -- $INSTALL_PLATFORM_ARCHS
+
+        save_IFS=$IFS
+        IFS=:
+        while [ $# -gt 0 ]; do echo "  \"$1\",	"\""$*"\", >> src/poky-arch.h ; shift; done
+        IFS=$save_IFS
+
+	echo "  0" >> src/poky-arch.h
+	echo "};" >> src/poky-arch.h
 }
 
-addtask archpatch before do_patch after do_unpack
+addtask archgen before do_configure after do_patch
-- 
1.7.3.4



