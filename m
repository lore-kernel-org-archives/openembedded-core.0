Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BD8C54E69
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KlY9sQot;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146413; x=1741682413;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/5UFJ3shlcRYgs5rCwXkp8y8VRHiwH9TV5+c+CL/7mQ=;
  b=KlY9sQotLYavDy+I2Km9lmKw1YA3UopK1QRAbVByYu9bera48M9Li8Td
   YO+azeLmiYLDJTTj/GV7ge6o13Enz4HbbCk7MkmaO0+I8XhFWZbdFGKF5
   T4yDjIQ4xY/891Xy0jBPDRplrsJhDM+hWs5oKBEhfgjutYTRv1pPBYcwS
   fTExefRo7bqk1UFntybP1o1Qu/xzxJC5Ou49PTVp/A8NpnCBQCzxuc3as
   smTNn+awf26qDvNxR1BJzxJ47nBwasyD3e+4WRKNRVwcj8PGLTS6uPYqw
   kIVeOLDI+KGPd3FNPXPM+k8Txr+AmPgjsWam8u8fg3Ii/F/auGOVQn3sS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656129"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15593995"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:12 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 4/7] bind: upgrade 9.18.20 -> 9.18.21
Date: Mon, 11 Mar 2024 16:39:51 +0800
Message-Id: <20240311083954.418271-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240311083954.418271-1-chee.yang.lee@intel.com>
References: <20240311083954.418271-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196923

From: Wang Mingyu <wangmy@fujitsu.com>

bind-ensure-searching-for-json-headers-searches-sysr.patch
refreshed for 9.18.21

Changelog:
==========
-Improve LRU cleaning behaviour.
-The "resolver-nonbackoff-tries" and "resolver-retry-interval" options are
 deprecated; a warning will be logged if they are used.
-BIND might sometimes crash after startup or re-configuration when one 'tls'
 entry is used multiple times to connect to remote servers due to initialisation
 attempts from contexts of multiple threads. That has been fixed.
-Dig +yaml will now report "no servers could be reached" also for UDP setup
 failure when no other servers or tries are left.
-Recognize escapes when reading the public key from file.
-Dig +yaml will now report "no servers could be reached" on TCP connection
 failure as well as for UDP timeouts.
-Deprecate AES-based DNS cookies.

(cherry-pick from Oe-core rev b750d54622a0fa0a35d83ddc59f07661e903360b)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 .../bind/{bind_9.18.20.bb => bind_9.18.21.bb}               | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.20.bb => bind_9.18.21.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index f1abd179e8..38d07cae39 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 246087f89e9434b726c7884e4c0964f71084f091 Mon Sep 17 00:00:00 2001
+From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -33,10 +33,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 10e8bf6..bf20690 100644
+index 2ab8ddd..92fe983 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -814,7 +814,7 @@ AS_CASE([$with_lmdb],
+@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind_9.18.20.bb b/meta/recipes-connectivity/bind/bind_9.18.21.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.20.bb
rename to meta/recipes-connectivity/bind/bind_9.18.21.bb
index 187685eef5..f5fb4bd1e5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.21.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "4b891ebf58d3f2a7ac3dd2682990f528a3448eaa1c992ddc5c141b8587a98ec5"
+SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.37.3


