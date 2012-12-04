Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tg2DF-00029S-VB
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 00:47:42 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Dec 2012 15:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,217,1355126400"; d="scan'208";a="252022637"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2012 15:33:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:33:12 -0800
Message-Id: <1354663994-20221-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354663994-20221-1-git-send-email-sgw@linux.intel.com>
References: <1354663994-20221-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/3 v2] libnl: upgrade to 3.2.14
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
X-List-Received-Date: Tue, 04 Dec 2012 23:47:42 -0000

From: Mihai Prica <mihai.prica@intel.com>

* Based on the 3.2.9 recipe from meta-oe
* Modified the patches to work with the new name of the library file (libnl-3.so)

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libnl/{libnl-2.0 => libnl}/fix-pc-file.patch   | 14 ++++----
 .../fix-pktloc_syntax_h-race.patch                 | 27 ++++++++------
 meta/recipes-support/libnl/libnl_2.0.bb            | 27 --------------
 meta/recipes-support/libnl/libnl_3.2.14.bb         | 41 ++++++++++++++++++++++
 4 files changed, 65 insertions(+), 44 deletions(-)
 rename meta/recipes-support/libnl/{libnl-2.0 => libnl}/fix-pc-file.patch (52%)
 rename meta/recipes-support/libnl/{libnl-2.0 => libnl}/fix-pktloc_syntax_h-race.patch (57%)
 delete mode 100644 meta/recipes-support/libnl/libnl_2.0.bb
 create mode 100644 meta/recipes-support/libnl/libnl_3.2.14.bb

diff --git a/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch b/meta/recipes-support/libnl/libnl/fix-pc-file.patch
similarity index 52%
rename from meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
rename to meta/recipes-support/libnl/libnl/fix-pc-file.patch
index 85afe8f..fe8b833 100644
--- a/meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
+++ b/meta/recipes-support/libnl/libnl/fix-pc-file.patch
@@ -4,14 +4,14 @@ Some packages are asking only for libnl-2.0, but expects to get also
 libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
 
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Index: libnl-2.0/libnl-2.0.pc.in
+Index: libnl-3.2.14/libnl-3.0.pc.in
 ===================================================================
---- libnl-2.0.orig/libnl-2.0.pc.in
-+++ libnl-2.0/libnl-2.0.pc.in
-@@ -6,5 +6,5 @@
+--- libnl-3.2.14.orig/libnl-3.0.pc.in
++++ libnl-3.2.14/libnl-3.0.pc.in
+@@ -6,5 +6,5 @@ includedir=@includedir@
  Name: libnl
  Description: Convenience library for netlink sockets
  Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lnl
-+Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
- Cflags: -I${includedir}
+-Libs: -L${libdir} -lnl-@MAJ_VERSION@
++Libs: -L${libdir} -lnl-@MAJ_VERSION@ -lnl-genl-@MAJ_VERSION@ -lnl-nf-@MAJ_VERSION@ -lnl-route-@MAJ_VERSION@
+ Cflags: -I${includedir}/libnl@MAJ_VERSION@
diff --git a/meta/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
similarity index 57%
rename from meta/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
rename to meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
index ea32e82..332ec01 100644
--- a/meta/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-race.patch
+++ b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
@@ -6,24 +6,31 @@ newer version so we can assume this issue is fixed upstream
 
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 
-Index: libnl-2.0/lib/Makefile.am
+Index: libnl-3.2.14/lib/Makefile.am
 ===================================================================
---- libnl-2.0.orig/lib/Makefile.am
-+++ libnl-2.0/lib/Makefile.am
-@@ -27,11 +27,16 @@ CLEANFILES = \
- 	route/pktloc_grammar.c route/pktloc_grammar.h \
- 	route/pktloc_syntax.c route/pktloc_syntax.h
+--- libnl-3.2.14.orig/lib/Makefile.am
++++ libnl-3.2.14/lib/Makefile.am
+@@ -39,9 +39,12 @@ CLEANFILES = \
  
-+BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
-+
  # Hack to avoid using ylwrap. It does not function correctly in combination
  # with --header-file=
 +route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
 +route/pktloc_grammar.h: route/pktloc_grammar.c
  route/pktloc_grammar.c: route/pktloc_grammar.l
- 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 	$(AM_V_GEN) $(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
  
 +route/pktloc_syntax.h: route/pktloc_syntax.c
  route/pktloc_syntax.c: route/pktloc_syntax.y
- 	$(YACC) -d $(YFLAGS) -o $@ $^
+ 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
  
+@@ -89,7 +92,9 @@ BUILT_SOURCES = \
+ 	route/cls/ematch_grammar.c \
+ 	route/cls/ematch_syntax.c \
+ 	route/pktloc_grammar.c \
+-	route/pktloc_syntax.c
++   route/pktloc_syntax.c \
++   route/pktloc_syntax.h \
++   route/pktloc_grammar.h
+ 
+ EXTRA_DIST = \
+ 	route/pktloc_grammar.l \
diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
deleted file mode 100644
index c96e7db..0000000
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
-
-DEPENDS = "flex-native bison-native"
-PE = "1"
-PR = "r6"
-
-SRC_URI = "\
-  http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-  file://fix-pktloc_syntax_h-race.patch \
-  file://fix-pc-file.patch \
-"
-
-SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
-FILES_${PN}-route = "${libdir}/libnl-route.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
-FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
diff --git a/meta/recipes-support/libnl/libnl_3.2.14.bb b/meta/recipes-support/libnl/libnl_3.2.14.bb
new file mode 100644
index 0000000..70920f3
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl_3.2.14.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+SECTION = "libs/network"
+
+PR = "r0"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
+           file://fix-pktloc_syntax_h-race.patch \
+           file://fix-pc-file.patch "
+
+SRC_URI[md5sum] = "81d44f530aa0af1638a220c413baec05"
+SRC_URI[sha256sum] = "6bb043eea08765bada37a053d932f073db9d51e7a8cd419e237c785ba6369e2c"
+
+inherit autotools pkgconfig
+
+FILES_${PN} = "${libdir}/libnl-3.so.* \
+               ${libdir}/libnl.so.* \
+               ${sysconfdir}"
+RREPLACES_${PN} = "libnl2"
+RCONFLICTS_${PN} = "libnl2"
+FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
+FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
+                    ${libdir}/libnl/cli/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
+
+PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
+FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
+                     ${libdir}/libnl/cli/*/*.so.* \
+                     ${sbindir}/nl-*"
+FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
+                     ${libdir}/libnl-genl.so.* \
+                     ${sbindir}/genl-ctrl-list"
+RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
+RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
1.8.0



