Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1E071A8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 07:59:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0I7xWvT015279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 23:59:33 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 23:59:31 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 23:59:32 -0800
Message-ID: <20180118075932.108017-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libevent: fix 32bit linux regress test
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
X-List-Received-Date: Thu, 18 Jan 2018 07:59:34 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Fix 32bit linux regress test

This patch is backported from https://github.com/libevent/libevent/commit/63c4bf78d6af3c6ff46d2e8e4b53dd9f577a9ca9

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../0001-test-fix-32bit-linux-regress.patch        | 48 ++++++++++++++++++++++
 meta/recipes-support/libevent/libevent_2.1.8.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch

diff --git a/meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch b/meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch
new file mode 100644
index 0000000000..36d08204f7
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0001-test-fix-32bit-linux-regress.patch
@@ -0,0 +1,48 @@
+From 69a3813c513c84e02212250c3d5b8a02ecefa698 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 15 Jan 2018 08:00:33 +0000
+Subject: [PATCH] test: fix 32bit linux regress
+
+This patch comes from https://github.com/libevent/libevent.git,
+the commit is 63c4bf78d6af3c6ff46d2e8e4b53dd9f577a9ca9
+
+Upstream-Status: Backport
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ configure.ac        | 1 +
+ test/regress_util.c | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 7528d37..e64cb1f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -663,6 +663,7 @@ AC_CHECK_SIZEOF(short)
+ AC_CHECK_SIZEOF(size_t)
+ AC_CHECK_SIZEOF(void *)
+ AC_CHECK_SIZEOF(off_t)
++AC_CHECK_SIZEOF(time_t)
+ 
+ AC_CHECK_TYPES([struct in6_addr, struct sockaddr_in6, sa_family_t, struct addrinfo, struct sockaddr_storage], , ,
+ [#define _GNU_SOURCE
+diff --git a/test/regress_util.c b/test/regress_util.c
+index ef6a148..0c7eafb 100644
+--- a/test/regress_util.c
++++ b/test/regress_util.c
+@@ -1412,10 +1412,12 @@ static struct date_rfc1123_case {
+ 	{  1289433600, "Thu, 11 Nov 2010 00:00:00 GMT"},
+ 	{  1323648000, "Mon, 12 Dec 2011 00:00:00 GMT"},
+ #ifndef _WIN32
++#if EVENT__SIZEOF_TIME_T > 4
+ 	/** In win32 case we have max   "23:59:59 January 18, 2038, UTC" for time32 */
+ 	{  4294967296, "Sun, 07 Feb 2106 06:28:16 GMT"} /* 2^32 */,
+ 	/** In win32 case we have max "23:59:59, December 31, 3000, UTC" for time64 */
+ 	{253402300799, "Fri, 31 Dec 9999 23:59:59 GMT"} /* long long future no one can imagine */,
++#endif /* time_t != 32bit */
+ 	{  1456704000, "Mon, 29 Feb 2016 00:00:00 GMT"} /* leap year */,
+ #endif
+ 	{  1435708800, "Wed, 01 Jul 2015 00:00:00 GMT"} /* leap second */,
+-- 
+2.13.3
+
diff --git a/meta/recipes-support/libevent/libevent_2.1.8.bb b/meta/recipes-support/libevent/libevent_2.1.8.bb
index 1270d627f8..83ce4644cf 100644
--- a/meta/recipes-support/libevent/libevent_2.1.8.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.8.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
 SRC_URI = " \
     https://github.com/libevent/libevent/releases/download/release-${PV}-stable/${BP}-stable.tar.gz \
     file://Makefile-missing-test-dir.patch \
+    file://0001-test-fix-32bit-linux-regress.patch \
     file://run-ptest \
 "
 
-- 
2.11.0


