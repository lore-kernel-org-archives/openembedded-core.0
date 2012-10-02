Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TJ4ZN-0004yx-29
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:39:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2012 08:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,524,1344236400"; d="scan'208";a="200649880"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by orsmga001.jf.intel.com with ESMTP; 02 Oct 2012 08:25:29 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 18:26:11 +0300
Message-Id: <1349191571-26375-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gypsy: moved to meta-oe/recipes-connectivty
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
X-List-Received-Date: Tue, 02 Oct 2012 15:39:37 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 ...gypsy-m4-directory-missing-from-structure.patch |   23 ++++++++++++++++++++
 .../recipes-connectivity/gypsy/files/fixups.patch  |   21 ++++++++++++++++++
 meta-oe/recipes-connectivity/gypsy/gypsy.inc       |   15 +++++++++++++
 meta-oe/recipes-connectivity/gypsy/gypsy_git.bb    |   19 ++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m4-directory-missing-from-structure.patch
 create mode 100644 meta-oe/recipes-connectivity/gypsy/files/fixups.patch
 create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy.inc
 create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy_git.bb

diff --git a/meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m4-directory-missing-from-structure.patch b/meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m4-directory-missing-from-structure.patch
new file mode 100644
index 0000000..5cb491b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m4-directory-missing-from-structure.patch
@@ -0,0 +1,23 @@
+From 472c465dad27f79e8340e99c9f68cdfa9d2b1809 Mon Sep 17 00:00:00 2001
+From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Date: Tue, 2 Oct 2012 16:36:12 +0300
+Subject: [PATCH] gypsy : m4 directory missing from structure
+
+gypsy won't compile without the m4/ directory, so i created it.
+
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ m4/.gitignore |    1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 m4/.gitignore
+
+diff --git a/m4/.gitignore b/m4/.gitignore
+new file mode 100644
+index 0000000..72e8ffc
+--- /dev/null
++++ b/m4/.gitignore
+@@ -0,0 +1 @@
++*
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-connectivity/gypsy/files/fixups.patch b/meta-oe/recipes-connectivity/gypsy/files/fixups.patch
new file mode 100644
index 0000000..de4d92e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gypsy/files/fixups.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Inappropriate [configuration]
+
+---
+ docs/reference/Makefile.am |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- gypsy.orig/docs/reference/Makefile.am
++++ gypsy/docs/reference/Makefile.am
+@@ -81,10 +81,12 @@ expand_content_files=
+ # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
+ 
+ INCLUDES=-I$(top_srcdir) $(GYPSY_CFLAGS)
+ GTKDOC_LIBS=$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
+ 
++EXTRA_DIST =
++CLEANFILES =
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+ include $(top_srcdir)/gtk-doc.make
+ 
+ # Other files to distribute
+ # e.g. EXTRA_DIST += version.xml.in
diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy.inc b/meta-oe/recipes-connectivity/gypsy/gypsy.inc
new file mode 100644
index 0000000..0c1735e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gypsy/gypsy.inc
@@ -0,0 +1,15 @@
+SUMMARY = "GPS Multiplexing Daemon"
+DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
+multiple clients to access GPS data from multiple GPS sources \
+concurrently.  Gypsy also hides the details of parsing NMEA from the \
+client applications, passing the data as simple values for the clients \
+to use."
+LICENSE = "GPLv2.0 & LGPLv2.1"
+SECTION = "x11"
+DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
+
+inherit autotools pkgconfig gtk-doc
+
+EXTRA_OECONF += "--with-distro=debian"
+
+FILES_${PN} += "/usr/share/dbus-1/services/"
diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy_git.bb b/meta-oe/recipes-connectivity/gypsy/gypsy_git.bb
new file mode 100644
index 0000000..15f6c9b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gypsy/gypsy_git.bb
@@ -0,0 +1,19 @@
+require gypsy.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+SRCREV = "be8c9c382d2d1d37b51d29b0843045121ec90213"
+PV = "0.8+git${SRCPV}"
+PR = "r2"
+
+S = "${WORKDIR}/git"
+
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
+                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
+
+SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
+           file://fixups.patch \
+           file://0001-gypsy-m4-directory-missing-from-structure.patch"
-- 
1.7.9.5



