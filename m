Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E5CB56AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 20:33:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2015 13:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,454,1422950400"; d="scan'208";a="696560168"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2015 13:33:58 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 14:34:05 -0600
Message-Id: <1427142845-19859-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python: Fix PGEN linking errors
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
X-List-Received-Date: Mon, 23 Mar 2015 20:33:58 -0000

Parallel make races when linking PGEN affects target's python
compilation as well, adds patch from python-native to modify the
Makefile and avoid parallel make races, also updates upstream status

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../avoid_parallel_make_races_on_pgen.patch        |  2 +-
 .../python/avoid_parallel_make_races_on_pgen.patch | 27 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch

diff --git a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
index 1a8f68e..5279e7c 100644
--- a/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
+++ b/meta/recipes-devtools/python/python-native/avoid_parallel_make_races_on_pgen.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inappropriate [embedded specific]
+Upstream-Status: Pending
 
 Avoids parallel make races linking errors when making Parser/PGEN
 
diff --git a/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch b/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
new file mode 100644
index 0000000..5279e7c
--- /dev/null
+++ b/meta/recipes-devtools/python/python/avoid_parallel_make_races_on_pgen.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Pending
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
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 4087c2c..6d5b42a 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -25,6 +25,7 @@ SRC_URI += "\
   file://run-ptest \
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
+  file://avoid_parallel_make_races_on_pgen.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


