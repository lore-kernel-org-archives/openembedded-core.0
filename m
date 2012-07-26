Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuL7e-0001np-Ra
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:16:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 03:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127096729"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.37])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 03:04:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 11:04:35 +0100
Message-Id: <1343297075-29312-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] usbutils: avoid dependency on bash
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
X-List-Received-Date: Thu, 26 Jul 2012 10:16:48 -0000

By virtue of having #!/bin/bash, the usb-devices script declared that it
requires bash, however manual examinasion, checkbashisms and tests with
dash and busybox show that it doesn't contain any bashisms, so change
the script's header and remove the RDEPENDS on bash.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../usb-devices-avoid-dependency-on-bash.patch     |   30 ++++++++++++++++++++
 meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    7 +++--
 2 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
new file mode 100644
index 0000000..e3872ad
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils/usb-devices-avoid-dependency-on-bash.patch
@@ -0,0 +1,30 @@
+From 333d5fbbc03481f1aa222bd68c2609db168ae3e0 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Thu, 26 Jul 2012 10:37:32 +0100
+Subject: [PATCH] usb-devices: avoid dependency on bash
+
+By virtue of having #!/bin/bash this script declared that it requires
+bash, however manual examinasion, checkbashisms and tests with dash
+and busybox show that it doesn't contain any bashisms, so change the
+header to avoid the dependency.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ usb-devices |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usb-devices b/usb-devices
+index b2052e2..14a5358 100755
+--- a/usb-devices
++++ b/usb-devices
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # Copyright: 2009 Greg Kroah-Hartman <greg@kroah.com>
+ #            2009 Randy Dunlap <rdunlap@xenotime.net>
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
index 490b05a..04d1681 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
@@ -7,9 +7,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb zlib"
-PR = "r3"
+PR = "r4"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
+           file://usb-devices-avoid-dependency-on-bash.patch"
 
 SRC_URI[md5sum] = "49de2403b40bf3a9863faaa8d3858deb"
 SRC_URI[sha256sum] = "c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
@@ -26,4 +27,4 @@ PACKAGES += "${PN}-ids"
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 FILES_${PN}-ids = "${datadir}/usb*"
 
-RDEPENDS_${PN} = "${PN}-ids bash"
+RDEPENDS_${PN} = "${PN}-ids"
-- 
1.7.9.5



