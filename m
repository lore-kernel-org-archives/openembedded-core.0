Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CEBC7EE45
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 01:14:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9984.1686359635957013558
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 18:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q5UKTgtD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35A1DobD052763;
	Fri, 9 Jun 2023 20:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686359630;
	bh=DZ4U2PN9Qf5IaZnTxjd4yKPMVONEAfPfSkvrOGXfF1w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q5UKTgtDr23NgKnjnlIec2OyCelwQuqDdZ/JFkX4WVLiwonSZdnRS/ef8rwEO6W+g
	 JeCyF0v3rgpKi0RT46Cha15RkPm76K4RP8PVKdyJHJ0AtZaD6rAB67i7U8q2s4JPOz
	 uwSNiyUUgUaCZREi9jOh5Vgt6mJrmT3/4FWLDp14=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35A1Do8h032347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 20:13:50 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 20:13:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 20:13:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35A1Dnhn110838;
	Fri, 9 Jun 2023 20:13:49 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 5/6] weston-init: guard against systemd configs
Date: Fri, 9 Jun 2023 20:13:38 -0500
Message-ID: <20230610011339.3716428-6-rs@ti.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 01:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182605

From: Randolph Sapp <rs@ti.com>

Just as sysvinit scripts shouldn't be present in a distro using systemd,
systemd scripts shouldn't be present in a system not using systemd.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 29 ++++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 01abd4ce78..64f613ef8b 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -26,27 +26,32 @@ DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
+    # Install weston-start script
     if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+        install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
+        sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
+        sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
         install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
         sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
     fi
-    install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
-    install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
     # Install Weston systemd service and accompanying udev rule
-    install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
-    install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+        install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+        sed -i -e s:/etc:${sysconfdir}:g \
+            -e s:/usr/bin:${bindir}:g \
+            -e s:/var:${localstatedir}:g \
+            ${D}${systemd_system_unitdir}/weston.service
+    fi
+
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
         install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
     fi
-    sed -i -e s:/etc:${sysconfdir}:g \
-        -e s:/usr/bin:${bindir}:g \
-        -e s:/var:${localstatedir}:g \
-        ${D}${systemd_system_unitdir}/weston.service
-    # Install weston-start script
-    install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
-    sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
-    sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
+
+    install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+    install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
+
     if [ -n "${DEFAULTBACKEND}" ]; then
         sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
     fi
-- 
2.41.0


