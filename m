Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B5EC83F20
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:43:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8606.1693449791131134999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="130116189"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="130116189"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:43:08 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE2CDF0760
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:43:04 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 08F20D9496
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:43:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 23EC52FC81A4;
	Thu, 31 Aug 2023 11:43:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pkgconf: upgrade 1.9.5 -> 2.0.2
Date: Thu, 31 Aug 2023 10:42:00 +0800
Message-Id: <1693449720-28247-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--3.398500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyump+gE0amb483H
	59qbsAZIwvXsHgPTL3e/gMWjoJFpFgx38j2cF8Y5s/Hes76OTZDYUDvAr2Y/1w6QlBHhBZuwD8Y
	UXyN5G7LgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJZjm/42WWfFCgW6bY8SOq3WjxY
	yRBa/qJShNCXvA0fw+jaPj0W1qn0TGVuWouVipcs4MO659w/R3hRnrBFVZlDS20OdD88byQkCir
	9gWLP7M/LsiycglHf/sQjd22ZFkgU65VN9jBjGUUzT1fPnLG1KnMV3OtAyg0v6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186949

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix long-standing bug where package identifiers for "uninstalled"
  packages incorrectly included the "-uninstalled" suffix.
* The behavior of --modversion was largely reverted back to the traditional
  pkg-config behavior, but still operates on a solved dependency graph.
* A new flag, --verbose, has been added.
* When flattening the dependency graph, retain the latest seen edges
  rather than the earliest.
* Fix a long-standing bug where the dependency resolution queue was
  evaluated in reverse.  This bug masked the aforementioned dependency
  flattening bug in many cases.
* Fix handling of --with-path, which was appending paths to the search
  list rather than prepending them as intended.
* Error when --modversion is requested with more than one package, as
  the output is ambiguous.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pkgconf/{pkgconf_1.9.5.bb => pkgconf_2.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.5.bb => pkgconf_2.0.2.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
index ab1d1c84e8..c6badb123e 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.0.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "1ac1656debb27497563036f7bffc281490f83f9b8457c0d60bcfb638fb6b6171"
+SRC_URI[sha256sum] = "ea5a25ef8f251eb5377ec0e21c75fb61894433cfbdbf0b2559ba33e4c2664401"
 
 inherit autotools
 
-- 
2.34.1


