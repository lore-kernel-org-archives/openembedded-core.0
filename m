Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB5F731FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:36:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jan 2016 09:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="893970740"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 09:36:22 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 58DCD2C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:24:18 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:38:59 +0200
Message-Id: <84e10325763a943ee2aaf91b5a72ee2e46e55c03.1453217537.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453217537.git.ed.bartosh@linux.intel.com>
References: <cover.1453217537.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453217537.git.ed.bartosh@linux.intel.com>
References: <cover.1453217537.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/8] wic: move parts of canned .wks into common.wks.inc
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
X-List-Received-Date: Tue, 19 Jan 2016 17:36:22 -0000

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


