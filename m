Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8717CC7EE2E
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 01:13:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9983.1686359635934058266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 18:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XSGWZHHN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35A1DnbT052758;
	Fri, 9 Jun 2023 20:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686359629;
	bh=+evSlF3SrSMmrafy3Hl2xcDke0llIc4mglBx1zAZaZU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XSGWZHHNUDTXCB50RNvjh99lDUwAeR9uXstYFWaUh2RJZxx8nF//+IDioW5NaACvY
	 ivioBcJaxQkktmofEIC1B9Rx6LTbObfkGgjU0CIhQr+wtHrEbqDzsTf6qFxpmyc8uS
	 CFf6a1kHl3q4YNgHkq41/Mf3EVIhOJv2X9MCbg14=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35A1Dn2o107106
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 20:13:49 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 20:13:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 20:13:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35A1Dnhj110838;
	Fri, 9 Jun 2023 20:13:49 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 1/6] weston-init: make sure the render group exists
Date: Fri, 9 Jun 2023 20:13:34 -0500
Message-ID: <20230610011339.3716428-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230610011339.3716428-1-rs@ti.com>
References: <20230610011339.3716428-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 01:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182603

From: Randolph Sapp <rs@ti.com>

Add the render group explicitly here to make sure it exists for the
useradd command.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index a7adce7fda..b637fa6a4a 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -94,5 +94,5 @@ CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/we
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
 USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
-GROUPADD_PARAM:${PN} = "-r wayland"
+GROUPADD_PARAM:${PN} = "-r wayland; -r render"
 
-- 
2.41.0


