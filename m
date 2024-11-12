Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF776D3ABFC
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.82724.1731403508790688948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TX7WWk0m;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403508; x=1762939508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=So58vp3T6hgp4X+Q7ZUFaEkNvOHCvryR3mhskRd1cW8=;
  b=TX7WWk0m+1SloJ2CSBiohwKNrW9IfjXnyeNDCSMUj2qOyJx71Y8vP+LY
   s/LGkAvmfdPeLKMemh8t7uALmlaupc9oNEKrinGCftjmg5cIHPtE17UE2
   XSBe6TzQI3INZH9kDes18HdLmBDEb4PFUsaTNLBUn+JgYgdww2BUcGNIK
   2ARPfaJOodqaOI2MXirs9MojDLohQZ7fy9P517898l6Sis/oUKif8WyIf
   NvOAv83qudzHLVBAx9vV4EegFQZpc1Svx7rQeej5s/3ePtS77McryfD5s
   4usfy+MrdCI2G16olrk9N2KZ+ivZVh35GepaQrEsT4DqJs3NvoGCm1Fmp
   Q==;
X-CSE-ConnectionGUID: LeJjX5rMR/6TRozh56gJrg==
X-CSE-MsgGUID: HAmyzLBDR0Sdigmti48Yog==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180063467"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180063467"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F1BD29EA
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 75CB9BCB82
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 141406BF78
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B61991A000A;
	Tue, 12 Nov 2024 17:25:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/47] libcap: upgrade 2.70 -> 2.71
Date: Tue, 12 Nov 2024 17:24:09 +0800
Message-Id: <1731403483-21399-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--4.035200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2tvedD3CYSjHX19XH94Jsw630kDaWZBE1R4mYJHAxGkc3+JnVo2xgbule1
	bnmZtjuxlFSORUVE4XmEtMujR9T//GAdnzrnkM48URSScn+QSXpjDMT0TyDk5+gtHj7OwNO3x/F
	0UMEoTuyOYMgsLaoeuNjud3Ypu5JFkhFKpml54neyZfXWGpoRssZvneju3CEJgYRzfcKRghOoX+
	XAMqVh4oXp8AZY43FRQmXM7bUUXbPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206998

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.70.bb => libcap_2.71.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.70.bb => libcap_2.71.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.70.bb b/meta/recipes-support/libcap/libcap_2.71.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.70.bb
rename to meta/recipes-support/libcap/libcap_2.71.bb
index 6e2fd728e2..08ee442330 100644
--- a/meta/recipes-support/libcap/libcap_2.70.bb
+++ b/meta/recipes-support/libcap/libcap_2.71.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f"
+SRC_URI[sha256sum] = "b7006c9af5168315f35fc734bf1a8d2aa70766bd8b8c4340962e05b19c35b900"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.34.1


