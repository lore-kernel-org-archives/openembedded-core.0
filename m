Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0D5C54E51
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8409.1709105595601028936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MmSF2yMN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105596; x=1740641596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DKZRSgJJfUxTmzQXEqym56Hs9NKiE0n1qJ6X5tdOuIc=;
  b=MmSF2yMNemwp4GrOjHKADo+afx23jU/Ev/gF/EgWndkbKG/uRAOSxbvW
   jIbWRWZQo/QnxF3U+qnzFtnQzATZP/7Qzt8be7mNnKPmABqhY16GbNOgO
   3niRvPL/Jolu8UdXq6+H6gwtjlUxjs5p18+ZoTXF6mUZHUX64PH1smDzC
   L9D7vcqYS40vDpvotcyLWMw+j+mZRUrgzEGw2J+QTC+AHFhIU6SPP/a7M
   zQmo6EojYGGosSibAtNoT5BXOGYPNuLpGuwhcy7jXRLGpQGBvzVVks0ak
   +J11lYgth4DRavV2/t69jOeidl8FsemNsxwb9NFFg94wA8yWAj1hqj5e3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129444121"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129444121"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 20B6CD4801
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 40066D996F
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D220541180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F1361A006A;
	Wed, 28 Feb 2024 15:33:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/48] createrepo-c: upgrade 1.0.3 -> 1.0.4
Date: Wed, 28 Feb 2024 15:32:10 +0800
Message-Id: <1709105575-24259-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--0.267000-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ0nRdgVDNL3Q8rYO92b9Nmb056mCmF00Z9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrasDf2XVKpYJmEjs+sCs0Aa7ENUCElOciGZS5qZ2LsFyW9i1309plpvL5c
	5ExH1vhIYBb5OirtgFxyVbw+etI1w5KXetmg8q2h0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196331

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.0.3.bb => createrepo-c_1.0.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.3.bb => createrepo-c_1.0.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
index cfd406650c..f498bcb655 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "f5b5cb3d7389da979b9f05d72ab13979a8c2dccf"
+SRCREV = "4ade5ea5c4c636f045f29a2d8d8a57241fc5d24e"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


