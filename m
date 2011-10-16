Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFLW3-00028N-Rf
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 09:52:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2011 00:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="63341620"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2011 00:46:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 00:46:19 -0700
Message-Id: <7725510bdd55292a7a7bec4be4d41fb13f6cb180.1318751027.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/14] screen: Add patch to fix parallel make install
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
X-List-Received-Date: Sun, 16 Oct 2011 07:52:16 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../screen/screen-4.0.3/fix-parallel-make.patch    |   19 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.0.3.bb       |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch

diff --git a/meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch b/meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch
new file mode 100644
index 0000000..05c5701
--- /dev/null
+++ b/meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch
@@ -0,0 +1,19 @@
+This fixes the parallel make install failure
+
+Upstream-status: pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: screen-4.0.3/Makefile.in
+===================================================================
+--- screen-4.0.3.orig/Makefile.in
++++ screen-4.0.3/Makefile.in
+@@ -70,7 +70,7 @@ screen: $(OFILES)
+ .c.o:
+ 	$(CC) -c -I. -I$(srcdir) $(M_CFLAGS) $(DEFS) $(OPTIONS) $(CFLAGS) $<
+ 
+-install_bin: .version screen
++install_bin: .version screen installdirs
+ 	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
+ 		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
+ 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 27f39dd..a875a35 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -12,11 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
 SECTION = "console/utils"
 DEPENDS = "ncurses \
           ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-11+lenny1.diff.gz;name=patch \
            file://configure.patch \
+           file://fix-parallel-make.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://screen.pam"
-- 
1.7.6.2



