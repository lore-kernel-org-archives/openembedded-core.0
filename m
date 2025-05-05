Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB53C3ABB9
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 22:48:30 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.63328.1746485307683843269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 15:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ioti6mOD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545Mm8ml885901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 17:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746485288;
	bh=0eNTZnqAwglmz8wh5iqFlE3sfsUPtxIJ4CoYYeq9RVk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ioti6mOD0rJhPVi4j3l7dcyjJFPS7gXFq0nHW/vYd40oqyF7tdVp4Fxe3ZhkCk2dg
	 GA5ehcspPjCP+sRecK5BpWmgpDqVui6WtsgenmA+LuwT+aDxfR8a8F+kQaAcU0RsGV
	 n4OBpbhMczvRBH1PzSfBFf5MD1m8Ge/3CDcgQUHU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545Mm8iC005439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 17:48:08 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 17:48:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 17:48:07 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545Mm7Gi065114;
	Mon, 5 May 2025 17:48:07 -0500
From: <rs@ti.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv2 1/3] emptty: add version 0.14.0
Date: Mon, 5 May 2025 17:47:59 -0500
Message-ID: <20250505224801.3181046-2-rs@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505224801.3181046-1-rs@ti.com>
References: <20250505224801.3181046-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 22:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216021

From: Randolph Sapp <rs@ti.com>

Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
relatively lightweight display manager that supports x11 as well as
wayland through both a CLI and an automatic login mechanism.

This can effectively replace the custom init scripts for both x11
(xserver-nodm-init) and wayland (weston-init) with a single tool with
more verbose logging capabilities.

This is split into two recipes. The emptty package provides the binary
and various agnostic configs while the emptty-conf package provides the
default configuration for the application itself. This RPROVIDES
virtual-emptty-conf, allowing other recipes to provide their own
configurations to override the default behavior.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../conf/distro/include/default-providers.inc |  1 +
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-graphics/emptty/emptty-conf.bb   | 14 +++++
 meta/recipes-graphics/emptty/emptty.inc       | 26 +++++++++
 .../recipes-graphics/emptty/emptty/emptty.tab |  1 +
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 ++++
 meta/recipes-graphics/emptty/emptty_0.14.0.bb | 53 +++++++++++++++++++
 7 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.14.0.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ee91af8796..b5446c0f92 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -68,3 +68,4 @@ PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
+PREFERRED_RPROVIDER_virtual-emptty-conf ?= "emptty-conf"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b67433d4d2..03b3c4db41 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -172,6 +172,8 @@ RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-emptty = "Randolph Sapp <rs@ti.com>"
+RECIPE_MAINTAINER:pn-emptty-conf = "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/emptty/emptty-conf.bb b/meta/recipes-graphics/emptty/emptty-conf.bb
new file mode 100644
index 0000000000..0aacb086cd
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty-conf.bb
@@ -0,0 +1,14 @@
+require emptty.inc
+
+SUMMARY += " (Default config)"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install () {
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-config
+}
+
+FILES:${PN}-conf = "${sysconfdir}/emptty/conf"
+CONFFILES:${PN}-conf = "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN}-conf += "virtual-emptty-conf"
diff --git a/meta/recipes-graphics/emptty/emptty.inc b/meta/recipes-graphics/emptty/emptty.inc
new file mode 100644
index 0000000000..11d5770f3a
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,26 @@
+SUMMARY = "Dead simple CLI Display Manager on TTY"
+DESCRIPTION = "Emptty is a simple display manager with a command line greeter \
+It supports both X11 and Wayland sessions, exporting required variables and \
+creating user paths as necessary."
+
+HOMEPAGE = "https://github.com/tvrzna/emptty"
+BUGTRACKER = "https://github.com/tvrzna/emptty/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=d1e4d12c7d1d17367ba5668706a405ba"
+
+S = "${UNPACKDIR}"
+
+FILESEXTRAPATHS:append = ":${THISDIR}/emptty"
+
+GO_IMPORT = "github.com/tvrzna/emptty"
+GO_IMPORT_pam = "github.com/msteinert/pam"
+SRC_URI = "\
+    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
+    git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
+    file://pamconf \
+    file://emptty.tab \
+    "
+SRCREV = "d162bef75fadc8ae1d8e33dbb3de5e2795a196e0"
+SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .= "_pam"
diff --git a/meta/recipes-graphics/emptty/emptty/emptty.tab b/meta/recipes-graphics/emptty/emptty/emptty.tab
new file mode 100644
index 0000000000..6359c7224d
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/emptty.tab
@@ -0,0 +1 @@
+7:5:respawn:/usr/bin/emptty -t 7 -d
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
diff --git a/meta/recipes-graphics/emptty/emptty_0.14.0.bb b/meta/recipes-graphics/emptty/emptty_0.14.0.bb
new file mode 100644
index 0000000000..11d306a56d
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.14.0.bb
@@ -0,0 +1,53 @@
+require emptty.inc
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] = ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] = ",,virtual/libx11"
+
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/crypt', d)}"
+
+GO_TAGS = ""
+GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
+GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
+
+GOBUILDFLAGS:append = " -tags=${GO_TAGS}"
+
+export GO111MODULE = "off"
+
+inherit go
+
+DEPENDS += "gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptty.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # init services
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=${D} install-systemd
+    else
+        install -Dm644 ${S}/emptty.tab ${D}${sysconfdir}/inittab.d/emptty.tab
+    fi
+}
+
+FILES:${PN} = "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${sysconfdir}/inittab.d/emptty.tab \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} += "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} = "emptty.service"
+
+inherit systemd
-- 
2.49.0


