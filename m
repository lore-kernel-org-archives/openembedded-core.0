Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0759360667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:26:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2013 05:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,880,1363158000"; d="scan'208";a="351041562"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2013 05:27:12 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2013 15:26:34 +0300
Message-Id: <6a4980046a3175ecdd4216cdd75c754b0b0ffa16.1371471166.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371471166.git.laurentiu.palcu@intel.com>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1371471166.git.laurentiu.palcu@intel.com>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Mon, 17 Jun 2013 12:26:37 -0000

People using xserver-xorg that need to calibrate their touchscreen
devices would also need meta-oe. Bringing the recipes to oe-core will
make it easier for them.

Aditionaly, drop xterm RDEPENDS. Terminal is not needed to run the menu
item.

[YOCTO #4416]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   17 ++++++++
 .../xinput-calibrator/xinput-calibrator.service    |   11 ++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |   41 ++++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
new file mode 100644
index 0000000..9633fc5
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
@@ -0,0 +1 @@
+# replace with valid machine specific pointercal.xinput
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
new file mode 100644
index 0000000..8423640
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://pointercal.xinput"
+S = "${WORKDIR}"
+
+do_install() {
+    # Only install file if it has a contents
+    if [ -s ${S}/pointercal.xinput ]; then
+        install -d ${D}${sysconfdir}/
+        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
+    fi
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
new file mode 100644
index 0000000..2301876
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Loads xinput calibration data
+ConditionPathExists=/etc/pointercal.xinput
+Requires=display-manager.service
+After=display-manager.service
+
+[Service]
+ExecStart=/usr/bin/xinput_calibrator_once.sh
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
new file mode 100644
index 0000000..31e20f7
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
+DEPENDS = "virtual/libx11 libxi"
+
+PV = "0.7.5+git${SRCPV}"
+
+inherit autotools systemd
+
+SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
+           file://xinput-calibrator.service"
+
+S = "${WORKDIR}/git"
+
+# force native X11 ui as we don't have gtk+ in DEPENDS
+EXTRA_OECONF += "--with-gui=x11"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+
+    install -d ${D}${sysconfdir}/xdg/autostart
+    sed -i -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop
+    install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unitdir}/system
+    fi
+}
+
+FILES_${PN} += "${sysconfdir}/xdg/autostart"
+RDEPENDS_${PN} = "xinput"
+RRECOMMENDS_${PN} = "pointercal-xinput"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
-- 
1.7.9.5


