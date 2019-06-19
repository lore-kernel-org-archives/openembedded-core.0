Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0017E6C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 03:57:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,390,1557158400"; d="scan'208";a="67993923"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 11:57:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3756F4CDD971
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 11:57:10 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 11:57:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 11:58:32 +0800
Message-ID: <20190619035832.17512-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3756F4CDD971.A8A93
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libevent:upgrade 2.1.8 -> 2.1.10
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
X-List-Received-Date: Wed, 19 Jun 2019 03:57:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libevent_2.1.8.bb to libevent_2.1.10.bb.

-libevent/0001-test-fix-32bit-linux-regress.patch
Removed since this is included in 2.1.10.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-test-fix-32bit-linux-regress.patch   | 48 -------------------
 .../{libevent_2.1.8.bb => libevent_2.1.10.bb} |  5 +-
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch
 rename meta/recipes-support/libevent/{libevent_2.1.8.bb => libevent_2.1.10.bb} (84%)

diff --git a/meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch b/meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch
deleted file mode 100644
index 36d08204f7..0000000000
--- a/meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 69a3813c513c84e02212250c3d5b8a02ecefa698 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Mon, 15 Jan 2018 08:00:33 +0000
-Subject: [PATCH] test: fix 32bit linux regress
-
-This patch comes from https://github.com/libevent/libevent.git,
-the commit is 63c4bf78d6af3c6ff46d2e8e4b53dd9f577a9ca9
-
-Upstream-Status: Backport
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- configure.ac        | 1 +
- test/regress_util.c | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 7528d37..e64cb1f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -663,6 +663,7 @@ AC_CHECK_SIZEOF(short)
- AC_CHECK_SIZEOF(size_t)
- AC_CHECK_SIZEOF(void *)
- AC_CHECK_SIZEOF(off_t)
-+AC_CHECK_SIZEOF(time_t)
- 
- AC_CHECK_TYPES([struct in6_addr, struct sockaddr_in6, sa_family_t, struct addrinfo, struct sockaddr_storage], , ,
- [#define _GNU_SOURCE
-diff --git a/test/regress_util.c b/test/regress_util.c
-index ef6a148..0c7eafb 100644
---- a/test/regress_util.c
-+++ b/test/regress_util.c
-@@ -1412,10 +1412,12 @@ static struct date_rfc1123_case {
- 	{  1289433600, "Thu, 11 Nov 2010 00:00:00 GMT"},
- 	{  1323648000, "Mon, 12 Dec 2011 00:00:00 GMT"},
- #ifndef _WIN32
-+#if EVENT__SIZEOF_TIME_T > 4
- 	/** In win32 case we have max   "23:59:59 January 18, 2038, UTC" for time32 */
- 	{  4294967296, "Sun, 07 Feb 2106 06:28:16 GMT"} /* 2^32 */,
- 	/** In win32 case we have max "23:59:59, December 31, 3000, UTC" for time64 */
- 	{253402300799, "Fri, 31 Dec 9999 23:59:59 GMT"} /* long long future no one can imagine */,
-+#endif /* time_t != 32bit */
- 	{  1456704000, "Mon, 29 Feb 2016 00:00:00 GMT"} /* leap year */,
- #endif
- 	{  1435708800, "Wed, 01 Jul 2015 00:00:00 GMT"} /* leap second */,
--- 
-2.13.3
-
diff --git a/meta/recipes-support/libevent/libevent_2.1.8.bb b/meta/recipes-support/libevent/libevent_2.1.10.bb
similarity index 84%
rename from meta/recipes-support/libevent/libevent_2.1.8.bb
rename to meta/recipes-support/libevent/libevent_2.1.10.bb
index 0f91e05a6c..81ceb1cd91 100644
--- a/meta/recipes-support/libevent/libevent_2.1.8.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.10.bb
@@ -9,12 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
 SRC_URI = " \
     https://github.com/libevent/libevent/releases/download/release-${PV}-stable/${BP}-stable.tar.gz \
     file://Makefile-missing-test-dir.patch \
-    file://0001-test-fix-32bit-linux-regress.patch \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "f3eeaed018542963b7d2416ef1135ecc"
-SRC_URI[sha256sum] = "965cc5a8bb46ce4199a47e9b2c9e1cae3b137e8356ffdad6d94d3b9069b71dc2"
+SRC_URI[md5sum] = "999caf86f52943af2363bc8077f00167"
+SRC_URI[sha256sum] = "e864af41a336bb11dab1a23f32993afe963c1f69618bd9292b89ecf6904845b0"
 
 UPSTREAM_CHECK_URI = "http://libevent.org/"
 
-- 
2.20.1




