Return-Path: <mei.yeen.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 461A86057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:26:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2015 18:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,345,1444719600"; 
   d="scan'208";a="2430481"
Received: from mng4-ilbpg4.png.intel.com ([10.88.227.35])
	by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2015 18:26:47 -0800
From: Mei Yeen Ng <mei.yeen.ng@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 10:25:28 +0800
Message-Id: <1448504729-25657-2-git-send-email-mei.yeen.ng@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
References: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
Cc: Mei Yeen Ng <mei.yeen.ng@intel.com>
Subject: [PATCH 1/2] meta: fix install-efi script for gummiboot loader
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
X-List-Received-Date: Thu, 26 Nov 2015 02:26:47 -0000

From: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>

After running gummiboot loader install option, the installed target
storage device boot parameter for root=PARTUUID is empty causing boot failure.
This issue is only observed with gummiboot and not with GRUB loader.

This fix assigs the rootuuid of the rootfs partition for gummiboot loader.

[YOCTO #8709]
Signed-off-by: Ng, Mei Yeen <mei.yeen.ng@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index fc4908e..3c79a0d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -223,6 +223,7 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
 fi
 
 if [ -d /run/media/$1/loader ]; then
+    rootuuid=$(blkid -o value -s PARTUUID ${rootfs})
     GUMMIBOOT_CFGS="/boot/loader/entries/*.conf"
     # copy config files for gummiboot
     cp -dr /run/media/$1/loader /boot
-- 
1.9.1


