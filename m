Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BD9F2771D5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Apr 2016 20:26:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 09 Apr 2016 13:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,460,1455004800"; d="scan'208";a="781627682"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 09 Apr 2016 13:26:08 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Apr 2016 13:11:51 -0700
Message-Id: <1460232711-23433-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH] build-appliance-image: Support for VirtualBox guest additions
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
X-List-Received-Date: Sat, 09 Apr 2016 20:26:08 -0000

Add support for VirtualBox guest additions.
The additions are built inside the Build Appliance VM.
For this to be possible, the environment for out-of-tree kernel module builds
must be present and set up properly.
A README file with detailed steps on how to build the guest additions is placed
in the home directory of the user "builder" as well.
The main purpose of the guest additions is to allow sharing folders between
the host and Build Appliance VM.

[YOCTO #8073]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../README_VirtualBox_Guest_Additions.txt          | 75 ++++++++++++++++++++++
 .../images/build-appliance-image_14.0.0.bb         | 14 +++-
 2 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_VirtualBox_Guest_Additions.txt

diff --git a/meta/recipes-core/images/build-appliance-image/README_VirtualBox_Guest_Additions.txt b/meta/recipes-core/images/build-appliance-image/README_VirtualBox_Guest_Additions.txt
new file mode 100644
index 0000000..e7298f2
--- /dev/null
+++ b/meta/recipes-core/images/build-appliance-image/README_VirtualBox_Guest_Additions.txt
@@ -0,0 +1,75 @@
+
+Installing VirtualBox Guest Additions
+=====================================
+
+In order to use VirtualBox guest additions, they have to be build
+first. They may have to be rebuilt each time the time you upgrade to
+a new version of VirtualBox.
+
+Make sure VM is configured with an Optical Drive. 
+
+Please follow these steps to install the VirtualBox Guest Additions on the
+Build Appliance VM:
+
+1.  Boot VM, select root "Terminal" instead of the default "Terminal <2>"
+
+2.  Insert Guest additions CD into VM optical drive:
+    VM menu "Devices"->"Optical Drives"-> Select "VBoxGuestAdditions<version>.iso"
+
+3.  Find your CDROM device. Typically it is /dev/hda for IDE. You can determine
+    the actual name <cdromedev> by viewing the cdrom info:
+
+        # cat /proc/sys/dev/cdrom/info
+
+    Mount the cdrom drive:
+        # mount -t iso9660 <cdromdev> /media/cdrom
+    i.e.:
+        # mount -t iso9660 /dev/hda /media/cdrom
+
+4. Build the additions:
+
+    First, we need to build of some prerequisite utilities.
+    (This is only needed to be done once)
+
+        # cd /lib/modules/<kernel-version>-yocto-standard/build
+        # make scripts
+
+    Now build the guest additions:
+
+        # /media/cdrom/VBoxLinuxAdditions.run --nox11
+
+    At this point, providing there were no build errors, the guest additions are 
+    built and installed.
+
+5. Check if vbox additions running:
+
+        # /etc/init.d/vboxadd status
+
+    If not running, try manually starting:
+
+        # /etc/init.d/vboxadd start
+
+6. Check if additons actually work, in particular folder sharing.
+
+    Host: Devices->Shared Folders->Shared Folder Settings...
+        Add any host folder and name it (i.e. "images")
+
+    Guest VM: create mount point for the shared folder, i.e.:
+
+        # mkdir ~/my-host
+
+    Mount the shared folder: (Watch out for spelling: it's vboxsf NOT vboxfs)
+
+        # mount -t vboxsf images ~/my-host
+
+    Verify mount, should see the contents of the shared folder:
+
+        # ls ~/my-host
+
+
+
+
+
+
+
+
diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index a34a621..eeb301d 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted kernel-dev kernel-devsrc "
 
 IMAGE_FEATURES += "x11-base package-management splash"
 
@@ -19,12 +19,13 @@ APPEND += "rootfstype=ext4 quiet"
 DEPENDS = "zip-native"
 IMAGE_FSTYPES = "vmdk"
 
-inherit core-image
+inherit core-image module-base
 
 SRCREV ?= "00c4c9bf0007b964dfa4559fe8fc8687f14cdec3"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
+           file://README_VirtualBox_Guest_Additions.txt \
           "
 BA_INCLUDE_SOURCES ??= "0"
 
@@ -49,6 +50,12 @@ fakeroot do_populate_poky_src () {
 		rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
 	fi
 
+	# Place the README_VirtualBox_Guest_Additions file in builders home folder.
+	cp ${WORKDIR}/README_VirtualBox_Guest_Additions.txt ${IMAGE_ROOTFS}/home/builder/
+
+	# Create a symlink, needed for out-of-tree kernel modules build
+	ln -snr ${IMAGE_ROOTFS}/usr/src/kernel ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
+
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
@@ -70,6 +77,9 @@ fakeroot do_populate_poky_src () {
 	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/poky
 	chmod -R ug+rw ${IMAGE_ROOTFS}/home/builder/poky
 
+	# Assume we will need CDROM to install guest additions
+	mkdir -p ${IMAGE_ROOTFS}/media/cdrom
+
 	# Allow builder to use sudo to setup tap/tun
 	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
 
-- 
1.9.1


