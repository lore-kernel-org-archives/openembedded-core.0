Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1010.1629822390051305487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360392"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360392"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659094"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:09 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 26/28] sdk: fix relocate symlink failed
Date: Wed, 25 Aug 2021 00:25:28 +0800
Message-Id: <12a530069986898840e0b807d3107df0a60704a9.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: hongxu <hongxu.jia@windriver.com>

Install SDK to non-default dir, sysmlink mkfs.vfat is invalid

$ ./sdk.sh -y -d ./dnf-2 -S -D
$ ls sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat -al
lrwxrwxrwx 1 hjia users 99 Aug 10 20:38 sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat -> /opt/windriver/wrlinux-graphics/21.32/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat.dosfstools

Since commit [bc4ee54535 sdk: Decouple default install path from
built in path] applied, sdk relocates symlink failed, it should
replace $SDK_BUILD_PATH rather than $DEFAULT_INSTALL_DIR, just
like above commit did

Without this commit:
...
|+ for l in $($SUDO_EXEC find $native_sysroot -type l)
|++ readlink path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
|++ sed -e s:/usr/local/oecore-x86_64:path-to:
|+ ln -sfn /opt/windriver/wrlinux-graphics/21.32/sysroots/x86_64-wrlinuxsdk-linux/
usr/bin/mkfs.vfat.dosfstools path-to//sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
...

After appling this commit:
...
|+ for l in $($SUDO_EXEC find $native_sysroot -type l)
|++ readlink path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
|++ sed -e s:/opt/windriver/wrlinux-graphics/21.31:path-to:
|+ ln -sfn path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat.dosfstools
path-to/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/mkfs.vfat
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 942c06a7348070b92f722fa5c439c8c4404485b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 5433741296..ba873373e2 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -72,7 +72,7 @@ fi
 
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
 	if [ $? -ne 0 ]; then
 		echo "Failed to setup symlinks. Relocate script failed. Abort!"
 		exit 1
-- 
2.31.1

