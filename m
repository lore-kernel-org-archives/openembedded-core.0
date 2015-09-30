Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8D41F77053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:35:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 30 Sep 2015 08:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,613,1437462000"; 
	d="scan'208,217";a="781011014"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2015 08:35:16 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, joshua.lock@collabora.co.uk,
	akuster808@gmail.com
Date: Wed, 30 Sep 2015 18:37:42 +0300
Message-Id: <e636475eca83f69162538109ca09176a69d6a21c.1443624731.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1443624731.git.jussi.kukkonen@intel.com>
References: <cover.1443624731.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/3] bluez5: Use upstream D-Bus policy
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
X-List-Received-Date: Wed, 30 Sep 2015 15:35:18 -0000

The Bluez D-Bus policy is much too open and affects not just bluez but
all system services: Use upstream policy configuration instead.

This change has a chance of affecting other D-Bus services: the bug
that is fixed here may have hidden problems in other policies.

[YOCTO #8414]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc            |  5 ++---
 meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf | 17 -----------------
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 039c443..df42c88 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,7 +18,6 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-    file://bluetooth.conf \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
@@ -53,8 +52,8 @@ do_install_append() {
 	if [ -f ${S}/profiles/input/input.conf ]; then
 	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
 	fi
-	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
-	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
+
+	install -m 0644 ${S}/src/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
 
 	# Install desired tools that upstream leaves in build area
         for f in ${NOINST_TOOLS} ; do
diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
deleted file mode 100644
index 26845bb..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
+++ /dev/null
@@ -1,17 +0,0 @@
-<!-- This configuration file specifies the required security policies
-     for Bluetooth core daemon to work. -->
-
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-
-  <!-- ../system.conf have denied everything, so we just punch some holes -->
-
-  <policy context="default">
-    <allow own="org.bluez"/>
-    <allow send_destination="org.bluez"/>
-    <allow send_interface="org.bluez.Agent1"/>
-    <allow send_type="method_call"/>
-  </policy>
-
-</busconfig>
-- 
2.1.4


