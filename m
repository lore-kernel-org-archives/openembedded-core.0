Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394B1C54E66
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8417.1709105608599023021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MM47A1oa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105614; x=1740641614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TdFAeLYsh/aIj2ZIh+s6Es55hRjjeKdL8iSN6VA5Sqs=;
  b=MM47A1oaWMJvo+qc6sBL9EExmZBaTpbhyG0NZy8BkdrJQvPPoYgTpTAR
   FsMCH/uUa/17i79Vsjkh3Fnj+6OLMXgBEG8TUwHkx2AmVp/T7wimY9QU4
   Wrm86FCnJxt3EnYA6tFBCWmEWghduK0gGyur+QYBqudBqWeNkJvF1z3B1
   7MCqmCmPb7bwz3ZbqJc4GVHrHeO1JKj4q8Wx/WpnMgKphzBzSL7/B0YTb
   QT08AAKwZ1oxEiYAEaN1Bxg91XOFNZH2iN7jylgsmSfvyi8Ka7J0h9TjK
   JI0jqlV88lTaOneaXH23jERvtsX+t+hGpXC+kgrH+sUIbGtp36bk+CYUf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="139129165"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="139129165"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DE15FC9FF4
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DE3E39CEB
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADE4941180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 57AF91A006A;
	Wed, 28 Feb 2024 15:33:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/48] ofono: upgrade 2.3 -> 2.4
Date: Wed, 28 Feb 2024 15:32:33 +0800
Message-Id: <1709105575-24259-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--0.414800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxYC5LPd7BvbSX1
	lUx07ju7degDmlogT4nGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat0546MQi364g8849nx
	EMDRyp9AMI2dvwKu82nFa4FX0wVMb8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNahZAKJwKLUILmVgR5yRlR+xtq4Ts2hxuysh2ORkrfZ+E1QfdE+5CPKTyb+1vIMKLEQNQ
	2viZ2+Yku/1b2W5P+Fc93YVy4C/SmJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196351

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add support for new provision database format.
-Add support for Quectel EG96 modem.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.3.bb => ofono_2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.3.bb => ofono_2.4.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.3.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.3.bb
rename to meta/recipes-connectivity/ofono/ofono_2.4.bb
index db5c8173de..dae5cc3c25 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.3.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "658f9c16aec09c56bd36424982afc6ef292c0942b3a9e8ffefdda5974f01dac3"
+SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


