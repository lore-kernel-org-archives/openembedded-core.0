Return-Path: <joe.konno@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF6EB71B4F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 23:17:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 03 Nov 2016 16:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,440,1473145200"; d="scan'208";a="1063659697"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain)
	([10.54.39.234])
	by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2016 16:17:23 -0700
From: Joe Konno <joe.konno@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 16:17:08 -0700
Message-Id: <1478215028-18930-1-git-send-email-joe.konno@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v1 1/1] initrdscripts: add support for NVME target install
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
X-List-Received-Date: Thu, 03 Nov 2016 23:17:22 -0000

From: Joe Konno <joe.konno@intel.com>

Add awareness of /dev/nvme* block devices to install scripts. As presently
written, installer knows only of /dev/sd* and /dev/mmcblk* block devices.
Building upon scaffolding put in place by Awais in...

    80ec9f627915 ("initrdscripts: handle mmc device as installer medium")

Signed-off-by: Joe Konno <joe.konno@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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


