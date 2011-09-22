Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R6esn-0007Xb-Ma
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 10:43:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Sep 2011 01:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,421,1312182000"; d="scan'208";a="59486808"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2011 01:38:29 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 16:38:35 +0800
Message-Id: <8ff7be8d70f27701840026ed3ba2431341b6508a.1316680595.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316680595.git.dexuan.cui@intel.com>
References: <cover.1316680595.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1316680595.git.dexuan.cui@intel.com>
References: <cover.1316680595.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] qemu-config: use pkg_postinst to generate the proper shutdown.desktop
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
X-List-Received-Date: Thu, 22 Sep 2011 08:43:49 -0000

[YOCTO #1507]

We need to remove the file qemuarm/shutdown.desktop, or else, on qemuarm,
due to the PACKAGE_ARCH overriding from all to qemuarm in base.bbclass,
the generated deb file will be stored at
tmp/deploy/deb/qemuarm/qemu-config_1.0-r21_allarch.deb rather than
tmp/deploy/deb/all/qemu-config_1.0-r21_all.deb, and the package qemu-config
won't be installable -- task-base finally rdepends on qemu-config, so we get
the do_rootfs failure:

The following packages have unmet dependencies:
|   task-base-extended: Depends: task-base but it is not going to be installed
| E: Broken packages

There is also a generic shutdown.desktop, we can keep it and use a proper
pkg_postinst to cope with the case of qemuarm.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb        |    7 ++++++-
 .../qemu-config/qemuarm/shutdown.desktop           |   10 ----------
 2 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config/qemuarm/shutdown.desktop

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 70a113e..ebf957a 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 
-PR = "r21"
+PR = "r22"
 
 SRC_URI = "file://distcc.sh \
            file://anjuta-remote-run \
@@ -32,6 +32,11 @@ do_install() {
     install qemu-autostart ${D}/etc/init.d/
 }
 
+pkg_postinst_${PN} () {
+    grep -q qemuarm $D${sysconfdir}/hostname && \
+        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
+}
+
 RDEPENDS_${PN} = "distcc dbus-x11 task-core-nfs-server oprofileui-server rsync bash"
 
 inherit update-rc.d allarch
diff --git a/meta/recipes-bsp/qemu-config/qemu-config/qemuarm/shutdown.desktop b/meta/recipes-bsp/qemu-config/qemu-config/qemuarm/shutdown.desktop
deleted file mode 100644
index b973d43..0000000
--- a/meta/recipes-bsp/qemu-config/qemu-config/qemuarm/shutdown.desktop
+++ /dev/null
@@ -1,10 +0,0 @@
-[Desktop Entry]
-Encoding=UTF-8
-Type=Application
-Name=Shutdown
-Comment=Close down the machine safely
-Exec=reboot
-Icon=system-shutdown
-Terminal=false
-Categories=Utility;
-StartupNotify=true
\ No newline at end of file
-- 
1.7.6



