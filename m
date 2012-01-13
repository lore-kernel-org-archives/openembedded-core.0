Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rlme0-0002s0-4w
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 20:18:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 11:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="56230655"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jan 2012 11:10:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 11:10:53 -0800
Message-Id: <0077b28e8866fbf06c410f6213df292d0c4d9846.1326481387.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326481387.git.josh@linux.intel.com>
References: <cover.1326481387.git.josh@linux.intel.com>
In-Reply-To: <cover.1326481387.git.josh@linux.intel.com>
References: <cover.1326481387.git.josh@linux.intel.com>
Subject: [PATCH 2/4] alsa-state: add alsa-state from oe classic
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
X-List-Received-Date: Fri, 13 Jan 2012 19:18:32 -0000

alsa-state adds an init script and configuration files to enable a
consistent and centralised mechanism for setting and restoring alsa
configuration.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   57 ++++++++++++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 ++++
 .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
 4 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
 create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
new file mode 100644
index 0000000..ecfa975
--- /dev/null
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -0,0 +1,57 @@
+# Copyright Matthias Hentges <devel@hentges.net> (c) 2007
+# License: MIT (see http://www.opensource.org/licenses/mit-license.php
+#               for a copy of the license)
+#
+# Filename: alsa-state.bb
+
+SUMMARY = "Alsa scenario files to enable alsa state restoration."
+DESCRIPTION = "Alsa Scenario Files - an init script and state files to restore \
+sound state at system boot and save it at system shut down."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PV = "0.2.0"
+PR = "r0"
+
+SRC_URI = "\
+  file://asound.conf \
+  file://asound.state \
+  file://alsa-state \
+"
+
+RDEPENDS = "alsa-utils-alsactl"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "alsa-state"
+INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
+
+do_install() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/alsa-state ${D}${sysconfdir}/init.d
+
+    install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/*.state ${D}${sysconfdir}
+}
+
+PACKAGES += "alsa-states"
+
+RRECOMMENDS_alsa-state = "alsa-states"
+
+FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
+CONFFILES_${PN} = "${sysconfdir}/asound.conf"
+
+FILES_alsa-states = "${sysconfdir}/*.state"
+
+pkg_postinst_${PN}() {
+	if test -z "$D"
+	then
+		if test -x /usr/sbin/alsactl
+		then
+			/usr/sbin/alsactl -f ${sysconfdir}/asound.state restore
+		fi
+		# INITSCRIPT_PARAMS changed, so remove the old and
+		# install the new setting.
+		update-rc.d -f ${INITSCRIPT_NAME} remove
+		update-rc.d ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+	fi
+}
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/alsa-state b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
new file mode 100755
index 0000000..84cdf03
--- /dev/null
+++ b/meta/recipes-bsp/alsa-state/alsa-state/alsa-state
@@ -0,0 +1,29 @@
+#! /bin/sh
+#
+# Copyright Matthias Hentges <devel@hentges.net> (c) 2007
+# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
+#
+# Filename: alsa-state
+# Date: 20070308 (YMD)
+
+
+asound_restore(){
+	echo "ALSA: Restoring mixer settings..."
+	if test -x /usr/sbin/alsactl -a -e /etc/asound.state
+	then
+		/usr/sbin/alsactl -f /etc/asound.state restore &
+	fi
+}
+
+asound_store(){
+	echo "ALSA: Storing mixer settings..."
+	if test -x /usr/sbin/alsactl
+	then
+		/usr/sbin/alsactl -f /etc/asound.state store
+	fi
+}
+
+case "$1" in
+start)		asound_restore ;;
+stop)		asound_store ;;
+esac
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
new file mode 100644
index 0000000..6be0242
--- /dev/null
+++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
@@ -0,0 +1,12 @@
+# default dmix configuration
+
+pcm.!default {
+    type plug
+    slave.pcm "dmix"
+}
+
+ctl.mixer0 {
+    type hw
+    card 0
+}
+
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/asound.state b/meta/recipes-bsp/alsa-state/alsa-state/asound.state
new file mode 100644
index 0000000..ddd1cce
--- /dev/null
+++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.state
@@ -0,0 +1 @@
+# Dummy file, do not delete
-- 
1.7.7.5



