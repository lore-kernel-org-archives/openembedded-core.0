Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qtgff-0004Iw-Ii
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:00:39 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QtgbD-0007yR-Cs
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 15:56:03 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 14:56:02 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313589363.6733.218.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libxkbcommon: new
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
X-List-Received-Date: Wed, 17 Aug 2011 14:00:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

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
1.7.4.1





