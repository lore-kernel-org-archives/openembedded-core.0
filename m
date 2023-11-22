Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7673C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:54:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15177.1700643273056282036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140728495"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140728495"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:54:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BA56DCFC0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:54:28 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33A6ED60E4
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:54:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE75688489;
	Wed, 22 Nov 2023 17:54:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.19 -> 9.18.20
Date: Wed, 22 Nov 2023 16:53:52 +0800
Message-Id: <1700643232-9210-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--1.483900-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpOxuN
	dBIs94gPT3l0AnIWQ5w0DMT4wergx80cprb2nwQoK0+leiJxLlfiUNNpI6ZR4DnZfxjBVQRbz2e
	I6ULlZYSryzKorzz46Iad3d4g0e7Ytg2N/YTrDSg6N/cDgNNi4SUnLzk1+IxzE+Ig87Z3yDm4kR
	SZ1g8ZJYtUMxfMQaZFvg4vJu27FN80pYSqU19m1QPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmIAf/HImzvCGJx9fpSDXIUwSHCU59h5KrEbVzFi+tzvL7wA/wTt0MUKnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZKLkBoTxaHbEuPWR02f8ZllTLKZf6PbdFgwE8q
	63RRcVaX8t+EQhUTCsoWQCEQ5cxNMifmIw4PNN6dzXfFlVp0ip9zxtNGQH6RLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix missing newlines in the output of "rndc nta -dump".
-Take into account local authoritative zones when falling back to serve-stale.
-Fix assertion failure when using lock-file configuration option together -X
 argument to named.
-The 'lock-file' file was being removed when it shouldn't have been making it
 ineffective if named was started 3 or more times.
-Fix a shutdown race in dns__catz_update_cb().
-B.ROOT-SERVERS.NET addresses are now 170.247.170.2 and 2801:1b8:10::b.
-The timeouts for resending zone refresh queries over UDP were lowered to enable
 named to more quickly determine that a primary is down.
-Don't schedule resign operations on the raw version of an inline-signing zone.
-Fix a possible assertion failure on an error path in resolver.c:fctx_query(),
 when using an uninitialized link.
-Add semantic patch to do an explicit cast from char to unsigned char in ctype.h
 class of functions.
-Python system tests have to be executed by invoking pytest directly. Executing
 them with the legacy test runner is no longer supported.
-The wrong covered value was being set by dns_ncache_current for RRSIG records
 in the returned rdataset structure. This resulted in TYPE0 being reported as
 the covered value of the RRSIG when dumping the cache contents.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.18.19.bb => bind_9.18.20.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.19.bb => bind_9.18.20.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.19.bb b/meta/recipes-connectivity/bind/bind_9.18.20.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.19.bb
rename to meta/recipes-connectivity/bind/bind_9.18.20.bb
index 8124c5c591..187685eef5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.20.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "115e09c05439bebade1d272eda08fa88eb3b60129edef690588c87a4d27612cc"
+SRC_URI[sha256sum] = "4b891ebf58d3f2a7ac3dd2682990f528a3448eaa1c992ddc5c141b8587a98ec5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


