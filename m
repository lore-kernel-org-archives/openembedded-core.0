Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4F0CAC593
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13221.1757495823526350494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ATPIxvm4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495824; x=1789031824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=khvGCyij2isQZJElsOEDcNFv3irtMLLQmDK6TirKSYk=;
  b=ATPIxvm4gPtYO4Uqy0qPu+fZChVC3/CNw24jsubX0LEzvjjf40e9tjcM
   UntcBXPEgNMXDSCtrfWZlo0X1R2LHy5sUWofp8YgwkNhXf4ZTtSHp0bTb
   TDUV2b6z44kvdL7nhCVxACSlhMbFkOcLAOH0AXp2jybgd83VLiC+vogZd
   o+sveKlGGFfpWTYoq+QO0Pss2UGM7O9JCA81CSiB80mL7WZE6AA0c01ji
   HWf2LoCxxVmU379XLRWJ3ezM1hNCjVebMWtfQVVEnoL/zD+3HODZqie0n
   g6uWM1GQREKgzq6A8+c7r47ICdHRP9syfYO1SMp2q4nFXHbKsGFcJwCZL
   A==;
X-CSE-ConnectionGUID: C+MTFEKZRuKNH+QPmrvp9Q==
X-CSE-MsgGUID: 0xkAqOLgTk+qoG+lLtr8IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384172"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384172"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:04 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C6AE61000354
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 81763C00344
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id F3AA3200A60D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 817AC1A008F;
	Wed, 10 Sep 2025 17:16:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/40] iproute2: upgrade 6.15.0 -> 6.16.0
Date: Wed, 10 Sep 2025 17:16:15 +0800
Message-ID: <20250910091646.998-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223160

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.15.0.bb => iproute2_6.16.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.15.0.bb => iproute2_6.16.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
index 592e3e15af..dc7106902c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb"
+SRC_URI[sha256sum] = "5900ccc15f9ac3bf7b7eae81deb5937123df35e99347a7f11a22818482f0a8d0"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.43.0


