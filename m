Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 915116011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:38:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 01 Dec 2015 07:38:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5547741"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 07:38:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 17:35:56 +0200
Message-Id: <1448984156-13476-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] weston-init: add a native systemd unit file
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
X-List-Received-Date: Tue, 01 Dec 2015 15:38:05 -0000

Previously weston was started by systemd via a classic init script

[YOCTO #5582]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/wayland/weston-init.bb             | 13 ++++++++++---
 meta/recipes-graphics/wayland/weston-init/weston.service | 15 +++++++++++++++
 2 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index fc2e4f8..653541e 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -1,17 +1,22 @@
-SUMMARY = "Startup script for the Weston Wayland compositor"
+SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-SRC_URI = "file://init"
+SRC_URI = "file://init \
+           file://weston.service"
 
 S = "${WORKDIR}"
 
 do_install() {
 	install -d ${D}/${sysconfdir}/init.d
 	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+
+	install -d ${D}${systemd_system_unitdir}
+	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
 }
 
-inherit allarch update-rc.d distro_features_check
+inherit allarch update-rc.d distro_features_check systemd
+
 # rdepends on weston which depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
 
@@ -19,3 +24,5 @@ RDEPENDS_${PN} = "weston kbd"
 
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+
+SYSTEMD_SERVICE_${PN} = "weston.service"
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
new file mode 100644
index 0000000..4f1f7ff
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Weston Wayland compositor startup
+RequiresMountsFor=/run
+
+[Service]
+User=root
+EnvironmentFile=-/etc/default/weston
+Environment="XDG_RUNTIME_DIR=/run/user/root"
+ExecStartPre=/bin/mkdir -p /run/user/root
+ExecStartPre=/bin/chmod 0700 /run/user/root
+ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
+
+[Install]
+WantedBy=multi-user.target
+
-- 
2.6.2


