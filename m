Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2470EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 21:04:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.29885.1686863068798956887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 14:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ADSWpIHM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4Qdf123071;
	Thu, 15 Jun 2023 16:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686863066;
	bh=7flcMFbA1MBq9R5NjUgfCbAduVCDV8roUu2sPVvt6x0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ADSWpIHMAkw8MKmS4tqWdfpPSV938YTkswHxGZVOKXfQLl2ST2Lb/PD34tvlQh7Q1
	 o4NQVxrveap/jQbb9E/mgl0RWeeXbmBrHTpqa2CB7N1gfNeyjL+6LJ/b1pVf+MNCK9
	 +ZGKakxte4hrPeHs4AuGWeXnEugR87N88Kzs1Gzg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FL4QFZ122280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Jun 2023 16:04:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 16:04:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 16:04:26 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FL4Psb024205;
	Thu, 15 Jun 2023 16:04:26 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: <s-adivi@ti.com>, <c-shilwant@ti.com>, Randolph Sapp <rs@ti.com>
Subject: [OE-Core][kirkstone][PATCH 7/8] weston-init: guard against systemd configs
Date: Thu, 15 Jun 2023 16:04:19 -0500
Message-ID: <20230615210420.725559-8-rs@ti.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182878

From: Randolph Sapp <rs@ti.com>

Just as sysvinit scripts shouldn't be present in a distro using systemd,
systemd scripts shouldn't be present in a system not using systemd.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb | 29 ++++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e538469a58..9d892d58f2 100644
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


