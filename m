Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QexuT-0002EU-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:23:05 +0200
Received: from mizar.localdomain (87.5.248.98) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A02472DA8; Fri, 8 Jul 2011 01:13:16 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 01:11:55 +0200
Message-Id: <54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310079506.git.andrea.adami@gmail.com>
References: <cover.1310079506.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1310079506.git.andrea.adami@gmail.com>
References: <cover.1310079506.git.andrea.adami@gmail.com>
Subject: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Thu, 07 Jul 2011 23:23:05 -0000

* from org.openembedded.dev (oe-classic)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 943252a..03b321d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -14,8 +14,20 @@ python __anonymous () {
     	depends = bb.data.getVar("DEPENDS", d, 1)
     	depends = "%s u-boot-mkimage-native" % depends
     	bb.data.setVar("DEPENDS", depends, d)
+
+    image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
+    if image != '' and image is not None:
+        bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+
+    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
+
+    if machine_kernel_pr:
+        bb.data.setVar('PR', machine_kernel_pr, d)
 }
 
+INITRAMFS_IMAGE ?= ""
+INITRAMFS_TASK ?= ""
+
 inherit kernel-arch deploy
 
 PACKAGES_DYNAMIC += "kernel-module-*"
@@ -179,8 +191,18 @@ kernel_do_configure() {
 		cp "${WORKDIR}/defconfig" "${S}/.config"
 	fi
         yes '' | oe_runmake oldconfig
+
+	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
+		for img in cpio.gz cpio.lzo cpio.lzma; do
+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img"
+			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
+		fi
+		done
+	fi
 }
 
+kernel_do_configure[depends] += "${INITRAMFS_TASK}"
+
 do_menuconfig() {
         export DISPLAY='${DISPLAY}'
         export DBUS_SESSION_BUS_ADDRESS='${DBUS_SESSION_BUS_ADDRESS}'
-- 
1.7.3.4



