Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCF76010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 19:37:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2013 12:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,952,1367996400"; d="scan'208";a="386259906"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.6])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2013 12:37:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2013 20:37:44 +0100
Message-Id: <1377459464-6312-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] xserver-nodm-init: improvements from meta-oe
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
X-List-Received-Date: Sun, 25 Aug 2013 19:37:48 -0000

Bring in some changes from the meta-oe version of this script in order
to bring them closer together. (Unfortunately it does not completely
supersede the recipes in meta-oe - there is still some unification to be
done between x11-common and xserver-common.)

* Add systemd support (with extensions for ROOTLESS_X)
* Remove sudo from RDEPENDS_${PN} since this hasn't been used by this
  for a long time
* Rearrange recipe slightly to make the order logical

A couple of additional improvements at the same time:
* Use ROOT_HOME for root's home directory
* Set short description in SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../x11-common/xserver-nodm-init.bb                | 38 +++++++++++++++++-----
 .../x11-common/xserver-nodm-init/xserver-nodm.conf |  1 +
 .../xserver-nodm-init/xserver-nodm.service         | 10 ++++++
 3 files changed, 41 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 8490c81..e4508a9 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -1,30 +1,52 @@
-DESCRIPTION = "Simple Xserver Init Script (no dm)"
+SUMMARY = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 PR = "r31"
-RDEPENDS_${PN} = "sudo xuser-account"
 
 SRC_URI = "file://xserver-nodm \
            file://Xusername \
-           file://gplv2-license.patch"
+           file://gplv2-license.patch \
+           file://xserver-nodm.service \
+           file://xserver-nodm.conf \
+"
 
 S = "${WORKDIR}"
 
+# Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit update-rc.d systemd
+
 do_install() {
-    install -d ${D}${sysconfdir}
     install -d ${D}${sysconfdir}/init.d
     install xserver-nodm ${D}${sysconfdir}/init.d
-    if [ "${ROOTLESS_X}" = "1" ] ; then
-        install -d ${D}${sysconfdir}/X11
-        install Xusername ${D}${sysconfdir}/X11
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${sysconfdir}/default
+        install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/system
+        if [ "${ROOTLESS_X}" = "1" ] ; then
+            sed -i 's!^HOME=.*!HOME=/home/xuser!' ${D}${sysconfdir}/default/xserver-nodm
+            sed -i 's!^User=.*!User=xuser!' ${D}${systemd_unitdir}/system/xserver-nodm.service
+        else
+            sed -i 's!^HOME=.*!HOME=${ROOT_HOME}!' ${D}${sysconfdir}/default/xserver-nodm
+            sed -i '/^User=/d' ${D}${systemd_unitdir}/system/xserver-nodm.service
+        fi
+    fi
+
+    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+        if [ "${ROOTLESS_X}" = "1" ] ; then
+            install -d ${D}${sysconfdir}/X11
+            install Xusername ${D}${sysconfdir}/X11
+        fi
     fi
 }
 
-inherit update-rc.d
+RDEPENDS_${PN} = "${@base_conditional('ROOTLESS_X', '1', 'xuser-account', '', d)}"
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
 
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
new file mode 100644
index 0000000..3c0582a
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
@@ -0,0 +1 @@
+HOME=/home/root
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
new file mode 100644
index 0000000..62d979f
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Xserver startup without a display manager
+
+[Service]
+User=root
+EnvironmentFile=/etc/default/xserver-nodm
+ExecStart=/etc/X11/Xserver
+
+[Install]
+Alias=display-manager.service
-- 
1.8.1.2


