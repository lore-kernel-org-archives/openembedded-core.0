Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DCECF9C7C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.9252.1727246981845346969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MvvnEAVN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246982; x=1758782982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VQQBbTUR+ErD7XtpyOk2bkiKvFVUjfSXOMTOtsx5454=;
  b=MvvnEAVNgGWYUSg/uqDQwmKamnuG6U4M++PRUXwsMFo0zVslyPAsSvlj
   aXCa+gFxA4UIybENv5mdudkP4EHY5Pchkty64waKhFoFOA2RhXl5FArZf
   uPTd/ZMA4ZS0qsDBW8nlQAZB0JLJKEHaYAJkyo8++dm8SH3yNLmsuxyyq
   xyVj9Pl38Jb0EK3ugWvABdNB608R8dM2qSd1BBa+sCmlhv1o4+3tp7QmJ
   HmEKDdvWU6+6Rz+6MRUJX3LJQ8uLLBnqC2wyJ9OCxfi/UUQ9YvwmpDVjv
   YdXKsGo3q8rT4dSfY46HuSKZz7wJaSZ922wMlBuou8ZcLErdnN75pIes2
   w==;
X-CSE-ConnectionGUID: 9KbV6B5KQT+pIF8Fvez7yA==
X-CSE-MsgGUID: Il8xuJgMSpqXomVo+OS4LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="173949698"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="173949698"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9167CC68EB
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA604CFBC3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F54920086335
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10AF51A000A;
	Wed, 25 Sep 2024 14:49:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/47] init-system-helpers: upgrade 1.66 -> 1.67
Date: Wed, 25 Sep 2024 14:48:45 +0800
Message-Id: <1727246960-20665-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-1.273100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUF5J
	Ui8H1I3WESVL06fzYO9wU8VHXGipCHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4uiq
	AitGCqOAPlwE8Lrks6kBki9RpepFjOOpbbIK7t7lqH6VUH9lQuxwhLej+6Kpv4/c/fWD98DCYqT
	5n1J8VfU74izQyocmqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204902

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{init-system-helpers_1.66.bb => init-system-helpers_1.67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.66.bb => init-system-helpers_1.67.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.66.bb b/meta/recipes-core/initscripts/init-system-helpers_1.67.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.66.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.67.bb
index 64e08aae68..1576f89a8c 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.66.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.67.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "a5439f465dc1d1d4e12329208dc321fb806009f4"
+SRCREV = "7b1a5359d99c1667f7b81380c06686ddc57b8e71"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-- 
2.34.1


