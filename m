Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF51C5321D
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:28 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.12718.1724136739084843790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jVs1yVql;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136739; x=1755672739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YQ2UJKJ8CT42bAf298hRTSVP41yuzW27yTLUF0IcMFY=;
  b=jVs1yVqlAqG+t08bnLmub+YVsQKzeXLe+d1WfgLAIc5ace0YAk4bBpYB
   EDUYbDskByG61vAppMuJFy2BMmf4f9k5PAiUw59t/n6e7s+J7bJ82Wi4l
   am1OV/ZPj/yQ8b7TAG3kZlgEwttseBgXwRYJYtY2UsnKLrEqkNuR09/TI
   qN3kkheNW/ma3vXoypWjUX8p+vTrh5aeHxtvmgtolQbbEpw9Y/nNdIVHq
   tWQolZWDia1gU3lsaYfHhxeRa0D38+L2wA+ex9b0KZ8pwwDxG2UayULja
   Q1P0UCLyByhyOdE8qkon4BSTPaISdak1ycyVyQjY2C8OakbOdSi/tVJ58
   A==;
X-CSE-ConnectionGUID: EJK8EDJJR8O4hMKPW1BIwg==
X-CSE-MsgGUID: fsYiaIH7R0O75ep8h6/w8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171033297"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171033297"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 20B71DB3C2
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 567D9CFA5E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CBE32E206E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 739211A0002;
	Tue, 20 Aug 2024 14:52:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/24] enchant2: upgrade 2.8.1 -> 2.8.2
Date: Tue, 20 Aug 2024 14:51:25 +0800
Message-Id: <1724136703-20023-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10-0.063400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrG24YVeuZGmNOed0Eey3YObOE
	dy34ZwwECeertVoXp2gNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2f8F
	SbzLvvf4/jpOn/YFJRcr5AVdin4a1Nyl1nd9CIt0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrAqL0YifJhWrcfq5KESGD3ZU5yuQRXDqvxI5XGu9BqPc8C1Q2x8BFb6CSbeWL/YQq7yOb
	F83/SxSqy8RzejXyiqzJWrJBy0t3fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203536

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- fixes a crash when using Hspell to check Hebrew, when the
  application passes characters that cannot be mapped to ISO-8859-8.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.8.1.bb => enchant2_2.8.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.1.bb => enchant2_2.8.2.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.1.bb b/meta/recipes-support/enchant/enchant2_2.8.2.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.1.bb
rename to meta/recipes-support/enchant/enchant2_2.8.2.bb
index 825cf2e388..f0da896e59 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.1.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ff79de470b8eb16f53849dc49f2bce8ca4eb7decabfc1349716fe12616e52f4e"
+SRC_URI[sha256sum] = "8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


