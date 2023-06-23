Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1356BC001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:25:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2882.1687537501578795447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gq92UJBe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOtA3120715;
	Fri, 23 Jun 2023 11:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687537495;
	bh=tMByJ/0L4+ZAR132jXOnzdqOJ7eQmOF1P9vq25Ntn6s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gq92UJBeHyaMIe9rtfPR+1Fd3V9HxZg75nP2Dleo6Ph4Wdl/Azhqry/t7m1c5QyKM
	 83WLs/JcvL7ARVsTZ0NiVB3kwBBp6btOkecOfFfLdc1JiTOHiBTnfMHGG5OlfHNACV
	 VXqNhs4x7itDIR6ZAGXl4d6FEb7TEGCy4R6dYfPI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NGOtHU020277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Jun 2023 11:24:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 11:24:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 11:24:54 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOs1C023142;
	Fri, 23 Jun 2023 11:24:54 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>,
        Ming Liu
	<liu.ming50@gmail.com>
Subject: [oe-core][kirkstone][PATCHv2 2/8] weston-init: introduce xwayland PACKAGECONFIG
Date: Fri, 23 Jun 2023 11:24:42 -0500
Message-ID: <20230623162448.3162089-3-rs@ti.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183344

From: Ming Liu <liu.ming50@gmail.com>

Some BSPs dont support xwayland in weston, this is easier for them to
control that.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 77dda03cf55..a7adce7fda8 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -14,10 +14,11 @@ SRC_URI = "file://init \
 
 S = "${WORKDIR}"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)}"
 PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
 PACKAGECONFIG:append:qemuppc64 = " use-pixman"
 
+PACKAGECONFIG[xwayland] = ",,"
 PACKAGECONFIG[no-idle-timeout] = ",,"
 PACKAGECONFIG[use-pixman] = ",,"
 
@@ -50,7 +51,7 @@ do_install() {
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'yes', 'no', d)}" = "yes" ]; then
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
 		sed -i -e "/^\[core\]/a xwayland=true" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-- 
2.41.0


