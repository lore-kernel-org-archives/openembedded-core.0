Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5649D11701
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5578.1729834800186431819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BMuSDEkg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834800; x=1761370800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Yny3owZsBIQJTiEl3IHGPn3e1wTBj1wXqRi4Oog4S/I=;
  b=BMuSDEkg8M7zPHz/ZxIlFaBhVuvuCPiVSr0G9MwEAn5zGMEqR/BLD8N5
   G03VSm8RLJ74LAJ6Dotoy2HpCgSu9+b7B82En5DHW3TwUkn6+SzdSS/4g
   IIg+hAanWYKINbxQlpfrtxU2mOCPwPtVKDkv+FxMnbuLSNI0eoiKCFYof
   xE6RHi+jFk3DswsEw03rwOSIONVqyAaLP1SZT93ScX6n3s4iaSIsr3FOn
   utK4ixapxBuQ8RJWDyzqOq6K5i4EMc4sc7F+aQTlh9RZh/uVmEVQcB792
   WB3XiOGeCsUWFI7vCYpki00EWYF52aDY4uVbn4BF9gbJMvJ/mOY38WXhX
   Q==;
X-CSE-ConnectionGUID: 2ez3nexKR5uAoiroKoDY1A==
X-CSE-MsgGUID: tK5ipkRESMmA76nWA80DYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="178163936"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="178163936"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B1871DB3CD
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9CD8103E2
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78CC3E5A29
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2809C1A000B;
	Fri, 25 Oct 2024 13:39:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
Date: Fri, 25 Oct 2024 13:39:21 +0800
Message-Id: <1729834769-4717-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-2.531700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGIqHTZr8DAG4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOc5jkZYsSJrieXd
	H/uj4NQehhTNQ5kQfE0yzLwMbG+SkCs4kz/SjfWMbHhnyRa04Yu82FDInT6rXhqFYRuIqK5hYaM
	pFvOKalgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206325

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ptest-runner_2.4.5.bb => ptest-runner_2.5.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.bb => ptest-runner_2.5.1.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
index d28ae7ca91..e07f5d444b 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "aea9f42f87f2a78a973ae22cade8e45259f754e1"
+SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


