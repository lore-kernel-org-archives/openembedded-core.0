Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D118E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:14:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.126046.1734599632612721879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 01:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YjrXRenA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734599632; x=1766135632;
  h=from:to:cc:subject:date:message-id;
  bh=vBh+CDQjNl1EvXOXVKXrU/Qq77qQ5CW4HtTdIYJcy/A=;
  b=YjrXRenAJHNZI9flPsGE/x+oVOC6uIfSWmX1lsPFwMqamzzJfYpvpx5H
   q6u/MPmh6GvGAF6W60Srn8JYyr0EQW15HRaJ5KySGzbgOFBvGHrF9pWmo
   +Ch6OAifCCg+x/P1kLM3cndhklhZ7aPznrjK0F7YqIJZIbBhPCBuOqQs+
   Z9vf/UNFkEa3rr8xL547Kp5xp1L/t/wLoTlKf6g65FGORyvJjXM6lXOVC
   nTfPQ1jCJ8XxNBTiBDy1kG444CqWRBehuQaTs9opQ7oXWGf3/rGArrIWk
   mrpKRUj4TObDHzKee8a6h12ClMVMg2Boeos0l4RqqdAE22GE8Zw9WMVvK
   g==;
X-CSE-ConnectionGUID: 4Hj06/wmReq/YvdrlyzEXw==
X-CSE-MsgGUID: hM26Ifp1TSuLDIVilHuGcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="184509485"
X-IronPort-AV: E=Sophos;i="6.12,247,1728918000"; 
   d="scan'208";a="184509485"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 18:13:50 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C253B20C92
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 18:13:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93FD2D5044
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 18:13:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2134010206
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 18:13:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9CF0E1A006C;
	Thu, 19 Dec 2024 17:13:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] bind: upgrade 9.20.3 -> 9.20.4
Date: Thu, 19 Dec 2024 17:13:37 +0800
Message-Id: <1734599617-3126-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28868.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28868.006
X-TMASE-Result: 10-1.158800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yTo39wOA02LhTJDl9FKHbrlgDeovr2tertMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNlVHM/F6YkvRNLPQl0QAltGh76/bDpGErCKS
	ilWnI9vpuf5ur5byPpZbNfgtQUD+knH1+lINchTD9x2Go7sqY31ym+pP6FijCmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1EXTPZ5hMaJOOQ4MLuL4r5hLaklXqW2Tzs3B9FsFY+Sa1+ch2pNUAcL6ug
	HvXdPakVzYAFgA3UtqF1mWd2aTqvu5PRul7Sbg6Uu8eo+LTjoVTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208900

From: Wang Mingyu <wangmy@fujitsu.com>

bind-ensure-searching-for-json-headers-searches-sysr.patch
refreshed for 9.20.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d-ensure-searching-for-json-headers-searches-sysr.patch | 7 +++----
 .../bind/{bind_9.20.3.bb => bind_9.20.4.bb}                | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.3.bb => bind_9.20.4.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 38d07cae39..2fa4ba1952 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 5ae30329f168c1e8d2e0c3831988a4f3e9096e39 Mon Sep 17 00:00:00 2001
+From 0b3f9331639695300a1ec89e3020765ab1ef5e31 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -27,16 +27,15 @@ to make use of the combination some day.
 
 Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2ab8ddd..92fe983 100644
+index 865b4d0..a80b6ce 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -761,7 +761,7 @@ AS_CASE([$with_lmdb],
+@@ -863,7 +863,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind_9.20.3.bb b/meta/recipes-connectivity/bind/bind_9.20.4.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.3.bb
rename to meta/recipes-connectivity/bind/bind_9.20.4.bb
index a77b030427..d9ea440fbd 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "f90c2da1621299f56a2e6585a6fe459ec3efd6f2fdf84a8fbf31b40be7698a73"
+SRC_URI[sha256sum] = "3a8e1a05e00e3e9bc02bdffded7862faf7726ba76ba997f42ab487777bd8210b"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


