Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQyZ-0003kf-Aj
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:46 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1379643pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=nfoymI5C4V30fDL3d6jFNheW0eAgaf3XxUozIS6ySmg=;
	b=blySkJhfN3KJM2in91ApRxp5Uq4y7yirgeoQd7oAKOI8B1GXVAABcWchQNYJNG7dH+
	hFL8/1Y1FMgFZPo57O7l1xGIlEBROob5LGNOPivjn/D4IYJDB33wFAmFPJTyBUlnqO6O
	vAKM4+FGPDk4XtkNEYAEQI7Ocf7oJ3QZzCZ8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GlccaD+XbXmlw03sGnqiGzjaVDHoXJqfv78CU17DEsz3lhZCIAlkPtVj2D9fm4RWX0
	S4uZ2jDd4Lj3jvv3Ryfd3QnotGUfe6vZceof3PhS+mZCwGrpI4APdNmzM9UQUEKU9bL+
	N9S1DVtony/GjH5Tgg9Yrj+mmPIxX6Y8R6WTM=
Received: by 10.68.66.8 with SMTP id b8mr6614103pbt.425.1303757712273;
	Mon, 25 Apr 2011 11:55:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r5sm4058190pbe.101.2011.04.25.11.55.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:05 -0700
Message-Id: <b750d1733d6803a70c70335b54b7fbfcfcb91e12.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 09/17] libiconv: update from 1.9.2 -> 1.11.1
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:46 -0000

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
1.7.4.1



