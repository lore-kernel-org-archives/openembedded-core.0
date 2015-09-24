Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 503F1756C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 14:52:41 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so16729997igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 07:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iDmgh5tDpq7vpHSqYojLs1wQEFkR7qVX+vqM2XTG050=;
	b=UzajKGeCRUqtrEgD+j7NIZmSqFZ+S4XHNKqHKmrjuf/Up1Ti2fo5Pb9YbVXyOdfbS6
	x9Q+sEyhjLHKpIfcBv4PzKqbNTrY5W0cPvv+o5ggnvIORbxj5b5J7qYnX1bNia0Qvq7A
	abRpRCZxjflzT970tb0Q+MUygC2ANRPTNiiD/6+qeDbd3kFoEIOC9kZGUHFtb9AxYlMk
	vs0fd3Obx9DkuC9fZ3Og0a1QK3jOopklmhowP6EMBRuGLIXOAXzyHQxvtln/aaEXBkWR
	znouDAePW5qwyv7D0b2vhP2rWGOGPaEYLx3qrAnjiDUTGjo74XVPFjWtgoIkOM7kaAls
	8+Tw==
X-Gm-Message-State: ALoCoQmcIUw37mm6oKC7KqDiYUaG6aj+/NZmVzL/vOzIZeqn0LWLutBL/cOvBLo2CpcCMS7OX5pw
X-Received: by 10.50.124.71 with SMTP id mg7mr31866166igb.53.1443106361316;
	Thu, 24 Sep 2015 07:52:41 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FF19.dip0.t-ipconnect.de.
	[93.232.255.25]) by smtp.gmail.com with ESMTPSA id
	hh9sm5682902igb.18.2015.09.24.07.52.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 07:52:40 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 16:53:10 +0200
Message-Id: <1443106390-9148-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image types: add hdddirect
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
X-List-Received-Date: Thu, 24 Sep 2015 14:52:43 -0000

When image-vm.bbclass was introduced, it indirectly also introduced a
".hdddirect" image type based on boot-directdisk.bbclass. However, one
could only get that image when also enabling at least one of the
virtual machine images.

The .hdddirect images are useful by themselves. By registering
image-vm.bbclass as implementation of it, it becomes possible to
select them with:
  IMAGE_FSTYPES = "hdddirect"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-vm.bbclass    | 3 ++-
 meta/classes/image.bbclass       | 2 +-
 meta/classes/image_types.bbclass | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 0632667..5ddd1cb 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -18,7 +18,8 @@ inherit boot-directdisk
 IMAGE_TYPEDEP_vmdk = "ext4"
 IMAGE_TYPEDEP_vdi = "ext4"
 IMAGE_TYPEDEP_qcow2 = "ext4"
-IMAGE_TYPES_MASKED += "vmdk vdi qcow2"
+IMAGE_TYPEDEP_hdddirect = "ext4"
+IMAGE_TYPES_MASKED += "vmdk vdi qcow2 hdddirect"
 
 create_vmdk_image () {
     qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 86a98bb..7e6822c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -150,7 +150,7 @@ def build_live(d):
 IMAGE_TYPE_live = "${@build_live(d)}"
 inherit ${IMAGE_TYPE_live}
 
-IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2"], "image-vm", "", d)}'
+IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2", "hdddirect"], "image-vm", "", d)}'
 inherit ${IMAGE_TYPE_vm}
 
 python () {
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index afa2e8e..5036919 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def imagetypes_getdepends(d):
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        if type in ["vmdk", "vdi", "qcow2", "live", "iso", "hddimg"]:
+        if type in ["vmdk", "vdi", "qcow2", "hdddirect", "live", "iso", "hddimg"]:
             type = "ext4"
         basetype = type
         for ctype in ctypes:
@@ -227,6 +227,7 @@ IMAGE_TYPES = " \
     vmdk \
     vdi \
     qcow2 \
+    hdddirect \
     elf \
     wic wic.gz wic.bz2 wic.lzma \
 "
@@ -254,7 +255,7 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 IMAGE_EXTENSION_live = "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
 
 # The WICVARS variable is used to define list of bitbake variables used in wic code
-- 
2.1.4


