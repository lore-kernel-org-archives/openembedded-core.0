Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjF7g-0007SC-MC
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:34:24 +0200
Received: by iwn4 with SMTP id 4so4257413iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gNYOJCwfVP2BPy//cj7VVWukC6nTWal7A30mrUqPVT8=;
	b=Cxv6lvoHz5uzloQ+KGXENDWgvUK9SCtVdkaer/xyaSeyMJEauEu2T5OX8kTRLRz27g
	CN3AXv8d4jP/Ay6tps6Hxui2lfD+WU73hfv/c7K2U0Jt+VikodvQu2PfRZtnTMPBLd2f
	HCG5d109DH8ZykrQ4NuMEU14PNDb1Cwrv87cY=
Received: by 10.42.108.193 with SMTP id i1mr1054187icp.111.1311100218484;
	Tue, 19 Jul 2011 11:30:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x11sm3771725ibd.24.2011.07.19.11.30.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jul 2011 11:30:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 11:30:26 -0700
Message-Id: <1311100227-8624-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/2] Revert "libiconv: add version 1.13.1"
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
X-List-Received-Date: Tue, 19 Jul 2011 18:34:25 -0000

This reverts commit bd1e627bef29830f9346b4b984905fd8fcf2e716.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libiconv/files/autoconf.patch |   50 --------------------
 .../files/shared_preloadable_libiconv_linux.patch  |   26 ----------
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   48 +++++++++++++++++++
 .../shared_preloadable_libiconv_linux.patch        |   24 +++++++++
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   29 -----------
 5 files changed, 72 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-support/libiconv/files/autoconf.patch
 delete mode 100644 meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb

diff --git a/meta/recipes-support/libiconv/files/autoconf.patch b/meta/recipes-support/libiconv/files/autoconf.patch
deleted file mode 100644
index 3cbf549..0000000
--- a/meta/recipes-support/libiconv/files/autoconf.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-It adds the variables that are needed
-for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
-directory. Its imported from OE.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libiconv-1.11.1/configure.ac
-===================================================================
---- libiconv-1.11.1.orig/configure.ac
-+++ libiconv-1.11.1/configure.ac
-@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR(build-aux)
- AM_INIT_AUTOMAKE(libiconv, 1.11)
- AC_CONFIG_HEADERS(config.h lib/config.h)
- AC_PROG_MAKE_SET
--
-+AC_CONFIG_MACRO_DIR([m4])
- dnl           checks for basic programs
- 
- AC_PROG_CC
-Index: libiconv-1.11.1/libcharset/configure.ac
-===================================================================
---- libiconv-1.11.1.orig/libcharset/configure.ac
-+++ libiconv-1.11.1/libcharset/configure.ac
-@@ -16,17 +16,17 @@ dnl along with the GNU CHARSET Library;
- dnl write to the Free Software Foundation, Inc., 51 Franklin Street,
- dnl Fifth Floor, Boston, MA 02110-1301, USA.
- 
--AC_PREREQ(2.13)
-+AC_PREREQ(2.61)
-+AC_INIT([libcharset],[1.4] )
-+AC_CONFIG_SRCDIR([lib/localcharset.c])
- 
--PACKAGE=libcharset
--VERSION=1.4
--
--AC_INIT(lib/localcharset.c)
- AC_CONFIG_AUX_DIR(build-aux)
- AC_CONFIG_HEADER(config.h)
- AC_PROG_MAKE_SET
--AC_SUBST(PACKAGE)
--AC_SUBST(VERSION)
-+dnl AC_SUBST(PACKAGE)
-+dnl AC_SUBST(VERSION)
-+
-+AC_CONFIG_MACRO_DIR([m4])
- 
- dnl           checks for basic programs
- 
diff --git a/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
deleted file mode 100644
index fb07f73..0000000
--- a/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-With libtool generating shared and static version of libraries needs -fPIC flags
-without this it will not generate the commands to create shared linked library
-Its more enforced by libtool 2.4. I have not checked it with older libtool
-libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
-was released these kind of problem are more likely
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libiconv-1.11.1/lib/Makefile.in
-===================================================================
---- libiconv-1.11.1.orig/lib/Makefile.in
-+++ libiconv-1.11.1/lib/Makefile.in
-@@ -70,9 +70,9 @@ preloadable_libiconv.so : preloadable_li
- 
- preloadable_libiconv_linux.so : $(SOURCES)
- 	if test -n "@GCC@"; then \
--	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -fPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -shared -o preloadable_libiconv_linux.so; \
-+	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -fPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -rpath $(libdir) -o libpreload_iconv.la && cp .libs/libpreload_iconv.so preloadable_libiconv_linux.so; \
- 	else \
--	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -KPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -shared -o preloadable_libiconv_linux.so; \
-+	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -KPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -rpath $(libdir) -o libpreload_iconv.la && cp .libs/libpreload_iconv.so preloadable_libiconv_linux.so; \
- 	fi
- 
- preloadable_libiconv_solaris.so : $(SOURCES)
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
diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
deleted file mode 100644
index 069881d..0000000
--- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
-multiple character encodings, but that support lacks from your system."
-HOMEPAGE = "http://www.gnu.org/software/libiconv"
-SECTION = "libs"
-NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
-PROVIDES = "virtual/libiconv"
-PR = "r0"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
-                    file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://autoconf.patch \
-	   file://shared_preloadable_libiconv_linux.patch \
-          "
-
-SRC_URI[md5sum] = "d42b97f6ef5dd0ba4469d520ed732fed"
-SRC_URI[sha256sum] = "e78c347a1a0cb15f2648519e9799151f4b4a934b61ad9ee7424478efe2b8257f"
-
-S = "${WORKDIR}/libiconv-${PV}"
-
-inherit autotools pkgconfig gettext
-
-EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
-
-LEAD_SONAME = "libiconv.so"
-
-do_configure_prepend () {
-	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
-}
-- 
1.7.4.1



