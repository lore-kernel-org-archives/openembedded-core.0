Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB1572491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 09:03:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2015 02:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,662,1422950400"; d="scan'208";a="686749285"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2015 02:03:26 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 12:03:16 +0300
Message-Id: <d046583ec91ae2bdaa02705da97802f7e7abd34c.1430211653.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430211653.git.cristian.iorga@intel.com>
References: <cover.1430211653.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430211653.git.cristian.iorga@intel.com>
References: <cover.1430211653.git.cristian.iorga@intel.com>
Subject: [PATCH v6 1/3] bluez4: add proper systemd support
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
X-List-Received-Date: Tue, 28 Apr 2015 09:03:28 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc      | 4 +++-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 11c9616..9429d0a 100644
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
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index f900c7c..1023923 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -45,3 +45,5 @@ FILES_${PN}-dbg += "\
   ${libdir}/*/.debug \
   */udev/.debug \
   "
+
+SYSTEMD_SERVICE_${PN} = "bluetooth.service"
-- 
2.1.0


