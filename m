Return-Path: <fw@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C487CC4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:51:46 +0000 (UTC)
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de [80.67.31.42])
 by mx.groups.io with SMTP id smtpd.web10.55219.1699023098166956805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 07:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 80.67.31.42, mailfrom: fw@ferncast.de)
Received: from [78.35.154.134] (helo=ferncast-fw.fritz.box)
	by smtprelay04.ispgateway.de with esmtpa (Exim 4.96.1)
	(envelope-from <fw@ferncast.de>)
	id 1qyvWI-0002BD-28;
	Fri, 03 Nov 2023 15:51:34 +0100
From: Florian Wickert <fw@ferncast.de>
To: openembedded-core@lists.openembedded.org
Cc: Florian Wickert <fw@ferncast.de>
Subject: [PATCH] systemd: fix libnss-mymachines packaging
Date: Fri,  3 Nov 2023 15:50:37 +0100
Message-ID: <20231103145037.2365572-1-fw@ferncast.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: ZndAZmVybmNhc3QuZGU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 14:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190164

By removing libnss_mymachines.so.2 from FILES:${PN}-container it
correctly gets packaged into libnss-mymachines, just like the other
libnss-* components, due to PACKAGES_DYNAMIC.

To make up for the missing lib in the container package, I added
libnss-mymachines to RDEPENDS:${PN}-container. As I understand it,
the lib should be installed even without this if anything from the
container package links against it. But since I don't know if there
was a special reason to explicitly add it to the container files list,
like something using dlopen to load the lib, it seemd to be the
safest option.

Signed-off-by: Florian Wickert <fw@ferncast.de>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index ef29116bf9..ddc8a0219a 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -534,7 +534,6 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
                          ${exec_prefix}/lib/tmpfiles.d/README \
                          ${systemd_system_unitdir}/systemd-nspawn@.service \
-                         ${libdir}/libnss_mymachines.so.2 \
                          ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
                          ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
                          ${datadir}/dbus-1/system.d/org.freedesktop.import1.conf \
@@ -543,6 +542,8 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
+RDEPENDS:${PN}-container = "libnss-mymachines"
+
 # "machinectl import-tar" uses "tar --numeric-owner", not supported by busybox.
 RRECOMMENDS:${PN}-container += "\
                          ${PN}-journal-gatewayd \
-- 
2.42.0


