Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVQ-0001a4-JT
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="690502037"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2011 22:26:26 -0700
Message-Id: <2d70fb6689a8cd80ea210e17fd9529a1dbcbcbd9.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 18:07:41 +0000
Date: Mon, 09 May 2011 22:26:26 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 27/30] fuse: drop since it is not used by other recipes
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
X-List-Received-Date: Tue, 10 May 2011 05:29:13 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

This is unused and a newer version will be made available in meta-oe
in meanwhile.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../fuse-2.7.2/not-run-updaterc.d-on-host.patch    |   15 -------------
 meta-demoapps/recipes-kernel/fuse/fuse.inc         |   13 -----------
 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb    |   22 --------------------
 3 files changed, 0 insertions(+), 50 deletions(-)
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.patch
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse.inc
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb

diff --git a/meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.patch b/meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.patch
deleted file mode 100644
index 903a8ba..0000000
--- a/meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: fuse-2.7.2/util/Makefile.am
-===================================================================
---- fuse-2.7.2.orig/util/Makefile.am	2007-04-26 01:36:47.000000000 +0930
-+++ fuse-2.7.2/util/Makefile.am	2008-02-10 16:43:19.000000000 +1030
-@@ -33,10 +33,6 @@
- 	$(INSTALL_PROGRAM) $(srcdir)/mount.fuse $(DESTDIR)$(MOUNT_FUSE_PATH)/mount.fuse
- 	$(mkdir_p) $(DESTDIR)$(INIT_D_PATH)
- 	$(INSTALL_PROGRAM) $(srcdir)/init_script $(DESTDIR)$(INIT_D_PATH)/fuse
--	@if test -x /usr/sbin/update-rc.d; then \
--		echo "/usr/sbin/update-rc.d fuse start 34 S . start 41 0 6 . || true"; \
--		/usr/sbin/update-rc.d fuse start 34 S . start 41 0 6 . || true; \
--	fi
- 
- install-data-local:
- 	$(mkdir_p) $(DESTDIR)$(UDEV_RULES_PATH)
diff --git a/meta-demoapps/recipes-kernel/fuse/fuse.inc b/meta-demoapps/recipes-kernel/fuse/fuse.inc
deleted file mode 100644
index c6755ac..0000000
--- a/meta-demoapps/recipes-kernel/fuse/fuse.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
-HOMEPAGE = "http://fuse.sf.net"
-LICENSE = "GPL"
-DEPENDS = "virtual/fakeroot-native"
-RRECOMMENDS_fuse = "${@base_contains("MACHINE_FEATURES","kernel26","kernel-module-fuse","fuse-module",d)}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-fakeroot do_install() {
-	oe_runmake install DESTDIR=${D}
-}
diff --git a/meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb b/meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb
deleted file mode 100644
index d284a25..0000000
--- a/meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require fuse.inc
-
-PR = "r0"
-
-SRC_URI += "file://not-run-updaterc.d-on-host.patch;patch=1"
-
-EXTRA_OECONF = " --disable-kernel-module"
-
-#package utils in a sperate package and stop debian.bbclass renaming it to libfuse-utils, we want it to be fuse-utils
-PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
-FILES_${PN} += "${libdir}/libfuse.so.*"
-FILES_${PN}-dev += "${libdir}/libfuse*.la"
-
-FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
-FILES_libulockmgr-dev += "${libdir}/libulock*.la"
-FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
-
-FILES_fuse-utils = "${bindir} ${base_sbindir}"
-FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
-DEBIAN_NOAUTONAME_fuse-utils = "1"
-DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
-
-- 
1.7.1.1



