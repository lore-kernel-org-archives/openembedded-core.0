Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEO-0005Nz-4J
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2011 00:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683255"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:29:44 -0700
Message-Id: <abc1977eb36c4a0c220914b5b0bd412dee5763b7.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Sun, 27 Mar 2011 15:44:44 -0700
Date: Wed, 27 Apr 2011  0:29:44 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 23/52] libiconv: update from 1.9.2 -> 1.11.1
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:16 -0000

From: Khem Raj <raj.khem@gmail.com>

1.11.1 was the last LGPLv2 release
shared_preloadable_libiconv_linux.patch is needed to make libtool 2.4
happy

Autoconf patch is similarly made to point m4 directory and update to
newer autoconf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   48 ++++++++++++++++++++
 .../shared_preloadable_libiconv_linux.patch        |   24 ++++++++++
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   30 ++++++++++++
 meta/recipes-support/libiconv/libiconv_1.9.2.bb    |   21 ---------
 4 files changed, 102 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.9.2.bb

diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
new file mode 100644
index 0000000..2b24894
--- /dev/null
+++ b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
@@ -0,0 +1,48 @@
+It adds the variables that are needed
+for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
+directory. Its imported from OE.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libiconv-1.11.1/configure.ac
+===================================================================
+--- libiconv-1.11.1.orig/configure.ac
++++ libiconv-1.11.1/configure.ac
+@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR(build-aux)
+ AM_INIT_AUTOMAKE(libiconv, 1.11)
+ AC_CONFIG_HEADERS(config.h lib/config.h)
+ AC_PROG_MAKE_SET
+-
++AC_CONFIG_MACRO_DIR([m4])
+ dnl           checks for basic programs
+ 
+ AC_PROG_CC
+Index: libiconv-1.11.1/libcharset/configure.ac
+===================================================================
+--- libiconv-1.11.1.orig/libcharset/configure.ac
++++ libiconv-1.11.1/libcharset/configure.ac
+@@ -16,17 +16,17 @@ dnl along with the GNU CHARSET Library;
+ dnl write to the Free Software Foundation, Inc., 51 Franklin Street,
+ dnl Fifth Floor, Boston, MA 02110-1301, USA.
+ 
+-AC_PREREQ(2.13)
++AC_PREREQ(2.61)
++AC_INIT([libcharset],[1.4] )
++AC_CONFIG_SRCDIR([lib/localcharset.c])
+ 
+-PACKAGE=libcharset
+-VERSION=1.4
+-
+-AC_INIT(lib/localcharset.c)
+ AC_CONFIG_AUX_DIR(build-aux)
+ AC_CONFIG_HEADER(config.h)
+ AC_PROG_MAKE_SET
+-AC_SUBST(PACKAGE)
+-AC_SUBST(VERSION)
++dnl AC_SUBST(PACKAGE)
++dnl AC_SUBST(VERSION)
++
++AC_CONFIG_MACRO_DIR([m4])
+ 
+ dnl           checks for basic programs
+ 
diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
new file mode 100644
index 0000000..a913dad
--- /dev/null
+++ b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
@@ -0,0 +1,24 @@
+With libtool generating shared and static version of libraries needs -fPIC flags
+without this it will not generate the commands to create shared linked library
+Its more enforced by libtool 2.4. I have not checked it with older libtool
+libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
+was released these kind of problem are more likely
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libiconv-1.11.1/lib/Makefile.in
+===================================================================
+--- libiconv-1.11.1.orig/lib/Makefile.in
++++ libiconv-1.11.1/lib/Makefile.in
+@@ -70,9 +70,9 @@ preloadable_libiconv.so : preloadable_li
+ 
+ preloadable_libiconv_linux.so : $(SOURCES)
+ 	if test -n "@GCC@"; then \
+-	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -fPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -shared -o preloadable_libiconv_linux.so; \
++	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -fPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -rpath $(libdir) -o libpreload_iconv.la && cp .libs/libpreload_iconv.so preloadable_libiconv_linux.so; \
+ 	else \
+-	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -KPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -shared -o preloadable_libiconv_linux.so; \
++	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -KPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -rpath $(libdir) -o libpreload_iconv.la && cp .libs/libpreload_iconv.so preloadable_libiconv_linux.so; \
+ 	fi
+ 
+ preloadable_libiconv_solaris.so : $(SOURCES)
diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
new file mode 100644
index 0000000..28c70c8
--- /dev/null
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
+multiple character encodings, but that support lacks from your system."
+HOMEPAGE = "http://www.gnu.org/software/libiconv"
+SECTION = "libs"
+PRIORITY = "optional"
+NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
+PROVIDES = "virtual/libiconv"
+PR = "r0"
+LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
+                    file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://autoconf.patch \
+	   file://shared_preloadable_libiconv_linux.patch \
+          "
+
+SRC_URI[md5sum] = "d42b97f6ef5dd0ba4469d520ed732fed"
+SRC_URI[sha256sum] = "e78c347a1a0cb15f2648519e9799151f4b4a934b61ad9ee7424478efe2b8257f"
+
+S = "${WORKDIR}/libiconv-${PV}"
+
+inherit autotools pkgconfig gettext
+
+EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
+
+LEAD_SONAME = "libiconv.so"
+
+do_configure_prepend () {
+	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
+}
diff --git a/meta/recipes-support/libiconv/libiconv_1.9.2.bb b/meta/recipes-support/libiconv/libiconv_1.9.2.bb
deleted file mode 100644
index dac9e3c..0000000
--- a/meta/recipes-support/libiconv/libiconv_1.9.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
-multiple character encodings, but that support lacks from your system."
-HOMEPAGE = "http://www.gnu.org/software/libiconv"
-SECTION = "libs"
-PRIORITY = "optional"
-NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
-PROVIDES = "virtual/libiconv"
-PR = "r4"
-LICENSE = "LGPL"
-SRC_URI = "${GNU_MIRROR}/libiconv/libiconv-${PV}.tar.gz"
-
-S = "${WORKDIR}/libiconv-${PV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--enable-shared --enable-static"
-
-do_configure () {
-	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
-	autotools_do_configure
-}
-- 
1.7.1.1



