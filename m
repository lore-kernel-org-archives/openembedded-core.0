Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 075CD61580
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:21:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83480841"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 14:21:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 290E050A9971
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:11:35 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 14:21:12 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 14:21:17 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 05:39:57 -0800
Message-ID: <1582033197-93331-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 290E050A9971.A1195
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpcre: upgrade 8.43 -> 8.44
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Feb 2020 06:21:13 -0000
Content-Type: text/plain

out-of-tree.patch
Removed since it is included in 8.44.

Copyright updated: 2019 -> 2020

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libpcre/libpcre/out-of-tree.patch         | 26 -------------------
 .../{libpcre_8.43.bb => libpcre_8.44.bb}      |  7 +++--
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/out-of-tree.patch
 rename meta/recipes-support/libpcre/{libpcre_8.43.bb => libpcre_8.44.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch b/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
deleted file mode 100644
index d56789615f..0000000000
--- a/meta/recipes-support/libpcre/libpcre/out-of-tree.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-In out-of-tree builds the #include fails because $srcdir isn't in the include path.  Set CPPFLAGS so that it is.
-
-Upstream-Status: Backport [r1750]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: configure.ac
-===================================================================
---- a/configure.ac	(revision 1749)
-+++ b/configure.ac	(working copy)
-@@ -159,6 +159,8 @@
- 
- if test "$enable_jit" = "auto"; then
-   AC_LANG(C)
-+  SAVE_CPPFLAGS=$CPPFLAGS
-+  CPPFLAGS=-I$srcdir
-   AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-   #define SLJIT_CONFIG_AUTO 1
-   #include "sljit/sljitConfigInternal.h"
-@@ -165,6 +167,7 @@
-   #if (defined SLJIT_CONFIG_UNSUPPORTED && SLJIT_CONFIG_UNSUPPORTED)
-   #error unsupported
-   #endif]])], enable_jit=yes, enable_jit=no)
-+  CPPFLAGS=$SAVE_CPPFLAGS
- fi
- 
- # Handle --disable-pcregrep-jit (enabled by default)
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.43.bb
rename to meta/recipes-support/libpcre/libpcre_8.44.bb
index f9a22fee9d..a1f835e454 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -6,16 +6,15 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=91bee59d1b327eb1599b4c673e2fb3d1"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://fix-pcre-name-collision.patch \
-           file://out-of-tree.patch \
            file://run-ptest \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "636222e79e392c3d95dcc545f24f98c4"
-SRC_URI[sha256sum] = "91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b"
+SRC_URI[md5sum] = "cf7326204cc46c755b5b2608033d9d24"
+SRC_URI[sha256sum] = "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d"
 
 CVE_PRODUCT = "pcre"
 
-- 
2.17.1




