Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kGA-00066y-J5
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93vnD024797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:57 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:42 +0800
Message-ID: <cace6ce2294c2a487b0e70b472d8810870d7cf22.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 7/8] ghostscript: update to 9.05
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:43 -0000
Content-Type: text/plain

Update ghostscript to 9.05, and update ghostscript-9.02-genarch.patch
at same time because it can't be applied. Add patch
ghostscript/ghostscript-9.05-NOT-check-endian.patch
to forbid checking endianese.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ghostscript/ghostscript-9.02-genarch.patch     |   12 ++--
 .../ghostscript-9.05-NOT-check-endian.patch        |   54 ++++++++++++++++++++
 .../{ghostscript_9.04.bb => ghostscript_9.05.bb}   |    9 ++--
 3 files changed, 65 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.04.bb => ghostscript_9.05.bb} (92%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
index 3c2a4c8..c18246c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
@@ -14,14 +14,14 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
 diff -Nru ghostscript-8.64.orig/base/lib.mak ghostscript-8.64/base/lib.mak
 --- ghostscript-8.64.orig/base/lib.mak	2010-02-10 10:30:02.000000000 +0800
 +++ ghostscript-8.64/base/lib.mak	2010-02-10 10:56:21.000000000 +0800
-@@ -50,8 +50,8 @@
+@@ -66,8 +66,8 @@
  stdpre_h=$(GLSRC)stdpre.h $(stdpn_h)
  stdint__h=$(GLSRC)stdint_.h $(std_h)
-
+ 
 -$(GLGEN)arch.h : $(GENARCH_XE)
--	$(EXP)$(GENARCH_XE) $(GLGEN)arch.h
+-	$(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
 +##$(GLGEN)arch.h : $(GENARCH_XE)
-+##	$(EXP)$(GENARCH_XE) $(GLGEN)arch.h
-
++##	$(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
+ 
  # Platform interfaces
-
+ 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
new file mode 100644
index 0000000..52353b5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
@@ -0,0 +1,54 @@
+configure will check endianness of build machine. When cross compile it fails.
+So remove the check for Yocto.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- ghostscript-9.05/configure.ac.orig	2012-03-14 15:28:30.828956872 +0800
++++ ghostscript-9.05/configure.ac	2012-03-14 15:29:05.060957357 +0800
+@@ -1739,25 +1739,25 @@
+ dnl check for big/little endian for LCMS
+ dnl --------------------------------------------------
+ 
+-AC_MSG_CHECKING([for big endian])
+-
+-AC_RUN_IFELSE(
+-  [AC_LANG_PROGRAM([#include <stdio.h>], [
+-   static const int one = 1;
+-   return (*(char*)&one == 0 ? 0 : 1);
+-  ])],
+-  [LCMS_BIGENDIAN=1],
+-  [LCMS_BIGENDIAN=0])
+-
+-if test "x$LCMS_BIGENDIAN" != "x0"; then
+-  LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$LCMS_BIGENDIAN"
+-  LCMS2_ENDIAN="-DCMS_USE_BIG_ENDIAN=$LCMS_BIGENDIAN"
+-  AC_MSG_RESULT(yes)
+-else
+-  LCMS_ENDIAN=
+-  LCMS2_ENDIAN=
+-  AC_MSG_RESULT(no)
+-fi
++dnl AC_MSG_CHECKING([for big endian])
++dnl 
++dnl AC_RUN_IFELSE(
++dnl   [AC_LANG_PROGRAM([#include <stdio.h>], [
++dnl    static const int one = 1;
++dnl    return (*(char*)&one == 0 ? 0 : 1);
++dnl   ])],
++dnl   [LCMS_BIGENDIAN=1],
++dnl   [LCMS_BIGENDIAN=0])
++dnl 
++dnl if test "x$LCMS_BIGENDIAN" != "x0"; then
++dnl   LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$LCMS_BIGENDIAN"
++dnl   LCMS2_ENDIAN="-DCMS_USE_BIG_ENDIAN=$LCMS_BIGENDIAN"
++dnl   AC_MSG_RESULT(yes)
++dnl else
++dnl   LCMS_ENDIAN=
++dnl   LCMS2_ENDIAN=
++dnl   AC_MSG_RESULT(no)
++dnl fi
+ 
+ 
+ AC_SUBST(LCMS_ENDIAN)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
similarity index 92%
rename from meta/recipes-extended/ghostscript/ghostscript_9.04.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 3f9d7b5..6c1d1a9 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -13,9 +13,9 @@ HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r3"
+PR = "r0"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
@@ -27,12 +27,13 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://ghostscript-9.02-parallel-make.patch \
+	   file://ghostscript-9.05-NOT-check-endian.patch \
            "
 
 SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 
-SRC_URI[md5sum] = "9c2fb4af1eb609d09dba5bb0fa76173a"
-SRC_URI[sha256sum] = "f1e333738c41c3bf2b47ceb9806abb8045bcdc7353002c32736150425a7c1ef4"
+SRC_URI[md5sum] = "f7c6f0431ca8d44ee132a55d583212c1"
+SRC_URI[sha256sum] = "593f77f7584704bdf9de41598a084a4208c3ad3b940a1de1faaf8f59a15cc207"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-jasper \
                 --with-fontpath=${datadir}/fonts --with-install-cups"
-- 
1.7.5.4



