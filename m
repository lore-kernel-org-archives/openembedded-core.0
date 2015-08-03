Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0D1776398
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:52:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2015 06:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="535104907"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2015 06:52:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 6EC496A4005;
	Mon,  3 Aug 2015 06:51:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:47 +0300
Message-Id: <c4fb08a3f912cb19ac82367bf160c5a532388e2e.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
References: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1438609723.git.ed.bartosh@linux.intel.com>
References: <cover.1438609723.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/6] wic: Improve 'wic help overview' content
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
X-List-Received-Date: Mon, 03 Aug 2015 13:52:07 -0000

Included full console output and example of the .wks file
into the 'wic help overview' content.

Used qemux86-64 machine instead of crownbay to make example
working without cloning additional layers.

[YOCTO #7940]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index a14ef20..5fa5836 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -616,18 +616,33 @@ DESCRIPTION
     and also uses the -o option to have wic create the output
     somewhere other than the default /var/tmp/wic:
 
-      $ wic create ~/test.wks -o /home/trz/testwic --rootfs-dir
-      /home/trz/yocto/build/tmp/work/crownbay/core-image-minimal/1.0-r0/rootfs
-      --bootimg-dir /home/trz/yocto/build/tmp/sysroots/crownbay/usr/share
-      --kernel-dir /home/trz/yocto/build/tmp/sysroots/crownbay/usr/src/kernel
-      --native-sysroot /home/trz/yocto/build/tmp/sysroots/x86_64-linux
+      $ wic create ./test.wks -o ./out --rootfs-dir
+      tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
+      --bootimg-dir tmp/sysroots/qemux86-64/usr/share
+      --kernel-dir tmp/deploy/images/qemux86-64
+      --native-sysroot tmp/sysroots/x86_64-linux
 
-      Creating image(s)...
+     Creating image(s)...
 
-      Info: The new image(s) can be found here:
-        /home/trz/testwic/build/test-201309260032-sda.direct
+     Info: The new image(s) can be found here:
+           out/build/test-201507211313-sda.direct
+
+     The following build artifacts were used to create the image(s):
+       ROOTFS_DIR:                   tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
+       BOOTIMG_DIR:                  tmp/sysroots/qemux86-64/usr/share
+       KERNEL_DIR:                   tmp/deploy/images/qemux86-64
+       NATIVE_SYSROOT:               tmp/sysroots/x86_64-linux
+
+     The image(s) were created using OE kickstart file:
+     ./test.wks
+
+     Here is a content of test.wks:
+
+     part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+     part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+
+     bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
 
-      ...
 
     Finally, here's an example of the actual partition language
     commands used to generate the mkefidisk image i.e. these are the
-- 
2.1.4


