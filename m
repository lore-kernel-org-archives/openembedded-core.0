Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1T4cbO-0002Ds-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 20:57:58 +0200
Received: by pbcwy7 with SMTP id wy7so2002344pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=TsiOIfj5J0HdkQi1d16hmDmY285GDHdMLhmmeMmzkxE=;
	b=NCeGNA7tDrzeeyfqsv3wnnZI506WQucbsL2H3b1ZGafWRGnl7SWIUtGCypJHpKnUhM
	/V3hLh+Ry2Av6PdxBWP953mzSCrTUI73TbFfqlNPbmlgmZ1SGlxjWlBPsfwkVUhb8KAt
	ZJx/ADwygJ7QpG254StiGCZ8etVHsv5AANNeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=TsiOIfj5J0HdkQi1d16hmDmY285GDHdMLhmmeMmzkxE=;
	b=jgiWVrFkEL9z+HbeXatsYxOxPPwcw0abh2f1V5QjLtTsI3JC9EZC/McpJiRkuPPeuj
	6HT4rpq6rdo4ppEc+i2Mn9CnH4G6Mzm5pJ1m/26hgnByIOw3vwyaNE9BMnv6MvipcoVg
	vSUN5XbcIjco1ybA8tplljMB7m8JXgvRtJbctIUMCvbMrw1Pa+5F/1/vb9Ep2qgfLUg+
	S9Mhzy3tLKZmJzRKaIn7wU5hVhLluVgyocLeTpFhJ/EPR6DuHo5HgxnS/E7fPv7SrX7M
	r9/pnCo/BP5C7eXpvAg/sIGVYSceYjSsKBzF+k9/INON5lkBaznl+gdKNompItM6H5lx
	MmWQ==
Received: by 10.66.75.133 with SMTP id c5mr5432756paw.24.1345747551219;
	Thu, 23 Aug 2012 11:45:51 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id qn13sm6499613pbb.71.2012.08.23.11.45.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 11:45:50 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 11:45:14 -0700
Message-Id: <1345747514-23428-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnoUEiBr3bT4k6XKUx5/JQdNbHKUIzO5hseoLj8wbypSdsVAFuKFIppIhEKUXXfG6bO++jL
Subject: [PATCH] build-appliance-image: Add vmx* files and build zip file
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
X-List-Received-Date: Thu, 23 Aug 2012 18:57:58 -0000

This commit adds the vmx* files needed to setup a VMware image,
this also packages the vmdk along with the vmx files.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb  |   21 +++++++-
 .../Yocto_Build_Appliance.vmx                      |   52 ++++++++++++++++++++
 .../Yocto_Build_Appliance.vmxf                     |    8 +++
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
 create mode 100644 meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index bac7f80..31d271b 100644
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
+	ln -s ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
+	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
+	ln -s ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
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
1.7.9.5



