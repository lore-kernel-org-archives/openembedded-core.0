Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3C8CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13153.1757495825492798350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fy+i3L0M;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495825; x=1789031825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gblHD3CoziE2zgvDTO7Eunp60OHIJ9yI/i5h82HQttE=;
  b=fy+i3L0MrrsZrhXjWuBPfXSfFpFkpKbmUfhZsVih+mZI0zuIYOuTSIZs
   89HbYwrGBvbjNQ5BfBOlq9N0ZBizJPNzt1GQnRzdy5GjQVVkDdtpcZ6Ib
   ju9NK/VJGOcshfP/jxfAbCjyokpStDfmlYTFjtAfMkPm3DKpwezbywx/6
   U+X65IUCQSozLUh4BNSGjc7iDeFkTrh1PL1kYUM5w/1VNKnm8hXDE7QO0
   plFa4CRiqW67yQJjbHEr0FIHaWAdg50lsRaTeKX3I7InRr1OXoysa/nzp
   iRxYrd/I0D02GDMhR2aQ4IZ6AKC5mkp4qAStsETV13+IBN+rM1Cf2euNg
   A==;
X-CSE-ConnectionGUID: JxhC1aNQRAmH8/ZmVBBnMg==
X-CSE-MsgGUID: Ebyi+50qSYqc0lS9aA93pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="200394339"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="200394339"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:03 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E72111C1C718
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9FC071800243
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 2379B1005126
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 318951A0090;
	Wed, 10 Sep 2025 17:16:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/40] iw: upgrade 6.9 -> 6.17
Date: Wed, 10 Sep 2025 17:16:16 +0800
Message-ID: <20250910091646.998-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223162

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/iw/{iw_6.9.bb => iw_6.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iw/{iw_6.9.bb => iw_6.17.bb} (90%)

diff --git a/meta/recipes-connectivity/iw/iw_6.9.bb b/meta/recipes-connectivity/iw/iw_6.17.bb
similarity index 90%
rename from meta/recipes-connectivity/iw/iw_6.9.bb
rename to meta/recipes-connectivity/iw/iw_6.17.bb
index e34400e18b..a9a4695d39 100644
--- a/meta/recipes-connectivity/iw/iw_6.9.bb
+++ b/meta/recipes-connectivity/iw/iw_6.17.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[sha256sum] = "4c3194778b175d58442907d51d1977e7270fce5cbebff0eab11c45c1da287a4b"
+SRC_URI[sha256sum] = "aebdcfa3691aa5065a9b0d7def66c761c8b01a59dd81bc315d0305e05c3b04de"
 
 inherit pkgconfig
 
-- 
2.43.0


