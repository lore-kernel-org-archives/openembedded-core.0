Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF4-0000Y5-SJ
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486042"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:35 -0700
Message-Id: <718c20877b7d6c362525d3af87c850b8dcce1488.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 29/40] libfm: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48 ++++++++++++++++++++
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch b/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..3efb4dd
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Pending
+
+This patch fixes following kind of issues with automake 1.12
+| automake: warnings are treated as errors
+| data/ui/Makefile.am:21: warning: '%'-style pattern rules are a GNU make extension
+...
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libfm-gtk.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+...
+| src/Makefile.am:21: warning: compiling 'glib-compat.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: libfm-0.1.17/configure.ac
+===================================================================
+--- libfm-0.1.17.orig/configure.ac
++++ libfm-0.1.17/configure.ac
+@@ -4,11 +4,17 @@
+ AC_PREREQ([2.63])
+ AC_INIT([libfm], [0.1.17], [http://pcmanfm.sorceforge.net/])
+ AM_INIT_AUTOMAKE([-Wall -Werror foreign])
++
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ AC_CONFIG_MACRO_DIR(m4)
+ AC_CONFIG_HEADERS([config.h])
+ 
+ # Checks for programs.
+ AC_PROG_CC
++AM_PROG_CC_C_O
+ AM_PROG_LIBTOOL
+ 
+ # Checks for libraries.
+Index: libfm-0.1.17/data/ui/Makefile.am
+===================================================================
+--- libfm-0.1.17.orig/data/ui/Makefile.am
++++ libfm-0.1.17/data/ui/Makefile.am
+@@ -18,6 +18,6 @@ EXTRA_DIST = \
+ 	$(NULL)
+ 
+ # Purge GtkBuilder UI files
+-%.ui: %.glade
++.glade.ui:
+ 	cp $< $@
+ 	$(top_builddir)/src/xml-purge $@
diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb b/meta/recipes-support/libfm/libfm_0.1.17.bb
index e3fd2de..1bd8850 100644
--- a/meta/recipes-support/libfm/libfm_0.1.17.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.17.bb
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native"
 
-PR = "r3"
+PR = "r4"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
+           file://libfm_fix_for_automake-1.12.patch \
+           "
 
 SRC_URI[md5sum] = "a97e03d973e6ac727f28d0934d6c9ad5"
 SRC_URI[sha256sum] = "1740681cff4cd4c5a2eaa9805d8898269cfb6a49a0bda0acb242def15bc7131b"
-- 
1.7.7



