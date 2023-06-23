Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1382BC001DF
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:25:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2802.1687537501856043831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w3eA/jOT;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOsWG121551;
	Fri, 23 Jun 2023 11:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687537494;
	bh=kcmnSFKAKvZksiktN2cB/XtDnrMbH0v+L8dj4c/tTKg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w3eA/jOTp/PsVV52xIibgnOCLpq3Av4mcG4mYnVth1kWgjHOpkIiqX02Ri+NbphLh
	 fCmK4OS3uFoa8BzBZAc3GiWZJvM4YFta9Hh5Sxuh+T8w+W942m2o4g8P+wwYxyZfjD
	 WjmzQ/IfzfwfI3QkBbRynjC4gRvTGMPRQbwRMOy4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NGOsBI020270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Jun 2023 11:24:54 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 11:24:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 11:24:54 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOs1B023142;
	Fri, 23 Jun 2023 11:24:54 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>,
        ssuesens
	<sebastian.suesens@baslerweb.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: [oe-core][kirkstone][PATCHv2 1/8] weston.init: enabled xwayland
Date: Fri, 23 Jun 2023 11:24:41 -0500
Message-ID: <20230623162448.3162089-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623162448.3162089-1-rs@ti.com>
References: <20230623162448.3162089-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183345

From: ssuesens <sebastian.suesens@baslerweb.com>

set xwayland support in weston.init file to true

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 497d8602038..77dda03cf55 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -50,6 +50,10 @@ do_install() {
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" = "yes" ]; then
+		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
 		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
-- 
2.41.0


