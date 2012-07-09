Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyt-00041S-I7
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108534"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:05 -0700
Message-Id: <a55d75541619c0922f615fbe7d70945ee3d35a1a.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/15] pcmanfm: fix build with automake 1.12.x
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a patch:
  pcmanfm_fix_for_automake_1.12.patch

More information in the patch header.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../files/pcmanfm_fix_for_automake_1.12.patch      |   35 ++++++++++++++++++++
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb        |    5 ++-
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch

diff --git a/meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch b/meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..1ad0ff5
--- /dev/null
+++ b/meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Pending
+
+Fix these errors:
+| automake: warnings are treated as errors
+| data/ui/Makefile.am:18: warning: '%'-style pattern rules are a GNU make extension
+| src/Makefile.am:10: warning: compiling 'pcmanfm.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@Intel.com>
+2012/07/09
+
+Index: pcmanfm-0.9.10/configure.ac
+===================================================================
+--- pcmanfm-0.9.10.orig/configure.ac
++++ pcmanfm-0.9.10/configure.ac
+@@ -13,6 +13,7 @@ AC_PROG_CC
+ AM_PROG_LIBTOOL
+ AM_PROG_CC_STDC
+ AC_HEADER_STDC
++AM_PROG_CC_C_O
+ 
+ # Checks for header files.
+ AC_HEADER_STDC
+Index: pcmanfm-0.9.10/data/ui/Makefile.am
+===================================================================
+--- pcmanfm-0.9.10.orig/data/ui/Makefile.am
++++ pcmanfm-0.9.10/data/ui/Makefile.am
+@@ -15,6 +15,6 @@ EXTRA_DIST = \
+ 	$(NULL)
+ 
+ # Purge GtkBuilder UI files
+-%.ui: %.glade
++.glade.ui:
+ 	cp $< $@
+ #	$(top_builddir)/src/xml-purge $@
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
index 545367a..576b4ba 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
@@ -11,7 +11,7 @@ SECTION = "x11"
 DEPENDS = "gtk+ startup-notification libfm"
 DEPENDS_append_poky = " libowl"
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
 
@@ -20,7 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://gnome-fs-regular.png \
 	   file://gnome-mime-text-plain.png \
 	   file://emblem-symbolic-link.png \
-	   file://cross-compile-fix.patch" 
+	   file://cross-compile-fix.patch \
+           file://pcmanfm_fix_for_automake_1.12.patch" 
 
 SRC_URI_append_poky = " file://owl-window-menu.patch"
 
-- 
1.7.3.4



