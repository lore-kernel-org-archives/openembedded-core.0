Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9ho-0006Z6-JV
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980276"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:31 -0700
Message-Id: <883d56eb74a8f3b1913e7334c9ea70f2f1e562e9.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/32] libxkbcommon: new
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:49 -0000

From: Phil Blundell <philb@gnu.org>

This is needed by Clutter's egl backend.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../xorg-lib/libxkbcommon/cross.patch              |   43 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   22 ++++++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch b/meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
new file mode 100644
index 0000000..7fd35be
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Inappropriate
+Signed-off-by: Phil Blundell <philb@gnu.org>
+
+Use makekeys from -native package rather than trying to compile it here, and fix up
+configure logic to find keysymdef.h in the sysroot.
+
+diff --git a/Makefile.am b/Makefile.am
+index 2a4d448..214271f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,5 @@
+ # Order: makekeys before src
+-SUBDIRS = include makekeys src test
++SUBDIRS = include src test
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = xkbcommon.pc
+diff --git a/configure.ac b/configure.ac
+index e6a8f15..7f2c387 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,7 +74,8 @@ PKG_CHECK_MODULES([X11], [xproto kbproto >= 1.0.4])
+ 
+ # Obtain the path to the X Window System Core Protocol
+ AC_MSG_CHECKING([for X11 includedir])
+-includex11dir="`$PKG_CONFIG --variable=includex11dir xproto`"
++m4_pattern_allow([PKG_CONFIG_SYSROOT_DIR])
++includex11dir="$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includex11dir xproto`"
+ AC_MSG_RESULT([$includex11dir])
+ 
+ # Obtain full path for keysymdef header file
+diff --git a/src/Makefile.am b/src/Makefile.am
+index b9a12b9..c625b4c 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -26,5 +26,5 @@ libxkbcommon_la_SOURCES = \
+ BUILT_SOURCES = ks_tables.h
+ CLEANFILES = $(BUILT_SOURCES)
+ 
+-ks_tables.h: $(top_builddir)/makekeys/makekeys$(EXEEXT) $(KEYSYMDEF_H) $(XF86KEYSYM_H)
+-	$(AM_V_GEN)cat $(KEYSYMDEF_H) $(XF86KEYSYM_H) | $(top_builddir)/makekeys/makekeys$(EXEEXT) > $@
++ks_tables.h: $(KEYSYMDEF_H) $(XF86KEYSYM_H)
++	$(AM_V_GEN)cat $(KEYSYMDEF_H) $(XF86KEYSYM_H) | libxkbcommon-makekeys$(EXEEXT) > $@
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
new file mode 100644
index 0000000..1b63b0e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
@@ -0,0 +1,22 @@
+require xorg-lib-common.inc
+
+SUMMARY = "library interface to the XKB compiler"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=469a86f811ec5d6bba592811c3005a2a"
+PR = "r0"
+DEPENDS = "xproto kbproto ${@['', '${PN}-native'][oe.utils.inherits(d, 'virtclass-native')]}"
+
+S = "${WORKDIR}/git"
+
+patches = "file://cross.patch"
+patches_virtclass-native = ""
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/lib/libxkbcommon \
+	${patches}"
+SRCREV = "f91afe4f3ebcac3fb65a402c6c85cf1df5e2b52a"
+
+BBCLASSEXTEND = "native"
+
+do_install_append_virtclass-native() {
+	install -m 755 "makekeys/makekeys" "${STAGING_BINDIR}/libxkbcommon-makekeys"
+}
-- 
1.7.6



