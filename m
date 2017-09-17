Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2215F776AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 09:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A024918133
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1KwFomSfcvcq
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:10 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 06C971811A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E49661E064
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8ED11E05C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:09 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id CA7D53060
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:09 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v8H968PB032372
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 11:06:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v8H968uk032371
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Sep 2017 11:06:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Sep 2017 11:06:04 +0200
Message-Id: <20170917090604.32326-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] bluez5: Correct support for building without systemd
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
X-List-Received-Date: Sun, 17 Sep 2017 09:06:10 -0000

This avoids the following error when the systemd DISTRO_FEATURE is
enabled, but the systemd PACKAGECONFIG is not:

  ERROR: bluez5-5.46-r0 do_package: SYSTEMD_SERVICE_bluez5 value
  bluetooth.service does not exist

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 2ae4553d48..1807aa7c96 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -132,7 +132,7 @@ FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TO
 
 RDEPENDS_${PN}-testtools += "python3 python3-dbus python3-pygobject"
 
-SYSTEMD_SERVICE_${PN} = "bluetooth.service"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'bluetooth.service', '', d)}"
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${PN} = "bluetooth"
 
-- 
2.12.0


