Return-Path: <joe.konno@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A98FA71A33
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 23:46:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 03 Nov 2016 16:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,589,1473145200"; d="scan'208";a="1063668668"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain)
	([10.54.39.234])
	by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2016 16:46:25 -0700
From: Joe Konno <joe.konno@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 16:46:10 -0700
Message-Id: <1478216770-19184-1-git-send-email-joe.konno@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 1/1] initrdscripts: add support for NVME target install
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
X-List-Received-Date: Thu, 03 Nov 2016 23:46:25 -0000

From: Joe Konno <joe.konno@intel.com>

Add awareness of /dev/nvme* block devices to install scripts. As presently
written, installer knows only of /dev/sd* and /dev/mmcblk* block devices.
Building upon scaffolding put in place by Awais in...

    80ec9f627915 ("initrdscripts: handle mmc device as installer medium")

Signed-off-by: Joe Konno <joe.konno@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 ++++-
 meta/recipes-core/initrdscripts/files/init-install.sh     | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 441e25238d24..ffb709c1ce6a 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -22,6 +22,8 @@ live_dev_name=${live_dev_name#\/dev/}
 case $live_dev_name in
     mmcblk*)
     ;;
+    nvme*)
+    ;;
     *)
         live_dev_name=${live_dev_name%%[0-9]*}
     ;;
@@ -146,7 +148,8 @@ swap_start=$((rootfs_end))
 # 2) they are detected asynchronously (need rootwait)
 rootwait=""
 part_prefix=""
-if [ ! "${device#/dev/mmcblk}" = "${device}" ]; then
+if [ ! "${device#/dev/mmcblk}" = "${device}" ] || \
+   [ ! "${device#/dev/nvme}" = "${device}" ]; then
     part_prefix="p"
     rootwait="rootwait"
 fi
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 04ce5fb4b5d5..572613ecd4cd 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -21,6 +21,8 @@ live_dev_name=${live_dev_name#\/dev/}
 case $live_dev_name in
     mmcblk*)
     ;;
+    nvme*)
+    ;;
     *)
         live_dev_name=${live_dev_name%%[0-9]*}
     ;;
@@ -153,7 +155,8 @@ swap_start=$((rootfs_end))
 # 2) they are detected asynchronously (need rootwait)
 rootwait=""
 part_prefix=""
-if [ ! "${device#/dev/mmcblk}" = "${device}" ]; then
+if [ ! "${device#/dev/mmcblk}" = "${device}" ] || \
+   [ ! "${device#/dev/nvme}" = "${device}" ]; then
     part_prefix="p"
     rootwait="rootwait"
 fi
-- 
2.7.4


