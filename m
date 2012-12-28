Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToYGn-0007Li-4o
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 12:38:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2012 03:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,369,1355126400"; d="scan'208";a="237590115"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2012 03:23:34 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:24:14 +0200
Message-Id: <1356693854-5967-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v3] libfm: upgrade to 1.1.0
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
X-List-Received-Date: Fri, 28 Dec 2012 11:38:46 -0000
X-List-Received-Date: Fri, 28 Dec 2012 11:38:46 -0000

libfm_fix_for_automake-1.12.patch: removed
- problem not reprodicible anymore

configure_fix.patch: removed
- not used

fix-make-parallelism-issue.patch: added
- assures that the ${includedir}/libfm symlink
is created

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../libfm/libfm-0.1.17/configure_fix.patch         | 19 ---------
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch | 48 ----------------------
 .../libfm-1.1.0/fix-make-parallelism-issue.patch   | 31 ++++++++++++++
 .../libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb}      |  8 ++--
 4 files changed, 35 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch
 rename meta/recipes-support/libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb} (75%)

diff --git a/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch b/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
deleted file mode 100644
index 351e6e7..0000000
--- a/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Update configure.ac after docs removed in 0.1.16
-
-Upstream-Status: Pending
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-Index: libfm-0.1.16/configure.ac
-===================================================================
---- libfm-0.1.16.orig/configure.ac	2011-10-10 15:13:21.000000000 +0800
-+++ libfm-0.1.16/configure.ac	2011-10-10 15:13:30.000000000 +0800
-@@ -153,9 +153,6 @@
-     data/Makefile
-     data/ui/Makefile
-     po/Makefile.in
--    docs/Makefile
--    docs/reference/Makefile
--    docs/reference/libfm/Makefile
-     libfm.pc
-     libfm-gtk.pc
- ])
diff --git a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch b/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
deleted file mode 100644
index 3efb4dd..0000000
--- a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Pending
-
-This patch fixes following kind of issues with automake 1.12
-| automake: warnings are treated as errors
-| data/ui/Makefile.am:21: warning: '%'-style pattern rules are a GNU make extension
-...
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libfm-gtk.la': linking libtool libraries using a non-POSIX
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-...
-| src/Makefile.am:21: warning: compiling 'glib-compat.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
-Index: libfm-0.1.17/configure.ac
-===================================================================
---- libfm-0.1.17.orig/configure.ac
-+++ libfm-0.1.17/configure.ac
-@@ -4,11 +4,17 @@
- AC_PREREQ([2.63])
- AC_INIT([libfm], [0.1.17], [http://pcmanfm.sorceforge.net/])
- AM_INIT_AUTOMAKE([-Wall -Werror foreign])
-+
-+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-+m4_pattern_allow([AM_PROG_AR])
-+AM_PROG_AR
-+
- AC_CONFIG_MACRO_DIR(m4)
- AC_CONFIG_HEADERS([config.h])
- 
- # Checks for programs.
- AC_PROG_CC
-+AM_PROG_CC_C_O
- AM_PROG_LIBTOOL
- 
- # Checks for libraries.
-Index: libfm-0.1.17/data/ui/Makefile.am
-===================================================================
---- libfm-0.1.17.orig/data/ui/Makefile.am
-+++ libfm-0.1.17/data/ui/Makefile.am
-@@ -18,6 +18,6 @@ EXTRA_DIST = \
- 	$(NULL)
- 
- # Purge GtkBuilder UI files
--%.ui: %.glade
-+.glade.ui:
- 	cp $< $@
- 	$(top_builddir)/src/xml-purge $@
diff --git a/meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch b/meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch
new file mode 100644
index 0000000..5d39d19
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch
@@ -0,0 +1,31 @@
+Fix make parallelism issue
+
+- remove pkginclude_HEADERS ( LIBFM_INCLUDES and LIBFM_GTK_INCLUDES
+variables are empty)
+- if we don't remove it then we will have a race condition between the code 
+that tries to symlink ${includedir}/libfm-1.0 to ${includedir}/libfm and the
+am autogenerated code from the pkginclude_HEADERS definition which
+tries to create pkgincludedir (${includedir}/libfm);
+- if pkgincludedir is created before the symlink the symlink will be created
+in the ${includedir}/libfm dir and it will have libfm-1.0 as name which is
+wrong (we need the ${includedir}/libfm symlink for pcmanfm)
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: libfm-1.1.0/src/Makefile.am
+===================================================================
+--- libfm-1.1.0.orig/src/Makefile.am
++++ libfm-1.1.0/src/Makefile.am
+@@ -211,11 +211,6 @@ libfmgtkinclude_HEADERS = \
+ 	gtk/fm-gtk-marshal.h \
+ 	$(NULL)
+ 
+-pkginclude_HEADERS = \
+-	$(LIBFM_INCLUDES) \
+-	$(LIBFM_GTK_INCLUDES) \
+-	$(NULL)
+-
+ EXTRA_LTLIBRARIES = libfm-gtk.la libfm-gtk3.la
+ 
+ lib_LTLIBRARIES = libfm.la @LIBFM_GTK_LTLIBRARIES@
diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb b/meta/recipes-support/libfm/libfm_1.1.0.bb
similarity index 75%
rename from meta/recipes-support/libfm/libfm_0.1.17.bb
rename to meta/recipes-support/libfm/libfm_1.1.0.bb
index 2cac361..87f2254 100644
--- a/meta/recipes-support/libfm/libfm_0.1.17.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.0.bb
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native"
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
-           file://libfm_fix_for_automake-1.12.patch \
+           file://fix-make-parallelism-issue.patch \
            "
 
-SRC_URI[md5sum] = "a97e03d973e6ac727f28d0934d6c9ad5"
-SRC_URI[sha256sum] = "1740681cff4cd4c5a2eaa9805d8898269cfb6a49a0bda0acb242def15bc7131b"
+SRC_URI[md5sum] = "a5bc8b8291cf810c659bfb3af378b5de"
+SRC_URI[sha256sum] = "b9426e588670b53570b808c49abd1d103863614dd3622559b8c3ef1392fe0b3d"
 
 inherit autotools pkgconfig
 
-- 
1.7.11.7



