Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8873C54733
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.12716.1724136738033251363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RFoWN269;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136738; x=1755672738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iSBq7Q+at/j+D8/O42B+KrFBajjM/hbaWHUe8Pi7t28=;
  b=RFoWN269CK26hE2iMc0nL9QK+2w2dtd9wk+6LTXuvJXlkP9plWl7NK+z
   6MGBCIdK362MjIiZ/mdQP2xZYXzNsKFJCz0Ien5NHZeUmx3le/+Skcdzp
   FJSV90M7j8UOqoIMMA5A5kHM97AAhNr+P4X12mOnKz6eI4RanA83/B10Q
   LMh+840gIVhj1fM4Z320teQL6Db6A0NSBlF76s36ngSekmKdt3LgNA2T0
   94F7NNbCVT7mVcOni/uNGMnC9EX4m3ydVJuhZBhNfpzt0NCBgeYG399nx
   mcHE1BM5Lp2vVyqVTZFaIO/yBFsKWR0RwsXwnw+bhDNgpSltHAlArCtzF
   w==;
X-CSE-ConnectionGUID: mOf669n7RQqCjJuPwWZ0pQ==
X-CSE-MsgGUID: +nLcojhWQne6DzBBEUbR5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="150507967"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="150507967"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BA29C68EB
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53F25CFA5C
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C445120086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F0B91A0002;
	Tue, 20 Aug 2024 14:52:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/24] libedit: upgrade 20240517-3.1 -> 20240808-3.1
Date: Tue, 20 Aug 2024 14:51:30 +0800
Message-Id: <1724136703-20023-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10-1.097100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29XMKPrF7dK57OR1LeQ+VpnJZsoi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBQ8QW4FIn2xzmezE+NDJxrUeiT+0zdIowhjgk
	ciaqfMqGqaqUeATTs1nFChUCbWSGY8Ysmg2K4yOQ/5ujaX+sM3QKpsL8RbnoTsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203533

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20240517-3.1.bb => libedit_20240808-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20240517-3.1.bb => libedit_20240808-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
index f8fa871ec9..56fee04ebb 100644
--- a/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "3a489097bb4115495f3bd85ae782852b7097c556d9500088d74b6fa38dbd12ff"
+SRC_URI[sha256sum] = "5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


