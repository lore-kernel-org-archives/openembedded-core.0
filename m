Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A241ED41D7C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.82408.1731403504426017067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mS25DGxQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403504; x=1762939504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C72KrV3dknpbih9FqaLHGByxx81YY3uk+4/JZyaGRGY=;
  b=mS25DGxQCnk6nY0EF5hRGzFzlEBJ4BDdDzh1CMWVeu7jq6SWwLnbcdv2
   qn0UvcG7IPw66ebjEsbLCrK1HgPtgQr6Xu0MVTmL6lStOhwQrMajSkm1E
   G+smg2hVCHT6uuHg8zznjbtpS+8WGlDIADUcmKLcjr0oQO/QW0i1bead8
   47B8M0211pkIndx/XQJN+VWfJ2BWGbvrYn80sargpe0hFGkLsYHCdweY2
   wao/f5FbVLxNxwTHEXmerWAiRQpLMpPHe8orNLZHvwerjH1Te2QR4fPEo
   xohAUrIUdLinN2zy9faIGj8NmvN3XsLMSjNzuS55u4w+rKcZ20A2gPQvI
   Q==;
X-CSE-ConnectionGUID: E6LoXxjXRCab7pd+j/cjBQ==
X-CSE-MsgGUID: BOBnFAB4Tim7UZhCWr7Qcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="182315467"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="182315467"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D439BE3E12
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70C4B2D13E
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D2EF6BF78
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:24:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B046C1A01E9;
	Tue, 12 Nov 2024 17:24:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/47] ell: upgrade 0.69 -> 0.70
Date: Tue, 12 Nov 2024 17:24:01 +0800
Message-Id: <1731403483-21399-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.123500-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzT+1Zj+w66+u79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gH4qCLIu0mtIHMsGegbdjl3pju
	tk5PWqiji8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFM2YrfOFFuYrmyR7c1zFCP0nVM
	K3lhMTf52Ft2/isjEMwrqpXUPydhZ9vW+N++akCXsHa94QjRHp30iiRGrWEqLGbXBR2Tabcux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for helper function for safe memcpy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.69.bb => ell_0.70.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.69.bb => ell_0.70.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.69.bb b/meta/recipes-core/ell/ell_0.70.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.69.bb
rename to meta/recipes-core/ell/ell_0.70.bb
index a9060e3762..f855b4df36 100644
--- a/meta/recipes-core/ell/ell_0.69.bb
+++ b/meta/recipes-core/ell/ell_0.70.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e"
+SRC_URI[sha256sum] = "1bb7f5d73df34b46c4dd340fec98442d7dac2a7b4ce0ee3fc779ca2fbe6fe591"
-- 
2.34.1


