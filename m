Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1342DC001DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:04:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.30000.1686863071126139621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 14:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hqxJAKOW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4Qvj053695;
	Thu, 15 Jun 2023 16:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686863066;
	bh=8aTO/Xp9z9SRW/YuNQah8siviAu6WfuNPh08q5v2A3E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hqxJAKOWMfp/DoVJcY8rUtxTGTIP0OD+MiXPFadrx4UN1bgIi77p+duMcWqgD+YlG
	 W6bpZDFOBkue5ho8glSEnjgK4pqcji3o0qeL5F//FkOBbZe6EYDdqn3ZGKLpmFOAHH
	 g5N3k5iFU1UGgeLqwPSLIoui08KayepiYBdubOV0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FL4Q1p016339
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 16:04:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 16:04:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 16:04:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4PsX024205;
	Thu, 15 Jun 2023 16:04:25 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: <s-adivi@ti.com>, <c-shilwant@ti.com>, Randolph Sapp <rs@ti.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][kirkstone][PATCH 3/8] weston-init: make sure the render group exists
Date: Thu, 15 Jun 2023 16:04:15 -0500
Message-ID: <20230615210420.725559-4-rs@ti.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 21:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182882

From: Randolph Sapp <rs@ti.com>

Add the render group explicitly here to make sure it exists for the
useradd command.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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


