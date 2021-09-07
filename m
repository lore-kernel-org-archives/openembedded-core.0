Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.32631.1630995959190536297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 23:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1876PumJ003538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Sep 2021 23:25:56 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 6 Sep 2021 23:25:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 23:25:55 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 6 Sep 2021 23:25:54 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] Revert "sdk: fix relocate symlink failed"
Date: Tue, 7 Sep 2021 14:25:54 +0800
Message-ID: <20210907062554.852167-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The commit [7e71acd265 sdk: fix relocate symlink failed] is used to fix
regression issue caused by commit [bc4ee54535 sdk: Decouple default install
path from built in path], but hardknott does not contain commit bc4ee54535,
so commit 7e71acd265 should not be in hardknott neither, otherwise it caused
other regression issue.

This reverts commit 7e71acd265637d54d5bf149ea36cefa581f60992.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index ba873373e2..5433741296 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -72,7 +72,7 @@ fi
 
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
 	if [ $? -ne 0 ]; then
 		echo "Failed to setup symlinks. Relocate script failed. Abort!"
 		exit 1
-- 
2.27.0

