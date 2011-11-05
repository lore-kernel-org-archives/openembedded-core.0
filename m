Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3Q-00065C-Kr
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625113"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:37 -0700
Message-Id: <c5d59c1c20fa491cc75cd6b2ca7ef7972fc51eef.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/28] dtc: Add patch to correctly install shared libraries and links
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc                |    3 ++-
 meta/recipes-kernel/dtc/dtc/make_install.patch |   15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/make_install.patch

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0f45d5f..9b4b768 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -7,10 +7,11 @@ DEPENDS = "flex-native bison-native"
 inherit autotools
 
 SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
+           file://make_install.patch \
 	  "
 
 EXTRA_OEMAKE='PREFIX="${prefix}"'
-INC_PR = "r1"
+INC_PR = "r2"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/dtc/dtc/make_install.patch b/meta/recipes-kernel/dtc/dtc/make_install.patch
new file mode 100644
index 0000000..2f7d809
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/make_install.patch
@@ -0,0 +1,15 @@
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2011-11-02 14:52:17.243104779 -0700
++++ git/Makefile	2011-11-02 15:06:01.555104982 -0700
+@@ -161,8 +161,8 @@
+ 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
+ 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
+ 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
+-	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+-	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
++	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
++	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/$(notdir $(LIBFDT_lib))
+ 	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
+ 	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
+ 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
-- 
1.7.6.4



