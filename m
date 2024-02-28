Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CF4C54E56
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8387.1709105594034947332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=An0yH4H2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105598; x=1740641598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+m+qz+l5psmf5J43TxKkgAw+1obTcRtQxL5YHjKSfbM=;
  b=An0yH4H2umoGbusG8nJyvoGdTlf7hp3ga5WOeOXinh9aVqZsAyZx6aVp
   WLYaIK3BMGwJ4CK2pg/vzP1t1dCZUMa29ZsdW1MuqgRQOwDHP9VtruDxc
   UdeUE7Vy1K+0Xenu4XKUBsvXv6Bf1VnKNC8kCiMb2QhEWFNqTTxun3zTW
   DapGAv9tvsVwMpFzRN4f66ZpnkqxTXpmB5wddc3inHNV6VaAXQmoqbLQh
   wyvYGpVITZyQEAkGw9sBQ9sKygGdITTmfFTW1oa4RvyIZCQWk8rAsip+F
   9C9ApiABxMugbS2HUKWu7g4il3BXnNuD5upmx5RKQ3xlmY4rdGwNKbP/K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150123387"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150123387"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F7B112E238
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 917DCD996F
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 346DF2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D89B21A006A;
	Wed, 28 Feb 2024 15:33:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/48] libffi: upgrade 3.4.5 -> 3.4.6
Date: Wed, 28 Feb 2024 15:32:16 +0800
Message-Id: <1709105575-24259-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--7.623900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtgyKRnX9xPs4K4r
	mQIDoB6Sdkyho0WkAXjEJpexvZ46YeetKiFEROy9qoeab9Xgz88exBv9eEs5Zt9RlPzeVuQQ1vZ
	7s3YIVDKhOywUZIftbeaffHI8kAmibu8QqMQjwvKVUcz8XpiS9PG6GRFYrbYYKBz74e5r45ZrFm
	VfWDAwW+NZG+MqMCoy3Tu5wqq1RK+zXVR6bXx5elgowyUWHgGd9CFB7klVg4drNNfagiftYYZTF
	zOz6AI5WyXEB937q1d5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8H/sN8BcPD9M+aXm
	pwcRW69vRW4qm5X98rEZoVt7i9JjfO8OUxdmd8M=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196333

From: Wang Mingyu <wangmy@fujitsu.com>

meta/recipes-support/libffi/libffi/not-win32.patch
refreshed for 3.4.6

Changelog:
===========
-chore: update version to 3.4.6 and fix long double regression on mips64 and alpha
-Update sparc64 host
-Update cfarm hostnames
-Always define long double types
-update copyright year in libffi.texi
-Update version, copyright and testsuite info
-Fix test filename reference

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libffi/libffi/not-win32.patch         | 7 +++----
 .../libffi/{libffi_3.4.5.bb => libffi_3.4.6.bb}            | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.5.bb => libffi_3.4.6.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 38f9b0025c..f4ed839ed8 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 20bc4e03442e15965ae3907013e9a177878f0323 Mon Sep 17 00:00:00 2001
+From be9d4cc110c159812699780348686da371296b94 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -15,16 +15,15 @@ As this block is generally pointless, disable it.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7e8cd98..cf37e88 100644
+index 816bfd6..e37c5a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -405,7 +405,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -401,7 +401,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.4.5.bb b/meta/recipes-support/libffi/libffi_3.4.6.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.4.5.bb
rename to meta/recipes-support/libffi/libffi_3.4.6.bb
index be96c894e2..a6857a3981 100644
--- a/meta/recipes-support/libffi/libffi_3.4.5.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1db54c9fd307a12218766c3c7f650ca7"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "96fff4e589e3b239d888d9aa44b3ff30693c2ba1617f953925a70ddebcc102b2"
+SRC_URI[sha256sum] = "b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.34.1


