Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 297906D07F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506454"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:23 -0700
Message-Id: <35a75bb6e7751664ce89eeddf70166d4da2834f6.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 17/18] kmod: Add patch to fix seperate build dir of ptest
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |  1 +
 .../kmod/kmod/fix-seperatebuilddir.patch           | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 633258b..880a53a 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://run-ptest \
            file://ptest.patch \
            file://remove_parallel_tests.patch \
+           file://fix-seperatebuilddir.patch \
           "
 
 SRCREV = "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
diff --git a/meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch b/meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
new file mode 100644
index 0000000..b090eb5
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
@@ -0,0 +1,34 @@
+
+If we are not building in the existing source tree, the testsuite
+directory will not exist so the cp of the stamp-rootfs would fail.
+
+Also added buildtest-TESTS so they could be build in the cross env,
+without running the tests.
+
+Upstream-Status: Accepted
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -131,7 +131,7 @@ endif
+ 
+ ROOTFS = testsuite/rootfs
+ ROOTFS_PRISTINE = $(top_srcdir)/testsuite/rootfs-pristine
+-CREATE_ROOTFS = $(AM_V_GEN) ( $(RM) -rf $(ROOTFS) && \
++CREATE_ROOTFS = $(AM_V_GEN) ( $(RM) -rf $(ROOTFS) && mkdir -p $(dir $(ROOTFS)) && \
+ 				cp -r $(ROOTFS_PRISTINE) $(ROOTFS) && \
+ 				touch testsuite/stamp-rootfs && \
+ 				find $(ROOTFS) -type d -exec chmod +w {} \; )
+@@ -217,6 +217,9 @@ DISTCHECK_CONFIGURE_FLAGS=--enable-gtk-d
+ 
+ distclean-local: $(DISTCLEAN_LOCAL_HOOKS)
+ 
++buildtest-TESTS:
++	$(MAKE) $(AM_MAKEFLAGS) $(check_LTLIBRARIES) $(check_PROGRAMS)
++
+ install-ptest:
+ 	@$(MKDIR_P) $(DESTDIR)/testsuite
+ 	@for file in $(TESTSUITE); do \
-- 
1.8.3.1


