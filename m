Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5069DC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:14:04 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.3057.1675840433162501901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Pbhba59P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20230208071350b603e78608b5ae27d3-nr4or2@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20230208071350b603e78608b5ae27d3
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Feb 2023 08:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8+ebQ5pW7rGNaXKdnOGD4TUFChiIUC9NHF1hoM5F2nI=;
 b=Pbhba59PONVWklfsRWUJHQ/uUoqlASCX5yd7ZkmZKXKBM2K/Tno6yxCxtsRYiVF0V+anno
 hrdaoKf29cyDU3sH1KhNtlAFgZxUx+7hr0Aooob8ThanX/RDySBaWoU9Gzlo7CwFBep+h8OF
 /jZ+VX/nhG9LtFBj/Ty6FhEU7Ffuw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/3] systemd: split timesyncd to its own package
Date: Wed,  8 Feb 2023 08:12:49 +0100
Message-Id: <20230208071251.5412-2-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176837

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_252.4.bb | 27 ++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index e6c873f53b..de3ca93df8 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -376,6 +376,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-journal-remote \
     ${PN}-extra-utils \
     ${PN}-udev-rules \
+    ${PN}-timesyncd \
     libsystemd-shared \
     udev \
     udev-hwdb \
@@ -393,12 +394,16 @@ DESCRIPTION:${PN}-journal-upload = "systemd-journal-upload uploads journal entri
 SUMMARY:${PN}-journal-remote = "Receive journal messages over the network"
 DESCRIPTION:${PN}-journal-remote = "systemd-journal-remote is a command to receive serialized journal events and store them to journal files."
 
+SUMMARY:${PN}-timesyncd = "Synchronize local system clock with a remote NTP server"
+DESCRIPTION:${PN}-timesyncd = "systemd-timesyncd is a system service that may be used to synchronize the local system clock with a remote Network Time Protocol (NTP) server."
+
 SUMMARY:libsystemd-shared = "Systemd shared library"
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${PN}-timesyncd', '', d)} \
 "
 SYSTEMD_SERVICE:${PN}-binfmt = "systemd-binfmt.service"
 
@@ -415,7 +420,7 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--sys
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
-USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM:${PN}-timesyncd = "--system -d / -M --shell /sbin/nologin systemd-timesync"
 USERADD_PARAM:${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
 USERADD_PARAM:${PN}-journal-gatewayd = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
 USERADD_PARAM:${PN}-journal-remote = "--system -d / -M --shell /sbin/nologin systemd-journal-remote"
@@ -473,6 +478,23 @@ FILES:${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
                              "
 SYSTEMD_SERVICE:${PN}-journal-remote = "systemd-journal-remote.socket"
 
+FILES:${PN}-timesyncd = "${sysconfdir}/systemd/timesyncd.conf \
+                         ${rootlibexecdir}/systemd/ntp-units.d/80-systemd-timesync.list \
+                         ${systemd_system_unitdir}/systemd-timesyncd.service \
+                         ${systemd_system_unitdir}/systemd-time-wait-sync.service \
+                         ${rootlibexecdir}/systemd/systemd-timesyncd \
+                         ${rootlibexecdir}/systemd/systemd-time-wait-sync \
+                         ${exec_prefix}/lib/sysusers.d/systemd-timesync.conf \
+                         ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.conf \
+                         ${datadir}/dbus-1/system-services/org.freedesktop.timesync1.service \
+                         ${datadir}/polkit-1/actions/org.freedesktop.timesync1.policy \
+                        "
+
+SYSTEMD_SERVICE:${PN}-timesyncd = "systemd-timesyncd.service \
+                                   systemd-time-wait-sync.service \
+                                  "
+
+RDEPENDS:${PN}-timesyncd = "${PN}"
 
 FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
@@ -588,9 +610,9 @@ CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/resolved.conf \
 	${sysconfdir}/systemd/sleep.conf \
 	${sysconfdir}/systemd/system.conf \
-	${sysconfdir}/systemd/timesyncd.conf \
 	${sysconfdir}/systemd/user.conf \
 "
+CONFFILES:${PN}-timesyncd = "${sysconfdir}/systemd/timesyncd.conf"
 
 FILES:${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/shutdown \
@@ -669,6 +691,7 @@ RRECOMMENDS:${PN} += "systemd-extra-utils \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \
                       systemd-conf \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${PN}-timesyncd', '', d)} \
 "
 
 INSANE_SKIP:${PN} += "dev-so libdir"
-- 
2.30.2


