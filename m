Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCh-00053l-02
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWdcf006309
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:39 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:37 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:26 -0600
Message-ID: <b61839503c524387960ed41b929aa1ab8efc45cb.1360270256.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1360270255.git.mark.hatle@windriver.com>
References: <cover.1360270255.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 05/11] ghostscript: fix endianness detection
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
X-List-Received-Date: Thu, 07 Feb 2013 23:48:31 -0000
Content-Type: text/plain

From: Jesse Zhang <sen.zhang@windriver.com>

[ CQID: WIND00394747 ]

The original patch removes endianness detection completely, causing lcms
to be built against the wrong endian. Instead, pass the correct endian
through the recipe using SITEINFO_ENDIANNESS.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../ghostscript-9.05-NOT-check-endian.patch        | 40 +++++-----------------
 .../ghostscript/ghostscript_9.05.bb                |  9 ++++-
 2 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
index ab4326f..c79063f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
@@ -4,15 +4,14 @@ So remove the check for Yocto.
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
+Signed-off-by: Sen Zhang <sen.zhang@windriver.com>
 
---- ghostscript-9.05/base/configure.ac.orig	2012-03-14 15:28:30.828956872 +0800
-+++ ghostscript-9.05/base/configure.ac	2012-03-14 15:29:05.060957357 +0800
-@@ -1739,25 +1739,25 @@
- dnl check for big/little endian for LCMS
- dnl --------------------------------------------------
+--- ghostscript-9.05/base/configure.ac.orig     2013-01-06 10:02:08.699479511 +0800
++++ ghostscript-9.05/base/configure.ac  2013-01-06 10:01:52.275382106 +0800
+@@ -1741,13 +1741,13 @@
+ 
+ AC_MSG_CHECKING([for big endian])
  
--AC_MSG_CHECKING([for big endian])
--
 -AC_RUN_IFELSE(
 -  [AC_LANG_PROGRAM([#include <stdio.h>], [
 -   static const int one = 1;
@@ -20,18 +19,6 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
 -  ])],
 -  [LCMS_BIGENDIAN=1],
 -  [LCMS_BIGENDIAN=0])
--
--if test "x$LCMS_BIGENDIAN" != "x0"; then
--  LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$LCMS_BIGENDIAN"
--  LCMS2_ENDIAN="-DCMS_USE_BIG_ENDIAN=$LCMS_BIGENDIAN"
--  AC_MSG_RESULT(yes)
--else
--  LCMS_ENDIAN=
--  LCMS2_ENDIAN=
--  AC_MSG_RESULT(no)
--fi
-+dnl AC_MSG_CHECKING([for big endian])
-+dnl 
 +dnl AC_RUN_IFELSE(
 +dnl   [AC_LANG_PROGRAM([#include <stdio.h>], [
 +dnl    static const int one = 1;
@@ -39,16 +26,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
 +dnl   ])],
 +dnl   [LCMS_BIGENDIAN=1],
 +dnl   [LCMS_BIGENDIAN=0])
-+dnl 
-+dnl if test "x$LCMS_BIGENDIAN" != "x0"; then
-+dnl   LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$LCMS_BIGENDIAN"
-+dnl   LCMS2_ENDIAN="-DCMS_USE_BIG_ENDIAN=$LCMS_BIGENDIAN"
-+dnl   AC_MSG_RESULT(yes)
-+dnl else
-+dnl   LCMS_ENDIAN=
-+dnl   LCMS2_ENDIAN=
-+dnl   AC_MSG_RESULT(no)
-+dnl fi
- 
  
- AC_SUBST(LCMS_ENDIAN)
+ if test "x$LCMS_BIGENDIAN" != "x0"; then
+   LCMS_ENDIAN="-DUSE_BIG_ENDIAN=$LCMS_BIGENDIAN"
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
index 93c503f..9ec5712 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.05.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5326026692dbed183f0558f926580f8"
 
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_class-native = ""
@@ -63,6 +63,13 @@ do_configure_prepend () {
 	if [ -e ${WORKDIR}/objarch.h ]; then
 		cp ${WORKDIR}/objarch.h obj/arch.h
 	fi
+	if [ ${SITEINFO_ENDIANNESS} = "le" ]; then
+		export LCMS_BIGENDIAN="0"
+		export LCMS2_BIGENDIAN="0"
+	else
+		export LCMS_BIGENDIAN="1"
+		export LCMS2_BIGENDIAN="1"
+	fi
 }
 
 do_configure_append () {
-- 
1.8.1.2.545.g2f19ada



