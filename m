Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UBTNm-0003AR-Lt
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:04:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2013 08:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="292377389"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2013 08:48:04 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 18:48:27 +0200
Message-Id: <1362156507-10571-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362156507-10571-1-git-send-email-cristian.iorga@intel.com>
References: <1362156507-10571-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/2] connman: Wired inteface provisioned via qemu
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
X-List-Received-Date: Fri, 01 Mar 2013 17:04:34 -0000

- connman-conf package re-implemented
- connman 1.12 introduces provisioning for
wired interfaces also;
- wired interface settings are read from
kernel cmdline if present;
- after that are passed to connman as a
config file
- for BA, this is not needed, as BA will
have a network infrastructure to work with.

Fixes [YOCTO #3227];
Fixes [YOCTO #3804];
Fixes [YOCTO #3843].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb     |   17 ++++++++++-------
 .../connman/connman-conf/qemuall/main.conf            |    3 ---
 .../connman/connman-conf/qemuall/wired-setup          |   16 ++++++++++++++++
 .../connman/connman-conf/qemuall/wired.config         |    8 ++++++++
 meta/recipes-connectivity/connman/connman/connman     |    3 +++
 5 files changed, 37 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 7c7ef26..7b99953 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -1,18 +1,21 @@
-#connman config to ignore wired interfaces on qemu machines
+#connman config to setup wired interface on qemu machines
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-SRC_URI_append_qemuall = " file://main.conf"
-
-PR = "r0"
+SRC_URI_append_qemuall = "file://wired.config \
+                          file://wired-setup \
+                         "
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
-    #Blacklist ethn network interface in case of qemu* machines
-    if test -e ${WORKDIR}/main.conf; then
+    #Configure Wired network interface in case of qemu* machines
+    if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
+        install -d ${D}${localstatedir}/lib/connman
+        install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
         install -d ${D}${sysconfdir}/connman
-        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
+        install -m 0755 ${WORKDIR}/wired-setup ${D}${sysconfdir}/connman
     fi
 }
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
deleted file mode 100644
index 01973e7..0000000
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-[General]
-
-NetworkInterfaceBlacklist = eth
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
new file mode 100644
index 0000000..135a6c1
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+CONFIGF=/var/lib/connman/wired.config
+
+# Extract wired network config from /proc/cmdline
+NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^ ]*\):\([^ ]*\):\([^ ]*\):\([^ ]*\).*$/\1\/\4\/\3/p'`
+
+# Check if eth0 is already set via kernel cmdline
+if [ "x$NET_CONF" = "x" ]; then
+	# Wired interface is not configured via kernel cmdline
+	# Remove connman config file template
+	rm ${CONFIGF}
+else
+	# Setup a connman config accordingly
+	sed -i -e "s|^\(IPv4 =\)|\1 ${NET_CONF}|" ${CONFIGF}
+fi
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
new file mode 100644
index 0000000..996e429
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
@@ -0,0 +1,8 @@
+[global]
+Name = Wired
+Description = Wired network configuration
+
+[service_ethernet]
+Type = ethernet
+IPv4 =
+MAC = 52:54:00:12:34:56
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index aed4a79..ffd7fac 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -32,6 +32,9 @@ do_start() {
 		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
 		EXTRA_PARAM="-I $ethn"
 	fi
+	if [ -f /etc/connman/wired-setup ] ; then
+		. /etc/connman/wired-setup
+	fi
 	$DAEMON $EXTRA_PARAM
 }
 
-- 
1.7.10.4



