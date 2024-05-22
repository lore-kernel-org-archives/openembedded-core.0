Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DF4C27C50
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.5639.1716369330126592789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pNl5uCfQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369332; x=1747905332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o2/cCW8CInFIVaxFsY8WG9ZpaSIHzxEa+EbI3oGfs3Q=;
  b=pNl5uCfQDRfwjOJaY2fqQdk8/OhDYXGAl2iOWEZnA2rBWsvUBuIONB2e
   lcemx+YjNBbfxeY2fYr4n1/IGmfx5kFLWoPsNTgbEqQ9xtVqA2c8Kn9tU
   f8CJShVsZMskP/r+1MXEC84Um1n/iZ1gYwajSEKr/e/3rlqEGkB+FtocI
   WDu9JtHaWUF/vggDtcoM9RzKE4qZRaZbfEQ4EW/jBBEpFbEoe+7mWI1gq
   3RC03CqdFNGceQNiTY+PiwhlMp6Zxe3w3d+nOhtC6mSl4Q/O66m7jTqV1
   w+Ahl6EQ6mX2Nkw8WqeOrW43Vxqht6Z242i4z9rU3gjYFvrAsNnnl6lRq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="158511103"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="158511103"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78D4FD29E1
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E6CCBDCA7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB3FC20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96E751A000B;
	Wed, 22 May 2024 17:15:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/42] libedit: upgrade 20230828-3.1 -> 20240517-3.1
Date: Wed, 22 May 2024 17:14:25 +0800
Message-Id: <1716369289-22526-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.097100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XMKPrF7dK57OUpb//ZJZA4oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUsy+iMr+PaxFgfckhUWpuzx3A+K
	JfZVGuhMxA3cgn18UAXVDK2xJ3FgMMmBkkuZMG6tZGzOFniCJChpGtMTY4WPSIrKBa2vEcXIgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199713

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20230828-3.1.bb => libedit_20240517-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20230828-3.1.bb => libedit_20240517-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb b/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
index 1684b57d31..f8fa871ec9 100644
--- a/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "4ee8182b6e569290e7d1f44f0f78dac8716b35f656b76528f699c69c98814dad"
+SRC_URI[sha256sum] = "3a489097bb4115495f3bd85ae782852b7097c556d9500088d74b6fa38dbd12ff"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


