Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84CAC369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:43:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14873.1744796577783051544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sWQVN5Fk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744796577; x=1776332577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zgtuRqyy5zD8kcUmiRsncCPXjlAZSse6Rlv4LPAkTzQ=;
  b=sWQVN5FkuApBYb7Kne2KuNjCRobcXAikSQCktHTz2wxGZvI5PoCzKVD6
   sIKboBqQfxqjD0Jia4+bq7vFxVMRNBPsIiWAQzEOFprZjEQJE7DXpq9AX
   OZQiZKzoHKPRYARDFZqBVOTI7gOavyVNJwB4T9076mPKd1S1MkpDBgXI0
   ucpPtSNM9eoAlSph6i+YkhJ/KvDE3+ZSR+z5QTJlpknAOT1/Doq8Z8iQ6
   QEbzfQ708m4Kiu2O8ICnXRGT9tTOYnFhL2o7STOrMkjQWvl2PP7H/cMn9
   zCLOc7lgMbGsoHzQ8v60tjr9QZIHKpJlKyQRiJrrqaqvATiWkDBYGyLDa
   Q==;
X-CSE-ConnectionGUID: y9fDZt9hRB6RBGenPchpHQ==
X-CSE-MsgGUID: /4biE9MiSoyBqVLebX0zPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175513160"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175513160"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:42:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61F24D4C33
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 18:42:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19D0BD6FE5
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 18:42:53 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 630501A0078;
	Wed, 16 Apr 2025 17:42:52 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 6.11 -> 6.14
Date: Wed, 16 Apr 2025 17:42:49 +0800
Message-Id: <20250416094249.717-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214985

Package metainfo xml to doc, fix the issue that:

| ERROR: ethtool-6.14-r0 do_package: QA Issue: ethtool: Files/directories were installed but not shipped in any package:
|   /usr/share/metainfo
|   /usr/share/metainfo/org.kernel.software.network.ethtool.metainfo.xml
| Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
| ethtool: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.11.bb => ethtool_6.14.bb}            | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.11.bb => ethtool_6.14.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 0fe482545a..4affc332a9 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 74902bef8123b596437587bb48ad9b720cb06f64 Mon Sep 17 00:00:00 2001
+From 755cf01b02e6ec8c8acb79558cbad28e301519b3 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f6fe260..65a0566 100644
+index db71394..5e93135 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.10, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.14, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.11.bb b/meta/recipes-extended/ethtool/ethtool_6.14.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_6.11.bb
rename to meta/recipes-extended/ethtool/ethtool_6.14.bb
index c4808c5856..f5e83c0482 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.11.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.14.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "a8bee475d991939cad182b7dbcf3a1f139aeed8cb0add73d72084cd71d43282b"
+SRC_URI[sha256sum] = "3dbfc910513d1fef683f27ab12325cc88551abffae66d0ad3afe2a13317d2339"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
@@ -22,6 +22,8 @@ RDEPENDS:${PN}-ptest += "make bash"
 PACKAGECONFIG ?= "netlink"
 PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink,libmnl,"
 
+FILES:${PN}-doc += "${datadir}/metainfo/org.kernel.software.network.ethtool.metainfo.xml"
+
 do_compile_ptest() {
    oe_runmake buildtest-TESTS
 }
-- 
2.43.0


