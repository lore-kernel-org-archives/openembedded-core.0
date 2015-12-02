Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9766FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 02:41:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 18:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,371,1444719600"; d="scan'208";a="611016836"
Received: from psverdru-mobl1.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.252.197.212])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2015 18:41:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com
Date: Tue,  1 Dec 2015 18:41:49 -0800
Message-Id: <1449024109-3476-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449024109-3476-1-git-send-email-sgw@linux.intel.com>
References: <1449024109-3476-1-git-send-email-sgw@linux.intel.com>
Cc: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>
Subject: [PATCH 3/3] init-install-efi: fix script for gummiboot loader
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
X-List-Received-Date: Wed, 02 Dec 2015 02:41:52 -0000

From: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>

After running gummiboot loader install option, the installed target
storage device boot parameter for root=PARTUUID is empty causing boot failure.
This issue is only observed with gummiboot and not with GRUB loader.

This fix assign the rootuuid of the rootfs partition for gummiboot loader.

[YOCTO #8709]
(From OE-Core rev: fd5fa06fe45ca1fdf20df4198ae323967244af5b)

Signed-off-by: Ng, Mei Yeen <mei.yeen.ng@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index ac26bce..0443a9d 100644
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
2.5.0


