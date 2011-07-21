Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qk0mS-0003wA-Ir
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 23:27:40 +0200
Received: by pvf24 with SMTP id 24so1471908pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RP/NCh/aTsIU33LyAb48e4lxkB2i+GCNrGPoW6V+hnQ=;
	b=GapbK7cJRgryC7fkH8ZTOaMWaAvp6PCvtHryoATRpGa+ZdDqwAfXiJOuEtnFJuS/ur
	ybb8RKn0MnzN09WKemWOhF9GypluBDHD1rTc9F+A+MirQXx3IS0DYJ23z8Zhu91EhV/x
	8CK9RkTKPOiWNTPPSQV9u0VELx6TaatAIr3Zw=
Received: by 10.68.9.69 with SMTP id x5mr937086pba.385.1311283411320;
	Thu, 21 Jul 2011 14:23:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e6sm1152968pbm.87.2011.07.21.14.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 14:23:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 14:23:22 -0700
Message-Id: <1311283402-28301-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH v2] libiconv: Fix build failure on 1.13.1
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
X-List-Received-Date: Thu, 21 Jul 2011 21:27:41 -0000

It needs a different patch for 1.13.1 for autoconf'ing
Rename files to libiconv-1.11.1 and have a separate
directory for libiconv-1.13.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{files => libiconv-1.11.1}/autoconf.patch      |    0
 .../shared_preloadable_libiconv_linux.patch        |    0
 .../{files => libiconv-1.13.1}/autoconf.patch      |   32 ++++++++++----------
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |    3 +-
 4 files changed, 17 insertions(+), 18 deletions(-)
 copy meta/recipes-support/libiconv/{files => libiconv-1.11.1}/autoconf.patch (100%)
 rename meta/recipes-support/libiconv/{files => libiconv-1.11.1}/shared_preloadable_libiconv_linux.patch (100%)
 rename meta/recipes-support/libiconv/{files => libiconv-1.13.1}/autoconf.patch (57%)

diff --git a/meta/recipes-support/libiconv/files/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
similarity index 100%
copy from meta/recipes-support/libiconv/files/autoconf.patch
copy to meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
diff --git a/meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
similarity index 100%
rename from meta/recipes-support/libiconv/files/shared_preloadable_libiconv_linux.patch
rename to meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
diff --git a/meta/recipes-support/libiconv/files/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
similarity index 57%
rename from meta/recipes-support/libiconv/files/autoconf.patch
rename to meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
index 3cbf549..5d34ce7 100644
--- a/meta/recipes-support/libiconv/files/autoconf.patch
+++ b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
@@ -1,33 +1,33 @@
 It adds the variables that are needed
-for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
+for autoconf 2.65 to reconfigure libiconv and delete the m4 macros
 directory. Its imported from OE.
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: libiconv-1.11.1/configure.ac
+Index: libiconv-1.13.1/configure.ac
 ===================================================================
---- libiconv-1.11.1.orig/configure.ac
-+++ libiconv-1.11.1/configure.ac
-@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR(build-aux)
- AM_INIT_AUTOMAKE(libiconv, 1.11)
- AC_CONFIG_HEADERS(config.h lib/config.h)
+--- libiconv-1.13.1.orig/configure.ac
++++ libiconv-1.13.1/configure.ac
+@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([build-aux])
+ AM_INIT_AUTOMAKE([libiconv], [1.13.1])
+ AC_CONFIG_HEADERS([config.h lib/config.h])
  AC_PROG_MAKE_SET
 -
 +AC_CONFIG_MACRO_DIR([m4])
  dnl           checks for basic programs
  
  AC_PROG_CC
-Index: libiconv-1.11.1/libcharset/configure.ac
+Index: libiconv-1.13.1/libcharset/configure.ac
 ===================================================================
---- libiconv-1.11.1.orig/libcharset/configure.ac
-+++ libiconv-1.11.1/libcharset/configure.ac
+--- libiconv-1.13.1.orig/libcharset/configure.ac
++++ libiconv-1.13.1/libcharset/configure.ac
 @@ -16,17 +16,17 @@ dnl along with the GNU CHARSET Library;
  dnl write to the Free Software Foundation, Inc., 51 Franklin Street,
  dnl Fifth Floor, Boston, MA 02110-1301, USA.
  
--AC_PREREQ(2.13)
+-AC_PREREQ([2.13])
 +AC_PREREQ(2.61)
 +AC_INIT([libcharset],[1.4] )
 +AC_CONFIG_SRCDIR([lib/localcharset.c])
@@ -35,12 +35,12 @@ Index: libiconv-1.11.1/libcharset/configure.ac
 -PACKAGE=libcharset
 -VERSION=1.4
 -
--AC_INIT(lib/localcharset.c)
- AC_CONFIG_AUX_DIR(build-aux)
- AC_CONFIG_HEADER(config.h)
+-AC_INIT([lib/localcharset.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_HEADER([config.h])
  AC_PROG_MAKE_SET
--AC_SUBST(PACKAGE)
--AC_SUBST(VERSION)
+-AC_SUBST([PACKAGE])
+-AC_SUBST([VERSION])
 +dnl AC_SUBST(PACKAGE)
 +dnl AC_SUBST(VERSION)
 +
diff --git a/meta/recipes-support/libiconv/libiconv_1.13.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
index 026f530..6471e32 100644
--- a/meta/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://autoconf.patch \
-	   file://shared_preloadable_libiconv_linux.patch \
           "
 
 SRC_URI[md5sum] = "7ab33ebd26687c744a37264a330bbe9a"
@@ -26,5 +25,5 @@ EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
 LEAD_SONAME = "libiconv.so"
 
 do_configure_prepend () {
-	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
+	rm -f m4/libtool.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4 m4/lt~obsolete.m4 libcharset/m4/libtool.m4 libcharset/m4/ltoptions.m4 libcharset/m4/ltsugar.m4 libcharset/m4/ltversion.m4 libcharset/m4/lt~obsolete.m4
 }
-- 
1.7.4.1



