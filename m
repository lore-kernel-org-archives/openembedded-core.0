Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3467C60248
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 03:37:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v053bR7F032657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2017 19:37:27 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 4 Jan 2017 19:37:27 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jan 2017 11:32:54 +0800
Message-ID: <1483587175-2873-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] nettle: Modify configure script to get consistent build.
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
X-List-Received-Date: Thu, 05 Jan 2017 03:37:28 -0000
Content-Type: text/plain

The original configure script detects the header files
of openssl to set variable like 'HAVE_OPENSSL_AES_H' in
config.h and ignore the value of '--enable-openssl', this
may cause inconsistent build.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 ...k-header-files-of-openssl-only-if-enable_.patch | 38 ++++++++++++++++++++++
 ...k-header-files-of-openssl-only-if-enable_.patch | 38 ++++++++++++++++++++++
 meta/recipes-support/nettle/nettle_2.7.1.bb        |  1 +
 meta/recipes-support/nettle/nettle_3.3.bb          |  4 +++
 4 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/check-header-files-of-openssl-only-if-enable_.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch

diff --git a/meta/recipes-support/nettle/nettle-2.7.1/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-2.7.1/check-header-files-of-openssl-only-if-enable_.patch
new file mode 100644
index 0000000..38d9107
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-2.7.1/check-header-files-of-openssl-only-if-enable_.patch
@@ -0,0 +1,38 @@
+From c369dd7049f5a198f8b6c96fde6e294ce5146c2f Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 9 Dec 2016 16:16:45 +0800
+Subject: [PATCH] nettle: check header files of openssl only if
+ 'enable_openssl=yes'.
+
+The original configure script checks openssl header files to generate
+config.h even if 'enable_openssl' is not set to yes, this made inconsistent
+building for nettle.
+
+Upstream-Status: Pending
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ configure.ac | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 78a3d4e..4f16a98 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -603,9 +603,11 @@ AC_CHECK_ALIGNOF(uint64_t)
+ ALIGNOF_UINT64_T="$ac_cv_alignof_uint64_t"
+ AC_SUBST(ALIGNOF_UINT64_T)
+ 
+-AC_CHECK_HEADERS([openssl/blowfish.h openssl/des.h openssl/cast.h openssl/aes.h],,
+-[enable_openssl=no
+- break])
++if test "x$enable_openssl" = "xyes"; then
++  AC_CHECK_HEADERS([openssl/blowfish.h openssl/des.h openssl/cast.h openssl/aes.h],,
++  [enable_openssl=no
++  break])
++fi
+ 
+ LSH_FUNC_ALLOCA
+ LSH_FUNC_STRERROR
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch
new file mode 100644
index 0000000..e7216ba
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch
@@ -0,0 +1,38 @@
+From ffee6b5f6204a0210f717968ec6ce514d70acca1 Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 9 Dec 2016 15:23:17 +0800
+Subject: [PATCH] nettle: check header files of openssl only if
+ 'enable_openssl=yes'.
+
+The original configure script checks openssl header files to generate
+config.h even if 'enable_openssl' is not set to yes, this made inconsistent
+building for nettle.
+
+Upstream-Status: Pending
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ configure.ac | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4ead52c..982760f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -185,9 +185,11 @@ AC_HEADER_TIME
+ AC_CHECK_SIZEOF(long)
+ AC_CHECK_SIZEOF(size_t)
+ 
+-AC_CHECK_HEADERS([openssl/blowfish.h openssl/des.h openssl/cast.h openssl/aes.h openssl/ecdsa.h],,
+-[enable_openssl=no
+- break])
++if test "x$enable_openssl" = "xyes"; then
++  AC_CHECK_HEADERS([openssl/blowfish.h openssl/des.h openssl/cast.h openssl/aes.h openssl/ecdsa.h],,
++  [enable_openssl=no
++  break])
++fi
+ 
+ AC_CHECK_HEADERS([valgrind/memcheck.h])
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index ae8e311..2006146 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -13,6 +13,7 @@ SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6
 SRC_URI += "\
             file://CVE-2015-8803_8805.patch \
             file://CVE-2015-8804.patch \
+            file://check-header-files-of-openssl-only-if-enable_.patch \
             "
 
 DISABLE_STATIC = ""
diff --git a/meta/recipes-support/nettle/nettle_3.3.bb b/meta/recipes-support/nettle/nettle_3.3.bb
index c723e27..b76babf 100644
--- a/meta/recipes-support/nettle/nettle_3.3.bb
+++ b/meta/recipes-support/nettle/nettle_3.3.bb
@@ -7,5 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6
                     file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
                     file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
 
+SRC_URI += "\
+            file://check-header-files-of-openssl-only-if-enable_.patch \
+            "
+
 SRC_URI[md5sum] = "10f969f78a463704ae73529978148dbe"
 SRC_URI[sha256sum] = "46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e"
-- 
1.9.1


