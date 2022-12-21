Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F0CC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 02:59:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.10005.1671591588593571837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K1+qyK3u;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591586; i=@fujitsu.com;
	bh=nMX1lgdWM+CZgnezRl4TjR0ENmCngEGNH3ClQV8eMj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K1+qyK3uaetht2Xsv/fjkhbDpbLccA5E80rP7POqOptifinXCUZjt9VjCutOggXLp
	 pFyx1ccve8GPIH6Ry6pnHOraLswsPcode8tQPe9vBrMcS3On2X42knIltM1eCAmMbg
	 Zmt79HeCBkJeFYakNcwuTqJTpLUAgase93+fH2YRvpV4UG1j43jWl+5If4cjM4KmaC
	 5rkMHKvp+UU+s4S6ybAUgKh9QRxaAEyh0Mol7+oEsOOhrcctQwXtZwNzqMV6xgslqB
	 IF4OQXNAP3s7cImkC64aVGUcIjnxPH2UkxR9/hPuWGhFQjb9ASagNbL+iuJmHAoqX8
	 z0bvu06Bz2ycA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpLuwbFG
  ywYI/ShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bec19YCtbKVuxvu8LWwHhZqouRi0NI4AGj
  xM7GKYwQzmUmiXmN91khnD2MEv9PzGDqYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhASuJ90c+gpWzCKhKNHVdBYvzCjhJzD29AiwuIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtCYtasNqheNYmr5zYxT2Dkn4WkfRaS9gWMTKsYTYtTi8pSi3QN9ZKKMtM
  zSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECQzGlWPXQDsZXS/7o
  HWKU5GBSEuX1YViULMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC17QUKCdYlJqeWpGWmQOMC5i0B
  AePkgivXQlQmre4IDG3ODMdInWK0Z5j6ux/+5k5loPJmV/bDjBzbNrXdYBZiCUvPy9VSpw3FG
  SqAEhbRmke3FBYHF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwbA7KcJzOvBG73K6CzmID
  OmnZzIchZJYkIKakGJvuFT/7tPvnjz3Tjjl9yXTvYDrCcErumx5zPEKcnvpzR7wv3rIVedp0R
  OReXvcuYwZSno6yg1Smk6VkzM648Yy/vbduAeVPENLnUAj64ZyqnZAsEb5iQ5LPrszm/xvEkt
  7U9Qt5OEU9bdNXOzbvdZHKeyX7TscwHt6cq3t689HWhY9Tm9h979s+V13pzN+S+2VyjhI0hx3
  qN5q03nxbqpPZR2WX+5gBls/tLW270eNSaLd1zYmXX4wWLls7/8U4k1vDgYXb2iklP53aduet
  l3b9X4SvjZP8ycVY+Jletur6jJw++3MQdzJw7s9j+m55hnJjXm1ebDzPF/H26W0g3L2fygZmf
  Mh8LG1t7JTTyK7EUZyQaajEXFScCAI/MxbFeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1671591585!20051!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11510 invoked from network); 21 Dec 2022 02:59:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 02:59:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 47C9C1AF
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3C9061AE
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 02:59:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] boost: upgrade 1.80.0 -> 1.81.0
Date: Wed, 21 Dec 2022 10:59:07 +0800
Message-ID: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174889

From: Wang Mingyu <wangmy@fujitsu.com>

0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
removed since it's included in 1.81.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{boost-1.80.0.inc => boost-1.81.0.inc}    |  2 +-
 ...y-binary_function-base-classes-are-d.patch | 34 -------------------
 .../{boost_1.80.0.bb => boost_1.81.0.bb}      |  1 -
 3 files changed, 1 insertion(+), 36 deletions(-)
 rename meta/recipes-support/boost/{boost-1.80.0.inc => boost-1.81.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
 rename meta/recipes-support/boost/{boost_1.80.0.bb => boost_1.81.0.bb} (75%)

diff --git a/meta/recipes-support/boost/boost-1.80.0.inc b/meta/recipes-support/boost/boost-1.81.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.80.0.inc
rename to meta/recipes-support/boost/boost-1.81.0.inc
index 3ee82eb9b2..291796c736 100644
--- a/meta/recipes-support/boost/boost-1.80.0.inc
+++ b/meta/recipes-support/boost/boost-1.81.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0"
+SRC_URI[sha256sum] = "71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
deleted file mode 100644
index 49603348ee..0000000000
--- a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f9b55f5a1fab85bf73c95e6372779d6f50f75e84 Mon Sep 17 00:00:00 2001
-From: jzmaddock <john@johnmaddock.co.uk>
-Date: Mon, 11 Jul 2022 18:26:07 +0100
-Subject: [PATCH] The std lib unary/binary_function base classes are
- deprecated/removed from libcpp15. Fixes
- https://github.com/boostorg/container_hash/issues/24.
-
-Upstream-Status: Backport [https://github.com/boostorg/config/pull/440/commits/f0af4a9184457939b89110795ae2d293582c5f66]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- boost/config/stdlib/libcpp.hpp | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/boost/config/stdlib/libcpp.hpp b/boost/config/stdlib/libcpp.hpp
-index bc8536ead..0e9f2445e 100644
---- a/boost/config/stdlib/libcpp.hpp
-+++ b/boost/config/stdlib/libcpp.hpp
-@@ -168,4 +168,13 @@
- #  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
- #endif
- 
-+#if _LIBCPP_VERSION >= 15000
-+//
-+// Unary function is now deprecated in C++11 and later:
-+//
-+#if __cplusplus >= 201103L
-+#define BOOST_NO_CXX98_FUNCTION_BASE
-+#endif
-+#endif
-+
- //  --- end ---
--- 
-2.37.2
-
diff --git a/meta/recipes-support/boost/boost_1.80.0.bb b/meta/recipes-support/boost/boost_1.81.0.bb
similarity index 75%
rename from meta/recipes-support/boost/boost_1.80.0.bb
rename to meta/recipes-support/boost/boost_1.81.0.bb
index c34ab7d703..4b580d078b 100644
--- a/meta/recipes-support/boost/boost_1.80.0.bb
+++ b/meta/recipes-support/boost/boost_1.81.0.bb
@@ -4,5 +4,4 @@ require boost.inc
 SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
-           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            "
-- 
2.25.1


