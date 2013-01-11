Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtcTk-0001sv-3W
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 12:08:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2013 02:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,451,1355126400"; d="scan'208";a="245132569"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 02:53:34 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 12:53:38 +0200
Message-Id: <1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
References: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH V3 2/2] connman-conf: configures connman in qemu machines
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
X-List-Received-Date: Fri, 11 Jan 2013 11:08:57 -0000

For qemu machines, connman should not configure
virtual wired interfaces. Wired interfaces (eth0)
are assigned static IP addresses by the virtual machine
manager (qemu). This packages places the eth0 interface in
a list of blacklisted interfaces, forbiding connman
administering wired interfaces for qemu machines.

Fixes [YOCTO #3227].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/layer.conf                                 |    1 +
 meta/conf/machine/include/qemu.inc                   |    2 ++
 meta/recipes-connectivity/connman/connman-conf.bb    |   18 ++++++++++++++++++
 .../connman/connman-conf/qemuall/main.conf           |    3 +++
 4 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 78ceae9..3259e5c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   shadow-securetty \
   opkg-config-base \
   netbase \
+  connman-conf \
   formfactor \
   xserver-xf86-config \
   pointercal \
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 5d59a7f..c1012ab 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -10,6 +10,8 @@ XSERVER ?= "xserver-xorg \
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
+MACHINEOVERRIDES .= ":qemuall"
+
 IMAGE_FSTYPES += "tar.bz2 ext3"
 
 ROOT_FLASH_SIZE = "280"
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
new file mode 100644
index 0000000..7c7ef26
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -0,0 +1,18 @@
+#connman config to ignore wired interfaces on qemu machines
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI_append_qemuall = " file://main.conf"
+
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+    #Blacklist ethn network interface in case of qemu* machines
+    if test -e ${WORKDIR}/main.conf; then
+        install -d ${D}${sysconfdir}/connman
+        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
+    fi
+}
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
new file mode 100644
index 0000000..01973e7
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
@@ -0,0 +1,3 @@
+[General]
+
+NetworkInterfaceBlacklist = eth
-- 
1.7.10.4



