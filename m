Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C25B573580
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:08:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 05:00:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,594,1418112000"; d="scan'208";a="686780967"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2015 05:08:18 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:08:04 +0200
Message-Id: <d7b99992c2f965913cdf23bb789277fe828a8b6e.1424178303.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424178303.git.cristian.iorga@intel.com>
References: <cover.1424178303.git.cristian.iorga@intel.com>
Subject: [PATCH v2 11/11] qt-mobility: select distro preference for bluez provider
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
X-List-Received-Date: Tue, 17 Feb 2015 13:08:45 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index ae1769d..5758e1e 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,9 +1,11 @@
 HOMEPAGE = "http://qt-project.org/"
 DEPENDS = "gstreamer util-linux"
 
+inherit bluetooth
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
-PACKAGECONFIG[bluetooth] = ",,bluez4"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG[bluez4] = ",,bluez4"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
 LICENSE = "LGPLv2.1"
@@ -65,7 +67,7 @@ maemo5-contacts_enabled = no
 maemo5-calendar_enabled = no
 maemo6-landmarks_enabled = no
 bme_enabled = no
-bluez_enabled = ${@bb.utils.contains('PACKAGECONFIG', 'bluetooth', 'yes', 'no', d)}
+bluez_enabled = ${@bb.utils.contains('PACKAGECONFIG', 'bluez4', 'yes', 'no', d)}
 proj_enabled = no
 gstreamer-photography_enabled = no
 gstreamer-appsrc_enabled = yes
-- 
2.1.0


