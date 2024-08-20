Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FD1C5472D
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.12714.1724136734165970101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KGSMlHQX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136736; x=1755672736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b2KLg+f0cMisyPwIlFAg0u45T4HSJgeu/UwqKm0gdsw=;
  b=KGSMlHQXABTzSKuTtUAf2QMa7G0RS7upcClcGx1PdWhqcyzqlR+Q7AH+
   RqjWNO3eykMQnKhKh4guzLdLAdrEmihkxWZpgm8CI3HYiVaBEjNQYo6vd
   RRmItbqSXQYBfPygfcu1+ZjowzDnfKM4XlIh/VJM7R7bI4Ew7WUoZ/eDA
   bRvL8HPhsS/B9lN7FmMyG6oc6o+NKT6z4JubGjxLheDFDCT7AKi3KwemA
   J3ILGkrnwonl1cbcEAeJPAjoFcQxczlY6amTn35h8dQLmI8rB6kIqLi+O
   pKHIuc9Fgym/EuMHDQIxCaGWQE4A1f+Hh4WxwAG5LhY70PfjtwOtsN0P+
   Q==;
X-CSE-ConnectionGUID: zkUbvlYmRISpMEpWxanYXQ==
X-CSE-MsgGUID: yZNujqhCQaS9PjqRM5y2FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="170301724"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="170301724"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA61AD8012
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 393A8D8B67
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C170D216766
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A0CB1A000E;
	Tue, 20 Aug 2024 14:52:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/24] ethtool: upgrade 6.9 -> 6.10
Date: Tue, 20 Aug 2024 14:51:27 +0800
Message-Id: <1724136703-20023-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--4.678700-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yTyjd/AizytBnJdsOLB4zv79wRnyxuPjhD/F
	TUBlj5CjmC+wH+KoDco7yfsJcvd7kq9LXqtHL0cwb/oIJuUAIuFN8rmPQRlvK17V7de6Unlgn9u
	6ZDHvy7fEFeiN2zKWKV0cZdCr/5H1YlldA0POS1K5x7uAXGEprdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitWdWe73PBg3zhOfJXqrCRAihQ5NZCXsS3SkTY86NiDhvdamP01JcrCvC3
	4sFimMjjNY4mMxXHJ49sdBVNAjZFUiHeXNaI0jjnVTWWiNp+v8O8pJojG7qSpsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNZRSEbv6aIG2hbXMN4XBFpOpxWE4e4TYnFelQQQyhx161rGFqoao6wJm5eb
	iEX5cope+Z0n4cW36M5U+XzgIW/o0aPITj7A8x/K+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203529

From: Wang Mingyu <wangmy@fujitsu.com>

avoid_parallel_tests.patch
refreshed for 6.10

Changelog:
==========
* Feature: suport for PoE in PSE (--show-pse and --set-pse)
* Feature: add statistics support to tsinfo (-T)
* Feature: add JSON output to base command (no option)
* Feature: add JSON output to EEE info (--show-eee)
* Fix: qsfp: better handling on page 03h read failure (-m)
* Fix: handle zero arguments for module eeprom dump (-m)
* Fix: check for missing arguments in do_srxfh() (-X)
* Misc: compiler warnings in "make check"
* Misc: more descriptive error when JSON output is not available

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch             | 7 +++----
 .../ethtool/{ethtool_6.9.bb => ethtool_6.10.bb}            | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.9.bb => ethtool_6.10.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index ad4aabaa96..0fe482545a 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 758fde7186730ee331a0ee6149276cd412766ee0 Mon Sep 17 00:00:00 2001
+From 74902bef8123b596437587bb48ad9b720cb06f64 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -9,16 +9,15 @@ serial-tests is required to generate those targets.
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
 (default automake behavior incompatible with ptest)
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c871558..8ea1eaa 100644
+index f6fe260..65a0566 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.9, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.10, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.9.bb b/meta/recipes-extended/ethtool/ethtool_6.10.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.9.bb
rename to meta/recipes-extended/ethtool/ethtool_6.10.bb
index 1837b1ed1e..8a7b2607f3 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.9.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "0011fb1b20101879f2d01d39cd2bc1d9646990d07d64de893415404a3afc53ef"
+SRC_URI[sha256sum] = "2b266c45c0fe00e5f5b462ee4e795879fa4247003bf73c5a07a2279d801be058"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.34.1


