Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PTW-0000NW-DL
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:44:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 03:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206305477"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 03:32:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:32:32 +0100
Message-Id: <ce8881dce0b0a8f4865aef8000598e9d4459c7f9.1345458715.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 5/7] qemu-config: split out shutdown icon to its own recipe
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
X-List-Received-Date: Mon, 20 Aug 2012 10:44:54 -0000

Cleanly shutting down the machine from Sato is useful on other machines,
not all of which have a power button that otherwise enables this, so
make it not specific to qemu* and add it to task-core-x11-sato.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb        |   11 +----------
 .../shutdown-desktop/shutdown-desktop.bb           |   20 ++++++++++++++++++++
 .../shutdown-desktop}/shutdown.desktop             |    0
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    3 ++-
 4 files changed, 23 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-sato/shutdown-desktop/shutdown-desktop}/shutdown.desktop (100%)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 036d281..351f8f3 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -10,8 +10,7 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 PR = "r25"
 
 SRC_URI = "file://distcc.sh \
-           file://exports \
-           file://shutdown.desktop"
+           file://exports"
 
 S = "${WORKDIR}"
 
@@ -20,14 +19,6 @@ do_install() {
 
     install -m 0755 distcc.sh ${D}${sysconfdir}/profile.d/
     install -m 0644 exports ${D}${sysconfdir}/
-    
-    install -d ${D}${datadir}/applications
-    install -m 0644 shutdown.desktop ${D}${datadir}/applications/
-}
-
-pkg_postinst_${PN} () {
-    grep -q qemuarm $D${sysconfdir}/hostname && \
-        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
 }
 
 RDEPENDS_${PN} = "distcc task-core-nfs-server oprofileui-server bash"
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
new file mode 100644
index 0000000..d0f507e
--- /dev/null
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Provides an icon to shut down the system cleanly"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://shutdown.desktop"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${datadir}/applications
+	install -m 0644 shutdown.desktop ${D}${datadir}/applications/
+}
+
+pkg_postinst_${PN} () {
+    grep -q qemuarm $D${sysconfdir}/hostname && \
+        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
+}
+
+inherit allarch
diff --git a/meta/recipes-bsp/qemu-config/qemu-config/shutdown.desktop b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
similarity index 100%
rename from meta/recipes-bsp/qemu-config/qemu-config/shutdown.desktop
rename to meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/tasks/task-core-x11-sato.bb
index cf294b3..be1ccb8 100644
--- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Sato Tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r32"
+PR = "r33"
 
 PACKAGES = "\
     task-core-x11-sato \
@@ -34,6 +34,7 @@ RDEPENDS_task-core-x11-sato = "\
     sato-icon-theme \
     settings-daemon \
     gtk-sato-engine \
+    shutdown-desktop \
     gthumb \
     x11vnc \
     libsdl \
-- 
1.7.9.5



