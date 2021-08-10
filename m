Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.368.1628602443500206143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17ADXxwZ029054
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 10 Aug 2021 06:33:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17ADXwwP019971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Aug 2021 06:33:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 06:33:58 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 06:33:57 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] sdk: fix relocate symlink failed
Date: Tue, 10 Aug 2021 21:33:56 +0800
Message-ID: <20210810133356.3528891-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 8ea6194eca..3ece04db0a 100644
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
2.27.0

