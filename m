Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7685D770B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 20:26:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Oct 2015 13:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,619,1437462000"; d="scan'208";a="817460580"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 01 Oct 2015 13:26:17 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 20:23:29 +0000
Message-Id: <1c6dbb3997ae1ff49ebe227475b73e3eb072f12b.1443730882.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443730882.git.alejandro.hernandez@linux.intel.com>
References: <cover.1443730882.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] gma500_gfx: Avoid inserting gma500_gfx module for certain devices
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
X-List-Received-Date: Thu, 01 Oct 2015 20:26:18 -0000

The gma500_gfx driver will match certain devices on which it causes incorrect functionality,
we want to avoid inserting this module, basicallly blacklist it for specific hardware,
but still allow it to work on other hardware by default; usually when we have an already working system,
using udev rules would do the job, but since we are building it, it is impossible to blacklist
a driver when a certain udev rule matches, since rootfs isn't writeable at this point during boot time,
the solution is to use modprobe install, which runs a certain command instead of inserting a matching module,
this command needs to insert the module manually afterwards and have a flag --ignore-install
so it doesnt create an infinite loop executing itself everytime it wants to insert the module,
busybox's modprobe doesn't provide this functionality, so a small hack had to be used to avoid
the infite loop instead.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto-bsp/conf/machine/genericx86.conf            |  2 ++
 .../gma500-gfx-check/gma500-gfx-check.conf             |  2 ++
 .../gma500-gfx-check/gma500-gfx-check.sh               | 11 +++++++++++
 .../gma500-gfx-check/gma500-gfx-check_1.0.bb           | 18 ++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb

diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
index 2642cab..798b62ec 100644
--- a/meta-yocto-bsp/conf/machine/genericx86.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86.conf
@@ -6,3 +6,5 @@
 DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "gma500-gfx-check"
diff --git a/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
new file mode 100644
index 0000000..69f109e
--- /dev/null
+++ b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
@@ -0,0 +1,2 @@
+# Mimic modprobe's install funcitonality with busybox's modprobe
+install gma500_gfx lsmod | grep gma || { gma500_gfx_check.sh || modprobe gma500_gfx; }
diff --git a/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
new file mode 100644
index 0000000..0c7b3aa
--- /dev/null
+++ b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+# Check for devices we wish to avoid gma500_gfx for
+DEVICES="0x8119 0x4108"
+for DEVICE in $DEVICES; do
+    if udevadm trigger --subsystem-match=pci --verbose --attr-match=device=$DEVICE | grep "pci" >> /dev/null ; then
+        echo "Found $DEVICE, avoiding gma500_gfx module" >> /dev/kmsg;
+        exit 0
+    fi
+done
+exit 1
diff --git a/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
new file mode 100644
index 0000000..c68dd7b
--- /dev/null
+++ b/meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Intel gma500_gfx fix for certain hardware"
+DESCRIPTION = "Avoid inserting gma500_gfx module for certain hardware devices."
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+SRC_URI = "file://gma500-gfx-check.conf \
+	file://gma500-gfx-check.sh "
+
+do_install(){
+    install -d ${D}${sysconfdir}/modprobe.d/
+    install -m 755 ${WORKDIR}/gma500-gfx-check.sh ${D}${sysconfdir}/modprobe.d/gma500-gfx-check.sh
+    install -m 644 ${WORKDIR}/gma500-gfx-check.conf ${D}${sysconfdir}/modprobe.d/gma500-gfx-check.conf
+}
+
+FILES_${PN}="${sysconfdir}/modprobe.d/gma500-gfx-check.conf \
+             ${sysconfdir}/modprobe.d/gma500-gfx-check.sh"
+
+COMPATIBLE_MACHINE_genericx86 = "genericx86"
-- 
1.8.4.5


