Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDO-0005Pe-Ug
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387535"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:35 -0700
Message-Id: <53a84b05b3226cebe636e316e88bd01bed9afc00.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/12] bluez4: Added new recipe 4.96 and removed 4.82 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Aug 2011 23:35:35 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Added new recipe 4.96 and removed 4.82 version and its files.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../fix-dfutool-usb-declaration-mismatch.patch     |   20 -----------
 .../bluez/bluez4-4.82/hid2hci_usb_init.patch       |   35 --------------------
 .../bluez/bluez4-4.82/sbc-thumb.patch              |   14 --------
 .../{bluez4-4.82 => bluez4-4.96}/bluetooth.conf    |    0
 .../bluez/{bluez4_4.82.bb => bluez4_4.96.bb}       |    6 +--
 5 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
 rename meta/recipes-connectivity/bluez/{bluez4-4.82 => bluez4-4.96}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.82.bb => bluez4_4.96.bb} (90%)

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
deleted file mode 100644
index 27dead0..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-# bluez4: add compile patch fixing some usb declaration mismatch
-# Author: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-# Date:   Thu Jan 29 16:52:21 2009 +0000
-#
-# Acquired from OpenEmbedded
-Upstream-Status: Pending
-
-Index: bluez-4.27/tools/dfutool.c
-===================================================================
---- bluez-4.27.orig/tools/dfutool.c
-+++ bluez-4.27/tools/dfutool.c
-@@ -59,7 +59,7 @@
- #endif
- 
- #ifdef NEED_USB_GET_BUSSES
--static inline struct usb_bus *usb_get_busses(void)
-+inline struct usb_bus *usb_get_busses(void)
- {
- 	return usb_busses;
- }
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
deleted file mode 100644
index e8a58e5..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-# Signed-off-by: Khem Raj <raj.khem@gmail.com>
-#
-# Use the new usb1 API for usb_init() and check for fails from 
-# usb_init (). Currently we see a crash on a system which does
-# not have USB because usb_init() fails and it cleans up all initialized
-# data (e.g. ctx) which is used in subsequent calls to libusb
-# We return immediately if usb_init() fails for some reason.
-
-Upstream-Status: Inappropriate [not used]
-
-Index: bluez-4.24/tools/hid2hci.c
-===================================================================
---- bluez-4.24.orig/tools/hid2hci.c	2008-10-25 23:40:34.000000000 -0700
-+++ bluez-4.24/tools/hid2hci.c	2008-12-29 22:06:04.000000000 -0800
-@@ -337,7 +337,7 @@
- int main(int argc, char *argv[])
- {
- 	struct device_info dev[16];
--	int i, opt, num, quiet = 0, mode = HCI;
-+	int i, ret, opt, num, quiet = 0, mode = HCI;
- 
- 	while ((opt = getopt_long(argc, argv, "+01qh", main_options, NULL)) != -1) {
- 		switch (opt) {
-@@ -361,8 +361,9 @@
- 	argc -= optind;
- 	argv += optind;
- 	optind = 0;
--
--	usb_init();
-+	ret = libusb_init();
-+	if (ret < 0)
-+		return ret;
- 
- 	num = find_devices(mode, dev, sizeof(dev) / sizeof(dev[0]));
- 	if (num <= 0) {
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
deleted file mode 100644
index 881cb9c..0000000
--- a/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-# Acquired from OpenEmbedded
-Upstream-Status: Inappropriate [embedded specific]
-
---- bluez/sbc/sbc_math.h~	2008-03-05 20:18:03.000000000 +0000
-+++ bluez/sbc/sbc_math.h	2008-10-27 13:39:27.000000000 +0000
-@@ -59,7 +59,7 @@
- 
- #define SBC_FIXED_0(val) { val = 0; }
- #define MUL(a, b)        ((a) * (b))
--#ifdef __arm__
-+#if defined(__arm__) && !defined(__thumb__)
- #define MULA(a, b, res) ({				\
- 		int tmp = res;			\
- 		__asm__(				\
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/bluetooth.conf b/meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez/bluez4-4.82/bluetooth.conf
rename to meta/recipes-connectivity/bluez/bluez4-4.96/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.82.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
similarity index 90%
rename from meta/recipes-connectivity/bluez/bluez4_4.82.bb
rename to meta/recipes-connectivity/bluez/bluez4_4.96.bb
index 9895006..ebd2849 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.82.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -19,13 +19,11 @@ PR = "r0"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
-  file://fix-dfutool-usb-declaration-mismatch.patch;patch=1 \
-  file://sbc-thumb.patch;patch=1 \
   file://bluetooth.conf \
 "
 
-SRC_URI[md5sum] = "b9e5de607e5e43c868c35c68fe6f189f"
-SRC_URI[sha256sum] = "75dc506f5346e1eb803f44294ae02406e806e309d9c9bda1de7ed235ff794b6d"
+SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
+SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
 S = "${WORKDIR}/bluez-${PV}"
 
 inherit autotools
-- 
1.7.6



