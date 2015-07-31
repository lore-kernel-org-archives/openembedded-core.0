Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E9F20763A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 17:20:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2015 10:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,585,1432623600"; d="scan'208";a="774181030"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2015 10:20:32 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 09:14:59 +0000
Message-Id: <1438334099-30137-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] init-install-efi.sh: Check if an installation device is present
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
X-List-Received-Date: Fri, 31 Jul 2015 17:20:34 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

In case there is no installation device present, give a better
message to the user and abort installation.

[YOCTO #7971]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f339b30..a3ed74b 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -55,6 +55,11 @@ for device in `ls /sys/block/`; do
     esac
 done
 
+if [ -z "${hdnamelist}" ]; then
+    echo "You need another device (besides the live device /dev/${live_dev_name}) to install the image. Installation aborted."
+    exit 1
+fi
+
 TARGET_DEVICE_NAME=""
 for hdname in $hdnamelist; do
     # Display found hard drives and their basic info
-- 
1.8.4.5


