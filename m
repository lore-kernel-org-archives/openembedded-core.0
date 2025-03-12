Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD039C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:15:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.5043.1741810548046047528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lVsCllBj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CKFVL91160358
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 15:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741810531;
	bh=Ta9YN3lGmnM1aLvafm51bsuyNc1XkYmA4uTG3hP/xp4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lVsCllBjjLOLVO4Vlx7ZyRIk933ifpfRN6BN7P7KrpNKgDsySVDcrRHTLG97C7kAg
	 5Wd9xyF23FZyAQOMf3iHfBMlNOzO/kWq6jz1l5iYpVvJSAsv3aZ5bwLlbWRP4HHThj
	 GNCN5ufWZWSh+nZuJ3Uz9gW2pGBA6y9iyX7hUjkE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CKFVoU021625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 15:15:31 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 15:15:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 15:15:30 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CKFUNF013021;
	Wed, 12 Mar 2025 15:15:30 -0500
From: <rs@ti.com>
To: <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][scarthgap][RFC 1/2] emptty: add version 0.13.0
Date: Wed, 12 Mar 2025 15:13:16 -0500
Message-ID: <20250312201316.1060199-3-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312201316.1060199-2-rs@ti.com>
References: <20250312201316.1060199-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 20:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212727

From: Randolph Sapp <rs@ti.com>

Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
relatively lightweight display manager that supports x11 as well as
wayland though both a CLI and automatic login mechanism.

This can effetely replace the custom init scripts for both x11
(xserver-nodm-init) and wayland (weston-init) with a single tool with
more verbose logging capabilities.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/emptty/emptty/init      | 26 +++++++
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 +++
 meta/recipes-graphics/emptty/emptty_0.13.0.bb | 78 +++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-graphics/emptty/emptty/init
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.13.0.bb

diff --git a/meta/recipes-graphics/emptty/emptty/init b/meta/recipes-graphics/emptty/emptty/init
new file mode 100644
index 0000000000..52493142cd
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/init
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+PIDFILE=/var/run/emptty.pid
+
+# source function library
+. /etc/init.d/functions
+
+case "$1" in
+	start)
+		echo "Starting display manager: emptty"
+		start-stop-daemon -S -p $PIDFILE -x /usr/bin/emptty
+		;;
+	stop)
+		echo "Stopping display manager: emptty"
+		start-stop-daemon -S -p $PIDFILE -x /usr/bin/emptty
+		;;
+	restart)
+		start-stop-daemon -K -p $PIDFILE --oknodo -x /usr/bin/emptty
+		sleep 2
+		start-stop-daemon -S -p $PIDFILE -x /usr/bin/emptty
+		;;
+	*)
+		echo "usage: $0 { start | stop | restart }"
+		;;
+esac
+
diff --git a/meta/recipes-graphics/emptty/emptty/pamconf b/meta/recipes-graphics/emptty/emptty/pamconf
new file mode 100644
index 0000000000..9cbfd6c4a5
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/pamconf
@@ -0,0 +1,10 @@
+#%PAM-1.0
+auth            sufficient      pam_succeed_if.so user ingroup nopasswdlogin
+auth            include         common-auth
+-auth           optional        pam_gnome_keyring.so
+-auth           optional        pam_kwallet5.so
+account         include         common-account
+session         include         common-session
+-session        optional        pam_gnome_keyring.so auto_start
+-session        optional        pam_kwallet5.so auto_start force_run
+password        include         common-password
diff --git a/meta/recipes-graphics/emptty/emptty_0.13.0.bb b/meta/recipes-graphics/emptty/emptty_0.13.0.bb
new file mode 100644
index 0000000000..7129426d71
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.13.0.bb
@@ -0,0 +1,78 @@
+SUMMARY = "Dead simple CLI Display Manager on TTY"
+HOMEPAGE = "https://github.com/tvrzna/emptty"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
+
+GO_IMPORT = "github.com/tvrzna/emptty"
+GO_IMPORT_pam = "github.com/msteinert/pam"
+SRC_URI = "\
+    git://${GO_IMPORT}.git;protocol=https;branch=master \
+    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=${S}/src/${GO_IMPORT_pam} \
+    file://pamconf \
+    "
+SRCREV = "4046552b6f5cc1cf76ce8bf333e04e16c59febca"
+SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .= "_pam"
+
+PACKAGES:append = " ${PN}-conf"
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] = ",,libpam"
+PACKAGECONFIG[x11] = ",,virtual/libx11"
+
+GO_TAGS = ""
+GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
+GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
+
+GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
+
+export GO111MODULE="off"
+
+inherit go systemd
+
+DEPENDS:append = " gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${WORKDIR}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # init services
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
+    else
+        install -Dm755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/emptty
+    fi
+}
+
+FILES:${PN} = "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${sysconfdir}/init.d/emptty \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+FILES:${PN}-conf:append = " ${sysconfdir}/emptty/conf"
+CONFFILES:${PN}-conf:append = " ${sysconfdir}/emptty/conf"
+RPROVIDES:${PN}-conf:append = " virtual-emptty-conf"
+
+RDEPENDS:${PN}:append = " virtual-emptty-conf pam-plugin-succeed-if"
+
+SYSTEMD_SERVICE:${PN} = "emptty.service"
+
+INITSCRIPT_NAME = "emptty"
+INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
+
+inherit update-rc.d systemd
-- 
2.48.1


