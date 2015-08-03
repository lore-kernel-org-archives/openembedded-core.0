Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC4C757A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 20:39:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2015 13:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,603,1432623600"; d="scan'208";a="741410615"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2015 13:39:33 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Mon,  3 Aug 2015 13:35:28 -0700
Message-Id: <1438634128-4347-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com
Subject: [PATCH 2/2] build-appliance-image: support for VirtualBox guest addtions
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
X-List-Received-Date: Mon, 03 Aug 2015 20:39:49 -0000

It is possible to run Build Appliance VM using VirtualBox.
User experience can be improved by installing VirtulaBox guest
additions. This patch installs kernel headers into the Build Appliance
VM, in order to make possible to rebuild the guest additons against the
running kernel.

The instructions on installing the guest additions are described in
the attached file README_vbox_guest_additions.txt.

[YOCTO #8074]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../README_vbox_guest_additions.txt                | 78 ++++++++++++++++++++++
 .../images/build-appliance-image_12.0.1.bb         |  4 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_vbox_guest_additions.txt

diff --git a/meta/recipes-core/images/build-appliance-image/README_vbox_guest_additions.txt b/meta/recipes-core/images/build-appliance-image/README_vbox_guest_additions.txt
new file mode 100644
index 0000000..7121804
--- /dev/null
+++ b/meta/recipes-core/images/build-appliance-image/README_vbox_guest_additions.txt
@@ -0,0 +1,78 @@
+
+Installing VirtualBox Guest Additions
+======================================
+
+In order to use VirtualBox guest additions, they have to be build
+first. They may have to be rebuilt again each time the VM kernel changes,
+or each time there is a new version of VirtualBox.
+The following describes steps needed to perform on the Host and the
+Guest VM (Build Appliance).
+
+Host:
+
+    1. If you don't already have them, download the guest additions matching
+       your VirtualBox version.
+
+       http://download.virtualbox.org/virtualbox/
+
+    2. Make sure VM has a CDROM drive, usually an IDE. Place the additions
+       file into the CDROM (VirtualBox Manager: VM Settings -> Storage)
+
+Guest VM:
+
+    1. Boot VM
+
+       Find your CDROM device (most likely /dev/hda for IDE) and mount it:
+
+          # cat /proc/sys/dev/cdrom/info | grep name
+          # mount -t iso9660  /dev/<name> /media/cdrom
+
+       i.e.:
+
+          # mount -t iso9660 /dev/hda /media/cdrom
+
+    2. Build the additions.
+       This is a two step process. Step 1 needs to be done only once.
+       Step 2 must be done each time a new version of guest additions is being
+       installed.
+
+       Step 1:  Build some necessary utilities, needed for step2.
+
+          # cd /lib/modules/<xx.xx.x>-yocto-standard/build
+          # make scripts
+
+        Step 2: Build the guest additions:
+
+          # /media/cdrom/VBoxLinuxAdditions.run --nox11
+
+        This will display some warning messages about unknown system, it is safe to ignore them.
+        Note: You can check the build log log if there are any errors:
+
+          # cat /var/volatile/log/vboxadd-install.log
+
+
+    3. Check if VirtualBox additions are running:
+
+          # /etc/init.d/vboxadd status
+
+        If the additions are not running, try to manually start them:
+
+          # /etc/init.d/vboxadd start
+
+    4. Check if the guest additions actually work, in particular folder sharing:
+
+          Host: Devices->Shared Folder Settings...
+                Choose any host folder and name it to your liking ("my_shared_folder")
+
+          Guest VM:
+              Create mount point for the shared folder, i.e.:
+
+                # mkdir ~/shared_folder
+
+              Mount the shared folder: (Watch out for spelling: it's vboxsf NOT vboxfs)
+
+                # mount -t vboxsf my_shared_folder ~/shared_folder
+
+              Verify mount, should see the contents of "my_shared_folder":
+
+                # ls shared_folder
diff --git a/meta/recipes-core/images/build-appliance-image_12.0.1.bb b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
index 8e71b36..a96e8a0 100644
--- a/meta/recipes-core/images/build-appliance-image_12.0.1.bb
+++ b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted kernel-headers"
 
 IMAGE_FEATURES += "x11-base package-management splash"
 
@@ -25,6 +25,7 @@ SRCREV ?= "d01cd53429b1c20f01dac97f1b9b659cb9dc9812"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
+           file://README_vbox_guest_additions.txt \
           "
 
 IMAGE_CMD_ext3_append () {
@@ -80,6 +81,7 @@ create_bundle_files () {
 	cd ${WORKDIR}
 	mkdir -p Yocto_Build_Appliance
 	cp *.vmx* Yocto_Build_Appliance
+	cp README* Yocto_Build_Appliance
 	ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
 	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
 	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
-- 
1.9.1


