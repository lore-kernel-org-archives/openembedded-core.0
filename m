Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8XAN-0005n6-HW
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 15:58:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 06:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217553151"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 06:45:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 14:45:40 +0100
Message-Id: <cc5ac825041b46a0eec1c1c85842a146999d3fa1.1346679751.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346679751.git.paul.eggleton@linux.intel.com>
References: <cover.1346679751.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346679751.git.paul.eggleton@linux.intel.com>
References: <cover.1346679751.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] qemu-config: split out shutdown icon to its own recipe
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
X-List-Received-Date: Mon, 03 Sep 2012 13:58:15 -0000

Cleanly shutting down the machine from Sato is useful on other machines,
not all of which have a power button that otherwise enables this, so
make it not specific to qemu* and add it to task-core-x11-sato.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb        |   11 +----------
 .../packagegroups/packagegroup-core-x11-sato.bb    |    1 +
 .../shutdown-desktop/shutdown-desktop.bb           |   20 ++++++++++++++++++++
 .../shutdown-desktop}/shutdown.desktop             |    0
 4 files changed, 22 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-sato/shutdown-desktop/shutdown-desktop}/shutdown.desktop (100%)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 4179fc0..06f2f32 100644
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
 
 RDEPENDS_${PN} = "distcc packagegroup-core-nfs-server oprofileui-server bash"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 5d781ae..53e15d3 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -37,6 +37,7 @@ RDEPENDS_${PN}-base = "\
     sato-icon-theme \
     settings-daemon \
     gtk-sato-engine \
+    shutdown-desktop \
     libsdl \
     ${NETWORK_MANAGER} \
     "
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
-- 
1.7.9.5



