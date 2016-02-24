Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3C7771F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893686045"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:42 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:11 +0000
Message-Id: <89790e8f16e467e2e8bd931a00cd152dbf2b626f.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 07/10] oe-swupd-helpers: provide swupd-client required helper scripts and units
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:42 -0000

swup-client tries to call out to certain helper scripts during an update:
* before the update clr_pre_update.sh is called
* after the update systemdboot_updater.sh and kernel_updater.sh are called
* the systemd update-triggers.target is restarted once the update is complete

Clear Linux, the incubation OS for swupd, provides Clear specific
implementations of the systemd units in clr-systemd-units and the helper
scripts in clr-specialized-helpers.

This patch introduces a recipe which provides minimal, stub,
implementations of the required helper scripts and units. These will
need overriding by a product and will in future be improved to be generically
useful for OE-Core images.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/swupd/oe-swupd-helpers.bb    | 39 ++++++++++++++++++++++
 .../swupd/oe-swupd-helpers/catalog-trigger.service |  8 +++++
 .../swupd/oe-swupd-helpers/clr_pre_update.sh       | 16 +++++++++
 .../swupd/oe-swupd-helpers/kernel_updater.sh       |  9 +++++
 .../oe-swupd-helpers/ldconfig-trigger.service      |  8 +++++
 .../swupd/oe-swupd-helpers/systemdboot_updater.sh  | 10 ++++++
 .../oe-swupd-helpers/tmpfiles-trigger.service      |  8 +++++
 .../swupd/oe-swupd-helpers/update-triggers.target  |  5 +++
 8 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers.bb
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/catalog-trigger.service
 create mode 100755 meta/recipes-devtools/swupd/oe-swupd-helpers/clr_pre_update.sh
 create mode 100755 meta/recipes-devtools/swupd/oe-swupd-helpers/kernel_updater.sh
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/ldconfig-trigger.service
 create mode 100755 meta/recipes-devtools/swupd/oe-swupd-helpers/systemdboot_updater.sh
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/tmpfiles-trigger.service
 create mode 100644 meta/recipes-devtools/swupd/oe-swupd-helpers/update-triggers.target

diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers.bb b/meta/recipes-devtools/swupd/oe-swupd-helpers.bb
new file mode 100644
index 0000000..4690f21
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers.bb
@@ -0,0 +1,39 @@
+SUMMARY = "OE swupd helper files"
+DESCRIPTION = "swupd-client assumes the presence of various helpers, this is a minimal OE \
+implementation of the required scripts and systemd units. \
+Scripts are modified versions of those in clr-specialized-updaters and units are modified \
+versions of those in clr-systemd-config"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "file://update-triggers.target \
+           file://catalog-trigger.service \
+           file://ldconfig-trigger.service \
+           file://tmpfiles-trigger.service \
+           file://clr_pre_update.sh \
+           file://kernel_updater.sh \
+           file://systemdboot_updater.sh \
+           "
+
+inherit allarch distro_features_check systemd
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+do_install () {
+    install -d ${D}${systemd_system_unitdir}
+    for svc in `find ${WORKDIR} -maxdepth 1 -name *.target -o -name *.service`; do
+        install -m 0644 $svc ${D}${systemd_system_unitdir}/
+        sed -i -e s#/bin#${base_bindir}# ${D}${systemd_system_unitdir}/`basename $svc`
+        sed -i -e s#/sbin#${base_sbindir}# ${D}${systemd_system_unitdir}/`basename $svc`
+        sed -i -e s#/lib#${base_libdir}# ${D}${systemd_system_unitdir}/`basename $svc`
+    done
+
+    # NOTE: swupd-client hard-codes /usr/bin
+    install -d ${D}/usr/bin
+    for helper in `find ${WORKDIR} -maxdepth 1 -name *.sh`; do
+        install $helper ${D}/usr/bin/
+    done
+}
+
+RDEPENDS_${PN} += "bash"
+FILES_${PN} += "${systemd_system_unitdir}"
\ No newline at end of file
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/catalog-trigger.service b/meta/recipes-devtools/swupd/oe-swupd-helpers/catalog-trigger.service
new file mode 100644
index 0000000..8266174
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/catalog-trigger.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Rebuild journal catalog
+Documentation=man:journalctl(1)
+BindsTo=update-triggers.target
+
+[Service]
+Type=oneshot
+ExecStart=/bin/journalctl --update-catalog
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/clr_pre_update.sh b/meta/recipes-devtools/swupd/oe-swupd-helpers/clr_pre_update.sh
new file mode 100755
index 0000000..6302090
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/clr_pre_update.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+set -u
+
+#######################################
+# Clear Linux General Purpose Pre-update helper script
+#  This is a script meant to update state information external to what swupd updates.
+#  The specific content of this script will vary over time, according to the state
+#  change needed
+#######################################
+
+UPDATE_NAME="Pre-update"
+VERSION="3.60"
+
+### Enter your script here
+echo "Running script '$UPDATE_NAME'"
+exit 0
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/kernel_updater.sh b/meta/recipes-devtools/swupd/oe-swupd-helpers/kernel_updater.sh
new file mode 100755
index 0000000..b0d5335
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/kernel_updater.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+#######################################
+# This script will be called after an updated kernel has been installed
+#######################################
+
+### Enter your script here
+echo "Running script 'kernel_updater.sh'"
+exit 0
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/ldconfig-trigger.service b/meta/recipes-devtools/swupd/oe-swupd-helpers/ldconfig-trigger.service
new file mode 100644
index 0000000..224ac7a
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/ldconfig-trigger.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Rebuild Dynamic Linker Cache
+Documentation=man:ldconfig(8)
+BindsTo=update-triggers.target
+
+[Service]
+Type=oneshot
+ExecStart=/sbin/ldconfig -X
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/systemdboot_updater.sh b/meta/recipes-devtools/swupd/oe-swupd-helpers/systemdboot_updater.sh
new file mode 100755
index 0000000..470cd6e
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/systemdboot_updater.sh
@@ -0,0 +1,10 @@
+#!/bin/bash
+
+#######################################
+# systemd bootloader installer
+# This script will be called after an updated bootloader has been installed
+#######################################
+
+### Enter your script here
+echo "Running script 'systemdboot_updater.sh'"
+exit 0
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/tmpfiles-trigger.service b/meta/recipes-devtools/swupd/oe-swupd-helpers/tmpfiles-trigger.service
new file mode 100644
index 0000000..71009fe
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/tmpfiles-trigger.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Create tmpfiles
+Documentation=man:systemd-tmpfiles(8)
+BindsTo=update-triggers.target
+
+[Service]
+Type=oneshot
+ExecStart=/bin/systemd-tmpfiles --create
diff --git a/meta/recipes-devtools/swupd/oe-swupd-helpers/update-triggers.target b/meta/recipes-devtools/swupd/oe-swupd-helpers/update-triggers.target
new file mode 100644
index 0000000..d104b00
--- /dev/null
+++ b/meta/recipes-devtools/swupd/oe-swupd-helpers/update-triggers.target
@@ -0,0 +1,5 @@
+[Unit]
+Description=Post system update triggers
+Wants=ldconfig-trigger.service
+Wants=catalog-trigger.service
+Wants=tmpfiles-trigger.service
-- 
2.5.0


