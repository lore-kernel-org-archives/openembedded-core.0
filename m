Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QeLi5-00033D-8x
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 08:35:45 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 6 Jul 2011
	08:31:49 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2011 08:31:45 +0200
Message-ID: <9af86371015974eb1098fa33b8604b449e70fb19.1309933834.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309933834.git.anders@chargestorm.se>
References: <cover.1309933834.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v6 1/2] task-base: remove modutils reference.
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
X-List-Received-Date: Wed, 06 Jul 2011 06:35:45 -0000
Content-Type: text/plain

Also remove the other kernel24 references.
Make everything dependent on kernel26 default.
Move the RDEPENDS- and RRECOMMENDS_task-base-kernel26 to _task-base.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-core/tasks/task-base.bb |   60 ++++++++-------------------------
 1 files changed, 15 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 3ff57ff..527bc6d 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r71"
+PR = "r72"
 
 inherit task
 
@@ -45,7 +45,6 @@ PACKAGES = ' \
             ${@base_contains("DISTRO_FEATURES", "raid", "task-base-raid", "",d)} \
             ${@base_contains("DISTRO_FEATURES", "zeroconf", "task-base-zeroconf", "", d)} \
             \
-            ${@base_contains("MACHINE_FEATURES","kernel26","task-base-kernel26","task-base-kernel24",d)} \
             '
 
 ALLOW_EMPTY = "1"
@@ -56,16 +55,6 @@ ALLOW_EMPTY = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 #
-# linux-hotplug or none
-#
-HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug","",d)} "
-
-#
-# pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
-#
-PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES', 'kernel26','pcmciautils','pcmcia-cs',d)} "
-
-#
 # those ones can be set in machine config to supply packages needed to get machine booting
 #
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
@@ -77,9 +66,9 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 RDEPENDS_task-base = "\
     task-distro-base \
     task-machine-base \
-    ${HOTPLUG} \
     \
-    ${@base_contains('MACHINE_FEATURES', 'kernel26','task-base-kernel26','task-base-kernel24',d)} \
+    sysfsutils \
+    module-init-tools \
     ${@base_contains('MACHINE_FEATURES', 'apm', 'task-base-apm', '',d)} \
     ${@base_contains('MACHINE_FEATURES', 'acpi', 'task-base-acpi', '',d)} \
     ${@base_contains('MACHINE_FEATURES', 'keyboard', 'task-base-keyboard', '',d)} \
@@ -112,6 +101,17 @@ RDEPENDS_task-base = "\
     "
 # bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
 
+
+RRECOMMENDS_task-base = "\
+    kernel-module-nls-utf8 \
+    kernel-module-input \
+    kernel-module-uinput \
+    kernel-module-rtc-dev \
+    kernel-module-rtc-proc \
+    kernel-module-rtc-sysfs \
+    kernel-module-rtc-sa1100 \
+    kernel-module-unix"
+
 RDEPENDS_task-base-extended = "\
     task-base \
     ${ADD_WIFI} \
@@ -155,27 +155,6 @@ RRECOMMENDS_task-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 RDEPENDS_task-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
 RRECOMMENDS_task-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
-RDEPENDS_task-base-kernel24 = "\
-    modutils-depmod"
-
-RDEPENDS_task-base-kernel26 = "\
-    sysfsutils \
-    module-init-tools"
-
-RRECOMMENDS_task-base-kernel24 = "\
-    kernel-module-input \
-    kernel-module-uinput"
-
-RRECOMMENDS_task-base-kernel26 = "\
-    kernel-module-nls-utf8 \
-    kernel-module-input \
-    kernel-module-uinput \
-    kernel-module-rtc-dev \
-    kernel-module-rtc-proc \
-    kernel-module-rtc-sysfs \
-    kernel-module-rtc-sa1100 \
-    kernel-module-unix"
-
 RDEPENDS_task-base-keyboard = "\
     keymaps"
 
@@ -214,28 +193,19 @@ RRECOMMENDS_task-base-alsa = "\
     kernel-module-snd-pcm-oss"
 
 RDEPENDS_task-base-pcmcia = "\
-    ${PCMCIA_MANAGER} \
+    pcmciautils \
     "
 #${@base_contains('DISTRO_FEATURES', 'wifi', 'prism-firmware', '',d)}
 #${@base_contains('DISTRO_FEATURES', 'wifi', 'spectrum-fw', '',d)}
 
 
 RRECOMMENDS_task-base-pcmcia = "\
-    ${@base_contains('MACHINE_FEATURES', 'kernel26', '${task-base-pcmcia26}', '${task-base-pcmcia24}',d)} \
     kernel-module-pcmcia \
     kernel-module-airo-cs \
     kernel-module-pcnet-cs \
     kernel-module-serial-cs \
     kernel-module-ide-cs \
     kernel-module-ide-disk \
-    "
-
-task-base-pcmcia24 = "\
-    ${@base_contains('DISTRO_FEATURES', 'wifi', 'hostap-modules-cs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'wifi', 'orinoco-modules-cs', '',d)} \
-    "
-
-task-base-pcmcia26 = "\
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hostap-cs', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
-- 
1.7.4.1



