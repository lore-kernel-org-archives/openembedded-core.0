Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C4F84787AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 23:02:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 15:02:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="8032785"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2017 15:02:11 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 15:02:09 -0800
Message-Id: <20171121230209.4097-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171121214703.11109-1-california.l.sullivan@intel.com>
References: <20171121214703.11109-1-california.l.sullivan@intel.com>
Cc: saul.wold@intel.com
Subject: [PATCH v2 2/2] install*.sh: add short sleep after parted commands
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
X-List-Received-Date: Tue, 21 Nov 2017 23:02:11 -0000

I wasn't able to install to my Optane SSD due to the following error:

Formatting /dev/nvme0n1p1 to vfat...
mkfs.fat 4.1 (2017-01-24)
mkfs.vfat: unable to open /dev/nvme0n1p1: No such file or directory
Target install-efi failed

A couple lines later I see:

[    10.265401]  nvme0n1: p1 p2 p3

Then looking at the device itself after booting from a USB stick:

root@intel-corei7-64: ~# ls /dev/nvme0n1*
/dev/nvme0n1 /dev/nvme0n1p1 /dev/nvme0n1p2 /dev/nvme0n1p3

So it looks like the parted commands return before the device node is
actually created.

Work around this issue by waiting for device nodes for a short duration.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
v2: sleep conditionally for up to three seconds instead of one second
unconditionally. This makes it so if the device nodes are available
immediately, people don't have to wait, but a system has up to three
seconds to create them before failing. 

 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 7 +++++++
 meta/recipes-core/initrdscripts/files/init-install.sh     | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 5ad3a60..706418f 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -186,6 +186,13 @@ parted ${device} mkpart swap linux-swap $swap_start 100%
 
 parted ${device} print
 
+echo "Waiting for device nodes..."
+C=0
+while [ $C -ne 3 ] && [ ! -e $bootfs  -o ! -e $rootfs -o ! -e $swap ]; do
+    C=$(( C + 1 ))
+    sleep 1
+done
+
 echo "Formatting $bootfs to vfat..."
 mkfs.vfat $bootfs
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 1cac806..dade059 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -211,6 +211,13 @@ parted ${device} mkpart $pname linux-swap $swap_start 100%
 
 parted ${device} print
 
+echo "Waiting for device nodes..."
+C=0
+while [ $C -ne 3 ] && [ ! -e $bootfs  -o ! -e $rootfs -o ! -e $swap ]; do
+    C=$(( C + 1 ))
+    sleep 1
+done
+
 echo "Formatting $bootfs to ext3..."
 mkfs.ext3 $bootfs
 
-- 
2.9.5


