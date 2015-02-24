Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8D94171637
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 06:08:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 23 Feb 2015 22:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,637,1418112000"; d="scan'208";a="670621271"
Received: from oespinoz-mobl1.amr.corp.intel.com (HELO
	aehernan-DevStation.lar.corp.intel.com) ([10.252.253.68])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2015 22:08:13 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2015 00:08:08 -0600
Message-Id: <1424758088-31785-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python-native: Fixes PGEN linking errors Changes Makefile rules to avoid parallel make races when trying to build Parser/PGEN
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
X-List-Received-Date: Tue, 24 Feb 2015 06:08:16 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../avoid_parallel_make_races_on_pgen.patch        | 27 ++++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.7.9.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch

diff --git a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
new file mode 100644
index 0000000..1a8f68e
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Avoids parallel make races linking errors when making Parser/PGEN
+
+- Implements Richard Purdie's idea
+
+Signed-Off-By: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
+
+Index: Python-2.7.9/Makefile.pre.in
+===================================================================
+--- Python-2.7.9.orig/Makefile.pre.in
++++ Python-2.7.9/Makefile.pre.in
+@@ -610,12 +610,10 @@ Modules/grpmodule.o: $(srcdir)/Modules/g
+ 
+ Modules/pwdmodule.o: $(srcdir)/Modules/pwdmodule.c $(srcdir)/Modules/posixmodule.h
+ 
+-$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
++$(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS) $(PGEN)
+ 		@$(MKDIR_P) Include
+-		$(MAKE) $(PGEN)
+ 		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
+-		$(MAKE) $(GRAMMAR_H)
+ 		touch $(GRAMMAR_C)
+ 
+ $(PGEN):	$(PGENOBJS)
diff --git a/meta/recipes-devtools/python/python-native_2.7.9.bb b/meta/recipes-devtools/python/python-native_2.7.9.bb
index 54be2ea..28aaa11 100644
--- a/meta/recipes-devtools/python/python-native_2.7.9.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.9.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
+            file://avoid_parallel_make_races_on_pgen.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
-- 
1.9.1


