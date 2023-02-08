Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A8C636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:14:04 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.3025.1675840434223636828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LVwosz9o;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202302080713509be88f5337055a6205-zitaii@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202302080713509be88f5337055a6205
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Feb 2023 08:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xDoAz+32M4nDe72ta/aOaGk4zcJ6uGO9cNtUPTyrEA8=;
 b=LVwosz9ocVYA5EkvJvKXI3lIzaJRFB97djDlWNAPB9xxyakNDR81Wwu9VpyFYTHFgBfo0H
 VHC1zcXo48B0uk5W6957oZjww3To1mJI3RHJywP8SEjrGOiCvqNmgGIbRr2TlyLGr1HzwMST
 7kewlw8LvVHMQPeS/xMsvnWLmhCqI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/3] systemd: split networkd to its own package
Date: Wed,  8 Feb 2023 08:12:51 +0100
Message-Id: <20230208071251.5412-4-peter.marko@siemens.com>
In-Reply-To: <20230208071251.5412-1-peter.marko@siemens.com>
References: <20230208071251.5412-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176840

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_252.4.bb | 37 ++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index de3ca93df8..180b95d6de 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -361,6 +361,7 @@ python populate_packages:prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
+# networkd needs to be after udev
 PACKAGE_BEFORE_PN = "\
     ${PN}-gui \
     ${PN}-vconsole-setup \
@@ -380,6 +381,7 @@ PACKAGE_BEFORE_PN = "\
     libsystemd-shared \
     udev \
     udev-hwdb \
+    ${PN}-networkd \
 "
 
 SUMMARY:${PN}-container = "Tools for containers and VMs"
@@ -394,6 +396,9 @@ DESCRIPTION:${PN}-journal-upload = "systemd-journal-upload uploads journal entri
 SUMMARY:${PN}-journal-remote = "Receive journal messages over the network"
 DESCRIPTION:${PN}-journal-remote = "systemd-journal-remote is a command to receive serialized journal events and store them to journal files."
 
+SUMMARY:${PN}-networkd = "System daemon that manages network configurations"
+DESCRIPTION:${PN}-networkd = "systemd-networkd daemon detects and configures network devices as they appear; it can also create virtual network devices"
+
 SUMMARY:${PN}-timesyncd = "Synchronize local system clock with a remote NTP server"
 DESCRIPTION:${PN}-timesyncd = "systemd-timesyncd is a system service that may be used to synchronize the local system clock with a remote Network Time Protocol (NTP) server."
 
@@ -403,6 +408,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-networkd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${PN}-timesyncd', '', d)} \
 "
 SYSTEMD_SERVICE:${PN}-binfmt = "systemd-binfmt.service"
@@ -417,9 +423,9 @@ GROUPADD_PARAM:${PN} = "-r systemd-journal;"
 GROUPADD_PARAM:udev = "-r render"
 GROUPADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
+USERADD_PARAM:${PN}-networkd = "--system -d / -M --shell /sbin/nologin systemd-network"
 USERADD_PARAM:${PN}-timesyncd = "--system -d / -M --shell /sbin/nologin systemd-timesync"
 USERADD_PARAM:${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
 USERADD_PARAM:${PN}-journal-gatewayd = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
@@ -478,6 +484,32 @@ FILES:${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
                              "
 SYSTEMD_SERVICE:${PN}-journal-remote = "systemd-journal-remote.socket"
 
+FILES:${PN}-networkd = "${base_bindir}/networkctl \
+                        ${sysconfdir}/systemd/network \
+                        ${sysconfdir}/systemd/networkd.conf \
+                        ${rootlibexecdir}/systemd/network/ \
+                        ${systemd_system_unitdir}/systemd-networkd.service \
+                        ${systemd_system_unitdir}/systemd-networkd.socket \
+                        ${systemd_system_unitdir}/systemd-networkd-wait-online.service \
+                        ${systemd_system_unitdir}/systemd-networkd-wait-online@.service \
+                        ${rootlibexecdir}/systemd/systemd-networkd \
+                        ${rootlibexecdir}/systemd/systemd-networkd-wait-online \
+                        ${exec_prefix}/lib/sysusers.d/systemd-network.conf \
+                        ${exec_prefix}/lib/tmpfiles.d/systemd-network.conf \
+                        ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
+                        ${datadir}/dbus-1/system-services/org.freedesktop.network1.service \
+                        ${datadir}/polkit-1/actions/org.freedesktop.network1.policy \
+                       "
+
+SYSTEMD_SERVICE:${PN}-networkd = "systemd-networkd.service \
+                                  systemd-networkd.socket \
+                                  systemd-networkd-wait-online.service \
+                                  systemd-networkd-wait-online@.service \
+                                 "
+SYSTEMD_PACKAGES_DONT_RECURSE:${PN}-networkd = "1"
+
+RDEPENDS:${PN}-networkd = "${PN}"
+
 FILES:${PN}-timesyncd = "${sysconfdir}/systemd/timesyncd.conf \
                          ${rootlibexecdir}/systemd/ntp-units.d/80-systemd-timesync.list \
                          ${systemd_system_unitdir}/systemd-timesyncd.service \
@@ -605,13 +637,13 @@ FILES:${PN}-udev-rules = "\
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-	${sysconfdir}/systemd/networkd.conf \
 	${sysconfdir}/systemd/pstore.conf \
 	${sysconfdir}/systemd/resolved.conf \
 	${sysconfdir}/systemd/sleep.conf \
 	${sysconfdir}/systemd/system.conf \
 	${sysconfdir}/systemd/user.conf \
 "
+CONFFILES:${PN}-networkd = "${sysconfdir}/systemd/networkd.conf"
 CONFFILES:${PN}-timesyncd = "${sysconfdir}/systemd/timesyncd.conf"
 
 FILES:${PN} = " ${base_bindir}/* \
@@ -691,6 +723,7 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \
                       systemd-conf \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${PN}-networkd', '', d)} \
                       ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${PN}-timesyncd', '', d)} \
 "
 
-- 
2.30.2


