Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 734B3605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IER80Q019265 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:27:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W-FFHy-gtHJe
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:27:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IER31I019261
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:27:04 GMT
Message-ID: <1453127222.27999.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 14:27:02 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] bootimg/image-vm/image-live: Improve image dependencies
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
X-List-Received-Date: Mon, 18 Jan 2016 14:27:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now that image generation consists of separate tasks, we can improve
the dependencies in these classes. We can also incorporate the tasks
within do_image_complete instead of do_build so we have a specific task
for when the deploy directory is populated with images.

This fixes various expectations about do_image_completed and the way
I'd tried to use it to fix some sanity test problems.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index b324d89..ee8c744 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -193,4 +193,4 @@ def validate_disk_signature(d):
 
 DISK_SIGNATURE_GENERATED := "${@generate_disk_signature()}"
 
-addtask bootdirectdisk before do_build
+addtask bootdirectdisk before do_image_complete
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index ed9afb9..b174266 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -295,4 +295,4 @@ IMAGE_TYPEDEP_iso = "ext4"
 IMAGE_TYPEDEP_hddimg = "ext4"
 IMAGE_TYPES_MASKED += "iso hddimg"
 
-addtask bootimg before do_build
+addtask bootimg before do_image_complete
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index d2e8b85..aafa7d5 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -10,7 +10,7 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
 do_bootimg[depends] += "${INITRD_IMAGE}:do_image_complete"
-do_bootimg[depends] += "${PN}:do_image_complete"
+do_bootimg[depends] += "${PN}:do_image_ext4"
 
 inherit bootimg
 
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index d214bf8..6f3a55b 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -9,7 +9,7 @@ INITRD ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz' if '${INI
 do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE}:do_image_complete' if '${INITRD_IMAGE}' else ''}"
 
 # need to define the dependency and the ROOTFS for directdisk
-do_bootdirectdisk[depends] += "${PN}:do_image_complete"
+do_bootdirectdisk[depends] += "${PN}:do_image_ext4"
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
 # creating VM images relies on having a hddimg so ensure we inherit it here.
@@ -45,6 +45,6 @@ python do_vmimg() {
         bb.build.exec_func('create_qcow2_image', d)
 }
 
-addtask vmimg after do_bootdirectdisk before do_build
+addtask vmimg after do_bootdirectdisk before do_image_complete
 do_vmimg[depends] += "qemu-native:do_populate_sysroot"
 



