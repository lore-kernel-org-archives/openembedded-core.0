Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07710E7718F
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.116558.1733788626611388656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G6MqiKcx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788626; x=1765324626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jd4sg3yN2+NAct+YC35G0o+1tv9klgoEsZT2WoLTOJE=;
  b=G6MqiKcx28CT3Y8flGsEg65Dffdl9XMZTl9eGcb3F7rpTn1Yybg7ClFz
   MXoYCy9deUYG3PmLPSHkYzbn35s8cLaa7ZuV0HB8dEOSrHdVDEo2srgMG
   O5E4puDyTGTsukSd7DbomsCyJyjDl+AQAGTwxMr0nUMyOuInZ2LgF4Fi6
   3fxkBEYMna1253VwmAG9YT427gBWqVX3D4pXAxdyjK3raNExfsLCV+u0J
   eUHRvd1Bh/KYzWxzzJgXnd3feaRz+2wDtKmc+CGRtNksmFis1Gti9yplj
   jJCMi7GAtWaGElzsqozhHO9SsNHIXPEY9YqbJefUf/WuufqwpHC4jDCzN
   Q==;
X-CSE-ConnectionGUID: WnnrwyhxQqKQeceAAfxAxw==
X-CSE-MsgGUID: kRXpBa5wQUiG3Hl7LUpDlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="170478399"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="170478399"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8165BDBB80
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 53075D7480
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D36754018B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F1A01A000B;
	Tue, 10 Dec 2024 07:57:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 04/20] ell: upgrade 0.70 -> 0.71
Date: Tue, 10 Dec 2024 07:56:36 +0800
Message-Id: <1733788612-20933-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--1.874100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWuj7HXXcGMagrMZ+BqQt2Np9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrdilSEVOVqGrx8I3Pvr0cgvQGyiE5vUxWiMojdA2988PfDBoh0snpge6dJ
	DD1lYCO5ZATXw0zjDkpU3pR8C48b21eHTu7XJAQx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208500

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.70.bb => ell_0.71.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.70.bb => ell_0.71.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.70.bb b/meta/recipes-core/ell/ell_0.71.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.70.bb
rename to meta/recipes-core/ell/ell_0.71.bb
index f855b4df36..b9a0b595d4 100644
--- a/meta/recipes-core/ell/ell_0.70.bb
+++ b/meta/recipes-core/ell/ell_0.71.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1bb7f5d73df34b46c4dd340fec98442d7dac2a7b4ce0ee3fc779ca2fbe6fe591"
+SRC_URI[sha256sum] = "850f79cc993791f00232fd31cbaf3e8212edcef25ca0515f98c6d48dfb5952d7"
-- 
2.34.1


