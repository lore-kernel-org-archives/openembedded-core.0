Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5168F61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 15:01:43 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 08:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="276321849"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2013 08:01:43 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:01:37 +0300
Message-Id: <1375369300-13471-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 1/4] ofono: Add systemd support
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
X-List-Received-Date: Thu, 01 Aug 2013 15:01:43 -0000

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 21e564c..b0e8020 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -5,13 +5,18 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
 
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig update-rc.d systemd
 
 DEPENDS  = "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
 
+EXTRA_OECONF += "\
+    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
+"
+SYSTEMD_SERVICE_${PN} = "ofono.service"
+
 do_install_append() {
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
-- 
1.7.11.7


