Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B05FC7EE45
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 01:13:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9982.1686359635752983806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 18:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PasVqumW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35A1DnL6009449;
	Fri, 9 Jun 2023 20:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686359629;
	bh=Dit9oR22UZwqb2q+GrCyrizgBWsUCj2wPAy+ZqvgtqA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PasVqumW8IzssLa+HU7enC6GB7ngubhs+kUBstLRhA04/JlP2qSkry986Vq4s9hYp
	 lHA0ijTCjBP2aW6XXBi8skecBQbKrBh3T/cEG3kGuSYffMBn/046yY1bUzrF9FSy0N
	 uosGmgKNeOdcquERWGZXVbgigGX1rn+ojGzddD6M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35A1Dn9H032343
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 20:13:49 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 20:13:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 20:13:49 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35A1Dnho110838;
	Fri, 9 Jun 2023 20:13:49 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>, <denis@denix.org>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 6/6] weston-init: add profile to point users to global socket
Date: Fri, 9 Jun 2023 20:13:39 -0500
Message-ID: <20230610011339.3716428-7-rs@ti.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182601

From: Randolph Sapp <rs@ti.com>

Add profile script to point users capable of interacting with the global
socket to it by default.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/wayland/weston-init.bb  |  3 +++
 .../wayland/weston-init/weston-socket.sh      | 20 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 64f613ef8b..2797fea9e1 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -9,6 +9,7 @@ SRC_URI = "file://init \
            file://weston.ini \
            file://weston.service \
            file://weston.socket \
+           file://weston-socket.sh \
            file://weston-autologin \
            file://weston-start"
 
@@ -39,6 +40,7 @@ do_install() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
         install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+        install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
         sed -i -e s:/etc:${sysconfdir}:g \
             -e s:/usr/bin:${bindir}:g \
             -e s:/var:${localstatedir}:g \
@@ -88,6 +90,7 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
 FILES:${PN} += "\
     ${sysconfdir}/xdg/weston/weston.ini \
+    ${sysconfdir}/profile.d/weston-socket.sh \
     ${systemd_system_unitdir}/weston.service \
     ${systemd_system_unitdir}/weston.socket \
     ${sysconfdir}/default/weston \
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
new file mode 100755
index 0000000000..86389d63a3
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# set weston variables for use with global weston socket
+global_socket="/run/wayland-0"
+if [ -e "$global_socket" ]; then
+	weston_group=$(stat -c "%G" "$global_socket")
+	if [ "$(id -u)" = "0" ]; then
+		export WAYLAND_DISPLAY="$global_socket"
+	else
+		case "$(groups "$USER")" in
+			*"$weston_group"*)
+				export WAYLAND_DISPLAY="$global_socket"
+				;;
+			*)
+				;;
+		esac
+	fi
+	unset weston_group
+fi
+unset global_socket
-- 
2.41.0


