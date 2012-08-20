Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PTa-0000NW-Cu
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:44:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2012 03:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206305496"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 03:32:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:32:34 +0100
Message-Id: <daf70360948a15ca2be324a166a84cab97dde46c.1345458715.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1345458715.git.paul.eggleton@linux.intel.com>
References: <cover.1345458715.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 7/7] qemu-config: turn into distcc-config and a task
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
X-List-Received-Date: Mon, 20 Aug 2012 10:44:55 -0000

* Create a new task-core-device-devel which pulls in everything that
  qemu-config used to
* Move the remainder of qemu-config to distcc-config and allow
  DISTCC_HOSTS to be configured via a variable of the same name
* Use SUMMARY instead of DESCRIPTION for single-line description since
  DESCRIPTION is defaulted from SUMMARY if not set

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../devel-config/distcc-config.bb}                 |   20 +++++++++++---------
 .../devel-config/distcc-config}/distcc.sh          |    2 +-
 .../tasks/task-core-device-devel.bb                |   18 ++++++++++++++++++
 3 files changed, 30 insertions(+), 10 deletions(-)
 rename meta/{recipes-bsp/qemu-config/qemu-config.bb => recipes-devtools/devel-config/distcc-config.bb} (44%)
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/distcc-config}/distcc.sh (57%)
 create mode 100644 meta/recipes-devtools/tasks/task-core-device-devel.bb

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
similarity index 44%
rename from meta/recipes-bsp/qemu-config/qemu-config.bb
rename to meta/recipes-devtools/devel-config/distcc-config.bb
index 3ed07df..8deaa66 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-devtools/devel-config/distcc-config.bb
@@ -1,23 +1,25 @@
-DESCRIPTION = "Adds scripts to use distcc on the host system under qemu"
+SUMMARY = "Sets up distcc for compilation on the target device"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
-
-PR = "r25"
-
 SRC_URI = "file://distcc.sh"
 
 S = "${WORKDIR}"
 
+# Default to the host machine for a running qemu session
+DISTCC_HOSTS ?= "192.168.7.1"
+
+do_configure() {
+	sed -i "s%@DISTCC_HOSTS@%${DISTCC_HOSTS}%" distcc.sh
+}
+
 do_install() {
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0755 distcc.sh ${D}${sysconfdir}/profile.d/
+	install -d ${D}${sysconfdir}/profile.d
+	install -m 0755 distcc.sh ${D}${sysconfdir}/profile.d/
 }
 
-RDEPENDS_${PN} = "distcc oprofileui-server bash"
+RDEPENDS_${PN} = "distcc"
 
 inherit allarch
diff --git a/meta/recipes-bsp/qemu-config/qemu-config/distcc.sh b/meta/recipes-devtools/devel-config/distcc-config/distcc.sh
similarity index 57%
rename from meta/recipes-bsp/qemu-config/qemu-config/distcc.sh
rename to meta/recipes-devtools/devel-config/distcc-config/distcc.sh
index a2b543d..b420593 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config/distcc.sh
+++ b/meta/recipes-devtools/devel-config/distcc-config/distcc.sh
@@ -1,4 +1,4 @@
-DISTCC_HOSTS="192.168.7.1"
+DISTCC_HOSTS="@DISTCC_HOSTS@"
 #DISTCC_VERBOSE="1"
 
 export DISTCC_HOSTS
diff --git a/meta/recipes-devtools/tasks/task-core-device-devel.bb b/meta/recipes-devtools/tasks/task-core-device-devel.bb
new file mode 100644
index 0000000..f4b608b
--- /dev/null
+++ b/meta/recipes-devtools/tasks/task-core-device-devel.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Provides a small set of tools for development on the device"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+
+RPROVIDES_${PN} = "qemu-config"
+RREPLACES_${PN} = "qemu-config"
+
+RDEPENDS_${PN} = "\
+    distcc-config \
+    oprofileui-server \
+    nfs-export-root \
+    anjuta-remote-run \
+    bash \
+    "
+
-- 
1.7.9.5



