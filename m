Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4fvQ-00057B-HB
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 00:30:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2012 15:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,301,1344236400"; d="scan'208";a="184764267"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2012 15:18:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 15:18:42 -0700
Message-Id: <1345760322-26866-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2] build-appliance-image: Add vmx* files and build zip file
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
X-List-Received-Date: Thu, 23 Aug 2012 22:30:52 -0000

This commit adds the vmx* files needed to setup a VMware image,
this also packages the vmdk along with the vmx files.

v2: Add -f to ln to allow for overwrite

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb  |   21 ++++++++-
 .../Yocto_Build_Appliance.vmx                      |   52 ++++++++++++++++++++
 .../Yocto_Build_Appliance.vmxf                     |    8 +++
 3 files changed, 80 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
 create mode 100644 meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index bac7f80..6b00e64 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -20,7 +20,10 @@ IMAGE_FSTYPES = "vmdk"
 inherit core-image
 
 SRCREV = "73cdebf60df225ee10f2eb215935be3b61e1b831"
-SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
+           file://Yocto_Build_Appliance.vmx \
+           file://Yocto_Build_Appliance.vmxf \
+          "
 
 IMAGE_CMD_ext3_append () {
 	# We don't need to reserve much space for root, 0.5% is more than enough
@@ -68,3 +71,19 @@ python do_get_poky_src () {
     bb.build.exec_func('base_do_unpack', d)
 }
 addtask do_get_poky_src before do_rootfs
+
+create_bundle_files () {
+	cd ${WORKDIR}
+	mkdir -p Yocto_Build_Appliance
+	cp *.vmx* Yocto_Build_Appliance
+	ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
+	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
+	ln -sf ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip
+}
+
+python do_bundle_files() {
+    bb.build.exec_func('create_bundle_files', d)
+}
+
+addtask bundle_files after do_vmdkimg before do_build
+do_bundle_files[nostamp] = "1"
diff --git a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
new file mode 100644
index 0000000..b38127a
--- /dev/null
+++ b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
@@ -0,0 +1,52 @@
+.encoding = "UTF-8"
+displayname = "Yocto Build Appliance"
+guestos = "other"
+tools.syncTime = "FALSE"
+virtualhw.version = "8"
+config.version = "8"
+numvcpus = "2"
+cpuid.coresPerSocket = "1"
+vcpu.hotadd = "TRUE"
+mem.hotadd = "TRUE"
+memsize = "4096"
+svga.autodetect = "TRUE"
+pciBridge0.present = "TRUE"
+mks.enable3d = "TRUE"
+pciBridge4.present = "TRUE"
+pciBridge4.virtualDev = "pcieRootPort"
+pciBridge4.functions = "8"
+pciBridge5.present = "TRUE"
+pciBridge5.virtualDev = "pcieRootPort"
+pciBridge5.functions = "8"
+pciBridge6.present = "TRUE"
+pciBridge6.virtualDev = "pcieRootPort"
+pciBridge6.functions = "8"
+pciBridge7.present = "TRUE"
+pciBridge7.virtualDev = "pcieRootPort"
+pciBridge7.functions = "8"
+vmci0.present = "TRUE"
+floppy0.present = "TRUE"
+floppy0.fileType = "device"
+floppy0.autodetect = "FALSE"
+floppy0.startConnected = "FALSE"
+ide1:0.present = "TRUE"
+ide1:0.deviceType = "atapi-cdrom"
+ide1:0.autodetect = "TRUE"
+ide1:0.startConnected = "FALSE"
+ide0:0.present = "TRUE"
+ide0:0.deviceType = "disk"
+ide0:0.fileName = "Yocto_Build_Appliance.vmdk"
+usb.present = "TRUE"
+scsi0.virtualDev = "lsilogic"
+scsi0.present = "TRUE"
+ethernet0.present = "TRUE"
+ethernet0.virtualDev = "e1000"
+ethernet0.connectionType = "nat"
+ethernet0.startConnected = "TRUE"
+ethernet0.addressType = "generated"
+sound.present = "TRUE"
+sound.virtualDev = "es1371"
+sound.autodetect = "TRUE"
+extendedConfigFile = "Yocto_Build_Appliance.vmxf"
+sound.fileName = "-1"
+virtualHW.productCompatibility = "hosted"
diff --git a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf
new file mode 100644
index 0000000..ca3f026
--- /dev/null
+++ b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf
@@ -0,0 +1,8 @@
+<?xml version="1.0"?>
+<Foundry>
+<VM>
+<VMId type="string">52 e4 0b df 7b 70 21 f8-88 56 a7 26 47 43 95 93</VMId>
+<ClientMetaData>
+<clientMetaDataAttributes/>
+<HistoryEventList/></ClientMetaData>
+<vmxPathName type="string">Yocto_Build_Appliance.vmx</vmxPathName></VM></Foundry>
-- 
1.7.7.6



