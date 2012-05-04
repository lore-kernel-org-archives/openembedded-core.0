Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF6-0000V8-Lv
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486045"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:38 -0700
Message-Id: <1592ee02c6c314659c485af919ef8a9f501830a7.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 32/40] evolution-data-server: fix with automake work in progress
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
 ...olution-data-server_fix_for_automake-1.12.patch |   73 ++++++++++++++++++++
 meta/recipes-sato/eds/evolution-data-server_git.bb |    3 +-
 2 files changed, 75 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/evolution-data-server_fix_for_automake-1.12.patch

diff --git a/meta/recipes-sato/eds/evolution-data-server/evolution-data-server_fix_for_automake-1.12.patch b/meta/recipes-sato/eds/evolution-data-server/evolution-data-server_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..affe0df
--- /dev/null
+++ b/meta/recipes-sato/eds/evolution-data-server/evolution-data-server_fix_for_automake-1.12.patch
@@ -0,0 +1,73 @@
+Upstream-Status: Pending
+
+This patch fixes following kind of issues with automake 1.12
+
+| automake: warnings are treated as errors
+| Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
+...
+| Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+...
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+...
+| addressbook/libebook/Makefile.am:55: warning: '%'-style pattern rules are a GNU make extension
+...
+| addressbook/libebook/Makefile.am:65: warning: '%'-style pattern rules are a GNU make extension
+| addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-POSIX variable name
+| addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
+| addressbook/libebook/Makefile.am:72: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -12,7 +12,7 @@ DIST_SUBDIRS = libedataserver libebacken
+ changelogs =			\
+ 	ChangeLog
+ 
+-%-$(API_VERSION).pc: %.pc
++.pc.-$(API_VERSION).pc:
+ 	 cp $< $@
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -25,6 +25,10 @@ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_SRCDIR(README)
+ AC_CONFIG_HEADERS(config.h)
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ dnl This is for the autoconf tests only - it set's the language we use
+ AC_LANG(C)
+ 
+Index: git/addressbook/libebook/Makefile.am
+===================================================================
+--- git.orig/addressbook/libebook/Makefile.am
++++ git/addressbook/libebook/Makefile.am
+@@ -52,7 +52,7 @@ libebookinclude_HEADERS =				\
+ 	e-name-western.h				\
+ 	e-vcard.h
+ 
+-%-$(API_VERSION).pc: %.pc
++.pc.-$(API_VERSION).pc:
+ 	 cp $< $@
+ 
+ e-name-western-tables.h: e-name-western-tables.h.in
+@@ -62,7 +62,7 @@ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libebook-$(API_VERSION).pc
+ 
+ DBUS_GENERATED_H = e-data-book-factory-bindings.h e-data-book-bindings.h e-data-book-view-bindings.h
+-%-bindings.h: $(top_srcdir)/addressbook/libedata-book/%.xml
++./%-bindings.h: $(top_srcdir)/addressbook/libedata-book/%.xml
+ 	@DBUS_BINDING_TOOL@ --mode=glib-client --output=$@ --prefix=$(subst -,_,$*) $^
+ 
+ BUILT_SOURCES = $(DBUS_GENERATED_H) $(MARSHAL_GENERATED)
diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
index b2aa08c..211f6e9 100644
--- a/meta/recipes-sato/eds/evolution-data-server_git.bb
+++ b/meta/recipes-sato/eds/evolution-data-server_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
@@ -21,6 +21,7 @@ SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://new-contact-fix.patch \
            file://old-gdk-api.patch \
            file://depbuildfix.patch \
+           file://evolution-data-server_fix_for_automake-1.12.patch \
            file://iconv-detect.h"
 
 S = "${WORKDIR}/git"
-- 
1.7.7



