Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5E6C3DA40
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:25:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2881.1687537499788021247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=enW5WrvB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOtmp120723;
	Fri, 23 Jun 2023 11:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687537495;
	bh=DNMZmWCwOgSqjXN4kbcHLEA97bTcsuqrpIbWmtMrsQQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=enW5WrvBDskJxgiMnR3kbema2VO8phlDPI+7BWy/Z8F0pU2X79UQMNM5GiRyMgAf1
	 IU7avFkrSY7R8y4C753scnZccT3VHrvHLUPsNdhvGxOnFh0OZesRjl6PFQIp2ss9zv
	 xJy+RiIdi4yXakBLMb3zfKsNEm3W79VfnDA7ihhg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NGOtU6023688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Jun 2023 11:24:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 11:24:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 11:24:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOs1H023142;
	Fri, 23 Jun 2023 11:24:54 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>
Subject: [oe-core][kirkstone][PATCHv2 7/8] weston-init: guard against systemd configs
Date: Fri, 23 Jun 2023 11:24:47 -0500
Message-ID: <20230623162448.3162089-8-rs@ti.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183340

From: Randolph Sapp <rs@ti.com>

Just as sysvinit scripts shouldn't be present in a distro using systemd,
systemd scripts shouldn't be present in a system not using systemd.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb | 29 ++++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e538469a58b..9d892d58f2f 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -26,27 +26,32 @@ DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
+	# Install weston-start script
 	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+		install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
+		sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
+		sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
 	fi
-	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
-	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
-	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
-	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+		sed -i -e s:/etc:${sysconfdir}:g \
+			-e s:/usr/bin:${bindir}:g \
+			-e s:/var:${localstatedir}:g \
+			${D}${systemd_system_unitdir}/weston.service
+	fi
+
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
 	fi
-	sed -i -e s:/etc:${sysconfdir}:g \
-		-e s:/usr/bin:${bindir}:g \
-		-e s:/var:${localstatedir}:g \
-		${D}${systemd_system_unitdir}/weston.service
-	# Install weston-start script
-	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
-	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
-	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
+
+	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
+
 	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
-- 
2.41.0


