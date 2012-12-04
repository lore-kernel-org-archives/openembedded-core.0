Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tg29l-0001gN-I8
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 00:44:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 15:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,217,1355126400"; d="scan'208";a="229008986"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 15:29:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:29:17 -0800
Message-Id: <1354663759-20022-9-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
References: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4] wpa-supplicant: configured to work with libnl 3.2.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 23:44:17 -0000

From: Mihai Prica <mihai.prica@intel.com>

* Updated the configuration file for libnl-3
* Added python include dir path to configuration file

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc         | 1 +
 .../wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls                  | 2 +-
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb          | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
index 485a2dd..0966051 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
@@ -25,6 +25,7 @@ FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
+    echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> ${WORKDIR}/defconfig-gnutls
 	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
 }
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls
index e03338f..e041b4d 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls
@@ -81,7 +81,7 @@ CONFIG_DRIVER_HOSTAP=y
 CONFIG_DRIVER_WEXT=y
 
 # Driver interface for Linux drivers using the nl80211 kernel interface
-CONFIG_LIBNL20=y
+CONFIG_LIBNL32=y
 CONFIG_DRIVER_NL80211=y
 
 # Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
index 36ee25c..1150075 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-1.0.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "8650f6aa23646ef634402552d0669640"
 SRC_URI[sha256sum] = "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31feaf7c04482b9c"
-- 
1.8.0



