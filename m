Return-Path: <Abdur_Rehman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BC468763CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:12:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZK8QI-0005sD-Qu from Abdur_Rehman@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jul 2015 10:12:15 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 28 Jul 2015 18:12:13 +0100
From: Abdur Rehman <abdur_rehman@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 22:11:47 +0500
Message-ID: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Tue, 28 Jul 2015 17:12:15 -0000
Content-Type: text/plain

Fixes a dependency on a nonexistent initscripts-functions package.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
---
 meta/recipes-extended/watchdog/watchdog_5.14.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index 9ec0a8e..7557597 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -28,3 +28,8 @@ RRECOMMENDS_${PN} = "kernel-module-softdog"
 do_install_append() {
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
 }
+
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
-- 
1.7.9.5


