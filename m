Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D56C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 05:33:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4288.1718170391625314937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 22:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6893383dff=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C5Ho8X023619
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:11 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme963ed2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:10 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 22:32:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 22:32:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] ccache: 4.9.1 -> 4.10
Date: Tue, 11 Jun 2024 22:32:53 -0700
Message-ID: <cb1a3e14bd806b9603df4f0f772db86056fb57d5.1718168026.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718168026.git.liezhi.yang@windriver.com>
References: <cover.1718168026.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bjtFnw3MzmP9t_6li-BP_gQqcBKN3POj
X-Proofpoint-ORIG-GUID: bjtFnw3MzmP9t_6li-BP_gQqcBKN3POj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 05:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200563

From: Robert Yang <liezhi.yang@windriver.com>

* Remove 0001-xxhash.h-Fix-build-with-gcc-12.patch since there is no xxhash in
  ccache by default any more.

* License-Update:
  - Update LIC_FILES_CHKSUM becaue a few third party licenses have been removed:
  $ git diff --stat v4.9.1..v4.10 LICENSE.adoc
    LICENSE.adoc | 222 +++++++++---------------------
    1 file changed, 15 insertions(+), 207 deletions(-)

  And add more licenses for third party files.

* Add required recipe fmt and xxhash to DEPENDS.

* Set ENABLE_TESTING=OFF since it requires doctest which is not present in oe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{ccache_4.9.1.bb => ccache_4.10.bb}       | 20 ++++++----
 .../0001-xxhash.h-Fix-build-with-gcc-12.patch | 37 -------------------
 2 files changed, 13 insertions(+), 44 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.9.1.bb => ccache_4.10.bb} (44%)
 delete mode 100644 meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch

diff --git a/meta/recipes-devtools/ccache/ccache_4.9.1.bb b/meta/recipes-devtools/ccache/ccache_4.10.bb
similarity index 44%
rename from meta/recipes-devtools/ccache/ccache_4.9.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.10.bb
index 0d447c49158..df169b9c2b5 100644
--- a/meta/recipes-devtools/ccache/ccache_4.9.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.10.bb
@@ -6,15 +6,18 @@ Objective-C and Objective-C++."
 HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
-LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=9896d6f0aee4d89b9e5ff0afaae0af06"
+LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=c72fa5755dc70ec5b439212d47299414 \
+                    file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=5389d9f5a88a138e42ba58894bbceeac \
+                    file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
+                    file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
+"
 
-DEPENDS = "zstd"
+DEPENDS = "zstd fmt xxhash"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
-           "
-SRC_URI[sha256sum] = "12834ecaaaf2db069dda1d1d991f91c19e3274cc04a471af5b64195def17e90f"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+
+SRC_URI[sha256sum] = "16972ba62c8499045edc3ae7d7b8a0b419a961567f5ff0f01bf5a44194204775"
 
 inherit cmake github-releases
 
@@ -24,3 +27,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
 PACKAGECONFIG[redis] = "-DREDIS_STORAGE_BACKEND=ON,-DREDIS_STORAGE_BACKEND=OFF,hiredis"
+
+# ENABLE_TESTING requires doctest which is not present in oe
+EXTRA_OECMAKE += "-DENABLE_TESTING=OFF"
diff --git a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
deleted file mode 100644
index e65b8302577..00000000000
--- a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d17fdacf4892a15fafb56b0890ece05b485e89fb Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 6 Jun 2022 17:53:20 +0800
-Subject: [PATCH] xxhash.h: Fix build with gcc-12
-
-Remove inline attribute to fix below build failure:
-  | /buildarea/tmp/work/core2-64-poky-linux/ccache/4.6.1-r0/ccache-4.6.1/src/third_party/xxhash.h:3932:1: error: inlining failed in call to 'always_inline' 'XXH3_accumulate_512_sse2': function not considered for inlining
-  3932 | XXH3_accumulate_512_sse2( void* XXH_RESTRICT acc,
-       | ^~~~~~~~~~~~~~~~~~~~~~~~
-  /buildarea/tmp/work/core2-64-poky-linux/ccache/4.6.1-r0/ccache-4.6.1/src/third_party/xxhash.h:4369:9: note: called from here
-  4369 |         f_acc512(acc,
-       |         ^~~~~~~~~~~~~
-  4370 |                  in,
-       |                  ~~~
-  4371 |                  secret + n*XXH_SECRET_CONSUME_RATE);
-
-Upstream-Status: Submitted [https://github.com/Cyan4973/xxHash/pull/720]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
----
- src/third_party/xxhash.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/third_party/xxhash.h b/src/third_party/xxhash.h
-index a18e8c7..1b72307 100644
---- a/src/third_party/xxhash.h
-+++ b/src/third_party/xxhash.h
-@@ -2107,7 +2107,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
- #  define XXH_NO_INLINE static
- /* enable inlining hints */
- #elif defined(__GNUC__) || defined(__clang__)
--#  define XXH_FORCE_INLINE static __inline__ __attribute__((always_inline, unused))
-+#  define XXH_FORCE_INLINE static
- #  define XXH_NO_INLINE static __attribute__((noinline))
- #elif defined(_MSC_VER)  /* Visual Studio */
- #  define XXH_FORCE_INLINE static __forceinline
-- 
2.45.1


