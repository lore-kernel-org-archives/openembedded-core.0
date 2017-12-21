Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B06A3785AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:56:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 16:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; 
   d="scan'208";a="4472582"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 20 Dec 2017 16:56:43 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:56:37 -0800
Message-Id: <20171221005637.34163-7-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171221005637.34163-1-california.l.sullivan@intel.com>
References: <20171221005637.34163-1-california.l.sullivan@intel.com>
Cc: akuster@mvista.com
Subject: [rocko][PATCH 6/6] install*.sh: add short sleep after parted commands
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
X-List-Received-Date: Thu, 21 Dec 2017 00:56:41 -0000

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
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 9daafd49b448122e35d67a1637ce2212793a4dc5)
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 7 +++++++
 meta/recipes-core/initrdscripts/files/init-install.sh     | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 5ad3a60c05..706418fa9c 100644
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
index 1cac8064a2..dade059c8f 100644
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
2.14.3


