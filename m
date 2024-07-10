Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B08BC3DA55
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.10233.1720604658371506824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XxAjzQBN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604658; x=1752140658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wCClmEg5xqdJP67iwwYkAewP3IfnjWICPGl8NX4I4cs=;
  b=XxAjzQBNGbvOnGh2+8jOaBZ0tRANPVzr9yd7nLLt0xMjGFS96uMnze37
   Rw3pM6VNFFZQKsyFdkRSDrXug0WbuScApim+7iIpkPYf2B7hjhT/tb/ZF
   S4PfDaSCB1sOYynCED1ExlKXTZBs9zBTKf6Fid9JzH9CqL7DzUuJacmIs
   JrMblILxghkYbI2olka8u1XaoqrxlbDsnGS8zL4OpPJiSA9TaXizMJgei
   Mf0FTh/69o1/3z6ny6LbSUkqdMhL7GIC8e3iDJRnRyaetz8Z32GJonKX1
   sKHByrK6nDqg7zrCPe7UpgauJEueDUgXk3Wm0FlWRRgACn9rFaB03JppR
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="154532341"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="154532341"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0207D8017
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DC37D73CE
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1D121EBE69
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 731331A000C;
	Wed, 10 Jul 2024 17:44:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/30] harfbuzz: upgrade 8.5.0 -> 9.0.0
Date: Wed, 10 Jul 2024 17:43:35 +0800
Message-Id: <1720604634-23406-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-1.075700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrDrS1eFDRG3hYC5LPd7BvbdUi
	XzdCtaqIqr3tFBdLgZmNbWLcD74x2U/FqahwPCCslXePXNM4FjOUO3k9AyCPTQ5psStEpJG9G9k
	6anidXWwOXFFDbN0nIyKkzMT7+4ooqTn7q1D6VKDuQhjG5o7plD4H4hoqLeJJPHMAbjuhwd8bYo
	QXjNdw/uArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtlgDeovr2tergaGk
	TMJ9Af3P46Tp/2BSUUyh2C7EeKtCx8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFNnJzMhZIhZUHTNl
	GddYNXDMHSX5w9X1QhllhsgGjbUZORs3+nnuJM8FGokchBReS8Q+3PbaMeIT/+18+TCfFlTkAw0
	Tt8V3Qux9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- HarfBuzz now the supports the proposed new OpenType "VARC" table. This
  replaces the previously supported "Variable Composites" experimental feature.
  "VARC" support is still experimental and it is not enabled unless HarfBuzz is
  built with experimental APIs enabled:
  https://github.com/harfbuzz/boring-expansion-spec/blob/main/VARC.md
- Autotools build system have been dropped. Meson is the only supported build
  system in HarfBuzz going forward.
- Speed up "AAT" shaping for short words by up to 4%.
- Ignore unknown "CFF" operators.
- "hb_subset_input_keep_everything()" now keeps also non-unicode "name" table
  records.
- Update the IANA and OpenType language tag registries.
- Support composite glyphs with very large number of points in hb-draw API.
- Various build fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_8.5.0.bb => harfbuzz_9.0.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.5.0.bb => harfbuzz_9.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
index 6b0eb12046..01ea6ca86d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "77e4f7f98f3d86bf8788b53e6832fb96279956e1c3961988ea3d4b7ca41ddc27"
+SRC_URI[sha256sum] = "a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


