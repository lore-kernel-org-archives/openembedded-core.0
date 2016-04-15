Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA5960249
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 01:04:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2016 18:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,485,1455004800"; d="scan'208";a="932816540"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2016 18:04:14 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 17:49:30 -0700
Message-Id: <1460681370-4371-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH] build-appliance-image: Load TUN at startup
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
X-List-Received-Date: Fri, 15 Apr 2016 01:04:15 -0000

This patch addresses the issue of not being able to execute "runqemu"
in the Build Appliance.
The root cause of the problem was that TAP/TUN was not available,
although required by "runqemu". In addition, the recommended remedy

  $ sudo modprobe tun

would fail for two reasons: modprobe not in PATH (user builder),
and "iptables" located in /usr/sbin but expected in /sbin.

[YOCTO #9437]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_14.0.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index eeb301d..07bd145 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image module-base
 
-SRCREV ?= "00c4c9bf0007b964dfa4559fe8fc8687f14cdec3"
+SRCREV ?= "5c8124df2efed4b8691239cd357cf69211b0c844"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
@@ -80,9 +80,13 @@ fakeroot do_populate_poky_src () {
 	# Assume we will need CDROM to install guest additions
 	mkdir -p ${IMAGE_ROOTFS}/media/cdrom
 
-	# Allow builder to use sudo to setup tap/tun
+	# Allow builder to use sudo
 	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
 
+	# Load tap/tun at startup
+	ln -sr ${IMAGE_ROOTFS}/usr/sbin/iptables ${IMAGE_ROOTFS}/sbin/iptables
+	echo "tun" >> ${IMAGE_ROOTFS}/etc/modules
+
 	# Use Clearlooks GTK+ theme
 	mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
 	echo 'gtk-theme-name = "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
-- 
1.9.1


