Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D98B731EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2016 10:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="896709208"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2016 10:48:54 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 6B3332C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:49 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:09 +0200
Message-Id: <8e5d75691ea944315a43ad7f29305b980c30ba84.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 7/9] wic: move parts of canned .wks into common.wks.inc
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
X-List-Received-Date: Tue, 19 Jan 2016 18:48:53 -0000

In order to give and example of 'include' feature of ks parser
and for testing purposes common parts of 3 canned wks files were
moved into common.wks.inc

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc                   | 3 +++
 scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks | 4 +---
 scripts/lib/wic/canned-wks/directdisk.wks                   | 4 +---
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks           | 4 +---
 4 files changed, 6 insertions(+), 9 deletions(-)
 create mode 100644 scripts/lib/wic/canned-wks/common.wks.inc

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
new file mode 100644
index 0000000..5cf2fd1
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -0,0 +1,3 @@
+# This file is included into 3 canned wks files from this directory
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
index 4808d04..3529e05 100644
--- a/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
@@ -2,9 +2,7 @@
 # long-description: Creates a partitioned legacy BIOS disk image that the user
 # can directly dd to boot media. The bootloader configuration source is a user file.
 
-
-part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+include common.wks.inc
 
 bootloader --configfile="directdisk-bootloader-config.cfg"
 
diff --git a/scripts/lib/wic/canned-wks/directdisk.wks b/scripts/lib/wic/canned-wks/directdisk.wks
index af4c9ea..6db74a7 100644
--- a/scripts/lib/wic/canned-wks/directdisk.wks
+++ b/scripts/lib/wic/canned-wks/directdisk.wks
@@ -2,9 +2,7 @@
 # long-description: Creates a partitioned legacy BIOS disk image that the user
 # can directly dd to boot media.
 
-
-part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+include common.wks.inc
 
 bootloader  --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0"
 
diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index 8fc38b5..a6518a0 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -2,9 +2,7 @@
 # long-description: Creates a partitioned legacy BIOS disk image that the user
 # can directly use to boot a qemu machine.
 
-
-part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
+include common.wks.inc
 
 bootloader  --timeout=0  --append="vga=0 uvesafb.mode_option=640x480-32 root=/dev/vda2 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
 
-- 
2.1.4


