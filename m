Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05106706B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:39:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 07:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="484703257"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 07:38:51 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:38:33 +0300
Message-Id: <f878cf1ac3903a002b0da570647c031c464335e9.1429799661.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429799661.git.cristian.iorga@intel.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429799661.git.cristian.iorga@intel.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
Subject: [PATCH v5 1/4] bluez4: add proper systemd support
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
X-List-Received-Date: Thu, 23 Apr 2015 14:39:11 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 11c9616..948b495 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -13,9 +13,11 @@ RDEPENDS_${PN}-dev = "bluez-hcidump"
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
     ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
 "
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
 
 ASNEEDED = ""
 
@@ -24,7 +26,7 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig systemd
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
@@ -43,4 +45,6 @@ EXTRA_OECONF = "\
   --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
 "
 
+SYSTEMD_SERVICE_${PN} = "bluetooth.service"
+
 EXCLUDE_FROM_WORLD = "1"
-- 
2.1.0


