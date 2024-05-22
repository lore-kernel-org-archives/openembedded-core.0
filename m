Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EAEC27C6D
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.5672.1716369341379213003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p+tVLsCf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369341; x=1747905341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=H7pU4eV3J+tRDJMMjq90HCJfFr+uG8yHKExSCqCZgH4=;
  b=p+tVLsCf55QmRc8nNUqgpiPD3HtulrLROdaftRKH3BIRb18Tfg94s92O
   E8lhpvmpH0u0QX2rDV/zYtfo490OXvOifdw+gIYknMn2rgxwI/1nDlDZP
   OjWREZLrLXLtbVYLdN0GdE4iCZzMHShQPfJVxGAIL0focj6HW8YMt8Iw/
   DawJ9Ld1IU9gW1N2niHZ+MZtpHFAx9DqQ9rO+cLs4Grru8r0CdHdFxC2X
   GFBazemr6z12kOxTIvwNS6wqHNxVeMkmwEXrBcrqW/23IeIF2uwrqR3pS
   Hy6u5ZmIUfOHbm9nm0Huo3e3Q88jAiQCCPvESUt0WtzZgPUc3q3y3FKnQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159082063"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159082063"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:39 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 149C9DBD91
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C3BAD5075
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9C8321D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 662CC1A000B;
	Wed, 22 May 2024 17:15:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/42] ofono: upgrade 2.4 -> 2.7
Date: Wed, 22 May 2024 17:14:36 +0800
Message-Id: <1716369289-22526-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--4.935600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL66B
	SqYTQnobLaQvmyfa9WlxDnNiQ6id6lqgUVEApa8mkCThXPqsqiuvMPxisLn2/EtYyuL5Cqax1tU
	XKMECNKNNWe0PkRg0mzYKQ1gIrt3HWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXq8KsbROd9VSD3F
	7iC1Qm2qOya0JEN5CqJKAmgnmhVrvymVDB8yZElJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOEv2167RGnWKISDnDVFeoLz7ek6DTdhykqXL8GzpV++qXc/fIy4yE7UvXh49k5z2lcx+9
	Mf0koiGshyAaZrVMHObhdl/tOMcJgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199724

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix issue with handling SIM7100 modem enable operation.
- Fix issue with handling QMI NAS indications earlier.
- Add support for handling QMI default bearer.
- Add support for handling QMI DTMF tones.
- Fix issue with handling ATD*99 for non-muxed ports.
- Fix issue with handling QRTR discover timeout.
- Add support for QMI voice call feature.
- Add support for exposing modem capabilities.
- Remove support for BlueZ 4.x services.
- Fix issue with LTE provisioning support.
- Fix issue with SMS and address length checks.
- Add support for QRTR services.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.7.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.7.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
rename to meta/recipes-connectivity/ofono/ofono_2.7.bb
index 5e1e5f3b6a..87f1958525 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.7.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
+SRC_URI[sha256sum] = "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


