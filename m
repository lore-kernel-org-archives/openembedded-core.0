Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 85C23612D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:29:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2013 01:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,767,1367996400"; d="scan'208";a="377673337"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2013 01:29:42 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 11:29:41 +0300
Message-Id: <1375086581-12129-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] bluez5: Only install .conf files if found
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
X-List-Received-Date: Mon, 29 Jul 2013 08:29:42 -0000

Bluez5 is migrating away from using separate .conf files
for different profiles. So only install profile configuration files
when they are found. This is needed so that the bluez5.inc file
can be used with latest bluez5 from git.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index fc78900..36a6061 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -39,9 +39,15 @@ EXTRA_OECONF = "\
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
-	install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	if [ -f ${S}/profiles/audio/audio.conf ]; then
+	    install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
+	fi
+	if [ -f ${S}/profiles/network/network.conf ]; then
+	    install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
+	fi
+	if [ -f ${S}/profiles/input/input.conf ]; then
+	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	fi
 	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
 	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
 }
-- 
1.7.11.7


