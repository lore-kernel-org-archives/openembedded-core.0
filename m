Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.61])
	by mail.openembedded.org (Postfix) with ESMTP id 62E6C72304
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 10:34:13 +0000 (UTC)
Received: from atl4mhob05.myregisteredsite.com
	(atl4mhob05.myregisteredsite.com [209.17.115.43])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB4ARuKj009916 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 05:27:56 -0500
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob05.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB4ARq3K017329 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 05:27:52 -0500
Received: (qmail 15222 invoked by uid 0); 4 Dec 2014 10:27:52 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 4 Dec 2014 10:27:51 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 11:27:45 +0100
Message-Id: <1417688866-8329-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 1/2] busybox-mdev: Install missing find-touchscreen.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Dec 2014 10:34:13 -0000

mdev.conf references the find-touchscreen.sh script, but this file
was not being installed. Add the script to the busybox-mdev package.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/busybox/busybox.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bd66e4f..deb2ee4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -23,7 +23,7 @@ PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
-FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
+FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
@@ -268,6 +268,8 @@ do_install () {
                install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
                if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
+                       install -d ${D}${sysconfdir}/mdev
+                       install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev
                fi
 	fi
 
-- 
1.7.9.5


