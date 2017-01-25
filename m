Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CA99A731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:03:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2017 05:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="926476148"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 25 Jan 2017 05:03:42 -0800
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 15:03:35 +0200
Message-Id: <20170125130336.20833-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/2] bluez5: make readline support conditional.
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
X-List-Received-Date: Wed, 25 Jan 2017 13:03:43 -0000

Add readline support to PACKAGECONFIG. If readline needs if left out
of compilation, the bluez utilities which depend on readline are not
included in build or packages.

The defaults in PACKAGECONFIG are the same as before, so there should be
no change to current users.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 55a5055..ed75db2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -6,15 +6,16 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
-DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "obex-profiles"
+PACKAGECONFIG ??= "obex-profiles readline"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
+PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -42,7 +43,7 @@ EXTRA_OECONF = "\
 NOINST_TOOLS_READLINE ??= ""
 NOINST_TOOLS_EXPERIMENTAL ??= ""
 NOINST_TOOLS = " \
-    ${NOINST_TOOLS_READLINE} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'readline', '${NOINST_TOOLS_READLINE}', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'experimental', '${NOINST_TOOLS_EXPERIMENTAL}', '', d)} \
 "
 
-- 
2.9.3


