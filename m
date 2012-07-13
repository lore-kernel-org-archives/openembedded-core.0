Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SpbBt-0006qR-Ah
	for Openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 10:25:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2012 01:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121896853"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jul 2012 01:14:17 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 01:12:58 -0700
Message-Id: <af667a7a2947ddb0bb25c306f656fbc784296f87.1342167069.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <575ff760b303fcbf2a8f41a557451d1937d44112.1342167069.git.nitin.a.kamble@intel.com>
References: <575ff760b303fcbf2a8f41a557451d1937d44112.1342167069.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1342167069.git.nitin.a.kamble@intel.com>
References: <cover.1342167069.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] lame: fix build with automake 1.12.x
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
X-List-Received-Date: Fri, 13 Jul 2012 08:25:33 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake 1.12.x has deprecated automatic de-ANSI-fication support.
Fix sources to work with automake 1.12.x

Added a new patch:
   lame-3.99.5_fix_for_automake-1.12.x.patch

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../lame/lame-3.99.5_fix_for_automake-1.12.x.patch |   59 ++++++++++++++++++++
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   14 +----
 2 files changed, 62 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch

diff --git a/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch b/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
new file mode 100644
index 0000000..571a1d0
--- /dev/null
+++ b/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Pending
+
+Fix this kind of errors with automake 1.12.x:
+| doc/man/Makefile.am:3: error: automatic de-ANSI-fication support has been removed
+| autoreconf: automake failed with exit status: 1
+
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/13
+
+Index: lame-3.99.5/configure.in
+===================================================================
+--- lame-3.99.5.orig/configure.in
++++ lame-3.99.5/configure.in
+@@ -77,9 +77,6 @@ if test "${GCC}" = "yes"; then
+ 	AC_MSG_RESULT(${GCC_version})
+ fi
+ 
+-dnl more automake stuff
+-AM_C_PROTOTYPES
+-
+ AC_CHECK_HEADER(dmalloc.h)
+ if test "${ac_cv_header_dmalloc_h}" = "yes"; then
+ 	AM_WITH_DMALLOC
+Index: lame-3.99.5/doc/html/Makefile.am
+===================================================================
+--- lame-3.99.5.orig/doc/html/Makefile.am
++++ lame-3.99.5/doc/html/Makefile.am
+@@ -1,6 +1,6 @@
+ ## $Id: Makefile.am,v 1.7 2010/09/30 20:58:40 jaz001 Exp $
+ 
+-AUTOMAKE_OPTIONS = foreign ansi2knr
++AUTOMAKE_OPTIONS = foreign
+ 
+ docdir = $(datadir)/doc
+ pkgdocdir = $(docdir)/$(PACKAGE)
+Index: lame-3.99.5/libmp3lame/i386/Makefile.am
+===================================================================
+--- lame-3.99.5.orig/libmp3lame/i386/Makefile.am
++++ lame-3.99.5/libmp3lame/i386/Makefile.am
+@@ -1,6 +1,6 @@
+ ## $Id: Makefile.am,v 1.26 2011/04/04 09:42:34 aleidinger Exp $
+ 
+-AUTOMAKE_OPTIONS = foreign $(top_srcdir)/ansi2knr
++AUTOMAKE_OPTIONS = foreign
+ 
+ DEFS = @DEFS@ @CONFIG_DEFS@
+ 
+Index: lame-3.99.5/doc/man/Makefile.am
+===================================================================
+--- lame-3.99.5.orig/doc/man/Makefile.am
++++ lame-3.99.5/doc/man/Makefile.am
+@@ -1,6 +1,6 @@
+ ## $Id: Makefile.am,v 1.1 2000/10/22 11:39:44 aleidinger Exp $
+ 
+-AUTOMAKE_OPTIONS = foreign ansi2knr
++AUTOMAKE_OPTIONS = foreign
+ 
+ man_MANS = lame.1
+ EXTRA_DIST = ${man_MANS}
diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index a0c4cf5..764fcc1 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -8,10 +8,11 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
 "
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
-           file://no-gtk1.patch"
+           file://no-gtk1.patch \
+           file://lame-3.99.5_fix_for_automake-1.12.x.patch "
 
 SRC_URI[md5sum] = "84835b313d4a8b68f5349816d33e07ce"
 SRC_URI[sha256sum] = "24346b4158e4af3bd9f2e194bb23eb473c75fb7377011523353196b19b9a23ff"
@@ -23,12 +24,3 @@ FILES_${PN} = "${bindir}/lame"
 FILES_libmp3lame = "${libdir}/libmp3lame.so.*"
 FILES_libmp3lame-dev = "${includedir} ${libdir}/*"
 FILES_${PN}-dev = ""
-
-do_configure() {
-	# no autoreconf please
-	aclocal
-	autoconf
-	libtoolize --force
-	gnu-configize --force
-	oe_runconf
-}
-- 
1.7.3.4



