Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 986CD65D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 05:12:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 29 Aug 2016 22:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,254,1470726000"; 
   d="scan'208";a="2528025"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2016 22:12:35 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 05:08:37 +0000
Message-Id: <ea76a3361e24219bf4cba58a3c910a6d6de06e7d.1472533516.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1472533516.git.alejandro.hernandez@linux.intel.com>
References: <cover.1472533516.git.alejandro.hernandez@linux.intel.com>
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] init-install: Fixes the install script failing when not finding any mmcblk devices
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
X-List-Received-Date: Tue, 30 Aug 2016 05:12:36 -0000

The init-install.sh and init-install-efi.sh scripts perform a check
to see which devices are available on a booted system for installation.

Recently, the way we check for these devices changed on 993bfb,
greping for devices found on /sys/block/, this change caused the installer
to fail (at least) when not finding any mmcblk devices, due to the fact
that we call sh -e to execute this script, so any command (grep)
or pipeline exiting with a non-zero status causes the whole script to exit

This patch throws in a harmless true exit status at the end of the pipeline(s)
of the grep commands to avoid the installer script from exiting, fixing the issue.

[YOCTO #10189]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 4 ++--
 meta/recipes-core/initrdscripts/files/init-install.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 2d20a6d..441e252 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -31,8 +31,8 @@ echo "Searching for hard drives ..."
 
 # Some eMMC devices have special sub devices such as mmcblk0boot0 etc
 # we're currently only interested in the root device so pick them wisely
-devices=`ls /sys/block/ | grep -v mmcblk`
-mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`
+devices=`ls /sys/block/ | grep -v mmcblk` || true
+mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"` || true
 devices="$devices $mmc_devices"
 
 for device in $devices; do
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 89d5a5d..04ce5fb 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -30,8 +30,8 @@ echo "Searching for hard drives ..."
 
 # Some eMMC devices have special sub devices such as mmcblk0boot0 etc
 # we're currently only interested in the root device so pick them wisely
-devices=`ls /sys/block/ | grep -v mmcblk`
-mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`
+devices=`ls /sys/block/ | grep -v mmcblk` || true
+mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"` || true
 devices="$devices $mmc_devices"
 
 for device in $devices; do
-- 
2.6.6


