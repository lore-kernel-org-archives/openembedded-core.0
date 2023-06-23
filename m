Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059D3C001B0
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:25:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2799.1687537499908857791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 09:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SaSeR0QZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOt0l120719;
	Fri, 23 Jun 2023 11:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687537495;
	bh=Hr7ed2qeZ0DtAImasVgjWiMOMFuvcX3eGLxKTAuHfF8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SaSeR0QZEAYVi8dOxg88GatYGYDYctMep1f73QcQ6g6pwp7zF4I7AhoLAZyrLIaUq
	 7aSH0QQRcjoGidIaAbadxuocp7NOyfiNXWa7AFlrB2iF27Bls9iP6W2fJyrXlKhyiN
	 EHoBeBDre/j/TozmuwktlKV4LmLy3dEVu0mHRNwE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NGOtHp023687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Jun 2023 11:24:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 11:24:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 11:24:55 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NGOs1I023142;
	Fri, 23 Jun 2023 11:24:55 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <denis@denix.org>,
        <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>, <rs@ti.com>
Subject: [oe-core][kirkstone][PATCHv2 8/8] weston-init: add profile to point users to global socket
Date: Fri, 23 Jun 2023 11:24:48 -0500
Message-ID: <20230623162448.3162089-9-rs@ti.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183341

From: Randolph Sapp <rs@ti.com>

Add profile script to point users capable of interacting with the global
socket to it by default.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/wayland/weston-init.bb  |  3 +++
 .../wayland/weston-init/weston-socket.sh      | 20 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 9d892d58f2f..1884b5d4401 100644
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
+		install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
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
index 00000000000..86389d63a3b
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


