Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2313DC27C4E
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5677.1716369346967507716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=scad2KyK;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369348; x=1747905348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RjDqT57wL4k0Gd8uePhc4e7ukyD+URsCfDgCT/TZ6r4=;
  b=scad2KyKt574qLwvK2LYDUFtj1zHmUM7ZfdXKB3kD2epTbZE2KzPny3W
   EuqA//5TGYZg1R4BIC7DnYi4oi9p5iMmQ379KFAEAxuGmaZ3fLVitJKTq
   zBv4+qAzWxp+4fRhG7V88XkTrRqKD/xKUED7yWYAFKJA4vKOPKGwxppZ3
   Lxz6B1IcFyyeufjW8FD/djkUEyC28Hel2aOYNAx7ihFZGyd+Z8RSjD7Ar
   fidzxGik17xzlEUf5TLuuFWBdRrQtRsWytEQjW48nHBhVQ8PzrEN11HlC
   Pft/nbiSJCz8WFHheZbfwsT+ryuovdoE0ZCbcESwOqexf5qZrOncN3iaY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="137912360"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="137912360"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E950CD7E3
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3668D7008
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 540DC21CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00D721A000B;
	Wed, 22 May 2024 17:15:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/42] shaderc: upgrade 2024.0 -> 2024.1
Date: Wed, 22 May 2024 17:14:47 +0800
Message-Id: <1716369289-22526-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.060700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrUuVVTCQr62oC10TsipyQq76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGSYicW3M8OflNc
	WZ7137CiBkESMI05d4qHvyg1ZsxTfNrsgG44+2ER/OBWacv+iVdUEOicf335WeGHkpR2WBaLsOq
	RjknWIvFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDirzi
	yGc0UelkiPLF6X0d/Rofpf34Z89eyRr5XiyboV6AAK1g0MAJrtakJT729KXbvx7RZInv2C0KBVt
	qM8S1g1RieeBy2WNlIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199734

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update dependencies
- Propagate test/install options to Glslang

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2024.0.bb => shaderc_2024.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.0.bb => shaderc_2024.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.0.bb b/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.1.bb
index 9975c608ac..1f0b12ef57 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9f56ca620c07d6c4d119c65c1c1f3f1c584c9985"
+SRCREV = "5d7736da11e626b49c5463aadb2afb228ad20276"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


