Return-Path: <christian.ziethen@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 605AF734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:32:52 +0000 (UTC)
Received: by lbbzr7 with SMTP id zr7so159059059lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=R+LZetATyX6u8yJ7ocPEDtKm4ok/laGSgFizF0w5wwU=;
	b=akQUCXpSNvKcIk8KG7YFKNOh5djNvP+FjKZcBw+4lCevrf9RE1e4mRUvdtqRflbywe
	F+/jeEImCbWIh5S9q5bkwcqaYu1lBRglNHzN/5Ywi52j/sZvLJq2IOlIr6LXUepSDyTZ
	ylt+Ys25OZaK11YVwOzF5k0mky2R1SnDDWZMOc+ZaS7y7HXheRx+d1tL6CfB7V3q1k/P
	X6/RQewMBPe62qpQhSVKDWyyovLTfTR0B0rEGJW+70Bms99cdRUMyoh9lZ3otOqzwbNS
	/ZMxmtqBKf08K3DfmjqH9F8hC9CLgd9y2PbpVWPl5+RjNlJlbwgMR7KP0VZu4yf5wxNn
	z+4g==
X-Gm-Message-State: ALoCoQnsQSF+eaAt4LCFHGnNQ5CjtgbrUaepV9p8StVM7K41LPlMQ183SAZBIbF+8yam/8uLTnjk
X-Received: by 10.112.224.4 with SMTP id qy4mr8364399lbc.20.1437661971107;
	Thu, 23 Jul 2015 07:32:51 -0700 (PDT)
Received: from chzi-linux.enea.se (sestofw01.enea.se. [192.36.1.252])
	by smtp.googlemail.com with ESMTPSA id
	z1sm1060444lbj.11.2015.07.23.07.32.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 07:32:49 -0700 (PDT)
From: =?UTF-8?q?Christian=20Zieth=C3=A9n?= <christian.ziethen@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 16:32:28 +0200
Message-Id: <1437661949-9295-1-git-send-email-christian.ziethen@linaro.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] image: Support for qcow2
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
X-List-Received-Date: Thu, 23 Jul 2015 14:32:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for qcow2 image format. Implemented in the same way as
the previously existing vmdk and vdi solutions.

Signed-off-by: Christian Ziethén <christian.ziethen@linaro.org>
---
 meta/classes/boot-directdisk.bbclass |  2 +-
 meta/classes/image-vm.bbclass        | 12 ++++++++++--
 meta/classes/image.bbclass           |  2 +-
 meta/classes/image_types.bbclass     |  5 +++--
 meta/classes/sanity.bbclass          |  4 ++++
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index c576523..d256fff 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -63,7 +63,7 @@ DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
 SYSLINUX_TIMEOUT ?= "10"
 
-IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk" ,"vdi"], "true", "false", d)}'
+IS_VM = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "true", "false", d)}'
 
 boot_direct_populate() {
 	dest=$1
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index fdfd14f..28519c8 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -14,7 +14,8 @@ inherit boot-directdisk
 
 IMAGE_TYPEDEP_vmdk = "ext3"
 IMAGE_TYPEDEP_vdi = "ext3"
-IMAGE_TYPES_MASKED += "vmdk vdi"
+IMAGE_TYPEDEP_qcow2 = "ext3"
+IMAGE_TYPES_MASKED += "vmdk vdi qcow2"
 
 create_vmdk_image () {
     qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
@@ -26,11 +27,18 @@ create_vdi_image () {
     ln -sf ${IMAGE_NAME}.vdi ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vdi
 }
 
+create_qcow2_image () {
+    qemu-img convert -O qcow2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.qcow2
+    ln -sf ${IMAGE_NAME}.qcow2 ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.qcow2
+}
+
 python do_vmimg() {
     if 'vmdk' in d.getVar('IMAGE_FSTYPES', True):
         bb.build.exec_func('create_vmdk_image', d)
     if 'vdi' in d.getVar('IMAGE_FSTYPES', True):
-        bb.build.exec_func('create_vdi_image', d)        
+        bb.build.exec_func('create_vdi_image', d)
+    if 'qcow2' in d.getVar('IMAGE_FSTYPES', True):
+        bb.build.exec_func('create_qcow2_image', d)
 }
 
 addtask vmimg after do_bootdirectdisk before do_build
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e2995e2..ff2ed0d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,7 +132,7 @@ def build_live(d):
 IMAGE_TYPE_live = "${@build_live(d)}"
 inherit ${IMAGE_TYPE_live}
 
-IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi"], "image-vm", "", d)}'
+IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "image-vm", "", d)}'
 inherit ${IMAGE_TYPE_vm}
 
 python () {
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 588a474..cc789fc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        if type in ["vmdk", "vdi", "live", "iso", "hddimg"]:
+        if type in ["vmdk", "vdi", "qcow2", "live", "iso", "hddimg"]:
             type = "ext3"
         basetype = type
         for ctype in ctypes:
@@ -187,6 +187,7 @@ IMAGE_TYPES = " \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
     vmdk \
     vdi \
+    qcow2 \
     elf \
 "
 
@@ -213,5 +214,5 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 IMAGE_EXTENSION_live = "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2855941..6ad620b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -835,6 +835,10 @@ def check_sanity_everybuild(status, d):
     if 'vdi' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
         status.addresult("Error, IMAGE_FSTYPES vdi and live can't be built together\n")
 
+    # Check qcow2 and live can't be built together.
+    if 'qcow2' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
+        status.addresult("Error, IMAGE_FSTYPES qcow2 and live can't be built together\n")
+
     # Check /bin/sh links to dash or bash
     real_sh = os.path.realpath('/bin/sh')
     if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
-- 
2.1.4


