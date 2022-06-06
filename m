Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B823AC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 10:51:23 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.30510.1654512673352306412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 03:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 256Ap1Dk017507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 6 Jun 2022 03:51:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 6 Jun 2022 03:51:00 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 6 Jun 2022 03:50:59 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ccache: Fix build with gcc-12
Date: Mon, 6 Jun 2022 18:50:59 +0800
Message-ID: <20220606105059.1261415-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 10:51:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166591

From: Mingli Yu <mingli.yu@windriver.com>

Fix the build failure when debug build is enabled.
Add DEBUG_BUILD = "1" in conf/local.conf.
 $ bitbake ccache
 | /buildarea/tmp/work/core2-64-poky-linux/ccache/4.6.1-r0/ccache-4.6.1/src/third_party/xxhash.h:3932:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_sse2': function not considered for inlining
 3932 | XXH3_accumulate_512_sse2( void* XXH_RESTRICT acc,
      | ^~~~~~~~~~~~~~~~~~~~~~~~
 /buildarea/tmp/work/core2-64-poky-linux/ccache/4.6.1-r0/ccache-4.6.1/src/third_party/xxhash.h:4369:9: note: called from here
 4369 |         f_acc512(acc,
      |         ^~~~~~~~~~~~~
 4370 |                  in,
      |                  ~~~
 4371 |                  secret + n*XXH_SECRET_CONSUME_RATE);

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_4.6.1.bb  |  4 +-
 .../0001-xxhash.h-Fix-build-with-gcc-12.patch | 39 +++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch

diff --git a/meta/recipes-devtools/ccache/ccache_4.6.1.bb b/meta/recipes-devtools/ccache/ccache_4.6.1.bb
index 418d1070cd..0d6471ddbc 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.1.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=7a19377a02749d8a1281ed608169b0ee"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
+           file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
+"
 SRC_URI[sha256sum] = "59b28a57c3a45e48d6049001999c9f94cd4d3e9b0196994bed9a6a7437ffa3bc"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
diff --git a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
new file mode 100644
index 0000000000..4c2623e69d
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
@@ -0,0 +1,39 @@
+From cfde5ba7d10ae1e9d0c259dd1e7027e9bad8f83c Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 6 Jun 2022 17:53:20 +0800
+Subject: [PATCH] xxhash.h: Fix build with gcc-12
+
+Remove inline attribute to fix below build failure:
+  | /buildarea/tmp/work/core2-64-poky-linux/ccache/4.6.1-r0/ccache-4.6.1/src/third_party/xxhash.h:3932:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_sse2': function not considered for inlining
+  3932 | XXH3_accumulate_512_sse2( void* XXH_RESTRICT acc,
+       | ^~~~~~~~~~~~~~~~~~~~~~~~
+  /buildarea/tmp/work/core2-64-poky-linux/ccache/4.6.1-r0/ccache-4.6.1/src/third_party/xxhash.h:4369:9: note: called from here
+  4369 |         f_acc512(acc,
+       |         ^~~~~~~~~~~~~
+  4370 |                  in,
+       |                  ~~~
+  4371 |                  secret + n*XXH_SECRET_CONSUME_RATE);
+
+Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1089]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/third_party/xxhash.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/third_party/xxhash.h b/src/third_party/xxhash.h
+index 08ab794..c754e99 100644
+--- a/src/third_party/xxhash.h
++++ b/src/third_party/xxhash.h
+@@ -1501,7 +1501,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ #  define XXH_NO_INLINE static
+ /* enable inlining hints */
+ #elif defined(__GNUC__) || defined(__clang__)
+-#  define XXH_FORCE_INLINE static __inline__ __attribute__((always_inline, unused))
++#  define XXH_FORCE_INLINE static
+ #  define XXH_NO_INLINE static __attribute__((noinline))
+ #elif defined(_MSC_VER)  /* Visual Studio */
+ #  define XXH_FORCE_INLINE static __forceinline
+-- 
+2.25.1
+
-- 
2.25.1


