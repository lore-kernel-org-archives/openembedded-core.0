Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 056486FE64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:33:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Sep 2014 08:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,506,1406617200"; d="scan'208";a="589904790"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2014 08:33:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Sep 2014 18:33:25 +0300
Message-Id: <10f436a0809be875a86ce7ce4656c0760f2eb972.1410449556.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410449556.git.cristian.iorga@intel.com>
References: <cover.1410449556.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1410449556.git.cristian.iorga@intel.com>
References: <cover.1410449556.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: upgraded VMware machine config
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
X-List-Received-Date: Thu, 11 Sep 2014 15:34:01 -0000

Build Appliance VMware configuration has
been modernized:
- Default disk is a SATA one;
- CDROM and Floppy drives removed, no real use;
- 3D acceleration not really present, removed;
This solves a warning that VMware
Player/Workstation was displaying at boot.
- IDE disk removed.
- guestOS has been set to a 64bits Linux.

Fixes [YOCTO #6680].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../Yocto_Build_Appliance.vmx                      | 58 ++++++++++------------
 .../Yocto_Build_Appliance.vmxf                     |  2 +-
 2 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
index b04a1b6..7da9c52 100644
--- a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
+++ b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx
@@ -1,17 +1,23 @@
 .encoding = "UTF-8"
-displayname = "Yocto Build Appliance"
-guestos = "other"
-tools.syncTime = "FALSE"
-virtualhw.version = "8"
 config.version = "8"
+virtualHW.version = "10"
 numvcpus = "2"
-cpuid.coresPerSocket = "1"
 vcpu.hotadd = "TRUE"
-mem.hotadd = "TRUE"
 memsize = "4096"
-svga.autodetect = "TRUE"
+mem.hotadd = "TRUE"
+sata0.present = "TRUE"
+sata0:0.present = "TRUE"
+sata0:0.fileName = "/mnt/Yo/yoctoproject/VMs/BA/Yocto_Build_Appliance.vmdk"
+ethernet0.present = "TRUE"
+ethernet0.virtualDev = "e1000"
+ethernet0.wakeOnPcktRcv = "FALSE"
+ethernet0.addressType = "generated"
+usb.present = "TRUE"
+ehci.pciSlotNumber = "0"
+sound.present = "TRUE"
+sound.fileName = "-1"
+sound.autodetect = "TRUE"
 pciBridge0.present = "TRUE"
-mks.enable3d = "TRUE"
 pciBridge4.present = "TRUE"
 pciBridge4.virtualDev = "pcieRootPort"
 pciBridge4.functions = "8"
@@ -25,28 +31,16 @@ pciBridge7.present = "TRUE"
 pciBridge7.virtualDev = "pcieRootPort"
 pciBridge7.functions = "8"
 vmci0.present = "TRUE"
-floppy0.present = "TRUE"
-floppy0.fileType = "device"
-floppy0.autodetect = "FALSE"
-floppy0.startConnected = "FALSE"
-ide1:0.present = "TRUE"
-ide1:0.deviceType = "atapi-cdrom"
-ide1:0.autodetect = "TRUE"
-ide1:0.startConnected = "FALSE"
-ide0:0.present = "TRUE"
-ide0:0.deviceType = "disk"
-ide0:0.fileName = "Yocto_Build_Appliance.vmdk"
-usb.present = "TRUE"
-scsi0.virtualDev = "lsilogic"
-scsi0.present = "TRUE"
-ethernet0.present = "TRUE"
-ethernet0.virtualDev = "e1000"
-ethernet0.connectionType = "bridged"
-ethernet0.startConnected = "TRUE"
-ethernet0.addressType = "generated"
-sound.present = "TRUE"
-sound.virtualDev = "es1371"
-sound.autodetect = "TRUE"
-extendedConfigFile = "Yocto_Build_Appliance.vmxf"
-sound.fileName = "-1"
+hpet0.present = "TRUE"
+usb.vbluetooth.startConnected = "TRUE"
+displayName = "Yocto Build Appliance"
+guestOS = "other3xlinux-64"
 virtualHW.productCompatibility = "hosted"
+gui.exitOnCLIHLT = "FALSE"
+powerType.powerOff = "soft"
+powerType.powerOn = "soft"
+powerType.suspend = "soft"
+powerType.reset = "soft"
+extendedConfigFile = "Yocto_Build_Appliance.vmxf"
+scsi0:0.present = "FALSE"
+floppy0.present = "FALSE"
diff --git a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf
index ca3f026..9e941ff 100644
--- a/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf
+++ b/meta/recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmxf
@@ -1,7 +1,7 @@
 <?xml version="1.0"?>
 <Foundry>
 <VM>
-<VMId type="string">52 e4 0b df 7b 70 21 f8-88 56 a7 26 47 43 95 93</VMId>
+<VMId type="string">52 a5 d8 cb ed 6c 85 48-cd 99 68 af cc 30 a0 98</VMId>
 <ClientMetaData>
 <clientMetaDataAttributes/>
 <HistoryEventList/></ClientMetaData>
-- 
1.9.1


