Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUY-0002Sz-RF
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540456"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:10 -0700
Message-Id: <e4dbd916c029abca10e538f70fb06380c21bdd83.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/28] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:35 -0000

From: Tom Rini <tom_rini@mentor.com>

At issue is that route/pktloc.c (not generated) depends on
route/pktloc_syntax.h (generated).

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../libnl/fix-pktloc_syntax_h-race.patch           |   26 ++++++++++++++++++++
 meta/recipes-support/libnl/libnl_2.0.bb            |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch

diff --git a/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
new file mode 100644
index 0000000..05d75db
--- /dev/null
+++ b/meta/recipes-support/libnl/fix-pktloc_syntax_h-race.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [configuration]
+
+libnl has progressed to 0.3.2 and there does not appear to be any
+"make -j" issues with this build after my limited testing on that
+newer version so we can assume this issue is fixed upstream
+
+Index: libnl-2.0/lib/Makefile.am
+===================================================================
+--- libnl-2.0.orig/lib/Makefile.am
++++ libnl-2.0/lib/Makefile.am
+@@ -27,11 +27,15 @@ CLEANFILES = \
+ 	route/pktloc_grammar.c route/pktloc_grammar.h \
+ 	route/pktloc_syntax.c route/pktloc_syntax.h
+ 
++BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
++
+ # Hack to avoid using ylwrap. It does not function correctly in combination
+ # with --header-file=
++route/pktloc_grammar.h: route/pktloc_grammar.c
+ route/pktloc_grammar.c: route/pktloc_grammar.l
+ 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
+ 
++route/pktloc_syntax.h: route/pktloc_syntax.c
+ route/pktloc_syntax.c: route/pktloc_syntax.y
+ 	$(YACC) -d $(YFLAGS) -o $@ $^
+ 
diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
index 0dfcaf6..5339846 100644
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ b/meta/recipes-support/libnl/libnl_2.0.bb
@@ -6,10 +6,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
 
 DEPENDS = "flex-native bison-native"
-PR = "r2"
+PR = "r3"
 
 SRC_URI= "http://www.infradead.org/~tgr/libnl/files/${BPN}-${PV}.tar.gz \
           file://fix-makefile.patch \
+	  file://fix-pktloc_syntax_h-race.patch \
          "
 
 SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
-- 
1.7.6.2



