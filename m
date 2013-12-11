Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CAECA6A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:21:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2013 09:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="450651268"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2013 09:21:42 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 19:24:01 +0200
Message-Id: <52234531c2418aa83638ff3a91f8ae7776c2c717.1386782484.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386782484.git.cristian.iorga@intel.com>
References: <cover.1386782484.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386782484.git.cristian.iorga@intel.com>
References: <cover.1386782484.git.cristian.iorga@intel.com>
Subject: [PATCH 1/3] bluez5: upgrade to 5.12
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
X-List-Received-Date: Wed, 11 Dec 2013 17:21:44 -0000

- Configure options no longer available were removed.
- The content of patch directory was generic, so the name
of directory is now generic.
- Switched to xz format for tarball
(40% decrease in download size).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc                   | 11 +----------
 .../bluez5/{bluez5-5.10 => bluez5}/bluetooth.conf             |  0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb               |  5 -----
 meta/recipes-connectivity/bluez5/bluez5_5.12.bb               |  5 +++++
 4 files changed, 6 insertions(+), 15 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.10 => bluez5}/bluetooth.conf (100%)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.12.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 2e25d86..e08dff4 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -11,11 +11,10 @@ DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
 RCONFLICTS_${PN} = "bluez4"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} obex-profiles"
-PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 
 SRC_URI = "\
-    ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
+    ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     file://bluetooth.conf \
 "
 S = "${WORKDIR}/bluez-${PV}"
@@ -23,15 +22,7 @@ S = "${WORKDIR}/bluez-${PV}"
 inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "\
-  --disable-gstreamer \
-  --enable-usb \
   --enable-tools \
-  --enable-bccmd \
-  --enable-hid2hci \
-  --enable-dfutool \
-  --disable-hidd \
-  --disable-pand \
-  --disable-dund \
   --disable-cups \
   --enable-test \
   --enable-datafiles \
diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.10/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez5/bluez5-5.10/bluetooth.conf
rename to meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.10.bb b/meta/recipes-connectivity/bluez5/bluez5_5.10.bb
deleted file mode 100644
index 57dd4ff..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.10.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require bluez5.inc
-
-SRC_URI[md5sum] = "9bcc1d81e392e5be27fb11b1aad71abe"
-SRC_URI[sha256sum] = "39360c4c58158cb1d5dcc56d34a0a676d8868ef8c82b3083fc7396be5e8c3963"
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.12.bb b/meta/recipes-connectivity/bluez5/bluez5_5.12.bb
new file mode 100644
index 0000000..126ab11
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.12.bb
@@ -0,0 +1,5 @@
+require bluez5.inc
+
+SRC_URI[md5sum] = "5d37e581107b3d6f91b81194a5006407"
+SRC_URI[sha256sum] = "75ef574f15f356d03bd54f1a8ba26abe63bf3d1326a9fa12d63a762ddf40617e"
+
-- 
1.8.3.2


