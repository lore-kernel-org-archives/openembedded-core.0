Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF28C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10249.1720604663550000881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JOlyQ0ex;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604664; x=1752140664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LBPwMMlDMvAXeuvhc9uhSmO+1GJZOspCoyDHBNLOdlo=;
  b=JOlyQ0exNtvX94nCF/CdEXpjMumuA9LpovtK+UdtInZmZ1LGW8WtLEq0
   dM9wiG4/HAum8cPkSVZhV1tBYrf7AjpKXZw/Ugq0rAhcBCGjt1fr+Ry1g
   iQVCB/370Kt/RZRtq/pb8Wy7rnv6KD1h5+P3t4PianrNb27sd4646uWLb
   hS9vOhaN4MnhjJOoHypEVkiOPoIZuFzWvklY0snAbt6SbLHp1gIWuJpgX
   ZGG9Ske3fjaqpGJKzfnJMVE6VsSHKuQJ76JiH47B562ESiTd22Bgt1kJE
   qMJtopgmu8+woUGDO7rgxYiNSUXRA4jOGFQB4/yIWKMtZWOW6VoKuQCn2
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145576222"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145576222"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 106DDC9168
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 650D1D510E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0904C2005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF1951A0002;
	Wed, 10 Jul 2024 17:44:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/30] python3-importlib-metadata: upgrade 7.1.0 -> 8.0.0
Date: Wed, 10 Jul 2024 17:43:48 +0800
Message-Id: <1720604634-23406-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--6.174700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrtOtXYgbXjdfJCKRwXsPbodAY
	WUo4HSIkyRdBbmqm4sBqMKtt8pxBXNmwYg12mTn0J5oIExjxwScJlr1xKkE5ubrfxlRjqBJ3C9t
	rwukWP0UzNOjao1wjlnnbv4FbkMngokSrpvzPhqn8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5D2/8
	RIpOO90IRJUvTp/Ng73BTxUdcaKkIfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPBsoVtHu/LTBhL+m
	ab2rM3do/kA6VEPrh6IxVbHb/rm+63nPI5YhxJf
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201724

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Message.__getitem__ now raises a KeyError on missing keys.
- Removed deprecated support for Distribution subclasses not implementing
  abstract methods.
- When reading installed files from an egg, use relative_to(walk_up=True) to
  honor files installed outside of the installation root.
- Deferred select imports in for speedup (python/cpython#109829).
- Updated fixtures for python/cpython#120801.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_7.1.0.bb => python3-importlib-metadata_8.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_7.1.0.bb => python3-importlib-metadata_8.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
index fdb37cecef..7c920cffa2 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "b78938b926ee8d5f020fc4772d487045805a55ddbad2ecf21c6d60938dc7fcd2"
+SRC_URI[sha256sum] = "188bd24e4c346d3f0a933f275c2fec67050326a856b9a359881d7c2a697e8812"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


