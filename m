Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qbz2A-00083P-9Z
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 19:58:42 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 29 Jun 2011
	19:55:00 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 19:54:54 +0200
Message-ID: <314e7646bbacaa6a4873226a57422145bccb151e.1309370038.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309370038.git.anders@chargestorm.se>
References: <cover.1309370038.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [RFC v3 PATCH 8/9] task-base: remove modutils reference.
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
X-List-Received-Date: Wed, 29 Jun 2011 17:58:42 -0000
Content-Type: text/plain

Also remove the other kernel24 references.
Make everything dependent on kernel26 default.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-core/tasks/task-base.bb |   24 ++++--------------------
 1 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 3ff57ff..62432b4 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -45,7 +45,7 @@ PACKAGES = ' \
             ${@base_contains("DISTRO_FEATURES", "raid", "task-base-raid", "",d)} \
             ${@base_contains("DISTRO_FEATURES", "zeroconf", "task-base-zeroconf", "", d)} \
             \
-            ${@base_contains("MACHINE_FEATURES","kernel26","task-base-kernel26","task-base-kernel24",d)} \
+            task-base-kernel26 \
             '
 
 ALLOW_EMPTY = "1"
@@ -58,12 +58,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 #
 # linux-hotplug or none
 #
-HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug","",d)} "
+HOTPLUG ?= ""
 
 #
 # pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
 #
-PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES', 'kernel26','pcmciautils','pcmcia-cs',d)} "
+PCMCIA_MANAGER ?= "pcmciautils"
 
 #
 # those ones can be set in machine config to supply packages needed to get machine booting
@@ -79,7 +79,7 @@ RDEPENDS_task-base = "\
     task-machine-base \
     ${HOTPLUG} \
     \
-    ${@base_contains('MACHINE_FEATURES', 'kernel26','task-base-kernel26','task-base-kernel24',d)} \
+    task-base-kernel26 \
     ${@base_contains('MACHINE_FEATURES', 'apm', 'task-base-apm', '',d)} \
     ${@base_contains('MACHINE_FEATURES', 'acpi', 'task-base-acpi', '',d)} \
     ${@base_contains('MACHINE_FEATURES', 'keyboard', 'task-base-keyboard', '',d)} \
@@ -155,17 +155,10 @@ RRECOMMENDS_task-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 RDEPENDS_task-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
 RRECOMMENDS_task-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
-RDEPENDS_task-base-kernel24 = "\
-    modutils-depmod"
-
 RDEPENDS_task-base-kernel26 = "\
     sysfsutils \
     module-init-tools"
 
-RRECOMMENDS_task-base-kernel24 = "\
-    kernel-module-input \
-    kernel-module-uinput"
-
 RRECOMMENDS_task-base-kernel26 = "\
     kernel-module-nls-utf8 \
     kernel-module-input \
@@ -221,21 +214,12 @@ RDEPENDS_task-base-pcmcia = "\
 
 
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



