Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21C736FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 00:29:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8T0T899021369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:29:08 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 28 Sep 2017 17:29:07 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Sep 2017 08:27:55 +0800
Message-ID: <1506644875-30179-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] watchdog: install wd_keepalive service file to its own package
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
X-List-Received-Date: Fri, 29 Sep 2017 00:29:08 -0000
Content-Type: text/plain

Move wd_keepalive.service from watchdog package to watchdog-keepalive
package. Also remove debian specific code from the service file.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 3d0b72e..5246b84 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -36,12 +36,17 @@ INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
 INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
-SYSTEMD_SERVICE_${PN} = "watchdog.service wd_keepalive.service"
+SYSTEMD_PACKAGES = "${PN} ${PN}-keepalive"
+SYSTEMD_SERVICE_${PN} = "watchdog.service"
+SYSTEMD_SERVICE_${PN}-keepalive = "wd_keepalive.service"
 
 do_install_append() {
 	install -d ${D}${systemd_system_unitdir}
 	install -m 0644 ${S}/debian/watchdog.service ${D}${systemd_system_unitdir}
 	install -m 0644 ${S}/debian/wd_keepalive.service ${D}${systemd_system_unitdir}
+	# remove specific code for debian
+	sed -i -e '/^ExecStartPost/d' \
+		-e '/^ExecStopPost/d' ${D}${systemd_system_unitdir}/wd_keepalive.service
 
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
 	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
@@ -54,6 +59,7 @@ PACKAGES =+ "${PN}-keepalive"
 
 FILES_${PN}-keepalive = " \
     ${sysconfdir}/init.d/wd_keepalive \
+    ${systemd_system_unitdir}/wd_keepalive.service \
     ${sbindir}/wd_keepalive \
 "
 
-- 
2.7.4


