Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86A7C25B7D
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.5663.1716369320104169658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K7G+NZT2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369324; x=1747905324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3JB71MBsmhRymrclPzj5uUJLAJ9KdyCXCZu0uuus71Q=;
  b=K7G+NZT2spp6x2EK8miz31HF1svYV4xlYVnU7aT/S0eVT+EIpsHotM8V
   AZeelu1lqWqHBLoQlB0ZFUdowS/VavWT5Kon/2ZbBE6YqEidGrLMy0MvB
   Ra292UVUMMx93fZNlUSA7/MhVfdcuk2k5HseGA3CIBTqN/ZnMzJUASpET
   krluzzUUvk6yiroIdF8SsLOB37ruTmSB6N2Tf6qv5uGBJrImrN9i37nXX
   2ajKS0FKMMSXWBp8DoyUioD0NoS9rGZLvq+pIrEn+cCZQb9vzSUOilkMw
   KUBB6AzV3pDOywVVgoVVcG5+9yav1vGZUOBMy1hqm+JnihS2apMzuYlxU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147548940"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147548940"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:23 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F1AFDBD91
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E55B11C59
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 28A3F20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C8DE01A000B;
	Wed, 22 May 2024 17:15:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/42] fribidi: upgrade 1.0.13 -> 1.0.14
Date: Wed, 22 May 2024 17:14:19 +0800
Message-Id: <1716369289-22526-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--6.414600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTmYOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrNBd
	ORIzcI4ZTOtUSYcMNUYDYPhAGqvQ5rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNdJWzExXSVF8lDdu/zh8wxCpvnmX5opiWk1znYqPP3yXiRY4CdR2a/E=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199707

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Updated Unicode tables to version 15.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fribidi/{fribidi_1.0.13.bb => fribidi_1.0.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.13.bb => fribidi_1.0.14.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.13.bb b/meta/recipes-support/fribidi/fribidi_1.0.14.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.13.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.14.bb
index 5d0476a375..51752096de 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.13.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2"
+SRC_URI[sha256sum] = "76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.34.1


