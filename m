Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5892C83033
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.35172.1751274805760933524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=So9+X85o;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274805; x=1782810805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hXcFw5Ue9f4s0mmNGrASSyf1gpUfp+iJ887P323nbRU=;
  b=So9+X85ogDpJbpbhh/6TiGR/mYFY/TNtiwG2TW3sQQvWcZwOhnw8ILjU
   TBKa3BteCYZH0FvO/g5OOKIXzVAWrLqpDlzdUqiz24YP3qr/oQVYpvwsk
   z0+klPQzPLGoTIUYd889UovVmpSNzF1Bv9DQ08VqOTCRUvmnJN1dyyWEm
   vvtg33HaZq9el2skpFN5zMvLyqg6Ywc5zhJFZWUcfD89CzC6W7V7AHXer
   92yc0dvLj7tLqWHTeRTzaQ4hE6M3bUMXagQRxxd7SvN2B0dB3djJknfuj
   zq1QC1uiql52EpGbN+MGSCpIVJPowIrrYrNoALrxvgNt83R+LRWYGAe3v
   Q==;
X-CSE-ConnectionGUID: +lG1IutDQD+bPDhQhGEMXg==
X-CSE-MsgGUID: MMbLSGn9Tp2lxR+6qifGuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="192514691"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="192514691"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:23 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E4F3A188F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 62F35C006D4
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B96A7BF3CB
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:22 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 48DA01A000B;
	Mon, 30 Jun 2025 17:13:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/37] ethtool: upgrade 6.14 -> 6.15
Date: Mon, 30 Jun 2025 17:12:42 +0800
Message-ID: <20250630091315.1897-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219463

From: Wang Mingyu <wangmy@fujitsu.com>

avoid_parallel_tests.patch
refreshed for 6.15

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.14.bb => ethtool_6.15.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.14.bb => ethtool_6.15.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 4affc332a9..79232a6b00 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 755cf01b02e6ec8c8acb79558cbad28e301519b3 Mon Sep 17 00:00:00 2001
+From 27757ce1a8956591d22e7f9dc8cef37e37be8e9f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index db71394..5e93135 100644
+index f5fdc8b..3eab387 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.14, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.15, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.14.bb b/meta/recipes-extended/ethtool/ethtool_6.15.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_6.14.bb
rename to meta/recipes-extended/ethtool/ethtool_6.15.bb
index 41164ac6ca..eb6b272d4a 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.15.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "3dbfc910513d1fef683f27ab12325cc88551abffae66d0ad3afe2a13317d2339"
+SRC_URI[sha256sum] = "5d21a75b54c5e617b8ac0fe161e2ef3a75ecdf569ab64831474882dd3ece6077"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.43.0


