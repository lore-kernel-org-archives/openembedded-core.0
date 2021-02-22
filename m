Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dIfNTCc2DsYjq8z+X7NPXrYkPtnQA9hWsDcjVnxrHPUeb9Qxbk7ruDzGaB9q2P1lnZxfJVknHL
 7emtW52fTxJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049255"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:40 -0800
IronPort-SDR: gzHmeBAMfy5sLML/m9KbVlQLashrzRaF9IENiJRjIQZhsVDSEpDpF9SrrGE3BhUF6F/Gpg5sk5
 EG6mPuiJd3Eg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301791"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/30] initrdscripts: init-install-efi.sh install extra files for ESP
Date: Tue, 23 Feb 2021 00:00:04 +0800
Message-Id: <47cf6739ab182e66d1b73cd99bab961d06f41336.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

Currently the install script copy only few hard coded item while
setting up target ESP, kernel artifacts, all .efi in EFI/BOOT,
grub & boot cfg and loader.conf.
While ESP can be much complex, eg: contain multiple initrd.

Add a ESP folder to carry any other files to setup onto ESP.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6eaca9cf20c42501fba27dea3a6446bad948e859)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.29.2

