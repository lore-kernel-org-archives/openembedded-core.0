Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PTX-0000Oc-Uu
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:44:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 03:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206305484"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 03:32:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:32:33 +0100
Message-Id: <12aa265ae9db476ca1a4647029f562e7a231dcee.1345458715.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 6/7] qemu-config: split out export of root via NFS to its own recipe
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
index 351f8f3..3ed07df 100644
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
 
-RDEPENDS_${PN} = "distcc task-core-nfs-server oprofileui-server bash"
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



