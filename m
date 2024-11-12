Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85707D32D78
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.82750.1731403560752656101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pKWw76a6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403560; x=1762939560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6XSq2az5h0OJ9aOqjj241oE8Iec41Wta3Wqdlmfjuvk=;
  b=pKWw76a67ajwTV334pAqfpwBWSoBYBgo4ESHFkO8zIk0J9I4saahiosc
   ZxG4Cw2xKM1Sy3jFKO6QmkTx0lYfWjv9Qpwa50FrY5X65XNQbDIl/zIxx
   13pvIJZSlpHYzMZpklOvu5Yvn6i2WOt9zKvxBZcL88h5L4kFaXtuKdRS7
   5rfvLsZ+9gSFnWDSpVmviQ5kwBhBkfUBhyjm6Zs8aJPfBINpFKFNMIUX/
   TeFHbDaEwUb1dfcVDGHYF4I/UImjjhZz+P6yFfWatHLVmJNs/+SgsVieG
   glUmBn1e4pj7McKvAYQjX4pcxswE82yhwNxiOAhBhH3TUhu+o8tTe2iDB
   w==;
X-CSE-ConnectionGUID: MiMt+HRSSiSPOtXfpi+ZHQ==
X-CSE-MsgGUID: aJb8XMFWRnOtAmN8pw3JtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168063969"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168063969"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AC28DBBC6
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 304A4E6B7D
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C606120071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 756031A01E9;
	Tue, 12 Nov 2024 17:25:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 47/47] xtrans: upgrade 1.5.1 -> 1.5.2
Date: Tue, 12 Nov 2024 17:24:43 +0800
Message-Id: <1731403483-21399-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.562800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxs1Ir4NZzFmixX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0545soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SfXHsbK60DO5T7wjLWvHxiRP2NnvZR43IZi1x+S0wXooDCU
	1ut53HvzU0t/I2OkK2kn3P3qknqVs7LTsR0q065fms45zms7UzS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207033

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- is_numeric: Add !defined(IPv6) to checks
- Fix build when HAVE_STRCASECMP is not defined

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{xtrans_1.5.1.bb => xtrans_1.5.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.5.1.bb => xtrans_1.5.2.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
index ea362750df..e391bf8a2b 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
@@ -22,4 +22,4 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "dea80fbd8c3c941495b4b1d2785cb652815d016849a0d2ef90d1140de916993e"
+SRC_URI[sha256sum] = "5c5cbfe34764a9131d048f03c31c19e57fb4c682d67713eab6a65541b4dff86c"
-- 
2.34.1


