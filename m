Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A68C001DB
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:25:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2801.1687537500531852699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=di1X4jB6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOtvP126934;
	Fri, 23 Jun 2023 11:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687537495;
	bh=hmi1IWxoKhj+UxVsoRQjd306xBuAdEI4bwOVg6IadtU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=di1X4jB6KXA9LJA4bQFbriIr0lfv7o+A55usXYCbLESuNpVFgGs2pl1h54Gju82Gr
	 yml/d+9bwIuATG9j/lE4urdi1qm+CLyfxAUDJ2lWhbMga9e8e7ZQxijEimPlU1vrjl
	 iUC54c6ywcG6fIu2QSajjlHzOs4E7exGBIExlPlY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NGOt2Q118763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Jun 2023 11:24:55 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 11:24:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 11:24:54 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOs1E023142;
	Fri, 23 Jun 2023 11:24:54 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: [oe-core][kirkstone][PATCHv2 4/8] weston-init: add weston user to the render group
Date: Fri, 23 Jun 2023 11:24:44 -0500
Message-ID: <20230623162448.3162089-5-rs@ti.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183343

From: Randolph Sapp <rs@ti.com>

The weston user must be in the render group in order to access render
device nodes for standard user-space graphics.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index b637fa6a4a5..6d62993d7da 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -93,6 +93,6 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render weston"
 GROUPADD_PARAM:${PN} = "-r wayland; -r render"
 
-- 
2.41.0


