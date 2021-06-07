Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.33079.1623052879350549388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15781IBh015055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jun 2021 01:01:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 7 Jun 2021 01:01:18 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 7 Jun 2021 01:01:17 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] boost: fix wrong type for mutex in regex v5
Date: Mon, 7 Jun 2021 15:59:11 +0800
Message-ID: <20210607075911.36045-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
 | ./boost/regex/v5/mem_block_cache.hpp:91:11: error: 'static_mutex' in namespace 'boost' does not name a type
 |    91 |    boost::static_mutex mut;

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...xes-wrong-type-for-mutex-in-regex-v5.patch | 54 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.76.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch

diff --git a/meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch b/meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch
new file mode 100644
index 0000000000..a8305ff2e0
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch
@@ -0,0 +1,54 @@
+From 6064875bff2e52ba63f01911eb4deb79259c5e3b Mon Sep 17 00:00:00 2001
+From: Carlos Miguel Ferreira <carlosmf.pt@gmail.com>
+Date: Thu, 3 Jun 2021 23:10:37 +0100
+Subject: [PATCH] Fixes wrong type for mutex in regex v5
+
+With the Boost.Regex to ehader-only library, the declaration
+of a mutex that should have been changed from boost::static_mutex
+to std::mutex was left behind. This was preventing regex from
+being built for older arm platforms [1]
+
+[1]: https://github.com/openwrt/packages/issues/15725
+
+Upstream-Status: Submitted [https://github.com/boostorg/regex/pull/132]
+
+Signed-off-by: Carlos Miguel Ferreira <carlosmf.pt@gmail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ boost/regex/v5/mem_block_cache.hpp | 12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/boost/regex/v5/mem_block_cache.hpp b/boost/regex/v5/mem_block_cache.hpp
+index 0af4eae1..eb3ec776 100644
+--- a/boost/regex/v5/mem_block_cache.hpp
++++ b/boost/regex/v5/mem_block_cache.hpp
+@@ -85,10 +85,10 @@ struct mem_block_node
+ struct mem_block_cache
+ {
+    // this member has to be statically initialsed:
+-   mem_block_node* next;
+-   unsigned cached_blocks;
++   mem_block_node* next { nullptr };
++   unsigned cached_blocks { 0 };
+ #ifdef BOOST_HAS_THREADS
+-   boost::static_mutex mut;
++   std::mutex mut;
+ #endif
+ 
+    ~mem_block_cache()
+@@ -133,11 +133,7 @@ struct mem_block_cache
+    }
+    static mem_block_cache& instance()
+    {
+-#ifdef BOOST_HAS_THREADS
+-      static mem_block_cache block_cache = { 0, 0, BOOST_STATIC_MUTEX_INIT, };
+-#else
+-      static mem_block_cache block_cache = { 0, 0, };
+-#endif
++      static mem_block_cache block_cache;
+       return block_cache;
+    }
+ };
+-- 
+2.29.2
+
diff --git a/meta/recipes-support/boost/boost_1.76.0.bb b/meta/recipes-support/boost/boost_1.76.0.bb
index 23b0ffc67e..ae91b1c875 100644
--- a/meta/recipes-support/boost/boost_1.76.0.bb
+++ b/meta/recipes-support/boost/boost_1.76.0.bb
@@ -7,4 +7,5 @@ SRC_URI += " \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
+           file://0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch \
            "
-- 
2.29.2

