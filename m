Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8XAO-0005n6-Ak
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 15:58:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 06:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217553169"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 06:45:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 14:45:41 +0100
Message-Id: <490505c69d0444b240c91500024fb79d62d7d13f.1346679751.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346679751.git.paul.eggleton@linux.intel.com>
References: <cover.1346679751.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346679751.git.paul.eggleton@linux.intel.com>
References: <cover.1346679751.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] qemu-config: split out export of root via NFS to its own recipe
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
X-List-Received-Date: Mon, 03 Sep 2012 13:58:17 -0000

This need not be specific to qemu machines, allow it to be used
elsewhere in isolation.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb        |    7 ++-----
 .../devel-config/nfs-export-root.bb                |   17 +++++++++++++++++
 .../devel-config/nfs-export-root}/exports          |    0
 3 files changed, 19 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/devel-config/nfs-export-root.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/nfs-export-root}/exports (100%)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 06f2f32..3ed07df 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -9,18 +9,15 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 
 PR = "r25"
 
-SRC_URI = "file://distcc.sh \
-           file://exports"
+SRC_URI = "file://distcc.sh"
 
 S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}${sysconfdir}/profile.d
-
     install -m 0755 distcc.sh ${D}${sysconfdir}/profile.d/
-    install -m 0644 exports ${D}${sysconfdir}/
 }
 
-RDEPENDS_${PN} = "distcc packagegroup-core-nfs-server oprofileui-server bash"
+RDEPENDS_${PN} = "distcc oprofileui-server bash"
 
 inherit allarch
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
new file mode 100644
index 0000000..41259ac
--- /dev/null
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Enables NFS access from any host to the entire filesystem (for development purposes)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://exports"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${sysconfdir}
+	install -m 0644 exports ${D}${sysconfdir}/
+}
+
+RDEPENDS_${PN} = "task-core-nfs-server"
+
+inherit allarch
diff --git a/meta/recipes-bsp/qemu-config/qemu-config/exports b/meta/recipes-devtools/devel-config/nfs-export-root/exports
similarity index 100%
rename from meta/recipes-bsp/qemu-config/qemu-config/exports
rename to meta/recipes-devtools/devel-config/nfs-export-root/exports
-- 
1.7.9.5



