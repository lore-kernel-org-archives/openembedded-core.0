Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PTQ-0000IZ-MX
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:44:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 03:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206305461"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 03:32:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:32:30 +0100
Message-Id: <760b2d833e0a9267cfac81e931918d8e7ef7fcc7.1345458715.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 3/7] qemu-config: split out anjuta-remote-run
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
X-List-Received-Date: Mon, 20 Aug 2012 10:44:44 -0000

Given that support for Anjuta is unlikely to be needed by everyone and
is by no means specific to qemu, split it out to a separate recipe. The
following changes were made in the process:

Also depend on dbus instead of dbus-x11 since dbus-launch is now back in
he main dbus package

Part of the fix for [YOCTO #1690].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb        |    6 +-----
 .../devel-config/anjuta-remote-run.bb              |   19 +++++++++++++++++++
 .../anjuta-remote-run}/anjuta-remote-run           |    0
 3 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/devel-config/anjuta-remote-run.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/anjuta-remote-run}/anjuta-remote-run (100%)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index f3a29d1..3e44d7c 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -10,7 +10,6 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 PR = "r25"
 
 SRC_URI = "file://distcc.sh \
-           file://anjuta-remote-run \
            file://exports \
            file://shutdown.desktop \
            file://qemu-autostart"
@@ -23,9 +22,6 @@ do_install() {
     install -m 0755 distcc.sh ${D}${sysconfdir}/profile.d/
     install -m 0644 exports ${D}${sysconfdir}/
     
-    install -d ${D}${bindir}
-    install -m 0755 anjuta-remote-run ${D}${bindir}/
-    
     install -d ${D}${datadir}/applications
     install -m 0644 shutdown.desktop ${D}${datadir}/applications/
 
@@ -38,7 +34,7 @@ pkg_postinst_${PN} () {
         sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
 }
 
-RDEPENDS_${PN} = "distcc ${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)} task-core-nfs-server oprofileui-server rsync bash"
+RDEPENDS_${PN} = "distcc task-core-nfs-server oprofileui-server bash"
 
 inherit update-rc.d allarch
 
diff --git a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
new file mode 100644
index 0000000..51fdf9e
--- /dev/null
+++ b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Provides on-device script for interaction with the Anjuta IDE"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://anjuta-remote-run"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 anjuta-remote-run ${D}${bindir}/
+}
+
+PACKAGES = "${PN}"
+RDEPENDS_${PN} = "dbus rsync"
+
+inherit allarch
+
diff --git a/meta/recipes-bsp/qemu-config/qemu-config/anjuta-remote-run b/meta/recipes-devtools/devel-config/anjuta-remote-run/anjuta-remote-run
similarity index 100%
rename from meta/recipes-bsp/qemu-config/qemu-config/anjuta-remote-run
rename to meta/recipes-devtools/devel-config/anjuta-remote-run/anjuta-remote-run
-- 
1.7.9.5



