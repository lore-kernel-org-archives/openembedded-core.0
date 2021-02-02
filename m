Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.48217.1612244598715337305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: Zw/2MuR3ODjUDZgTRhHSPBfje+lfhsYtrQoYa8QZPMz0ffVfmgs0ZpzkJgCFEyX7fFGsfpBAbV
 fUUvQWXKqhQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="244883538"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="244883538"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:43:18 -0800
IronPort-SDR: JOPlNPJ+KGxKRf83a/S2n+o+kpcN+Gczr9cAGjMpBjP+Mm2qW7H93TdLzCUgBHMzmFRdE0xfMm
 tBuM5PA7NYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="406026498"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2021 21:43:17 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] initrdscripts: init-install-efi.sh install extra files for ESP
Date: Tue,  2 Feb 2021 13:43:16 +0800
Message-Id: <20210202054316.76859-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Chee Yang Lee <chee.yang.lee@intel.com>

Currently the install script copy only few hard coded item while
setting up target ESP, kernel artifacts, all .efi in EFI/BOOT,
grub & boot cfg and loader.conf.
While ESP can be much complex, eg: contain multiple initrd.

Add a ESP folder to carry any other files to setup onto ESP.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index b6855b5aac..f667518b89 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -279,6 +279,11 @@ fi
 
 umount /tgt_root
 
+# copy any extra files needed for ESP
+if [ -d /run/media/$1/esp ]; then
+    cp -r /run/media/$1/esp/* /boot
+fi
+
 # Copy kernel artifacts. To add more artifacts just add to types
 # For now just support kernel types already being used by something in OE-core
 for types in bzImage zImage vmlinux vmlinuz fitImage; do
-- 
2.17.1

