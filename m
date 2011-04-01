Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0I-0004v2-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:34 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=PIFaUd7KuZt1RwUzwKvclfGrOcZv2Uhks2Z9NTpYPj0=;
	b=f/gJGshZhdoXbR5qnQ3iEflFcWYK57szcfOIR/fQXM3WUx/pKpZ9mNrd8+I5J1caj7
	PlJoUyDVDJHq96NQvj4n3UR8EUvyY9R5AFuEl5a500WNm17mIVhKIvIcf08IuZkWwViw
	eMEMQXrtn6zGtv0uz6cXbqonvLvRtkdNJTwc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cJYt6WIB9xKK8mvXXfxtVlg7AOQvRe1ThGgFDklSDI0aZnKQcKT0IdcmsGbVogFKPk
	mMNz+R6IooHO5NErXd5RIZu5A8PHri/yDvtLx/72T3s3p1aW9cVHTGtYKGnf2cJ0E1g5
	26m9hPU5eEccC1ntmuoXm5HXoAYu14PHI4ZWU=
Received: by 10.42.232.205 with SMTP id jv13mr4727121icb.441.1301632115902;
	Thu, 31 Mar 2011 21:28:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wo15sm1043192icb.4.2011.03.31.21.28.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:27 -0700
Message-Id: <b99cebc92f8dcab7c4a0128bb5a266672c0bd33d.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 07/46] libiconv: update from 1.9.2 -> 1.11.1
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:35 -0000

1.11.1 was the last LGPLv2 release
shared_preloadable_libiconv_linux.patch is needed to make libtool 2.4
happy

Autoconf patch is similarly made to point m4 directory and update to
newer autoconf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   42 ++++++++++++++++++++
 .../shared_preloadable_libiconv_linux.patch        |   16 +++++++
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   30 ++++++++++++++
 meta/recipes-support/libiconv/libiconv_1.9.2.bb    |   21 ----------
 4 files changed, 88 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.9.2.bb

diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
new file mode 100644
index 0000000..377521b
--- /dev/null
+++ b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
@@ -0,0 +1,42 @@
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
index 0000000..9f978c3
--- /dev/null
+++ b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
@@ -0,0 +1,16 @@
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



