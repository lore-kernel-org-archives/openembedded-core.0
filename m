Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 54763747E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 01:15:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 18:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,398,1517904000"; d="scan'208";a="30205996"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga007.jf.intel.com with ESMTP; 02 Apr 2018 18:15:18 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 18:15:17 -0700
Message-Id: <20180403011517.22772-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] initrdscripts: init-install(-efi).sh: don't assume 20M boot partition
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
X-List-Received-Date: Tue, 03 Apr 2018 01:15:18 -0000

With multi kernel support in the installer we can exceed this limit.
Calculate a sane size by checking the size of the original boot
partition minus some objects we know won't be installed, plus some extra
space for users.

In addition, in the common case where only one small kernel is present
to be installed, we actually get a smaller boot partition with less
wasted space.

[YOCTO #12583].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 15 +++++++++++++--
 meta/recipes-core/initrdscripts/files/init-install.sh     | 15 +++++++++++++--
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 43b75b01751..82b0aa819e3 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -8,8 +8,19 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
-# We need 20 Mb for the boot partition
-boot_size=20
+# figure out how big of a boot partition we need
+boot_size=$(du -ms /run/media/$1/ | awk '{print $1}')
+# remove rootfs.img ($2) from the size if it exists, as its not installed to /boot
+if [ -e /run/media/$1/$2 ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/$2 | awk '{print $1}') ))
+fi
+# remove initrd from size since its not currently installed
+if [ -e /run/media/$1/initrd ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/initrd | awk '{print $1}') ))
+fi
+# add 10M to provide some extra space for users and account
+# for rounding in the above subtractions
+boot_size=$(( boot_size + 10 ))
 
 # 5% for swap
 swap_ratio=5
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index aa9476660ba..28e8f09d19d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -7,8 +7,19 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
-# We need 20 Mb for the boot partition
-boot_size=20
+# figure out how big of a boot partition we need
+boot_size=$(du -ms /run/media/$1/ | awk '{print $1}')
+# remove rootfs.img ($2) from the size if it exists, as its not installed to /boot
+if [ -e /run/media/$1/$2 ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/$2 | awk '{print $1}') ))
+fi
+# remove initrd from size since its not currently installed
+if [ -e /run/media/$1/initrd ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/initrd | awk '{print $1}') ))
+fi
+# add 10M to provide some extra space for users and account
+# for rounding in the above subtractions
+boot_size=$(( boot_size + 10 ))
 
 # 5% for the swap
 swap_ratio=5
-- 
2.14.3


