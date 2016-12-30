Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 57E0E6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2016 21:38:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 30 Dec 2016 13:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,432,1477983600"; d="scan'208";a="917553107"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 30 Dec 2016 13:38:28 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2016 13:35:32 -0800
Message-Id: <1483133732-17872-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483133732-17872-1-git-send-email-juro.bystricky@intel.com>
References: <1483133732-17872-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH 1/1] build-appliance-image: support for Toaster
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
X-List-Received-Date: Fri, 30 Dec 2016 21:38:28 -0000

Various changes needed to enable to run Toaster in the
Build Appliance:

1. Pre-install packages as specified by the file
   "bitbake/toaster-requirements.txt"
2. Include pip3 in the image
3. Include tzdata in the image (needed by django)
4. Bump SRCREV to a commit with proper settings.py (ALLOWED_HOSTS)
   for Django 1.8.16
5. Added README_VirtualBox_Toaster.txt to provide steps for
   configuring VirtualBox network adapters (NAT or Bridged)
   and steps to launch Toaster

[YOCTO#10767]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../README_VirtualBox_Toaster.txt                  | 78 ++++++++++++++++++++++
 .../images/build-appliance-image_15.0.0.bb         | 18 ++++-
 2 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt

diff --git a/meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt b/meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt
new file mode 100644
index 0000000..a0aede2
--- /dev/null
+++ b/meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt
@@ -0,0 +1,78 @@
+
+Running Toaster in VirtualBox
+=============================
+
+Toaster is launched via the command in VM:
+
+    $ source toaster start webport=<IPADDR:PORT>
+
+The interaction with Toaster web server is done via a host internet
+browser.
+The particular steps depend on the actual networking being used
+by the VirtualBox.
+
+
+Bridged Network
+===============
+
+Find out your VM network IP address:
+
+    $ ifconfig
+
+IP address is listed under eth0 inet addr.
+It should be something like:
+   inet addr:192.168.1.18
+
+Launch the Toaster web server in VM:
+
+    $ source toaster start webport=192.168.1.18:8000
+
+Interact with the Toaster web server with your host browser using URL:
+
+    http://192.168.1.18:8000
+
+
+NAT Network
+===========
+Find out your VM network IP address:
+
+    $ ifconfig
+
+IP address is listed under eth0 inet addr.
+For NAT network it should be something like:
+   inet addr:10.0.2.15
+
+When using NAT network, the VM web server can be accessed using
+Port Forwarding.
+
+Using the VirtualBox GUI, navigate to:
+    Settings->Network->Adapter1
+
+You should set:
+    Attached to: NAT
+
+Select "Advanced", click on "Port Forwarding"
+
+This will open a new dialog box "Port Forwarding Rules".
+Create a new rule that looks like this:
+
+| Name  | Protocol | Host IP | Host Port | Guest IP | Guest Port |
++-------+----------+---------+-----------+----------+------------+
+| Rule1 | TCP      |         | 8000      |          |  8000      |
+------------------------------------------------------------------
+
+Now we can launch the Toaster web server in VM:
+
+    $ source toaster start webport=10.0.2.15:8000
+
+Interact with the Toaster web server with your host browser using URL:
+
+    http://127.0.0.1:8000
+
+
+
+
+
+
+
+
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 5bb6555..34327e3 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An image containing the build system itself"
-DESCRIPTION = "An image containing the build system that you can boot and run using either VMware Player or VMware Workstation."
+DESCRIPTION = "An image containing the build system that you can boot and run using either VirtualBox, VMware Player or VMware Workstation."
 HOMEPAGE = "http://www.yoctoproject.org/documentation/build-appliance"
 
 LICENSE = "MIT"
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted \
-                 kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcp-client"
+                 kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcp-client \
+                 tzdata python3-pip"
 
 IMAGE_FEATURES += "x11-base package-management splash"
 
@@ -22,11 +23,12 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image module-base
 
-SRCREV ?= "ee6ee913aae5ac55ccb9125e03d07d3a767e4157"
+SRCREV ?= "7c3a47ed8965c3a3eb90a9a4678d5caedbba6337"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \
+           file://README_VirtualBox_Toaster.txt \
           "
 BA_INCLUDE_SOURCES ??= "0"
 
@@ -54,6 +56,9 @@ fakeroot do_populate_poky_src () {
 	# Place the README_VirtualBox_Guest_Additions file in builders home folder.
 	cp ${WORKDIR}/README_VirtualBox_Guest_Additions.txt ${IMAGE_ROOTFS}/home/builder/
 
+	# Place the README_VirtualBox_Toaster file in builders home folder.
+	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
+
 	# Create a symlink, needed for out-of-tree kernel modules build
 	lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
 
@@ -88,6 +93,13 @@ fakeroot do_populate_poky_src () {
 	# Use Clearlooks GTK+ theme
 	mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
 	echo 'gtk-theme-name = "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
+
+	# Install modules needed for toaster
+	export HOME=${IMAGE_ROOTFS}/home/builder
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip
+	pip3 install --user -I -U -v -r ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt
+	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.local
+	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.cache
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
-- 
2.7.4


