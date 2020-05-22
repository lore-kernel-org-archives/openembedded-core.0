Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9781.1590139400208208148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 02:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,421,1583164800"; 
   d="scan'208";a="92800452"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 17:23:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 130684C4A88F
	for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 17:23:11 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 17:23:12 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] boost: upgrade 1.72.0 -> 1.73.0
Date: Sat, 23 May 2020 02:23:08 +0800
Message-ID: <1590171788-9384-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 130684C4A88F.A5527
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh 0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
remove 0001-revert-cease-dependence-on-range.patch
since it is included in 1.73.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...native_1.72.0.bb => bjam-native_1.73.0.bb} |  0
 .../{boost-1.72.0.inc => boost-1.73.0.inc}    |  4 +-
 ...h-instruction-set-flags-we-do-that-o.patch | 15 ++++--
 .../{boost_1.72.0.bb => boost_1.73.0.bb}      |  1 -
 ...001-revert-cease-dependence-on-range.patch | 53 -------------------
 5 files changed, 12 insertions(+), 61 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.72.0.bb => bjam-native_1.73.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.72.0.inc => boost-1.73.0.inc} (85%)
 rename meta/recipes-support/boost/{boost_1.72.0.bb => boost_1.73.0.bb} (86%)
 delete mode 100644 meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch

diff --git a/meta/recipes-support/boost/bjam-native_1.72.0.bb b/meta/recipes-support/boost/bjam-native_1.73.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.72.0.bb
rename to meta/recipes-support/boost/bjam-native_1.73.0.bb
diff --git a/meta/recipes-support/boost/boost-1.72.0.inc b/meta/recipes-support/boost/boost-1.73.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.72.0.inc
rename to meta/recipes-support/boost/boost-1.73.0.inc
index 55a095bf1c..b574757199 100644
--- a/meta/recipes-support/boost/boost-1.72.0.inc
+++ b/meta/recipes-support/boost/boost-1.73.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "cb40943d2a2cb8ce08d42bc48b0f84f0"
-SRC_URI[sha256sum] = "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722"
+SRC_URI[md5sum] = "9273c8c4576423562bbe84574b07b2bd"
+SRC_URI[sha256sum] = "4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 68d6e6417f..7c6b62e383 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,21 +1,22 @@
 From f4d3fad43d67808d71325ba0df1457555b9a0086 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
-Subject: [PATCH] Don't set up arch/instruction-set flags, we do that ourselves
+Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
+ourselves
 
 Upstream-Status: Inappropriate
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- tools/build/src/tools/gcc.jam | 132 ----------------------------------
- 1 file changed, 132 deletions(-)
+ tools/build/src/tools/gcc.jam | 133 ----------------------------------
+ 1 file changed, 133 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index b9bb9cf2a..c7e3cf3fe 100644
+index 8910a55f2..ed7e7b20c 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1180,135 +1180,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1195,136 +1195,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -149,5 +150,9 @@ index b9bb9cf2a..c7e3cf3fe 100644
 -cpu-flags gcc OPTIONS : s390x : zEC12 : -march=zEC12 ;
 -cpu-flags gcc OPTIONS : s390x : z13 : -march=z13 ;
 -cpu-flags gcc OPTIONS : s390x : z14 : -march=z14 ;
+-cpu-flags gcc OPTIONS : s390x : z15 : -march=z15 ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.73.0.bb
similarity index 86%
rename from meta/recipes-support/boost/boost_1.72.0.bb
rename to meta/recipes-support/boost/boost_1.73.0.bb
index 0b7badbc76..5e9e0d87d7 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.73.0.bb
@@ -7,5 +7,4 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
-           file://0001-revert-cease-dependence-on-range.patch \
            "
diff --git a/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
deleted file mode 100644
index d6d09a23a5..0000000000
--- a/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001
-From: Oliver Kowalke <oliver.kowalke@gmail.com>
-Date: Sun, 1 Dec 2019 20:40:28 +0100
-Subject: [PATCH] Revert "Cease dependence on Range"
-
-This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.
-
-see #44 (One test fails to compile after boostorg/coroutine submodule updated)
-
-Upstream-Status: Backport [https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447]
-
-Signed-off-by: Andrew Geissler <geissonator@gmail.com>
----
- boost/coroutine/asymmetric_coroutine.hpp | 12 +++---------
- 1 file changed, 3 insertions(+), 9 deletions(-)
-
-diff --git a/boost/coroutine/asymmetric_coroutine.hpp b/boost/coroutine/asymmetric_coroutine.hpp
-index ea96981..640896f 100644
---- a/boost/coroutine/asymmetric_coroutine.hpp
-+++ b/boost/coroutine/asymmetric_coroutine.hpp
-@@ -14,6 +14,7 @@
- #include <boost/assert.hpp>
- #include <boost/config.hpp>
- #include <boost/move/move.hpp>
-+#include <boost/range.hpp>
- #include <boost/throw_exception.hpp>
- #include <boost/utility/explicit_operator_bool.hpp>
-
-@@ -2354,19 +2355,12 @@ end( push_coroutine< R > & c)
-
- }
-
--// forward declaration of Boost.Range traits to break dependency on it
--template<typename C, typename Enabler>
--struct range_mutable_iterator;
--
--template<typename C, typename Enabler>
--struct range_const_iterator;
--
- template< typename Arg >
--struct range_mutable_iterator< coroutines::push_coroutine< Arg >, void >
-+struct range_mutable_iterator< coroutines::push_coroutine< Arg > >
- { typedef typename coroutines::push_coroutine< Arg >::iterator type; };
-
- template< typename R >
--struct range_mutable_iterator< coroutines::pull_coroutine< R >, void >
-+struct range_mutable_iterator< coroutines::pull_coroutine< R > >
- { typedef typename coroutines::pull_coroutine< R >::iterator type; };
-
- }
---
-2.24.1
-
-- 
2.17.1



