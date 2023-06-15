Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C9AEB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:04:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.30002.1686863071334650475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 14:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TIpPaDqb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4Pj7123054;
	Thu, 15 Jun 2023 16:04:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686863065;
	bh=Zl48p7QV4SoUwOBZ1QCZfbB43fSjcF6SkJCjtJXgu9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TIpPaDqbySfbRJwhlslmlR0VrHwhwoEKGZQgji2j/9P+HdYSmmRcUv9csmkBWes3d
	 ojsMe6f0EJhSONb+JU0/5VykYkqMatKQ0rGLsf7vNoeWxJipzPSl3jhokLbFCw2Ox+
	 32gglnQSrtnrCBuu3BD53m9mO9FLnCIJ5Pgfa9+8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FL4PQS006392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 16:04:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 16:04:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 16:04:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4PsV024205;
	Thu, 15 Jun 2023 16:04:25 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: <s-adivi@ti.com>, <c-shilwant@ti.com>,
        ssuesens
	<sebastian.suesens@baslerweb.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: [OE-Core][kirkstone][PATCH 1/8] weston.init: enabled xwayland
Date: Thu, 15 Jun 2023 16:04:13 -0500
Message-ID: <20230615210420.725559-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615210420.725559-1-rs@ti.com>
References: <20230615210420.725559-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 21:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182884

From: ssuesens <sebastian.suesens@baslerweb.com>

set xwayland support in weston.init file to true

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 497d860203..77dda03cf5 100644
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


