Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04313C001B1
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:04:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.29997.1686863069578305612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 14:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ve29wfGU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4QJR123058;
	Thu, 15 Jun 2023 16:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686863066;
	bh=jMp3CIW98fp77d96TP8zeg6dJbpzFRG4S5xNYrod/F8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ve29wfGUi5yu6TP751bKRriN2iB6DwIn0aWj4b8RE9MN4AyBWNZkHLjOR2poelVxw
	 T4nqHZ2EvXSkZpfbHP5qSLk/1jKGvwJO0xK7ymRyr3vL+ITEoCJY9KwFrsWVxoTj9L
	 ePQ1R8hEyB6JOwBeUpP1XuNKK287YuEBQbdDi+vU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FL4Qqw016336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 16:04:26 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 16:04:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 16:04:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4PsW024205;
	Thu, 15 Jun 2023 16:04:25 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: <s-adivi@ti.com>, <c-shilwant@ti.com>, Ming Liu <liu.ming50@gmail.com>
Subject: [OE-Core][kirkstone][PATCH 2/8] weston-init: introduce xwayland PACKAGECONFIG
Date: Thu, 15 Jun 2023 16:04:14 -0500
Message-ID: <20230615210420.725559-3-rs@ti.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182880

From: Ming Liu <liu.ming50@gmail.com>

Some BSPs dont support xwayland in weston, this is easier for them to
control that.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 77dda03cf5..a7adce7fda 100644
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


